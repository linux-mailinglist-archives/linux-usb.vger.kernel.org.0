Return-Path: <linux-usb+bounces-1503-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AF67C6AF9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 12:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4344E282C52
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 10:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE7623767;
	Thu, 12 Oct 2023 10:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="oWroPJNT"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729922EFF
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 10:23:52 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC586D8;
	Thu, 12 Oct 2023 03:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1697106227;
	bh=5SDzzt7XMUNLkvBvYEQuCiuGLibIrAFTowagRCe9Ajs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oWroPJNTMC8gtNsmULdL/9mutmcnqCq14qB3jD6uP8AeUqfk55rqGzOP+tshfTy+G
	 UoacmJ39q0qb5cpMrvr+HqrDDuJmqA0DV3JpdrwnoVCNNqnoSW5eK3gBAzmirhKuZv
	 qm3W1ENvyB5QtWZ4EppYfkq64C8rRifigulx8JR0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 12 Oct 2023 12:23:41 +0200
Subject: [PATCH 4/4] HID: rmi: remove #ifdef CONFIG_PM
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231012-hid-pm_ptr-v1-4-0a71531ca93b@weissschuh.net>
References: <20231012-hid-pm_ptr-v1-0-0a71531ca93b@weissschuh.net>
In-Reply-To: <20231012-hid-pm_ptr-v1-0-0a71531ca93b@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697106227; l=1495;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5SDzzt7XMUNLkvBvYEQuCiuGLibIrAFTowagRCe9Ajs=;
 b=M2Rn5UBq5P/gACg74ZfSclny/wCeyqbwxYn0CkHIk8fyb5HNmVZAcKUVOI7MrfDzNO2ubN77k
 UYptybFID/7BMvOT6sF2m4865QwQnEePXz3yrgm89ADgYFLSrkHFqGq
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
 drivers/hid/hid-rmi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index 84e7ba5314d3..d4af17fdba46 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -436,7 +436,6 @@ static void rmi_report(struct hid_device *hid, struct hid_report *report)
 		input_sync(field->hidinput->input);
 }
 
-#ifdef CONFIG_PM
 static int rmi_suspend(struct hid_device *hdev, pm_message_t message)
 {
 	struct rmi_data *data = hid_get_drvdata(hdev);
@@ -483,7 +482,6 @@ static int rmi_post_resume(struct hid_device *hdev)
 	hid_hw_close(hdev);
 	return ret;
 }
-#endif /* CONFIG_PM */
 
 static int rmi_hid_reset(struct rmi_transport_dev *xport, u16 reset_addr)
 {
@@ -774,11 +772,9 @@ static struct hid_driver rmi_driver = {
 	.report			= rmi_report,
 	.input_mapping		= rmi_input_mapping,
 	.input_configured	= rmi_input_configured,
-#ifdef CONFIG_PM
-	.suspend		= rmi_suspend,
-	.resume			= rmi_post_resume,
-	.reset_resume		= rmi_post_resume,
-#endif
+	.suspend		= pm_ptr(rmi_suspend),
+	.resume			= pm_ptr(rmi_post_resume),
+	.reset_resume		= pm_ptr(rmi_post_resume),
 };
 
 module_hid_driver(rmi_driver);

-- 
2.42.0


