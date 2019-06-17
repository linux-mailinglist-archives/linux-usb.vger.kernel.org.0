Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3D06487FE
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 17:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbfFQPzT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 11:55:19 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:55730 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726292AbfFQPzT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 11:55:19 -0400
Received: (qmail 3734 invoked by uid 2102); 17 Jun 2019 11:55:18 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Jun 2019 11:55:18 -0400
Date:   Mon, 17 Jun 2019 11:55:18 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <oneukum@suse.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1560771539.9583.21.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1906171119130.1738-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 17 Jun 2019, Mayuresh Kulkarni wrote:

> > (Note: I imagine you might run into trouble because devices generally 
> > do not get put into runtime suspend immediately.  So if you call the 
> > USBDEVFS_SUSPEND ioctl and then the USBDEVFS_WAIT_FOR_RESUME ioctl,
> > the 
> > wait will return immediately because the device hasn't yet been 
> > suspended.)
> > 
> 
> Hi Alan,
> 
> For this particular comment, how about we add suspend-waiter similar to
> resume-waiter?
> As per the below changes, usbfs_notify_suspend() can wake the suspend-
> waiter, if generic_suspend() is called. So, the suspend ioctl will be
> partial blocking i.e.: it will wait till suspend happens and will return
> when it is safe to do resume.
> 
> Will this work?

Probably not.  Just think about it: Your program stops communicating
with the device and tells the kernel that it's ready for the device to
be suspended.  But the device doesn't go into suspend for several
seconds (or longer!) and during that time your program has no idea
what's happening to it.  I'm pretty sure that's not what you want.

You're right that the program needs to know when the device is about to 
be suspended.  But waiting for an ioctl to return isn't a good way 
to do it; this needs to be a callback of some sort.  That is, the 
kernel also needs to know when the program is ready for the suspend.

I don't know what is the best approach.

> The reason for asking this is - I think the suspend ioctl should return
> appropriate status to user-space indicating weather to wait-for-resume
> or not.
> 
> Or are you suggesting to always have a delay in suspend/resume in user-
> space?
> 
> Please do review my comment below in this context too.

> In a typical SoC based system (XHCI compliant USB host controller with
> one port exposed out on PCB), wouldn't this call usbfs_notify_suspend()
> twice - first for udev of connected device and then for udev of root-
> hub?

Yes, it would.  This wouldn't make any difference to your program, 
since your program would have an open file reference only for the 
connected device, not for the root hub.

> If yes, how about we call usbfs_notify_*() for root-hubs only? That
> would be a good indication of suspend/resume since root-hubs will be
> suspended last while resumed first.
> 
> Will that work?

No.  Remember, this mechanism has to work on non-SoC systems too.  And 
even on an SoC, it's possible that your device is just one of several 
plugged into an external hub.  So your device might be suspended while 
the others remain active; then the root hub would not be suspended.

Alan Stern

