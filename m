Return-Path: <linux-usb+bounces-29880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68683C1F583
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 10:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A203189436D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 09:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B10341AB1;
	Thu, 30 Oct 2025 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="YYFTBGy1";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="PfgBJUbo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409AE342C9A
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761817166; cv=none; b=OqDLh5U3uuzY9Q8S0GAMbp0ddLIrZ15msD4JR7GOy8cZwARiOp1Q6fzsmGS3n1mkpXDw6d5UNdKopYAnBrD9/sFF/Y4p8JR++i0lFehxEvEeGVY1PeOvMZkDc37uRWl3VE8Q52D+tRxW2p4qCGdmkDNdUsgYmECHGshObAlXPbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761817166; c=relaxed/simple;
	bh=coBhBUbxMvp3Szw0d9/6YQjclkgWUMgiZJegbxIOEpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YYpJim0cwDIWvI5qLvErohdlw6OlXmd8/DnLMSclCg5/AD4L3fsfIikikpsIPIPuKkbMnpybmk9uH1ctA9Z0McTsyc/NVMCDRZd1zKvE86/jcMy1QZoVyRKziNHb21aixxzXGbqK0ViaDvCXZPwPQLG77YgDorc/dHLXfMEfcuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=YYFTBGy1; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=PfgBJUbo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3CB2B3384F;
	Thu, 30 Oct 2025 09:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1761817162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Ksm8+Ktv+aHs8IiQjnsQ5bv67ZaFU/8/6atyqLVB2Kk=;
	b=YYFTBGy1z64zh5L6koX6sG9I8Vx0A9e8ISquEU3/zEsGqbr3O3Jmv7aU7ANMntbMsx+Dly
	5oo8n9oMkTA1MxdGZiJAYjhbVnMwrWCLdBprJT1UycMQwu8+uyyrVjafWIWlhuNwRzx4jt
	Bdhy9eu6X8k38EhcNmvRRgSTVOE/s+8=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1761817161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Ksm8+Ktv+aHs8IiQjnsQ5bv67ZaFU/8/6atyqLVB2Kk=;
	b=PfgBJUboXa/42MZ//ucEClufgcNzNkrJZW/yB4b+NJ0uqfP+f50J2Y/lEI9MKAadKUPiFk
	0j5SNJiR92bS8a/mzZrV7XmUmXTkFr5C5IU7fpYnmAu80fMaaYZbK04HaNPJd9atpLdq8e
	oKSGp5Tnc2aGhRiTcU1wZuYwTv9GlvU=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1ABF41396A;
	Thu, 30 Oct 2025 09:39:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nDe0BUkyA2m+fAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 30 Oct 2025 09:39:21 +0000
From: Oliver Neukum <oneukum@suse.com>
To: keithp@keithp.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/1] usb: chaoskey: fix locking for O_NONBLOCK
Date: Thu, 30 Oct 2025 10:39:06 +0100
Message-ID: <20251030093918.2248104-1-oneukum@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

A failure to take a lock with O_NONBLOCK needs to result
in -EAGAIN. Change it.

Fixes: 66e3e591891da ("usb: Add driver for Altus Metrum ChaosKey device (v2)")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/chaoskey.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
index 225863321dc4..45cff32656c6 100644
--- a/drivers/usb/misc/chaoskey.c
+++ b/drivers/usb/misc/chaoskey.c
@@ -444,9 +444,19 @@ static ssize_t chaoskey_read(struct file *file,
 			goto bail;
 		mutex_unlock(&dev->rng_lock);
 
-		result = mutex_lock_interruptible(&dev->lock);
-		if (result)
-			goto bail;
+		if (file->f_flags & O_NONBLOCK) {
+			result = mutex_trylock(&dev->lock);
+			if (result == 0) {
+				result = -EAGAIN;
+				goto bail;
+			} else {
+				result = 0;
+			}
+		} else {
+			result = mutex_lock_interruptible(&dev->lock);
+			if (result)
+				goto bail;
+		}
 		if (dev->valid == dev->used) {
 			result = _chaoskey_fill(dev);
 			if (result < 0) {
-- 
2.51.1


