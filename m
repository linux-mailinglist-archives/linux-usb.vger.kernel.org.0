Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08CAE44D69A
	for <lists+linux-usb@lfdr.de>; Thu, 11 Nov 2021 13:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbhKKM0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Nov 2021 07:26:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:50788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233423AbhKKM0F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Nov 2021 07:26:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A50060F4A;
        Thu, 11 Nov 2021 12:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1636633396;
        bh=U4VMnpsdwJPIBpgMmCf2k4i+0zGijPlVDPBPzxemjo4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fv/TbvqtmhB6X/fNYdm+1knDKlWdNQS7x5OCdviyk+7NJJvyGk8mMEF9KkZwuDAC+
         PQ/Rlm5ogR/mVwVJ2/BS/KCdRnAEz1i9oYGiOtTws9epYUUss7VOX+nn7El860hi7i
         5gLAszxxAVn+7+sLeBYWZO1LPsNchT5Rw2wsIxsw=
Date:   Thu, 11 Nov 2021 13:23:14 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Haimin Zhang <tcs.kernel@gmail.com>
Cc:     linux-usb@vger.kernel.org, TCS Robot <tcs_robot@tencent.com>
Subject: Re: [PATCH v2] USB: ehci_brcm_hub_control: filter out invalid port
 index
Message-ID: <YY0LMriXgyG+S6gC@kroah.com>
References: <20211111121037.34713-1-tcs.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111121037.34713-1-tcs.kernel@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 11, 2021 at 08:10:37PM +0800, Haimin Zhang wrote:
> Due to (wIndex & 0xff) - 1 can get an integer greater than 0xf, this
> can cause array index to be out of bounds since the size of array
> port_status is 0xf. Remove cases greater than 0xf, because such cases
> are meaningless. It is reasonable to return -EPIPE, the caller
> rh_call_control will check the return value and handle it properly.
> The callee ehci_hub_control also doesn't need to deal with situations
> greater than 0xf. The size of the array port_status determines that
> such situations should not be handled.
> 
> Reported-by: TCS Robot <tcs_robot@tencent.com>
> Signed-off-by: Haimin Zhang <tcs.kernel@gmail.com>
> ---
>  drivers/usb/host/ehci-brcm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
> index d3626bfa966b..07e6df336a08 100644
> --- a/drivers/usb/host/ehci-brcm.c
> +++ b/drivers/usb/host/ehci-brcm.c
> @@ -63,6 +63,9 @@ static int ehci_brcm_hub_control(
>  	unsigned long flags;
>  	int retval, irq_disabled = 0;
>  
> +	if (!wIndex || wIndex > ports)
> +		return -EPIPE;
> +
>  	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
>  
>  	/*
> @@ -70,7 +73,6 @@ static int ehci_brcm_hub_control(
>  	 * of RESUME
>  	 */
>  	if ((typeReq == GetPortStatus) &&
> -	    (wIndex && wIndex <= ports) &&
>  	    ehci->reset_done[wIndex-1] &&
>  	    time_after_eq(jiffies, ehci->reset_done[wIndex-1]) &&
>  	    (ehci_readl(ehci, status_reg) & PORT_RESUME)) {
> -- 
> 2.30.1 (Apple Git-130)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
