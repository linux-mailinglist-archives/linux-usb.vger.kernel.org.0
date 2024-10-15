Return-Path: <linux-usb+bounces-16247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF96A99F733
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 21:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F5B31C208A3
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 19:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6A11EC006;
	Tue, 15 Oct 2024 19:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="j24sqayp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309D71F80D7
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 19:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729020191; cv=none; b=U3pRGUaQWdAjbutjiNvNRRgB7ylJJtAZst+o0ME5WWsD8mYL0gfvf5Q6HW3I0qmXR7JGrf2t18Ue5tEZX2mvI4VX1AK2VUuMIwwC2hHMlmMbUVIyIvA8bgD3UYKq7ccy44kJ4mQf8GmKjwn56lK4ashLrr05ZvxurIEnZ7B/boc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729020191; c=relaxed/simple;
	bh=nuqVM5Pa10hgz7nFmmFVgpfYVQK/w/7stNQsizNYTCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYQTdxuGgOWxDTKS6Mh8VtV5QOiUUTTR3YrmwmkwQN2b6tUKiUAzu1KCZdg6pm0rH5OAxIMSXZdfNEcLF7dKDLNlkQEZ5yBAxxYxxjzvZ+OkXjukehhHiRNAu7X1n6izz/Hp2yKROO7mBvp+eGUpSmWnuOE2mOzZfivL+QKMhiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=j24sqayp; arc=none smtp.client-ip=209.85.160.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-4604b48293dso1785821cf.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 12:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729020187; x=1729624987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X7dB0pxitQeFgVMBRDLTWgDRQeKiGn5TxSEiu8/oYsk=;
        b=j24sqaypQsHAZpYbBD5eymoPomxCMouELlnwaHUtTAlFX517tTU31ifg1sAmN3GhOW
         FaEkv652ye3abptu3JNUfYYhSKRNiOlC3HiMaa6i0WWXv9Nbbs0tHR1RvdSf3VoJZHPP
         5Z7BnOjQ5T6QBkDBfb/0CGNxrHnKKdQ3qZaHfM0ccVWIVS6ooIsXIMouP9kzhHewKSr8
         n0bzJhcoA4TsZpFTkiaExDoqfIw9Yujti9QQ0w1hau6Omd+gH0ekt7MQRfMwz5OrKKrK
         JwkWCDClbAqlASxe8JAUEYzphVoWUHS+a07NeUksQCLA90xKwiUOku7RHzfuo+nJjTVU
         ADuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729020187; x=1729624987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7dB0pxitQeFgVMBRDLTWgDRQeKiGn5TxSEiu8/oYsk=;
        b=ml/h4EMJQgrutlfCts25Q1sQeqzxeHEFnTaKSkfB4bXAe4DQJvygvIp1ptdjBsztNb
         J40VAet4g9xKq3h/j28H33YxM6H2UUHzu3KJBws0ore07ZbwJtzpZ5dHLmJHw730OsD3
         ihmtlc8GDAvW4iMQfBipRUbbuDtsI1Z5ilYhEuCyqGlrB5NeLWKOHxWF1aLZCmwh1O4y
         hD54D5PFYHFkSdiLqMMreaiUbFS5JGzPBg+ifmRzWdHlYOptB8kPa4+lHX4QMATSe6hR
         L5dHEkp1dtXQAusasgnB99gw0tpi8ejD+KgJLmZFo8klHtjaXzi2VRtwU7xJksN3UNc7
         pSmg==
X-Forwarded-Encrypted: i=1; AJvYcCWZavF4hIyVl1TO1P2u/7kR6Ij4b3MT/juW3YhaPRQRJrSJEq73B2kxDRy+5vdJ1IFM/vggeBbnMNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQXulgMAFIR5OpkjJv5aDrE5tnJv6FcUy/DaR7LSAI1tLeS+mH
	iEz6cfSYoLasru5arw49w1v+AG/UFC1QnIW7xtIYzSj/3W5Lc2Rp8J4lkpijnA==
X-Google-Smtp-Source: AGHT+IEVMyd7eXgnEAfRqhwHnQdq3N+kpUIcnL/4s3rKrsYnYBtTrSPgs4TfkC0BqoBAVv/3K1YqoA==
X-Received: by 2002:a05:622a:c4:b0:458:3162:2262 with SMTP id d75a77b69052e-46089ada3f9mr30640441cf.4.1729020186916;
        Tue, 15 Oct 2024 12:23:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4607d89942csm9261411cf.54.2024.10.15.12.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 12:23:06 -0700 (PDT)
Date: Tue, 15 Oct 2024 15:23:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
Message-ID: <c3d59f87-bb72-46d9-94b8-7441b837bf13@rowland.harvard.edu>
References: <6ae97ef8-bcbe-448a-9276-ad21631e43dc@rowland.harvard.edu>
 <670e820b.050a0220.d5849.0007.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670e820b.050a0220.d5849.0007.GAE@google.com>

On Tue, Oct 15, 2024 at 07:54:03AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:

No good; the console log shows that the timer must have been activated
and then stopped during a period that wasn't printed in the log.  This
next patch tries to print out more of the history.  Will it be enough?

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git v6.12-rc3

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -50,7 +50,7 @@
 #define POWER_BUDGET	500	/* in mA; use 8 for low-power port testing */
 #define POWER_BUDGET_3	900	/* in mA */
 
-#define DUMMY_TIMER_INT_NSECS	125000 /* 1 microframe */
+#define DUMMY_INT_KTIME	ns_to_ktime(125000)	 /* 1 microframe */
 
 static const char	driver_name[] = "dummy_hcd";
 static const char	driver_desc[] = "USB Host+Gadget Emulator";
@@ -239,6 +239,12 @@ enum dummy_rh_state {
 	DUMMY_RH_RUNNING
 };
 
+struct alaninfo {
+	const char *		str;
+	int			starts, stops;
+};
+#define MAX_INFO	16
+
 struct dummy_hcd {
 	struct dummy			*dum;
 	enum dummy_rh_state		rh_state;
@@ -257,6 +263,10 @@ struct dummy_hcd {
 	unsigned			active:1;
 	unsigned			old_active:1;
 	unsigned			resuming:1;
+
+	struct alaninfo			alaninfo[MAX_INFO];
+	int				alanindex;
+	int				starts, stops;
 };
 
 struct dummy {
@@ -323,6 +333,44 @@ static inline struct dummy *gadget_dev_t
 	return container_of(dev, struct dummy, gadget.dev);
 }
 
+void alandbg(struct dummy_hcd *dum_hcd, const char *str, int type);
+void alandbg(struct dummy_hcd *dum_hcd, const char *str, int type)
+{
+	int			i = dum_hcd->alanindex;
+	struct alaninfo		*info = &dum_hcd->alaninfo[i];
+
+	if (type == 1)
+		++dum_hcd->starts;
+	else if (type == 2)
+		++dum_hcd->stops;
+	info->str = str;
+	info->starts = dum_hcd->starts;
+	info->stops = dum_hcd->stops;
+
+	if (++i >= MAX_INFO)
+		i = 0;
+	dum_hcd->alanindex = i;
+}
+
+void alandump(struct dummy_hcd *dum_hcd);
+void alandump(struct dummy_hcd *dum_hcd)
+{
+	int			i = dum_hcd->alanindex;
+	int			j;
+	struct alaninfo		*info = &dum_hcd->alaninfo[i];
+	char			*p, buf[4 * 24];
+
+	p = buf;
+	for (j = 0; j < 4; ++j) {
+		if (--i < 0)
+			i = MAX_INFO - 1;
+		info = &dum_hcd->alaninfo[i];
+		p += sprintf(p, "%s %d %d  ",
+				info->str, info->starts, info->stops);
+	}
+	dev_info(dummy_dev(dum_hcd), "%s\n", p);
+}
+
 /*-------------------------------------------------------------------------*/
 
 /* DEVICE/GADGET SIDE UTILITY ROUTINES */
@@ -1303,9 +1351,11 @@ static int dummy_urb_enqueue(
 		urb->error_count = 1;		/* mark as a new urb */
 
 	/* kick the scheduler, it'll do the rest */
-	if (!hrtimer_active(&dum_hcd->timer))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+	if (!hrtimer_active(&dum_hcd->timer)) {
+		alandbg(dum_hcd, "start1", 1);
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
+	}
 
  done:
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
@@ -1325,9 +1375,17 @@ static int dummy_urb_dequeue(struct usb_
 
 	rc = usb_hcd_check_unlink_urb(hcd, urb, status);
 	if (!rc && dum_hcd->rh_state != DUMMY_RH_RUNNING &&
-			!list_empty(&dum_hcd->urbp_list))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
-
+			!list_empty(&dum_hcd->urbp_list)) {
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
+				HRTIMER_MODE_REL_SOFT);
+		alandbg(dum_hcd, "start2", 1);
+	} else {
+		int active = hrtimer_active(&dum_hcd->timer);
+		dev_info(dummy_dev(dum_hcd), "Dequeue norestart: %d %d active %d\n",
+				rc, list_empty(&dum_hcd->urbp_list), active);
+		if (rc == 0 && !active)
+			alandump(dum_hcd);
+	}
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
 	return rc;
 }
@@ -1813,10 +1871,12 @@ static enum hrtimer_restart dummy_timer(
 
 	/* look at each urb queued by the host side driver */
 	spin_lock_irqsave(&dum->lock, flags);
+	alandbg(dum_hcd, "handler1", 0);
 
 	if (!dum_hcd->udev) {
 		dev_err(dummy_dev(dum_hcd),
 				"timer fired with no URBs pending?\n");
+		alandbg(dum_hcd, "handler2", 2);
 		spin_unlock_irqrestore(&dum->lock, flags);
 		return HRTIMER_NORESTART;
 	}
@@ -1994,10 +2054,13 @@ return_urb:
 	if (list_empty(&dum_hcd->urbp_list)) {
 		usb_put_dev(dum_hcd->udev);
 		dum_hcd->udev = NULL;
+		alandbg(dum_hcd, "handler3", 2);
 	} else if (dum_hcd->rh_state == DUMMY_RH_RUNNING) {
-		/* want a 1 msec delay here */
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		alandbg(dum_hcd, "handler-start", 1);
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
+	} else {
+		alandbg(dum_hcd, "handler4", 2);
 	}
 
 	spin_unlock_irqrestore(&dum->lock, flags);
@@ -2390,8 +2453,11 @@ static int dummy_bus_resume(struct usb_h
 	} else {
 		dum_hcd->rh_state = DUMMY_RH_RUNNING;
 		set_link_state(dum_hcd);
-		if (!list_empty(&dum_hcd->urbp_list))
-			hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
+		if (!list_empty(&dum_hcd->urbp_list)) {
+			alandbg(dum_hcd, "start3", 1);
+			hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
+					HRTIMER_MODE_REL_SOFT);
+			}
 		hcd->state = HC_STATE_RUNNING;
 	}
 	spin_unlock_irq(&dum_hcd->dum->lock);
@@ -2490,6 +2556,10 @@ static int dummy_start(struct usb_hcd *h
 {
 	struct dummy_hcd	*dum_hcd = hcd_to_dummy_hcd(hcd);
 
+	int i;
+	for (i = 0; i < MAX_INFO; ++i)
+		dum_hcd->alaninfo[i].str = "";
+
 	/*
 	 * HOST side init ... we emulate a root hub that'll only ever
 	 * talk to one device (the gadget side).  Also appears in sysfs,
@@ -2521,6 +2591,7 @@ static void dummy_stop(struct usb_hcd *h
 {
 	struct dummy_hcd	*dum_hcd = hcd_to_dummy_hcd(hcd);
 
+	alandbg(dum_hcd, "cancel", 0);
 	hrtimer_cancel(&dum_hcd->timer);
 	device_remove_file(dummy_dev(dum_hcd), &dev_attr_urbs);
 	dev_info(dummy_dev(dum_hcd), "stopped\n");

