Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD444D1BF
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 17:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfFTPLy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 11:11:54 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:32052 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726530AbfFTPLy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 11:11:54 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5KFAETN008735;
        Thu, 20 Jun 2019 10:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=+E0wMoXgtANfPgNVHGePiiLYU5TbQyJF2ObU7BlXm0k=;
 b=E78/6gUHyXXYCHMqO6EJ/3qHD1h0tZukzZkHdR4qGyLhPTwe7Ez44/LFxCvoRhgmxuau
 CHiJtQJMZq6y0C48bu0wWqgQDpDUkYsS9cRmD1UobLhgzZDR9kavFn2wEbi5eZ6O7MdO
 fES7jkj9LB/66QdZGmy+i6JKr0QBzosZ8P0mTNFfypl74rtQmW7Vz0sk78zUdKUH6SrB
 JjcaCqYH2o0vM8n4xAQuH36Pmqh65EzSnCO9BYWGsRoV6SRH0QbG+REDmZxFiVyqieHZ
 iRovODT2YWTLn+VzzpT++s1HYuC+D2svHz9FPz9cB3MLEvI3V50IqB/KY2MtWtuRMaWt MA== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t780ctnx2-1;
        Thu, 20 Jun 2019 10:11:48 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail4.cirrus.com (Postfix) with ESMTP id 3C828611C8AC;
        Thu, 20 Jun 2019 10:11:47 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 20 Jun
 2019 16:11:46 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 20 Jun 2019 16:11:46 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4CC1C44;
        Thu, 20 Jun 2019 16:11:47 +0100 (BST)
Message-ID: <1561043507.20348.26.camel@opensource.cirrus.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>, <linux-usb@vger.kernel.org>
Date:   Thu, 20 Jun 2019 16:11:47 +0100
In-Reply-To: <Pine.LNX.4.44L0.1906191024150.1596-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906191024150.1596-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906200111
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-06-19 at 10:40 -0400, Alan Stern wrote:
> On Wed, 19 Jun 2019, Oliver Neukum wrote:
> 
> > 
> > Am Dienstag, den 18.06.2019, 11:50 -0400 schrieb Alan Stern:
> > > 
> > > On Tue, 18 Jun 2019, Mayuresh Kulkarni wrote:
> > > 
> > > > 
> > > > > 
> > > > > You're right that the program needs to know when the device is
> > > > > about
> > > > > to 
> > > > > be suspended.  But waiting for an ioctl to return isn't a good
> > > > > way 
> > > > > to do it; this needs to be a callback of some sort.  That is,
> > > > > the 
> > > > > kernel also needs to know when the program is ready for the
> > > > > suspend.
> > > > > 
> > > > > I don't know what is the best approach.
> > > > This is becoming tricky now.
> > > Yes.  There probably are mechanisms already in use in other parts
> > > of 
> > > the kernel that would be suitable here, but I don't know what they
> > > are.  
> > > We could try asking some other people for advice.
> > Waiting for an ioctl() is horrible. If you really want to do this
> > poll() would be the obvious API. It is made for waiting for changes
> > of states.
> > 
> > [..]
> > > 
> > > The suspend callback is _not_ responsible for actually suspending
> > > the
> > > device; that is handled by the USB subsystem core.
> > > 
> > > These ideas are indeed applicable to programs using usbfs.  The
> > > kernel
> > Not fully. Usbfs has the same issue as FUSE here. Drivers are per
> > interface but power management is per device. Hence every driver
> > is in the block IO path for these issues. You cannot do block IO
> > in user space. The best you can do is notify of state changes,
> > but you cannot wait for them.
> usbfs access is per-device, not per-interface, but your point remains 
> valid.
> 
> > 
> > > 
> > > needs to have a way to inform the program that the device is about
> > > enter (or has just left) a low-power state, so that the program
> > > can
> > > stop (or start) trying to communicate with the device.  And the
> > > kernel 
> > > needs to know when the program is ready for the state change.
> > That has difficulties based in fundamental issues. We can let user
> > space block power transitions. We can notify it. But we cannot
> > block on it.
> > 
> > It would be easiest to export the usb_autopm_* API to user space.
> But ->suspend and ->resume callbacks are part of that API, and as you 
> say, it is not feasible to have these callbacks run in userspace.
> 
> The only solution I can think of is for the userspace program to first
> set the device's autosuspend delay to 0.  Then whenever the
> WAIT_FOR_RESUME ioctl returns -- even if it returns immediately -- the
> program should assume the suspend is over or is not going to happen.  
> Then the program can run normally for a short while (10 seconds,
> perhaps) before making another attempt to suspend.
> 

Looks like usb_autosuspend_delay parameter is applicable to all USB
devices. Also, since it is a module parameter, it might be tuned on a
particular platform (e.g.: from init.<vendor>.rc on Android).
So, I am not sure if it is good idea to rely on user-space to change it
and restore it to original value when the USB device of interest is
detached.

> The only change I would make to the patch posted earlier is to have 
> proc_wait_for_resume() call usb_autoresume_device() and set 
> ps->suspend_requested = false before returning.
> 
> Mayuresh, how does that sound?

With the code-changes you send me (in response to the
patch), usb_autoresume_device() will be called when the waiter
in proc_wait_for_resume() will return and send some message to "know"
why resume happened.

With above proposed change, proc_wait_for_resume() will return
with usb_autoresume_device() and suspend_requested = false. So when the
user-space will send some message to "know" resume reason, the checks in
ioctl() handler will be skipped.

(Apologies if above is obvious, but still wanted to comment so that we
are on same page).

With that said, I think there would be an issue with "host-wake" case as
below - the sequence of operations are:
- suspend ioctl called: assume actual bus suspend happens
- wait-for-resume ioctl called
- after a while user-space wants to send a message (due to end user
interaction for example)

Here the ioctl() will do usb_autoresume_device() since suspend_requested
= true. This will end up calling usbfs_notify_resume() which will
release waiter in proc_wait_for_resume(). And due to above proposed
change, it will end up calling usb_autoresume_device() again.

As a result, suspend will not happen for next suspend ioctl call.

So, looks like the original proposed change seems better here. On the
side note, I am still in process of verifying the code changes.

> 
> Alan Stern
> 
