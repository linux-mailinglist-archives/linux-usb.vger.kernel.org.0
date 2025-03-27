Return-Path: <linux-usb+bounces-22253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 350DDA73A72
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 18:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA607189749F
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 17:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A84321ABB3;
	Thu, 27 Mar 2025 17:29:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56B3214A8C
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 17:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743096550; cv=none; b=nQ9d5txtxDKA7/E0Ib10GgWscROKbyfMUqBpQfnGDIyW0FarDRhnzn17ZlQQdhjLEI0VFyN9oqre8wA6HLOBQ9+rz80mO62J9YohoRGFQ3imWSEdu3Ag/8aYCtI122QEYZ8yPPITRcWgox6xLLDYwn4RroDzPIwf58UToumSJW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743096550; c=relaxed/simple;
	bh=vzgNlofGNJkqm9ciupIDEqsKHIbRDqsLmsTiWOEMO9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HKUYr4Wgqn3bEFM7KRF1m21+P8TYMbODc2h/uSCX4xYGa97QyBBK4WR1U6utY5ri53oyL9e0JbMBb+jonNPi3hvxbGw04xmVD8zNIPnQhlbsOwzHP67RiUbVzvKxdVMTPFGC+Zmm1vHkgrDANw2v/yTRZl3LDI9pHvkfEiHnZGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1txr2I-0002hN-Nk; Thu, 27 Mar 2025 18:28:58 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mka@chromium.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	festevam@denx.de,
	stern@rowland.harvard.edu,
	m.felsch@pengutronix.de,
	catalin.popescu@leica-geosystems.com,
	radhey.shyam.pandey@amd.com
Cc: kernel@pengutronix.de,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] usb: misc: onboard_dev: add ext-vbus-supply handling
Date: Thu, 27 Mar 2025 18:28:03 +0100
Message-Id: <20250327172803.3404615-5-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327172803.3404615-1-m.felsch@pengutronix.de>
References: <20250327172803.3404615-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Add support to power the port VBUS via host controlled regulators since
some embedded hub PCB designs don't connect the dedicated USB hub port
power GPIOs accordingly.

To support the above use-case this commits adds support to parse the OF
information and setup the regulators accordingly within the platform
driver part. Furthermore the usb driver registers the set/clear features
hooks via the new usb_hub_register_port_feature_hooks() if the
onboard_dev is a hub. Afterwards all generic hub handling is passed to
the onboard_dev driver too which allows us to control the regulators.

At the moment this feature is limited to the following hubs:
  - usb424,2412
  - usb424,2414
  - usb424,2417

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/misc/onboard_usb_dev.c | 95 ++++++++++++++++++++++++++++++
 drivers/usb/misc/onboard_usb_dev.h |  3 +
 2 files changed, 98 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 75ac3c6aa92d..7ec47509937c 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -48,6 +48,8 @@ static DECLARE_WORK(attach_usb_driver_work, onboard_dev_attach_usb_driver);
 
 /************************** Platform driver **************************/
 
+#define MAX_DOWNSTREAM_PORTS	7
+
 struct usbdev_node {
 	struct usb_device *udev;
 	struct list_head list;
@@ -64,6 +66,7 @@ struct onboard_dev {
 	struct list_head udev_list;
 	struct mutex lock;
 	struct clk *clk;
+	struct regulator *ext_vbus_supplies[MAX_DOWNSTREAM_PORTS];
 };
 
 static int onboard_dev_get_regulators(struct onboard_dev *onboard_dev)
@@ -225,6 +228,53 @@ static int onboard_dev_add_usbdev(struct onboard_dev *onboard_dev,
 	return err;
 }
 
+static int onboard_dev_port_power(struct onboard_dev *onboard_dev, int port1,
+				  bool enable)
+{
+	struct regulator *vbus_supply;
+	unsigned int port = port1 - 1;
+
+	if (WARN_ON(port >= MAX_DOWNSTREAM_PORTS))
+		return -EINVAL;
+
+	vbus_supply = onboard_dev->ext_vbus_supplies[port];
+
+	/* External supplies are optional */
+	if (!vbus_supply)
+		return 0;
+
+	if (enable)
+		return regulator_enable(vbus_supply);
+
+	return regulator_disable(vbus_supply);
+}
+
+static int onboard_dev_add_ext_vbus_supplies(struct onboard_dev *onboard_dev)
+{
+	struct device *dev = onboard_dev->dev;
+	unsigned int i;
+
+	if (!onboard_dev->pdata->support_ext_vbus_supplies)
+		return 0;
+
+	for (i = 0; i < MAX_DOWNSTREAM_PORTS; i++) {
+		char supply_name[] = "portX-vbus";
+		struct regulator *reg;
+
+		sprintf(supply_name, "port%u-vbus", i + 1);
+		reg = devm_regulator_get_optional(dev, supply_name);
+		if (!IS_ERR(reg)) {
+			onboard_dev->ext_vbus_supplies[i] = reg;
+		} else {
+			if (PTR_ERR(reg) != -ENODEV)
+				return dev_err_probe(dev, PTR_ERR(reg),
+						     "failed to get %s-supply\n", supply_name);
+		}
+	}
+
+	return 0;
+}
+
 static void onboard_dev_remove_usbdev(struct onboard_dev *onboard_dev,
 				      const struct usb_device *udev)
 {
@@ -383,6 +433,10 @@ static int onboard_dev_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(onboard_dev->reset_gpio),
 				     "failed to get reset GPIO\n");
 
+	err = onboard_dev_add_ext_vbus_supplies(onboard_dev);
+	if (err)
+		return err;
+
 	mutex_init(&onboard_dev->lock);
 	INIT_LIST_HEAD(&onboard_dev->udev_list);
 
@@ -495,6 +549,44 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_VIA		0x2109
 #define VENDOR_ID_XMOS		0x20B1
 
+static int onboard_dev_port_feature(struct usb_device *udev, bool set,
+				    int feature, int port1)
+{
+	struct device *dev = &udev->dev;
+	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
+
+	/*
+	 * Check usb_hub_register_port_feature_hooks() if you want to extent
+	 * the list of handled features. At the moment only power is synced
+	 * after adding the hook.
+	 */
+	switch (feature) {
+	case USB_PORT_FEAT_POWER:
+		return onboard_dev_port_power(onboard_dev, port1, set);
+	default:
+		return 0;
+	}
+}
+
+static int
+onboard_dev_set_port_feature(struct usb_device *udev, int feature, int port1)
+{
+	return onboard_dev_port_feature(udev, true, feature, port1);
+}
+
+static int
+onboard_dev_clear_port_feature(struct usb_device *udev, int feature, int port1)
+{
+	return onboard_dev_port_feature(udev, false, feature, port1);
+}
+
+static void
+onboard_dev_register_hub_hooks(struct usb_device *udev)
+{
+	usb_hub_register_port_feature_hooks(udev, onboard_dev_set_port_feature,
+					    onboard_dev_clear_port_feature);
+}
+
 /*
  * Returns the onboard_dev platform device that is associated with the USB
  * device passed as parameter.
@@ -554,6 +646,9 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
 
 	dev_set_drvdata(dev, onboard_dev);
 
+	if (onboard_dev->pdata->is_hub)
+		onboard_dev_register_hub_hooks(udev);
+
 	err = onboard_dev_add_usbdev(onboard_dev, udev);
 	if (err)
 		return err;
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 933797a7e084..d15e501f5fc9 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -14,6 +14,7 @@ struct onboard_dev_pdata {
 	unsigned int num_supplies;	/* number of supplies */
 	const char * const supply_names[MAX_SUPPLIES];
 	bool is_hub;
+	bool support_ext_vbus_supplies;
 };
 
 static const struct onboard_dev_pdata microchip_usb424_data = {
@@ -21,6 +22,7 @@ static const struct onboard_dev_pdata microchip_usb424_data = {
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
 	.is_hub = true,
+	.support_ext_vbus_supplies = true,
 };
 
 static const struct onboard_dev_pdata microchip_usb2514_data = {
@@ -28,6 +30,7 @@ static const struct onboard_dev_pdata microchip_usb2514_data = {
 	.num_supplies = 2,
 	.supply_names = { "vdd", "vdda" },
 	.is_hub = true,
+	.support_ext_vbus_supplies = true,
 };
 
 static const struct onboard_dev_pdata microchip_usb5744_data = {
-- 
2.39.5


