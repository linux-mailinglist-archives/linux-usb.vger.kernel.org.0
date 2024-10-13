Return-Path: <linux-usb+bounces-16159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C099BB3A
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 21:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 433F4B211ED
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 19:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7504A149E0E;
	Sun, 13 Oct 2024 19:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WZBtCr6Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DFC1332A1
	for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 19:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728847460; cv=none; b=f4h4uBb6WlpAe4+qI1XNeIGb0qdJNsjSWXE9owJ88q6FrcW18OlwOPHIn9Dh4swufNFsWbKP7ikWjOmbJz4oTuncfLVFJ9c8+KSvC0DiWcfC7/qwu7xsFD8jHuXxd0U7SZFr9AOXmvHP3MHynbemextJmKZGDDjpV6owA/yMCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728847460; c=relaxed/simple;
	bh=UoinomxZryOOdSWiFeKT7nns0U2y0SKMK2nrNKBev7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyVAPlHKi5Oebf8Hi5IfuyRpbFhIUlVUWQ6NMc3OcbJV/St0cW65MOiImCqqxly5zrhv2BYUejrzCuRTLq9cQ38DmZcLfgSq3NvHpKvhyOavKVIGnGt4Pi8VCGV5TQ25qaoIkBE965zFiaOoCT3noFXlvPF2q/78gJxuWlqme+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WZBtCr6Z; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cbd005d0f9so36796206d6.3
        for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 12:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728847458; x=1729452258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRVwu6bWIn9AV99AJHz9Pv5GxwIR9LqRGHICqynMQic=;
        b=WZBtCr6ZCjB6kZ7oicldZa2mXLMfs4PrNPct5dzcR7sfbjkeP6JyYQg+m2KOBaRREq
         gkUV3gKKpvJlgDev85uYHR2xpveBihTg5l5OEvfVTH54YGMKSdIkzzpIf65kjWysxd2J
         QTbglT1pmX49DzcY9TvS2e+r4OW2LphxflxHd8Mx7Tw9thldvWs0G8Q8eLRxVvTuxida
         TM44NzfSm9sU5TKTsAehWYbdR/mhc2OB7lS3aavMovEBl3y7nj54NfGjYu2O91cs8ZnM
         md79c0i9p2AMrg08PxImTjcL0ZZRHC7zBaziey72+KBpWyOZDbxaFE7t1Qkyinkh7nJy
         ncRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728847458; x=1729452258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRVwu6bWIn9AV99AJHz9Pv5GxwIR9LqRGHICqynMQic=;
        b=EtVZtLFvX+2ABRh1vYcf26LcV1JVzV5t6yrDWgDRcye6cWm4oDxmJvV38zmekqh8qb
         /WOjuemG94CehqDBQrIiCJNsPa7jA7bPVOjJ0hgLIYbYjaU3l1goDitmJwymZS83cpSq
         Ew2CYiwqSgjtkXqIBBGaxyiYHuhmAuoEQP0VLVcZk2CApUXyhtQKHrmF6hqd8lstI8HI
         HqQn+otaty+0gxg9AKJ41/Cff0Ze3/1xP8Ub2BXUkhDQet8bRbNfeDlLrsjzbA5tJJTa
         TTYsp/2UMkub2S8gUz5ZN9qRdzBUKQFWnFi92jHeM1FE8H70hpIRtEgeBtz5goz1kWYY
         ZlmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFRNelxEjxIuVdjSAb866dMcj5S3KVNrrj+3YBBNpEk+CY2g8MSNZWlvOqTJAFjbQ4koAE+W0o1T0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxojZl1JEuzTW87fP3P4Zl2eoEfEED+ySYNugxQXKWZDW4h+NRU
	66kYBm3vUINbxro+mSMJAkazHxES2CJfMsOEjJCH7RZUQB4nyeXSiAplJFwTrg==
X-Google-Smtp-Source: AGHT+IHyD3EuTqc2dltgjMvligqWWHbJujvIyC2ZSkIegJmmaWOJWXaw0/wPab5fQJpMPfW0rzsHRw==
X-Received: by 2002:a05:6214:5346:b0:6c5:ab33:5244 with SMTP id 6a1803df08f44-6cbf9d24a55mr76273086d6.31.1728847458116;
        Sun, 13 Oct 2024 12:24:18 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::267d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8608d73sm37856366d6.89.2024.10.13.12.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 12:24:17 -0700 (PDT)
Date: Sun, 13 Oct 2024 15:24:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, sylv@sylv.io,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
Message-ID: <6751f648-a622-4562-9ca4-5bdf79dd72fb@rowland.harvard.edu>
References: <2329dfa9-ef76-491a-a4aa-277230a0a96a@rowland.harvard.edu>
 <670c138b.050a0220.4cbc0.0038.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670c138b.050a0220.4cbc0.0038.GAE@google.com>

On Sun, Oct 13, 2024 at 11:38:03AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Evidently there's still too much debugging output.  Reduce it even more.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
usb-testing

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
@@ -257,6 +257,8 @@ struct dummy_hcd {
 	unsigned			active:1;
 	unsigned			old_active:1;
 	unsigned			resuming:1;
+
+	bool				alanflag;
 };
 
 struct dummy {
@@ -1304,7 +1306,7 @@ static int dummy_urb_enqueue(
 
 	/* kick the scheduler, it'll do the rest */
 	if (!hrtimer_active(&dum_hcd->timer))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
 
  done:
@@ -1325,9 +1327,15 @@ static int dummy_urb_dequeue(struct usb_
 
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
+	dum_hcd->alanflag = true;
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
 	return rc;
 }
@@ -1813,6 +1821,8 @@ static enum hrtimer_restart dummy_timer(
 
 	/* look at each urb queued by the host side driver */
 	spin_lock_irqsave(&dum->lock, flags);
+	if (dum_hcd->alanflag)
+		dev_info(dummy_dev(dum_hcd), "Timer handler\n");
 
 	if (!dum_hcd->udev) {
 		dev_err(dummy_dev(dum_hcd),
@@ -1984,6 +1994,8 @@ return_urb:
 			ep->already_seen = ep->setup_stage = 0;
 
 		usb_hcd_unlink_urb_from_ep(dummy_hcd_to_hcd(dum_hcd), urb);
+		if (dum_hcd->alanflag)
+			dev_info(dummy_dev(dum_hcd), "Giveback %p\n", urb);
 		spin_unlock(&dum->lock);
 		usb_hcd_giveback_urb(dummy_hcd_to_hcd(dum_hcd), urb, status);
 		spin_lock(&dum->lock);
@@ -1995,11 +2007,11 @@ return_urb:
 		usb_put_dev(dum_hcd->udev);
 		dum_hcd->udev = NULL;
 	} else if (dum_hcd->rh_state == DUMMY_RH_RUNNING) {
-		/* want a 1 msec delay here */
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
 	}
 
+	dum_hcd->alanflag = false;
 	spin_unlock_irqrestore(&dum->lock, flags);
 
 	return HRTIMER_NORESTART;
@@ -2391,7 +2403,8 @@ static int dummy_bus_resume(struct usb_h
 		dum_hcd->rh_state = DUMMY_RH_RUNNING;
 		set_link_state(dum_hcd);
 		if (!list_empty(&dum_hcd->urbp_list))
-			hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
+			hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
+					HRTIMER_MODE_REL_SOFT);
 		hcd->state = HC_STATE_RUNNING;
 	}
 	spin_unlock_irq(&dum_hcd->dum->lock);

