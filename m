Return-Path: <linux-usb+bounces-33177-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJECMrc3iWk34gQAu9opvQ
	(envelope-from <linux-usb+bounces-33177-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 02:26:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EEE10ACD4
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 02:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85E4B300A122
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 01:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33962221FCD;
	Mon,  9 Feb 2026 01:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="T2sdgLCs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8961DC997
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 01:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600367; cv=none; b=R8EfQNNSCMTrmM1vZBEvcpKzd0rh3EKGt++JMORN42m/0QixvZubQMpvUbgg9BTlEC8QSUVqICqV62Eri9lXqEekMtbK6LQLsfoTsMHBwbS5TZnXFkPwWFEsAt0Hv2rMysQ0/FDTZ0+xFTcPZOkkQZGs1l9NrDgkP7QPYCYAiXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600367; c=relaxed/simple;
	bh=0KtdRfyPbBBArJUuxiUCH2vyjJa7AE/dwhbii/XlDQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGHy87cda2ucekSFZ1WPfF0pQJmoD4hNLKzHgfHzMs6wnOAGhdKTt9+Wx66UGxcq48jxNDYKmPXJQ3hGcThgvESZZQRsY+LXUQULloFVZRihWvv5bsEsFX7tyhbVN2cgUmLq5Je6rSzRPc3+d211rcnHDmUoRwxSCW6rSrXDKyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=T2sdgLCs; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c9f6b78ca4so360946585a.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 17:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770600366; x=1771205166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EYXHf20imRCsJIuJG37Rswxg6Kdii0W7CSkV0m0yf0Y=;
        b=T2sdgLCse3vyOfbNt+4HFST2sciXTvC9aGMlm0BxQNnZHo+xQnvuYBXWy51IQa2BnK
         CYx7wXPMrCZRSQrQ//1zWlMvWfe5rnmxRvubwgjBH5YrJva3fp0xetVsLNW33Au3VMc5
         xW0TrZI/nuk8DAC8zx0cYth5HTaapYgTbAPV0nupNzxoPiit/0pTjowxzQ4VUF+f/2uh
         IxyhEBYTaMjTj62BZ7iDn5ZnDpSgA8tuLY6qI5e1YAqlsIqVxHdgbBOIoqQLJyzCsgMb
         bneWnIBFN4fswS5P6EdTHO/JCsGpaF77dQWxeUp7gQU+HRMg1u5p5YF4TioPa8+2zSPi
         wdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770600366; x=1771205166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYXHf20imRCsJIuJG37Rswxg6Kdii0W7CSkV0m0yf0Y=;
        b=EFYnmX3LOf9srqc+1DWGkzvRXfy2ZhYbv7nsIN7JvAlzo0DHoX11UupppKEzEpE81d
         y9GipQ4M5JaP4LAitFF3ayxyGVtL1eY4rbroGooy+O3opmdIiWaYItZbj0zqtwjOyj0F
         dH8EE8mm/JHehTRlGhm+2Hak4IUGweqSPmnd3nA/Rlo4OfKYiHcHBzbdnTno7Mh4H8kc
         yrs4Dyhrxp3cnsBq8tiarUJ6EwUFZfL+Wqe4mjW5QKvClwUCZXZzilocmWpGpTCNjXQf
         g5oPm7QvWviLTJ/AbTMWLtn4W+YwX19YHCrrycPYFu7hCAJL9higEUmJmyFuvFXFmncn
         LeTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmcRjHJuOYuXG9CPNMxVqT/wOM1VnZsicYnw3JXJA2eA2z4kkIIaOICSXce75fOIeXtPNl37QgoRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YycCXMUNCkmDmyLnpQhHdQOInlWAldTRb1BWopXKMnU2rPrFwul
	tekPyn2FiXO78YPBOVoUIBkVCi50pBOXqLlu/5jZ/mbpYAiTmebCBCxUfMY8lIr7rXqVFC/KEZS
	ku8Q=
X-Gm-Gg: AZuq6aJm9fB+rQvKVw4/am97LDgUkPO9Gf2R8HK4Ic+LMalGSet8oLTil+KvDqqDhmP
	95eSy1KXgbLDnaG+v/B4Y6Zkcjmiliuw+Y1st22BWsTVMrTd5tW9s4ev/86JXcU9SjWY7zJMkIn
	/c18A6yoNC6WXzq81fjTIepYPAdQ2hoJ2NEgqcd+ksZo0KH2V3BaDnQtCsXVsEHj9P56llozJha
	wb3bUgI1ZTk1ClPCi5j52BsU5VhDsMlF2XY4V+6/PyA8fr/S270Cb0+VbrYm6BCjlky3XdlQwnG
	dZSM5DfAD30Fx0bfNzdx2uerOmK7D2fe3MyMiBuFy86VOFq10imkvL/j6vI2qgRcUHBm32rOMLj
	BfWuaFsTQ0632pQiAmWEfjC3QjLNR4appdU/zZ78VIs9cF/4vdNJ9vNnxlwaTtLmNplBukKvkYe
	53dMQqlksk6W7o
X-Received: by 2002:a05:620a:3188:b0:8ca:2cf9:81a0 with SMTP id af79cd13be357-8caf10243f3mr1270572685a.51.1770600366364;
        Sun, 08 Feb 2026 17:26:06 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c03f501sm67455326d6.36.2026.02.08.17.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:26:05 -0800 (PST)
Date: Sun, 8 Feb 2026 20:26:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
Cc: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
Message-ID: <0b508f72-7248-479c-ad26-b9385e52c094@rowland.harvard.edu>
References: <f0d78b66-4022-4b65-ad38-86daec39bc7e@rowland.harvard.edu>
 <698905be.050a0220.3b3015.0061.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <698905be.050a0220.3b3015.0061.GAE@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,googlegroups.com];
	TAGGED_FROM(0.00)[bounces-33177-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:mid,rowland.harvard.edu:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,25ba18e2c5040447585d];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 31EEE10ACD4
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 01:53:02PM -0800, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> INFO: task hung in usb_bulk_msg

All right, that clinches it.  There's no problem with hardware or a 
device driver; the problem is that a kernel thread is stuck in an 
uninterruptible wait state for a very long time.

Hopefully this patch will prevent that from happening.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git da87d45b1951

Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -25,6 +25,8 @@
 
 #include "usb.h"
 
+#define MAX_UNINTERRUPTIBLE_TIMEOUT_MS	60000
+
 static void cancel_async_set_config(struct usb_device *udev);
 
 struct api_context {
@@ -42,16 +44,16 @@ static void usb_api_blocking_completion(
 
 
 /*
- * Starts urb and waits for completion or timeout. Note that this call
- * is NOT interruptible. Many device driver i/o requests should be
- * interruptible and therefore these drivers should implement their
- * own interruptible routines.
+ * Starts urb and waits for completion or timeout.  Timeout lengths <= 0
+ * are taken to be as long as possible.
+ * The wait is NOT interruptible if the timeout period is no longer than
+ * MAX_UNINTERRUPTIBLE_TIMEOUT_MS, otherwise it IS interruptible.
  */
 static int usb_start_wait_urb(struct urb *urb, int timeout, int *actual_length)
 {
 	struct api_context ctx;
 	unsigned long expire;
-	int retval;
+	int rc, retval;
 
 	init_completion(&ctx.done);
 	urb->context = &ctx;
@@ -60,8 +62,14 @@ static int usb_start_wait_urb(struct urb
 	if (unlikely(retval))
 		goto out;
 
-	expire = timeout ? msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOUT;
-	if (!wait_for_completion_timeout(&ctx.done, expire)) {
+	expire = (timeout > 0) ? msecs_to_jiffies(timeout) :
+			MAX_SCHEDULE_TIMEOUT;
+	if (expire <= msecs_to_jiffies(MAX_UNINTERRUPTIBLE_TIMEOUT_MS))
+		rc = (wait_for_completion_timeout(&ctx.done, expire) > 0);
+	else
+		rc = (wait_for_completion_interruptible_timeout(
+				&ctx.done, expire) > 0);
+	if (!rc) {
 		usb_kill_urb(urb);
 		retval = (ctx.status == -ENOENT ? -ETIMEDOUT : ctx.status);
 

