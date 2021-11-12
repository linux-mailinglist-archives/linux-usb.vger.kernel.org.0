Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E155C44E44F
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 11:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234732AbhKLKEt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 05:04:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:49442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234656AbhKLKEs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Nov 2021 05:04:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACC8C60F70;
        Fri, 12 Nov 2021 10:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1636711318;
        bh=y0HK1wn5nquKcDCnnT7e9ObVoNslV12+JA91r0PqEwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=191gcMx6DiqZbSXDb1xXV4IbUJBW3wYhh7Y3lYxifToCQNEPWuVc3Ege0C0JhvqYY
         I4CyN/oWZqRQvz6k3efT7818avA9mGpZGW/jANCGp/dEv18WhS/M2K9HbvH7zutz/w
         YzJQeLWXAtfV+d4Ck+bAXQL/MgIvjGBWdyHlU+rM=
Date:   Fri, 12 Nov 2021 11:01:55 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Haimin Zhang <tcs.kernel@gmail.com>
Cc:     linux-usb@vger.kernel.org, TCS Robot <tcs_robot@tencent.com>
Subject: Re: [PATCH v3] USB: ehci_brcm_hub_control: improve port index
 sanitizing
Message-ID: <YY47k7tz3u9aq/uZ@kroah.com>
References: <20211112094921.90496-1-tcs.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112094921.90496-1-tcs.kernel@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 12, 2021 at 05:49:21PM +0800, Haimin Zhang wrote:
> Due to (wIndex & 0xff) - 1 can get an integer greater than 0xf, this
> can cause array index to be out of bounds since the size of array
> port_status is 0xf. Using macro function HCS_N_PORTS() can return
> a valid index less than 15. Macro function HCS_N_PORTS() is used
> to obtain a valid port index by logical AND 0xf.
> 
> Reported-by: TCS Robot <tcs_robot@tencent.com>
> Signed-off-by: Haimin Zhang <tcs.kernel@gmail.com>
> ---
>  drivers/usb/host/ehci-brcm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
> index d3626bfa966b..d2bf7768349c 100644
> --- a/drivers/usb/host/ehci-brcm.c
> +++ b/drivers/usb/host/ehci-brcm.c
> @@ -62,8 +62,11 @@ static int ehci_brcm_hub_control(
>  	u32 __iomem	*status_reg;
>  	unsigned long flags;
>  	int retval, irq_disabled = 0;
> +	u32 temp;
>  
> -	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
> +	temp = (wIndex & 0xff) - 1;
> +	temp = HCS_N_PORTS(temp);
> +	status_reg = &ehci->regs->port_status[temp];
>  
>  	/*
>  	 * RESUME is cleared when GetPortStatus() is called 20ms after start
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
