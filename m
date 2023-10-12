Return-Path: <linux-usb+bounces-1504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B57257C6AFA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 12:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7069C282B1B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 10:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211B822F04;
	Thu, 12 Oct 2023 10:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="rE7peiHE"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C8622F02
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 10:23:52 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9505D7;
	Thu, 12 Oct 2023 03:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1697106227;
	bh=alxO7xFWraA3HKM6WF41cUbPDoefLV3zZhv5I90E+pg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rE7peiHE79iPAIiKLaF0z/949FLJ/Zy4UCL+cNac8N6NcqZdKIxFaw0cJlnM1gWTR
	 j15Ej4Uyo85TUj4naLqIYbTrz5witbF5s+X8Vm7IZyT3Bz8felUWwe/mTjExTs+YRO
	 v07pzvJbFfHJnc1RJ2Krkqf5EZQ4cQ+4XtYmwD/0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 12 Oct 2023 12:23:39 +0200
Subject: [PATCH 2/4] HID: usbhid: remove #ifdef CONFIG_PM
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231012-hid-pm_ptr-v1-2-0a71531ca93b@weissschuh.net>
References: <20231012-hid-pm_ptr-v1-0-0a71531ca93b@weissschuh.net>
In-Reply-To: <20231012-hid-pm_ptr-v1-0-0a71531ca93b@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697106227; l=1539;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=alxO7xFWraA3HKM6WF41cUbPDoefLV3zZhv5I90E+pg=;
 b=QZGILVOJ+QPVXAY6Zni77eIF0Yi697+rGGIobSGwqD/pkwi/PhoZXOeEfnzUUGYNGtyCSDWc+
 uIpEsguUtBWBcXXSKwecJem0jyUsiScgV+6RI3orm8tGu70OZQf7tqH
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
 drivers/hid/usbhid/hid-core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 257dd73e37bf..a90ed2ceae84 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1562,7 +1562,6 @@ static int hid_post_reset(struct usb_interface *intf)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int hid_resume_common(struct hid_device *hid, bool driver_suspended)
 {
 	int status = 0;
@@ -1654,8 +1653,6 @@ static int hid_reset_resume(struct usb_interface *intf)
 	return status;
 }
 
-#endif /* CONFIG_PM */
-
 static const struct usb_device_id hid_usb_ids[] = {
 	{ .match_flags = USB_DEVICE_ID_MATCH_INT_CLASS,
 		.bInterfaceClass = USB_INTERFACE_CLASS_HID },
@@ -1668,11 +1665,9 @@ static struct usb_driver hid_driver = {
 	.name =		"usbhid",
 	.probe =	usbhid_probe,
 	.disconnect =	usbhid_disconnect,
-#ifdef CONFIG_PM
-	.suspend =	hid_suspend,
-	.resume =	hid_resume,
-	.reset_resume =	hid_reset_resume,
-#endif
+	.suspend =	pm_ptr(hid_suspend),
+	.resume =	pm_ptr(hid_resume),
+	.reset_resume =	pm_ptr(hid_reset_resume),
 	.pre_reset =	hid_pre_reset,
 	.post_reset =	hid_post_reset,
 	.id_table =	hid_usb_ids,

-- 
2.42.0


