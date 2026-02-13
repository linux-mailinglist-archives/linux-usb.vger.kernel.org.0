Return-Path: <linux-usb+bounces-33347-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EZWcJu+Xj2kyRwEAu9opvQ
	(envelope-from <linux-usb+bounces-33347-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 22:30:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B103D1399E9
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 22:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A67C3006027
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 21:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF4F29AB15;
	Fri, 13 Feb 2026 21:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QV6rTQDW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9B5286D7E
	for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 21:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771018215; cv=none; b=YHK5qGtgmV++VKVAgUME+D8aK1XLUcA9hFpHoWZE4K8JjRMtRVGOJGk7oyvhsP6Qy1mlAMvMba62UDpOsHLEk1KsJr8PffVaR38aWavcxQvnSCGmcoqaYk/1vIR7yNugqIqMFDk7zwjPmfPkR26UmXNc+8ynU7zT8/A6i48XUtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771018215; c=relaxed/simple;
	bh=XKrBRISRQXzMIdExKL+uYmvqOBuR9b9+kwswGDx5kSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJwcXrbZyMCwzFjvnKbeEmUpw83tgcf71ihWaU26+zjmTOuqsWwZL3rWwuvJLrmgQhL+SkP/tLzRa8Wo/ClhNMkZsnPSVPozxQRhj/+HUG9zUPiE+9kWxJydaJN9+7HSNRZy/8TmXfI06wjDlCAjq14AfowYqpSWDqHoiH+DYR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QV6rTQDW; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8946f12b1cfso16758126d6.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 13:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771018210; x=1771623010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=flZMhODs4wSec7fBtEUyolvcrJQCg4O6bo8zo5uyFmU=;
        b=QV6rTQDWT8XgkPlEwA4qBqU/f8ojG97pUmLvdCj72qmoOVMUxpc8DCI7N3xUzG0dRW
         cf7xP0Y9d4yuLsM6RarpFfa9hptgFZEhPxUHCpobqxgLuhHTRwjKy+sHeH+Nz2p1+QWE
         52/nIOA5fs99HOrW6GfRiRychmkhnGIMzS5nXGVSWnL0fLMNOTo/8NLImv5p+kXtJ2+7
         1t/hS/BTBkuEy0mVcujBO68L66rRYYGwjmuleSJmtkHWrB4Ncg4n0xqz/7AhCGh7AryL
         sFDHqUtoFW3608TRlUfOyNhxGRSz5RNt4nSsNwdIp+Y+z3HI6xKCng7f89YBg6za6CSe
         wG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771018210; x=1771623010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flZMhODs4wSec7fBtEUyolvcrJQCg4O6bo8zo5uyFmU=;
        b=i6YuOQLghkKGi9q6W5nSTFJViJ4NGnBRq19uq+BuKV8E3qcB9QbzHStMlUXExvRPnQ
         jEV0dGAErQICrFxdC/pV9kC5unDvMhOa7iTHI6jPd/bIgHcOEwlJn04A2swTMPfRYemm
         awSuwfUrKh8Sh8ZgChLrNETtPuRyNUGMCwziZkZKr8gGRyawfXqULvUPVBkHEIu05uxr
         Bj09yHEWzYISDntdhxkeHz+IMIO22yJOtCjQE/CFypGXltqOhPa6IHuY0LjElhvb4uB/
         gVheYeJIH2QyCSi8q1ot1/1ycW5vZNFqzmKTV2ZbuYtpAilbx6u/jMve4tJz7s224SxJ
         jA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1KumFlVZavbnayj26ChsUTyPJq8oNMPz6m6Qar2Z1LG6xbKLKtZOSA1sNVNr3cJwmnQI4wu9f/Ic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Sruf8mmlAcGLAnr0zsgPdVWYUk8/7qVGm/VJwo5QibI8oIdl
	4xucqtNELXfMiZVTjo8kd0QcF0j1AEXbUDQUareFgKVitYOZhiSUGJVllmVodFppzQ==
X-Gm-Gg: AZuq6aK9IfDj3pKyPufh1KdI6UGo0g0+b54XpfOWT0euvhKSXCw2bQ/nmLAMC2uZe9Z
	PJdI+BCwmoH0yhHG7Aqd2KOsWhHkX96r79k7EPPqi5QDaHGHXYqHauf0/b9Y5BIrh8f5rJ/J21w
	mW2jZgUsuY6YH+0QLNYv1M+3Kuh4w6imdruJRIqlAtsJpyBzyiU9P4VM4erzwUXxZ7abKJ+iTwR
	CuFG6p1dyvNfwFNlC9pHZS9gqQcpkDHrKj83E0JzePqS9EWODOkVG1ry6c6HmRXVYJOMgxqr3A5
	AVbkxXZgk+PtAogGPu83QsaNa0oaBDPac45D+NGgDd+RAtFNHdxYgY0e7YAzCuKvUf3EtjMBgqg
	KZXNB/pY/olDsa5QMBvBfOMGuP34Vv1tdYCAegY5Q3SiISiu696esYnGP0qnlutgeLqJQFJJaoH
	qo7gK6J4sbCz16R2lqQfFmJEfV
X-Received: by 2002:a05:6214:260a:b0:895:4b1b:4c06 with SMTP id 6a1803df08f44-8973605f4b7mr45226956d6.5.1771018209562;
        Fri, 13 Feb 2026 13:30:09 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1c8123sm682312085a.29.2026.02.13.13.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 13:30:09 -0800 (PST)
Date: Fri, 13 Feb 2026 16:30:06 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
Cc: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
Message-ID: <2236c07f-9cc9-48c5-b65f-ba1d5bd569a8@rowland.harvard.edu>
References: <738614c5-fe8a-450e-a3eb-8a5849298c90@rowland.harvard.edu>
 <698a199b.050a0220.3b3015.007c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <698a199b.050a0220.3b3015.007c.GAE@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,googlegroups.com];
	TAGGED_FROM(0.00)[bounces-33347-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,25ba18e2c5040447585d];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: B103D1399E9
X-Rspamd-Action: no action

Let's try the approach that Oliver suggested.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git da87d45b

Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -42,16 +42,17 @@ static void usb_api_blocking_completion(
 
 
 /*
- * Starts urb and waits for completion or timeout. Note that this call
- * is NOT interruptible. Many device driver i/o requests should be
- * interruptible and therefore these drivers should implement their
- * own interruptible routines.
+ * Starts urb and waits for completion or timeout.
+ * Whether or not the wait is killable depends on the flag passed in.
+ * For example, compare usb_bulk_msg() and usb_bulk_msg_killable().
  */
-static int usb_start_wait_urb(struct urb *urb, int timeout, int *actual_length)
+static int usb_start_wait_urb(struct urb *urb, int timeout, int *actual_length,
+		bool killable)
 {
 	struct api_context ctx;
 	unsigned long expire;
 	int retval;
+	long rc;
 
 	init_completion(&ctx.done);
 	urb->context = &ctx;
@@ -61,12 +62,21 @@ static int usb_start_wait_urb(struct urb
 		goto out;
 
 	expire = timeout ? msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOUT;
-	if (!wait_for_completion_timeout(&ctx.done, expire)) {
+	if (killable)
+		rc = wait_for_completion_killable_timeout(&ctx.done, expire);
+	else
+		rc = wait_for_completion_timeout(&ctx.done, expire);
+	if (rc <= 0) {
 		usb_kill_urb(urb);
-		retval = (ctx.status == -ENOENT ? -ETIMEDOUT : ctx.status);
+		if (ctx.status != -ENOENT)
+			retval = ctx.status;
+		else if (rc == 0)
+			retval = -ETIMEDOUT;
+		else
+			retval = rc;
 
 		dev_dbg(&urb->dev->dev,
-			"%s timed out on ep%d%s len=%u/%u\n",
+			"%s timed out or killed on ep%d%s len=%u/%u\n",
 			current->comm,
 			usb_endpoint_num(&urb->ep->desc),
 			usb_urb_dir_in(urb) ? "in" : "out",
@@ -100,7 +110,7 @@ static int usb_internal_control_msg(stru
 	usb_fill_control_urb(urb, usb_dev, pipe, (unsigned char *)cmd, data,
 			     len, usb_api_blocking_completion, NULL);
 
-	retv = usb_start_wait_urb(urb, timeout, &length);
+	retv = usb_start_wait_urb(urb, timeout, &length, false);
 	if (retv < 0)
 		return retv;
 	else
@@ -385,10 +395,59 @@ int usb_bulk_msg(struct usb_device *usb_
 		usb_fill_bulk_urb(urb, usb_dev, pipe, data, len,
 				usb_api_blocking_completion, NULL);
 
-	return usb_start_wait_urb(urb, timeout, actual_length);
+	return usb_start_wait_urb(urb, timeout, actual_length, false);
 }
 EXPORT_SYMBOL_GPL(usb_bulk_msg);
 
+/**
+ * usb_bulk_msg_killable - Builds a bulk urb, sends it off and waits for completion in a killable state
+ * @usb_dev: pointer to the usb device to send the message to
+ * @pipe: endpoint "pipe" to send the message to
+ * @data: pointer to the data to send
+ * @len: length in bytes of the data to send
+ * @actual_length: pointer to a location to put the actual length transferred
+ *	in bytes
+ * @timeout: time in msecs to wait for the message to complete before
+ *	timing out (if 0 the wait is forever)
+ *
+ * Context: task context, might sleep.
+ *
+ * This function is just like usb_blk_msg() except that it waits in a
+ * killable state.
+ *
+ * Return:
+ * If successful, 0. Otherwise a negative error number. The number of actual
+ * bytes transferred will be stored in the @actual_length parameter.
+ *
+ */
+int usb_bulk_msg_killable(struct usb_device *usb_dev, unsigned int pipe,
+		 void *data, int len, int *actual_length, int timeout)
+{
+	struct urb *urb;
+	struct usb_host_endpoint *ep;
+
+	ep = usb_pipe_endpoint(usb_dev, pipe);
+	if (!ep || len < 0)
+		return -EINVAL;
+
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb)
+		return -ENOMEM;
+
+	if ((ep->desc.bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) ==
+			USB_ENDPOINT_XFER_INT) {
+		pipe = (pipe & ~(3 << 30)) | (PIPE_INTERRUPT << 30);
+		usb_fill_int_urb(urb, usb_dev, pipe, data, len,
+				usb_api_blocking_completion, NULL,
+				ep->desc.bInterval);
+	} else
+		usb_fill_bulk_urb(urb, usb_dev, pipe, data, len,
+				usb_api_blocking_completion, NULL);
+
+	return usb_start_wait_urb(urb, timeout, actual_length, true);
+}
+EXPORT_SYMBOL_GPL(usb_bulk_msg_killable);
+
 /*-------------------------------------------------------------------*/
 
 static void sg_clean(struct usb_sg_request *io)
Index: usb-devel/include/linux/usb.h
===================================================================
--- usb-devel.orig/include/linux/usb.h
+++ usb-devel/include/linux/usb.h
@@ -1869,8 +1869,9 @@ extern int usb_control_msg(struct usb_de
 extern int usb_interrupt_msg(struct usb_device *usb_dev, unsigned int pipe,
 	void *data, int len, int *actual_length, int timeout);
 extern int usb_bulk_msg(struct usb_device *usb_dev, unsigned int pipe,
-	void *data, int len, int *actual_length,
-	int timeout);
+	void *data, int len, int *actual_length, int timeout);
+extern int usb_bulk_msg_killable(struct usb_device *usb_dev, unsigned int pipe,
+	void *data, int len, int *actual_length, int timeout);
 
 /* wrappers around usb_control_msg() for the most common standard requests */
 int usb_control_msg_send(struct usb_device *dev, __u8 endpoint, __u8 request,
Index: usb-devel/drivers/usb/class/usbtmc.c
===================================================================
--- usb-devel.orig/drivers/usb/class/usbtmc.c
+++ usb-devel/drivers/usb/class/usbtmc.c
@@ -727,7 +727,7 @@ static int usbtmc488_ioctl_trigger(struc
 	buffer[1] = data->bTag;
 	buffer[2] = ~data->bTag;
 
-	retval = usb_bulk_msg(data->usb_dev,
+	retval = usb_bulk_msg_killable(data->usb_dev,
 			      usb_sndbulkpipe(data->usb_dev,
 					      data->bulk_out),
 			      buffer, USBTMC_HEADER_SIZE,
@@ -1347,7 +1347,7 @@ static int send_request_dev_dep_msg_in(s
 	buffer[11] = 0; /* Reserved */
 
 	/* Send bulk URB */
-	retval = usb_bulk_msg(data->usb_dev,
+	retval = usb_bulk_msg_killable(data->usb_dev,
 			      usb_sndbulkpipe(data->usb_dev,
 					      data->bulk_out),
 			      buffer, USBTMC_HEADER_SIZE,
@@ -1419,7 +1419,7 @@ static ssize_t usbtmc_read(struct file *
 	actual = 0;
 
 	/* Send bulk URB */
-	retval = usb_bulk_msg(data->usb_dev,
+	retval = usb_bulk_msg_killable(data->usb_dev,
 			      usb_rcvbulkpipe(data->usb_dev,
 					      data->bulk_in),
 			      buffer, bufsize, &actual,

