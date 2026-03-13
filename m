Return-Path: <linux-usb+bounces-34717-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DNLBwhxs2kEWQAAu9opvQ
	(envelope-from <linux-usb+bounces-34717-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 03:06:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9627C796
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 03:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7295F30790BB
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 02:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F2733BBD1;
	Fri, 13 Mar 2026 02:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BEKr8otk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1871B24DFF3
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 02:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773367549; cv=none; b=C/UhYWNS3WkO02+tV1S5e/GLP6QPOkwvMju768UfxuPZ3ch9q69ZItxU4rDPHnIKro2KJyrCvCx0v9DypeRXoKFGYTVhl1YSrwRBdIyIsDr7QFWI9hzhibfDRwV5q2iLfF4Ve223XPQHqI4hC/ZhaPa7Zsir8c3cI7o6IzY2oPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773367549; c=relaxed/simple;
	bh=maxARhZzAcvfpPisDRhV/0FrQVZUoqi2Xbe92QGOJX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYI96vOcim5l3WRKwXHbbci7PPzBPFnzvv0rQBI0cvJxWd8mV/sP2Xff/Q+WuPQCkw7d7lAp4Yd6C9UiLW6ZxCYfhip2lLdWoEG4MzlbVfPOUDsTdM9dOz3JcuVWybD1HMWa/35s8UfpCBKmPdLaHsjU9Nyon3l8tRyY10KsmSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BEKr8otk; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cd71fb9f06so112423285a.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 19:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773367546; x=1773972346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=28DGSLfHR+wN3KbsQ08x7PSot9AjqSfqHOJZEHa8E9A=;
        b=BEKr8otkDAb0I58zL0u/RWyY719cvGa7iipDC1Z6kPE3Guo6JtWd4RuIsxYY5ww1P6
         A1YCE4JE6rJALZa3aOWW+C29/bUcqSOgLnr7ZSBv9Y4W94yiakRu1tLV6l6Be9TSViuw
         Zk+UnnWy6aL8/DwWC6VRsKpPUOLnyyPVSODq5gnHastXnXNgb+2wHsx3CgVXlIe1V5Dd
         1fIH2IRQDMh9WHNwzjM/MrsYrTrIi7wDvaa2KR8yQENZXj8TPICYMLY7UQVMh0Jtzi4v
         ePHSfd1cYibMXU61VefLt2ktQqLdJ99i27VcJkzEzCyYKlwIwt5ZLH4M5KIPz/PO/UxV
         v5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773367546; x=1773972346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28DGSLfHR+wN3KbsQ08x7PSot9AjqSfqHOJZEHa8E9A=;
        b=aOt7CSuuKMYTRq75jMc+lfD/fxLNKuJPlxJLTOZUA5tS92QEEN/Oh1nAmutpXB6wMB
         mIJ16HXZLBshdtRKSqS4YW48m3afnQS/f0vHLwVxsC4ld5YPwvhgiZ5carBTPMWumPpn
         h9OHLWxRVPz/dWLa03Ahw2fuwJuxfcKjW8bVao2jPNTqTSkhDf5CB8VIz5rFlCMKuo+D
         j4rviCLeaEcfq2WghITDJyyid19/ArUupXfeB3m2+W51b4miDeDQjrJ7FlqyoBIBO72N
         axRDa35IA/+h1FUacbKcKslZZHm00ysNipWMh0scubdlwI1bDGaBkdi+sW3YaFEr0xHF
         XOmA==
X-Forwarded-Encrypted: i=1; AJvYcCVqHzvpOKRsaogPfDsSK1qwAK6O4MNnMYPrmFYwC3x28tytHHDZsdzlF6XVXuU/HcVzl6uoLDXb3ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IITTFQ4NeXtP0uq4TTWM+63aoiaY9LYX1gAzFGHTxSasBIrb
	CVW5sYaF/TDtkIerO1L7WVpKdG9FZaen3Yhtjyn7quUMAxVcJfYh/iTSqJoGuIQrzg==
X-Gm-Gg: ATEYQzxwQlv4z9Wn/pi0aWMcsFuvAdnP7sfrB+cVS0JXCBm3vAEcYNohzLVEDJotfX5
	OI7OdVW4A57OA+kc/8OYbAR9Rxv48tBPolOyH6yDIGqPfPVtutYcJJiNhniumzNCW4FyirR++1H
	Yi6ZJL2vwbItdT2mCH+eGGAQMBs6Uw9Y/UcQpHFlrZns/wQwe6BzSxc14kiWT837yUr/3XirOML
	KX/v+Ccend0MK1OisvgEs87xxTkMGmlC3zHkYnIbFxqFgw9lxR/i8YJHrj/em0wmZT5Mv2h8s6k
	5wlj2bvjgYM6clddL0d2SZjVFkR0jzB2/uEf2KQa1Oq6thO0oXqJsSKcFVibFtanvm2rBulqemL
	WlXZ8YI/u80Wgdh7kGzrgpABzAeZAlKHeAsV1z8+9tiWMeTNIl+Co7lidlQ253xlaAN6pEH733r
	4J4ajrRSwq7giiSMLG5zwlUQsjQqpRnxULgSY=
X-Received: by 2002:a05:620a:444f:b0:8c6:db05:8eb5 with SMTP id af79cd13be357-8cdb5b5627amr244975785a.67.1773367545862;
        Thu, 12 Mar 2026 19:05:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fbcc5fsm514808485a.4.2026.03.12.19.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:05:45 -0700 (PDT)
Date: Thu, 12 Mar 2026 22:05:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <b8357bfb-1df3-47a5-9187-85f67ea20289@rowland.harvard.edu>
References: <76ea1412-ee4d-4eaf-b8a8-5866ad960b52@rowland.harvard.edu>
 <69b305ef.050a0220.24f2ac.0022.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b305ef.050a0220.24f2ac.0022.GAE@google.com>
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
	TAGGED_FROM(0.00)[bounces-34717-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:dkim,rowland.harvard.edu:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: AFE9627C796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 11:29:03AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> general protection fault in usb_gadget_udc_reset
> 
> raw-gadget.1 gadget.3: Inc usage: 1 A
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI

Apparently one of the events I thought was a reset is actually a 
disconnect?  Let's get even more info.

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
 			stop_activity(dum);
 			++dum->callback_usage;
+			dev_info(&dum->gadget.dev, "Inc usage: %d X\n", dum->callback_usage);
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


