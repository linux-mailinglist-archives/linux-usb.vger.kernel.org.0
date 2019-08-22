Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1134E991A2
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 13:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388007AbfHVLGh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 07:06:37 -0400
Received: from mga18.intel.com ([134.134.136.126]:31568 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730733AbfHVLGg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 07:06:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 04:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; 
   d="scan'208";a="203373413"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 04:06:34 -0700
Subject: Re: [PATCH 1/1] usb: xhci: avoid VBus glitch during controller reset
 operation
To:     Peter Chen <peter.chen@nxp.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <20190821031602.1030-1-peter.chen@nxp.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <ce4fc3ec-2290-2902-1cf9-95add5b428b9@linux.intel.com>
Date:   Thu, 22 Aug 2019 14:08:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821031602.1030-1-peter.chen@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.8.2019 6.18, Peter Chen wrote:
> According to xHCI 1.1 CH4.19.4 Port Power:
> 	While Chip Hardware Reset or HCRST is asserted,
>         	the value of PP is undefined. If the xHC supports
>         	power switches (PPC = ‘1’) then VBus may be deasserted
>         	during this time. PP (and VBus) shall be enabled immediately
>         	upon exiting the reset condition.
> 
> The VBus glitch may cause some USB devices work abnormal, we observe
> it at NXP LS1012AFWRY/LS1043ARDB/LX2160AQDS/LS1088ARDB platforms. To
> avoid this Vbus glitch, we could set PP as 0 before HCRST, and the PP
> will back to 1 after HCRST according to spec.

Is this glitch causing issues already at the first xHC reset when we are
loading the xhci driver,  or only later resets, like xHC reset at resume?

> 
> Reported-by: Ran Wang <ran.wang_1@nxp.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>   drivers/usb/host/xhci.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 6b34a573c3d9..f5a7b5d63031 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -167,7 +167,8 @@ int xhci_reset(struct xhci_hcd *xhci)
>   {
>   	u32 command;
>   	u32 state;
> -	int ret;
> +	int ret, i;
> +	u32 portsc;
>   
>   	state = readl(&xhci->op_regs->status);
>   
> @@ -181,6 +182,18 @@ int xhci_reset(struct xhci_hcd *xhci)
>   		return 0;
>   	}
>   
> +	/*
> +	 * Keep PORTSC.PP as 0 before HCRST to eliminate
> +	 * Vbus glitch, see CH 4.19.4.
> +	 */
> +	for (i = 0; i < HCS_MAX_PORTS(xhci->hcs_params1); i++) {
> +		__le32 __iomem *port_addr = &xhci->op_regs->port_status_base +
> +				NUM_PORT_REGS * i;
> +		portsc = readl(port_addr);
> +		portsc &= ~PORT_POWER;
> +		writel(portsc, port_addr);

Not all bits read from PORTSC should be written back, you might need
portsc = xhci_port_state_to_neutral(portsc) here.

Normally I'd recommend using the xhci_set_port_power() helper instead, but
if this is is needed at driver load time then port arrays may not be set up yet.
xhci_set_port_power() would take care of possible ACPI method calls, and add some debugging.

Not sure if this will impact some other platforms, maybe it would be better to move this to
a separate function, and call it before xhci_reset() if a quirk is set.

-Mathias

