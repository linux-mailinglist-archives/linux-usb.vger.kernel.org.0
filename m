Return-Path: <linux-usb+bounces-34755-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LSSAtU3tGnTiwAAu9opvQ
	(envelope-from <linux-usb+bounces-34755-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 17:14:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F37286C6F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 17:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64B7F3116F6C
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 16:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79929362128;
	Fri, 13 Mar 2026 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Nf3fpBlg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19393BD247
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 16:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418030; cv=none; b=E2egEYAO+gVjk5vCZ7i3tvFuZovDjt2qCEVFSwm/2RSlmGFSmeIwQBFH5k3tb+SAVUUucnwauxVFqIo7BIAl27NmbGHvy3skdSFzP6hE5moRpfRMF1JI/3Ayt9xAaEwtftAVZAETc4tcyFLSAqmUQ2QRyaykQS/m8dT+mQF+4ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418030; c=relaxed/simple;
	bh=WqR3PYjk2uMZK/8W0O4eCFZt+kWfoSU+GZqz5IH08vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJDm4AaF2kmm9+s4lGngAFaiQnW7moFqJnzmLqZamBSmFZ57G4WrKd16MXZluK7ti13E2MUugbrw7TRaLgU0PmFnj/j6y/zU7FBG0p0AZ8Vx/3c/y708FK1/u7Wjm6aO1jDklHiJCdGhf/EFd0LzNyWKjcVDlNVR4BjYYJmjoko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Nf3fpBlg; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-899fac9caabso31173776d6.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773418027; x=1774022827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+D12SmZC41fUm05hyWSOTm/E2HNan+11WhpBP9pVs+s=;
        b=Nf3fpBlg/nKvWn/Q3mGTGDErLIteyc0jctzMmUccsJv4xshkiHG+YBogVhSasROJYh
         h161IKHpsNb8vZ3QLUzMYrO6Xc+lH1YSxYMUB7UD2BHFKhaGFTUuRtWyDmrGvvj/fYvs
         0Vu/SVld9dI818Z5+asmLrgL30kG+9ICAJLGOl2mGAzoTXr3SsGALuqcaxJqgrvgqgGf
         GuaOKRLhtcCGgEn2z7k+R0Yg3chd7YyA/z5RJ15Gw3ayNsI/9/vffHLRztxHUwJdyhJ1
         Za5sqx+U5uvVTGFM0FWeaKjYgTz/KLbjO5pLQ0N3tSNH8S5SQE7QCjaX1Iumy5Sg0a46
         3+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418027; x=1774022827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+D12SmZC41fUm05hyWSOTm/E2HNan+11WhpBP9pVs+s=;
        b=tFnJr0sre1Zzj21EimXXpflTDxmZktUHbSlFEctubhLumApIQB0BAEmM9yBMA6CtNg
         PF6uvvEt7Fu2upYMSAJDQP34+/kC/wDWOt/hh5t+N8iTLcatSyZjefJ8KJYMTqLeghn4
         qPT+CyW3g1ZH40E4QTMb5xVlPyB6cxdJc1qEdSjl/+fb4xg4w6s+6g0FwhJNpz4ofCHK
         KIxZyWxNsJmxKLyz9MGrcnl49zH9DUfivQ0p35liSAWEeBspUvC2qxVY6Qtvc2hPr+nf
         pjZLogJ6KO75Ny6mOnVt+7IQ849zBafsXrOPu4lk572Qez3IV/tB7rWfMeQTLsSStJQE
         ojLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGSICDYi6xoY+dm4tkqgxjfLU47Q80V6Md/ZlTZfeT7fpdOzHN+AaeMWOE+cKAB5zFLTYzLN/MqTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv7wpRA7M9cYEuQRfnCcZkiLIkbsbpB4dJbnOzxxRqJpFt8BE7
	lV7+liiYPZek0S/R5VBYYh7NSx1et1kv7QDY7bz8KoUMrIzxdfnkxHAtPAdhL5bqbQ==
X-Gm-Gg: ATEYQzy3nKCRmBl8G31VUM9hUjwoou3MHNq6lz+iOVoRYrF6u6nhmCJPw/ILta+g/cV
	qg68Q7vQGTClfdY+Lt8JeMYrLAEghE3sw7waRidSVF0WzPnlTSiSnLpFORUNnFWvb/PICvKxQCQ
	uDaR/Z2FY2xfAIrKZ6pmMI3FPSOIvSF2q8cY/9xb9biDr8/c+gvxtWCG0Apso17k0qRvV8Rgcgg
	Xt8eocYKhZ9dpKDNxGcogjmFQd0Ybwj23Eblv/MGHUMfmbd/0ynfQ885xyvVkBDfEhEQXtFLmDB
	yO8dc1XVK5rAQnBnYjINrFsfRE8/2YSmHy3bBpLLPgY/YAgcuKcGDWc5LzOOBeXhsnPq57uQ+2T
	JUCYZCaVfFFl5unHZrlyv2sxRfHhQThkNoXerdt1wRwwAUDs42ZLFBoeGz50n2CRECz/I+KwhTv
	nC/Zhd2fcREyCd1O3/OJPoN9mV
X-Received: by 2002:a05:6214:2b0f:b0:899:f741:5aea with SMTP id 6a1803df08f44-89a81d32831mr62349766d6.8.1773418027360;
        Fri, 13 Mar 2026 09:07:07 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a7995b712sm35071716d6.31.2026.03.13.09.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:07:06 -0700 (PDT)
Date: Fri, 13 Mar 2026 12:07:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <ca83b97b-9895-4e7f-821c-bfdc71d8d466@rowland.harvard.edu>
References: <b8357bfb-1df3-47a5-9187-85f67ea20289@rowland.harvard.edu>
 <69b3797b.050a0220.36eb34.0006.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b3797b.050a0220.36eb34.0006.GAE@google.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34755-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:dkim,rowland.harvard.edu:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,19bed92c97bee999e5db];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 72F37286C6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 07:42:03PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> general protection fault in usb_gadget_udc_reset
> 
> raw-gadget.1 gadget.0: Dummy disconnect 0 reset 16, ints_enabled 1
> raw-gadget.1 gadget.0: Inc usage: 1 X
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI

I believe I have found the problem.  The code in question in dummy_hcd.c 
does this:

		dev_info(&dum->gadget.dev, "Dummy disconnect %d reset %d, ints_enabled %d\n", disconnect, reset, dum->ints_enabled);

		/* Report reset and disconnect events to the driver */
		if (dum->ints_enabled && (disconnect || reset)) {
			stop_activity(dum);
			++dum->callback_usage;
			dev_info(&dum->gadget.dev, "Inc usage: %d X\n", dum->callback_usage);
			spin_unlock(&dum->lock);

The issue is that dum->callback_usage needs to be incremented after the 
dum->ints_enabled check and before the dum->lock spinlock is released, 
but stop_activity() drops the spinlock temporarily while giving back 
cancelled requests.

Let's interchange the increment and the stop_activity() call.  That's 
the only change here from the prior test patch.

Alan Stern

#syz test: upstream 651690480a96

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -460,21 +460,27 @@ static void set_link_state(struct dummy_
 		unsigned int reset = USB_PORT_STAT_RESET &
 				(~dum_hcd->old_status) & dum_hcd->port_status;
 
+		dev_info(&dum->gadget.dev, "Dummy disconnect %d reset %d, ints_enabled %d\n", disconnect, reset, dum->ints_enabled);
+
 		/* Report reset and disconnect events to the driver */
 		if (dum->ints_enabled && (disconnect || reset)) {
-			stop_activity(dum);
 			++dum->callback_usage;
+			dev_info(&dum->gadget.dev, "Inc usage: %d X\n", dum->callback_usage);
+			stop_activity(dum);
 			spin_unlock(&dum->lock);
+			udelay(1000);
 			if (reset)
 				usb_gadget_udc_reset(&dum->gadget, dum->driver);
 			else
 				dum->driver->disconnect(&dum->gadget);
 			spin_lock(&dum->lock);
 			--dum->callback_usage;
+			dev_info(&dum->gadget.dev, "Dec usage: %d X\n", dum->callback_usage);
 		}
 	} else if (dum_hcd->active != dum_hcd->old_active &&
 			dum->ints_enabled) {
 		++dum->callback_usage;
+		dev_info(&dum->gadget.dev, "Inc usage: %d Y\n", dum->callback_usage);
 		spin_unlock(&dum->lock);
 		if (dum_hcd->old_active && dum->driver->suspend)
 			dum->driver->suspend(&dum->gadget);
@@ -482,6 +488,7 @@ static void set_link_state(struct dummy_
 			dum->driver->resume(&dum->gadget);
 		spin_lock(&dum->lock);
 		--dum->callback_usage;
+		dev_info(&dum->gadget.dev, "Dec usage: %d Y\n", dum->callback_usage);
 	}
 
 	dum_hcd->old_status = dum_hcd->port_status;
@@ -908,21 +915,6 @@ static int dummy_pullup(struct usb_gadge
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
@@ -945,6 +937,27 @@ static void dummy_udc_async_callbacks(st
 
 	spin_lock_irq(&dum->lock);
 	dum->ints_enabled = enable;
+	dev_info(&_gadget->dev, "Dummy ints_enabled <- %d A\n", dum->ints_enabled);
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
+			dev_info(&_gadget->dev, "Dummy ints_enabled = %d !\n", dum->ints_enabled);
+	}
 	spin_unlock_irq(&dum->lock);
 }
 
@@ -1020,6 +1033,8 @@ static int dummy_udc_start(struct usb_ga
 	spin_lock_irq(&dum->lock);
 	dum->devstatus = 0;
 	dum->driver = driver;
+	dev_info(&dum->gadget.dev, "Start on bus %d\n",
+			dummy_hcd_to_hcd(dum_hcd)->self.busnum);
 	spin_unlock_irq(&dum->lock);
 
 	return 0;
@@ -1032,6 +1047,7 @@ static int dummy_udc_stop(struct usb_gad
 
 	spin_lock_irq(&dum->lock);
 	dum->ints_enabled = 0;
+	dev_info(&g->dev, "Dummy ints_enabled <- %d B\n", dum->ints_enabled);
 	stop_activity(dum);
 	dum->driver = NULL;
 	spin_unlock_irq(&dum->lock);
@@ -1923,11 +1939,13 @@ restart:
 			 */
 			if (value > 0) {
 				++dum->callback_usage;
+				dev_info(&dum->gadget.dev, "Inc usage: %d Z\n", dum->callback_usage);
 				spin_unlock(&dum->lock);
 				value = dum->driver->setup(&dum->gadget,
 						&setup);
 				spin_lock(&dum->lock);
 				--dum->callback_usage;
+				dev_info(&dum->gadget.dev, "Dec usage: %d Z\n", dum->callback_usage);
 
 				if (value >= 0) {
 					/* no delays (max 64KB data stage) */

