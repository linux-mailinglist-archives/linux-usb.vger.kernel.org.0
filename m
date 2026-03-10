Return-Path: <linux-usb+bounces-34485-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFD1MxNFsGnFhgIAu9opvQ
	(envelope-from <linux-usb+bounces-34485-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 17:21:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 49920254A52
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 17:21:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8927333C6BC
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 15:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812663B635D;
	Tue, 10 Mar 2026 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="o00uWd+i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54083AD537
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 15:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157844; cv=none; b=h8EA1piKm3uSkjsKyCFRnfUAYvofdb18HPOkVe8cpnOlx1LcHvPzE68pcEY1fvDyoppCygbvF+iKcaMY1aVFHSFk1gh/Nsd+VupeKer/j1riRmdnLu7ghKrCIVNc1wOZwI00wdTIsngWJI3mRFFy83zV86YR0nUvG00tFUOScwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157844; c=relaxed/simple;
	bh=U5IAlJjmuyP1FJjkQ89Qyux4pmW1nHt7YrbnA8H4NTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvQ1HwixH5IzpdQ3eB1ym17PEx+PRLTVwn8zyWA7VDDRDVP0/iKl3ERaReyDb+phR9Kytr5hj01WyOzsI8v8uOTVY3Emf8YLN59sK5fIlfYT7yYbDks4ANW4AvKlgToZJTnqkSKyiCdQcA0hYuE4CnoRcfslRCvlLdVXIkbtF4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=o00uWd+i; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c70b5594f4so1250585a.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 08:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773157841; x=1773762641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PW00xXFDqTiT4ZVobmj7fYCyD660Y8ptjDf6FEsjoAs=;
        b=o00uWd+isM7jOuVwUp+IjoqVGXIrtBbqLyRYBSMg0eh5xHq3UNsQ3voZYdfWQXdi4y
         PCpQwpOD6jFe6C3rbQ9E61DK5IrvIGtWAiHmQ6uh0/noNPB8Pyv30E99xeXOS2xZjJYq
         +sLoa4b6nMQBDEAyjJYWzuD8NgDr7ZUO2Kf6JHANdjTQ/iuPR4G5XO4M1yhr0F4ukBiY
         x0fgRm6ZGccv5/xpu57MVhIpBo4SXpDnsK8Ln7+UPqYwe+dEIQVlOf+N+M6rLKD/RSXb
         ajaT3BgLzxVvJk/m48s9oyITybu8N+GiI3jkLvh0QJGzo4sGv/niVo0oA1PfxdXCfQj2
         3EvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157841; x=1773762641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PW00xXFDqTiT4ZVobmj7fYCyD660Y8ptjDf6FEsjoAs=;
        b=GVcNH8T+QF3k6vXYW8u+hADPSa6/7GiT2YpGn8//jqpsCw/bSrIQgtIR+20BOGbTyw
         vHDQ8YxC4PWNRqXtKx63ey6PUW98QWHA4FPVZHdlSGjvMQX9zsqImelFqRUknEqzrq7Z
         +XHelljAa19g64jVRgT6V5PCfGjqxupKJGDfPYpTuIIXfslVCR0zZl8O+kQp4cmPl3GF
         ix3X5MBvVSDQ1OODDInKWu4NQb++4Cx4EVLt6VYGLurC7eJe09M/AeAhnCAiFpDQ3L8w
         MK1ykTsR3KWD1TtOCngVOoYo0F9JdRHXbqTpLgCeibS96i+MWnGDGukrGmksrkOylIpB
         aMXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOLDWVEqXqMt7C4lej/b1VFjADieTDYL3WskcLORHCwlnfwo40p5GtTt0lgjIQZ01Cm1RsZoMwyQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOG1yk9hI0zPM37OAVA4FGc9lrqaxNX9BDsw3uDDz+IdOVAbg7
	A1+aVrik7OY/isoQPe5VOIKavmE+hwQs7lk5RBzQU5NCRcwZpAEbsuFhwfBPnWCeAw==
X-Gm-Gg: ATEYQzxB/0Ulgu1g/yWiafPErWqsuTiSGY1nXnqhgI4j5BL8ufM7XmhDTdYzzae+29a
	cVrixY7vasxPYldkSwEWoHCPyG0Lrn2P4YxyIBbFa/+8cqghrUi4MdMqKpuPE8ZfEu7XLCiu/GF
	JCksr/iI4urXA+8tXc6XswsnbhB0gbdnmBWJyRGl+YtyvMeYqK1bQZNLoYYdCailAWh2mr5zZdU
	mxllvBJjOgdyf4hbsMORU9zo6WM7PH6RugElCyyajiN6TpHH01bDECh1Th41ik9HRoShnNQjgJH
	7zHrIjoa9+vcMQisPW+cIxdSods2CEOazLtKo74+924Q+POViyi0TLC9YukCKqcKuc2o2m6d9eE
	tMwJ+nEKgzPNkH38ZULZ9t/iUguPTjtnDcBRj8rLp4yEoGbW1HRnZ4aftvq1RC5gJJ+UN8nzuNj
	5Mn2C4ztgaaIzMRWZqtuPodNVQ
X-Received: by 2002:a05:620a:4049:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cd93b759fbmr442558585a.15.1773157840380;
        Tue, 10 Mar 2026 08:50:40 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd81aa2eefsm564736985a.42.2026.03.10.08.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:50:39 -0700 (PDT)
Date: Tue, 10 Mar 2026 11:50:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <f75e8129-91d7-4db5-acf9-beeb013dc55d@rowland.harvard.edu>
References: <04861347-b659-4bcc-91d4-4319432c8ba6@rowland.harvard.edu>
 <69aeea85.050a0220.310d8.002a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69aeea85.050a0220.310d8.002a.GAE@google.com>
X-Rspamd-Queue-Id: 49920254A52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34485-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rowland.harvard.edu:dkim,rowland.harvard.edu:mid];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,19bed92c97bee999e5db];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:43:01AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> general protection fault in usb_gadget_udc_reset
> 
> usb 2-1: reset high-speed USB device number 8 using dummy_hcd
> usb 2-1: device descriptor read/8, error -32
> gadget gadget.1: Reset #1, gadget ffff888029d60c40 driver 0000000000000000
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI

That's helpful.  And it turns out the reason that "raw-gadget.0" changes 
to "gadget" right before the crash is because the raw-gadget driver has 
been unbound, and when no driver is bound the dev_xxxx() calls use the 
bus-type name instead.

An audit shows that the untimely driver unbinding occurs because of an 
error in synchronization.  The code in dummy-hcd which emulates 
synchronize_irq() should run after the emulated interrupts are disabled, 
not before.  That code needs to be moved from dummy_pullup() to 
dummy_udc_async_callbacks().

Let's see if this fixes the bug.

Alan Stern

#syz test: upstream 651690480a96

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
@@ -908,21 +908,6 @@ static int dummy_pullup(struct usb_gadge
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
@@ -945,6 +930,23 @@ static void dummy_udc_async_callbacks(st
 
 	spin_lock_irq(&dum->lock);
 	dum->ints_enabled = enable;
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
+	}
 	spin_unlock_irq(&dum->lock);
 }
 


