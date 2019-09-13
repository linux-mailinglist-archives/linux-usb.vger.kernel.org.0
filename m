Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43118B1DE7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2019 14:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730061AbfIMM4V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Sep 2019 08:56:21 -0400
Received: from mga06.intel.com ([134.134.136.31]:15214 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbfIMM4V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Sep 2019 08:56:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 05:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,501,1559545200"; 
   d="scan'208";a="185091273"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 13 Sep 2019 05:56:19 -0700
Subject: Re: [PATCH] xhci: Check all endpoints for LPM timeout
To:     Jan Schmidt <jan@centricular.com>, linux-usb@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>
References: <20190912144921.368-1-jan@centricular.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <896688f6-8486-3826-ee74-a225936f824d@linux.intel.com>
Date:   Fri, 13 Sep 2019 15:58:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912144921.368-1-jan@centricular.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12.9.2019 17.49, Jan Schmidt wrote:
> If an endpoint is encountered that returns USB3_LPM_DEVICE_INITIATED, keep
> checking further endpoints, as there might be periodic endpoints later
> that return USB3_LPM_DISABLED due to shorter service intervals.
> 
> Without this, the code can set too high a maximum-exit-latency and
> prevent the use of multiple USB3 cameras that should be able to work.
> 
> Signed-off-by: Jan Schmidt <jan@centricular.com>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/usb/host/xhci.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 03d1e552769b..1986b88661fc 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -4673,12 +4673,12 @@ static int xhci_update_timeout_for_endpoint(struct xhci_hcd *xhci,
>   	alt_timeout = xhci_call_host_update_timeout_for_endpoint(xhci, udev,
>   		desc, state, timeout);
>   
> -	/* If we found we can't enable hub-initiated LPM, or
> +	/* If we found we can't enable hub-initiated LPM, and
>   	 * the U1 or U2 exit latency was too high to allow
> -	 * device-initiated LPM as well, just stop searching.
> +	 * device-initiated LPM as well, then we will disable LPM
> +	 * for this device, so stop searching any further.
>   	 */
> -	if (alt_timeout == USB3_LPM_DISABLED ||
> -			alt_timeout == USB3_LPM_DEVICE_INITIATED) {
> +	if (alt_timeout == USB3_LPM_DISABLED) {
>   		*timeout = alt_timeout;
>   		return -E2BIG;
>   	}
> 

Thanks, nice catch. Adding to queue.

While looking at this I see we have a similar issue if driver has
"disable_hub_initiated_lpm" flag set.

xhci_get_timeout_no_hub_lpm() might return USB3_LPM_DEVICE_INITIATED
before we check if periodic endpoints would require disabling LPM
completely.

xhci_calculate_lpm_timeout()
...
     for (i = 0; i < config->desc.bNumInterfaces; i++) {
         ...
         if (intf->dev.driver) {
             ...
             if (driver && driver->disable_hub_initiated_lpm) {
                 return xhci_get_timeout_no_hub_lpm(udev, state);

I'll write a patch for that

-Mathias
