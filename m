Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8253D0167
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 21:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730781AbfJHTqH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 15:46:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730190AbfJHTqG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Oct 2019 15:46:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6CDD021835;
        Tue,  8 Oct 2019 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570563964;
        bh=IbQP6M6uItGp8qZRLKb/0rnFwEpQwpDlueyy9rtcgfw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zi2I6okY76ZH0W9xsswq4mp9Et1iOtFMFTJ5ZFGJWJ5Pmd11mkC1rrWIJKiQ36lGN
         BKp17cqLCuYtie+HF89NMMRyB27zfE4S9v7cAQSXKqJUOMFoBCrKb3B63UQjZFFQlE
         J5D2l5j8dlccsHv6qka7BpGL2ZskT+Ig/bwRC/RU=
Date:   Tue, 8 Oct 2019 21:46:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     linux-usb@vger.kernel.org, linux-hotplug@vger.kernel.org
Subject: Re: [PATCH] usbfs: Suppress uevents for
 claiminterface/releaseinterface
Message-ID: <20191008194601.GA3128463@kroah.com>
References: <20191008213200.68194e8c@ingpc3.intern.lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008213200.68194e8c@ingpc3.intern.lauterbach.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 09:32:10PM +0200, Ingo Rohloff wrote:
> Hello,
> 
> With recent Ubuntu 18/Linux Mint 19.2 etc, lots of user space programs 
> (in particular systemd/eudev/upowerd) have problems with the "BIND/UNBIND" 
> events produced since kernel 4.13.
> Some problems are described, when googling for
>   linux "usb" "bind event"
> 
> Now this might be blamed on these particular user space programs.
> But: This also means that programs accessing a USB device via the generic 
> usbfs layer can easily flood the kernel and all user space programs listening 
> to uevents with tons of BIND/UNBIND events by calling
> 
>     ioctl(usbfd, USBDEVFS_CLAIMINTERFACE, &intf);
>     ioctl(usbfd, USBDEVFS_RELEASEINTERFACE, &intf);
> 
> in a tight loop.
> Of course this is an extreme example, but I have a use case where exactly 
> this happens (running Linux Mint 19.2).
> The result is that "systemd-udev" needs > 100% CPU and 
> upowerd spams the system log with messages about "bind/unbind" events.
> 
> I am also not sure if these particular bind/unbind events contain any useful 
> information; these events just mean an arbitrary user space program has 
> bound/unbound from a particular USB interface.
> 
> The following patch tries to suppress emission of uevents 
> for USB interfaces which are claimed/released via usbfs.
> 
> I am not sure if this is the right way to do it, but at least 
> it seems to do what I intended...
> 
> with best regards
>   Ingo Rohloff

> From 57970b0a5a36809ddb8f15687c18ca2147dc73bd Mon Sep 17 00:00:00 2001
> From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> Date: Tue, 8 Oct 2019 20:27:57 +0200
> Subject: [PATCH] USB: usbfs: Suppress emission of uevents for interfaces
>  handled via usbfs.
> 
> commit 1455cf8dbfd0
> ("driver core: emit uevents when device is bound to a driver")
> added BIND and UNBIND events when a driver is bound/unbound
> to a physical device.
> 
> For USB devices which are handled via the generic usbfs layer
> (via libusb for example). This is problematic:
> Each time a user space program calls
>    ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
> and then later
>    ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);
> The kernel will now produce a BIND/UNBIND event, which
> does not really contain any useful information.
> 
> Additionally this easily allows a user space program to run a
> DoS attack against programs which listen to uevents
> (in particular systemd/eudev/upowerd):
> A malicious user space program just has to call in a tight loop
> 
>     ioctl(usbfd, USBDEVFS_CLAIMINTERFACE, &intf);
>     ioctl(usbfd, USBDEVFS_RELEASEINTERFACE, &intf);
> 
> with this loop the malicious user space program floods
> the kernel and all programs listening to uevents with
> tons of BIND/UNBIND events.
> 
> The following patch tries to suppress uevents for interfaces
> claimed via usbfs.
> ---
>  drivers/usb/core/devio.c  | 7 ++++++-
>  drivers/usb/core/driver.c | 2 ++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 3f899552f6e3..a1af1d9b2ae7 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -764,8 +764,13 @@ static int claimintf(struct usb_dev_state *ps, unsigned int ifnum)
>  	intf = usb_ifnum_to_if(dev, ifnum);
>  	if (!intf)
>  		err = -ENOENT;
> -	else
> +	else {
> +		/* suppress uevents for devices handled by usbfs */
> +		dev_set_uevent_suppress(&intf->dev, 1);
>  		err = usb_driver_claim_interface(&usbfs_driver, intf, ps);
> +		if (err != 0)
> +			dev_set_uevent_suppress(&intf->dev, 0);
> +	}
>  	if (err == 0)
>  		set_bit(ifnum, &ps->ifclaimed);
>  	return err;
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 2b27d232d7a7..6a15bc5c2869 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -594,6 +594,8 @@ void usb_driver_release_interface(struct usb_driver *driver,
>  	 */
>  	if (device_is_registered(dev)) {
>  		device_release_driver(dev);
> +		/* make sure we allow uevents again */
> +		dev_set_uevent_suppress(dev, 0);
>  	} else {
>  		device_lock(dev);
>  		usb_unbind_interface(dev);
> -- 
> 2.17.1
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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
