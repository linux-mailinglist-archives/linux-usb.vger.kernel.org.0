Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7030C4ECE3
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2019 18:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbfFUQRE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jun 2019 12:17:04 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:47538 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726079AbfFUQRE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jun 2019 12:17:04 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5LGEKgC023053;
        Fri, 21 Jun 2019 11:16:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=d4xYc+9wXt/ocozdrrGiYTHViMiRYWTkE1kPDoYxHr0=;
 b=ZHnW5vu3PK/pH2yJY6PZ58Wmw+PBajLYx2X9AwQWq9NpoXYa7LNiLl18sHMblFGzXepE
 eFKcUFxceNFvVbTPQBMotpZIBMU+fyK0X6uf87dVeRjnmo0WcSb8+JMURkIJoEqBV3Bm
 U3wda4W+kq32rJRuEPLakBeok5IT09D6+jLC1UU5IEujdHoV3SHarJFq91MRTyH//u8v
 7qXrPX1pd5x2FurydrZNGnGzy3y3e4gytVpsNCrDnTl8HB4ud/pFKjEVpgT9TpvfbwC6
 Lmah80WRVuGXT7bJe/qNbyZRO6wNZ7j5+fmoCe0iu/2PTooBx0zsT/z9t23qfwETeqZR nA== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t780gmraj-1;
        Fri, 21 Jun 2019 11:16:58 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail2.cirrus.com (Postfix) with ESMTP id 03682605A6A0;
        Fri, 21 Jun 2019 11:16:57 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 21 Jun
 2019 17:16:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 21 Jun 2019 17:16:57 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4896C2A1;
        Fri, 21 Jun 2019 17:16:57 +0100 (BST)
Message-ID: <1561133817.11118.16.camel@opensource.cirrus.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>, <linux-usb@vger.kernel.org>
Date:   Fri, 21 Jun 2019 17:16:57 +0100
In-Reply-To: <Pine.LNX.4.44L0.1906201145280.1512-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906201145280.1512-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906210131
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2019-06-20 at 11:49 -0400, Alan Stern wrote:
> On Thu, 20 Jun 2019, Mayuresh Kulkarni wrote:
> 
> > 
> > On Wed, 2019-06-19 at 10:40 -0400, Alan Stern wrote:
> > 
> > > 
> > > The only solution I can think of is for the userspace program to
> > > first
> > > set the device's autosuspend delay to 0.  Then whenever the
> > > WAIT_FOR_RESUME ioctl returns -- even if it returns immediately --
> > > the
> > > program should assume the suspend is over or is not going to
> > > happen.  
> > > Then the program can run normally for a short while (10 seconds,
> > > perhaps) before making another attempt to suspend.
> > > 
> > Looks like usb_autosuspend_delay parameter is applicable to all USB
> > devices. Also, since it is a module parameter, it might be tuned on
> > a
> > particular platform (e.g.: from init.<vendor>.rc on Android).
> > So, I am not sure if it is good idea to rely on user-space to change
> > it
> > and restore it to original value when the USB device of interest is
> > detached.
> That's up to you.  There are lots of different ways to set the 
> autosuspend delay.  For example, you could create a udev rule that 
> would do it only for the devices your program handles.
> 
> > 
> > > 
> > > The only change I would make to the patch posted earlier is to
> > > have 
> > > proc_wait_for_resume() call usb_autoresume_device() and set 
> > > ps->suspend_requested = false before returning.
> > > 
> > > Mayuresh, how does that sound?
> > With the code-changes you send me (in response to the
> > patch), usb_autoresume_device() will be called when the waiter
> > in proc_wait_for_resume() will return and send some message to
> > "know"
> > why resume happened.
> > 
> > With above proposed change, proc_wait_for_resume() will return
> > with usb_autoresume_device() and suspend_requested = false. So when
> > the
> > user-space will send some message to "know" resume reason, the
> > checks in
> > ioctl() handler will be skipped.
> > 
> > (Apologies if above is obvious, but still wanted to comment so that
> > we
> > are on same page).
> > 
> > With that said, I think there would be an issue with "host-wake"
> > case as
> > below - the sequence of operations are:
> > - suspend ioctl called: assume actual bus suspend happens
> > - wait-for-resume ioctl called
> > - after a while user-space wants to send a message (due to end user
> > interaction for example)
> > 
> > Here the ioctl() will do usb_autoresume_device()
> > since suspend_requested
> > = true. This will end up calling usbfs_notify_resume() which will
> > release waiter in proc_wait_for_resume(). And due to above proposed
> > change, it will end up calling usb_autoresume_device() again.
> > 
> > As a result, suspend will not happen for next suspend ioctl call.
> Obviously the code would need to be more careful.  It would call 
> usb_autoresume_device() only if ps->suspend_requested was true.
> 
> Alan Stern
> 
> > 
> > So, looks like the original proposed change seems better here. On
> > the
> > side note, I am still in process of verifying the code changes.

Hi Alan,

With the suggested modification (of having suspend/resume of usbfs at
device level instead of interface level), looks like I am seeing a
deadlock described as below -

Pre-condition: USB device is connected but suspended before running test
program.

1. The test program calls open(/dev/bus/usb/...).
2. This ends up calling usbdev_open().
3. usbdev_open() takes the lock and calls usb_autoresume_device().
4. usb_autoresume_device() calls pm_runtime_get_sync(). Due to _sync
version, this call will return after calling the resume call-back of
driver (please correct me if wrong).
5. This ends up calling generic_resume() which
calls usbfs_notify_resume().
6. Now usbfs_notify_resume() also wants the same lock that usbdev_open()
in (3) has already taken.

My observation so far is - when the USB device is connected for first
time, Android's USB manager server is able to open the device and reads
its descriptors using usbfs. But the test is not able to. The change is
auto-suspend in between device connect and run of test program.

I am still analysing the situation here to see if pre-condition above
really makes difference or not. So please take this update with pinch of
salt. However, still I wanted send this update and get a quick review to
ensure I am not wandering in weeds.

Thanks,
