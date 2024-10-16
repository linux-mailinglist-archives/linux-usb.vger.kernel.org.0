Return-Path: <linux-usb+bounces-16344-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC89A0EC8
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 17:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0788928333E
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 15:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1294F20C002;
	Wed, 16 Oct 2024 15:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MGD2FDdE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB24118C920
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093491; cv=none; b=aXJ87XAx9FDLNCsGOk95kqvQkFXuxsxmlsx+2DFgRpq7Ip//1i4x8EAFUfPRG1/C2ODYcP5JQ4s9Ney7lcg0kMVATDJ1BgOtGKdyQ+M4hvO/nVUO0DoVeczLomq4jum9o5+CwmDaKULFBicjHP9A47y7jCtUtB4kP2A5Sq/EVXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093491; c=relaxed/simple;
	bh=USlb8r4XphmUQPNjp4n+kmlc6teNEfKXIxTNoe0mV9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FW0kBWooIvAlbMrNBcAc/7LPtkaoII1iGkid7scWAAMpXiarC1ULKxYfQZjJw8fa2+f4H735I8dG1Monbcd69hsuotfbD/8faf9yNWDk/LVgOrHPrWH0NQleIH8PyKb0Z6QNovx+cHwPGShEEM5kvIQjM2oe52udfPa7QsMOUns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MGD2FDdE; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-6cbf0769512so33845396d6.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 08:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729093488; x=1729698288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EehWpaaQG/XqqX7+MZE+g/Yu6w3H+0GmvWWqwgoWmUk=;
        b=MGD2FDdEworggsdFdQV8IXqkiju5cul1/TXjfyQD9IjVJ5EjelXNQJVufofdU7OLyN
         XKvFNS734lE+qv9Q3gsYj3QDcbYd1yFmOVaMERYGx7T4B0tkyhzt21S8N7Eft1qvj2he
         I/e3Y62podUObHIttz6oZxPfS0Z+gczTpfbI6C+v8x6g0OZCRPm9dqD1CWU7guFy0+40
         kbInTZkot0DP8mhCNuLwHpTruZ/xDzuBSbEnkCQlqbtEUWUhiYn/MQxlKpc0o3W1LPAq
         DnRRjfl7e/rHE2PIoRkeyvZ1psNqLYdOakzZyQOKm7yu8nk1w+LFg/a2GEo7kZwwfFFL
         dxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729093488; x=1729698288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EehWpaaQG/XqqX7+MZE+g/Yu6w3H+0GmvWWqwgoWmUk=;
        b=SyhIsDJpqvKhlkI/NvU2wi1hEY4TbrT+Mf4qXtUcT3LRX5JcGWZGmwHwHIuJL7KVi8
         W8pMMgOxWD+DU5E4VHQ4p35okXLrm1IqhsaSk6exBSao7ydlwEQJRRWbeIIC8VcxWpnY
         jBdGi5ZOubgpwhEs1dsLV5jb9n7uXNDpwfm+S7hzTh5/3WF8DYIzXcaWm/ifD22Hokhj
         +HgyWsCc82Zf7Rx1LfNSP3FmWM+Q4sr7+ln3FIaAvgYj9y9uHn5lkp9gLMOYY21+fF/f
         m3f7yjyBqcAWT1tkXfT8XV0V97FFfvxxWq4aTjSU8qFaQ7EQ8Nhe2HLqkq1/EYpof8m/
         BoPw==
X-Forwarded-Encrypted: i=1; AJvYcCVhrM80ZjtRsgBExRbJPNP0aNJMoWB6ZkbB4tOB/mG2BAPDVrQxqf1DM/tEMQhN3RYD6r5VeC3SqcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgmlIyFsFuWxEq894mZFZs5SdH3Pcy5Cs47d440F6J3xZcWxA
	kd5f8VKrC8Kj5I4axFVyy1BkuHMViAhwDCCvB8JrYvA3CEtxg1H8ng7m0OzdoQ==
X-Google-Smtp-Source: AGHT+IFrqy279fBnXM2l8x9bsrkIIAsa0STobqqeA+dUBMrED47fjhUrctE2kLSAkQ2AmDTy24flow==
X-Received: by 2002:a05:6214:5a0a:b0:6cb:e860:eae6 with SMTP id 6a1803df08f44-6cbefffce10mr222383106d6.5.1729093488455;
        Wed, 16 Oct 2024 08:44:48 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc2285bd39sm19384646d6.0.2024.10.16.08.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 08:44:47 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:44:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Marcello Sylvester Bauer <sylv@sylv.io>,
	USB mailing list <linux-usb@vger.kernel.org>,
	syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] USB: gadget: dummy-hcd: Fix "task hung" problem
Message-ID: <2dab644e-ef87-4de8-ac9a-26f100b2c609@rowland.harvard.edu>
References: <c1145389-2695-41d9-ac30-f8819c2ff679@rowland.harvard.edu>
 <670fd56c.050a0220.d9b66.016d.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670fd56c.050a0220.d9b66.016d.GAE@google.com>

The syzbot fuzzer has been encountering "task hung" problems ever
since the dummy-hcd driver was changed to use hrtimers instead of
regular timers.  It turns out that the problems are caused by a subtle
difference between the timer_pending() and hrtimer_active() APIs.

The changeover blindly replaced the first by the second.  However,
timer_pending() returns True when the timer is queued but not when its
callback is running, whereas hrtimer_active() returns True when the
hrtimer is queued _or_ its callback is running.  This difference
occasionally caused dummy_urb_enqueue() to think that the callback
routine had not yet started when in fact it was almost finished.  As a
result the hrtimer was not restarted, which made it impossible for the
driver to dequeue later the URB that was just enqueued.  This caused
usb_kill_urb() to hang, and things got worse from there.

Since hrtimers have no API for telling when they are queued and the
callback isn't running, the driver must keep track of this for itself.
That's what this patch does, adding a new "timer_pending" flag and
setting or clearing it at the appropriate times.

Reported-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/6709234e.050a0220.3e960.0011.GAE@google.com/
Tested-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: a7f3813e589f ("usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler")
Cc: Marcello Sylvester Bauer <sylv@sylv.io>
Cc: stable@vger.kernel.org

---

I expect this will fix a lot of the bugs that syzbot has found in the 
last few months.

 drivers/usb/gadget/udc/dummy_hcd.c |   20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -254,6 +254,7 @@ struct dummy_hcd {
 	u32				stream_en_ep;
 	u8				num_stream[30 / 2];
 
+	unsigned			timer_pending:1;
 	unsigned			active:1;
 	unsigned			old_active:1;
 	unsigned			resuming:1;
@@ -1303,9 +1304,11 @@ static int dummy_urb_enqueue(
 		urb->error_count = 1;		/* mark as a new urb */
 
 	/* kick the scheduler, it'll do the rest */
-	if (!hrtimer_active(&dum_hcd->timer))
+	if (!dum_hcd->timer_pending) {
+		dum_hcd->timer_pending = 1;
 		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
 				HRTIMER_MODE_REL_SOFT);
+	}
 
  done:
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
@@ -1324,9 +1327,10 @@ static int dummy_urb_dequeue(struct usb_
 	spin_lock_irqsave(&dum_hcd->dum->lock, flags);
 
 	rc = usb_hcd_check_unlink_urb(hcd, urb, status);
-	if (!rc && dum_hcd->rh_state != DUMMY_RH_RUNNING &&
-			!list_empty(&dum_hcd->urbp_list))
+	if (rc == 0 && !dum_hcd->timer_pending) {
+		dum_hcd->timer_pending = 1;
 		hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
+	}
 
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
 	return rc;
@@ -1813,6 +1817,7 @@ static enum hrtimer_restart dummy_timer(
 
 	/* look at each urb queued by the host side driver */
 	spin_lock_irqsave(&dum->lock, flags);
+	dum_hcd->timer_pending = 0;
 
 	if (!dum_hcd->udev) {
 		dev_err(dummy_dev(dum_hcd),
@@ -1994,8 +1999,10 @@ return_urb:
 	if (list_empty(&dum_hcd->urbp_list)) {
 		usb_put_dev(dum_hcd->udev);
 		dum_hcd->udev = NULL;
-	} else if (dum_hcd->rh_state == DUMMY_RH_RUNNING) {
+	} else if (!dum_hcd->timer_pending &&
+			dum_hcd->rh_state == DUMMY_RH_RUNNING) {
 		/* want a 1 msec delay here */
+		dum_hcd->timer_pending = 1;
 		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
 				HRTIMER_MODE_REL_SOFT);
 	}
@@ -2390,8 +2397,10 @@ static int dummy_bus_resume(struct usb_h
 	} else {
 		dum_hcd->rh_state = DUMMY_RH_RUNNING;
 		set_link_state(dum_hcd);
-		if (!list_empty(&dum_hcd->urbp_list))
+		if (!list_empty(&dum_hcd->urbp_list)) {
+			dum_hcd->timer_pending = 1;
 			hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
+		}
 		hcd->state = HC_STATE_RUNNING;
 	}
 	spin_unlock_irq(&dum_hcd->dum->lock);
@@ -2522,6 +2531,7 @@ static void dummy_stop(struct usb_hcd *h
 	struct dummy_hcd	*dum_hcd = hcd_to_dummy_hcd(hcd);
 
 	hrtimer_cancel(&dum_hcd->timer);
+	dum_hcd->timer_pending = 0;
 	device_remove_file(dummy_dev(dum_hcd), &dev_attr_urbs);
 	dev_info(dummy_dev(dum_hcd), "stopped\n");
 }

