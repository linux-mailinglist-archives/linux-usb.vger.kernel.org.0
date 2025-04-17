Return-Path: <linux-usb+bounces-23207-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CEAA9201E
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 16:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1B3519E3DE0
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 14:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5972517BE;
	Thu, 17 Apr 2025 14:47:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D38B2475CB
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901260; cv=none; b=PHSgwMavsdM4EAeamPcsDgDg7Dz7vAUCpvNfe3siWbL+RTlggIk99axxkTLeNJcXzNDOlchVZc0omTJAraMfkRpy5CJVU1uo4Rlfd7k9/oybB/AUCHSnp64ccJEAeC8w+T0hiZAcwmPoGidy1vN8TM/t3Aug23rRjm3PcQtAY6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901260; c=relaxed/simple;
	bh=EeQ4tBaZ6cyzedCHiOA9YqqINkfLyIRBl1Sj5tdelcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFgwG6bPGDwpOVrA0HVs4Rb75KVGLnOob+WPcDfTec7x8pjkPcB6tztydwFFDRMf1rwMuHl+H2E5cako4n2hCajyHa5tkouDskQqsjYBdo9rEcD/C7IzgczeoVp8XNXLrzsS3yWWNWtvICW4605/JrHSvHLJkjw094KJDTmhzZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BF1E621191;
	Thu, 17 Apr 2025 14:47:22 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 987A11398F;
	Thu, 17 Apr 2025 14:47:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iLUHJHoUAWidWQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 17 Apr 2025 14:47:22 +0000
From: Oliver Neukum <oneukum@suse.com>
To: keithp@keithp.com,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC 3/3] chaoskey: make read() obey O_NONBLOCK
Date: Thu, 17 Apr 2025 16:45:29 +0200
Message-ID: <20250417144719.182160-4-oneukum@suse.com>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BF1E621191
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

This skips waiting for a read if O_NONBLOCK is set.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/chaoskey.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
index 4c53e432c416..509eb9bb5000 100644
--- a/drivers/usb/misc/chaoskey.c
+++ b/drivers/usb/misc/chaoskey.c
@@ -475,10 +475,14 @@ static ssize_t chaoskey_read(struct file *file,
 				mutex_unlock(&dev->lock);
 				goto bail;
 			}
-			result = chaoskey_wait_fill(dev);
-			if (result < 0) {
-				mutex_unlock(&dev->lock);
-				goto bail;
+			if (!(file->f_flags & O_NONBLOCK)) {
+				result = chaoskey_wait_fill(dev);
+				if (result < 0) {
+					mutex_unlock(&dev->lock);
+					goto bail;
+				}
+			} else {
+				result = -EAGAIN;
 			}
 		}
 
-- 
2.49.0


