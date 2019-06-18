Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5A24A32F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 16:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbfFROAs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 10:00:48 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:54528 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728575AbfFROAs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 10:00:48 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5IE07x8019759;
        Tue, 18 Jun 2019 09:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=mzsPWKTayiprjyfmJjIGyI82hs6NJm6g9nnvl4/leiM=;
 b=BiL9jKMWhJDCezu+1b/tb5mBD/JZKeoPnkh1OXlpb9ZqIiw+rP22JgqgKiGN1z39GTbm
 ui3i+W/2IpjdTO8Ndh0+BecHEMA7N5uQiDctUeG0QVQ7fsbJpAY5/x9amXi9ueaxjjN1
 qTw/yl5n+Nipamee1PE8v16ijl5TBRItsIWxAE/IzcdamFDimrv4sCUsbycIsIs8RCjj
 qihWI6a3R1FADjDjq4EkrRvBKB220clj/+ivUqb6WjETyAyWkHSD/udpB1tBIgd5RV+/
 VCs1PxHCixNjioYFomZhjnoU3bv8dozWSKmH5zeBiaQEoAogPa4GHmrXrmAUsP+jpWGV ng== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t4w3juq58-1;
        Tue, 18 Jun 2019 09:00:42 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail1.cirrus.com (Postfix) with ESMTP id E3003611C8AF;
        Tue, 18 Jun 2019 09:00:41 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 18 Jun
 2019 15:00:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 18 Jun 2019 15:00:41 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 300B744;
        Tue, 18 Jun 2019 15:00:41 +0100 (BST)
Message-ID: <1560866441.8425.8.camel@opensource.cirrus.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <oneukum@suse.com>
Date:   Tue, 18 Jun 2019 15:00:41 +0100
In-Reply-To: <Pine.LNX.4.44L0.1906171119130.1738-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906171119130.1738-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906180115
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2019-06-17 at 11:55 -0400, Alan Stern wrote:
> On Mon, 17 Jun 2019, Mayuresh Kulkarni wrote:
> 
> > 
> > > 
> > > (Note: I imagine you might run into trouble because devices
> > > generally 
> > > do not get put into runtime suspend immediately.  So if you call
> > > the 
> > > USBDEVFS_SUSPEND ioctl and then the USBDEVFS_WAIT_FOR_RESUME
> > > ioctl,
> > > the 
> > > wait will return immediately because the device hasn't yet been 
> > > suspended.)
> > > 
> > Hi Alan,
> > 
> > For this particular comment, how about we add suspend-waiter similar
> > to
> > resume-waiter?
> > As per the below changes, usbfs_notify_suspend() can wake the
> > suspend-
> > waiter, if generic_suspend() is called. So, the suspend ioctl will
> > be
> > partial blocking i.e.: it will wait till suspend happens and will
> > return
> > when it is safe to do resume.
> > 
> > Will this work?
> Probably not.  Just think about it: Your program stops communicating
> with the device and tells the kernel that it's ready for the device to
> be suspended.  But the device doesn't go into suspend for several
> seconds (or longer!) and during that time your program has no idea
> what's happening to it.  I'm pretty sure that's not what you want.
> 

Right, sounds good. Thanks.

> You're right that the program needs to know when the device is about
> to 
> be suspended.  But waiting for an ioctl to return isn't a good way 
> to do it; this needs to be a callback of some sort.  That is, the 
> kernel also needs to know when the program is ready for the suspend.
> 
> I don't know what is the best approach.

This is becoming tricky now.

> 
> > 
> > The reason for asking this is - I think the suspend ioctl should
> > return
> > appropriate status to user-space indicating weather to wait-for-
> > resume
> > or not.
> > 
> > Or are you suggesting to always have a delay in suspend/resume in
> > user-
> > space?
> > 
> > Please do review my comment below in this context too.
> > 
> > In a typical SoC based system (XHCI compliant USB host controller
> > with
> > one port exposed out on PCB), wouldn't this
> > call usbfs_notify_suspend()
> > twice - first for udev of connected device and then for udev of
> > root-
> > hub?
> Yes, it would.  This wouldn't make any difference to your program, 
> since your program would have an open file reference only for the 
> connected device, not for the root hub.
> 
> > 
> > If yes, how about we call usbfs_notify_*() for root-hubs only? That
> > would be a good indication of suspend/resume since root-hubs will be
> > suspended last while resumed first.
> > 
> > Will that work?
> No.  Remember, this mechanism has to work on non-SoC systems
> too.  And 
> even on an SoC, it's possible that your device is just one of several 
> plugged into an external hub.  So your device might be suspended
> while 
> the others remain active; then the root hub would not be suspended.
> 

I think my point is - usbfs driver is actually doing nothing w.r.t USB-
2.0 L2 state, right? The root-hub's suspend will invoke the USB-2.0 L2
transitions. This will happen when all the USB devices on that port
report idle to USB-core.
I agree that usually driver's suspend/resume call-back will put the
device in its low power state. But that is not applicable to udev of
usbfs driver, right?

So, doesn't it makes sense to tell user-space about actual USB-2.0 L2
state transitions rather than suspend/resume entry call-backs of device-
driver model of kernel (which are stub in this context)?

> Alan Stern
> 
