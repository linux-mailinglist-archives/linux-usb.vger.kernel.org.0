Return-Path: <linux-usb+bounces-33424-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RwW3NRAtlWmkMgIAu9opvQ
	(envelope-from <linux-usb+bounces-33424-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 04:08:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0645E152CA6
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 04:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A81BF300AD50
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 03:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7561286D72;
	Wed, 18 Feb 2026 03:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TayTpTlG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3442566F5
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771384073; cv=none; b=oHQvOEQY3Fp6lQEWK6VsK2nxSKPr7pO19GSi+RtJOHwCzL14ISBxleKHJ7qNou/cZjb8piLAdCVob/HQcXstEV+Rzq/NRtxH4+OzDy9DibeGADG99bn82XD7Mj7+vYcK7LmYTnXc1ctcqCQCVQxYEdyLU1s1WaNPEUPp0TWUy0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771384073; c=relaxed/simple;
	bh=VgrpbeRkKk3PU+HlEFX6IXCCGFKZm6mG5RpHBhSnm7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dfIZwqwyN2RBpnm5F6pE0fmv07Dqr7jyMfxyRM1VV5bBsnBi+uXp1aXGkBDH1IeXx5K0wrhsown62LR9xaHHkowd4XwVzkZJZnepPwVpLS8Uy5cCEfIGVuZb/w2wbFEKESoGNxVn/8Ie5MyHhLJGizS9p20HSrztnk/yvZLZHE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TayTpTlG; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5069df1de6fso39350531cf.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 19:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771384071; x=1771988871; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ogFecK1WFaK/644WK3vMJcQQffUq8C31vXxbOF1wAk=;
        b=TayTpTlGeSaL5vGkZmvUNfPN7OjnSjm/BznvqDZDeyh936Peuk2GnQo2jGBdT42Z4g
         GzcKFm8jB1x/TSnIFsuWrD/FtTjsgANYLhUxIrZL0NKiT9js3A617ptAr/dMjG92SeoF
         DommMXuz9zF5l1qD0hdIP8f/FPpY61lnFK0D9w6YWD45YlgoQNc2tCmmDNztPtfNkEhj
         F66YzmIESmI8poANBuV+GCeHuNSvL7cJRwadNIGd95ZAjYZKEGHM+Bb35z+lFBrRXxzB
         zUlUMLKnGJ/mjiNhsJ5EH6oy0eU5l9SJWTg+NxkIPFkwj1mP+JT+uVEHAzsbJAUHhbDf
         Nx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771384071; x=1771988871;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ogFecK1WFaK/644WK3vMJcQQffUq8C31vXxbOF1wAk=;
        b=s0tWT3RvqwCtHtAmNybSBn9lRULGnc+u25zLIMru8QrCnVFMHu5HU96lDkd/4Pbsq8
         ay42V/yvBXshIquZpqe3WTUNlXWznQO137pGDcNaCBSt9+s1YfFRfTiw189KJ+Fx5IJh
         KsSZU6oMGAN6AJSEJ1PG91JDoucHWVXC/wUwpExjt6TDBnv5jt40kdxApnccynPj3/Jb
         dUHOc4D/M6uUm4x9IFNTPbGbS0tDCJid2j644PRi7XKnh3i3wBuM3l5bNfJIAiwNZ3y7
         cy22/aXLrPG/UeMS6ol/28to44hEtEB0QBct/E+GW9AylbaiIaBBz9+BKLAIjEmpAmf8
         l3pw==
X-Gm-Message-State: AOJu0YwC+1o5k164MVJ//LMzFFiCz2jkFsFaOiSPXLoHBQJdpYV6dmFd
	7YJdDi2MhI0aCg/pyhy2I3hqjph7xU8BT78mVEz3yX8TDyUb7WU6ATDGASjbVhG+sXiJn3pBVNA
	CMb4=
X-Gm-Gg: AZuq6aKgngsS8lF7W/FRJNqUMAGV066MuTig9QBuahs5DV7mHUPDjz2QCSsHK+e1av0
	64BWyWYLCzvdyIGw0teDF2kVJHnsfKk8Ozxoiv24sVmWcidkNoMgCpYZ4np+z0zdbHPRiRKCdKx
	bUSAls5tN4g+c7c1xf9o/CSU0UVabW1XNI+3fUGm6yoL6ftx0b611KhQEAwwkj9PaOygmzRYOGC
	6+l7ZTM6bcgma2WYrbXN0TjBmbzdOa2Kke8WXa4uh9DpJYV2l2MeAobH688UfOcO8YKZNqxCHQF
	GQkVXjBHK5EnwozOlf6L+x9YztNaJJbggVa0CUoazJrCHIdqeGjv6NiVWxlqlrSi5aDuD7AQGHo
	MuBVoOw1gpHxtr5MkfTIPMMkYIovppLkKkHpprOe0nc+tl7RAjOK2p3PE1I+9ctYwMh65B5tXpO
	q/rXSvJgNRHQ7W2j+zi0qClL2m
X-Received: by 2002:a05:622a:1910:b0:4f1:83e4:6f55 with SMTP id d75a77b69052e-506b3f7e410mr170148691cf.16.1771384070611;
        Tue, 17 Feb 2026 19:07:50 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684b94f33sm167478291cf.25.2026.02.17.19.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 19:07:50 -0800 (PST)
Date: Tue, 17 Feb 2026 22:07:47 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH v3 1/3] USB: usbcore: Introduce usb_bulk_msg_killable()
Message-ID: <248628b4-cc83-4e81-a620-3ce4e0376d41@rowland.harvard.edu>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33424-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0645E152CA6
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

v1:	This patch had no v1.

v2:	Add usb_blk_msg_killable().

v3:	Add the revision log that was left out of v2.

Question: This implementation of usb_bulk_msg_killable() duplicates
almost all of the code in usb_bulk_msg().  It's very close to the
boundary where I would have both routines call a common function to do
their real work, passing it all their arguments together with an extra
"killable" flag.  Do you think it should be reimplemented that way, or
is this okay?

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

