Return-Path: <linux-usb+bounces-33171-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMMOOtPtiGkKzAQAu9opvQ
	(envelope-from <linux-usb+bounces-33171-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 21:10:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8222810A138
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 21:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A5CA300D303
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 20:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5818B33F38E;
	Sun,  8 Feb 2026 20:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CSm4JAYy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DCD33F373
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770581451; cv=none; b=pG4C8JSXjlC3h/q9O8TMuewF2ERJFM5haKYC3CYL3lJtwHTjK0E+0Kwj6lTeGMqkoNaaYjKjlFtrxeHqKnQaG1dKJ2galitdG7J0dO7ZD1TkQ+NdZZ4Vk8jBdLh3UMA26zypQZa6QMaEszrfK+xWskYgAye/6PAL7b3M578axuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770581451; c=relaxed/simple;
	bh=VsHaoxl3yrXZJKDxR52Mn9nx0AbfeZl5/DB251rGqfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luxEUqI8oPIYGEpifXwfHR/lUMZXpE6fCdsGgpVF0xHnNgIfY83alYxTpw8pW6nzRYKz+W1KkWQnD85G6o9Z9zX1VXTyhG9G4r71A66rWV8mNN/KH9mRE80pitZePBfsmYyCKOmoG8/Q/NSwqDdOwU1/MkDoG3U6el1ULPzqVuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CSm4JAYy; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c6ac42b91eso457252885a.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 12:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770581450; x=1771186250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hdGehabWtJkkC+Aato4fNTagQNnMDbL5gHfkLO0jPho=;
        b=CSm4JAYy1PyclZa+a4GWPmksORU4UvtKvXC2bFdMEVDj1MZ5qjL0HAAeBUdoCbzLBu
         k01pTIdRgEdaIWhOTxG5m1SIuQuw1f6DWnPpLM4qcv9aj/mg0Mv2b9nhqMporlpr28BJ
         VoPMDW9OHV8Dr8jC/jfrffi1LRIfNgAyvgmhE3SXIeWadyrwwfsWu9KY+/QxqrlAMK56
         BZmcnobGEpZ+K/sHmfIVgtE9SfmOm7cNUAsaZVDOpfxgBL8io7RXJLHQtUk8jbMs25nV
         lIqtryp68VYDBBs8c46VAIQzvdtGD6Rl5TRviM/zftHzz8i3RfWso5qCFoTTFZTiNK0y
         D4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770581450; x=1771186250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdGehabWtJkkC+Aato4fNTagQNnMDbL5gHfkLO0jPho=;
        b=K3RKnuu2k9LVYTH2hLKd964ACNre8gThguPVJsfgytk/xafUZOdn2rcC1eUEBucJzX
         oMGByWO6sE2sC7JHWw7Rh0hagZEHT/GV1q+7e2fMBZmW03ZiRjY1EfIDz+DOXGz3aEs+
         gETXA1wKeqdRd4GPZnRqLLc2X4wGzmvcYjvXvB9PPYyU8uDVBvMLyPmIHDx5CSxO8Vk5
         FyNs7+dlfJqMkRGODHIMjmSCkgrSfSfrnSneOjCXWk8yVDbAcaJjB/32RVd5AKNNsZRR
         DPn9xdfgmxvmsrN8WfHUmgrmgmR0/c/lkwWSjTQ+3F8QXe067tlXCj+J72Ok7cbjdJYu
         dVAg==
X-Forwarded-Encrypted: i=1; AJvYcCVPMkaR2Ey5MkxNC35HhQ6SHCAJpzAJhS33CSH+WgGYf91K5VhmLIo+OY/62hbU7s/M5BKcNkQb4Ww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1T8ip6Dv6u01hzefiXJ5XEogEXqiXm/gPWgIjSLc9AWAKEchP
	YxLV7e3F9b14fXmvFVi6DlAE2MH6enawUbqzSoMlo2NgTtX0Wl/8QBGCoe7Rn6rflw==
X-Gm-Gg: AZuq6aKWCTqcIq21ivqKmBWEcShaEhT48VWyqPCUswUM1Z09t0nQEE7sRvezvbRRaJk
	AvE5bbltkCx5RFkDzYqrnIEizyDgKPJsLNj+yjalHl2ko/rNBuhhNCLywaruN7x6B9B9pIKzvuL
	GY1dwsXoNGmycdrh9LYxtAr64yrczX11KcRFkPzJuWp83Z4ITH2lkNMO3hcRsAi94wOJ7vBqxgU
	Cpc5WGTHcN7JOBozSTC8Y8GyI9d7RP7At208cx6aGVojMpfkQU9sGgwPgCdu3WpERSqtfm91/sX
	tHTbeigDAUyi1PP98TQR2XtFJIOdnMXkVhOMa6r9LCxxoMNlUpVZbgWXg+MvoFnHd+/CEBH9tWy
	vVJK5Hg8DpwRmIks5/2WPGYdlkEv7ykXih7HOO5zq9TKGp/MnfVPyKTmuFol6tiwArswdvEMuRZ
	+LC8ad5Jeqc2E1
X-Received: by 2002:a05:620a:370f:b0:8c5:3045:3e7b with SMTP id af79cd13be357-8caefeb71a6mr1152837585a.26.1770581450485;
        Sun, 08 Feb 2026 12:10:50 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf982b811sm695236085a.29.2026.02.08.12.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 12:10:49 -0800 (PST)
Date: Sun, 8 Feb 2026 15:10:47 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
Cc: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
Message-ID: <f986d2fd-e2a2-4233-a7bb-df962bcafcd5@rowland.harvard.edu>
References: <f48c3277-6a71-40c5-b055-c1b75b08ec54@rowland.harvard.edu>
 <6988b0ab.050a0220.1ad825.0002.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6988b0ab.050a0220.1ad825.0002.GAE@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,googlegroups.com];
	TAGGED_FROM(0.00)[bounces-33171-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:mid,rowland.harvard.edu:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 8222810A138
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 07:50:03AM -0800, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> INFO: task hung in usb_bulk_msg
> 
> INFO: task syz.3.17:4981 blocked for more than 143 seconds.
>       Not tainted syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz.3.17        state:D stack:26904 pid:4981  tgid:4980  ppid:4531   task_flags:0x400040 flags:0x00080002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5260 [inline]
>  __schedule+0xeb0/0x3e50 kernel/sched/core.c:6867
>  __schedule_loop kernel/sched/core.c:6949 [inline]
>  schedule+0xdd/0x390 kernel/sched/core.c:6964
>  schedule_timeout+0x127/0x280 kernel/time/sleep_timeout.c:99
>  do_wait_for_common kernel/sched/completion.c:100 [inline]
>  __wait_for_common+0x2e7/0x4c0 kernel/sched/completion.c:121
>  usb_start_wait_urb+0x147/0x4c0 drivers/usb/core/message.c:64
>  usb_bulk_msg+0x22b/0x580 drivers/usb/core/message.c:388
>  send_request_dev_dep_msg_in drivers/usb/class/usbtmc.c:1350 [inline]
>  usbtmc_read.cold+0x48d/0xfe7 drivers/usb/class/usbtmc.c:1408

Unfortunately the log didn't contain any new useful information.  Let's 
try looking farther back.

Alan Stern

#syz test: #https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git da87d45b1951

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



