Return-Path: <linux-usb+bounces-16143-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC27999B7D6
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 03:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 085621C20EDF
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 01:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BAD139E;
	Sun, 13 Oct 2024 01:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SKxKYV5e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0BE17FE
	for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 01:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728781786; cv=none; b=AMJndctihaJoOYA+llpRve/JsfYw3iAHlDs1Rc4i9hH0q0UL1yoSdm23ivzH5Q5SE2oD1AGNkzfQoe1s52YQHUk0fNr8oXaON9LF7Fu0WR7/g+7B11AuDdUSkDAL9f5vtpdcweCq1iFuwiDeTUVmD2UmTr0M4Bp9Pnn0MDwNtk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728781786; c=relaxed/simple;
	bh=i9l02zYzoPwEZ2PQuwyfyKNaFKIHe5dj14a4UP05FwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GP1gFwh2rWfnfL27cPCMrT0MFBnzn+88j7Cl6prJbKMS7zHZo0d6qeAl+aLTrKmVluWGbDsuT1/8/fF8RfkckoyJ9pk7q8kfTVMDGRkPjVojvLvdchMo0RjwebFLGSmjp81euzo28q7UF+6dnVk1+Z3n1Js51vRDFOUvE17xsww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SKxKYV5e; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b1205e0e03so102210385a.3
        for <linux-usb@vger.kernel.org>; Sat, 12 Oct 2024 18:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728781783; x=1729386583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L6Wj4IncaWW8DB4CSHkdscYzlwNbQVqFKfxtSoI7Rz0=;
        b=SKxKYV5e0PUHDDh985PfqI8Pasw3+WNVKpgrcSLyFOcvx/PJs3RCsX0TEdEATryBMr
         U0NzU8DPgqKtQvIKIuRXxZu65AJFD6NkCYLmX5ymfdpYe88S2mp63sOmhtFMRKD7A+sy
         e8UWYtaQH6c0WvjomMQuHm633YEheS8s+2a0KcXlr5VrOaaO2lg+2ZQFfDCbNTHp5JIb
         XOXMvfT3JB7p0B18zf5XnYb7imZjwEv46tkWysK7O5FdbASbm/qT1anGrvCnafH+rNrv
         PRHhCFE9fjs+cXW/torv1OVyRYfs2RtSmmxIZhIxAyb+LYiqPWzRDBV6BXfjUvJDhseZ
         1qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728781783; x=1729386583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6Wj4IncaWW8DB4CSHkdscYzlwNbQVqFKfxtSoI7Rz0=;
        b=Ll6BTHMBhQBORYKZ5Dw/xIn8G3dqV3mKinvQLKSJyWbacdgUNWVzHKcXyqvB6t1XMG
         xVuuZSwq+Pl3J3Zy8IskF853hEErSKtl71lbEUU3+ARsHRevLKs2eGamoKZIhM60RMAh
         4VUxnZ7PF3SSsmn2xpipN6UdwV2ye0P1x/ftThmROMODqwB9x3zvf23N/eB6kfrMav0A
         9jVA5138+MB02XbudeYnnvR/UfwtgOkAKTvCFSi4jhqprVLzyMia+tXF03GQtGDwMefX
         iO91Cc5RDBpEuw/Rz9b6NySJ/+3jv6y2XlxV6bUP+9/z1P3eMvBcQ1/jtC1DmnyRHfCy
         O6tw==
X-Forwarded-Encrypted: i=1; AJvYcCWNOmapM98fRcnmHz+FGPAomImvKcShTOScSUGaTRbJnKpvUw2V7+F7279svfurf6/lUV4H8kgP1/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiPFhHMyC3SMHxVrZDgq54ZGS6n2pp52M6Fz/4cdcjwICZWDT3
	ZlvMb14UvzPOYcGZaO8n2qcYAcTLSRsMQjpfN2lUWyb9Da555hd/hCsL7D/Klw==
X-Google-Smtp-Source: AGHT+IHmPHKh70uPFWArUWFNTndCs/54KaUXrdlh7yZErJ0yLwCs32+3VrI8HmMEvvCR6XxoJws4iQ==
X-Received: by 2002:a05:620a:2622:b0:7b1:1cf6:cfb9 with SMTP id af79cd13be357-7b11cf6d056mr1046812085a.55.1728781783183;
        Sat, 12 Oct 2024 18:09:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::31c2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b11498a26dsm272143285a.136.2024.10.12.18.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 18:09:42 -0700 (PDT)
Date: Sat, 12 Oct 2024 21:09:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, sylv@sylv.io,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
Message-ID: <7d3e0f43-ec5a-4448-aff6-d17a46341844@rowland.harvard.edu>
References: <b84d31a3-4353-4506-903a-04f1e1b8cbda@rowland.harvard.edu>
 <6709cd5b.050a0220.4cbc0.001a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6709cd5b.050a0220.4cbc0.001a.GAE@google.com>

On Fri, Oct 11, 2024 at 06:14:03PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> INFO: task hung in usb_port_suspend

Okay, let's do some closer tracking of URBs waiting to be dequeued.

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
@@ -1325,9 +1326,13 @@ static int dummy_urb_dequeue(struct usb_
 
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
+		dev_info(udc_dev(dum_hcd->dum), "Failed dequeue\n");
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
 	return rc;
 }
@@ -1788,6 +1793,7 @@ static enum hrtimer_restart dummy_timer(
 	unsigned long		flags;
 	int			limit, total;
 	int			i;
+	int			alancnt = 0;
 
 	/* simplistic model for one frame's bandwidth */
 	/* FIXME: account for transaction and packet overhead */
@@ -1984,6 +1990,9 @@ return_urb:
 			ep->already_seen = ep->setup_stage = 0;
 
 		usb_hcd_unlink_urb_from_ep(dummy_hcd_to_hcd(dum_hcd), urb);
+		if (dum->alanflag)
+			dev_info(udc_dev(dum), "Give back %p\n", urb);
+		++alancnt;
 		spin_unlock(&dum->lock);
 		usb_hcd_giveback_urb(dummy_hcd_to_hcd(dum_hcd), urb, status);
 		spin_lock(&dum->lock);
@@ -1995,11 +2004,14 @@ return_urb:
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

