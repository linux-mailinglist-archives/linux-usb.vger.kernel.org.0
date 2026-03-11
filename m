Return-Path: <linux-usb+bounces-34512-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id P97QCYvKsGm/nAIAu9opvQ
	(envelope-from <linux-usb+bounces-34512-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 02:51:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B825A82E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 02:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FD1D3160167
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 01:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFB1283C89;
	Wed, 11 Mar 2026 01:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="b8HvDSrY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863E42620E5
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 01:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773193863; cv=none; b=XiVw6/d2n2A7Al/C/2rQdg3IofnnkRIYoNQ3aRTEuAsaGuixyRqCtw7A6RiJGaI5URTz0XHDSkq1leHfRwukBt59D/gZR2JK31ZmGJ0EsrpK9kClrJstfjP9spAFCFI11Bik2Z2zN7P9+kF5TVnPbyntXGKEoYxUkNQTmCg4KnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773193863; c=relaxed/simple;
	bh=PfJcbH7DAQz4l0q68uuTWqXekkdD1vmcVWh5bjWRpOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kysGfRcWA7OS+lSYuggp/BzQkPCbNYVMZI/Q1d4FkYwuq40nKz4sYuIeeCyawqJ9XLR5SObJXRiFsMTX73fuyFW6i6m8KNK+Injte3etzn4WFM7aTpFWTiqhlW07fH0acadO6HkpOf3j86EFzechF0hVpJ2fM/Vwp+jEyMNyLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=b8HvDSrY; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c70b5594f4so54464085a.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 18:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773193861; x=1773798661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s0e9kg5CWREVQj27d0HiCAQTaRk+NJlGmn268UFe3K0=;
        b=b8HvDSrYjwmrE8vnJUUW3dgV/nZzsf4NkP9zE6xS6QbFnR/VTJVVpA8L0/BaOGEDoG
         QlNHnckPcjUJUZWr1k/lurZ9qSlZ+ThhThFAgSxtbc4HJ0DYuNzdIn2gmIxM+xc1D/Yb
         XZaNRv3YvgddcsRMCQ4/liHFnzwAQZON8k4mr6Vp024OZLxISAKUVFNMLybkI8DbZzCv
         FaYzdxbwQAHYZ4b1tlsej6kdAb7mgzRMNy4VMEidDtNGBtMWCuIfjRY4g4u9pbnj+RJh
         xeb3BOOP3MZHQHTlPizwAYB8EXtAMUZJ92mFpE715Eq640Vbp1cN0z/zxuvBDoIwZZ6o
         0BMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773193861; x=1773798661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0e9kg5CWREVQj27d0HiCAQTaRk+NJlGmn268UFe3K0=;
        b=Buoo/twL4BkXnBvQT4eMb2PsJdqMkhN7mqcX2iGLo2RuRrb7pSUaXrWCjsV4Rai64Z
         O3SzDqLsZ4GPN7ar4sJe6SR5TzWZBxk7QxVnmQTXvXUdV8ytb1dcvNu7aqjFILr5+rCu
         0aZAmQaPrQYyTtQh9x1Lx4pg0Y1NaWE5fyGu1wbMjr3nt377tMIkm5F4XEwapvjVSrtI
         Ip3R/p6gHNWdgmWULdTn+oNKdJyu+lJO21QH0Mc9meFqJ1GTnVq2g6ulmJ2Xs1JsvjsF
         mE7iNxC/GEzmU/zHxAv3sWQ+fgQr0HHX2NY7sl4Ek72dyAJM5IfG6BptXsW15edq51cx
         8qgw==
X-Forwarded-Encrypted: i=1; AJvYcCVXIzDfAf/QGM/nxhcsrCevNYHiq/cDNZLI6e+l2xxuBETdyBMCm9yQC0u4UnOxdcSJsvExbKHTlmA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8V1265mOy4dqpHdcMJHTA1BRuB+PPA9kHsdbFtb96lnHTWf25
	HMj3R2K2QHoGVuOxsMGlofSoVKeA8dJZr52taRpL99kCkNAhfRpAYbDYWKt8sXxos0rbbx4pRdb
	axd8=
X-Gm-Gg: ATEYQzyGQHqiCFtp+uEQYIrP314P5iWBW1jdyrscyJo/UrMfo1/oqqJ3rslNNVvopJv
	+vzgovULPpR9RrnSrYQdNXB66uXO/YQYz056FbEEi77HO/uN1gwYgDY0BZzQSxfjXUZYKHRPuuS
	hzrN15ozSrPNBfyKntlwWP1xdQ9gPFIMWf0kUrTVqdkOeV2777pwX4V6pxFWLX7FenEmAfdH5EQ
	J7jMj/ZwJcv3tPVSlWJKRN5hEObQ0hV0esTDvlp9E4f9ForvMFsHdxaHG0Mlib6qqjbszccvOSI
	e1IRh02NfGUHGaaWKMLDajAcrr6vse8ZExNPWngvS2SZylgXHnSS2ih0zmSs0sfQ7NchdJAhc2O
	lO9u+NUHR4Do7aE5csCuC6bxZrSJZKgQi0mc04LdtIS9eMu5pJ3DExhMv491YWl9UTY1UY0o0Gq
	OoxryRi+5J/YGsvSYdV+NDSOvC
X-Received: by 2002:a05:620a:2991:b0:8cd:88ea:fd21 with SMTP id af79cd13be357-8cda1f6f0e9mr93207785a.21.1773193861373;
        Tue, 10 Mar 2026 18:51:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda21348e2sm41701385a.35.2026.03.10.18.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:51:00 -0700 (PDT)
Date: Tue, 10 Mar 2026 21:50:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <8b3636bc-3446-4b4c-a8cf-d940be933c4b@rowland.harvard.edu>
References: <c99003a0-f26a-4bfe-81f0-27536c9570c8@rowland.harvard.edu>
 <69b071b3.a70a0220.51e36.0001.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b071b3.a70a0220.51e36.0001.GAE@google.com>
X-Rspamd-Queue-Id: 690B825A82E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34512-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rowland.harvard.edu:dkim,rowland.harvard.edu:mid];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,19bed92c97bee999e5db];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:32:03PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> general protection fault in usb_gadget_udc_reset

I'm getting the impression from the console log that this isn't a race 
between unbind and reset after all, but between bind and reset.  The log 
contains these two lines:

[  250.845916][ T7233] raw-gadget.4 gadget.2: Dummy stop
[  250.847972][ T6660] gadget gadget.2: Reset usage 1

The dummy_udc_stop() routine sets ints_enabled to 0, but the "Reset 
usage 1" line is printed only if ints_enabled != 0.  The only way for 
ints_enabled to be set to a nonzero value is through a call to 
usb_gadget_enable_async_callbacks(), which happens only in 
gadget_bind_driver().

So let's add more debugging messages to track binding as well as 
unbinding events.

Alan Stern

#syz test: upstream 651690480a96

 2 files changed, 26 insertions(+), 15 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1197,7 +1197,9 @@ EXPORT_SYMBOL_GPL(usb_udc_vbus_handler);
 void usb_gadget_udc_reset(struct usb_gadget *gadget,
 		struct usb_gadget_driver *driver)
 {
+	dev_info(&gadget->dev, "Reset #1, gadget %p driver %p\n", gadget, driver);
 	driver->reset(gadget);
+	dev_info(&gadget->dev, "Reset #2\n");
 	usb_gadget_set_state(gadget, USB_STATE_DEFAULT);
 }
 EXPORT_SYMBOL_GPL(usb_gadget_udc_reset);
Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -464,7 +464,9 @@ static void set_link_state(struct dummy_
 		if (dum->ints_enabled && (disconnect || reset)) {
 			stop_activity(dum);
 			++dum->callback_usage;
+			dev_info(&dum->gadget.dev, "Reset usage %d\n", dum->callback_usage);
 			spin_unlock(&dum->lock);
+			udelay(1000);
 			if (reset)
 				usb_gadget_udc_reset(&dum->gadget, dum->driver);
 			else
@@ -906,23 +908,9 @@ static int dummy_pullup(struct usb_gadge
 	dum_hcd = gadget_to_dummy_hcd(_gadget);
 
 	spin_lock_irqsave(&dum->lock, flags);
+	dev_info(&_gadget->dev, "Dummy pullup %d\n", value);
 	dum->pullup = (value != 0);
 	set_link_state(dum_hcd);
-	if (value == 0) {
-		/*
-		 * Emulate synchronize_irq(): wait for callbacks to finish.
-		 * This seems to be the best place to emulate the call to
-		 * synchronize_irq() that's in usb_gadget_remove_driver().
-		 * Doing it in dummy_udc_stop() would be too late since it
-		 * is called after the unbind callback and unbind shouldn't
-		 * be invoked until all the other callbacks are finished.
-		 */
-		while (dum->callback_usage > 0) {
-			spin_unlock_irqrestore(&dum->lock, flags);
-			usleep_range(1000, 2000);
-			spin_lock_irqsave(&dum->lock, flags);
-		}
-	}
 	spin_unlock_irqrestore(&dum->lock, flags);
 
 	usb_hcd_poll_rh_status(dummy_hcd_to_hcd(dum_hcd));
@@ -945,6 +933,25 @@ static void dummy_udc_async_callbacks(st
 
 	spin_lock_irq(&dum->lock);
 	dum->ints_enabled = enable;
+	dev_info(&_gadget->dev, "Dummy ints_enabled %d\n", enable);
+	if (!enable) {
+		/*
+		 * Emulate synchronize_irq(): wait for callbacks to finish.
+		 * This seems to be the best place to emulate the call to
+		 * synchronize_irq() that's in usb_gadget_remove_driver().
+		 * It has to come after dum->ints_enabled is clear.  But
+		 * doing it in dummy_udc_stop() would be too late since that
+		 * routine is called after the unbind callback, and unbind
+		 * shouldn't be invoked until all the other callbacks are
+		 * finished.
+		 */
+		while (dum->callback_usage > 0) {
+			spin_unlock_irq(&dum->lock);
+			usleep_range(1000, 2000);
+			spin_lock_irq(&dum->lock);
+		}
+		dev_info(&_gadget->dev, "Disable done\n");
+	}
 	spin_unlock_irq(&dum->lock);
 }
 
@@ -1020,6 +1027,7 @@ static int dummy_udc_start(struct usb_ga
 	spin_lock_irq(&dum->lock);
 	dum->devstatus = 0;
 	dum->driver = driver;
+	dev_info(&g->dev, "Dummy start\n");
 	spin_unlock_irq(&dum->lock);
 
 	return 0;
@@ -1034,6 +1042,7 @@ static int dummy_udc_stop(struct usb_gad
 	dum->ints_enabled = 0;
 	stop_activity(dum);
 	dum->driver = NULL;
+	dev_info(&g->dev, "Dummy stop\n");
 	spin_unlock_irq(&dum->lock);
 
 	return 0;


