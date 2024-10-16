Return-Path: <linux-usb+bounces-16290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C1299FEB0
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 04:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 459731C211C2
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 02:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE52F157490;
	Wed, 16 Oct 2024 02:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ouCOuyuz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FA0148828
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 02:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729044726; cv=none; b=ZmimyxzCDR7wupc44HCeWcjf7VgaI7oH7CUZAAFOIjotfM20OrDMCCNUWji5J6K9+XSVOXxIQVCt3IRGqXkzQD7UZdHqCqzpFN4ZpwJQiUpkUaqW0uvczhoXDz+lcq1MCZa/ZasCMiCyYhqj3OYFFtdk+qZz4c59VtmuF/D1/D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729044726; c=relaxed/simple;
	bh=sBr9mMufHOqabBw+2rcaP+omYCJQO27prKEQqYG3GNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8+U+TSbXY6D7ELKkKdQsdX3/gQLiXnFoRuE1EoowLZVmKymbBSJNfuQrHJU6kNv6at8c45w7sNYQDybQuclCi0rfKNlsR45JKUmYH0UlG0eBtjQ4aLWdBfoi2cTgoTESr3Kfdro+pibrPFbsRot0G7DQzAWJrjGzYRlLIBhNNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ouCOuyuz; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-460391553ecso55762391cf.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 19:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729044723; x=1729649523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yUwdGX+2zTOjv5egzdPBTldhbh46MHE7qcc4wOB3EH8=;
        b=ouCOuyuzKXC0ihyGOzlbLMkw+sUI7P9r0Epu1ZsHhla0bA72L/7wvEb6B25pmXfV0e
         5cd3CwLrDR2JFjlh6G3d/Pu/yFj7TxZIbIEXomIt/ue4PtRlt0YnwkONk9imBTEQAxXu
         G7UEWEpOUcCjafO97S1HRrmTYb7iqJW1BGSJy1q9N0W9OR11khJFgbfFOzOULNm0XxhS
         5jBPMotk6M/n1qCGc2EiDZdRL+lLGErsxYLFc0CwviFay15rQswnHjL1fV1LXIKxsIw7
         OlgiLGc8VAD3PA45qVKfDVWfG272zaTz/67UtEZsPizU9QFnOLt0mKZZFx+HRJ2EBVGw
         bR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729044723; x=1729649523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUwdGX+2zTOjv5egzdPBTldhbh46MHE7qcc4wOB3EH8=;
        b=I0IwPIJS4yhs/BE7Q4WYpzHl9I8oofRZq1Nqc2FnzXSqjs/FeVtiXMkDM2/NbeXZHC
         TgOjnX6BhSRYrUkygVcPs7gB8ELy9OmxhSyjd3tWvkZcrGt4UXRynkoO36mH9h6vTu3a
         suEtSJmuIatI382I7qzpVwCwDLFDjftffDme8amILzbgpI+8FaW07WEoioZTaoAE08KH
         bZzQcrtHWGwZGM4IIWYqyXaUfyh9e5c/gD1cNrU+Cv+vpMe+qqtf/mjdnbItrd5neAsD
         zRd0YOaPEtaivqYckWbhqAQK4iE6yEctpNIAVMoXjslubsSI4DZD1CCc8Ox2wRYGomQV
         AIjg==
X-Forwarded-Encrypted: i=1; AJvYcCUpzA+ERp3fAenuH665YaRnsSupi9GNXlIgXOEdrVemKxJRvmHANDuVRnJVhnsaWsBGYi8ANOcc8Ig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xulYS/eRBqfRtA3g6Y9A1eDai3pyeuH80ZPxqlVWgON0FE8P
	kCkKoXT6dKsVpivqpyyuPaMRwCTjq3PWPwo4dsBIMDwuqYbGVgwxPJHkJQ6aJw==
X-Google-Smtp-Source: AGHT+IEa7TbxaGMxYHmqzc/KoTaiC1VvxjL1wqGDerWp9AXtA9NxfUbCb7FxDboKmdQJNRLw74JwkQ==
X-Received: by 2002:ac8:5852:0:b0:45f:bc9e:c69b with SMTP id d75a77b69052e-460583e8752mr245676111cf.1.1729044722847;
        Tue, 15 Oct 2024 19:12:02 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::7dde])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4607b38b505sm12324371cf.83.2024.10.15.19.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 19:12:01 -0700 (PDT)
Date: Tue, 15 Oct 2024 22:11:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
Message-ID: <fdf5d7f1-6037-4b55-9253-06a264641624@rowland.harvard.edu>
References: <8b9352a4-ce86-4313-b5a7-cc6ba987b506@rowland.harvard.edu>
 <670f1cba.050a0220.d9b66.015a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670f1cba.050a0220.d9b66.015a.GAE@google.com>

On Tue, Oct 15, 2024 at 06:54:02PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:

The console log shows that an URB must have been submitted at a time
that doesn't show.  Better add another debug tracer for submissions.

I'm getting there (slowly)...

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
+	dev_info(dummy_dev(dum_hcd), "%s\n", buf);
+}
+
 /*-------------------------------------------------------------------------*/
 
 /* DEVICE/GADGET SIDE UTILITY ROUTINES */
@@ -1303,9 +1351,12 @@ static int dummy_urb_enqueue(
 		urb->error_count = 1;		/* mark as a new urb */
 
 	/* kick the scheduler, it'll do the rest */
-	if (!hrtimer_active(&dum_hcd->timer))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+	if (!hrtimer_active(&dum_hcd->timer)) {
+		alandbg(dum_hcd, "start1", 1);
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
+	} else
+		alandbg(dum_hcd, "submit", 0);
 
  done:
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
@@ -1325,9 +1376,20 @@ static int dummy_urb_dequeue(struct usb_
 
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
+		if (rc == 0) {
+			if (!active)
+				alandump(dum_hcd);
+			alandbg(dum_hcd, "unlink", 0);
+		}
+	}
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
 	return rc;
 }
@@ -1813,10 +1875,12 @@ static enum hrtimer_restart dummy_timer(
 
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
@@ -1994,10 +2058,13 @@ return_urb:
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
@@ -2390,8 +2457,11 @@ static int dummy_bus_resume(struct usb_h
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
@@ -2490,6 +2560,10 @@ static int dummy_start(struct usb_hcd *h
 {
 	struct dummy_hcd	*dum_hcd = hcd_to_dummy_hcd(hcd);
 
+	int i;
+	for (i = 0; i < MAX_INFO; ++i)
+		dum_hcd->alaninfo[i].str = "";
+
 	/*
 	 * HOST side init ... we emulate a root hub that'll only ever
 	 * talk to one device (the gadget side).  Also appears in sysfs,
@@ -2521,6 +2595,7 @@ static void dummy_stop(struct usb_hcd *h
 {
 	struct dummy_hcd	*dum_hcd = hcd_to_dummy_hcd(hcd);
 
+	alandbg(dum_hcd, "cancel", 0);
 	hrtimer_cancel(&dum_hcd->timer);
 	device_remove_file(dummy_dev(dum_hcd), &dev_attr_urbs);
 	dev_info(dummy_dev(dum_hcd), "stopped\n");

