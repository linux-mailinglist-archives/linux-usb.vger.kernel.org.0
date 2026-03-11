Return-Path: <linux-usb+bounces-34609-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PPnFim5sWmxEwAAu9opvQ
	(envelope-from <linux-usb+bounces-34609-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:49:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA537268DC0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41B5F32227EC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 18:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581F53D1716;
	Wed, 11 Mar 2026 18:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XSlYsoTd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824AE34753A
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 18:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254693; cv=none; b=LWmqjgkQuXO3rlgdXAU+JENEuMZL5poNaKVaFJ6UlGX/q77GZH7MPtEXb0XG05oiAeds+aVgaZdYe+3Xgo5XYQjdXdwYfc+6J3HJQsNmFYfgGR2CBVpULG6/g22S+WU4dAuQpsE0fh1kSJLlRDL1/Zq7XEfiQ23REHun9UCQd+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254693; c=relaxed/simple;
	bh=zIRjHrBRAIvo6rZ2BEg3j79ILC/ZUqdanN2APiQ34/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2af/cgGkP7yHDIDvoBPahwcfsVyedggofZ/uKK6wyCKcZpkkQeyHNWiE4A40SWaxBsoboSVwRv9MmAmE4fhgA9IUQbJP1SsSx2wVBg1j3vQ398NnvFhRW05U551feYEPQSvPNw9F77aufKfbPxz0JE46biSV4AX6g/tDK7uuGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XSlYsoTd; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-506a7bbe9d0so1760471cf.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 11:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773254691; x=1773859491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOi7qWQna7Y26fTzLO621FTIgg7Up72RjGa0xhWfU8A=;
        b=XSlYsoTdDiexnleZJCGgEVs0mGCGOm0yJEgETxPY9gJ93iYePmxahgEcxE83t4niQg
         1V1/6FEpbQLm91C6AkpP8P2I22L5+ZCORjZaPzQ9HzcWF3KaJ56VLhskwwIcQfgXqhzO
         5LMEHfvpCmZOsrKVXYOVeR7czCE0M6WrRZxVNUw2564K8a18RxW/5+oBgUQ5kwqNREGF
         L1TgjjW/ismVO4Lb6DXV3jgw3R0im4D6gY21qxfZo3OlMks1ZE/mkLK/1LeBoVdQ2uiM
         uGzuScqufxvi7lGA/Y/qjzfd6fJaxzpujiklqhAHzRVvrZJKarF7CFtlBo9how+Mnw21
         +fMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254691; x=1773859491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOi7qWQna7Y26fTzLO621FTIgg7Up72RjGa0xhWfU8A=;
        b=gKvc/6AHIsXxmNuCRw38Fng8wiFn6gLDCjY1Mm0KwxBcfU/BT9SHZBbky3XJ0WelrB
         zcFfLjkHuPI87ZhKsU5VdR8xTcqMmcMxnWLFS63njqTp06z7QEYF8IakopdwtAwqQWyZ
         JgYQRb5YR11+ulT1nR1objLFZqXRCgBaM9LV+O1eRDiLJEx0YtB1bcqpIGUyV/kzMOTm
         C/Km9am1RpiCrgdMt5j+W+Foq1TpB3S/Idx/tCQ/T7xJ7wN6TMWarMV4J8pwIJUbXabs
         CWBRArUyhQowzPN2RUKqnboN5zwBS75uLSzfFYYrsVcVbeERexenqAJESwBfZJ6rSVp7
         RnmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyljlt+lXnG8DLIo827px6hYPR4rz9Cq1ZLtXbOLnIr+i8hlwIbprrjD6kDWkG7YLFh44H2pbbgPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmVwv4I0cZH9wUrAwutHXRovn9asEvJbLLIlggftKfT8jK6Gh
	t4erB/aLEOvypE1X+uBSge5XfTs0pFbhrbeB75CQ+E1wgYlsJYefova4eGN+/Lmya0Btsb6EAgB
	gQ8c=
X-Gm-Gg: ATEYQzz0QMNbma88GlS0rcD/9JMBFs9OeBueBO0i9PEE+Ftn68XVKgIDgXzv74R5Qml
	2r6m5L1+Jd41/3QmXRd9imB6UHCfe2A+z/Y0wHtzV4bdfNz5k9cdIClTSbnXkmA08JSwmz1BN5H
	lQulUpayokisKRNT/J9/oxG8bhgC0TzgCPfgKVJ37eSYfTd3GuIHD9QG6MM4j0kGtTSPjiQqatU
	mAVVV348g1QAdZDJIeenKf0ctjEc7OleanrPz+taOXwRx03yA9kMpO56ybGBLAkdeMyEi1QN6Ot
	GgiqWs9F9uzobivrIdp48fGWv9fipQfJqXHSoD8V9S1NoSHEpaR6rLWo/jijyDkauK1WqkZDNlK
	Ls7jdN8RgcY46ph+SOm28p3sYoul24drSSrMV/cfqTb6g/8R1dUo6cG1bRvqEo7ZQKXJZbdWhtp
	eVM8DMHI7P3ulCvtNpwuHHMl5wtH8Ry3ILWgj1klQnqFT+qyiwQgHYbsPkXvCh2vEjIU3wB/Reo
	COXPiAAtYHVm5vKQjlb
X-Received: by 2002:a05:622a:142:b0:509:2679:347c with SMTP id d75a77b69052e-5093a212bbfmr45053461cf.69.1773254691430;
        Wed, 11 Mar 2026 11:44:51 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-54.harvard-secure.wrls.harvard.edu. [65.112.8.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50939ce2f3dsm18112861cf.0.2026.03.11.11.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:44:50 -0700 (PDT)
Date: Wed, 11 Mar 2026 14:44:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <497b1bab-984c-43d7-9ef0-6614d2c1b426@rowland.harvard.edu>
References: <8b3636bc-3446-4b4c-a8cf-d940be933c4b@rowland.harvard.edu>
 <69b0de73.050a0220.381736.0007.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b0de73.050a0220.381736.0007.GAE@google.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34609-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,19bed92c97bee999e5db];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: AA537268DC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 08:16:03PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> general protection fault in usb_gadget_udc_reset
> 
> gadget gadget.0: Reset usage 1
> gadget gadget.0: Reset #1, gadget ffff888027440c40 driver 0000000000000000

It looks like dum->ints_enabled is getting set to a nonzero value when 
it shouldn't be.  Let's track all the places where it gets changed and 
the place where it gets tested.

Alan Stern

#syz test: upstream 651690480a96

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -460,11 +460,15 @@ static void set_link_state(struct dummy_
 		unsigned int reset = USB_PORT_STAT_RESET &
 				(~dum_hcd->old_status) & dum_hcd->port_status;
 
+		if (reset)
+			dev_info(&dum->gadget.dev, "Dummy %p reset, ints_enabled %d\n", dum, dum->ints_enabled);
+
 		/* Report reset and disconnect events to the driver */
 		if (dum->ints_enabled && (disconnect || reset)) {
 			stop_activity(dum);
 			++dum->callback_usage;
 			spin_unlock(&dum->lock);
+			udelay(1000);
 			if (reset)
 				usb_gadget_udc_reset(&dum->gadget, dum->driver);
 			else
@@ -908,21 +912,6 @@ static int dummy_pullup(struct usb_gadge
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
@@ -945,6 +934,26 @@ static void dummy_udc_async_callbacks(st
 
 	spin_lock_irq(&dum->lock);
 	dum->ints_enabled = enable;
+	dev_info(&_gadget->dev, "Dummy %p ints_enabled <- %d A\n", dum, dum->ints_enabled);
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
+		if (dum->ints_enabled)
+			dev_info(&_gadget->dev, "Dummy %p ints_enabled = %d !\n", dum, dum->ints_enabled);
+	}
 	spin_unlock_irq(&dum->lock);
 }
 
@@ -1032,6 +1041,7 @@ static int dummy_udc_stop(struct usb_gad
 
 	spin_lock_irq(&dum->lock);
 	dum->ints_enabled = 0;
+	dev_info(&g->dev, "Dummy %p ints_enabled <- %d B\n", dum, dum->ints_enabled);
 	stop_activity(dum);
 	dum->driver = NULL;
 	spin_unlock_irq(&dum->lock);


