Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 181AFD271E
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 12:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbfJJKYP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 06:24:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:41662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbfJJKYP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Oct 2019 06:24:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E16D20679;
        Thu, 10 Oct 2019 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570703054;
        bh=NfoFNc2uZaqSJbNmA8K40pU4Bk7BLv766FI+HXha8As=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tjiBbYOjIC3wiN6KgV5telovKVYRe7VNm1C180uTkHi2a3ZUnRwBEUode2DJP0rbU
         4FVWUIueAc+SMRT6HtV+Utge8xb1NQHLGVrB5ddIdI6DbhwZ0hP0PWbXd5sUr6xWRe
         jELe+J07VOu8G10YOnUc0pfnCLp9BsJl57cOCGNw=
Date:   Thu, 10 Oct 2019 12:24:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     linux-usb@vger.kernel.org, linux-hotplug@vger.kernel.org
Subject: Re: [PATCH] USB: usbfs: Suppress emission of uevents for interfaces
 handled via usbfs
Message-ID: <20191010102411.GA541845@kroah.com>
References: <20191009123829.07eacc7f@ingpc3.intern.lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009123829.07eacc7f@ingpc3.intern.lauterbach.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 09, 2019 at 12:38:35PM +0200, Ingo Rohloff wrote:
> >From 17d1e75543e26cfe702e7f5b0d4e07e0e45e5250 Mon Sep 17 00:00:00 2001
> From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> Date: Tue, 8 Oct 2019 20:27:57 +0200
> Subject: [PATCH] USB: usbfs: Suppress emission of uevents for interfaces
>  handled via usbfs.

No need for this in the changelog body :)

> commit 1455cf8dbfd0
> ("driver core: emit uevents when device is bound to a driver")
> added bind/unbind uevents when a driver is bound/unbound
> to a physical device.

You can wrap the line a bit nicer:
	commit 1455cf8dbfd0 ("driver core: emit uevents when device is bound to
	a driver") added bind/unbind uevents when a driver is bound/unbound to a
	physical device.

> For USB devices which are handled via the generic usbfs layer
> (via libusb for example), this is problematic:
> Each time a user space program calls
>    ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
> and then later
>    ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);
> The kernel will now produce a bind/unbind event,
> which does not really contain any useful information.
> 
> This allows a user space program to run a DoS attack against
> programs which listen to uevents (in particular systemd/eudev/upowerd):
> A malicious user space program just has to call in a tight loop
> 
>    ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
>    ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);
> 
> With this loop the malicious user space program floods
> the kernel and all programs listening to uevents with
> tons of bind/unbind events.
> 
> This patch suppresses uevents for interfaces claimed via usbfs.
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
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

Did checkpatch let this go through?  Shouldn't that be:
		if (err)

And did you send this patch twice?

Anyway, if you fix those minor things up, it looks good to me.

thanks,

greg k-h
