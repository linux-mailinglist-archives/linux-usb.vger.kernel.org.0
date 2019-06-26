Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7698563D5
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 09:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfFZH4Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 03:56:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:52174 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725379AbfFZH4Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jun 2019 03:56:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D1CC1ACC5;
        Wed, 26 Jun 2019 07:56:23 +0000 (UTC)
Message-ID: <1561534960.23604.6.camel@suse.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        patches@opensource.cirrus.com, USB list <linux-usb@vger.kernel.org>
Date:   Wed, 26 Jun 2019 09:42:40 +0200
In-Reply-To: <Pine.LNX.4.44L0.1906250945410.1493-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906250945410.1493-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 25.06.2019, 10:08 -0400 schrieb Alan Stern:
> On Tue, 25 Jun 2019, Mayuresh Kulkarni wrote:

> > Right, so user space should do the following when it determines the
> > device is idle from its point of view -
> > 
> > 1. Call ALLOW_SUSPEND ioctl

That is a race in principle. You should reverse steps 1 and 2

> > 2. Queue an URB and wait for its REAP. When the wait returns -EFAIL (or
> > something similar), that is the indication that the device is no longer
> > active (or suspended)
> > 3. Call WAIT_FOR_RESUME ioctl

It seems to me that there ought to be one API for that. Either an
ioctl or poll.

> > 4. When WAIT_FOR_RESUME ioctl returns, it is guaranteed that device is
> > active.
> > 5. Call FORBID_SUSPEND ioctl and read the cause of resume.
> > 6. Go to (1) when appropriate
> > 
> > Have I summarized this approach correctly from user-space point of view?
> 
> Yes, except for one thing: In step 4, it is _not_ guaranteed that the 
> device is active when WAIT_FOR_RESUME returns.  The only guarantee is 
> that a resume did occur sometime after step 1, but the device might 
> have gone back into suspend after that occurred.

Now is that a good API? Shouldn't we rather have an API for either
* resume the device now and bump the counter
* bump the counter when te device resumes

I don't see a value in not having a defined power state after resume.

> > 3. Extend usbdev_poll() to wait for udev->state == USB_STATE_SUSPENDED
> > when events == POLLPRI. Return POLLPRI when state = USB_STATE_SUSPENDED.
> > 4. As before, any ioctl != (ALLOW_SUSPEND or WAIT_FOR_RESUME)
> > calls usb_autoresume_device().
> 
> 3 sounds reasonable at first, but I'm not sure it would work.  
> Consider what would happen if the device is suspended very briefly and
> then wakes up.  The usbdev_poll() call might not return, because by the
> time it checks udev->state, the state has already changed back to
> USB_STATE_CONFIGURED.

Indeed. It seems to me that any power transition should be reported
back.

> In any case, we shouldn't do 4.  It would prevent the device from ever
> going into suspend, because the program would want to continue making
> usbfs ioctl calls while waiting for the suspend to occur.

Exactly.

> > The corresponding user-space calls would be -
> > A. When determined device is idle, call ALLOW_SUSPEND ioctl.
> > B. Call poll(device_fd, POLLPRI). When poll returns check revents
> > == POLLPRI.
> 
> What if the device never does go into suspend?  The poll() call
> wouldn't return and the program would just stop working.

Well, that is why you can poll for multiple events at the same
time and the syscall has a timeout.

> > 2. Is it safe to wait for udev->state to be of a particular value?
> 
> No, not really, because the state can change.

That is a general issue with poll. You cannot be sure that there
is still data to be read when you are ready to read.

	Regards
		Oliver

