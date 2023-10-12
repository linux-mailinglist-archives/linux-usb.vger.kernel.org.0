Return-Path: <linux-usb+bounces-1502-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E94A7C6AF8
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 12:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9AE2829B3
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 10:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94FB22F19;
	Thu, 12 Oct 2023 10:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="WSw3ac5i"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE4922EFE
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 10:23:52 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E18D6;
	Thu, 12 Oct 2023 03:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1697106227;
	bh=YveTPkYULLlyEsdLlGA46f1LzhfC/wP+L0Bg43PHoWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WSw3ac5i301zeAp93+JgG8P+/dbjE6iJwrFUgvgDOcmbL+ihwU1NJW6dnRY5bSNAT
	 K1XArJ0hoKRw49I+WWAvIFZQzDyvTos6aP7M77giF2PMcLFGCPSKQqtTzga9I7/Jb/
	 xaSOHAmGmSbCIal7m6S7U9LRsCpXENQoDnQu1+8w=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 12 Oct 2023 12:23:40 +0200
Subject: [PATCH 3/4] HID: multitouch: remove #ifdef CONFIG_PM
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231012-hid-pm_ptr-v1-3-0a71531ca93b@weissschuh.net>
References: <20231012-hid-pm_ptr-v1-0-0a71531ca93b@weissschuh.net>
In-Reply-To: <20231012-hid-pm_ptr-v1-0-0a71531ca93b@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697106227; l=1381;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=YveTPkYULLlyEsdLlGA46f1LzhfC/wP+L0Bg43PHoWM=;
 b=i7mP2224uBTGN/Zh76uFUX2dWrxHLRZqal53sVh/xAs7qvfoXcmHUigUcyaoqKjkusVT48IFQ
 KzCQUgxJJTbAyUUO8Ltk+LzVUb/rArUYbqPhCDY+vtmLPSRnwwmZG4r
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Through the usage of pm_ptr() the CONFIG_PM-dependent code will always be
compiled, protecting against bitrot.
The linker will then garbage-collect the unused function avoiding any overhead.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-multitouch.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 521b2ffb4244..2cdfc2a70a83 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1802,7 +1802,6 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 {
 	struct mt_device *td = hid_get_drvdata(hdev);
@@ -1836,7 +1835,6 @@ static int mt_resume(struct hid_device *hdev)
 
 	return 0;
 }
-#endif
 
 static void mt_remove(struct hid_device *hdev)
 {
@@ -2255,10 +2253,8 @@ static struct hid_driver mt_driver = {
 	.usage_table = mt_grabbed_usages,
 	.event = mt_event,
 	.report = mt_report,
-#ifdef CONFIG_PM
-	.suspend = mt_suspend,
-	.reset_resume = mt_reset_resume,
-	.resume = mt_resume,
-#endif
+	.suspend = pm_ptr(mt_suspend),
+	.reset_resume = pm_ptr(mt_reset_resume),
+	.resume = pm_ptr(mt_resume),
 };
 module_hid_driver(mt_driver);

-- 
2.42.0


