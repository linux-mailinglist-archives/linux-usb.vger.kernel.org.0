Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7E15E708
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 16:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfGCOom (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 10:44:42 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:12004 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726598AbfGCOom (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jul 2019 10:44:42 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x63Ei4Xw022696;
        Wed, 3 Jul 2019 09:44:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=0J3tYmy3YVeLmdYYkVC+Lxcke1iBcAI4chrRtntchjw=;
 b=V8ZRenB3LUX7CJxwEl7uvNNIVGEdsQvNLfgvEuSPKzwjVVchbNQEu4x+p4vaD6ji0ONr
 KVjA5s/POnmFTvpa1qMAjZqhW3R+m5hnzN+pg+eq7CK4geOnP867q/U/UU4lEkJQUSHv
 rch6xcVOZ7UHA2ksrCADzvwGc6K/xjMhfVU/A7OgX92g4F1HYdtRhSHNtKoscRuoEmnO
 6Q4SleBGPiWJ7gTFqddI70DjjfgBntZOvGPGatI2xSI/wOYavh4MeALSvdbqkL4H3VmM
 Zra0K4vlYrml39zjVQXbNFWhFTwvWQxfZCUV0zTtW8njJcF95ze6XWxYwr5Jfa5z3BiX 1Q== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2te4dr6q7k-1;
        Wed, 03 Jul 2019 09:44:37 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail2.cirrus.com (Postfix) with ESMTP id 71BC1605A6A9;
        Wed,  3 Jul 2019 09:44:36 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 3 Jul
 2019 15:44:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 3 Jul 2019 15:44:35 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B05C82A1;
        Wed,  3 Jul 2019 15:44:35 +0100 (BST)
Message-ID: <1562165075.7481.27.camel@opensource.cirrus.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>, <linux-usb@vger.kernel.org>
Date:   Wed, 3 Jul 2019 15:44:35 +0100
In-Reply-To: <Pine.LNX.4.44L0.1906211319260.1471-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906211319260.1471-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907030181
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-06-21 at 15:28 -0400, Alan Stern wrote:
> On Fri, 21 Jun 2019, Mayuresh Kulkarni wrote:
> 
> However, I have been thinking about how to do all this in light of
> Oliver's comments, and it seems like we should make some changes.
> 
> First, let's change the ioctls' names.  Instead of RESUME and SUSPEND,
> I'll call them FORBID_SUSPEND and ALLOW_SUSPEND.  The way they work
> should be clear: ALLOW_SUSPEND will permit the device to be suspended
> but might not cause a suspend to happen immediately.  FORBID_SUSPEND
> will cause an immediate resume if the device is currently suspended
> and
> will prevent the device from being suspended in the future.  The new 
> names more accurately reflect what the ioctls actually do.
> 
> Second, the WAIT_FOR_RESUME ioctl will wait only until a resume has
> occurred more recently than the most recent ALLOW_SUSPEND ioctl.  So
> for example, if the program calls ALLOW_SUSPEND, and the device
> suspends, and then the device resumes, and then the device suspends
> again, and then the program calls WAIT_FOR_RESUME, the ioctl will
> return immediately even though the device is currently suspended.  
> Thus you don't have to worry about missing a remote resume.  This also
> means that when WAIT_FOR_RESUME returns, the program should call
> FORBID_SUSPEND to ensure that the device is active and doesn't go
> back 
> into suspend.
> 
> In practice, your program would use the ioctls as follows:
> 
> 	When the device file is opened, the kernel will automatically
> 	do the equivalent of FORBID_SUSPEND (to remain compatible 
> 	with the current behavior).
> 
> 	When the program is ready for the device to suspend, it will
> 	call the ALLOW_SUSPEND ioctl.  But it won't cancel the 
> 	outstanding URBs; instead it will continue to interact 
> 	normally with the device, because the device might not be 
> 	suspended for some time.
> 
> 	When the device does go into suspend, URBs will start failing
> 	with an appropriate error code (EHOSTUNREACH, ESHUTDOWN, 
> 	EPROTO, or something similar).  In this way the program will
> 	realize the device is suspended.  At that point the program
> 	should call the WAIT_FOR_RESUME ioctl and stop trying to 
> 	communicate with the device.
> 
> 	When WAIT_FOR_RESUME returns, the program should call the
> 	FORBID_SUSPEND ioctl and resume normal communication with the 
> 	device.
> 
> How does that sound?
> 
> The proposed patch is below.
> 
> Alan Stern
> 

Hi Alan,

With the 3-ioctl patch you had send, I checked the behaviour using my
test program on our reference platform.

AFAIU, the patch seems to work fine for our use-cases of: remote-wake
and host-wake.
For our typical use-cases, the user-space does not need to communicate
with the device even after calling ALLOW_SUSPEND, so I am not in
position to verify this point.

The test does the below steps -
----------------
A. REMOTE-WAKE -
----------------
1. Open the device file.
2. Find our interface and bind to it.
3. Send multiple commands to our interface.
4. Call ALLOW_SUSPEND.
5. Call WAIT_FOR_RESUME.
6. Wait for sometime (10-20 sec).
7. Do the activity on device which I know causes remote-wake to host.
8. Waiter in (5) above, calls FORBID_SUSPEND and reads the cause of
resume.
9. Release the interface and close the device file.

After (5) + auto-suspend time-out expires, I can see device, root-hub
and host-controller (DWC-3) going into suspend.
After (7), host-controller, root-hub and device resume are seen.

--------------
B. HOST-WAKE -
--------------
1. Open the device file.
2. Find our interface and bind to it.
3. Send multiple commands to our interface.
4. Spawn a thread to cause host-wake.
5. Call ALLOW_SUSPEND.
6. Call WAIT_FOR_RESUME.
7. Signal thread after a delay (10-20 sec).
8. Thread calls FORBID_SUSPEND and sends a command to device.
9. Release the interface, wait for thread-join and close the device
file.

After (6) + auto-suspend time-out expires, device, root-hub and host
controller goes into suspend.
After (8), host-controller, root-hub and device resume are seen. Also
the response to command is correct.

With that said, at this point, the above observations are in-sync with
what I had verified when I had send-out the old patch (with 2-ioctls and
interface based suspend-resume). I am checking if I can verify a bit
more complex use-cases. But not sure, if I can do that with current
setup.

As you had mentioned in one of the comment before, the only addition to
the patch I have locally is -
usbfs_notify_resume() has usbfs_mutex lock around list traversal.

Could you please send the patch for review? Please note, I think I am
not a part of linux-usb mailing-list, so probably need to be in cc to
get the patch email. Do let me know if something else is needed from me.

Thanks to You/Oliver/Greg KH for the all the comments and reviews.

