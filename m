Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A956D7EDD
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 20:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbfJOSZZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 14:25:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:43980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbfJOSZZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Oct 2019 14:25:25 -0400
Received: from localhost (unknown [38.98.37.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FD0D20854;
        Tue, 15 Oct 2019 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571163922;
        bh=w3JPtmPhxhHKUGlCZ+tjFLFIEORSsCJ50SVVIpYzLAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nw10qirKFE8Uc7jhiN45AqLWnEfRFgOO6JiEMOCwwGN4FUc8mm4ONJzFwlwYy76zM
         AYf+31Io0H5F+jSNeqqYlF6W0TWw3Mq+24X/ps6dRbXJVYL+N+CS0iQg7KaUXgPHoj
         78WQchFf/StCynBT9L2x5Oz/VVTxT7+I0/QeMA+4=
Date:   Tue, 15 Oct 2019 20:23:36 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     linux-usb@vger.kernel.org, linux-hotplug@vger.kernel.org
Subject: Re: [PATCH v2] usb: usbfs: Suppress problematic bind and unbind
 uevents.
Message-ID: <20191015182336.GA1136990@kroah.com>
References: <20191011115518.2801-1-ingo.rohloff@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011115518.2801-1-ingo.rohloff@lauterbach.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 01:55:18PM +0200, Ingo Rohloff wrote:
> commit 1455cf8dbfd0 ("driver core: emit uevents when device is bound
> to a driver") added bind and unbind uevents when a driver is bound or
> unbound to a physical device.
> 
> For USB devices which are handled via the generic usbfs layer (via
> libusb for example), this is problematic:
> Each time a user space program calls
>    ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
> and then later
>    ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);
> The kernel will now produce a bind or unbind event, which does not
> really contain any useful information.
> 
> This allows a user space program to run a DoS attack against programs
> which listen to uevents (in particular systemd/eudev/upowerd):
> A malicious user space program just has to call in a tight loop
> 
>    ioctl(usb_fd, USBDEVFS_CLAIMINTERFACE, &usb_intf_nr);
>    ioctl(usb_fd, USBDEVFS_RELEASEINTERFACE, &usb_intf_nr);
> 
> With this loop the malicious user space program floods the kernel and
> all programs listening to uevents with tons of bind and unbind
> events.
> 
> This patch suppresses uevents for ioctls USBDEVFS_CLAIMINTERFACE and
> USBDEVFS_RELEASEINTERFACE.
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> ---
> 
> Notes:
>     v2:
>     Patch only single file (devio.c), try to only suppress uevents while
>     usb_driver_claim_interface/usb_driver_release_interface are called.
>     Try to restore old state of dev->kobj.uevent_suppress.

Thanks for cleaning this up.  It looks much nicer now.  I've queued it
up in my tree, let's see how testing goes :)

thanks,

greg k-h
