Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC5A19A69F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 09:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732035AbgDAHwg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 03:52:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:33492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731965AbgDAHwg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Apr 2020 03:52:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D9B820714;
        Wed,  1 Apr 2020 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585727555;
        bh=xTZ1OJ20xMgG+0vVGSltVt3WFRlDkw4aL+hVvsTKQ+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qjvEo/RjEuoL33ywUci1YxjcVGDPHNgj2NkUayyMMPTjyRKmSYnexO5Mtf8XxcTxN
         ysD4ErV/VPwrQGT3cssvMTWA3zkmZLJcmzlNMm9DjS7Dg4DOJvSjt1efEi1T9/qqph
         fWMkja3ZOeg523YRnU6wikjHTAFm+eBjLmStcK30=
Date:   Wed, 1 Apr 2020 09:52:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jann Horn <jannh@google.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] USB: early: Handle AMD's spec-compliant identifiers, too
Message-ID: <20200401075233.GB2020503@kroah.com>
References: <20200401074619.8024-1-jannh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401074619.8024-1-jannh@google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 01, 2020 at 09:46:19AM +0200, Jann Horn wrote:
> This fixes a bug that causes the USB3 early console to freeze after
> printing a single line on AMD machines because it can't parse the
> Transfer TRB properly.
> 
> The spec at
> https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf
> says in section "4.5.1 Device Context Index" that the Context Index,
> also known as Endpoint ID according to
> section "1.6 Terms and Abbreviations", is normally computed as
> `DCI = (Endpoint Number * 2) + Direction`, which matches the current
> definitions of XDBC_EPID_OUT and XDBC_EPID_IN.
> 
> However, the numbering in a Debug Capability Context data structure is
> supposed to be different:
> Section "7.6.3.2 Endpoint Contexts and Transfer Rings" explains that a
> Debug Capability Context data structure has the endpoints mapped to indices
> 0 and 1.
> 
> Change XDBC_EPID_OUT/XDBC_EPID_IN to the spec-compliant values, add
> XDBC_EPID_OUT_INTEL/XDBC_EPID_IN_INTEL with Intel's incorrect values, and
> let xdbc_handle_tx_event() handle both.
> 
> I have verified that with this patch applied, the USB3 early console works
> on both an Intel and an AMD machine.
> 
> Fixes: aeb9dd1de98c ("usb/early: Add driver for xhci debug capability")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  drivers/usb/early/xhci-dbc.c |  8 ++++----
>  drivers/usb/early/xhci-dbc.h | 18 ++++++++++++++++--
>  2 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
> index cac991173ac0..5a462a1d1896 100644
> --- a/drivers/usb/early/xhci-dbc.c
> +++ b/drivers/usb/early/xhci-dbc.c
> @@ -728,19 +728,19 @@ static void xdbc_handle_tx_event(struct xdbc_trb *evt_trb)
>  	case COMP_USB_TRANSACTION_ERROR:
>  	case COMP_STALL_ERROR:
>  	default:
> -		if (ep_id == XDBC_EPID_OUT)
> +		if (ep_id == XDBC_EPID_OUT || ep_id == XDBC_EPID_OUT_INTEL)
>  			xdbc.flags |= XDBC_FLAGS_OUT_STALL;
> -		if (ep_id == XDBC_EPID_IN)
> +		if (ep_id == XDBC_EPID_IN || ep_id == XDBC_EPID_IN_INTEL)
>  			xdbc.flags |= XDBC_FLAGS_IN_STALL;
>  
>  		xdbc_trace("endpoint %d stalled\n", ep_id);
>  		break;
>  	}
>  
> -	if (ep_id == XDBC_EPID_IN) {
> +	if (ep_id == XDBC_EPID_IN || ep_id == XDBC_EPID_IN_INTEL) {
>  		xdbc.flags &= ~XDBC_FLAGS_IN_PROCESS;
>  		xdbc_bulk_transfer(NULL, XDBC_MAX_PACKET, true);
> -	} else if (ep_id == XDBC_EPID_OUT) {
> +	} else if (ep_id == XDBC_EPID_OUT || ep_id == XDBC_EPID_OUT_INTEL) {
>  		xdbc.flags &= ~XDBC_FLAGS_OUT_PROCESS;
>  	} else {
>  		xdbc_trace("invalid endpoint id %d\n", ep_id);
> diff --git a/drivers/usb/early/xhci-dbc.h b/drivers/usb/early/xhci-dbc.h
> index 673686eeddd7..6e2b7266a695 100644
> --- a/drivers/usb/early/xhci-dbc.h
> +++ b/drivers/usb/early/xhci-dbc.h
> @@ -120,8 +120,22 @@ struct xdbc_ring {
>  	u32			cycle_state;
>  };
>  
> -#define XDBC_EPID_OUT		2
> -#define XDBC_EPID_IN		3
> +/*
> + * These are the "Endpoint ID" (also known as "Context Index") values for the
> + * OUT Transfer Ring and the IN Transfer Ring of a Debug Capability Context data
> + * structure.
> + * According to the "eXtensible Host Controller Interface for Universal Serial
> + * Bus (xHCI)" specification, section "7.6.3.2 Endpoint Contexts and Transfer
> + * Rings", these should be 0 and 1, and those are the values AMD machines give
> + * you; but Intel machines seem to use the formula from section "4.5.1 Device
> + * Context Index", which is supposed to be used for the Device Context only.
> + * Luckily the values from Intel don't overlap with those from AMD, so we can
> + * just test for both.
> + */
> +#define XDBC_EPID_OUT		0
> +#define XDBC_EPID_IN		1
> +#define XDBC_EPID_OUT_INTEL	2
> +#define XDBC_EPID_IN_INTEL	3
>  
>  struct xdbc_state {
>  	u16			vendor;
> -- 
> 2.26.0.rc2.310.g2932bb562d-goog
> 

Thanks for this, I'll queue it up after 5.7-rc1 is out.

greg k-h
