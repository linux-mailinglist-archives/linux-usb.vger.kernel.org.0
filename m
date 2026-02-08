Return-Path: <linux-usb+bounces-33168-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM1ZJMOpiGlEtwQAu9opvQ
	(envelope-from <linux-usb+bounces-33168-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 16:20:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E64DD109216
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 16:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E85C2303206E
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 15:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030F9361DA5;
	Sun,  8 Feb 2026 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="q9HD1QXx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABFC31281D
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770564001; cv=none; b=H6OZDomkDu/drI76WuDoUb6MhATxK9ECO1luRbg291Q+Tmb6PxfQUG1jl1iNFBAefwtfuw7umykQL0l48ofbIYMacjDitR1ZBnTlEO8Yesbz5j2H3y3Snw1U/x0oa9hoalOH5BHtiEPcLbX5I6NS2/EH75sID4LAZXLKJPuF5h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770564001; c=relaxed/simple;
	bh=g1SP+SFmHsjfgz+s6LGpxg5Q3AgWuNPhvxN6HiBgeIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MA8di1xcJph9EOBSFXhTGVe5cD2Tp0AF7N8FVM1dNG7F23a5hq/WHYjDDeGHs4qctZ46O0jC+LIpgzrIsAxqGK5Z7MU2r1gdlzxpwYhm6C70qjbsM6JCBlnjyvEQ8sTlbTFfT8gfwiG0sRvkUweDpF8GbILA+XiiKD+UAwf6NLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=q9HD1QXx; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c5320536bfso361560785a.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 07:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770564000; x=1771168800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ivZseJMmWr0S/zGri+Gz+vfX4mXEReLCeFyw2I2s0do=;
        b=q9HD1QXxN519fYn0kmZ9leazHIr4+JurxLJ8NSFMPaihInteWRov9JDbqOAeK3kT0B
         9w5JMD/VcAXzKY16Jrxlq+o6GFojMmWUEfoYizMEQBll1jSEuzTttB0DUrztFyHfXZqA
         zMCU/dvHONko4kjHKJp2Iwkv5YD2HHizfM0ncMblf7wHnfac0sRHx8FAPd/+4UHHjigX
         dDQFGLQQqruqm/sSfvGAvt+i1w29tHdnoEgAGjjbHTWNPm/G+0irl3emrSZycBWZ0/uK
         uCuqHJVeFD9b0EtL1IT7x+LTfC/OEusI5OkdNu3fASB/fjjC2as3fSFm9rWoDRqscm51
         XauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770564000; x=1771168800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivZseJMmWr0S/zGri+Gz+vfX4mXEReLCeFyw2I2s0do=;
        b=MK8Zl3w7hkLniEXWdHap8IWrBMIdccCkJts++Kv/ABBNm+8A9v3bqFbyJymtwSbeXs
         9sUYsihzs+DF6v4+08KLMKESu1cwKqM8aa6tsC+yGR1W769BdXgiSC4YPiHpELJHwNnp
         g/TdhRcOOZV/MZJ68yKVBe4hOOrjh7yOU8AocKbt7pyiQJ2JusKLRClFCc+4zy+BIFa7
         FESaP20cbvqUIyVJY9k3llYcvJ7q3CrkrAwwftSBPwCc2C7e4rjSzlZQklpTtr7wlx24
         4QWOSenDFGc01TQ7wtwRhjZ3q2Fhrx/97qJkfSJE1MfNL1T8rYZikatgrRuN9fWUaMf4
         A1pA==
X-Forwarded-Encrypted: i=1; AJvYcCW5xJBDeCu7OkJY5X9bZqNVoriy+H+W3vC93bFYridF8KUSOd6EG8ht1bZYZYRjYi9BW1ExtB7isdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoLtY1bi0u95Q3IcwRIFa7CcIrj+AJPFktuc/xaPqR39U9PMU4
	KU/FGXyhbHTUcq3acX8ymNVn+EZBIgvSWAAoIvH4Fm8RikGOAaas8iMma1GmXHDviA==
X-Gm-Gg: AZuq6aJf3/QRZPGzIDF73Lkgj3DyMnpl3Z4vM8a0V8tJx9rLT+UqSh1PDHkvbjzUKMe
	TulMCrvavVvCGQJun9jSrfnrHJmfkq+ANJ2t7eWEOonhqtFZRupZoV3wGDFo2oBqASTtCXbsCQv
	HsfCQqd1IOpPDPYiX0vZJyQsSn67fVmACev6vOrTAfgtE38Qc4Ib8C9zAIiZ5xnm4sPqTSKOWOk
	tXo/ErAL8sTmQZ8U4F2whVBlfheY5/V5/qxMnmmtmoYOfpqqISMvVpGNNEBOiF8XXiApHvmtoLd
	uKzy9cS1YzfUOUp9V6nqkyzubSlq1KoAtxqNOzezHikv0oGPCjyhOvMr7tZ0FSCPMDphQbcafrm
	y1hsJtJpKGE2+ZmIf6qTiC8SsnayuJl4rVCMGu3Cx3HziGIBPHhSXPpRLz5w1ysY3XRukTH+UOF
	NbXH4wj8XBDEbx
X-Received: by 2002:a05:620a:19a2:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8caf1bc9789mr1097343485a.87.1770564000298;
        Sun, 08 Feb 2026 07:20:00 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf77f2868sm604716485a.3.2026.02.08.07.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 07:19:59 -0800 (PST)
Date: Sun, 8 Feb 2026 10:19:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
Cc: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
Message-ID: <f48c3277-6a71-40c5-b055-c1b75b08ec54@rowland.harvard.edu>
References: <6c618000-fe74-4429-9e91-b8a012598bef@rowland.harvard.edu>
 <6988a921.050a0220.1ad825.0001.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6988a921.050a0220.1ad825.0001.GAE@google.com>
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
	TAGGED_FROM(0.00)[bounces-33168-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim];
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
X-Rspamd-Queue-Id: E64DD109216
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 07:17:53AM -0800, syzbot wrote:
> > On Sun, Feb 08, 2026 at 07:03:03AM -0800, syzbot wrote:
> >> Hello,
> >> 
> >> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> >> INFO: task hung in usb_bulk_msg
> >
> > Okay, most likely the reason for the hang is that the count is 0.  But 
> > that doesn't explain everything.  Let's get more info.
> >
> > Alan Stern
> >
> > #syz test: #https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git da87d45b1951
> 
> "#https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git" does not look like a valid git repo address.

Fix the typo...

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

