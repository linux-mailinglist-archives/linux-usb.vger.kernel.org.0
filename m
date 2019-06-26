Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFD456C1D
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 16:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfFZOf6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 10:35:58 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:36412 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725958AbfFZOf6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jun 2019 10:35:58 -0400
Received: (qmail 2495 invoked by uid 2102); 26 Jun 2019 10:35:57 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 26 Jun 2019 10:35:57 -0400
Date:   Wed, 26 Jun 2019 10:35:57 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1561534960.23604.6.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1906261009560.1550-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 26 Jun 2019, Oliver Neukum wrote:

> Am Dienstag, den 25.06.2019, 10:08 -0400 schrieb Alan Stern:
> > On Tue, 25 Jun 2019, Mayuresh Kulkarni wrote:
> 
> > > Right, so user space should do the following when it determines the
> > > device is idle from its point of view -
> > > 
> > > 1. Call ALLOW_SUSPEND ioctl
> 
> That is a race in principle. You should reverse steps 1 and 2

I disagree.  First, it's not really a race.  It doesn't matter whether
the URB error occurs during completion or during submission; either way
the program will become aware that the device has suspended.

Second, in all likelihood the program will be submitting URBs more or
less continually anyway.  Think of an HID driver, for example.  It
always keeps an interrupt URB active so that it can monitor what is
happening to the device.

If you really think it would be better, we could add an IS_SUSPENDED
ioctl so that the program can poll for state changes.  But that seems
like a pretty bad approach to me.  We could even add a WAIT_FOR_SUSPEND
ioctl, but programs basically will never want to wait for a suspend to
occur.

> > > 2. Queue an URB and wait for its REAP. When the wait returns -EFAIL (or
> > > something similar), that is the indication that the device is no longer
> > > active (or suspended)
> > > 3. Call WAIT_FOR_RESUME ioctl
> 
> It seems to me that there ought to be one API for that. Either an
> ioctl or poll.

Isn't a WAIT_FOR_RESUME ioctl one API?

In general, an ioctl is more flexible than poll -- poll can report only
a very limited number of types of state change.

> > > 4. When WAIT_FOR_RESUME ioctl returns, it is guaranteed that device is
> > > active.
> > > 5. Call FORBID_SUSPEND ioctl and read the cause of resume.
> > > 6. Go to (1) when appropriate
> > > 
> > > Have I summarized this approach correctly from user-space point of view?
> > 
> > Yes, except for one thing: In step 4, it is _not_ guaranteed that the 
> > device is active when WAIT_FOR_RESUME returns.  The only guarantee is 
> > that a resume did occur sometime after step 1, but the device might 
> > have gone back into suspend after that occurred.
> 
> Now is that a good API? Shouldn't we rather have an API for either
> * resume the device now and bump the counter
> * bump the counter when te device resumes

It makes the code cleaner: The usage counter is incremented by the
FORBID_SUSPEND ioctl and decremented by the ALLOW_SUSPEND ioctl.  
Nothing else.  Now you're suggesting that WAIT_FOR_RESUME should also
increment the usage counter upon return.  Programs may not even want
that behavior (consider the possibility that WAIT_FOR_RESUME was
interrupted by a signal).

In any case, we do need two separate APIs: one to resume the device
immediately, and one to wait for a resume to occur.  Programs will want 
to do both these things.

> I don't see a value in not having a defined power state after resume.

Well, we also don't have a defined power state after ALLOW_SUSPEND.  I
don't see this as a problem.  It's more of a necessity, in fact --
there's no way to keep a userspace program fully up to date on the
device's state, because suspend and resume events are asynchronous.

> > > 3. Extend usbdev_poll() to wait for udev->state == USB_STATE_SUSPENDED
> > > when events == POLLPRI. Return POLLPRI when state = USB_STATE_SUSPENDED.
> > > 4. As before, any ioctl != (ALLOW_SUSPEND or WAIT_FOR_RESUME)
> > > calls usb_autoresume_device().
> > 
> > 3 sounds reasonable at first, but I'm not sure it would work.  
> > Consider what would happen if the device is suspended very briefly and
> > then wakes up.  The usbdev_poll() call might not return, because by the
> > time it checks udev->state, the state has already changed back to
> > USB_STATE_CONFIGURED.
> 
> Indeed. It seems to me that any power transition should be reported
> back.

Sorry, I don't understand: Reported back where?  Keep in mind that it
is not feasible to report every transition to a userspace program.  
And even if you somehow did, the last reported value would be out of
date as soon as the program received it.

> > In any case, we shouldn't do 4.  It would prevent the device from ever
> > going into suspend, because the program would want to continue making
> > usbfs ioctl calls while waiting for the suspend to occur.
> 
> Exactly.
> 
> > > The corresponding user-space calls would be -
> > > A. When determined device is idle, call ALLOW_SUSPEND ioctl.
> > > B. Call poll(device_fd, POLLPRI). When poll returns check revents
> > > == POLLPRI.
> > 
> > What if the device never does go into suspend?  The poll() call
> > wouldn't return and the program would just stop working.
> 
> Well, that is why you can poll for multiple events at the same
> time and the syscall has a timeout.

The events that poll reports on are really targeted toward
communication channels (e.g., data available to read, high-priority
data received, channel closed), not suspend/resume state changes.  
Poll really wasn't meant for this purpose.

> > > 2. Is it safe to wait for udev->state to be of a particular value?
> > 
> > No, not really, because the state can change.
> 
> That is a general issue with poll. You cannot be sure that there
> is still data to be read when you are ready to read.

Why not?  If you're dealing with a tty device and poll says there is 
data available to read, the data won't go away by itself.  It'll remain 
in the buffer until you read it.

Alan Stern

