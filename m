Return-Path: <linux-usb+bounces-33173-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IfdmHJLuiGlzzAQAu9opvQ
	(envelope-from <linux-usb+bounces-33173-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 21:14:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3C10A15E
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 21:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E37C4300B128
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 20:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9E134107D;
	Sun,  8 Feb 2026 20:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sjm9Dv6g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C13D341041
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 20:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770581641; cv=none; b=BRCoiJr437iVJ5mNrrRE1DQp4n4qxuqFs0GeoKM8/D+hZB0NQc/dw3/9QZ97rKYRBqhOSy/Y1QU/X+MGZh4b2WYv+c8PxCF+JL2CkuunIVEecAak1/aMRklPPrBMmWMxJFZk6E/A1/OpAsF0oAfA2A/zURWWa2J86OR1bSLrL8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770581641; c=relaxed/simple;
	bh=HnvJ+fAPpZpT5WLJZDLAQyXcC2f+rrMRsWPHrh2IVrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7EdPFC4tQVH+DF2LJxO1PHVRxgkvAeilKA1U6u2sAW60iwRWSpcZ5l4xipxhN4LUPivauHCxlLLFrxtz1KJDKROFTHnyYq8ceFmKwr2RCkZalm4LeTj00S4FSikJQYKBRVhdsPmqDA3BN6jUap5xdVpurdEOmx9KqbmdDcYi4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sjm9Dv6g; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c5386f1c9fso340872685a.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 12:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770581640; x=1771186440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9NxKl81tymzzQKnzDrsAi3pjk6DeVLPNyIi/lDSLhIw=;
        b=sjm9Dv6g2EMfiD9pz3PMWXvPgVqbmUDr+GjEGCNiNjUdHp34jnm0fYnBYHUh1t/bt5
         M+6gfXI7IguUCbPDZGl14VddGtLSIbwmIYfbvMzhgVa+w4Iqp76y02iqSxUt7sVgZxQU
         elYoZQ4PNCaDpM43OJJt5tagc8HRa/JF8m2i6CcKS8Hh0N79u+eOOBMbV8Aurx6p/Ta1
         pYRIpQEppvNSBwts43otUg/BWKxUasCHn1N86fA8mLTQEh+ucUYYAZM2+yA88VXtBfIy
         I+eacN60GzXRmL1iORsbZrbgjFWrD+lPjr9rqAKeHu34A/OUfVnnAphknjoTzmuAtmmR
         wUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770581640; x=1771186440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NxKl81tymzzQKnzDrsAi3pjk6DeVLPNyIi/lDSLhIw=;
        b=om9aKkPRMR8a1u1pYBNJad0Yx35EKNWxYLKgbU3Sq05ChFeLiHHuvqqiC2nl0J7Ada
         cgMz2BO1GyigTDT1P8RceKmnKYTZbzi6S9CzLoago4X5qgywD45eNzazO3B+lfqtdx76
         ViQI5JayH6eVxajADsa6C4GVkfiRdEaCHgrS3OiQ1NCG6rmUCXs3p9xIrXUBU4okstJB
         Bzv/YImRk2uZkgmvV338vmr1TUC4YprXlOSoGp2IInLvZRbgt8JXobmS7EpHkKYQ1ie+
         wRP7rY57jwcvnJD2z9jNdzhavgR6O8EJQi0wvLUeE7AKqTIrfmN29l/Fvo3c4JUTID9b
         5kBg==
X-Forwarded-Encrypted: i=1; AJvYcCW6vU0g0AeJExOBga6zW08wAi74ClT/ZT+aO/yWseFzM1MiM1VrPzEAo17s03UJf3O9v2jT6JwJFMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJsfceirzM0rvZlnIMWtr+9dmdr6UVZ1pU7HUY4RHYJ7t6GBY3
	k6Ot794H7Oe1jw5sBt7t3mEzQ/A/7Q08Ft8p3CZ4Q8XnjCby3/W82FzlpFOr4eFEUw==
X-Gm-Gg: AZuq6aLV23gSGPvMOb21D+nlTKXfyKcbaeBQ3Y4KMVVOAwkoqUQ1ZhZFkAHEmhSH2OE
	dpFw/toq3nWrcn6J1gJi3N1bn2gq3Sp/IiVHtir914D5FbuajJyVkkMjypA2sjaCZM5RiHu2OcK
	AO2UEucGEGu6aVhrbAbjxYhR87FlmTTVhL8EQa2mX3g46NF+S5RGzuY+LfDgk5GG/tZPnyGWozV
	7bWnEfxp7e2Wc1TnRPC6tgSDyCdJeod1IZQW6eG4QgwJp78Yzp7z7wqP6plSLoGFykq82hu7ylN
	MR+x7fTsu8DGeRqvAuprtxpxJtfyhZCkfZCLG4iUrVJ/XDwudxYRUrnlvcpMzrivL3iDfkdHC6S
	GxBx73VSzzfbaKkXyuiNGQ9v5UILC2t2jtfBrCmnpvUwkgxdCgyVYu1oT55CY7uS4GpEjjfkZZo
	lekXBh3o6ERO17
X-Received: by 2002:a05:620a:462c:b0:8ca:2e37:ad08 with SMTP id af79cd13be357-8caef7e230fmr1165889185a.34.1770581640249;
        Sun, 08 Feb 2026 12:14:00 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cafa4b49casm645783285a.49.2026.02.08.12.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 12:13:59 -0800 (PST)
Date: Sun, 8 Feb 2026 15:13:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
Cc: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
Message-ID: <d19d2ca8-4759-488a-a39e-0198ca037dfb@rowland.harvard.edu>
References: <f986d2fd-e2a2-4233-a7bb-df962bcafcd5@rowland.harvard.edu>
 <6988edcb.050a0220.3b3015.005e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6988edcb.050a0220.3b3015.005e.GAE@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,googlegroups.com];
	TAGGED_FROM(0.00)[bounces-33173-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,25ba18e2c5040447585d];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: BAE3C10A15E
X-Rspamd-Action: no action

Can't believe I made the same mistake again.  This time for sure!

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git da87d45b1951

Index: usb-devel/drivers/usb/class/usbtmc.c
===================================================================
--- usb-devel.orig/drivers/usb/class/usbtmc.c
+++ usb-devel/drivers/usb/class/usbtmc.c
@@ -1362,7 +1362,6 @@ static int send_request_dev_dep_msg_in(s
 		data->bTag++;
 
 	kfree(buffer);
-	if (retval < 0)
 		dev_err(&data->intf->dev, "%s returned %d\n",
 			__func__, retval);
 
@@ -1404,7 +1403,7 @@ static ssize_t usbtmc_read(struct file *
 	if (count > INT_MAX)
 		count = INT_MAX;
 
-	dev_dbg(dev, "%s(count:%zu)\n", __func__, count);
+	dev_info(dev, "%s(count:%zu)\n", __func__, count);
 
 	retval = send_request_dev_dep_msg_in(file_data, count);
 
@@ -1425,7 +1424,7 @@ static ssize_t usbtmc_read(struct file *
 			      buffer, bufsize, &actual,
 			      file_data->timeout);
 
-	dev_dbg(dev, "%s: bulk_msg retval(%u), actual(%d)\n",
+	dev_info(dev, "%s: bulk_msg retval(%u), actual(%d)\n",
 		__func__, retval, actual);
 
 	/* Store bTag (in case we need to abort) */
@@ -1470,7 +1469,7 @@ static ssize_t usbtmc_read(struct file *
 
 	file_data->bmTransferAttributes = buffer[8];
 
-	dev_dbg(dev, "Bulk-IN header: N_characters(%u), bTransAttr(%u)\n",
+	dev_info(dev, "Bulk-IN header: N_characters(%u), bTransAttr(%u)\n",
 		n_characters, buffer[8]);
 
 	if (n_characters > remaining) {
Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -762,8 +762,13 @@ static int dummy_dequeue(struct usb_ep *
 	ep = usb_ep_to_dummy_ep(_ep);
 	dum = ep_to_dummy(ep);
 
-	if (!dum->driver)
+	if (!dum->driver) {
+		dev_info(udc_dev(dum), "Got dequeue, no driver\n");
 		return -ESHUTDOWN;
+	}
+	dev_info(udc_dev(dum),
+			"dequeuing req %p from %s, len %d buf %p\n",
+			req, _ep->name, _req->length, _req->buf);
 
 	spin_lock_irqsave(&dum->lock, flags);
 	list_for_each_entry(iter, &ep->queue, queue) {
@@ -777,12 +782,14 @@ static int dummy_dequeue(struct usb_ep *
 	}
 
 	if (retval == 0) {
-		dev_dbg(udc_dev(dum),
+		dev_info(udc_dev(dum),
 				"dequeued req %p from %s, len %d buf %p\n",
 				req, _ep->name, _req->length, _req->buf);
 		spin_unlock(&dum->lock);
 		usb_gadget_giveback_request(_ep, _req);
 		spin_lock(&dum->lock);
+	} else {
+		dev_info(udc_dev(dum), "request not found\n");
 	}
 	spin_unlock_irqrestore(&dum->lock, flags);
 	return retval;
Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -57,15 +57,21 @@ static int usb_start_wait_urb(struct urb
 	urb->context = &ctx;
 	urb->actual_length = 0;
 	retval = usb_submit_urb(urb, GFP_NOIO);
-	if (unlikely(retval))
+	if (unlikely(retval)) {
+		dev_info(&urb->dev->dev, "Submission failed on ep%d\n",
+				usb_endpoint_num(&urb->ep->desc));
 		goto out;
+	}
 
 	expire = timeout ? msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOUT;
 	if (!wait_for_completion_timeout(&ctx.done, expire)) {
+		dev_info(&urb->dev->dev, "Killing URB on ep%d\n",
+				usb_endpoint_num(&urb->ep->desc));
+
 		usb_kill_urb(urb);
 		retval = (ctx.status == -ENOENT ? -ETIMEDOUT : ctx.status);
 
-		dev_dbg(&urb->dev->dev,
+		dev_info(&urb->dev->dev,
 			"%s timed out on ep%d%s len=%u/%u\n",
 			current->comm,
 			usb_endpoint_num(&urb->ep->desc),

