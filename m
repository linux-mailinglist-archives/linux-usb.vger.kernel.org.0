Return-Path: <linux-usb+bounces-33180-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNkSKL9HiWm25gQAu9opvQ
	(envelope-from <linux-usb+bounces-33180-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 03:34:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 446DA10B27D
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 03:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8CDE3008264
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 02:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACCC2DB79E;
	Mon,  9 Feb 2026 02:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="q4IRfJLM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA422C159E
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 02:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770604387; cv=none; b=bXAwFAtwIraijvqgz71ELav3Fh7ufepKoFM8q/muCYhulibq1ZM5wuzGBths/PACuxJy2CS8DN5/epRaR25EW6Nt08LQEz0WBFm+/tuMz9DrzBGYX2WM/vwUE7o9tk5LWwMoBLHnXhD2vlzA065y5mSeCjwrw67ldZ5iTsYfYFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770604387; c=relaxed/simple;
	bh=HNyAQPkd1/sNxiU/sbvMcB8f1gR3dQSR9ozEa01S7oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cgq+CzUFBV8CoFH77r8zkMGtzyiQygND50GMK6bIW6gkfz/zoXmwUjp+LFg8POM8Qn+jtTNjznR7AvmO/u9/gG8O6tfSXj7BJ9dL8qTN0VDFdwiyLnKTHRECYWtYW5L0EdagfBOrQURjCEZ5bZARwS/XiubYuKxWzm3Q07CoVwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=q4IRfJLM; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c655e0ee70so402739485a.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 18:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770604386; x=1771209186; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spRx2fwF/zAvIb4fAOSWdncTERFG5nCPw3fWv1oYZss=;
        b=q4IRfJLM11H01Wdw8VWEYp5DOx6PILgVKaycdh5dqdMn8VlwOJlzC2ej5pI4PYefG/
         GHAMG62bTDHNn0wMbKnqnNuoxGefqT8YKDAm6ki9LbsXJqC69JZ0Wpe5CnHPpbGYOHRR
         empxVbROPT4h0L0j1Lz2c9jct/y3NcszSeVBOX+UCoL5gS7puMLCMFFvN7xZqyKmO6cq
         AHkxlYgJ3WZCFGhNMjh5bL62NqucMQbzt+cnV1T4ySsxK2YzHMB2BIevRjwghzYFwZ6C
         A2t0BN/fKQrpVQE7MxM40uzCpB8AedW4pggHYj0KybVAAl6URV0sU02fnQ7M0fsNkGo1
         EJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770604386; x=1771209186;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spRx2fwF/zAvIb4fAOSWdncTERFG5nCPw3fWv1oYZss=;
        b=cj76TVXj8yPPZ5Z2VGoa0E9o6ed4Kb79IItZF+HHVpSKSBAKJRK+Uhw2fUJREScLmu
         YE5GCv2pc9dL1tQbe1jbsrNlSqgfsuhpQC7IIqxLu161WDWxW2KUGKK7g7Tk9a+oUqav
         x4EdyD/xCSaLYUvnuz+0HcBNwb0ywS/7xMT8+1/vjnYVvSQPy5lls4QXHDhUnh95lBt8
         tSFdYxErRWpn5n6d1EQxpEGR4LTLNQgW9P+1BEwQqtTYONpMfSWkO/yljuU/bJatGf/g
         03k3bA0yT94uo2tPBbL6aq77m1qwPH29lLyIBxdEAlPEiLb/o1vLMH79bcbLntLaICk2
         5V/Q==
X-Gm-Message-State: AOJu0Yx8I+FqiMjxk3zJ9M0HsR5n52ztoE8SuOa/lxmCS8VlHmQskAdZ
	gOkXSZMgeNWS0u2I537X2z9MzMR8aC0n1h5olMglQiEuTGgQ/T8aOa5M7ZK5S8AjDNOJkwJrSXd
	UDZU=
X-Gm-Gg: AZuq6aLq+INRK/92QL/1WKr0/BWFBCiyeYb2Lqyv6OcJBh4EbEKdGc3yzXjYIzZTs2i
	NurJInUOse/yDZltG6lXG3x24SRO1GYQ+y9E8XY+Y3v4x91izJSSQ1LnkG0E4sRmnJkPlumBTC2
	DibWAz9/D7jXs0Zy//qxK1elCNxNPR4EwWPp7ME+vVl197NXt2lfT3ugNP0n8ttHFCr3j0gvHHB
	ipcJ7JtGGRnCoEGL/7kHmT7cQ2PQDgmlLPQAaUWbF+ivVsVmjFqvAxRPLVu0QDabn4u3y51VMGJ
	qdV4/TYx/vW3dp1GooCyZt97fkOz4KYM+DTyZ+C1pbJOtFLLO9X6VdDipQUcfM9AgyH2D8Mp1nb
	aMOdaN7R+XJX0dR2paNtCBzrOTI1V75dYEvaFB+Km/V++Yj3Euc85CPv0gMDzgPc5gI9rM0jfUh
	C3COS3EHsP0iV5
X-Received: by 2002:a05:620a:4546:b0:8b2:2066:ffca with SMTP id af79cd13be357-8caf1ace0cemr1444929085a.82.1770604386414;
        Sun, 08 Feb 2026 18:33:06 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf77f6f05sm712223585a.1.2026.02.08.18.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 18:33:05 -0800 (PST)
Date: Sun, 8 Feb 2026 21:33:02 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <greg@kroah.com>, Oliver Neukum <oneukum@suse.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: RFC: Prevent long uninterruptible waits in usbcore
Message-ID: <3acfe838-6334-4f6d-be7c-4bb01704b33d@rowland.harvard.edu>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-33180-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 446DA10B27D
X-Rspamd-Action: no action

I'm asking for comments on the patch below.  The problem it fixes is 
that usb_start_wait_urb(), which is used by utility routines like 
usb_bulk_msg() and usb_control_msg(), can have arbitrarily long 
uninterruptible waits.  And of course this can trigger the kernel's 
warning about a hung task.

Normally this isn't a problem, because drivers calling these routines 
generally specify timeouts on the order of 10 seconds or less.  In the 
particular case found by syzbot, however, the usbtmc driver uses a 
timeout value that it gets from an ioctl with no checking for 
excessively large numbers (see usbtmc_ioctl_set_timeout()).  We could 
change this one function, but what about other drivers?  There should be 
a single policy on how we handle these things.

Now, I suppose the reason that the usb_start_wait_urb() uses 
uninterruptible waits is that drivers don't want their calls to be 
interrupted and aren't prepared for that possibility.  But we also don't 
want them to tie up a kernel thread in a ridiculously long 
uninterruptible wait state.

I thought that a reasonable compromise would be to keep the 
uninterruptible waits for timeout periods less than 60 seconds (somewhat 
arbitrary, but hopefully short enough not to trigger the hung-task 
detector) and make them interruptible if the timeout is longer.  The 
idea is that long USB timeouts don't normally arise in the kernel, so 
they are probably caused by a user request (or a bad device), which 
would mean that interrupting them wouldn't be such a bad thing.

Any other ideas or thoughts about this?

Alan Stern

 drivers/usb/core/message.c |   22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -25,6 +25,8 @@
 
 #include "usb.h"
 
+#define MAX_UNINTERRUPTIBLE_TIMEOUT_MS	60000
+
 static void cancel_async_set_config(struct usb_device *udev);
 
 struct api_context {
@@ -42,16 +44,16 @@ static void usb_api_blocking_completion(
 
 
 /*
- * Starts urb and waits for completion or timeout. Note that this call
- * is NOT interruptible. Many device driver i/o requests should be
- * interruptible and therefore these drivers should implement their
- * own interruptible routines.
+ * Starts urb and waits for completion or timeout.  Timeout lengths <= 0
+ * are taken to be as long as possible.
+ * The wait is NOT interruptible if the timeout period is no longer than
+ * MAX_UNINTERRUPTIBLE_TIMEOUT_MS, otherwise it IS interruptible.
  */
 static int usb_start_wait_urb(struct urb *urb, int timeout, int *actual_length)
 {
 	struct api_context ctx;
 	unsigned long expire;
-	int retval;
+	int rc, retval;
 
 	init_completion(&ctx.done);
 	urb->context = &ctx;
@@ -60,8 +62,14 @@ static int usb_start_wait_urb(struct urb
 	if (unlikely(retval))
 		goto out;
 
-	expire = timeout ? msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOUT;
-	if (!wait_for_completion_timeout(&ctx.done, expire)) {
+	expire = (timeout > 0) ? msecs_to_jiffies(timeout) :
+			MAX_SCHEDULE_TIMEOUT;
+	if (expire <= msecs_to_jiffies(MAX_UNINTERRUPTIBLE_TIMEOUT_MS))
+		rc = (wait_for_completion_timeout(&ctx.done, expire) > 0);
+	else
+		rc = (wait_for_completion_interruptible_timeout(
+				&ctx.done, expire) > 0);
+	if (!rc) {
 		usb_kill_urb(urb);
 		retval = (ctx.status == -ENOENT ? -ETIMEDOUT : ctx.status);
 


