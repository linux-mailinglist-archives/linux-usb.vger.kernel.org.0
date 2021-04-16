Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB3936191D
	for <lists+linux-usb@lfdr.de>; Fri, 16 Apr 2021 07:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhDPFPv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Apr 2021 01:15:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:36342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231997AbhDPFPu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 16 Apr 2021 01:15:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C988610FC;
        Fri, 16 Apr 2021 05:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618550126;
        bh=zo0m8GexhA3rG9Uo0LDIj4iZz7LXxRsmWfbILWfoHdU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=atqo5SIIiRtQ5kFMoW6eVB47dNcr/rUudJp11+qSxb61Uj39eXlpLTnukWi5X/bmv
         GZZLFQnL5ITxgGy5enY710u3RQkdK/is9TBGcTwIbd+fZo8tWOqNadR+2KhY5xcUcj
         oILjW/Q682uUGAIwgtAEgpFuLc63bA/Uvxz0xjIE=
Date:   Fri, 16 Apr 2021 07:15:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Malte Deiseroth <msdeiseroth@gmx.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Fix missing whitespace in function calls.
Message-ID: <YHkdayDVPvNF9yal@kroah.com>
References: <20210415203106.GA122777@utop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415203106.GA122777@utop>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 15, 2021 at 10:31:06PM +0200, Malte Deiseroth wrote:
> Signed-off-by: Malte Deiseroth <mdeiseroth88@gmail.com>
> ---
>  drivers/usb/misc/adutux.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
> index 45a387979935..6d15a097b007 100644
> --- a/drivers/usb/misc/adutux.c
> +++ b/drivers/usb/misc/adutux.c
> @@ -183,10 +183,10 @@ static void adu_interrupt_in_callback(struct urb *urb)
>  				dev->interrupt_in_buffer, urb->actual_length);
>  
>  			dev->read_buffer_length += urb->actual_length;
> -			dev_dbg(&dev->udev->dev,"%s reading  %d\n", __func__,
> +			dev_dbg(&dev->udev->dev, "%s reading  %d\n", __func__,
>  				urb->actual_length);
>  		} else {
> -			dev_dbg(&dev->udev->dev,"%s : read_buffer overflow\n",
> +			dev_dbg(&dev->udev->dev, "%s : read_buffer overflow\n",
>  				__func__);
>  		}
>  	}
> @@ -726,7 +726,7 @@ static int adu_probe(struct usb_interface *interface,
>  		retval = -EIO;
>  		goto error;
>  	}
> -	dev_dbg(&interface->dev,"serial_number=%s", dev->serial_number);
> +	dev_dbg(&interface->dev, "serial_number=%s", dev->serial_number);
>  
>  	/* we can register the device now, as it is ready */
>  	usb_set_intfdata(interface, dev);
> -- 
> 2.27.0
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file, Documentation/SubmittingPatches
  for how to do this correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
