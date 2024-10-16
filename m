Return-Path: <linux-usb+bounces-16338-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7784C9A0CEE
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 16:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B37E1C21387
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 14:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE7A20CCCF;
	Wed, 16 Oct 2024 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="VYQevr2a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242C220C03B
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 14:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729089651; cv=none; b=DEvpomiAdnE5pFwY2EFb9WXIDbTqVkkXQLOoMRCKdysE3+go84eLYBwnaZkZNQR40j/NXW88OZbSMkXyAsVwm+mei/brjiQL6B2FS2Y6mQir3P1DSKr+FHJvxPQQU/MBJkAXdJWW7Q9fYajv0G1FMm1b7ShrmbikwBh49xVz/xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729089651; c=relaxed/simple;
	bh=ZiYb+FqzfBhGGIkvV890x2tQgA6eOOHN1KlpPl+SVRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhGuGP3CEqSNlWgZpVPBtz715Elf+ImfE+5QD35+5iwH1K/srTsuA0zGyQ5nfkn59yKHQ0vC0+axj5/YoPGZHzRFgJP08URloG+Xys4Uv49P95hkkt4WtoaFwCan9sCMxktQuiDs6LgalKP1DqLogBTLusNKYs0mcL0Km7ovuN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=VYQevr2a; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-6cbceb321b3so51518166d6.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 07:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729089649; x=1729694449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bKsQNFGRKJO4oJjIs70wVQIzsyPaEclsL3cnc/VLN/Y=;
        b=VYQevr2a84nfDxWhS5BROfF6Fs3BUWARwXThK9qeybp6rSC15fPrRtvtgBXDYPhDMH
         GbpYCb0Qxu0+uY/pNWJLlVA7fK8noZw/OBiSKTFF/bVRxxBmdpTyMzeqDb91lddIRcKs
         NLLcEpZC2nmpplQnthdK2DGlz5KDFNlDfSpjxOLtHsimFNjfIN0d3j2f0l2eZcaFGQ4l
         6zvG8cIJp4G2yG3syrcvpknrORLgGykwUEalKxMtfFLhJCYL/fRTJMe/crSFAPYv8+G7
         iVzIrYVe3JSfMTNYVFKfSUpxvm6GFZ+dFi/MxrYbVEoIpxBrTEA6XQ2mLJ86Jy6mVNbj
         RX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729089649; x=1729694449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKsQNFGRKJO4oJjIs70wVQIzsyPaEclsL3cnc/VLN/Y=;
        b=EaolAQsKVGWXPFOwxcW3WrLEevrS6IpMtbW7DTCovxTXgGkzF40xkW7t8E76rpLWYO
         f1cBCcCuuphissXdOB1xahRZ0H7qtlaTjZSZnop2ScHyF3/JCRLccqCLlFjcU49HEVCW
         ZDKVgWyjL0CjEDQSO3fheTFsuss0xEoKuDA3BLSE/43p92lA9ZCQdnfl6Xu+WL41gaHG
         JVE1bFkKDbdfTmqoBdqXJjSFIxjk3mNbEqDLojxChaGzaIolxJ+13Tu2pB/ISgHZaxMl
         ZM5Iv0j0JjLfOLXKPuF9EuzlgHl+IpcwKQkhx47siln7gwQMxRTBss6DmIAhdN4oBiNC
         NBBA==
X-Forwarded-Encrypted: i=1; AJvYcCUAgeWjndNKnNWmN4b0ZnCrpgv8UnEoipyEw/25sybpDVy2AzHO/KUkI8MetcLCCfrhJAbvDhbHj3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfiNa0dJPQH9gWeI9kd57BqZH2sIhuplprDOpdYfMHieR03dX5
	ehSgz/ns7yW6Y6DwKtLr91waGFqG+zl5JIgw6/poBs3/1jhOeC/PYS1JBXc18Q==
X-Google-Smtp-Source: AGHT+IGS42zmtmIqtJ25w3ePyP2fYi+iVTDN063hsmV0PFrwsm2RSVvHNkyX9rSnmNnFobmaIQTYEg==
X-Received: by 2002:a05:6214:398d:b0:6cb:fa32:6ac4 with SMTP id 6a1803df08f44-6cc2b8dfd3dmr50285586d6.30.1729089648975;
        Wed, 16 Oct 2024 07:40:48 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc22959ae2sm18727946d6.93.2024.10.16.07.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:40:48 -0700 (PDT)
Date: Wed, 16 Oct 2024 10:40:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
Message-ID: <c1145389-2695-41d9-ac30-f8819c2ff679@rowland.harvard.edu>
References: <fdf5d7f1-6037-4b55-9253-06a264641624@rowland.harvard.edu>
 <670f261a.050a0220.d9b66.015c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670f261a.050a0220.d9b66.015c.GAE@google.com>

On Tue, Oct 15, 2024 at 07:34:02PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:

Okay, the information in the console log confirms it.  The issue is 
definitely caused by the use of hrtimer_active() in dummy_urb_enqueue().  
This patch should be the correct solution.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
v6.12-rc3

---
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

