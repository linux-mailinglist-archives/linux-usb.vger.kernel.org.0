Return-Path: <linux-usb+bounces-36780-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPfTKLxI82kMzAEAu9opvQ
	(envelope-from <linux-usb+bounces-36780-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 14:19:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2944A2ADF
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 14:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD72F3005595
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 12:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D274402B89;
	Thu, 30 Apr 2026 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RG9GRPvB";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RG9GRPvB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2912A3DA7ED
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 12:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551545; cv=none; b=r+08aaWJ5IlGB0g1fQozpDMW0/H1DdNnBstecgky8AoGWjwLcMWWtYoQifVqPqkFUxzt4TKOIJ1UC1b1ES/xOff/FuSE/+ayL+180RiuzjJXP52zYLa11uxmZpCMwmXOdfZd+3T5NnW/NcCTFy3PgfovqZDVy40iBQ27MgcYuUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551545; c=relaxed/simple;
	bh=KZp8ANMTMO0Bgcfy6we7j+vPPJ7EtvwSDEaPaK3qVu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cMM5Z3ViSGC4w0lOQYYyn+NVLtx5pyCElZWvPkR/HsPVO37MPeker2PA0K0aabTIe9jBM3g7LzXyoA777+zeWeGrM2rG4ISVkCQxw+cb+e5u7O2EP/l80hn/7xLpG0gr3xXMbY2hwtnaMdusKgq0p/hIlCca/eeMZsHOjd2hGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=RG9GRPvB; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=RG9GRPvB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 521096A821;
	Thu, 30 Apr 2026 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777551542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+lKtFKD8ACX03v43LkoqxOZ9aqtuFVA9WveFO/82i+s=;
	b=RG9GRPvBjPYfVrmLCbXmQK2b8YOp9f9uu0VTG+FArWjJvfJjqDNpboHZRVT++YnlsdkDGy
	mEbSGzIh6MtofOnLpxtS/upy3Y0LLRtWNTUp26GFeSUCiG9qmQ5NybP924Bcx+0pLNbW56
	2D3ZR7DDZa6yspF0fa8xSKLZejqlchk=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=RG9GRPvB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777551542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+lKtFKD8ACX03v43LkoqxOZ9aqtuFVA9WveFO/82i+s=;
	b=RG9GRPvBjPYfVrmLCbXmQK2b8YOp9f9uu0VTG+FArWjJvfJjqDNpboHZRVT++YnlsdkDGy
	mEbSGzIh6MtofOnLpxtS/upy3Y0LLRtWNTUp26GFeSUCiG9qmQ5NybP924Bcx+0pLNbW56
	2D3ZR7DDZa6yspF0fa8xSKLZejqlchk=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 374CD593B0;
	Thu, 30 Apr 2026 12:19:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FflsDLZI82lqbwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 30 Apr 2026 12:19:02 +0000
From: Oliver Neukum <oneukum@suse.com>
To: hanguidong02@gmail.com,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFT] usb: class: cdc-wdm: switch to kfifo for buffering
Date: Thu, 30 Apr 2026 14:18:05 +0200
Message-ID: <20260430121859.1018894-1-oneukum@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 5E2944A2ADF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36780-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The kfifo code is more efficient and takes care
of memory ordering without locking.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 60 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 7556c0dac908..9185295f5376 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -27,6 +27,7 @@
 #include <linux/wwan.h>
 #include <asm/byteorder.h>
 #include <linux/unaligned.h>
+#include <linux/kfifo.h>
 #include <linux/usb/cdc-wdm.h>
 
 #define DRIVER_AUTHOR "Oliver Neukum"
@@ -77,7 +78,8 @@ struct wdm_device {
 	u8			*inbuf; /* buffer for response */
 	u8			*outbuf; /* buffer for command */
 	u8			*sbuf; /* buffer for status */
-	u8			*ubuf; /* buffer for copy to user space */
+
+	struct kfifo		ubuf; /* payload */
 
 	struct urb		*command;
 	struct urb		*response;
@@ -92,7 +94,6 @@ struct wdm_device {
 	u16			wMaxCommand;
 	u16			wMaxPacketSize;
 	__le16			inum;
-	int			length;
 	int			read;
 	int			count;
 	dma_addr_t		shandle;
@@ -170,6 +171,7 @@ static void wdm_in_callback(struct urb *urb)
 	struct wdm_device *desc = urb->context;
 	int status = urb->status;
 	int length = urb->actual_length;
+	int processed;
 
 	spin_lock_irqsave(&desc->iuspin, flags);
 	clear_bit(WDM_RESPONDING, &desc->flags);
@@ -218,17 +220,13 @@ static void wdm_in_callback(struct urb *urb)
 		goto skip_zlp;
 	}
 
-	if (length + desc->length > desc->wMaxCommand) {
-		/* The buffer would overflow */
-		set_bit(WDM_OVERFLOW, &desc->flags);
-	} else {
-		/* we may already be in overflow */
-		if (!test_bit(WDM_OVERFLOW, &desc->flags)) {
-			memmove(desc->ubuf + desc->length, desc->inbuf, length);
-			smp_wmb(); /* against wdm_read() */
-			WRITE_ONCE(desc->length, desc->length + length);
-		}
+	processed = kfifo_in(&desc->ubuf, desc->inbuf, length);
+	if (processed < length) {
+		 set_bit(WDM_OVERFLOW, &desc->flags);
+		 /* WDM_OVERFLOW must not be set after WDM_READ */
+		 smp_wmb(); /* against wdm_read() */
 	}
+
 skip_error:
 
 	if (desc->rerr) {
@@ -372,8 +370,8 @@ static void cleanup(struct wdm_device *desc)
 	kfree(desc->inbuf);
 	kfree(desc->orq);
 	kfree(desc->irq);
-	kfree(desc->ubuf);
 	free_urbs(desc);
+	kfifo_free(&desc->ubuf);
 	kfree(desc);
 }
 
@@ -524,7 +522,7 @@ static int service_outstanding_interrupt(struct wdm_device *desc)
 static ssize_t wdm_read
 (struct file *file, char __user *buffer, size_t count, loff_t *ppos)
 {
-	int rv, cntr;
+	int rv, cntr, done;
 	int i = 0;
 	struct wdm_device *desc = file->private_data;
 
@@ -533,8 +531,7 @@ static ssize_t wdm_read
 	if (rv < 0)
 		return -ERESTARTSYS;
 
-	cntr = READ_ONCE(desc->length);
-	smp_rmb(); /* against wdm_in_callback() */
+	cntr = kfifo_len(&desc->ubuf);
 	if (cntr == 0) {
 		desc->read = 0;
 retry:
@@ -568,6 +565,13 @@ static ssize_t wdm_read
 			rv = -EIO;
 			goto err;
 		}
+		smp_rmb(); /* against wdm_in_callback() */
+		if (test_bit(WDM_OVERFLOW, &desc->flags)) {
+			clear_bit(WDM_OVERFLOW, &desc->flags);
+			rv = -ENOBUFS;
+			goto err;
+		}
+
 		usb_mark_last_busy(interface_to_usbdev(desc->intf));
 		if (rv < 0) {
 			rv = -ERESTARTSYS;
@@ -591,31 +595,27 @@ static ssize_t wdm_read
 			goto retry;
 		}
 
-		cntr = desc->length;
+		cntr = kfifo_len(&desc->ubuf);
 		spin_unlock_irq(&desc->iuspin);
 	}
 
 	if (cntr > count)
 		cntr = count;
-	rv = copy_to_user(buffer, desc->ubuf, cntr);
-	if (rv > 0) {
+	rv = kfifo_to_user(&desc->ubuf, buffer, cntr, &done);
+	if (rv < 0) {
 		rv = -EFAULT;
 		goto err;
 	}
 
 	spin_lock_irq(&desc->iuspin);
 
-	for (i = 0; i < desc->length - cntr; i++)
-		desc->ubuf[i] = desc->ubuf[i + cntr];
-
-	desc->length -= cntr;
 	/* in case we had outstanding data */
-	if (!desc->length) {
+	if (kfifo_is_empty(&desc->ubuf)) {
 		clear_bit(WDM_READ, &desc->flags);
 		service_outstanding_interrupt(desc);
 	}
 	spin_unlock_irq(&desc->iuspin);
-	rv = cntr;
+	rv = done;
 
 err:
 	mutex_unlock(&desc->rlock);
@@ -1013,7 +1013,7 @@ static void service_interrupt_work(struct work_struct *work)
 
 	spin_lock_irq(&desc->iuspin);
 	service_outstanding_interrupt(desc);
-	if (!desc->resp_count && (desc->length || desc->rerr)) {
+	if (!desc->resp_count && (!kfifo_is_empty(&desc->ubuf) || desc->rerr)) {
 		set_bit(WDM_READ, &desc->flags);
 		wake_up(&desc->wait);
 	}
@@ -1071,10 +1071,6 @@ static int wdm_create(struct usb_interface *intf, struct usb_endpoint_descriptor
 	if (!desc->command)
 		goto err;
 
-	desc->ubuf = kmalloc(desc->wMaxCommand, GFP_KERNEL);
-	if (!desc->ubuf)
-		goto err;
-
 	desc->sbuf = kmalloc(desc->wMaxPacketSize, GFP_KERNEL);
 	if (!desc->sbuf)
 		goto err;
@@ -1083,6 +1079,10 @@ static int wdm_create(struct usb_interface *intf, struct usb_endpoint_descriptor
 	if (!desc->inbuf)
 		goto err;
 
+	rv = kfifo_alloc(&desc->ubuf, roundup_pow_of_two(desc->wMaxCommand), GFP_KERNEL);
+	if (rv < 0)
+		goto err;
+
 	usb_fill_int_urb(
 		desc->validity,
 		interface_to_usbdev(intf),
-- 
2.54.0


