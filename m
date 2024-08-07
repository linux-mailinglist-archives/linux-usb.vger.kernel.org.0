Return-Path: <linux-usb+bounces-13200-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 093BD94AA64
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 16:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B21FC1F23AE1
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 14:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF3A84E04;
	Wed,  7 Aug 2024 14:37:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B2284A39
	for <linux-usb@vger.kernel.org>; Wed,  7 Aug 2024 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723041433; cv=none; b=YMgLR6lb7GDnER4g6hMLHRvayCZUQKt4/fWdwpIW1hEfRd7yb/587hRB48spAOWtSYJSv4641tYVwMS+Vu6ABz+WwmNRAYU4lRhnt17AX9zaBgjABTm/4TBjMJF2/+emHlPiZJkerGSzpjurkiIzwwP0LLBiMBX+Kh0+c2y/678=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723041433; c=relaxed/simple;
	bh=CWJVjRJL3Iy2iDf4saj3FvA/JduymDRbukIlMV/8hK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZsYTZPnKVe0x9b0q1HdZfLBmOYEQQbI399wW0RW2GNe9YdnM+73yrzrzc9QRN5j1LYrSp6jgZpDTIIWq38LYxjP2rkKE8u8pphKKz1j+FWg1kKkQKQu/L03RfHJm02LUztZ3dqYdkVyoJBocbHqI527XtAgf0ivU8h53qUvKH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sbhme-0004Iv-Ie; Wed, 07 Aug 2024 16:37:00 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 07 Aug 2024 16:36:51 +0200
Subject: [PATCH 1/3] usb: hub: add infrastructure to pass onboard_dev port
 features
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-b4-v6-10-topic-usb-onboard-dev-v1-1-f33ce21353c9@pengutronix.de>
References: <20240807-b4-v6-10-topic-usb-onboard-dev-v1-0-f33ce21353c9@pengutronix.de>
In-Reply-To: <20240807-b4-v6-10-topic-usb-onboard-dev-v1-0-f33ce21353c9@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

On board devices may require special handling for en-/disable port
features due to PCB design decisions e.g. enable/disable the VBUS power
on the port. This commit adds the necessary infrastructure to prepare
the common code base for such use-cases.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/core/hub.c             | 22 ++++++++++++++++++++--
 drivers/usb/misc/onboard_usb_dev.c | 13 +++++++++++++
 include/linux/usb/onboard_dev.h    |  6 ++++++
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 4b93c0bd1d4b..e639c25a729c 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -450,9 +450,18 @@ static int clear_hub_feature(struct usb_device *hdev, int feature)
  */
 int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
 {
-	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+	int ret;
+
+	ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
 		USB_REQ_CLEAR_FEATURE, USB_RT_PORT, feature, port1,
 		NULL, 0, 1000);
+	if (ret)
+		return ret;
+
+	if (!is_root_hub(hdev))
+		ret = onboard_dev_port_feature(hdev, false, feature, port1);
+
+	return ret;
 }
 
 /*
@@ -460,9 +469,18 @@ int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
  */
 static int set_port_feature(struct usb_device *hdev, int port1, int feature)
 {
-	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+	int ret;
+
+	ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
 		USB_REQ_SET_FEATURE, USB_RT_PORT, feature, port1,
 		NULL, 0, 1000);
+	if (ret)
+		return ret;
+
+	if (!is_root_hub(hdev))
+		ret = onboard_dev_port_feature(hdev, true, feature, port1);
+
+	return ret;
 }
 
 static char *to_led_name(int selector)
diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index f2bcc1a8b95f..f61de2c353d0 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -520,6 +520,19 @@ static struct usb_device_driver onboard_dev_usbdev_driver = {
 	.id_table = onboard_dev_id_table,
 };
 
+/************************** USB control **************************/
+
+int onboard_dev_port_feature(struct usb_device *udev, bool set,
+			     int feature, int port1)
+{
+	switch (feature) {
+	default:
+		return 0;
+	}
+}
+
+/************************** Kernel module ************************/
+
 static int __init onboard_dev_init(void)
 {
 	int ret;
diff --git a/include/linux/usb/onboard_dev.h b/include/linux/usb/onboard_dev.h
index b79db6d193c8..45e1f7b844d6 100644
--- a/include/linux/usb/onboard_dev.h
+++ b/include/linux/usb/onboard_dev.h
@@ -9,10 +9,16 @@ struct list_head;
 #if IS_ENABLED(CONFIG_USB_ONBOARD_DEV)
 void onboard_dev_create_pdevs(struct usb_device *parent_dev, struct list_head *pdev_list);
 void onboard_dev_destroy_pdevs(struct list_head *pdev_list);
+int onboard_dev_port_feature(struct usb_device *udev, bool set, int feature, int port1);
 #else
 static inline void onboard_dev_create_pdevs(struct usb_device *parent_dev,
 					    struct list_head *pdev_list) {}
 static inline void onboard_dev_destroy_pdevs(struct list_head *pdev_list) {}
+static inline int onboard_dev_port_feature(struct usb_device *udev, bool set,
+					   int feature, int port1)
+{
+	return 0;
+}
 #endif
 
 #endif /* __LINUX_USB_ONBOARD_DEV_H */

-- 
2.39.2


