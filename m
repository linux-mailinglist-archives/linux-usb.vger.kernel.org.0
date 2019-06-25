Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7077355119
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2019 16:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbfFYOIG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jun 2019 10:08:06 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46132 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727807AbfFYOIG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jun 2019 10:08:06 -0400
Received: (qmail 2585 invoked by uid 2102); 25 Jun 2019 10:08:05 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Jun 2019 10:08:05 -0400
Date:   Tue, 25 Jun 2019 10:08:05 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1561459300.3795.39.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1906250945410.1493-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 25 Jun 2019, Mayuresh Kulkarni wrote:

> > There are two possible ways a userspace program can monitor the 
> > device's state:
> > 
> >     1.	The program can leave an URB (typically on an interrupt 
> > 	endpoint) running constantly, and the device can send its 
> > 	response to the URB whenever something happens.
> > 
> >     2.	The program can poll the device by submitting an URB 
> > 	periodically to see if anything has happened since the last 
> > 	poll.
> > 
> > In case 1, the program would leave the URB running even after doing
> > the 
> > ALLOW_SUSPEND ioctl.  That way the program will be aware of anything 
> > that happens to the device before it suspends.  When the device does
> > go 
> > into suspend, the URB will be terminated.
> > 
> > In case 2, the program would continue polling the device even after 
> > doing the ALLOW_SUSPEND ioctl.  When the device does go into suspend, 
> > the polling URB will fail.
> > 
> 
> Right, so user space should do the following when it determines the
> device is idle from its point of view -
> 
> 1. Call ALLOW_SUSPEND ioctl
> 2. Queue an URB and wait for its REAP. When the wait returns -EFAIL (or
> something similar), that is the indication that the device is no longer
> active (or suspended)
> 3. Call WAIT_FOR_RESUME ioctl
> 4. When WAIT_FOR_RESUME ioctl returns, it is guaranteed that device is
> active.
> 5. Call FORBID_SUSPEND ioctl and read the cause of resume.
> 6. Go to (1) when appropriate
> 
> Have I summarized this approach correctly from user-space point of view?

Yes, except for one thing: In step 4, it is _not_ guaranteed that the 
device is active when WAIT_FOR_RESUME returns.  The only guarantee is 
that a resume did occur sometime after step 1, but the device might 
have gone back into suspend after that occurred.

And note that step 2 (queuing an URB) is something your program would
do anyway, even if the device wasn't going to be suspended or wasn't
idle.


> Based on discussion so far and my understanding, how about below
> approach -
> 
> 1. Have ALLOW_SUSPEND and WAIT_FOR_RESUME ioctls. As before,
> ALLOW_SUSPEND calls usb_autosuspend_device() while WAIT_FOR_RESUME waits
> for resume.
> 2. Have usbfs_notify_suspend() and usbfs_notify_resume() as per your
> previous patch (i.e.: system/resume callbacks at device level).
> 3. Extend usbdev_poll() to wait for udev->state == USB_STATE_SUSPENDED
> when events == POLLPRI. Return POLLPRI when state = USB_STATE_SUSPENDED.
> 4. As before, any ioctl != (ALLOW_SUSPEND or WAIT_FOR_RESUME)
> calls usb_autoresume_device().

3 sounds reasonable at first, but I'm not sure it would work.  
Consider what would happen if the device is suspended very briefly and
then wakes up.  The usbdev_poll() call might not return, because by the
time it checks udev->state, the state has already changed back to
USB_STATE_CONFIGURED.

In any case, we shouldn't do 4.  It would prevent the device from ever
going into suspend, because the program would want to continue making
usbfs ioctl calls while waiting for the suspend to occur.

> The corresponding user-space calls would be -
> A. When determined device is idle, call ALLOW_SUSPEND ioctl.
> B. Call poll(device_fd, POLLPRI). When poll returns check revents
> == POLLPRI.

What if the device never does go into suspend?  The poll() call
wouldn't return and the program would just stop working.

> C. Call WAIT_FOR_RESUME ioctl.
> D. When WAIT_FOR_RESUME ioctl returns, read resume reason.
> E. Go to (A).
> 
> The constraint on (1) above is - ALLOW_SUSPEND should be called when
> user-space decides device is idle. I think this is not a hard constraint
> since poll() for suspend will return POLLPRI when device is suspended
> which is different from what it returns when ASYNC URB is completed.
> 
> Few points I am unsure of are -
> 1. Is it OK for a driver to re-purpose POLLPRI for its own use
> or POLLPRI has a unique meaning system wide?

POLLPRI does not have a unique system-wide meaning.  We could use it to 
indicate the device is suspended, if we want to.  But I'm not convinced 
that it would be a good idea.

> 2. Is it safe to wait for udev->state to be of a particular value?

No, not really, because the state can change.

> If this approach could work, I can spend time on this one as well.

What advantage do you think your proposal has over my proposal?

Alan Stern

