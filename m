Return-Path: <linux-usb+bounces-34764-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAr5KQBqtGnxnQAAu9opvQ
	(envelope-from <linux-usb+bounces-34764-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 20:48:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FE52896A6
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 20:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A9E33207A54
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 19:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4513E36D4E5;
	Fri, 13 Mar 2026 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="V/fs3Chu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1618A2E62B7
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 19:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431267; cv=none; b=sGxixNcKji/fzti3mS02GeEEoqKxz4IWMr/SSFjvEEX8Fx6ABC/4jWbdqMw4NJgXsowKh5ZBwRI75IyhDX6q7iYDwiEljwkvVhJK/uwwnUqPp7d3K8FtujHD8Zirn+OtKtl6esAED8RyRfmPIJymjwh8CTurHDA/5hs6naunsZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431267; c=relaxed/simple;
	bh=354Oi2f/g+SZ2CDhCsuFK9MPyZdBf5F1nh/VYtXb/xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYT+w9x3oMYtYXId3LxwDlJzGX4QkY3sE09BpPg/4L9q6uW3fr4FBONfo7hF3shR10+LQkJU8UReyyyuD9wZ4PbJRNJ3f/PrEd+9N4zBWqlfCLxBQ1WNXRljLaG2Cd6A+xJFmHm6PWQ5LB8C7FYjGlICz8cFtm2vezE/pqM2AcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=V/fs3Chu; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899ee491af3so30477306d6.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773431264; x=1774036064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2ly9/BJI5prEs68ns6SV45s078LRPIcr9PzZ/iOQog=;
        b=V/fs3ChuTXgE6/eGO9MEnVsJTj8SnqKB13BJTY2G+lpDTIzwFrE9X0zYG5SRZpzLdT
         lSem8Gy6q6svvIdxJaGFzBQ8NitlO7YltNlGUtBgG8DEvChfUztwJmbU35Oq8S0t0FKK
         bDd1PgDdFFTmpDjPDI4MUbdOs68iBjjYLx6FxoDZCiFxrb8w0TS0UKWyLHzhz95BXxRa
         eKIuktGd1GM+3yuctEt8BmiXfAgmOBszU9ljxaxHJQZbBv7NWBLC9SMJqyYS+Vaj1O6o
         NKcVBs72VNbfb+Gd6gxRa1QU5ip2YgRN6NpRiSGYkDZwan3lpNTo4HQmCRFhsgXhhR9q
         90yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773431264; x=1774036064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2ly9/BJI5prEs68ns6SV45s078LRPIcr9PzZ/iOQog=;
        b=LLh1RbUETknSMD5Is7WqZwHG1aXMuZuoGCfYYQk9u2LDDZuk30EkbqR4cAcrnnZTG8
         cMTFtR6QHBz/L5qw1N6fP8aB0zrS26WEqc2Mn9F8GDvHXrZd8bZd5z61+hwIo9Ys0KVx
         FZ87F9LbkJr3pMmH202CBGQEyKeyfxt0x+PCGqb1Balu6cQ9MwuOLkRCsp8V3v4BctNk
         vReIl2ziWLm74m6cs5UkLuEMTyl2fFkv3vIvsABrTgi/3S4BO61vxJ+dOHSQdrTHt0Bp
         o5Ynoi2cbysFPD++lDVZ8ZrKdVdjnd9ehuGrOrS2Vlr+5tVDqneeEm9rbdnf3hC0u0vi
         qQaw==
X-Forwarded-Encrypted: i=1; AJvYcCUVbfkZQnK5bdanrOVBQr99rCAqdrx95icxFOI7V75YI89KTanu1/6oqXJpt8CgycVgHQdD4s0Sikg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2RiepoXRjyAdQ2daG8OMX/Kfce6WGCzUGEREes1vNQcXSJM7+
	bjm2E5KaG5G/ftZlbI0fDm/rSXyDQdC36whnPRMwZ2SIvgxrGuSgIn5qrBAPpBS/KQ==
X-Gm-Gg: ATEYQzxETgETPzcc6USOe8vC47dEwnZerQQuSJJVr9BpG1jMz/NAXGZ3SnuB5i318/y
	1jLP92ieAszE1r0swCg5t0yJmYJgLhSYZrkfUo58+lpz6RUSmi3bSp3vTzU7Ar2YOjisJrgFxA7
	jNbB5oiHeLuwro6+NSnuVpfO4UCrAM4fmw4R2aG9sN8mYq+OkhVvwcf7rC0bEFVwa38zleFy2dx
	TXfvDw+CVWb5hH8NERRnInt+SelADEimVUgs5ncqS++qPACWX+UWaE7Wo12CqzUSDzsHNxp0Eah
	c7xem6iRyo1Ragu5merNO1auXtJLM2tgoc2SHOtmujbnmCiHKe7jGCrXSBWNZece45lq5JYE2Vj
	39XWKWFLj0TWdyFrupujJzzoYwKs8ilNUxfjvDJt3bq7Pf6vlpA1I2SlgKdWPK6nRIPMdtIEGBX
	GCsC5Mu2NPKAIXODRRo/NRuC1s
X-Received: by 2002:a05:6214:4007:b0:899:e979:515a with SMTP id 6a1803df08f44-89a81f8c020mr76211136d6.49.1773431263950;
        Fri, 13 Mar 2026 12:47:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a83a86fc2sm24840206d6.12.2026.03.13.12.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:47:43 -0700 (PDT)
Date: Fri, 13 Mar 2026 15:47:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <ed831d20-3d7c-41a1-8710-f1aa5b39877f@rowland.harvard.edu>
References: <ca83b97b-9895-4e7f-821c-bfdc71d8d466@rowland.harvard.edu>
 <69b43c02.050a0220.36eb34.000c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b43c02.050a0220.36eb34.000c.GAE@google.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34764-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,19bed92c97bee999e5db];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 23FE52896A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 09:32:02AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
> Tested-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         65169048 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=11535cd6580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
> dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=11de1def980000
> 
> Note: testing is done by a robot and is best-effort only.

Great!  Here's the final form of the fix, just to make sure I haven't 
messed anything up.

Alan Stern

#syz test: upstream 651690480a96

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -462,8 +462,13 @@ static void set_link_state(struct dummy_
 
 		/* Report reset and disconnect events to the driver */
 		if (dum->ints_enabled && (disconnect || reset)) {
-			stop_activity(dum);
 			++dum->callback_usage;
+			/*
+			 * stop_activity() can drop dum->lock, so it must
+			 * must not come between the dum->ints_enabled test
+			 * and the ++dum->callback_usage.
+			 */
+			stop_activity(dum);
 			spin_unlock(&dum->lock);
 			if (reset)
 				usb_gadget_udc_reset(&dum->gadget, dum->driver);
@@ -908,21 +913,6 @@ static int dummy_pullup(struct usb_gadge
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
@@ -945,6 +935,20 @@ static void dummy_udc_async_callbacks(st
 
 	spin_lock_irq(&dum->lock);
 	dum->ints_enabled = enable;
+	if (!enable) {
+		/*
+		 * Emulate synchronize_irq(): wait for callbacks to finish.
+		 * This has to happen after emulated interrupts are disabled
+		 * (dum->ints_enabled is clear) and before the unbind callback,
+		 * just like the call to synchronize_irq() in
+		 * gadget_unbind_driver().
+		 */
+		while (dum->callback_usage > 0) {
+			spin_unlock_irq(&dum->lock);
+			usleep_range(1000, 2000);
+			spin_lock_irq(&dum->lock);
+		}
+	}
 	spin_unlock_irq(&dum->lock);
 }
 


