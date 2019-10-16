Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A56B0D8CB2
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 11:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392037AbfJPJjo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 05:39:44 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:52147 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390240AbfJPJjo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 05:39:44 -0400
X-Originating-IP: 83.155.44.161
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DF06620002;
        Wed, 16 Oct 2019 09:39:40 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 6/6] USB: Add driver to control USB fast charge for iOS devices
Date:   Wed, 16 Oct 2019 11:39:33 +0200
Message-Id: <20191016093933.693-7-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016093933.693-1-hadess@hadess.net>
References: <20191016093933.693-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

iOS devices will not draw more than 500mA unless instructed to do so.
Setting the charge type power supply property to "fast" tells the device
to start drawing more power, using the same procedure that official
"MFi" chargers would.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 MAINTAINERS                             |   6 +
 drivers/usb/misc/Kconfig                |  10 +
 drivers/usb/misc/Makefile               |   1 +
 drivers/usb/misc/apple-mfi-fastcharge.c | 237 ++++++++++++++++++++++++
 4 files changed, 254 insertions(+)
 create mode 100644 drivers/usb/misc/apple-mfi-fastcharge.c

diff --git MAINTAINERS MAINTAINERS
index 94ce075907a0..9e8f9fc972f5 100644
--- MAINTAINERS
+++ MAINTAINERS
@@ -16728,6 +16728,12 @@ S:	Maintained
 F:	Documentation/usb/acm.rst
 F:	drivers/usb/class/cdc-acm.*
 
+USB APPLE MFI FASTCHARGE DRIVER
+M:	Bastien Nocera <hadess@hadess.net>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/usb/misc/apple-mfi-fastcharge.c
+
 USB AR5523 WIRELESS DRIVER
 M:	Pontus Fuchs <pontus.fuchs@gmail.com>
 L:	linux-wireless@vger.kernel.org
diff --git drivers/usb/misc/Kconfig drivers/usb/misc/Kconfig
index bdae62b2ffe0..f52a49478f1c 100644
--- drivers/usb/misc/Kconfig
+++ drivers/usb/misc/Kconfig
@@ -147,6 +147,16 @@ config USB_APPLEDISPLAY
 	  Say Y here if you want to control the backlight of Apple Cinema
 	  Displays over USB. This driver provides a sysfs interface.
 
+config APPLE_MFI_FASTCHARGE
+	tristate "Fast charge control for iOS devices"
+	select POWER_SUPPLY
+	help
+	  Say Y here if you want to control whether iOS devices will
+	  fast charge from the USB interface, as implemented in "MFi"
+	  chargers.
+
+	  It is safe to say M here.
+
 source "drivers/usb/misc/sisusbvga/Kconfig"
 
 config USB_LD
diff --git drivers/usb/misc/Makefile drivers/usb/misc/Makefile
index 109f54f5b9aa..b75106cf3948 100644
--- drivers/usb/misc/Makefile
+++ drivers/usb/misc/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_USB_EMI26)			+= emi26.o
 obj-$(CONFIG_USB_EMI62)			+= emi62.o
 obj-$(CONFIG_USB_EZUSB_FX2)		+= ezusb.o
 obj-$(CONFIG_USB_FTDI_ELAN)		+= ftdi-elan.o
+obj-$(CONFIG_APPLE_MFI_FASTCHARGE)	+= apple-mfi-fastcharge.o
 obj-$(CONFIG_USB_IDMOUSE)		+= idmouse.o
 obj-$(CONFIG_USB_IOWARRIOR)		+= iowarrior.o
 obj-$(CONFIG_USB_ISIGHTFW)		+= isight_firmware.o
diff --git drivers/usb/misc/apple-mfi-fastcharge.c drivers/usb/misc/apple-mfi-fastcharge.c
new file mode 100644
index 000000000000..f1c4461a9a3c
--- /dev/null
+++ drivers/usb/misc/apple-mfi-fastcharge.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Fast-charge control for Apple "MFi" devices
+ *
+ * Copyright (C) 2019 Bastien Nocera <hadess@hadess.net>
+ */
+
+/* Standard include files */
+#include <linux/module.h>
+#include <linux/power_supply.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+
+MODULE_AUTHOR("Bastien Nocera <hadess@hadess.net>");
+MODULE_DESCRIPTION("Fast-charge control for Apple \"MFi\" devices");
+MODULE_LICENSE("GPL");
+
+#define TRICKLE_CURRENT_MA		0
+#define FAST_CURRENT_MA			2500
+
+#define APPLE_VENDOR_ID			0x05ac	/* Apple */
+
+/* The product ID is defined as starting with 0x12nn, as per the
+ * "Choosing an Apple Device USB Configuration" section in
+ * release R9 (2012) of the "MFi Accessory Hardware Specification"
+ *
+ * To distinguish an Apple device, a USB host can check the device
+ * descriptor of attached USB devices for the following fields:
+ * ■ Vendor ID: 0x05AC
+ * ■ Product ID: 0x12nn
+ *
+ * Those checks will be done in .match() and .probe().
+ */
+
+static const struct usb_device_id mfi_fc_id_table[] = {
+	{ .idVendor = APPLE_VENDOR_ID,
+	  .match_flags = USB_DEVICE_ID_MATCH_VENDOR },
+	{},
+};
+
+MODULE_DEVICE_TABLE(usb, mfi_fc_id_table);
+
+/* Driver-local specific stuff */
+struct mfi_device {
+	struct usb_device *udev;
+	struct power_supply *battery;
+	int charge_type;
+};
+
+static int apple_mfi_fc_set_charge_type(struct mfi_device *mfi,
+					const union power_supply_propval *val)
+{
+	int current_ma;
+	int retval;
+	__u8 request_type;
+
+	if (mfi->charge_type == val->intval) {
+		dev_dbg(&mfi->udev->dev, "charge type %d already set\n",
+				mfi->charge_type);
+		return 0;
+	}
+
+	switch (val->intval) {
+	case POWER_SUPPLY_CHARGE_TYPE_TRICKLE:
+		current_ma = TRICKLE_CURRENT_MA;
+		break;
+	case POWER_SUPPLY_CHARGE_TYPE_FAST:
+		current_ma = FAST_CURRENT_MA;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	request_type = USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE;
+	retval = usb_control_msg(mfi->udev, usb_sndctrlpipe(mfi->udev, 0),
+				 0x40, /* Vendor‐defined power request */
+				 request_type,
+				 current_ma, /* wValue, current offset */
+				 current_ma, /* wIndex, current offset */
+				 NULL, 0, USB_CTRL_GET_TIMEOUT);
+	if (retval) {
+		dev_dbg(&mfi->udev->dev, "retval = %d\n", retval);
+		return retval;
+	}
+
+	mfi->charge_type = val->intval;
+
+	return 0;
+}
+
+static int apple_mfi_fc_get_property(struct power_supply *psy,
+		enum power_supply_property psp,
+		union power_supply_propval *val)
+{
+	struct mfi_device *mfi = power_supply_get_drvdata(psy);
+
+	dev_dbg(&mfi->udev->dev, "prop: %d\n", psp);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+		val->intval = mfi->charge_type;
+		break;
+	case POWER_SUPPLY_PROP_SCOPE:
+		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
+		break;
+	default:
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
+static int apple_mfi_fc_set_property(struct power_supply *psy,
+		enum power_supply_property psp,
+		const union power_supply_propval *val)
+{
+	struct mfi_device *mfi = power_supply_get_drvdata(psy);
+	int ret;
+
+	dev_dbg(&mfi->udev->dev, "prop: %d\n", psp);
+
+	ret = pm_runtime_get_sync(&mfi->udev->dev);
+	if (ret < 0)
+		return ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+		ret = apple_mfi_fc_set_charge_type(mfi, val);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	pm_runtime_mark_last_busy(&mfi->udev->dev);
+	pm_runtime_put_autosuspend(&mfi->udev->dev);
+
+	return ret;
+}
+
+static int apple_mfi_fc_property_is_writeable(struct power_supply *psy,
+					      enum power_supply_property psp)
+{
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+static enum power_supply_property apple_mfi_fc_properties[] = {
+	POWER_SUPPLY_PROP_CHARGE_TYPE,
+	POWER_SUPPLY_PROP_SCOPE
+};
+
+static const struct power_supply_desc apple_mfi_fc_desc = {
+	.name                   = "apple_mfi_fastcharge",
+	.type                   = POWER_SUPPLY_TYPE_BATTERY,
+	.properties             = apple_mfi_fc_properties,
+	.num_properties         = ARRAY_SIZE(apple_mfi_fc_properties),
+	.get_property           = apple_mfi_fc_get_property,
+	.set_property           = apple_mfi_fc_set_property,
+	.property_is_writeable  = apple_mfi_fc_property_is_writeable
+};
+
+static int mfi_fc_probe(struct usb_device *udev)
+{
+	struct power_supply_config battery_cfg = {};
+	struct mfi_device *mfi = NULL;
+	int err;
+
+	/* See comment above mfi_fc_id_table[] */
+	if (udev->descriptor.idProduct < 0x1200 ||
+	    udev->descriptor.idProduct > 0x12ff) {
+		return -ENODEV;
+	}
+
+	mfi = kzalloc(sizeof(struct mfi_device), GFP_KERNEL);
+	if (!mfi) {
+		err = -ENOMEM;
+		goto error;
+	}
+
+	battery_cfg.drv_data = mfi;
+
+	mfi->charge_type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
+	mfi->battery = power_supply_register(&udev->dev,
+						&apple_mfi_fc_desc,
+						&battery_cfg);
+	if (IS_ERR(mfi->battery)) {
+		dev_err(&udev->dev, "Can't register battery\n");
+		err = PTR_ERR(mfi->battery);
+		goto error;
+	}
+
+	mfi->udev = usb_get_dev(udev);
+	dev_set_drvdata(&udev->dev, mfi);
+
+	return 0;
+
+error:
+	kfree(mfi);
+	return err;
+}
+
+static void mfi_fc_disconnect(struct usb_device *udev)
+{
+	struct mfi_device *mfi;
+
+	mfi = dev_get_drvdata(&udev->dev);
+	if (mfi->battery)
+		power_supply_unregister(mfi->battery);
+	dev_set_drvdata(&udev->dev, NULL);
+	usb_put_dev(mfi->udev);
+	kfree(mfi);
+}
+
+static struct usb_device_driver mfi_fc_driver = {
+	.name =		"apple-mfi-fastcharge",
+	.probe =	mfi_fc_probe,
+	.disconnect =	mfi_fc_disconnect,
+	.id_table =	mfi_fc_id_table,
+	.generic_subclass = 1,
+};
+
+static int __init mfi_fc_driver_init(void)
+{
+	return usb_register_device_driver(&mfi_fc_driver, THIS_MODULE);
+}
+
+static void __exit mfi_fc_driver_exit(void)
+{
+	usb_deregister_device_driver(&mfi_fc_driver);
+}
+
+module_init(mfi_fc_driver_init);
+module_exit(mfi_fc_driver_exit);
-- 
2.21.0

