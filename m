Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D716A225DD6
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 13:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbgGTLxO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 07:53:14 -0400
Received: from mga02.intel.com ([134.134.136.20]:33404 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728058AbgGTLxO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jul 2020 07:53:14 -0400
IronPort-SDR: GclABd87jBiGYSI5rM6KkXWWPXQ0p1ZElt+eCL/Cticr0XEUdkNHdwB46j7MbsJyJ2qzldpVgz
 2kzH7d6xV4ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="137989797"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
   d="scan'208";a="137989797"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2020 04:53:13 -0700
IronPort-SDR: saKuKu59V8laCsj0G4bf+uYXRr4y9wtX/0QSmiMze7g9Jsm117vKVKBTp5n+eYM5nIUvijDu8S
 MCTMHdeC1hQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
   d="scan'208";a="431586408"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga004.jf.intel.com with ESMTP; 20 Jul 2020 04:53:12 -0700
Subject: Re: [PATCH] usb: host: xhci: fix ep context print mismatch in debugfs
To:     Li Jun <jun.li@nxp.com>
Cc:     gregkh@linuxfoundation.org, baolu.lu@linux.intel.com,
        linux-usb@vger.kernel.org
References: <1594393785-15182-1-git-send-email-jun.li@nxp.com>
From:   Mathias Nyman <mathias.nyman@intel.com>
Message-ID: <4f18276d-bd98-03fd-8783-92a22d529b14@intel.com>
Date:   Mon, 20 Jul 2020 14:56:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1594393785-15182-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10.7.2020 18.09, Li Jun wrote:
> dci is 0 based and xhci_get_ep_ctx() will do ep index increment to get
> the ep context.
> 
> Fixes: 02b6fdc2a153 ("usb: xhci: Add debugfs interface for xHCI driver")
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/host/xhci-debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
> index 76c3f29..65d8de4 100644
> --- a/drivers/usb/host/xhci-debugfs.c
> +++ b/drivers/usb/host/xhci-debugfs.c
> @@ -282,9 +282,9 @@ static int xhci_endpoint_context_show(struct seq_file *s, void *unused)
>  
>  	xhci = hcd_to_xhci(bus_to_hcd(dev->udev->bus));
>  
> -	for (dci = 1; dci < 32; dci++) {
> +	for (dci = 0; dci < 31; dci++) {
>  		ep_ctx = xhci_get_ep_ctx(xhci, dev->out_ctx, dci);
> -		dma = dev->out_ctx->dma + dci * CTX_SIZE(xhci->hcc_params);
> +		dma = dev->out_ctx->dma + (dci + 1) * CTX_SIZE(xhci->hcc_params);
>  		seq_printf(s, "%pad: %s\n", &dma,
>  			   xhci_decode_ep_context(le32_to_cpu(ep_ctx->ep_info),
>  						  le32_to_cpu(ep_ctx->ep_info2),
> 

Thanks, adding to queue.
I'll probably change "dci" to "ep_index" while applying this as it doesn't 
represent the Device Context Index (DCI) in the xhci specs

-Mathias
