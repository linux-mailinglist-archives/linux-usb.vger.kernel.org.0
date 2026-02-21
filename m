Return-Path: <linux-usb+bounces-33535-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMU9Dch0mWlrUAMAu9opvQ
	(envelope-from <linux-usb+bounces-33535-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 10:03:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8BD16C741
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 10:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2940D3013D5B
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 09:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DD733123C;
	Sat, 21 Feb 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezVoDZ7A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80EB3B2A0
	for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771664570; cv=none; b=gYlo554RQqc6MbJ1SY9aUzEF20vvFpw9CM7JaFyYyqzojKuTVVInqH5hV3jcXSPQUAGoBSKhYpPgtFPz4OV1WGiO/JbS2iDSNYdFWfEBzGZwKaCPCPwTvOY7P91q0NCV7Qs779YT2MYfXOqG2X7+Uo3AM0KILnJUFrRFkcBCI98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771664570; c=relaxed/simple;
	bh=IacRt8mbGi70TSLqe8x1dQjcwccLECzWFLM4R/ZS/Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R1udjiBJ29LwiGXTesOybftiPtLvJlWoci7CDxN+YuB31DxAGO5D6pacxHHGQleb1xOJ+Q7E1prSMf5eOEQQNj7bEbQmMehKblOygmZoFLRtaipsw3UjPFJoOOms8GrSddZwUTDcZa4gTqaOAqsHYI5vtNIz5eddvN5toQmceyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezVoDZ7A; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-482f454be5bso35629275e9.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 01:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771664566; x=1772269366; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmCZgLjaf6WNAl4QcnYSjzIUbADts2hS5FwiTnomwBA=;
        b=ezVoDZ7A8a+1X+RzIz7+8AlbcCBvf72vZMxfpg8LnK6+BJAlFaH020bR1rL2E4sc0b
         bGolPuuG71ROodSsHHsuk8jvVdzBMNRdCEH/BMIbeMJR5VUXgaommOBwgIQax8J3jCff
         MCpsaHbduxMWIluV9La84VM+EnWpIHBForazMnW26Zzq4wRb8Warxo2VVT5p7+KhbYH5
         GwYpW6RMzHy6V4xKQmKKlPDoq9qnNK/3XMXq1qJVDhI4IIQP26kTxHEJju3C0u6TuKPY
         T/joHhzlde4Zmuya4PnmpxehFRs6E3lvMEdfdn1lqvj7AuOn6tpQzfqbkXYG6LeuTcil
         d9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771664566; x=1772269366;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmCZgLjaf6WNAl4QcnYSjzIUbADts2hS5FwiTnomwBA=;
        b=BKRODRldBv40Bcs6A8S1CKGzlq23x1K1RPE72M7bDG01fjhvBrNAYFLiWwWAt96Rl3
         TjMFyV2ZLbwrA6udG8vtofKNQH8z1xKNNIMW0iMwcJcZqwBpliGnW7V2acKGDMtE1uYC
         nf18kD6EKI9NUr4FogA20ZlgWLWFL5SWnn/+GHF0dDAdEOMY3aNA7WGqu1P9WYDU7XwQ
         KNY5ms6Hzn3C6HeX7FPzh8xDwCc1iZ1w6hlLSbkba2tKWBxuTZkDiQ1Gdf/J2lB/af7v
         UTjqUyx+rHglMvNKS/uVjSRtNWhP76Z69HkjrAuTnvElYSCXy9KbVq47hPknsxC1Nyz7
         rPPw==
X-Forwarded-Encrypted: i=1; AJvYcCWBsHKm9KN0EvNCf++TVGz84ap8dLC/4Sqh03x6nSDYwPZEGEirRETlB4TuQZq6xX0EZmmZ21MbFo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnbhbDYYPYzr1aaxX1GARq/XWaL6bZ6ikUguBA5dIkdunqk5XR
	n1hCMCS/15jTw3TedK84BDjCnsDbyjbN7fTjxlamcEqufRucmiT7zCbg
X-Gm-Gg: AZuq6aJtqnC5CX+tn5yEJCOlaD/FL3h66BVagu0+dNf0Vpt6VazOqjNxTVKqYEuZRA9
	R9TMTDm5yW6LcfnQlNBSulAM+LKImBdoWh742Tbga0HmUlFC0OpTC2aKk+nHkUfhVnxI75i+Uvq
	rZ9aK5LfKkAvzofH6F5tnmsTXDXAJHQG0tXowSZewwRZvjEn+gc8RFGJXhMDQRZxB7EIBPTyna2
	Gf9CUrk2PzCgpwNNrvcKqnCcq6gNZl+24dv/EO/uEVQYTLhw6dwG6YpS3mEHSwdO5k9fRMi6zgw
	llbtRYbpnVs+nxH7GEH4L59Czm/FS/rLeWrUnVdNUYAg14iT+nJq+YGJ4ACJbaUkuDs7G+U9P3X
	x8kIToQRyt3rgxtBkx0V02Iu1FS1rplvl56/g2ADlQJjEEkSqSqcFnWhlwwi6tL22laVXZlgEZa
	NA5G/zega/9D2xETEAuPcTfw5uMyGgFiMZwIaf4DdT9g/aZuVQkxFVkA==
X-Received: by 2002:a05:600d:8445:20b0:47e:e0b3:2437 with SMTP id 5b1f17b1804b1-4839fe96a24mr99827825e9.5.1771664566116;
        Sat, 21 Feb 2026 01:02:46 -0800 (PST)
Received: from [192.168.20.124] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483a9b75b4dsm63146555e9.4.2026.02.21.01.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:02:45 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sat, 21 Feb 2026 10:02:37 +0100
Subject: [PATCH v2] usb: ehci-orion: remove optional PHY handling code
 remnants
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260221-ehci-orion-drop-phy-handling-v2-1-5e26aa73790b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKx0mWkC/42NQQ6CMBBFr0Jm7Zh2VCKuuIdhgdPSTgK0aQ2RE
 O5u5QQu38/L+xtkm8RmeFQbJLtIljAXoFMF7PvZWRRTGEhRrYgUWs+CIRUNTQoRo1+xiGaU2aF
 pLqxv3JC6EpRETHaQz5F/doW95HdI6/G26N/6Z3jRqFHp/mWaQdd35tZNvYxnDhN0+75/AYvaa
 0XIAAAA
X-Change-ID: 20260220-ehci-orion-drop-phy-handling-d93c15c92042
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,vger.kernel.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33535-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j4g8y7@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB8BD16C741
X-Rspamd-Action: no action

Since the USB core code handles the generic USB PHYs automatically, the
optional PHY handling code has been removed from the 'ehci-orion' driver
entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
initialization"). However, the devm_phy_optional_get() call has been kept
so the driver still gets the PHY even though it is not used for anything
in the driver.

Drop the remaining code, and also remove the 'phy' member of the
'orion_ehci_hcd' structure to simplify the code.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - add 'Acked-by' tag from Alan Stern
  - remove 'Fixes' tag
  - Link to v1: https://lore.kernel.org/r/20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com
---
 drivers/usb/host/ehci-orion.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index 34abff8669f8bf096f4547b6ce0977eb130b3c8d..eaaa49712a8c64928771eb317165091480245d0f 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -12,7 +12,6 @@
 #include <linux/clk.h>
 #include <linux/platform_data/usb-ehci-orion.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/io.h>
@@ -60,7 +59,6 @@
 
 struct orion_ehci_hcd {
 	struct clk *clk;
-	struct phy *phy;
 };
 
 static struct hc_driver __read_mostly ehci_orion_hc_driver;
@@ -276,13 +274,6 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 			goto err_put_hcd;
 	}
 
-	priv->phy = devm_phy_optional_get(&pdev->dev, "usb");
-	if (IS_ERR(priv->phy)) {
-		err = PTR_ERR(priv->phy);
-		if (err != -ENOSYS)
-			goto err_dis_clk;
-	}
-
 	/*
 	 * (Re-)program MBUS remapping windows if we are asked to.
 	 */

---
base-commit: 2b7a25df823dc7d8f56f8ce7c2d2dac391cea9c2
change-id: 20260220-ehci-orion-drop-phy-handling-d93c15c92042

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


