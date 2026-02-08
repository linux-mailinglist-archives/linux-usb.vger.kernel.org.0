Return-Path: <linux-usb+bounces-33175-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCEbHBUBiWlp0gQAu9opvQ
	(envelope-from <linux-usb+bounces-33175-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 22:33:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB5110A3E5
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 22:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90B1A30071E5
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 21:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EB534B183;
	Sun,  8 Feb 2026 21:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="aAE/1ejL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF15A308F13
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 21:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770586381; cv=none; b=rOWEtPI4FPBbRtHYeRtRJH1cbxPq0EInhB4jlfaokBvQ14jZCEYlHj4BqQpr0ybGKasbpPf1+IIkcRxfOVTa08wzQvFXakdeanLcPn4qVLnvUY00PIqnlKJh0PRPLIp7r/W69G2PSfpk7UcepioKVrotcPh3FWeVySx8ZAUS++4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770586381; c=relaxed/simple;
	bh=utyq/cD1O6p786aUp6CakakGCuT52hhje5GgWRsa8ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SY3zqkIiXiLnWEPO0mcBbO1SXCMoT7h7Kti1OmCafUbDJIMa3N4KREBinEdsXhCkAfiPjiQZaXAg1Z+Uajlpc2SGxs9kX6XotF+EHU8mi25sr4/m70cHHIdNTzJQ7EPPmIwfT5+i5gF9u7yTxXQkCj8pg51tDfu8flQT9ALSbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=aAE/1ejL; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8947e6ffd20so57357856d6.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 13:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770586380; x=1771191180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvP80fJYX4BySgd/KLCP16RYdeycTW8JlgCYy5VMXYc=;
        b=aAE/1ejLezFGD2Qap4RV6uLGroBcYnsIAhEsyKQ2g/yxgSJpMFRUQ/ZuDds3dVXqSP
         86pnuwf/2xyt8YAbrah3m78jXb0+qercp48VOvgLuMievxAQNTAXzJehQ6IBnNpe/U2P
         98YCkOI0gLx11ycj9G5Xktm0rRi1BTm9bA78sgpc1fZ3qAe9qQM5b5xs9C8YBCDezoJc
         Tnc2pQ8sEzPAB297ZxJ62xumDIhIPhi/k60BcIuiTUOf7LVBlTTyJcIyZkWgFjmOy5+W
         myOMla31BvHhtpyZkNUntIuqz1ZQN+OcN+qCwKz9V/KymYQY/L2ZKBUAx7fa4lbGtGLo
         SfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770586380; x=1771191180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvP80fJYX4BySgd/KLCP16RYdeycTW8JlgCYy5VMXYc=;
        b=RUZtwLZ8eLS71Yj7KwzWEDXAmbutB0gySJ9OVPg3qfilEd2oqV1Gg20X/awCqW+mfE
         mCWm+UFWKZPFbqQdTmS9vZjC6LIZ6e74RTcvDbsySu37iXZSq4Q+mZ85uDg0vANd2VZp
         20ZbPqGRh9A/E4NnMeGa9ALnnl8yq4qFW5TY8bjon/QRmR8+dwM0dykgjgan85cSJgNa
         BnzxZ9Z/+Aw5UBGknvLcC1iyf6frqq30k8nARNfxrfEzXH/LQVoAYRXcPf1+4ky4w1hS
         rD1LiTPBQSDwa/P/wZ0grcvXT7YoPxrMhTashPlrr77tDpAG4IQXDYMKtALZug+KI671
         /nEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm+qNm/s1RHuo5fr21HQqYrZ8JA+XWRcv1r0dnwUtr3vy+AAlxXpE9i9x1uM4PpvdnEaLyf0olNOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7zQ2x57WKH5dBoYhwj91AMf1MkC+myWz1llD/fQo6WFG4d9cF
	YW+bCMWcBrfGKvHbjAgSJ3FAx4oBEnfV10jyFergOkGUO1rMZByIOSBFXI+fqeVZVQ==
X-Gm-Gg: AZuq6aKKa03bppkaJUVQb/9XrN6XgEJrksYSkgMelBuk72CIdkMUP1mO6a46XeXZOTC
	urdJUULORTU6YphxpS11t1bJ/mJmQNpVzWLmEByoTU+M8UADdmcww4jOXExIA4iA8GiXjOYCOoj
	mzoAa44Ea31dhl1/v0SR8ndcTFLdE4YV4sKGLhkX61XOt80R1Ra7KSzHDf8cCcHSUafvX45J5NC
	V8JWFF4+TnPrm0fDxGikhmWIY/vbekE+onEY3RsR+klCZ4qOCvZN0Hp40GhPDttl5ZCzpDH6Cwo
	hzLEjckv7LXW4YQgGuYdhRR3o5ILSQems1O7B1iO8Kk0rdZJ02kLUwB/9gTPwa0thrvZZsXEJrk
	5YjQu6yFtOj4U+KyaV4aAcDb9lo3MxMGH1zTfd8YXzw5ons/FcQLOuPus92ujJJ/9Mv76hmCurC
	AkBr5s8fLIJecW
X-Received: by 2002:a05:6214:19c8:b0:897:5:859f with SMTP id 6a1803df08f44-8970005a2fdmr18360696d6.30.1770586379964;
        Sun, 08 Feb 2026 13:32:59 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-896f662e63dsm22655256d6.44.2026.02.08.13.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 13:32:59 -0800 (PST)
Date: Sun, 8 Feb 2026 16:32:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
Cc: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
Message-ID: <f0d78b66-4022-4b65-ad38-86daec39bc7e@rowland.harvard.edu>
References: <d19d2ca8-4759-488a-a39e-0198ca037dfb@rowland.harvard.edu>
 <6988f33a.050a0220.3b3015.0060.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6988f33a.050a0220.3b3015.0060.GAE@google.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,googlegroups.com];
	TAGGED_FROM(0.00)[bounces-33175-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,25ba18e2c5040447585d];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: BAB5110A3E5
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 12:34:02PM -0800, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> INFO: task hung in usb_bulk_msg

Okay, I've got an idea about what's going wrong.  There's even a comment 
warning about this in the source code.  Let's see if the idea is right.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git da87d45b1951

Index: usb-devel/drivers/usb/class/usbtmc.c
===================================================================
--- usb-devel.orig/drivers/usb/class/usbtmc.c
+++ usb-devel/drivers/usb/class/usbtmc.c
@@ -1347,6 +1347,8 @@ static int send_request_dev_dep_msg_in(s
 	buffer[11] = 0; /* Reserved */
 
 	/* Send bulk URB */
+	dev_info(&data->intf->dev, "Timeout set to %d\n",
+			file_data->timeout);
 	retval = usb_bulk_msg(data->usb_dev,
 			      usb_sndbulkpipe(data->usb_dev,
 					      data->bulk_out),
@@ -1362,7 +1364,6 @@ static int send_request_dev_dep_msg_in(s
 		data->bTag++;
 
 	kfree(buffer);
-	if (retval < 0)
 		dev_err(&data->intf->dev, "%s returned %d\n",
 			__func__, retval);
 
@@ -1404,7 +1405,7 @@ static ssize_t usbtmc_read(struct file *
 	if (count > INT_MAX)
 		count = INT_MAX;
 
-	dev_dbg(dev, "%s(count:%zu)\n", __func__, count);
+	dev_info(dev, "%s(count:%zu)\n", __func__, count);
 
 	retval = send_request_dev_dep_msg_in(file_data, count);
 
@@ -1425,7 +1426,7 @@ static ssize_t usbtmc_read(struct file *
 			      buffer, bufsize, &actual,
 			      file_data->timeout);
 
-	dev_dbg(dev, "%s: bulk_msg retval(%u), actual(%d)\n",
+	dev_info(dev, "%s: bulk_msg retval(%u), actual(%d)\n",
 		__func__, retval, actual);
 
 	/* Store bTag (in case we need to abort) */
@@ -1470,7 +1471,7 @@ static ssize_t usbtmc_read(struct file *
 
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


