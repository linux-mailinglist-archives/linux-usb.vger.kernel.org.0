Return-Path: <linux-usb+bounces-33214-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CW7Bbc8immsIgAAu9opvQ
	(envelope-from <linux-usb+bounces-33214-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 20:59:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 799111144DD
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 20:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D929D300B9C1
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 19:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16074279E0;
	Mon,  9 Feb 2026 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QdxOfPc0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12083815D8
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 19:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770667188; cv=none; b=Jl9WL8G1mzwMzq/qJZB69Eo+HcxkQk4ie5aw527Gdt5nWD2BzNAxeweZE46LplzrTjnka/VwviDAikJ3+7q5faS8h+VoBlYDEkw3dgZky9SmloxNb9ul3JqmoGl2BCcqivALQfyHu6SyC7aAqz360pbRkjW3gcp7AM7O2K7IV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770667188; c=relaxed/simple;
	bh=hl0RPI+cLOhNnIDr9VwrS8sG3f7svaxjUUKnnzAsR0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=tFOgc+NqDsmmEAN5QdomXpJMGsoWB+4Q+JY4pfWqJMGT0qxLdEsEoPVWMyjLT3S9X+iS4r4J/ikfkkKfAoACjdeSdPq5y1uhre4wmJeEV3OSD0aexkKTGy4hso6KL+tNleRwD4bn4Z7ZcIiBrYtZoeRbPfLpz9E63cGtolMFc4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QdxOfPc0; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8947404b367so54600716d6.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 11:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770667187; x=1771271987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2S3m7EVH3BnkwleIABTrztuKM8QgjP5xqlEVpCB0EA=;
        b=QdxOfPc0plI7Sze86iEqFIoJsfm3sDcOkHPmPejxgMI9RiAaOyu7C2x2O/Ix4/kmHt
         IL77YiJSkPhkm0Rcuuikjo7lAcEpiPqMnY6JKaTlvKm1mS5lYIl0Mr6QXjN4sUaCohWh
         mdVJ+ARCCP3pNRb1Lg3gP4/j+tTJEhnd+YsXcFJ/1uaap7+Yk8qgp9UDmWJ8KHBOuHyM
         yIa49Q/+KXJV4lzoK/Pz9wzH/EPh434Sbr/ZaGE28jSlPcxFK7rBvYh2sgdn71572GZp
         xSkBhFgJPW3eaVDJxwTLx421JQzOpNCLpsaAzaRbpfYhAca7S7sA8ykLVIqfQ6QoYXFZ
         UGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770667187; x=1771271987;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2S3m7EVH3BnkwleIABTrztuKM8QgjP5xqlEVpCB0EA=;
        b=O/5afByMLU2o/AMmaHu7UCRtBv33mY5eZQ2e/zivX2ThicrlCI97FjJlQv0P1SJzur
         vf53gC80ptw0QqXFy2yGAxVfoV6+qEg0DFrTT6rqexTOYDfx6/iqzRYDhUevUmppDdpA
         6nQR/rmVbO2zx5FJ8r0SkmJuPd52EfPaTQwp1r73njAdRwswc7JqUbrMX2/MEEXyROLT
         t/EskdmvqN0cn4jI6vEZcNh5l8hZLM7YCCasLZeDw7/s6Mm4AvCBH4dXGJ6rqg3gfSHN
         zcmurRs0d9MV+8iKJgcWyRElg2kojLmn1yHwP2FYgXfOKILjbYLCvjIgeIVvYRxuocFw
         3swQ==
X-Gm-Message-State: AOJu0YwJgF0PerYVe+7EbbEvfY4I5tomVZTvjhaRaATAkUVDs7vXNIvI
	LSQ5V/QoYOGdj34IBQhjHHOMgdiDG+2ACUQkmQtP16sDmYbH2JeQbbk5xMYCH8vJIKNbgwRM1UB
	Wv7A=
X-Gm-Gg: AZuq6aKKGT9k5Qd12di8zJJ1PPrDH5ABX7DmfDITEiL9iUCqSyTjoBztzMDlQgWZ6OW
	OPWBv4pQBwK9RvsmQfsuq5prGG6CjLF5pkJgNWlg5FCDqAk0/fUEgyF4Gur4aEFNCGXynrfgQ3Z
	s60QKxwY0RdI5B6dR6amPQXHj4UognXZqD3cHIbi/HrXbwwYEEFYNs+IDW6lBjRdGUALBTwgSnr
	rFfi0D2rCEe4cugTBNjEgqJKTSjLWU0CeLrJb5q01dLCHStLp/1RDS+RUMh8M2xYwCbcOEXyAAE
	Zp/u/iw92zO5nAijQF4Vjd/WJBW4NYikXxmHRD77OoDjLymByW1GhnkZwB9NBXGr6wvRVCCcNLQ
	5lw5SI62uTltitMhJ5/7py+C1AsRJst2ESReTJVYi33eYWxBBQybt8J91LVt2tP9VTtP7TlKUrG
	YIgN7e05OsK5iqMr2XbqMMgWJ/+8CXbYAHSXAqDJnW7YV7/GcuzJB+rWgJDv1HvGQ3kP91GX4Tp
	N6IifsI
X-Received: by 2002:a05:6214:2aa8:b0:896:f7ed:6eef with SMTP id 6a1803df08f44-896f7ed7b58mr87211656d6.20.1770667186868;
        Mon, 09 Feb 2026 11:59:46 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-25.harvard-secure.wrls.harvard.edu. [65.112.8.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c03fc95sm83978596d6.26.2026.02.09.11.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 11:59:46 -0800 (PST)
Date: Mon, 9 Feb 2026 14:59:44 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 1/2] usbcore: Reject excessively long uninterruptible timeouts
Message-ID: <9a7f1f3d-7063-426e-85be-e32a5e2dc431@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b00f3ac-321d-46f0-86f5-eb66b3cdb3f3@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33214-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 799111144DD
X-Rspamd-Action: no action

The synchronous message API in usbcore (usb_control_msg(),
usb_bulk_msg(), and so on) allows unlimited timeout durations.  And
since it uses uninterruptible waits, this leaves open the possibility
of hanging a task for an indefinitely long time, with no way to kill
it short of unplugging the target device.

To prevent this sort of problem, enforce a maximum limit on the length
of synchronous timeouts.  The limit chosen here, somewhat arbitrarily,
is 60 seconds.  On many systems (although not all) this is short
enough to avoid triggering the kernel's hung-task detector.

Note that this will affect the timeouts accepted by the
USBDEVFS_CONTROL and USBDEVFS_BULK ioctls in usbfs, since they rely on
the synchronous message API.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://lore.kernel.org/linux-usb/3acfe838-6334-4f6d-be7c-4bb01704b33d@rowland.harvard.edu/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
CC: stable@vger.kernel.org

---

 drivers/usb/core/message.c |   23 ++++++++++++++---------
 include/linux/usb.h        |    3 +++
 2 files changed, 17 insertions(+), 9 deletions(-)

Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -46,6 +46,9 @@ static void usb_api_blocking_completion(
  * is NOT interruptible. Many device driver i/o requests should be
  * interruptible and therefore these drivers should implement their
  * own interruptible routines.
+ *
+ * Because the wait is uninterruptible, we enforce a maximum limit on
+ * the length of the timeout.
  */
 static int usb_start_wait_urb(struct urb *urb, int timeout, int *actual_length)
 {
@@ -56,11 +59,17 @@ static int usb_start_wait_urb(struct urb
 	init_completion(&ctx.done);
 	urb->context = &ctx;
 	urb->actual_length = 0;
+
+	if (timeout <= 0 || timeout > USB_MAX_SYNCHRONOUS_TIMEOUT) {
+		retval = -EINVAL;
+		goto out;
+	}
+
 	retval = usb_submit_urb(urb, GFP_NOIO);
 	if (unlikely(retval))
 		goto out;
 
-	expire = timeout ? msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOUT;
+	expire = msecs_to_jiffies(timeout);
 	if (!wait_for_completion_timeout(&ctx.done, expire)) {
 		usb_kill_urb(urb);
 		retval = (ctx.status == -ENOENT ? -ETIMEDOUT : ctx.status);
@@ -173,8 +182,7 @@ EXPORT_SYMBOL_GPL(usb_control_msg);
  * @index: USB message index value
  * @driver_data: pointer to the data to send
  * @size: length in bytes of the data to send
- * @timeout: time in msecs to wait for the message to complete before timing
- *	out (if 0 the wait is forever)
+ * @timeout: time in msecs to wait for the message to complete before timing out
  * @memflags: the flags for memory allocation for buffers
  *
  * Context: !in_interrupt ()
@@ -232,8 +240,7 @@ EXPORT_SYMBOL_GPL(usb_control_msg_send);
  * @index: USB message index value
  * @driver_data: pointer to the data to be filled in by the message
  * @size: length in bytes of the data to be received
- * @timeout: time in msecs to wait for the message to complete before timing
- *	out (if 0 the wait is forever)
+ * @timeout: time in msecs to wait for the message to complete before timing out
  * @memflags: the flags for memory allocation for buffers
  *
  * Context: !in_interrupt ()
@@ -304,8 +311,7 @@ EXPORT_SYMBOL_GPL(usb_control_msg_recv);
  * @len: length in bytes of the data to send
  * @actual_length: pointer to a location to put the actual length transferred
  *	in bytes
- * @timeout: time in msecs to wait for the message to complete before
- *	timing out (if 0 the wait is forever)
+ * @timeout: time in msecs to wait for the message to complete before timing out
  *
  * Context: task context, might sleep.
  *
@@ -337,8 +343,7 @@ EXPORT_SYMBOL_GPL(usb_interrupt_msg);
  * @len: length in bytes of the data to send
  * @actual_length: pointer to a location to put the actual length transferred
  *	in bytes
- * @timeout: time in msecs to wait for the message to complete before
- *	timing out (if 0 the wait is forever)
+ * @timeout: time in msecs to wait for the message to complete before timing out
  *
  * Context: task context, might sleep.
  *
Index: usb-devel/include/linux/usb.h
===================================================================
--- usb-devel.orig/include/linux/usb.h
+++ usb-devel/include/linux/usb.h
@@ -1863,6 +1863,9 @@ void usb_free_noncoherent(struct usb_dev
  *                         SYNCHRONOUS CALL SUPPORT                  *
  *-------------------------------------------------------------------*/
 
+/* Maximum value allowed for timeout in synchronous routines below */
+#define USB_MAX_SYNCHRONOUS_TIMEOUT		60000	/* ms */
+
 extern int usb_control_msg(struct usb_device *dev, unsigned int pipe,
 	__u8 request, __u8 requesttype, __u16 value, __u16 index,
 	void *data, __u16 size, int timeout);

