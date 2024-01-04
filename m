Return-Path: <linux-usb+bounces-4723-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5666B823F8B
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 11:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAC45B228B1
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 10:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B1C20B33;
	Thu,  4 Jan 2024 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="U6rPbAVL";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="U6rPbAVL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB67220DCC
	for <linux-usb@vger.kernel.org>; Thu,  4 Jan 2024 10:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C7FEE1F7FC;
	Thu,  4 Jan 2024 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704364693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IdmT20NZK1rDECtIJyoPIRpf05PMDX9Se7AWRb4pDPQ=;
	b=U6rPbAVLd/kx9w3BewMqVk1hoEaZlA3gvH+Tznv/LOT1nzmyqUpBZyh8DPx75uxWOxpXXQ
	2l129lCJi24V6to0eLWY7AvAy5WfrP6MarSxxA/xRGpv0qMFg6P+y+8nCj3NT1dvH9zzFi
	LO200TbOHqjwPgsX75nQjzQ2Vx72GA0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704364693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IdmT20NZK1rDECtIJyoPIRpf05PMDX9Se7AWRb4pDPQ=;
	b=U6rPbAVLd/kx9w3BewMqVk1hoEaZlA3gvH+Tznv/LOT1nzmyqUpBZyh8DPx75uxWOxpXXQ
	2l129lCJi24V6to0eLWY7AvAy5WfrP6MarSxxA/xRGpv0qMFg6P+y+8nCj3NT1dvH9zzFi
	LO200TbOHqjwPgsX75nQjzQ2Vx72GA0=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E79913C96;
	Thu,  4 Jan 2024 10:38:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id t6QjIJWKlmUDdQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 04 Jan 2024 10:38:13 +0000
From: Oliver Neukum <oneukum@suse.com>
To: bjorn@mork.no,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC] usb: r8152: interface driver before device driver
Date: Thu,  4 Jan 2024 11:37:59 +0100
Message-ID: <20240104103811.2318-1-oneukum@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 4.90
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
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[17.90%]
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ****
X-Spam-Flag: NO

The r8152 interface driver is preferred over the generic
class driver because it provides more features. Hence
we now have a device driver that switches the configuration.

That device driver is sensible only if an interface driver
for the selected configuration exists.
However, the initialization for this module first reisters
the device driver and after that the interface driver.
That screws up error handling. Both registrations return
error codes. That means that the registration of the
device driver can currently work, but the interface
driver can fail.
In that case we switch the devices to a configuration
we have no driver for. That must not happen. The easiest
fix is to register the interface driver first and
bail out if that fails. That way if the device driver
fails, nothing needs to be undone.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Fixes: ec51fbd1b8a2 ("r8152: add USB device driver for config selection")
---
 drivers/net/usb/r8152.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 9bf2140fd0a1..e856ef83cef0 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -10117,10 +10117,13 @@ static int __init rtl8152_driver_init(void)
 {
 	int ret;
 
-	ret = usb_register_device_driver(&rtl8152_cfgselector_driver, THIS_MODULE);
+	ret = usb_register(&rtl8152_driver);
 	if (ret)
 		return ret;
-	return usb_register(&rtl8152_driver);
+
+	ret = usb_register_device_driver(&rtl8152_cfgselector_driver, THIS_MODULE);
+	return ret;
+
 }
 
 static void __exit rtl8152_driver_exit(void)
-- 
2.43.0


