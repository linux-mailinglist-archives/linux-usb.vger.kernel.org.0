Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8085454C7D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2019 12:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731971AbfFYKmR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jun 2019 06:42:17 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:14666 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726756AbfFYKmR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jun 2019 06:42:17 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5PAbNJ2001349;
        Tue, 25 Jun 2019 05:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=Nda+1+aTYjcbc9PUtphkiJyCFBfFfNbNk8GncwRHomw=;
 b=QqW6mJXGFGP2Xf9hThLEnvXI4bm1pvIn3l8WLAEmMKQkkcPvavNpfYGoYs06Qd0HUrpW
 lDFlJKLln2ssgGfXYW8T8U8Js9nzsMu6qqtp77pz6Wn4Z/B3X2BzOmgyldE+fNHUiiOD
 NPKXudT8p/06MSQYOAlttscZzOv/ikNZFsI9WZkJUA6hRZWFu+WhjucuR+JFaNngxpUZ
 IOgm3uu1DpYxmjFjQLSLO7i7nTytvp5xoYqmuhVGQa/vQm6ghvK/IrG80YwjtUJ4jP9r
 iPs6Hh0hhch3Sl3jCsL9FG63PMmkL+7vEPLspH+lioehFNe+zIVPa6QbiwI1XJAmqAOJ rg== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2cwjy-1;
        Tue, 25 Jun 2019 05:41:42 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail2.cirrus.com (Postfix) with ESMTP id 754B7605A6A6;
        Tue, 25 Jun 2019 05:41:41 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 25 Jun
 2019 11:41:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 25 Jun 2019 11:41:40 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B1B822A1;
        Tue, 25 Jun 2019 11:41:40 +0100 (BST)
Message-ID: <1561459300.3795.39.camel@opensource.cirrus.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Date:   Tue, 25 Jun 2019 11:41:40 +0100
In-Reply-To: <Pine.LNX.4.44L0.1906241324210.1609-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906241324210.1609-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250086
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2019-06-24 at 13:48 -0400, Alan Stern wrote:
> On Mon, 24 Jun 2019, Mayuresh Kulkarni wrote:
> 
> > 
> > On Fri, 2019-06-21 at 15:28 -0400, Alan Stern wrote:
> > > 
> > > On Fri, 21 Jun 2019, Mayuresh Kulkarni wrote:
> > > 
> > > > 
> > > > 
> > > > Hi Alan,
> > > > 
> > > > With the suggested modification (of having suspend/resume of
> > > > usbfs
> > > > at
> > > > device level instead of interface level), looks like I am seeing
> > > > a
> > > > deadlock described as below -
> > > > 
> > > > Pre-condition: USB device is connected but suspended before
> > > > running
> > > > test
> > > > program.
> > > > 
> > > > 1. The test program calls open(/dev/bus/usb/...).
> > > > 2. This ends up calling usbdev_open().
> > > > 3. usbdev_open() takes the lock and
> > > > calls usb_autoresume_device().
> > > > 4. usb_autoresume_device() calls pm_runtime_get_sync(). Due to
> > > > _sync
> > > > version, this call will return after calling the resume call-
> > > > back of
> > > > driver (please correct me if wrong).
> > > > 5. This ends up calling generic_resume() which
> > > > calls usbfs_notify_resume().
> > > > 6. Now usbfs_notify_resume() also wants the same lock that
> > > > usbdev_open()
> > > > in (3) has already taken.
> > > What lock are you talking about?  usbfs_notify_resume() doesn't
> > > take 
> > > any locks.
> > The lock I am talking about is used
> > by usb_lock_device/usb_unlock_device. It is shared
> > between usbdev_open()
> > and usbfs_notify_resume().
> Here's the subroutine as it appears in the patch:
> 
> void usbfs_notify_resume(struct usb_device *udev)
> {
> 	struct usb_dev_state *ps;
> 
> 	list_for_each_entry(ps, &udev->filelist, list) {
> 		WRITE_ONCE(ps->not_yet_resumed, 0);
> 		wake_up_all(&ps->wait_for_resume);
> 	}
> }
> 
> Please point out exactly where in this code you think
> usbfs_notify_resume() tries to acquire the device lock.
> 

Oops, sorry. Please accept my apology on this one.
You are right, the original patch you send doesn't have the lock
in usbfs_notify_suspend/resume.

> (Although, to be fair, I think udev->filelist needs to be protected by
> usbfs_mutex.  I will add this in the next version of the patch.)

OK.

> 
> > 
> > I think for this approach, we would also need to
> > call usb_autosuspend_device/usb_autoresume_device out of the
> > usb_lock/unlock_device pair.
> No, you're not allowed to do that.  See the documentation at the top 
> of the source code for usb_autosuspend_device() and 
> usb_autoresume_device() in driver.c.
> 
> > 
> > > 
> > > > 
> > > > My observation so far is - when the USB device is connected for
> > > > first
> > > > time, Android's USB manager server is able to open the device
> > > > and
> > > > reads
> > > > its descriptors using usbfs. But the test is not able to. The
> > > > change
> > > > is
> > > > auto-suspend in between device connect and run of test program.
> > > > 
> > > > I am still analysing the situation here to see if pre-condition
> > > > above
> > > > really makes difference or not. So please take this update with
> > > > pinch of
> > > > salt. However, still I wanted send this update and get a quick
> > > > review to
> > > > ensure I am not wandering in weeds.
> > > This doesn't sound like a real problem.
> > > 
> > > However, I have been thinking about how to do all this in light of
> > > Oliver's comments, and it seems like we should make some changes.
> > > 
> > > First, let's change the ioctls' names.  Instead of RESUME and
> > > SUSPEND,
> > > I'll call them FORBID_SUSPEND and ALLOW_SUSPEND.  The way they
> > > work
> > > should be clear: ALLOW_SUSPEND will permit the device to be
> > > suspended
> > > but might not cause a suspend to happen
> > > immediately.  FORBID_SUSPEND
> > > will cause an immediate resume if the device is currently
> > > suspended
> > > and
> > > will prevent the device from being suspended in the future.  The
> > > new 
> > > names more accurately reflect what the ioctls actually do.
> > > 
> > > Second, the WAIT_FOR_RESUME ioctl will wait only until a resume
> > > has
> > > occurred more recently than the most recent ALLOW_SUSPEND
> > > ioctl.  So
> > > for example, if the program calls ALLOW_SUSPEND, and the device
> > > suspends, and then the device resumes, and then the device
> > > suspends
> > > again, and then the program calls WAIT_FOR_RESUME, the ioctl will
> > > return immediately even though the device is currently
> > > suspended.  
> > > Thus you don't have to worry about missing a remote resume.  This
> > > also
> > > means that when WAIT_FOR_RESUME returns, the program should call
> > > FORBID_SUSPEND to ensure that the device is active and doesn't go
> > > back 
> > > into suspend.
> > > 
> > 1. For the above example, since resume can happen anytime, the user-
> > space's suspend and resume notion would get out-of-sync with actual
> > device state, right?
> That's right.  We can't notify userspace about every state transition 
> the device makes, so userspace may very well get out-of-sync with the 
> actual device state.
> 
> > 
> > > 
> > > In practice, your program would use the ioctls as follows:
> > > 
> > > 	When the device file is opened, the kernel will automatically
> > > 	do the equivalent of FORBID_SUSPEND (to remain compatible 
> > > 	with the current behavior).
> > > 
> > > 	When the program is ready for the device to suspend, it will
> > > 	call the ALLOW_SUSPEND ioctl.  But it won't cancel the 
> > > 	outstanding URBs; instead it will continue to interact 
> > > 	normally with the device, because the device might not be 
> > > 	suspended for some time.
> > > 
> > I think it is reasonable to expect that user-space will call
> > ALLOW_SUSPEND when there is no URB pending from its side. If that is
> > not
> > the case, how can it expect the device to suspend when it has some
> > outstanding work pending?
> There are two possible ways a userspace program can monitor the 
> device's state:
> 
>     1.	The program can leave an URB (typically on an interrupt 
> 	endpoint) running constantly, and the device can send its 
> 	response to the URB whenever something happens.
> 
>     2.	The program can poll the device by submitting an URB 
> 	periodically to see if anything has happened since the last 
> 	poll.
> 
> In case 1, the program would leave the URB running even after doing
> the 
> ALLOW_SUSPEND ioctl.  That way the program will be aware of anything 
> that happens to the device before it suspends.  When the device does
> go 
> into suspend, the URB will be terminated.
> 
> In case 2, the program would continue polling the device even after 
> doing the ALLOW_SUSPEND ioctl.  When the device does go into suspend, 
> the polling URB will fail.
> 

Right, so user space should do the following when it determines the
device is idle from its point of view -

1. Call ALLOW_SUSPEND ioctl
2. Queue an URB and wait for its REAP. When the wait returns -EFAIL (or
something similar), that is the indication that the device is no longer
active (or suspended)
3. Call WAIT_FOR_RESUME ioctl
4. When WAIT_FOR_RESUME ioctl returns, it is guaranteed that device is
active.
5. Call FORBID_SUSPEND ioctl and read the cause of resume.
6. Go to (1) when appropriate

Have I summarized this approach correctly from user-space point of view?

> If the program doesn't do either of these (that is, if it leaves the 
> device completely idle) then it won't know if the user presses a 
> button or does anything else to the device before the device is put 
> into suspend.
> 
> > 
> > > 
> > > 	When the device does go into suspend, URBs will start failing
> > > 	with an appropriate error code (EHOSTUNREACH, ESHUTDOWN, 
> > > 	EPROTO, or something similar).  In this way the program will
> > > 	realize the device is suspended.  At that point the program
> > > 	should call the WAIT_FOR_RESUME ioctl and stop trying to 
> > > 	communicate with the device.
> > > 
> > > 	When WAIT_FOR_RESUME returns, the program should call the
> > > 	FORBID_SUSPEND ioctl and resume normal communication with the 
> > > 	device.
> > > 
> > Due to this condition, the example in (1) above will not cause a
> > wait on
> > current resume operation, since after WAIT_FOR_RESUME returns, the
> > user-
> > space will call FORBID_SUSPEND, which will bring device out of
> > current
> > suspend state. So, the wait effectively didn't happen, right?
> Correct.
> 
> > 
> > > 
> > > How does that sound?
> > My concerns are mentioned above, hope they make sense.
> > I will give this approach a shot with my test program and see how
> > that
> > goes.
> > 
> > Just to re-iterate, the main issue we have now is - how to notify
> > user-
> > space of suspend, so that it can safely call wait-for-resume, right?
> Basically there is no way to notify userspace when the device is 
> suspended.  Instead, we have to assume that the userspace program
> will 
> figure out what has happened all by itself when its URBs begin
> failing.
> 

Based on discussion so far and my understanding, how about below
approach -

1. Have ALLOW_SUSPEND and WAIT_FOR_RESUME ioctls. As before,
ALLOW_SUSPEND calls usb_autosuspend_device() while WAIT_FOR_RESUME waits
for resume.
2. Have usbfs_notify_suspend() and usbfs_notify_resume() as per your
previous patch (i.e.: system/resume callbacks at device level).
3. Extend usbdev_poll() to wait for udev->state == USB_STATE_SUSPENDED
when events == POLLPRI. Return POLLPRI when state = USB_STATE_SUSPENDED.
4. As before, any ioctl != (ALLOW_SUSPEND or WAIT_FOR_RESUME)
calls usb_autoresume_device().

The corresponding user-space calls would be -
A. When determined device is idle, call ALLOW_SUSPEND ioctl.
B. Call poll(device_fd, POLLPRI). When poll returns check revents
== POLLPRI.
C. Call WAIT_FOR_RESUME ioctl.
D. When WAIT_FOR_RESUME ioctl returns, read resume reason.
E. Go to (A).

The constraint on (1) above is - ALLOW_SUSPEND should be called when
user-space decides device is idle. I think this is not a hard constraint
since poll() for suspend will return POLLPRI when device is suspended
which is different from what it returns when ASYNC URB is completed.

Few points I am unsure of are -
1. Is it OK for a driver to re-purpose POLLPRI for its own use
or POLLPRI has a unique meaning system wide?
2. Is it safe to wait for udev->state to be of a particular value?

If this approach could work, I can spend time on this one as well.

Thanks,

> If necessary, we could add an extra ioctl (IS_SUSPENDED) which would 
> return 0 or 1 depending on whether the device is active or
> suspended.  
> But I don't think we will need this.
> 
> Alan Stern
> 
