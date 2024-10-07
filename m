Return-Path: <linux-usb+bounces-15801-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1183799284B
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 11:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDD4928416C
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 09:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0687D199FD1;
	Mon,  7 Oct 2024 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="QWh23+GL";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="QWh23+GL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABB418E776
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728294010; cv=none; b=opWUNlD3BlPg+zT1HY0BPCy8rpNUHBF1WhWtBAD10rHsXc9pHxv8TGh9dx+BG5o9aQ+exJTjkhAHKxsw1cQe9uemp9aflzndCuH7EghkCpC8DYM9ig6hYvb9Ccl98iFPj14zaHHYhSRpI0p0Mt8YMftsUhldL8QeZ7aHb5GJXEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728294010; c=relaxed/simple;
	bh=+541OPk2p6QQ4HFUwBtX3ZsGXlG7kBcyEZi83nVu5SI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZGSnVYD26mD6MnYKA+xDYIDYXAIm+HW+0yDJfJvUo8s1u+V4W2uQNAZPqfb11GMGC1Tl1yZ9XPIGDpMqS7s/ctvPI/b5fo7D6+08ex/4so4/dAWX6cQ3vFDwUjTZOMxena3Ea5lmavSoAuGLtngDKwk1E9t88ooTjXnxTXWdsjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=QWh23+GL; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=QWh23+GL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4EE321F844;
	Mon,  7 Oct 2024 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728294006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GEGtZn48FfYAJaeRL/bh3UXCnQwLEQOilv+YBARNUtU=;
	b=QWh23+GL6Dgis5qRdo+SvwkUtMaEfiLPKmzrHwJayOViHTi8orzipAyiIKEgWCEXpo+3Bn
	GOQsyiU0X3ytGK5WCeTElISZxafMozTpIs2GbjjUdDij/eMQUTq0ciTw7zthkdn/sJg5ga
	0pRK0gaNhZUqhwH4HmSHY/7GoxaNBNc=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=QWh23+GL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728294006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GEGtZn48FfYAJaeRL/bh3UXCnQwLEQOilv+YBARNUtU=;
	b=QWh23+GL6Dgis5qRdo+SvwkUtMaEfiLPKmzrHwJayOViHTi8orzipAyiIKEgWCEXpo+3Bn
	GOQsyiU0X3ytGK5WCeTElISZxafMozTpIs2GbjjUdDij/eMQUTq0ciTw7zthkdn/sJg5ga
	0pRK0gaNhZUqhwH4HmSHY/7GoxaNBNc=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26733132BD;
	Mon,  7 Oct 2024 09:40:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Qk7SB3asA2c8GAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Mon, 07 Oct 2024 09:40:06 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	lee@kernel.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/2] Revert "usb: yurex: Replace snprintf() with the safer scnprintf() variant"
Date: Mon,  7 Oct 2024 11:39:47 +0200
Message-ID: <20241007094004.242122-1-oneukum@suse.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4EE321F844
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This reverts commit 86b20af11e84c26ae3fde4dcc4f490948e3f8035.

This patch leads to passing 0 to simple_read_from_buffer()
as a fifth argument, turning the read method into a nop.
The change is fundamentally flawed, as it breaks the driver.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/yurex.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/misc/yurex.c b/drivers/usb/misc/yurex.c
index 316634f782c6..bd94bf078de3 100644
--- a/drivers/usb/misc/yurex.c
+++ b/drivers/usb/misc/yurex.c
@@ -34,8 +34,6 @@
 #define YUREX_BUF_SIZE		8
 #define YUREX_WRITE_TIMEOUT	(HZ*2)
 
-#define MAX_S64_STRLEN 20 /* {-}922337203685477580{7,8} */
-
 /* table of devices that work with this driver */
 static struct usb_device_id yurex_table[] = {
 	{ USB_DEVICE(YUREX_VENDOR_ID, YUREX_PRODUCT_ID) },
@@ -403,7 +401,8 @@ static ssize_t yurex_read(struct file *file, char __user *buffer, size_t count,
 {
 	struct usb_yurex *dev;
 	int len = 0;
-	char in_buffer[MAX_S64_STRLEN];
+	char in_buffer[20];
+	unsigned long flags;
 
 	dev = file->private_data;
 
@@ -413,16 +412,14 @@ static ssize_t yurex_read(struct file *file, char __user *buffer, size_t count,
 		return -ENODEV;
 	}
 
-	if (WARN_ON_ONCE(dev->bbu > S64_MAX || dev->bbu < S64_MIN)) {
-		mutex_unlock(&dev->io_mutex);
-		return -EIO;
-	}
-
-	spin_lock_irq(&dev->lock);
-	scnprintf(in_buffer, MAX_S64_STRLEN, "%lld\n", dev->bbu);
-	spin_unlock_irq(&dev->lock);
+	spin_lock_irqsave(&dev->lock, flags);
+	len = snprintf(in_buffer, 20, "%lld\n", dev->bbu);
+	spin_unlock_irqrestore(&dev->lock, flags);
 	mutex_unlock(&dev->io_mutex);
 
+	if (WARN_ON_ONCE(len >= sizeof(in_buffer)))
+		return -EIO;
+
 	return simple_read_from_buffer(buffer, count, ppos, in_buffer, len);
 }
 
-- 
2.46.1


