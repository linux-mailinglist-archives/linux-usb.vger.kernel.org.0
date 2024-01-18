Return-Path: <linux-usb+bounces-5240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00539832075
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 21:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79023B26E3C
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 20:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DC72E63B;
	Thu, 18 Jan 2024 20:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="huj65Emg";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="huj65Emg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383051B96A
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705609389; cv=none; b=kCCHjwChZPyxkXl3hnl+3v4DaEVZqfPL+qNxosATCTqgwxnd44/2/Hs9HZnmjIP55Tb1J/QQFCMK7g8xPiEkaB8pSG69oDKjIQRO3S3VvdT0k/teU8+2i01ZHhyDDJsXGU7dhMPWei2myhmIixIHrPBm5YtYBwm3jgIjWhN+al0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705609389; c=relaxed/simple;
	bh=mGDsY4BVJpukxgewxg1BhhxekHZGCXj/kkjIsbKMTO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wwemrv/NJJmg05n6C9H+cT89tNPIe54a5nMd4oBPXSxPiPL1SxViH1TG6kSUqUnYIwV2jDMHSLwmTB7s2rnT7QF8NEMHfGYh3ed8HJuMqZZ9PTfMsSld4UpwICuaRD5rmr4n6rwPKfezZMiTbk+Wn7E8N2CT9kBoYSFJ61AGFe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=huj65Emg; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=huj65Emg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4C8021FCF1;
	Thu, 18 Jan 2024 20:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1705609383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ixWmBc8zxgkEDcQuRzWYeQEpuLWHJjVhF8sGD4B7G30=;
	b=huj65EmgpCjcvlZX5IaSI3ssDQq6N057SGPLt7HRGEDhoKYOqJj17BinZUPltqIXiiKDu1
	2z8A0QrLEfUMua+9ByNeS3cZuJijlM6RG/LXkCn56Y9q6e9OZbxAMIYesuCr/ezbRBN4aa
	e/v9gkeV4zbXCTz8nEM5Ut1rfq7jWTY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1705609383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ixWmBc8zxgkEDcQuRzWYeQEpuLWHJjVhF8sGD4B7G30=;
	b=huj65EmgpCjcvlZX5IaSI3ssDQq6N057SGPLt7HRGEDhoKYOqJj17BinZUPltqIXiiKDu1
	2z8A0QrLEfUMua+9ByNeS3cZuJijlM6RG/LXkCn56Y9q6e9OZbxAMIYesuCr/ezbRBN4aa
	e/v9gkeV4zbXCTz8nEM5Ut1rfq7jWTY=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14036136F5;
	Thu, 18 Jan 2024 20:23:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RESKAqeIqWXXCAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 18 Jan 2024 20:23:03 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: usb_autopm_get_interface use modern helper
Date: Thu, 18 Jan 2024 21:22:55 +0100
Message-ID: <20240118202300.1616-1-oneukum@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

PM core now gives us a primitive that does not touch
the counter in an error case. Use it.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/driver.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index e01b1913d02b..e02ba15f6e34 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1710,9 +1710,7 @@ int usb_autoresume_device(struct usb_device *udev)
 {
 	int	status;
 
-	status = pm_runtime_get_sync(&udev->dev);
-	if (status < 0)
-		pm_runtime_put_sync(&udev->dev);
+	status = pm_runtime_resume_and_get(&udev->dev);
 	dev_vdbg(&udev->dev, "%s: cnt %d -> %d\n",
 			__func__, atomic_read(&udev->dev.power.usage_count),
 			status);
@@ -1818,9 +1816,7 @@ int usb_autopm_get_interface(struct usb_interface *intf)
 {
 	int	status;
 
-	status = pm_runtime_get_sync(&intf->dev);
-	if (status < 0)
-		pm_runtime_put_sync(&intf->dev);
+	status = pm_runtime_resume_and_get(&intf->dev);
 	dev_vdbg(&intf->dev, "%s: cnt %d -> %d\n",
 			__func__, atomic_read(&intf->dev.power.usage_count),
 			status);
-- 
2.43.0


