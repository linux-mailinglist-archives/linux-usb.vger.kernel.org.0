Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D77119AF
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2019 15:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfEBNEM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 May 2019 09:04:12 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:57006 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726282AbfEBNEM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 May 2019 09:04:12 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x42Ct92x028048;
        Thu, 2 May 2019 08:04:08 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2s6xhv2w54-1;
        Thu, 02 May 2019 08:04:08 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail2.cirrus.com (Postfix) with ESMTP id 08843605A699;
        Thu,  2 May 2019 08:04:08 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 2 May
 2019 14:04:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 2 May 2019 14:04:07 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5B40E45;
        Thu,  2 May 2019 14:04:07 +0100 (BST)
Message-ID: <1556802247.8016.16.camel@opensource.cirrus.com>
Subject: Re: Query on usb/core/devio.c
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     USB list <linux-usb@vger.kernel.org>
Date:   Thu, 2 May 2019 14:04:07 +0100
In-Reply-To: <1556035954.6050.1.camel@opensource.cirrus.com>
References: <Pine.LNX.4.44L0.1904011620370.1506-100000@iolanthe.rowland.org>
         <1556035954.6050.1.camel@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905020090
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-04-23 at 17:12 +0100, Mayuresh Kulkarni wrote:
> On Mon, 2019-04-01 at 16:22 -0400, Alan Stern wrote:
> > 
> > Mayuresh:
> > 
> > Whatever happened to this discussion?  Did you reach a decision on 
> > whether the proposed API addition would suit your needs?
> > 
> > Alan Stern
> Hi Alan,
> 
> Apologies for not being able to respond to this email thread before.
> Around mid-Dec of 2018, I got allocated to some other completely different
> project for couple of months.
> 
> Just at the of start of Apr 2019, I am back to the USB-audio project and this
> discussion.
> So almost perfect timing for your nudge.
> 
> I am in process of setting up my environment and should have some result at-
> most 
> by early next week. I am attempting to verify the use-case of suspend/resume
> with: host wake and remote wake.
> 
> Thanks again for your nudge.
> 

Hi Alan et al,

I added the proposed IOCTLs of suspend/resume to the platform I am using
internally. With that, I am able to verify below cases -
1. suspend -> wait-for-resume: resume caused by remote-wake from our USB device
2. suspend -> wait-for-resume: resume caused by host-wake (i.e. my test
application sends a message to our USB device).

In both the instances, after wait-for-resume, I can see host scheduling L2 and
actual L2 happens after the auto-suspend time-out expires (I am using default
value for it).

Below are the URB snoops for each case -

Remote-wake -
Here I cause the remote-wake activity on our USB-device approx. 20 sec after
calling wait-for-resume.

[  218.299803] usb 1-1: ioctl-suspend
[  218.299978] usb 1-1: wait-for-resume

[  222.022157] msm-dwc3 a800000.ssusb: DWC3 in low power mode

[  239.065016] msm-dwc3 a800000.ssusb: DWC3 exited from low power mode

[  239.145063] usb 1-1: driver-resume: runtime-active = 1
[  239.145444] usb 1-1: wait-for-resume...done

Host-wake -
Here I send the new command approx. 8 seconds after calling wait-for-resume.

[  152.760438] usb 1-1: ioctl-suspend
[  152.760717] usb 1-1: wait-for-resume

[  156.068823] msm-dwc3 a800000.ssusb: DWC3 in low power mode

[  160.765638] usb 1-1: suspended..resume now

[  160.768442] msm-dwc3 a800000.ssusb: DWC3 exited from low power mode

[  160.823889] usb 1-1: driver-resume: runtime-active = 1
[  160.823998] usb 1-1: resume done..active now

With that said, shall I send a patch of above changes for review, rebased to
usb-next branch - https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
/log/?h=usb-next?

Thanks,

> > 
> > 
> > 
> > On Tue, 20 Nov 2018, Mayuresh Kulkarni wrote:
> > 
> > > 
> > > 
> > > On Fri, 2018-11-16 at 11:08 -0500, Alan Stern wrote:
> > > > 
> > > > 
> > > > On Fri, 16 Nov 2018, Mayuresh Kulkarni wrote:
> > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > Thanks for the comments. Based on the info so far, attempting to
> > > > > summarize
> > > > > the
> > > > > probable solution, to ensure that I understand it clearly -
> > > > > 
> > > > > Facts -
> > > > > 1. USBFS driver grabs a PM ref-count in .open and drops it in .close
> > > > > which
> > > > > means
> > > > > USB device cannot suspend untill user-space closes it (even if all
> > > > > interface
> > > > > drivers report "idle" to usb-core).
> > > > > 2. Since the .ioctl "knows" that .open has ensured to keep device
> > > > > active, it
> > > > > does not call PM runtime APIs.
> > > > > 
> > > > > Proposal -
> > > > > 1. Add new ioctl: suspend & wait-for-resume
> > > > > 2. suspend ioctl: decrements PM ref count and return
> > > > > 3. wait-for-resume ioctl: wait for resume or timeout or signal
> > > > Do you really want to have a timeout for this ioctl?  Maybe it isn't 
> > > > important -- I don't know.
> > > > 
> > > Agreed, the timeout probably is not needed in this proposal.
> > > 
> > > > 
> > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > 4. Modify .ioctl implementation to do PM runtime calls except for
> > > > > above
> > > > > "new"
> > > > > ioctl calls (so pm_runtime_get_sync -> ioctl -> response ->
> > > > > pm_runtime_put_sync). This also means, pm runtime get/put will be in
> > > > > both
> > > > > .open/.close.
> > > > That's not exactly what I had in mind.  Open will do:
> > > > 
> > > > 	ps->runtime_active = true;
> > > > 
> > > > The new suspend ioctl will do this:
> > > > 
> > > > 	if (ps->runtime_active) {
> > > > 		usb_autosuspend_device(ps->dev);
> > > > 		ps->runtime_active = false;
> > > > 	}
> > > > 
> > > > and the old ioctls (and close) will do this at the start:
> > > > 
> > > > 	if (!ps->runtime_active) {
> > > > 		if (usb_autoresume_device(ps->dev))
> > > > 			return -EIO;	/* Could not resume */
> > > > 		ps->runtime_active = true;
> > > > 	}		
> > > > 
> > > > This means that after any interaction with the device, you will have to 
> > > > call the suspend ioctl again if you want the device to go back to 
> > > > sleep.
> > > > 
> > > Thanks, looks good.
> > > 
> > > > 
> > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > Use-case analysis -
> > > > > 1. Remote-wake: Due to device's remote wake, wait-for-resume will
> > > > > return
> > > > > successfully. The user space caller then need to queue a request to
> > > > > "know"
> > > > > the
> > > > > reason of remote-wake.
> > > > > 2. Host-wake: The user-space caller issues any ioctl supported by
> > > > > .ioctl
> > > > > method.
> > > > > Due to (4) above, the device will be resumed and the ioctl will be
> > > > > performed.
> > > > Correct.
> > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > For (2) in use-case analysis, the user-space caller's wait-for-resume
> > > > > will
> > > > > also
> > > > > return, but since it knows that it has initiated the ioctl, it may or
> > > > > may
> > > > > not
> > > > > decide to queue a request. Instead, when ioctl returns it can call
> > > > > wait-
> > > > > for-
> > > > > resume again.
> > > > Yes.  Of course, your app will have some way to check for user
> > > > interaction with the device.  Doing these checks while the device is
> > > > suspended would be counter-productive, since the check itself would
> > > > wake up the device.  So you will probably want to do a check as soon as
> > > > you know the device has woken up, regardless of the cause.  If you 
> > > > don't, you run the risk of not noticing a user interaction.
> > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > Am I getting in sync with your comments?
> > > > > 
> > > > > What issue(s) you anticipate in above proposal due to inherent race
> > > > > condition
> > > > > between host and remote-wake?
> > > > Only what I mentioned above, that your program should check for user 
> > > > interaction whenever it knows the device has woken up.
> > > > 
> > > Thanks, looks good.
> > > 
> > > > 
> > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > Based on my meagre understanding of usb-core, it feels
> > > > > like usb_lock_device/usb_unlock_device calls around remote-wake and
> > > > > usbfs
> > > > > ioctl
> > > > > should help with race condition, right?
> > > > No, they will not help.  This is not a race between two different parts
> > > > of the kernel both trying to communicate with the device; it is a race
> > > > between the kernel and the user.  usb_lock_device doesn't prevent the 
> > > > user from interacting with the device.  :-)
> > > > 
> > > > Alan Stern
> > > I will go back and review this proposal internally. Possibly also attempt
> > > to
> > > implement a quick version of it and see how it behaves. Will keep this
> > > email
> > > thread posted with relevant updates.
> > > 
> > > Thanks Alan and Oliver for the all inputs and comments so far.
