Return-Path: <linux-usb+bounces-11475-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E20B910331
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 13:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 367431C21238
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 11:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79971AB91A;
	Thu, 20 Jun 2024 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="I4cYmxTW";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="I4cYmxTW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10F4F606
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883647; cv=none; b=d74yWhm5JL3aMoDebT7fpWdN/aTiHZw1MqatTz3lffNjIulZ2InaF1MYS46ZYFuTFuxtddvCYD3M0hy58MtPvXIrC9/84hBxYw0dexhY8oHdNDXu6Ga6Ja2QIANulzI7nMHMgqj2haT1rpnYeuXlvc4e6823hn58DV+7Apvfno0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883647; c=relaxed/simple;
	bh=bwDHfJxbtO4zBsBI+THuQwCzPt6BKAhC7ZRvPdCTRNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpQgZD22EUFXOxc+MgqILkgeRzjmOjGiynh9xAiuuw1jlOWA3qcr7dEEp6dyvjS0wFVapsN3/S70NVFze/VXmAwtPap4MygRa3hTQWVTVWDOX1SijPoaKgbiISuOdreR4+8VjJCf0ooF4XYki357fQ/44DN0RNCca8ZpEjDfR9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=I4cYmxTW; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=I4cYmxTW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0148E1F455;
	Thu, 20 Jun 2024 11:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1718883643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NRh5uuT6NJIbA7LBq3G2n29v1NipNN/TUHqa0t4THvQ=;
	b=I4cYmxTWdFa4BTBTkMY726U1HeKebuV+mm/33vjGrJR3j/Elh/GYUDFHJLE6VIMRKi04FD
	NRm/4blFckeVFMADWSuBNaukWir19GL4zEOe+lt3iOH6Rly0adHtdjbnijmwgocidIXhAT
	YkDNBJQWZkbKWiOhIBGsLrZnveP7QlI=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=I4cYmxTW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1718883643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NRh5uuT6NJIbA7LBq3G2n29v1NipNN/TUHqa0t4THvQ=;
	b=I4cYmxTWdFa4BTBTkMY726U1HeKebuV+mm/33vjGrJR3j/Elh/GYUDFHJLE6VIMRKi04FD
	NRm/4blFckeVFMADWSuBNaukWir19GL4zEOe+lt3iOH6Rly0adHtdjbnijmwgocidIXhAT
	YkDNBJQWZkbKWiOhIBGsLrZnveP7QlI=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA7C713AC1;
	Thu, 20 Jun 2024 11:40:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3Ll+JzoVdGZ6JQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 20 Jun 2024 11:40:42 +0000
From: Oliver Neukum <oneukum@suse.com>
To: qiang.zhang@windriver.com,
	ivan.orlov0322@gmail.com,
	christophe.jaillet@wanadoo.fr,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: gadget: printer: fix races against disable
Date: Thu, 20 Jun 2024 13:40:26 +0200
Message-ID: <20240620114039.5767-1-oneukum@suse.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_TO(0.00)[windriver.com,gmail.com,wanadoo.fr,linuxfoundation.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,wanadoo.fr]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0148E1F455
X-Spam-Flag: NO
X-Spam-Score: -1.51
X-Spam-Level: 

printer_read() and printer_write() guard against the race
against disable() by checking the dev->interface flag,
which in turn is guarded by a spinlock.
These functions, however, drop the lock on multiple occasions.
This means that the test has to be redone after reacquiring
the lock and before doing IO.

Add the tests.

This also addresses CVE-2024-25741

Fixes: 7f2ca14d2f9b9 ("usb: gadget: function: printer: Interface is disabled and returns error")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/gadget/function/f_printer.c | 39 ++++++++++++++++++-------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 4c0b7c2970f1..44e20c6c36d3 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -450,11 +450,8 @@ printer_read(struct file *fd, char __user *buf, size_t len, loff_t *ptr)
 	mutex_lock(&dev->lock_printer_io);
 	spin_lock_irqsave(&dev->lock, flags);
 
-	if (dev->interface < 0) {
-		spin_unlock_irqrestore(&dev->lock, flags);
-		mutex_unlock(&dev->lock_printer_io);
-		return -ENODEV;
-	}
+	if (dev->interface < 0)
+		goto out_disabled;
 
 	/* We will use this flag later to check if a printer reset happened
 	 * after we turn interrupts back on.
@@ -462,6 +459,9 @@ printer_read(struct file *fd, char __user *buf, size_t len, loff_t *ptr)
 	dev->reset_printer = 0;
 
 	setup_rx_reqs(dev);
+	/* this dropped the lock - need to retest */
+	if (dev->interface < 0)
+		goto out_disabled;
 
 	bytes_copied = 0;
 	current_rx_req = dev->current_rx_req;
@@ -495,6 +495,8 @@ printer_read(struct file *fd, char __user *buf, size_t len, loff_t *ptr)
 		wait_event_interruptible(dev->rx_wait,
 				(likely(!list_empty(&dev->rx_buffers))));
 		spin_lock_irqsave(&dev->lock, flags);
+		if (dev->interface < 0)
+			goto out_disabled;
 	}
 
 	/* We have data to return then copy it to the caller's buffer.*/
@@ -538,6 +540,9 @@ printer_read(struct file *fd, char __user *buf, size_t len, loff_t *ptr)
 			return -EAGAIN;
 		}
 
+		if (dev->interface < 0)
+			goto out_disabled;
+
 		/* If we not returning all the data left in this RX request
 		 * buffer then adjust the amount of data left in the buffer.
 		 * Othewise if we are done with this RX request buffer then
@@ -567,6 +572,11 @@ printer_read(struct file *fd, char __user *buf, size_t len, loff_t *ptr)
 		return bytes_copied;
 	else
 		return -EAGAIN;
+
+out_disabled:
+	spin_unlock_irqrestore(&dev->lock, flags);
+	mutex_unlock(&dev->lock_printer_io);
+	return -ENODEV;
 }
 
 static ssize_t
@@ -587,11 +597,8 @@ printer_write(struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 	mutex_lock(&dev->lock_printer_io);
 	spin_lock_irqsave(&dev->lock, flags);
 
-	if (dev->interface < 0) {
-		spin_unlock_irqrestore(&dev->lock, flags);
-		mutex_unlock(&dev->lock_printer_io);
-		return -ENODEV;
-	}
+	if (dev->interface < 0)
+		goto out_disabled;
 
 	/* Check if a printer reset happens while we have interrupts on */
 	dev->reset_printer = 0;
@@ -614,6 +621,8 @@ printer_write(struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 		wait_event_interruptible(dev->tx_wait,
 				(likely(!list_empty(&dev->tx_reqs))));
 		spin_lock_irqsave(&dev->lock, flags);
+		if (dev->interface < 0)
+			goto out_disabled;
 	}
 
 	while (likely(!list_empty(&dev->tx_reqs)) && len) {
@@ -663,6 +672,9 @@ printer_write(struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 			return -EAGAIN;
 		}
 
+		if (dev->interface < 0)
+			goto out_disabled;
+
 		list_add(&req->list, &dev->tx_reqs_active);
 
 		/* here, we unlock, and only unlock, to avoid deadlock. */
@@ -675,6 +687,8 @@ printer_write(struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 			mutex_unlock(&dev->lock_printer_io);
 			return -EAGAIN;
 		}
+		if (dev->interface < 0)
+			goto out_disabled;
 	}
 
 	spin_unlock_irqrestore(&dev->lock, flags);
@@ -686,6 +700,11 @@ printer_write(struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 		return bytes_copied;
 	else
 		return -EAGAIN;
+
+out_disabled:
+	spin_unlock_irqrestore(&dev->lock, flags);
+	mutex_unlock(&dev->lock_printer_io);
+	return -ENODEV;
 }
 
 static int
-- 
2.45.1


