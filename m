Return-Path: <linux-usb+bounces-16145-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 014E999B803
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 04:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF80B282AD6
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 02:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5391879F0;
	Sun, 13 Oct 2024 02:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ka/5Nx7q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B317C9
	for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 02:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728787401; cv=none; b=ESt5KrEGlnX+vy2iREzo4VjC7UIwfhXwxu/CNt8y4XlskNv5Z5vquIsoZtrpVEC0gQySMd60/HIi8EwqmjECFSNEuMCDuFdaD8aezrMf7TFdiMu2h38YuyRP4HOCRqY1uQ/iwVHtZZB2C9RMCcuv5oi6jzRHqy9AizPa6ESTK0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728787401; c=relaxed/simple;
	bh=6F+68vjIBwfoYVMlm3uKnWFwFp+LTIS7b4nB4gCQKxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUQrbi0dJJkHbORMlh1wbQgcvp/vCfuO9/4nvVAbmquV9ayokzx/KZ8p9JiLjJZWI/xudZBbUryv+bAz9gGS1ipznjCQexacx3co++kkwP4Onjmq3eI2zQDyZnfmpaRJKyb398GwwfPzdTEOmOvv7HL3d1D2iCM1nkjEzNVRJ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ka/5Nx7q; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-45f07eb6f5fso30439141cf.1
        for <linux-usb@vger.kernel.org>; Sat, 12 Oct 2024 19:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728787398; x=1729392198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyxH6Nfnu2/JoosSpMRVdNhUvnOYCX+uWCmiXGa8o2Q=;
        b=ka/5Nx7qT+V7r9xPOAVRu8jDOKuTUc5pcv2kQ1lUVPA92c3WH+mqmhWm5MivJxu2hC
         DbR7nISJX+3ylF8QOFf29uxcyK6y7xjSXugS/Ox0QN9yNE3QmJK0qGRJlz2//vC/+ZEz
         HLhLuGWKlulQwqpx9QxPqpGNqGflzVjX6p1unjAsSuhacSgCIFLiWrFnVQpEg9UN4JRn
         E0PYJ5YkKGTL7XnhmmaHXjrp4bIzH7a+prhX6cOxcENknG8Guvt85mT6USxs8ZjFDNl3
         JljPC8qXXXulv8C+utZuIcCcqypY2PGdjCHZxFh81r5NJHGMZ9GiIhdZD0Bvz//2i6Wu
         6Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728787398; x=1729392198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyxH6Nfnu2/JoosSpMRVdNhUvnOYCX+uWCmiXGa8o2Q=;
        b=OiRXPKm/TRfVHDqWMaLoCDa1XcZ8qih8EGOpNur8WKdPz18e6jz0cDqfQ9FQsD5PR/
         GafpaiAgpb2tC69TZrLKT+BIxfQipHoX0DL8BPI4hFRSMdf94C7o0QY1pBpcPduBiNG+
         VNriYP/vGjQiosTlUKwjpZ05sGJaWivWjn7VZ6/gtmcpGGCZetnKaA39QlZ5s8QhNfqZ
         A63+eX9mNfEJ5MASCoN2NajwWNN0snlZsBJY2gPu/RK/MEjWerMYu0nfNQszBiiGYzJI
         vtAiVS2KU+GO4+D5Xc5HZO0jzCzzDdqxUt2b9PSICm/q1j4kABg5xATzUrwJ3l4bTOYV
         nqWg==
X-Forwarded-Encrypted: i=1; AJvYcCWvPb929yDkr53XEADWIT7++ImsVYXE+4Hr4+qg4L/QxZakH1p/i6nDuxtJD/8qt25hlD5FJVYHU60=@vger.kernel.org
X-Gm-Message-State: AOJu0YysSAb9DQDjVtxdvRJxxXwLk2h03gwqqY1Esvec4N5LCzq9/7Tn
	v3br25of/2t4g1W5eqWI45vYy1TUyiFUuvk1rn3XJgZpCPwDPO5Q9S7FzTmD76Vnx0bUhRIJpWo
	=
X-Google-Smtp-Source: AGHT+IEoJU1FDwrCICFr0YVIk3x003KX3ZX5TVzSYz2DphXhTJzDtZNwD/q+lao6z6+Lgbsxgw05kg==
X-Received: by 2002:a05:622a:1a26:b0:458:25ec:68cf with SMTP id d75a77b69052e-4603f5b8c01mr181808971cf.13.1728787397660;
        Sat, 12 Oct 2024 19:43:17 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::31c2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b114955ff0sm280176285a.84.2024.10.12.19.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 19:43:16 -0700 (PDT)
Date: Sat, 12 Oct 2024 22:43:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, sylv@sylv.io,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
Message-ID: <d6ec3898-b225-4c92-a381-46b111b6ddcf@rowland.harvard.edu>
References: <7d3e0f43-ec5a-4448-aff6-d17a46341844@rowland.harvard.edu>
 <670b2bfd.050a0220.3e960.0031.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670b2bfd.050a0220.3e960.0031.GAE@google.com>

On Sat, Oct 12, 2024 at 07:10:05PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> INFO: task hung in usb_register_dev

The console log shows a lot of dequeue failures.  Let's find out why 
they are failing.

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
@@ -276,6 +276,7 @@ struct dummy {
 	unsigned			ints_enabled:1;
 	unsigned			udc_suspended:1;
 	unsigned			pullup:1;
+	bool				alanflag;
 
 	/*
 	 * HOST side support
@@ -1304,7 +1305,7 @@ static int dummy_urb_enqueue(
 
 	/* kick the scheduler, it'll do the rest */
 	if (!hrtimer_active(&dum_hcd->timer))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
 
  done:
@@ -1325,9 +1326,15 @@ static int dummy_urb_dequeue(struct usb_
 
 	rc = usb_hcd_check_unlink_urb(hcd, urb, status);
 	if (!rc && dum_hcd->rh_state != DUMMY_RH_RUNNING &&
-			!list_empty(&dum_hcd->urbp_list))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
-
+			!list_empty(&dum_hcd->urbp_list)) {
+		dum_hcd->dum->alanflag = true;
+		dev_info(udc_dev(dum_hcd->dum), "Dequeue %p\n", urb);
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
+				HRTIMER_MODE_REL_SOFT);
+	} else
+		dev_info(udc_dev(dum_hcd->dum), "Failed dequeue: %d %d %d\n",
+				rc, dum_hcd->rh_state,
+				list_empty(&dum_hcd->urbp_list));
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
 	return rc;
 }
@@ -1788,6 +1795,7 @@ static enum hrtimer_restart dummy_timer(
 	unsigned long		flags;
 	int			limit, total;
 	int			i;
+	int			alancnt = 0;
 
 	/* simplistic model for one frame's bandwidth */
 	/* FIXME: account for transaction and packet overhead */
@@ -1984,6 +1992,9 @@ return_urb:
 			ep->already_seen = ep->setup_stage = 0;
 
 		usb_hcd_unlink_urb_from_ep(dummy_hcd_to_hcd(dum_hcd), urb);
+		if (dum->alanflag)
+			dev_info(udc_dev(dum), "Give back %p\n", urb);
+		++alancnt;
 		spin_unlock(&dum->lock);
 		usb_hcd_giveback_urb(dummy_hcd_to_hcd(dum_hcd), urb, status);
 		spin_lock(&dum->lock);
@@ -1995,11 +2006,14 @@ return_urb:
 		usb_put_dev(dum_hcd->udev);
 		dum_hcd->udev = NULL;
 	} else if (dum_hcd->rh_state == DUMMY_RH_RUNNING) {
-		/* want a 1 msec delay here */
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
 	}
 
+	if (dum->alanflag) {
+		dev_info(udc_dev(dum), "Gave back %d URBs\n", alancnt);
+		dum->alanflag = false;
+	}
 	spin_unlock_irqrestore(&dum->lock, flags);
 
 	return HRTIMER_NORESTART;
@@ -2391,7 +2405,8 @@ static int dummy_bus_resume(struct usb_h
 		dum_hcd->rh_state = DUMMY_RH_RUNNING;
 		set_link_state(dum_hcd);
 		if (!list_empty(&dum_hcd->urbp_list))
-			hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
+			hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
+					HRTIMER_MODE_REL_SOFT);
 		hcd->state = HC_STATE_RUNNING;
 	}
 	spin_unlock_irq(&dum_hcd->dum->lock);

