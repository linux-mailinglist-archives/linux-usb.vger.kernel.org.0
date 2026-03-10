Return-Path: <linux-usb+bounces-34494-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HapF+pqsGmNjAIAu9opvQ
	(envelope-from <linux-usb+bounces-34494-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 20:03:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E299F256CC7
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 20:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FC303016AFD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 19:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEE93BED78;
	Tue, 10 Mar 2026 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="VYQbfzQN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9293C9ECF
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 19:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169381; cv=none; b=NdK9N+/ffvyYLGnSBx1vkHR2QjmZmrEjknpNIsRrrlD2nMTpJ9AVfYNMcFk1xMvLFo/WtyaRy79RtMfnNKEzYxS3av0qjMRM9+fdAMTvUz33/hZ1S3R1s4dpoJpQ8/3kEXa9i2ivc8sEShReuKg5vNVWPBcYyeU6pavDRvMka9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169381; c=relaxed/simple;
	bh=ya/KFlSeqKxb403iFt8Mrec/typOLLmfAJSn32xmOb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2Pckyotjtc45IIAMXl5asveSRwnmufRwUc+ZUeTL1c+7hUxhaK3Bdl1xSC+x4aBRMjvKyp2eTJH4EV2Yd+uL3nBn2Yha6Ns+EUl2kB7XKppwu3FX6+g7Cm9L7uBizCPhEQr1937hzzFrwrz0C72ppS0nA8Cizk25Fgy6pnSyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=VYQbfzQN; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cd90401034so205667385a.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 12:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773169377; x=1773774177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S1Mc/RHq6KhOn+YPau8MTROosZNr5iU+72UDkXxzVA4=;
        b=VYQbfzQNjgbPhyh7M7A/2QDIA9sleNR6uMUgT0xoMGM8mmIEIwhzM+LHbq6nWq+7JF
         Lr2SbHSfLNubER5a4tfNreJc7SwYiaGx3c0l9EE1S+cU76xq8uCNeQGpiZ5FWQ91wjmq
         kmPCWtXNpdt3/PU22CDHwcLEB4J+AzXaqll/KG7S2keLdbdEsMUXxJYZbVnEmQ1KU/jv
         nyozydVx8z2BLxiHPkmH+FT8q4H/lvXVLJsCguFKAyrWIazJCrHjCnh23ad7IS4F4ew2
         jk/G+dozvvcugqKaujPMq1kK2ke6lp+mDYgalCRwW4YVZsVGtJxw3ktiOxD92Qo0SOnO
         5YKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773169377; x=1773774177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1Mc/RHq6KhOn+YPau8MTROosZNr5iU+72UDkXxzVA4=;
        b=StZQCTLSwBKRj8Eiy5P9AoUfgRJSbxfZ2IDdMmqEHdh7iT78puFa0DlYiL5TpEvME+
         4LmQeqCyf782+91fZxzn9jz/TPntzPnwWg2g0yqCHOLyrs3wNYs+gutOhN82mBU5V7vF
         P7pbliQgItsm4eP14Lejvhvd2Lvndo/sCgS/j9MOxUzDgmoikBqy0K4CDT1WNmb+jgdv
         EYQ2kHMEMpTqZhM0LVZJAh8Md5ZNscBOHGvcl/JeBRDpmgUTU7QsOZFIOkja7wD8GA5O
         dXm0sXOUTiO7WL+czpZjSw9BoWXFAv991GK5TvNqqvZzdnpm8LUqqH0omoiCNMdMWgcV
         8TrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6o8O13tWRa8FIpi2BHhSKrQhlI+sKowUY1027gPb108g+mSdrGevJ+8CO928LdOA68SC5uCGzd2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw01H6AX1wKBnVeplkRX+rV1CqPJnEct9fzGNmeZbpvMwgLgoml
	zTVkvMaILBNKiN6Y7mn0YbdiEtp8qb7KrpCLAatwNnDErradl3ABW5xr3lNBEia9P/7p3KKnc4q
	Grkw=
X-Gm-Gg: ATEYQzxoZTzuyQY4zKP+PG+o/ZEdQSaMLlTM1A69EjLynosHSVIuDrWN5cgAJ7tcEg4
	2ybd1MzBsiQOGGHj0lDRUveV0WGTC20LMJeTI5aS2l/9idrtL78VbIWlcR8cbAaH4cVS1JOl0bB
	QfIn5eTfkzOrgHxgi0MRmjkfORt3HjXrygQAHynldOwWjPE6xuYRXDF31pcQlJ9U24zHsOnn6Mi
	3dQRb9oKEKLNydTk4KwKLsK1iBqPpg1dbpvT9dittPAoDjwJ5dis95P7DY+ecT+kUiX9nFY+Ppt
	9HsUD2VXD6a7FAJxX2Mq+BRgOfsdSQX8G7fYty12VdjoKBSnMuZuC2MxPOwxpzNd6cJ0EmG0cB7
	Tg+PYfutzW/Oz7kCH/p6B4L3l+qbzL60l0Lds+Pkoe7aiuEiioFV1EYZa3YAN1NQDsgxUdnwqK2
	1RUXcLFlFdIK53+hPvII3kRhfq
X-Received: by 2002:a05:620a:3714:b0:8c9:fb68:b942 with SMTP id af79cd13be357-8cd6d3a5164mr2103712285a.34.1773169377049;
        Tue, 10 Mar 2026 12:02:57 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1361cecsm10935185a.40.2026.03.10.12.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 12:02:56 -0700 (PDT)
Date: Tue, 10 Mar 2026 15:02:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <c99003a0-f26a-4bfe-81f0-27536c9570c8@rowland.harvard.edu>
References: <f75e8129-91d7-4db5-acf9-beeb013dc55d@rowland.harvard.edu>
 <69b0421e.a70a0220.be77.0117.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b0421e.a70a0220.be77.0117.GAE@google.com>
X-Rspamd-Queue-Id: E299F256CC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34494-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,rowland.harvard.edu:dkim,rowland.harvard.edu:mid];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,19bed92c97bee999e5db];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 09:09:02AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> general protection fault in usb_gadget_udc_reset
> 
> gadget gadget.4: Reset #1, gadget ffff8880294bcc40 driver 0000000000000000
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI

That's a little surprising.  Here's a test with more debugging 
printouts, along with a delay to make a race more likely to occur.

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
@@ -908,21 +910,6 @@ static int dummy_pullup(struct usb_gadge
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
@@ -945,6 +932,25 @@ static void dummy_udc_async_callbacks(st
 
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
+		dev_info(&_gadget->dev, "Disable usage %d\n", dum->callback_usage);
+		while (dum->callback_usage > 0) {
+			spin_unlock_irq(&dum->lock);
+			usleep_range(1000, 2000);
+			spin_lock_irq(&dum->lock);
+		}
+		dev_info(&_gadget->dev, "Disable done\n");
+	}
 	spin_unlock_irq(&dum->lock);
 }
 
@@ -1034,6 +1040,7 @@ static int dummy_udc_stop(struct usb_gad
 	dum->ints_enabled = 0;
 	stop_activity(dum);
 	dum->driver = NULL;
+	dev_info(&g->dev, "Dummy stop\n");
 	spin_unlock_irq(&dum->lock);
 
 	return 0;


