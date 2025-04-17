Return-Path: <linux-usb+bounces-23206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E8BA9201D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 16:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E935019E717E
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 14:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF69252292;
	Thu, 17 Apr 2025 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cbus9TH+";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cbus9TH+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611442528EC
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901253; cv=none; b=V1RBKKeznx6c/V+gkE5dGXCi5UMyF0jCPBVot62VraY1oLAoielPmTuZ1JRA7kYPfyqBGHPFCHxTW0PpCgHc2XHXzcm3D4EppUddud0KfofKRWbwi2AZb5c6Wpd6LrbtlyoKKH16AOLLrbcBmVKoewu7B6dP4STOVgqxOkFy6so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901253; c=relaxed/simple;
	bh=bLVi4iTXYbVXRC1rmtXA25tk7+VoXwKtiDxGRRutAI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0xDBUPiFi9z0dree9rgoPp4C+S9XvE5ezCRBYhd7D3e0Kc3ri5+qgvdPd4s9qRsRZCZbUeN7AUs7PSP78dExUWqzJjabrShQIk6ODJ+pQP9EHJJXVfFcjbcquXyS403FP7V4/AgM8r8BWFKDsts+PNAxU2JumFRxlhMpEbz0DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=cbus9TH+; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=cbus9TH+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9283B2118F;
	Thu, 17 Apr 2025 14:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744901242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNjOY2CZ0XjHZR69hwLjB/sl1/yBz/HDhiyYYIj2CL4=;
	b=cbus9TH+im9iAZtYazbGRb/kcffua1pyWEp3SuxOZNtUxj3MdHZKCo1wBpjbRretBQFlnx
	lppJAtRt6BPAaS64yH49xPta/P5tscGDE+5X248q/AnRPiGYfZcQH7E5jyzXemHOCHrgvR
	iekQ5Lf9x+h2NSSpdPKHzeQqBRglnPk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744901242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNjOY2CZ0XjHZR69hwLjB/sl1/yBz/HDhiyYYIj2CL4=;
	b=cbus9TH+im9iAZtYazbGRb/kcffua1pyWEp3SuxOZNtUxj3MdHZKCo1wBpjbRretBQFlnx
	lppJAtRt6BPAaS64yH49xPta/P5tscGDE+5X248q/AnRPiGYfZcQH7E5jyzXemHOCHrgvR
	iekQ5Lf9x+h2NSSpdPKHzeQqBRglnPk=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76846137CF;
	Thu, 17 Apr 2025 14:47:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yP3IG3oUAWidWQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 17 Apr 2025 14:47:22 +0000
From: Oliver Neukum <oneukum@suse.com>
To: keithp@keithp.com,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC 2/3] chaoskey: introduce asynchronous reads
Date: Thu, 17 Apr 2025 16:45:28 +0200
Message-ID: <20250417144719.182160-3-oneukum@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417144719.182160-1-oneukum@suse.com>
References: <20250417144719.182160-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

This divides requesting IO and waiting for IO from each other.
This allows for nonblocking IO.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/chaoskey.c | 58 +++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
index 45cff32656c6..4c53e432c416 100644
--- a/drivers/usb/misc/chaoskey.c
+++ b/drivers/usb/misc/chaoskey.c
@@ -345,15 +345,12 @@ static void chaos_read_callback(struct urb *urb)
 	wake_up(&dev->wait_q);
 }
 
-/* Fill the buffer. Called with dev->lock held
- */
-static int _chaoskey_fill(struct chaoskey *dev)
+static int chaoskey_request_fill(struct chaoskey *dev)
 {
 	DEFINE_WAIT(wait);
 	int result;
-	bool started;
 
-	usb_dbg(dev->interface, "fill");
+	usb_dbg(dev->interface, "request fill");
 
 	/* Return immediately if someone called before the buffer was
 	 * empty */
@@ -378,19 +375,27 @@ static int _chaoskey_fill(struct chaoskey *dev)
 
 	dev->reading = true;
 	result = usb_submit_urb(dev->urb, GFP_KERNEL);
-	if (result < 0) {
-		result = usb_translate_errors(result);
-		dev->reading = false;
+	if (result < 0)
 		goto out;
-	}
 
-	/* The first read on the Alea takes a little under 2 seconds.
-	 * Reads after the first read take only a few microseconds
-	 * though.  Presumably the entropy-generating circuit needs
-	 * time to ramp up.  So, we wait longer on the first read.
+	/*
+	 * powering down while a read is under way
+	 * is blocked in suspend()
 	 */
-	started = dev->reads_started;
-	dev->reads_started = true;
+	usb_autopm_put_interface(dev->interface);
+	return 0;
+out:
+	dev->reading = false;
+	usb_autopm_put_interface(dev->interface);
+	return usb_translate_errors(result);
+}
+
+static int chaoskey_wait_fill(struct chaoskey *dev)
+{
+	DEFINE_WAIT(wait);
+	int result;
+	bool started = dev->reads_started;
+
 	result = wait_event_interruptible_timeout(
 		dev->wait_q,
 		!dev->reading,
@@ -406,10 +411,17 @@ static int _chaoskey_fill(struct chaoskey *dev)
 		usb_kill_urb(dev->urb);
 	} else {
 		result = dev->valid;
+
+		/* The first read on the Alea takes a little under 2 seconds.
+		 * Reads after the first read take only a few microseconds
+		 * though.  Presumably the entropy-generating circuit needs
+		 * time to ramp up.  So, we waited longer on the first read.
+		 */
+		dev->reads_started = true;
 	}
+
 out:
 	/* Let the device go back to sleep eventually */
-	usb_autopm_put_interface(dev->interface);
 
 	usb_dbg(dev->interface, "read %d bytes", dev->valid);
 
@@ -458,7 +470,12 @@ static ssize_t chaoskey_read(struct file *file,
 				goto bail;
 		}
 		if (dev->valid == dev->used) {
-			result = _chaoskey_fill(dev);
+			result = chaoskey_request_fill(dev);
+			if (result < 0) {
+				mutex_unlock(&dev->lock);
+				goto bail;
+			}
+			result = chaoskey_wait_fill(dev);
 			if (result < 0) {
 				mutex_unlock(&dev->lock);
 				goto bail;
@@ -526,7 +543,7 @@ static int chaoskey_rng_read(struct hwrng *rng, void *data,
 	 * the buffer will still be empty
 	 */
 	if (dev->valid == dev->used)
-		(void) _chaoskey_fill(dev);
+		(void) chaoskey_request_fill(dev);
 
 	this_time = dev->valid - dev->used;
 	if (this_time > max)
@@ -546,6 +563,11 @@ static int chaoskey_rng_read(struct hwrng *rng, void *data,
 static int chaoskey_suspend(struct usb_interface *interface,
 			    pm_message_t message)
 {
+	struct chaoskey *dev = usb_get_intfdata(interface);
+
+	if (dev->reading && PMSG_IS_AUTO(message))
+		return -EBUSY;
+
 	usb_dbg(interface, "suspend");
 	return 0;
 }
-- 
2.49.0


