Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63201D1079
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 15:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731345AbfJINnw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 09:43:52 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:47059 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731336AbfJINnw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 09:43:52 -0400
X-Originating-IP: 83.155.44.161
Received: from localhost.localdomain (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id CFE281BF210;
        Wed,  9 Oct 2019 13:43:47 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 5/5] USB: Add driver to control USB fast charge for iOS devices
Date:   Wed,  9 Oct 2019 15:43:42 +0200
Message-Id: <20191009134342.6476-6-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009134342.6476-1-hadess@hadess.net>
References: <20191009134342.6476-1-hadess@hadess.net>
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
---
 drivers/usb/misc/Kconfig                |  10 +
 drivers/usb/misc/Makefile               |   1 +
 drivers/usb/misc/apple-mfi-fastcharge.c | 500 ++++++++++++++++++++++++
 3 files changed, 511 insertions(+)
 create mode 100644 drivers/usb/misc/apple-mfi-fastcharge.c

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index bdae62b2ffe0..f52a49478f1c 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
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
diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
index 109f54f5b9aa..b75106cf3948 100644
--- a/drivers/usb/misc/Makefile
+++ b/drivers/usb/misc/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_USB_EMI26)			+= emi26.o
 obj-$(CONFIG_USB_EMI62)			+= emi62.o
 obj-$(CONFIG_USB_EZUSB_FX2)		+= ezusb.o
 obj-$(CONFIG_USB_FTDI_ELAN)		+= ftdi-elan.o
+obj-$(CONFIG_APPLE_MFI_FASTCHARGE)	+= apple-mfi-fastcharge.o
 obj-$(CONFIG_USB_IDMOUSE)		+= idmouse.o
 obj-$(CONFIG_USB_IOWARRIOR)		+= iowarrior.o
 obj-$(CONFIG_USB_ISIGHTFW)		+= isight_firmware.o
diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
new file mode 100644
index 000000000000..e28300018adc
--- /dev/null
+++ b/drivers/usb/misc/apple-mfi-fastcharge.c
@@ -0,0 +1,500 @@
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
+#define INTERFACE_NUMBER		0
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
+ * The table is generated with the following lua program:
+ * i = 0x1200
+ * while i <= 0x12ff do
+ *     print(string.format("\t{ USB_DEVICE(APPLE_VENDOR_ID, 0x%x) },", i))
+ *     i = i + 1
+ * end
+ */
+
+static const struct usb_device_id id_table[] = {
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1200) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1201) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1202) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1203) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1204) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1205) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1206) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1207) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1208) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1209) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x120a) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x120b) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x120c) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x120d) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x120e) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x120f) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1210) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1211) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1212) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1213) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1214) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1215) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1216) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1217) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1218) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1219) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x121a) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x121b) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x121c) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x121d) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x121e) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x121f) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1220) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1221) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1222) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1223) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1224) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1225) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1226) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1227) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1228) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1229) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x122a) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x122b) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x122c) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x122d) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x122e) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x122f) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1230) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1231) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1232) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1233) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1234) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1235) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1236) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1237) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1238) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1239) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x123a) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x123b) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x123c) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x123d) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x123e) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x123f) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1240) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1241) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1242) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1243) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1244) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1245) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1246) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1247) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1248) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1249) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x124a) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x124b) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x124c) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x124d) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x124e) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x124f) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1250) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1251) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1252) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1253) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1254) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1255) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1256) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1257) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1258) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1259) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x125a) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x125b) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x125c) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x125d) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x125e) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x125f) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1260) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1261) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1262) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1263) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1264) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1265) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1266) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1267) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1268) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1269) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x126a) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x126b) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x126c) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x126d) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x126e) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x126f) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1270) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1271) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1272) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1273) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1274) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1275) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1276) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1277) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1278) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1279) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x127a) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x127b) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x127c) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x127d) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x127e) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x127f) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1280) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1281) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1282) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1283) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1284) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1285) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1286) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1287) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1288) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1289) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x128a) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x128b) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x128c) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x128d) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x128e) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x128f) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1290) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1291) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1292) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1293) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1294) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1295) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1296) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1297) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1298) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x1299) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x129a) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x129b) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x129c) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x129d) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x129e) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x129f) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12a0) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12a1) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12a2) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12a3) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12a4) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12a5) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12a6) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12a7) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12a8) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12a9) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12aa) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ab) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ac) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ad) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ae) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12af) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12b0) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12b1) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12b2) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12b3) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12b4) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12b5) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12b6) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12b7) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12b8) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12b9) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ba) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12bb) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12bc) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12bd) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12be) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12bf) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12c0) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12c1) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12c2) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12c3) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12c4) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12c5) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12c6) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12c7) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12c8) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12c9) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ca) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12cb) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12cc) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12cd) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ce) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12cf) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12d0) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12d1) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12d2) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12d3) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12d4) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12d5) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12d6) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12d7) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12d8) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12d9) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12da) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12db) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12dc) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12dd) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12de) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12df) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12e0) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12e1) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12e2) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12e3) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12e4) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12e5) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12e6) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12e7) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12e8) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12e9) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ea) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12eb) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ec) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ed) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ee) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ef) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12f0) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12f1) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12f2) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12f3) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12f4) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12f5) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12f6) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12f7) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12f8) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12f9) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12fa) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12fb) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12fc) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12fd) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12fe) },
+	{ USB_DEVICE(APPLE_VENDOR_ID, 0x12ff) },
+	{ },
+};
+
+MODULE_DEVICE_TABLE (usb, id_table);
+
+/* Driver-local specific stuff */
+struct mfi_device {
+	struct usb_device *udev;
+	struct power_supply *battery;
+	int charge_type;
+};
+
+static int apple_mfi_fc_set_charge_type(struct mfi_device *mfi,
+                const union power_supply_propval *val)
+{
+        int current_ma;
+        int retval;
+
+        if (mfi->charge_type == val->intval) {
+                dev_dbg(&mfi->udev->dev, "charge type %d already set\n", mfi->charge_type);
+                return 0;
+	}
+
+        switch (val->intval) {
+        case POWER_SUPPLY_CHARGE_TYPE_TRICKLE:
+                current_ma = TRICKLE_CURRENT_MA;
+                break;
+        case POWER_SUPPLY_CHARGE_TYPE_FAST:
+                current_ma = FAST_CURRENT_MA;
+                break;
+        default:
+                return -EINVAL;
+        }
+
+        retval = usb_control_msg(mfi->udev, usb_sndctrlpipe(mfi->udev, 0),
+                                 0x40, /* Vendor-defined USB get enabled capabilities request. */
+                                 USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+                                 current_ma, /* wValue, current offset */
+                                 current_ma, /* wIndex, current offset */
+                                 NULL, 0, USB_CTRL_GET_TIMEOUT);
+        if (retval) {
+                dev_dbg(&mfi->udev->dev, "retval = %d\n", retval);
+                return retval;
+        }
+
+        mfi->charge_type = val->intval;
+
+	return 0;
+}
+
+static int apple_mfi_fc_get_property(struct power_supply *psy,
+                enum power_supply_property psp, union power_supply_propval *val)
+{
+        struct mfi_device *mfi = power_supply_get_drvdata(psy);
+
+        dev_dbg(&mfi->udev->dev, "prop: %d\n", psp);
+
+        switch (psp) {
+        case POWER_SUPPLY_PROP_CHARGE_TYPE:
+                val->intval = mfi->charge_type;
+                break;
+        case POWER_SUPPLY_PROP_SCOPE:
+                val->intval = POWER_SUPPLY_SCOPE_DEVICE;
+                break;
+        default:
+                return -ENODATA;
+        }
+
+        return 0;
+}
+
+static int apple_mfi_fc_set_property(struct power_supply *psy,
+                enum power_supply_property psp,
+                const union power_supply_propval *val)
+{
+        struct mfi_device *mfi = power_supply_get_drvdata(psy);
+        int ret;
+
+        dev_dbg(&mfi->udev->dev, "prop: %d\n", psp);
+
+        ret = pm_runtime_get_sync(&mfi->udev->dev);
+        if (ret < 0)
+                return ret;
+
+        switch (psp) {
+        case POWER_SUPPLY_PROP_CHARGE_TYPE:
+                ret = apple_mfi_fc_set_charge_type(mfi, val);
+                break;
+        default:
+                ret = -EINVAL;
+        }
+
+        pm_runtime_mark_last_busy(&mfi->udev->dev);
+        pm_runtime_put_autosuspend(&mfi->udev->dev);
+
+        return ret;
+}
+
+static int apple_mfi_fc_property_is_writeable(struct power_supply *psy,
+                enum power_supply_property psp)
+{
+        switch (psp) {
+        case POWER_SUPPLY_PROP_CHARGE_TYPE:
+                return 1;
+        default:
+                return 0;
+        }
+}
+
+static enum power_supply_property apple_mfi_fc_properties[] = {
+        POWER_SUPPLY_PROP_CHARGE_TYPE,
+        POWER_SUPPLY_PROP_SCOPE
+};
+
+static const struct power_supply_desc apple_mfi_fc_desc = {
+        .name                   = "apple_mfi_fastcharge",
+        .type                   = POWER_SUPPLY_TYPE_BATTERY,
+        .properties             = apple_mfi_fc_properties,
+        .num_properties         = ARRAY_SIZE(apple_mfi_fc_properties),
+        .get_property           = apple_mfi_fc_get_property,
+        .set_property           = apple_mfi_fc_set_property,
+        .property_is_writeable  = apple_mfi_fc_property_is_writeable
+};
+
+static int mfi_fc_probe(struct usb_device *udev)
+{
+	struct power_supply_config battery_cfg = {};
+	struct mfi_device *mfi = NULL;
+	int err;
+
+	dev_err(&udev->dev, "mfi_fc_probe\n");
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
+	mfi->battery = power_supply_register(&udev->dev, &apple_mfi_fc_desc,
+                                                     &battery_cfg);
+        if (IS_ERR(mfi->battery)) {
+                dev_err(&udev->dev, "Can't register battery\n");
+                err = PTR_ERR(mfi->battery);
+                goto error;
+        }
+
+	mfi->udev = usb_get_dev(udev);
+	dev_set_drvdata(&udev->dev, mfi);
+	dev_err(&udev->dev, "Registered fast charge\n");
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
+	dev_err(&udev->dev, "De-registering fast charge\n");
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
+	.id_table =	id_table,
+	.generic_init =	1,
+};
+
+static int __init mfi_fc_driver_init(void)
+{
+        int ret;
+
+        pr_err("mfi_fc_driver_init\n");
+
+        ret = usb_register_device_driver(&mfi_fc_driver, THIS_MODULE);
+        if (ret)
+                pr_err("usb_register failed %d\n", ret);
+
+        return ret;
+}
+
+static void __exit mfi_fc_driver_exit(void)
+{
+        pr_err("mfi_fc_driver_exit\n");
+        usb_deregister_device_driver(&mfi_fc_driver);
+}
+
+module_init(mfi_fc_driver_init);
+module_exit(mfi_fc_driver_exit);
-- 
2.21.0

