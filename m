Return-Path: <linux-usb+bounces-33409-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEeoKASWlGneFgIAu9opvQ
	(envelope-from <linux-usb+bounces-33409-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 17:23:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B85C714E1B2
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 17:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49AA3304705C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 16:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EF936E47B;
	Tue, 17 Feb 2026 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NddprNSd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC5636E49D
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345380; cv=none; b=XiO1bJjkXDfeGdE4M7z7X8wXvac6I9BWB44iJk664li5+wqCE+IkuhLgoQhJzUQ5M1JZr9k5PnFtnjGQqfv1/2+v+YuZeV+IMWlzpjLdcvSxShuov+8fnNBjmYZMCaXJEZ6hOvySw8NAiQMXJgROzepBFmql7zQsxOm6ZLzSs3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345380; c=relaxed/simple;
	bh=RSCrfFrexTb3m/RUohxxDRle7ETcajeOz9qAoIzT0Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lItnkiZcBYnYypWoRpTTtKwTreT0yjGaBeFabucHKjczimRBjS0Ak7KNiUQF4iHIKaSq7yL4sjFatzU+7aWeW/yjwwDYPuJInsKzadFv/hBGeymBGs7ilszbv1fUhnqIkHnqY/F0EEqNOBz18JzzcDpMrAp+u5H3U5DFUWFBGN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NddprNSd; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c7199e7f79so558938985a.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 08:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771345377; x=1771950177; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6hoB6WyA1hSPU/4bSW8UFq9fLmTfsAgDv27+wy6oAzs=;
        b=NddprNSdP7Lf34IpCGoAzpustgclcAt9SdxtA7QS6FYvnVPTfxHi3nIkJk550+AdcU
         T91xeG/RjGGlLFTcrn5b6fVpFoT1pj8zzGzvs4qPCLNjGifAEacPRRPsIpyy1puH3TmO
         VxGFSisUaeehEYoM1THesvQriZQr0EC8jxVyDZqmxlZqxwYRu37pNrDzO/mEIfZo88qI
         xFd+45DlzbRf6egcyTjWjCtq0NFzeNUNK/CJqTa/xesGAkm+fMvK7SCr87AMHGD+xlgQ
         KpvUbWNFtoleEzvCp150NkNnY2dpgjl8XBg6wX0BYZy2xGotdvKYuJdxqaoulcqehhb3
         G3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345377; x=1771950177;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hoB6WyA1hSPU/4bSW8UFq9fLmTfsAgDv27+wy6oAzs=;
        b=KcO92CAAXz9gIe8PXqPiWMTbI5yXbPNcqpM6IHOaQY4rWxAtiPbV8RIKZisCt3DoxN
         WYNNeiiiAvFdQmPCOLXmEc40bAfBNYQxiKiD1FQ8YuL2wG8PBFbJ1isOKqLdVkPI9npo
         ElmSHHfHlGUmBx8jHTHDqfrIF6jDhOEilsoR8/+tIV3KIM8eqe6NIaV5UiTmE0W3oRjh
         wliQT1ytRCH/TnQrkXGF/K3kxK8LwwvtR/VvBLChU4ZF/KzW8VQhO4oPfxrNPZg1nvcb
         2s+UNo7QPry1JR9htpSxFdAG0Emr/qjpzsdTDh5xzCSnR5AJ1JP0g2VXAB92mFHT5dOq
         2vpg==
X-Gm-Message-State: AOJu0YyKKUbWsaCwA0QzSM5wkqwgjzfZQIoxgp3Lf+LvPU4uNMU8wsxg
	sqjAT2XdM87AmJqdGXm2OHeIIka8OTQ3z4MZUQZv0mKyyWbBQSw4/rbY+GU+H3SVI5MjfuiB5CK
	qk/4=
X-Gm-Gg: AZuq6aJMjrU7YnLzrDosdVnWrfIlMdJgslbdIYEMjj5ZmGFDufJhgV+7KLr+7HPEk0M
	kAdWM3GjUS2DqXEH2M8CC6VVfbkRKwUDeLs4WSZgtY19loXCQt0PWUYBthVMunqzOxztI6nO0qV
	c/rz3KzxtcNtUzIkTh8m4TK5bNY0NAmSPEUlEUFmvdREM11a73oH/oTAun4jRdCYgY4iyCpN2ZQ
	FaPCR4/Npr3y2NzvGsEALgAuTOEnwfvBg2wTsu0Px+a9kr/dyhDtna8s4oJ+1h0VsfITzBfeuCQ
	LYxPAm/pZ0JWycuyWG9Ow4LuJvWQqkNf05I3B3BuvG+URdc1tD+R7pQXt9HcQAjzXZugEhqe9t/
	HYYsiqVY06EQjP8Dlw8BApk8pl7c7xq80VGMsX2ebHBMPkuacyWYYJ31EkleDtuKFedR/jZMn5b
	rrgfjausMp6RmZlPE8DEZ001xS
X-Received: by 2002:a05:620a:3707:b0:8cb:44d7:39aa with SMTP id af79cd13be357-8cb4c011f20mr1476698585a.74.1771345377088;
        Tue, 17 Feb 2026 08:22:57 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0f38afsm1575948385a.22.2026.02.17.08.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 08:22:56 -0800 (PST)
Date: Tue, 17 Feb 2026 11:22:54 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH v2 1/3] USB: usbcore: Introduce usb_bulk_msg_killable()
Message-ID: <32a96517-104c-423a-b1b1-8dd139192900@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33409-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B85C714E1B2
X-Rspamd-Action: no action

The synchronous message API in usbcore (usb_control_msg(),
usb_bulk_msg(), and so on) uses uninterruptible waits.  However,
drivers may call these routines in the context of a user thread, which
means it ought to be possible to at least kill them.

For this reason, introduce a new usb_bulk_msg_killable() function
which behaves the same as usb_bulk_msg() except for using
wait_for_completion_killable_timeout() instead of
wait_for_completion_timeout().  The same can be done later for
usb_control_msg() later on, if it turns out to be needed.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Oliver Neukum <oneukum@suse.com>
Link: https://lore.kernel.org/linux-usb/3acfe838-6334-4f6d-be7c-4bb01704b33d@rowland.harvard.edu/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
CC: stable@vger.kernel.org

---

 drivers/usb/core/message.c |   79 +++++++++++++++++++++++++++++++++++++++------
 include/linux/usb.h        |    5 +-
 2 files changed, 72 insertions(+), 12 deletions(-)

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

