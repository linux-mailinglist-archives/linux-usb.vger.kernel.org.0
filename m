Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD02856BA1
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 16:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfFZOPg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 10:15:36 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:3190 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726157AbfFZOPg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jun 2019 10:15:36 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5QE9ZZf024595;
        Wed, 26 Jun 2019 09:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=cOJyhejyYEa9aIBCT4AIXE2Y4isCFLnsXYb7ceiNTDE=;
 b=aRhR0/t+OgquhbWbekfYd/SIY5lLQbBYj9dsgHRFIAOp6bGAam3RL+OHdyiDTfGCR77z
 4dVW1raGrosIRvbp1BNhdY/AhpOaGKf1hW/vPcDeOIp38mH//bcuV/HLkna2z1bfRFyM
 BIAOfwuGOZqE3OG5xnY5fUuVPosqhE+RwhV7tkfzaRwvaXWvxFjBYmS5wHBaz1oAnTaq
 EisO/65KqyH7eC3BFbcVKwU6GNGb6kkkCx3DHhrSEDPlQLavlLW6yZVOIcYZZGiqPFC7
 xndVeUuoigQ7kdwlz10BtWPo+w5ddY845o1zzhhx8s1s89IJ6c7OrCsrzXLMRvPe8Baj yA== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2fam9-1;
        Wed, 26 Jun 2019 09:15:31 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail2.cirrus.com (Postfix) with ESMTP id D5E20605A680;
        Wed, 26 Jun 2019 09:15:30 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 26 Jun
 2019 15:15:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 26 Jun 2019 15:15:30 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 154BD44;
        Wed, 26 Jun 2019 15:15:30 +0100 (BST)
Message-ID: <1561558529.13461.33.camel@opensource.cirrus.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Date:   Wed, 26 Jun 2019 15:15:29 +0100
In-Reply-To: <Pine.LNX.4.44L0.1906250945410.1493-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906250945410.1493-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260169
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-06-25 at 10:08 -0400, Alan Stern wrote:
> On Tue, 25 Jun 2019, Mayuresh Kulkarni wrote:
> 
> > 
> > > 
> > > There are two possible ways a userspace program can monitor the 
> > > device's state:
> > > 
> > >     1.	The program can leave an URB (typically on an
> > > interrupt 
> > > 	endpoint) running constantly, and the device can send its 
> > > 	response to the URB whenever something happens.
> > > 
> > >     2.	The program can poll the device by submitting an
> > > URB 
> > > 	periodically to see if anything has happened since the last 
> > > 	poll.
> > > 
> > > In case 1, the program would leave the URB running even after
> > > doing
> > > the 
> > > ALLOW_SUSPEND ioctl.  That way the program will be aware of
> > > anything 
> > > that happens to the device before it suspends.  When the device
> > > does
> > > go 
> > > into suspend, the URB will be terminated.
> > > 
> > > In case 2, the program would continue polling the device even
> > > after 
> > > doing the ALLOW_SUSPEND ioctl.  When the device does go into
> > > suspend, 
> > > the polling URB will fail.
> > > 
> > Right, so user space should do the following when it determines the
> > device is idle from its point of view -
> > 
> > 1. Call ALLOW_SUSPEND ioctl
> > 2. Queue an URB and wait for its REAP. When the wait returns -EFAIL
> > (or
> > something similar), that is the indication that the device is no
> > longer
> > active (or suspended)
> > 3. Call WAIT_FOR_RESUME ioctl
> > 4. When WAIT_FOR_RESUME ioctl returns, it is guaranteed that device
> > is
> > active.
> > 5. Call FORBID_SUSPEND ioctl and read the cause of resume.
> > 6. Go to (1) when appropriate
> > 
> > Have I summarized this approach correctly from user-space point of
> > view?
> Yes, except for one thing: In step 4, it is _not_ guaranteed that the 
> device is active when WAIT_FOR_RESUME returns.  The only guarantee is 
> that a resume did occur sometime after step 1, but the device might 
> have gone back into suspend after that occurred.
> 

Right, OK.

> And note that step 2 (queuing an URB) is something your program would
> do anyway, even if the device wasn't going to be suspended or wasn't
> idle.
> 

Yes, got it now.

> 
> > 
> > Based on discussion so far and my understanding, how about below
> > approach -
> > 
> > 1. Have ALLOW_SUSPEND and WAIT_FOR_RESUME ioctls. As before,
> > ALLOW_SUSPEND calls usb_autosuspend_device() while WAIT_FOR_RESUME
> > waits
> > for resume.
> > 2. Have usbfs_notify_suspend() and usbfs_notify_resume() as per your
> > previous patch (i.e.: system/resume callbacks at device level).
> > 3. Extend usbdev_poll() to wait for udev->state ==
> > USB_STATE_SUSPENDED
> > when events == POLLPRI. Return POLLPRI when state =
> > USB_STATE_SUSPENDED.
> > 4. As before, any ioctl != (ALLOW_SUSPEND or WAIT_FOR_RESUME)
> > calls usb_autoresume_device().
> 3 sounds reasonable at first, but I'm not sure it would work.  
> Consider what would happen if the device is suspended very briefly and
> then wakes up.  The usbdev_poll() call might not return, because by
> the
> time it checks udev->state, the state has already changed back to
> USB_STATE_CONFIGURED.
> 

I see what you mean here, could be problematic.

> In any case, we shouldn't do 4.  It would prevent the device from ever
> going into suspend, because the program would want to continue making
> usbfs ioctl calls while waiting for the suspend to occur.
> 

In poll approach, due to the contraint I mentioned, it is not expected
from user-space to interact with device *after* it calls ALLOW_SUSPEND
ioctl. This is because, it has determined that device is idle from its
point of view.

But after a while, there could be a situation where the user-space wants
to send some message to device (due to end user interaction) then,
having (4) would be handy to cancel the undone suspend or cause host-
wake.

> > 
> > The corresponding user-space calls would be -
> > A. When determined device is idle, call ALLOW_SUSPEND ioctl.
> > B. Call poll(device_fd, POLLPRI). When poll returns check revents
> > == POLLPRI.
> What if the device never does go into suspend?  The poll() call
> wouldn't return and the program would just stop working.
> 
> > 
> > C. Call WAIT_FOR_RESUME ioctl.
> > D. When WAIT_FOR_RESUME ioctl returns, read resume reason.
> > E. Go to (A).
> > 
> > The constraint on (1) above is - ALLOW_SUSPEND should be called when
> > user-space decides device is idle. I think this is not a hard
> > constraint
> > since poll() for suspend will return POLLPRI when device is
> > suspended
> > which is different from what it returns when ASYNC URB is completed.
> > 
> > Few points I am unsure of are -
> > 1. Is it OK for a driver to re-purpose POLLPRI for its own use
> > or POLLPRI has a unique meaning system wide?
> POLLPRI does not have a unique system-wide meaning.  We could use it
> to 
> indicate the device is suspended, if we want to.  But I'm not
> convinced 
> that it would be a good idea.
> 
> > 
> > 2. Is it safe to wait for udev->state to be of a particular value?
> No, not really, because the state can change.
> 

If you remember, I had also suggested to use root-hub suspend in
generic_suspend() to call usbfs_notify_suspend/_resume APIs. It might be
possible to use that in usbdev_poll() and send POLLPRI when root-hub
suspends.

> > 
> > If this approach could work, I can spend time on this one as well.
> What advantage do you think your proposal has over my proposal?
> 

Not necessarily advantage(s), but few things that I could think of are -

1. In poll based approach, user-space notion of device's state is in
sync with actual device state. This is partially true with the 3 ioctl
approach suggested by you (partially because resume might not be current
device state when wait-for-resume returns).
2. In 3 ioctl approach, user-space can still communicate with device
after calling ALLOW_SUSPEND. With poll based approach, we put a
constraint on user-space that, call ALLOW_SUSPEND only when you
determine you are not going to interact with device.

I know for (2) above, you have commented before that -
A. It is desirable to be able to communicate with the device till it is
actually suspended.
B. The possibility of device not going into suspend for long time, so
user-space will not be able to proceed.

The counter comments to them are:
For (A), *usually*, the driver by some means determine device is idle
and then schedules a suspend. After that, it is not expecting to
communicate with the device till resume happens. If it has to
communicate, it has to call resume first and then proceed.
For (B), that is why we need ability to cancel current undone suspend
operation, to allow the user-space to initiate the communication.

Hope some of these points makes sense.

> Alan Stern
> 
