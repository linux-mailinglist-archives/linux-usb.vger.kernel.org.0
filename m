Return-Path: <linux-usb+bounces-16153-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2262999BA2A
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 17:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A47561F21A39
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 15:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D26146A83;
	Sun, 13 Oct 2024 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ry56uMoc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D8A2233B
	for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728834342; cv=none; b=VBptJS52I6joPmGFvO0XYTYaICq8W6kkSDmsA9tL1hJnpFjUgzhj3gYU7gvma2dD3W+v5212jB70V34bcWmHSnFkFUFq5k/MXJjBHpPxmkPBlVDYmhFXGYBfBsMUFX43saVmo9YurRklgAWWJNh8Uht/q9HnuyF+oW1527toils=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728834342; c=relaxed/simple;
	bh=i/DY3mhU2pxw4OTAHA8k6x78Ggp2g4lk1tFdvOq98fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOH4iq40ZRiMww6yf2HRxWVxg8w60+z118mho2GeJZTY0Yz5o/mWKT43oGg4coDSn7r/NvWN+q5P6MUAF+XTP63X5mUavmfSTrhdMwLgaHWdBzPRMeK1/WVDHSPZYAfauPWyGgBZF4cQQDvlbkGScD4q5jaXjs/wdgHjJ6oVXuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ry56uMoc; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46040dadedfso38421171cf.1
        for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 08:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728834339; x=1729439139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8SvD6v7uKWM+otPCqk6qcKNiIZiWYx99QHNwbTfGSpA=;
        b=ry56uMocPya4BlvFa7U53mVDfuebYqPpqBKRJR6YMhQctMRkRxOuecim7vbttu+EcN
         C3z+NIiLPTyAbkICDi8DjOWe4l424+vwnDHhRjWSRbm9tiliqmaY/Mh6jDkq3QNY0fwV
         JK38CvdgudG+utGJHNR79/Zux27xAWHuUPhEOWntiTcjVOSVn6C+9D84GLOW5KgZBsSd
         vWv8kE996wR+OgNomp4rhsMgFUqKArfpGYGiL8CrT8qcckUkGJZKyVY6lFGRgwGuZCxd
         Gwq+azFRyBPTZhlf1awZSASVjmYhORBnTavGd0ZShmKyowCszF/8vywNJYhuEAc2Ecjl
         KGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728834339; x=1729439139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SvD6v7uKWM+otPCqk6qcKNiIZiWYx99QHNwbTfGSpA=;
        b=N7MaSFhDADiiIOk5MbwUuxRYGfzJO8ExnhSLTt+EyE0/ZQnpkfblFtRhyvRQifBt5C
         sFgJsFY20s6UcuayX2/KGOkQMxgKPD/EA+xFMgVaaGbsZCRC6eEAajP4H/V3xyDiIc0O
         hMtPtr4eBIecVdgmGI6H8RWqeSYfEmH2jt83FBKBAYfURpXPF9a2ou4lbVTSaFMKwp50
         gEj501Zz+yjt/bSnDt57gpM+DEqfeq+YxkxLGmzN7lEChTr7zgG63lXHoxtO0W5n4U+P
         CTYnXgMxaHFbAafMR4sS2C4H6XVov8u0679PsPKveFm47AmFSDe8fzzLYqIEalStu37x
         g+tw==
X-Forwarded-Encrypted: i=1; AJvYcCU605aydicIkKyAqbM6gDBl+hHt13nXmhRLhpYPmGfEJ5O033omQ+3mxTvgXqqlZaZIAJK52By5aWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTDBYGmqyRAM+SnRkCYpaRYtcXDQHZwWao0BdkBsneEJVoAWbs
	STrA+JcyDv7l9+7mEJK54ZzYN0/TZ3IYuV+HBckK+cdo3DfmyoXLpB70d9TgWA==
X-Google-Smtp-Source: AGHT+IGKCWv/OymimaQSREKTcz1uxMnGvjMFtCWOQpytzs5mzzsuouHIwhCP/sr7xnDygy4jWMezAQ==
X-Received: by 2002:a05:622a:4d92:b0:45d:8600:1a8e with SMTP id d75a77b69052e-4604bb95fcamr148966171cf.3.1728834339208;
        Sun, 13 Oct 2024 08:45:39 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::267d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460427d5220sm35438701cf.32.2024.10.13.08.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 08:45:38 -0700 (PDT)
Date: Sun, 13 Oct 2024 11:45:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, sylv@sylv.io,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
Message-ID: <11dd2a9d-2f1d-4cac-976c-90a1b0ee667e@rowland.harvard.edu>
References: <5d7f23a2-dd39-432c-9908-174f6fffda0b@rowland.harvard.edu>
 <670be0ea.050a0220.3e960.0040.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670be0ea.050a0220.3e960.0040.GAE@google.com>

On Sun, Oct 13, 2024 at 08:02:02AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> INFO: task hung in usb_register_dev

All right, that's more like it.  Now there's a smoking gun:

> INFO: task kworker/0:3:6517 blocked for more than 144 seconds.
>       Not tainted 6.12.0-rc1-syzkaller-00028-gd73dc7b182be-dirty #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/0:3     state:D stack:24240 pid:6517  tgid:6517  ppid:2      flags:0x00004000
> Workqueue: pm pm_runtime_work
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5315 [inline]
>  __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
>  __schedule_loop kernel/sched/core.c:6752 [inline]
>  schedule+0xe7/0x350 kernel/sched/core.c:6767
>  usb_kill_urb.part.0+0x1ca/0x250 drivers/usb/core/urb.c:713
>  usb_kill_urb+0x83/0xa0 drivers/usb/core/urb.c:702
>  usb_start_wait_urb+0x255/0x4c0 drivers/usb/core/message.c:65
>  usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
>  usb_control_msg+0x327/0x4b0 drivers/usb/core/message.c:154

Unforunately the URB not getting dequeued _is_ a control URB.  So
let's trace enqueues and dequeues for all URBs.  And let's see when
the timer handler runs.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing

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
@@ -1301,10 +1301,12 @@ static int dummy_urb_enqueue(
 		dum_hcd->next_frame_urbp = urbp;
 	if (usb_pipetype(urb->pipe) == PIPE_CONTROL)
 		urb->error_count = 1;		/* mark as a new urb */
+	dev_info(dummy_dev(dum_hcd), "Enqueue %p type %d\n", urb,
+		usb_pipetype(urb->pipe));
 
 	/* kick the scheduler, it'll do the rest */
 	if (!hrtimer_active(&dum_hcd->timer))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
 
  done:
@@ -1325,9 +1327,14 @@ static int dummy_urb_dequeue(struct usb_
 
 	rc = usb_hcd_check_unlink_urb(hcd, urb, status);
 	if (!rc && dum_hcd->rh_state != DUMMY_RH_RUNNING &&
-			!list_empty(&dum_hcd->urbp_list))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
-
+			!list_empty(&dum_hcd->urbp_list)) {
+		dev_info(dummy_dev(dum_hcd), "Dequeue restart %p\n", urb);
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
+				HRTIMER_MODE_REL_SOFT);
+	} else {
+		dev_info(dummy_dev(dum_hcd), "Dequeue norestart: %d %p\n",
+				rc, urb);
+	}
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
 	return rc;
 }
@@ -1813,6 +1820,7 @@ static enum hrtimer_restart dummy_timer(
 
 	/* look at each urb queued by the host side driver */
 	spin_lock_irqsave(&dum->lock, flags);
+	dev_info(dummy_dev(dum_hcd), "Timer handler\n");
 
 	if (!dum_hcd->udev) {
 		dev_err(dummy_dev(dum_hcd),
@@ -1984,6 +1992,7 @@ return_urb:
 			ep->already_seen = ep->setup_stage = 0;
 
 		usb_hcd_unlink_urb_from_ep(dummy_hcd_to_hcd(dum_hcd), urb);
+		dev_info(dummy_dev(dum_hcd), "Giveback %p\n", urb);
 		spin_unlock(&dum->lock);
 		usb_hcd_giveback_urb(dummy_hcd_to_hcd(dum_hcd), urb, status);
 		spin_lock(&dum->lock);
@@ -1995,8 +2004,7 @@ return_urb:
 		usb_put_dev(dum_hcd->udev);
 		dum_hcd->udev = NULL;
 	} else if (dum_hcd->rh_state == DUMMY_RH_RUNNING) {
-		/* want a 1 msec delay here */
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
 	}
 
@@ -2391,7 +2399,8 @@ static int dummy_bus_resume(struct usb_h
 		dum_hcd->rh_state = DUMMY_RH_RUNNING;
 		set_link_state(dum_hcd);
 		if (!list_empty(&dum_hcd->urbp_list))
-			hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
+			hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
+					HRTIMER_MODE_REL_SOFT);
 		hcd->state = HC_STATE_RUNNING;
 	}
 	spin_unlock_irq(&dum_hcd->dum->lock);

