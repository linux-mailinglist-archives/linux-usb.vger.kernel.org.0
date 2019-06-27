Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F84758351
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 15:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfF0NVX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 09:21:23 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:10164 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726059AbfF0NVX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jun 2019 09:21:23 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5RDIgUE006914;
        Thu, 27 Jun 2019 08:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=OFU7/UwkyWdnfIx2QpANicTMoetLyx9uuUhWpvP17kA=;
 b=quYjBmee/nA0TWw1hgANNWqzKXyzvFbsHb9UI8lmLC98TZliwtr7mjlHUihFCeqZ2+/r
 Z/BUTeS78PaRIhpekP54RLljkOANhjSNp9MnLvEp1rbd9rKmLrXNjGwsTzG5icS0vBqy
 W1/LN0SaGdkIsNTMuR8Xkf4jsDIam1MArPinXxKMemJ99rnyh17NRPn1QV8D7ORPUYX6
 iy2aMxt5b+o+SB5pGjX9MaejbvgNdNr4Bwc6r/EMqWOK8FCLA+9Vo2S3wM4RkqRGJiZI
 5Pyvr9cQEde3I6wQ5c3YuSMzYX7Ijr5MVQ704TtU5SCCg/2AUYB1ea+Ypx9+0Yt0ja8y XQ== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2h2tc-1;
        Thu, 27 Jun 2019 08:20:26 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail2.cirrus.com (Postfix) with ESMTP id 5CAA6605A6A7;
        Thu, 27 Jun 2019 08:20:25 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 27 Jun
 2019 14:20:24 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 27 Jun 2019 14:20:24 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A4CE62DA;
        Thu, 27 Jun 2019 14:20:24 +0100 (BST)
Message-ID: <1561641624.14683.11.camel@opensource.cirrus.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Date:   Thu, 27 Jun 2019 14:20:24 +0100
In-Reply-To: <Pine.LNX.4.44L0.1906261043300.1550-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906261043300.1550-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270156
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-06-26 at 11:07 -0400, Alan Stern wrote:
> On Wed, 26 Jun 2019, Mayuresh Kulkarni wrote:
> 
> > 
> > On Tue, 2019-06-25 at 10:08 -0400, Alan Stern wrote:
> > 
> > > 
> > > > 
> > > > Based on discussion so far and my understanding, how about below
> > > > approach -
> > > > 
> > > > 1. Have ALLOW_SUSPEND and WAIT_FOR_RESUME ioctls. As before,
> > > > ALLOW_SUSPEND calls usb_autosuspend_device() while
> > > > WAIT_FOR_RESUME
> > > > waits
> > > > for resume.
> > > > 2. Have usbfs_notify_suspend() and usbfs_notify_resume() as per
> > > > your
> > > > previous patch (i.e.: system/resume callbacks at device level).
> > > > 3. Extend usbdev_poll() to wait for udev->state ==
> > > > USB_STATE_SUSPENDED
> > > > when events == POLLPRI. Return POLLPRI when state =
> > > > USB_STATE_SUSPENDED.
> > > > 4. As before, any ioctl != (ALLOW_SUSPEND or WAIT_FOR_RESUME)
> > > > calls usb_autoresume_device().
> > > 3 sounds reasonable at first, but I'm not sure it would work.  
> > > Consider what would happen if the device is suspended very briefly
> > > and
> > > then wakes up.  The usbdev_poll() call might not return, because
> > > by
> > > the
> > > time it checks udev->state, the state has already changed back to
> > > USB_STATE_CONFIGURED.
> > > 
> > I see what you mean here, could be problematic.
> > 
> > > 
> > > In any case, we shouldn't do 4.  It would prevent the device from
> > > ever
> > > going into suspend, because the program would want to continue
> > > making
> > > usbfs ioctl calls while waiting for the suspend to occur.
> > > 
> > In poll approach, due to the contraint I mentioned, it is not
> > expected
> > from user-space to interact with device *after* it calls
> > ALLOW_SUSPEND
> > ioctl. This is because, it has determined that device is idle from
> > its
> > point of view.
> What if the user interacts with the device at this point?  Wouldn't 
> the program want to know about it?
> 
> Even if your program doesn't care about user interaction with an idle
> device, there undoubtedly will be other programs that _do_
> care.  This 
> mechanism we are designing needs to work with all programs.
> 

OK.

> > 
> > But after a while, there could be a situation where the user-space
> > wants
> > to send some message to device (due to end user interaction) then,
> > having (4) would be handy to cancel the undone suspend or cause
> > host-
> > wake.
> That's what the FORBID_SUSPEND ioctl does.  We don't need (4) for
> this.
> 

Right, OK.

> > 
> > > 
> > > > 
> > > > 2. Is it safe to wait for udev->state to be of a particular
> > > > value?
> > > No, not really, because the state can change.
> > > m[c]++;
> > If you remember, I had also suggested to use root-hub suspend in
> > generic_suspend() to call usbfs_notify_suspend/_resume APIs. It
> > might be
> > possible to use that in usbdev_poll() and send POLLPRI when root-hub
> > suspends.
> I don't see how that would help.  It would just make things more 
> confusing.  Forget about root-hub events for now.
> 

Yes sure. Thanks.

> > 
> > > 
> > > > 
> > > > If this approach could work, I can spend time on this one as
> > > > well.
> > > What advantage do you think your proposal has over my proposal?
> > > 
> > Not necessarily advantage(s), but few things that I could think of
> > are -
> > 
> > 1. In poll based approach, user-space notion of device's state is in
> > sync with actual device state.
> NO!  That simply is not true.  You don't seem to be able to grasp this
> point.
> 
> Consider this: Suppose the computer is busy running many other 
> programs.  Your program gets swapped out because a bunch of other 
> higher-priority tasks need to run.  By the time your program gets a 
> chance to run again, the device could have gone through several 
> suspend/resume transitions.  There's no way the program can keep
> track 
> of all that.
> 

Yeah I see what you mean.

> If you want a more likely example, consider this: Your program calls 
> ALLOW_SUSPEND and then calls poll().  The device suspends and the 
> poll() returns.  But then, before your program can do anything else, 
> the device resumes.  Now the device is active but your program thinks 
> it is suspended -- the program is out of sync.
> 
> Face it: It is _impossible_ for a program to truly know the device's 
> current state at all times (unless the device is not allowed to
> suspend 
> at all).
> 

Yep, thanks.

> > 
> > This is partially true with the 3 ioctl
> > approach suggested by you (partially because resume might not be
> > current
> > device state when wait-for-resume returns).
> Agreed.  But so what?  What abilities does your program lose as a 
> result of the fact that the device might be suspended when 
> WAIT_FOR_RESUME returns?
> 
> > 
> > 2. In 3 ioctl approach, user-space can still communicate with device
> > after calling ALLOW_SUSPEND. With poll based approach, we put a
> > constraint on user-space that, call ALLOW_SUSPEND only when you
> > determine you are not going to interact with device.
> That sounds like a disadvantage for your poll-based approach: It 
> constrains the behavior of userspace programs.
> 
> > 
> > I know for (2) above, you have commented before that -
> > A. It is desirable to be able to communicate with the device till it
> > is
> > actually suspended.
> > B. The possibility of device not going into suspend for long time,
> > so
> > user-space will not be able to proceed.
> > 
> > The counter comments to them are:
> > For (A), *usually*, the driver by some means determine device is
> > idle
> > and then schedules a suspend. After that, it is not expecting to
> > communicate with the device till resume happens. If it has to
> > communicate, it has to call resume first and then proceed.
> _Some_ programs will behave that way but other programs will not;
> they will want to continue communicating with the device right up
> until
> the time it suspends.  The kernel has to work with _all_ programs.
> 

Right, OK.

> > 
> > For (B), that is why we need ability to cancel current undone
> > suspend
> > operation, to allow the user-space to initiate the communication.
> And that is what FORBID_SUSPEND does.  You don't need to give up on
> (A) 
> in order to handle (B).
> 
> > 
> > Hope some of these points makes sense.
> None of them seem convincing, at least, not to me.
> 

Thanks for all the comments and clarifications, Alan.

I will check the 3-ioctl approach on the platform I have using the test
program I had used to send my original patch.

Just for my understanding, the below sequence should also work -
1. Call ALLOW_SUSPEND
2. Previously queued URB fails ==> device no longer active
3. Call WAIT_FOR_RESUME
4. After a while (say > 10 sec), assume no remote-wake by device. But
user-space wants to communicate with the device (due to some end-user
activity).
In this case, the user space needs to call FORBID_SUSPEND ioctl. When
that returns, it is safe to assume device is active.
5. Once done, go-to (1).

Could you please cross-confirm? Thanks,

> Alan Stern
> 
