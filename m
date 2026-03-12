Return-Path: <linux-usb+bounces-34704-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIKHJh7/smmQRQAAu9opvQ
	(envelope-from <linux-usb+bounces-34704-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:59:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EED1D276ECA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 411FC30ADD76
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 17:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438953FE651;
	Thu, 12 Mar 2026 17:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="VYu6W5NA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD4E373BFE
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773338220; cv=none; b=PPvG6SKSENmcs4c/sMOru1eEcs3hO+e0nUocoRY7pWewDi15Qc9OtCkT57hX9e2ef6S9yEeZDWXPNcLu4kL3aAw6F7z67rNKbc9UzC++UKKYzSkipm8TrR2hLeEJJP+QOgLJFe3HNmtPl8gmJrkJpKgXz5o1MDc9k5uBKZbpkRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773338220; c=relaxed/simple;
	bh=qYB0+HnMjB3eOlgp/sN5nNAlsC0J5k9puGevXCqX3L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/PBlD6I3pzUzXa2GpNTjWI8QdsX/A6tgXT5CKuBqGFIc97sTN7/xHa+zsHy8a8ms35NevMHdbSB8+0XhjE72DDRz3LJ4jN3foj4DDGqbK3pylteyIYp9AIvVXWBOuyNAncUx7ZkpIxOPFC2cn8B9wOewQWDk24RqRmJf5aWJ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=VYu6W5NA; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-509164dce91so11715701cf.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 10:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773338218; x=1773943018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Whn5rHQNr3p2J6cQMHUGm1ctvpcF0OQneoboILyGMJQ=;
        b=VYu6W5NAsXBmc+j32rlwQaIKWO/OgxWOAKRZIDP0nOexJTaavZmpHt+7FqE/mFPo2s
         4mTxOobrOaPD7oftw3cyoR4VhrKq+j8B5QpFX0LQ88uFteJSxBjbP41kIF50vpktRoX0
         vzJtgRKj70MObgurgP+AaHZa0YiX6e591DDsPeqismh1Lr4X2l2Hmq11F/MyCYvs5I+s
         Pd8FQnLDO8gJ1JesGRIwbYfblfR7vptGOdMggq3lXvjP9SmzejL4DShejWrFaO/B/Blv
         GXYRpfX3cGgnGGDnuxCQ0hdllI2UbCjCRbZSlEfxQG4Y3i0zpDlUDROzalxa7uDY8aJ4
         7fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773338218; x=1773943018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Whn5rHQNr3p2J6cQMHUGm1ctvpcF0OQneoboILyGMJQ=;
        b=vukwR1shyenL7YiSBvJ6i53QFMk8ldsbeAdWbjmaTLEhd7xdrn4TDQx6z2LlaNynDS
         /eD7mI3btgYIq+rY2wAKjqkhgdnjqwKH3GcNfIDcNvmBqFJSH/2QpADf9CF2Q7b8d1wd
         cQw9MVJxxc9BCbvHVUT4powrFcns/C22KbFfCTD5HzbWv2huRfD7Po2AuJUs7HWHGa9d
         eMBhEaQ5p96dSUAXuRV6Yez6h6Ktyr3KRfWRXCk/bdTQ5yoKk4vSIAQ8JkunNXVbsXbX
         /6Uq7vjcFVkmZP6j+2WDFXQpFaJpF/i2ZHquDVPAzRZMsBmwdz/OvLJAo1FqRXwKJBwL
         xKeg==
X-Forwarded-Encrypted: i=1; AJvYcCVXHXb1DqYy6KgCKtPk4Gj9liJutJeASg7qpdLEE6VImVfF3n82BTobTVf0EY8k/HUxH/GHpIbGpsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZELSCJCei+EzpslbfZSxB6O6S9G0A7uvdTg6BvAJDU9VLTYd
	Z67cbz168HlujwaR4Ricu5tAt2OTAyWX+tlzsTJyGVTduwi/ORMr0HAlGa7EobKjbQ==
X-Gm-Gg: ATEYQzySKcM9QRK66w2yUicwZk7vBa6cThsGRnVDVAfTNm6hiW6i9vnFAAiRXmu4ju7
	RqCgP/AbvFp/hLjaqqb8Sy4fzdMwh3mI+ibUFQOK9PD8doL/1tb41UXOXRQCLKDbYZwOFb/Pm8Z
	u4ifrybUbseyZ0eiIJ3ekWC66uidmJHsrgSddTRK+gk+xLOBY5f19Z6OvkTyf9XMyulyTglBQPK
	R3I1joC6y6dJHl3FSWGmzytEIvHZvk6PbNnIiH7TfTfQIVMELv1uDO/V6jkO4ka5VQkQH4pI4Uz
	EcoqGJSG77D/d0HynmkbBwp5LiMHehz4/LWcqC8cTCOLaypv+twM/l+CqjeZ5eNotKu8rWScQmO
	WdRPAPNi4OY9yn+zIGny7byk30d797a2AdWUpXrgCmeBioEqvE/w/eOi3U4k5Iy0bRoSZAV6UGK
	+vyxsWEKzfTMk2w5VGKFHxaGUKHPxh77im99bk0P5m2/3R6CEhH84akOCOJgnuugLhokO+uDh1q
	Py4efADn42Bvks1gd/VuMOVRLaPJWQ=
X-Received: by 2002:a05:622a:11c7:b0:509:1253:fb27 with SMTP id d75a77b69052e-50957cb547fmr5267181cf.15.1773338218266;
        Thu, 12 Mar 2026 10:56:58 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-54.harvard-secure.wrls.harvard.edu. [65.112.8.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50939e8e14esm36187391cf.6.2026.03.12.10.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 10:56:57 -0700 (PDT)
Date: Thu, 12 Mar 2026 13:56:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <76ea1412-ee4d-4eaf-b8a8-5866ad960b52@rowland.harvard.edu>
References: <497b1bab-984c-43d7-9ef0-6614d2c1b426@rowland.harvard.edu>
 <69b1c190.a00a0220.707e5.0002.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b1c190.a00a0220.707e5.0002.GAE@google.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34704-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid];
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
X-Rspamd-Queue-Id: EED1D276ECA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 12:25:04PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> general protection fault in usb_gadget_udc_reset

The console log contains some very strange looking stuff.  I need more 
debugging info.

Alan Stern

#syz test: upstream 651690480a96

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -460,21 +460,28 @@ static void set_link_state(struct dummy_
 		unsigned int reset = USB_PORT_STAT_RESET &
 				(~dum_hcd->old_status) & dum_hcd->port_status;
 
+		if (reset)
+			dev_info(&dum->gadget.dev, "Dummy %p reset, ints_enabled %d\n", dum, dum->ints_enabled);
+
 		/* Report reset and disconnect events to the driver */
 		if (dum->ints_enabled && (disconnect || reset)) {
 			stop_activity(dum);
 			++dum->callback_usage;
+			dev_info(&dum->gadget.dev, "Inc usage: %d A\n", dum->callback_usage);
 			spin_unlock(&dum->lock);
+			udelay(1000);
 			if (reset)
 				usb_gadget_udc_reset(&dum->gadget, dum->driver);
 			else
 				dum->driver->disconnect(&dum->gadget);
 			spin_lock(&dum->lock);
 			--dum->callback_usage;
+			dev_info(&dum->gadget.dev, "Dec usage: %d A\n", dum->callback_usage);
 		}
 	} else if (dum_hcd->active != dum_hcd->old_active &&
 			dum->ints_enabled) {
 		++dum->callback_usage;
+		dev_info(&dum->gadget.dev, "Inc usage: %d B\n", dum->callback_usage);
 		spin_unlock(&dum->lock);
 		if (dum_hcd->old_active && dum->driver->suspend)
 			dum->driver->suspend(&dum->gadget);
@@ -482,6 +489,7 @@ static void set_link_state(struct dummy_
 			dum->driver->resume(&dum->gadget);
 		spin_lock(&dum->lock);
 		--dum->callback_usage;
+		dev_info(&dum->gadget.dev, "Dec usage: %d B\n", dum->callback_usage);
 	}
 
 	dum_hcd->old_status = dum_hcd->port_status;
@@ -908,21 +916,6 @@ static int dummy_pullup(struct usb_gadge
 	spin_lock_irqsave(&dum->lock, flags);
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
@@ -945,6 +938,27 @@ static void dummy_udc_async_callbacks(st
 
 	spin_lock_irq(&dum->lock);
 	dum->ints_enabled = enable;
+	dev_info(&_gadget->dev, "Dummy %p ints_enabled <- %d A\n", dum, dum->ints_enabled);
+	if (!enable) {
+		dev_info(&dum->gadget.dev, "Wait usage %d\n", dum->callback_usage);
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
+		if (dum->ints_enabled)
+			dev_info(&_gadget->dev, "Dummy %p ints_enabled = %d !\n", dum, dum->ints_enabled);
+	}
 	spin_unlock_irq(&dum->lock);
 }
 
@@ -1020,6 +1034,8 @@ static int dummy_udc_start(struct usb_ga
 	spin_lock_irq(&dum->lock);
 	dum->devstatus = 0;
 	dum->driver = driver;
+	dev_info(&dum->gadget.dev, "Start on bus %d\n",
+			dummy_hcd_to_hcd(dum_hcd)->self.busnum);
 	spin_unlock_irq(&dum->lock);
 
 	return 0;
@@ -1032,6 +1048,7 @@ static int dummy_udc_stop(struct usb_gad
 
 	spin_lock_irq(&dum->lock);
 	dum->ints_enabled = 0;
+	dev_info(&g->dev, "Dummy %p ints_enabled <- %d B\n", dum, dum->ints_enabled);
 	stop_activity(dum);
 	dum->driver = NULL;
 	spin_unlock_irq(&dum->lock);
@@ -1923,11 +1940,13 @@ restart:
 			 */
 			if (value > 0) {
 				++dum->callback_usage;
+				dev_info(&dum->gadget.dev, "Inc usage: %d C\n", dum->callback_usage);
 				spin_unlock(&dum->lock);
 				value = dum->driver->setup(&dum->gadget,
 						&setup);
 				spin_lock(&dum->lock);
 				--dum->callback_usage;
+				dev_info(&dum->gadget.dev, "Dec usage: %d C\n", dum->callback_usage);
 
 				if (value >= 0) {
 					/* no delays (max 64KB data stage) */

