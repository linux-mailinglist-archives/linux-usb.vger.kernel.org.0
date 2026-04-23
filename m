Return-Path: <linux-usb+bounces-36450-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGO2BWVD6mnqxQIAu9opvQ
	(envelope-from <linux-usb+bounces-36450-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 18:05:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FAF454A29
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 18:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E8E33011102
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 16:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9709370D79;
	Thu, 23 Apr 2026 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="G5aTO1cx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C15530F92D
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776960339; cv=none; b=GD0C3ix4BZ1y9LrzBBpM5yJ+6ou+SS00RgEsCRC8LDgbo4vv3iGThaVFpYo0s9Qm+zRPyOXikSY6Rl+OuT9cCVFteWBSajGG7Lr1jVUI4UGS/Qt8EqEQVTDOusjU04mrKXePKObplk1MuQD9QYgAqIkYeT2JoG4sCJU8VgyyC7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776960339; c=relaxed/simple;
	bh=r34h3pSng5eLO9OUbFu2LNHqct97BrQMZmN079QHKoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SPEx3jZf9lwOgHOXkAdGedZ0x68hPHJUtiJ263jnN4G8zBTfAUt8Si9C0d7me35ONxuvzpFG/5UyTzzXgvcsFDd9QuMfDGX2DsK9dpmL25kjS6uLtpCf4C5a4tD81KfCp3Otg6nYHRAxgP6Er9kiPi50YJR0VFbOAwrukouJTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=G5aTO1cx; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8ee62a19730so298054285a.3
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 09:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776960337; x=1777565137; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICOyiSd0BYlkqWpUNNtTUacn+KDQJ5PHH7AOfzyIKfU=;
        b=G5aTO1cx6ynoQyvyHvkClRZJ7PzF3skvYxMXl/8ntdo4XMWE/dn8CoQItty6pgYtYp
         7cvcyVz76eXqC8cC4gct6BnNYaVQEplEx0wAZdxbRjSRl3xemrRnXcIsPpGs7aQAp56h
         cjvi4gWkVr3fQLxkfFXQ1WdMLczJYSWnEcubMcv3rcfL8l67IhVpYwRk8ptr5escstAs
         PVgzqDomWzMnnpCibQsQ/8vquhpfvpwvoNkVxUgJMoKfH1AjAT5m17h6i1XT43lf4ffj
         sOei64Xsqzy+QXjvjPPliK94p2z8XQk2X89nPZtJNKW9Cowqc2OMIxOVKkN1zje1AHLk
         CD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776960337; x=1777565137;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICOyiSd0BYlkqWpUNNtTUacn+KDQJ5PHH7AOfzyIKfU=;
        b=T2X2KjzLbkKzd8EktEbilV2GZGqgu9UCqUU7hekGLiVnXsF/w/ksB0z/5yczyfZOci
         nASb6uw7w6YnGcg5EZugrDSormFaBD1Nr4ia4q6GmWc+bKEcMhJchmFVW0cXo6V4xsxS
         EIM7I8jEzCGyG1pVhD7SSIqus4xUAhuYR35nYucNnudtlX1cIXlz5tvynZiW4Y3JB32j
         eQI2nMqDGN9m9u7JMRSbR4Qk/HC1zg43e1EEPdrjTOnGboitIoNY5gF0Td4qxFRgNQIX
         E+XiHIYaX+lUutnFQKK3OSpcMqXBqx31aE2xUXYfU0v+FmLzohQvnZ80SbN+gwHNIx65
         UHGw==
X-Gm-Message-State: AOJu0YykLAR6Fi9Vd4CvPHOPsEs0FpJi0aQZD+tyT4h5rWMrIS7GwlN4
	9TJjTRajts7xMa75+GtCJMdU9OHgc1Cr7Ofi+xNNJeIeCaY3RJdfEnMswu3o2qMXpLs1AEv/K1/
	NXDA=
X-Gm-Gg: AeBDietKM9EbMNxHxK5oUsIWeSjfk2yD2Flm4glVyH5AYf3l0nFpU1vFf/kJ52Df+eH
	2YKOs4udPy1jztcf04Ua87xlYZrNt03Eg/caTt9yJj4taZ9iQu8lmFgiGG9wPaiS4olJvYJz5nV
	81OxuGsxugh2hSM3/B4JujCat7f0rRX6N22nSTobO7VIobq0wDne3qtALPMpi7FExzNw0rlabed
	RNkHArmpjj+JNly3SKRKDKiZJ8J+sxVhdJ1feWya/JjbFG3B353o7jwGhkNAfYVy3C/wh948qpZ
	hiK8yNd4F/nfVoMAZAvOMCETne3cAAsKNBiRTqlSaN63UlkZblvTDgM36Npf9Y9rh5UsMdeOPzO
	khYoXwfLhg+dJ5SzCpKzLN8BMmDOJhhxir355mgPe7pkwAnHiVQB1a+wBcLLcdBWlhjL10Y5X67
	a0bPxcO4Jl7Bt4W1TWB2pTW9b4w/DZWpSTPzPfTTmzKqFpjyZk/BeMcr/EeVlpWd+MQ7x+aSBy5
	uEhhg==
X-Received: by 2002:a05:620a:4089:b0:8cd:9468:691c with SMTP id af79cd13be357-8e78f82d1f0mr4067926385a.14.1776960337036;
        Thu, 23 Apr 2026 09:05:37 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8eb19632130sm1308606485a.41.2026.04.23.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 09:05:36 -0700 (PDT)
Date: Thu, 23 Apr 2026 12:05:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+4d3749e9612c2cfab956@syzkaller.appspotmail.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: INFO: rcu detected stall in dummy_timer (3)
Message-ID: <c23ff4f3-16a1-46ff-946e-b5dbda209f57@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36450-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,4d3749e9612c2cfab956];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 12FAF454A29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I'm revisiting an old syzbot bug caused by a tight resubmit loop, this 
one in mceusb.  The bug was fixed by commit 476db72e5219 ("media: 
mceusb: return without resubmitting URB in case of -EPROTO error."), but 
I want to try fixing it a different way, by changing dummy-hcd.

This is a preliminary test, to make sure the bug can still be triggered.  
The patch below doesn't do anything -- yet!

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git 811d22141369

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -231,6 +231,7 @@ struct urbp {
 	struct list_head	urbp_list;
 	struct sg_mapping_iter	miter;
 	u32			miter_started;
+	int			missing_ep_delay;
 };
 
 
@@ -1275,6 +1276,7 @@ static int dummy_urb_enqueue(
 		return -ENOMEM;
 	urbp->urb = urb;
 	urbp->miter_started = 0;
+	urbp->missing_ep_delay = 80;	/* Microframes -> 10 ms */
 
 	dum_hcd = hcd_to_dummy_hcd(hcd);
 	spin_lock_irqsave(&dum_hcd->dum->lock, flags);
@@ -1863,6 +1865,8 @@ restart:
 			address |= USB_DIR_IN;
 		ep = find_endpoint(dum, address);
 		if (!ep) {
+//			if (--urbp->missing_ep_delay > 0)
+//				continue;
 			/* set_configuration() disagreement */
 			dev_dbg(dummy_dev(dum_hcd),
 				"no ep configured for urb %p\n",

