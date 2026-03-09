Return-Path: <linux-usb+bounces-34312-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ/DMeXormlRKAIAu9opvQ
	(envelope-from <linux-usb+bounces-34312-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 16:36:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F7A23BC89
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 16:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C27E63169EC6
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 15:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4731E3DA5DC;
	Mon,  9 Mar 2026 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="e6Cmbbcg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9712B3DA7C0
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069890; cv=none; b=ddNPurWQBFZuYrhtfsMS8U7bQifyJ1/2mh/TMg6G2r7g6qWDO/qb2zaxjfBwyMGra65Gd8i3ASn5b5YSH4Xc41Zt5tYUaid5V8R9+37HVqKAalbfBVCzH0v7uUe+UXCemQXsYvbWqW8rNZ21BKKIbb4fTdgxNsUlSWKISnK81qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069890; c=relaxed/simple;
	bh=vcPaccMw8SD+foA1FEMOa4GVZY3BIP104Ebz6deG6O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ha3NjjkC/FAH+2oeLhF6lTvVrXfEc64UVUKpJHI4oGqQvAu0MklQDb1oao8skRDcPrySn4/gJvwhjC9FdN93XavdKGAoWkOOrXOag25eRR983hMGoZOvzbejRFJcibX+LIlGp5iJQ+RWiYwCF7j0yPq8aQRsQOzuiTfXt52Vn+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=e6Cmbbcg; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89a000f5adeso145155596d6.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773069888; x=1773674688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uvg5sZud7BzRePnB3Cpgw94qR7NUhHSPnKo0+NLJBuY=;
        b=e6CmbbcgGUua7ERutBjLQa/CZsSlFoMr/wOMnneKN1vJyJwstLPYxyz82xXRvnHFwh
         cOZ0zz5urbGhg06HpKxM1t7ZRsas+RBiDZDgOCjzFm+eZY0rSIXkeslOtyyT9KKKoFZ8
         yRg00w9qx95rwXQvlWvCCTaJr3hF6nCVMsb773rA6+YsikyqIl/o1x5pP0nNdZ8u4m+P
         2GvzMPfAd5m0QOMY1YYfQMcqRNqsyDAokjyAIPV7P1JeNIvkN8n8F7XZCCaO1ljqxP0D
         hyh/zqXFswAD1NZfP/LgyuAOKQhtLo0m/pLicJap+BB9E2pwFC2S9L+1LN+semedXcyT
         Y/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069888; x=1773674688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uvg5sZud7BzRePnB3Cpgw94qR7NUhHSPnKo0+NLJBuY=;
        b=ZE6/QkhYMsTIicOnrQLSzmh2BxJR4FBGtwK0TgZoFTxaD7CasaGKNRowrO9GNCrp7A
         ADZRCxkNZbmkbztbe4U61S9CxPB1FuKDqdMZFJszmxKm60vdX3faoyOG3gBuKSkRIFkV
         nVirjjV+/Robu0n8HKwrT/dvv8VZaz7g+8qPZfvBApTUyTB8Mq29J+EP9P5ItS7uDoEo
         j6UQHNN2Olk5USf+rdDtidKaUbGTiXdAIFtSZrl2QhzbZN7ZkKJWTihevXvp7j9lC9Dn
         oh1OUbZpTDZaD5pI7/uubgnwXvWpylH2m03SOmiV3snMqG2czlEZkSFCxkkpnp//6L0V
         x7Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUAmJUyMNDQz6l0/OkDlNOB/UIlek5rlM6OT8lxDl8z3o89Bs7mWuVxXqmWP2hiQexMcamW2fKl4Go=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzmZd0dW7QjfrSyxvHG7+wYkD6C61ffjx72O5KiDaqYl+yGnYf
	4zVxAUbDJXo/LH0YJ0GisXzURbRlTh1GKE69sI5Be7RAsW1Wuc4if2IbvmNc5yTlbA==
X-Gm-Gg: ATEYQzxlNLj4zCxKlbPAKEoMrOmOFP1jK4JWcftYe3FhRlGz9pv5U8co9QA1vwjzBfR
	LnXaNkQfNDZBVVt+n7c/vyke8tbTi3gjGy81DJdzKwvIxPxphyCrb+giU5Z++2kOdQgZqGDnCNS
	+zgN1caSt9m8+//PMiKTOVQJqvQUrXJQT3N5CBEIi0uV7wYHaxWWtuq9XVMYxevy9vA1mstoF0m
	Ojuq0BoYnKcGj7RGmM8rJVmBpBR1+kZ+nenYrPlnTmfYVi9UIVcwJnpBG4NwEJp3Pmn1e6gmmWO
	NBGTgbtePMocFxzCmSkbc+6jFeL3emuywFmXCfLaMF3d9UD1B7JQuFeI05VBOSo0eIdoz4bulVx
	buEQo7kf03GL6Z3d8LbQVUapke/q76rolhXTfnluhl1xxeuLKEwLcJpYhyY1L2o+tLyBJkWXXqj
	jSGC/nfkyjUENA3/wSworS63PsS0SzGdtw8xv5V3tF3b/lnKdCBoD4
X-Received: by 2002:a05:6214:21ac:b0:899:f51e:1ac2 with SMTP id 6a1803df08f44-89a30b123e7mr164906236d6.66.1773069888211;
        Mon, 09 Mar 2026 08:24:48 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a2f55dsm177056d6.12.2026.03.09.08.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:24:47 -0700 (PDT)
Date: Mon, 9 Mar 2026 11:24:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <04861347-b659-4bcc-91d4-4319432c8ba6@rowland.harvard.edu>
References: <e9d9d118-e6fc-42de-847d-e58eaf7bcba5@rowland.harvard.edu>
 <69aedf46.050a0220.310d8.0027.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69aedf46.050a0220.310d8.0027.GAE@google.com>
X-Rspamd-Queue-Id: 25F7A23BC89
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34312-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,19bed92c97bee999e5db];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 07:55:02AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> general protection fault in usb_gadget_udc_reset
> 
> raw-gadget.0 gadget.1: Reset #2
> usb 2-1: device descriptor read/64, error -32
> gadget gadget.1: Reset #1, driver 0000000000000000
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI
> KASAN: null-ptr-deref in range [0x0000000000000040-0x0000000000000047]
> CPU: 0 UID: 0 PID: 5814 Comm: kworker/0:3 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:usb_gadget_udc_reset+0x42/0x80 drivers/usb/gadget/udc/core.c:1201

That's a little weird.  All the new debugging messages in the console 
log are of the form "raw-gadget.0 gadget.1 Reset ...", but the last, 
failing one says "gadget gadget.1 Reset ...".  I wonder what that 
indicates.

Maybe this next test will help find out.

Alan Stern

#syz test: upstream 651690480a96

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1192,7 +1192,9 @@ EXPORT_SYMBOL_GPL(usb_udc_vbus_handler);
 void usb_gadget_udc_reset(struct usb_gadget *gadget,
 		struct usb_gadget_driver *driver)
 {
+	dev_info(&gadget->dev, "Reset #1, gadget %p driver %p\n", gadget, driver);
 	driver->reset(gadget);
+	dev_info(&gadget->dev, "Reset #2\n");
 	usb_gadget_set_state(gadget, USB_STATE_DEFAULT);
 }
 EXPORT_SYMBOL_GPL(usb_gadget_udc_reset);

