Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7E5EB38F6
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 13:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfIPLEF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 07:04:05 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35901 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfIPLEF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 07:04:05 -0400
Received: by mail-pf1-f195.google.com with SMTP id y22so22818726pfr.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2019 04:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4noNQR3bY/oKc4CQd5RwExXIrwbIVGpJMuJHTnqJNSI=;
        b=IwKVwheeQnn0Yo/8t1H7aER43cmGag6/Z7QU7+YWVjxMj0zaRp29HHp9Aow9t9oJeq
         xoMdR72qU9q7ALshulcXPXkgnN4XSpbGzmuTBqrCUiI2TY42l75icDpiHfI3wPEJbJkQ
         z6CFc85ZOClDjXwdMvT5njTaPQvNPS2G4wIq26i6U+0wPuvSG3XBsRySUsRjbdpM/Vul
         eTK5EwWdYiHjQJCGWoq3rSl+6tYUYFUMZeOPFLBURvRtpKP90OfQfsDPZPR3yBnLjENb
         MeOkTPY3ugIVCS64K8BT7TUAx6ZEEX/FogMBkmGMV6II/2u1PzvNPKedhLBsqgLwxQzU
         nRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4noNQR3bY/oKc4CQd5RwExXIrwbIVGpJMuJHTnqJNSI=;
        b=fs5fiM/wpYbaNGkFVs9/bJeeAnfj33iv+iiXn4lvm18X5UzsGWWBG80vs58N1adGDb
         +ifedxu7V7tK+KjPdCBDz021beY3WhRXyotSAOGCYf2b+ogqFdAVY4sxoURt0V3lF1LT
         psH33T64D/x5Tw7bO3X4DR+ir7WQ6oQLw0oAgAXqFGFdB8zcOoU84VarZmYg+g5yGLI6
         VARokZwCDD8AqnDFwqqpokwRuVtX8vq2mqagCuDm+nxeLKnvoeChw2PkqjUw2B3bG/dh
         g7v/JBo5vj1fCbOQLDIXa7Hg4pP/wfr1b90w+HNIJ9KhaEGqWtCa8s6go4fOP5VNYoXK
         kqTA==
X-Gm-Message-State: APjAAAUWKnwO8g4qr3IykgXdWBMSWZz+V3RA8VUo2fHsLwAeUTKJotfj
        hydNsmVsRKBiaCvErFPaQOU=
X-Google-Smtp-Source: APXvYqyJxMhJBNppoOjhsjndFlRVewfGYh5m4hOyAdGf11CSFowulnxWc3XknN0/NumYex422dZtnQ==
X-Received: by 2002:aa7:8384:: with SMTP id u4mr53183375pfm.124.1568631844722;
        Mon, 16 Sep 2019 04:04:04 -0700 (PDT)
Received: from localhost.localdomain (180-150-79-77.b4964f.syd.nbn.aussiebb.net. [180.150.79.77])
        by smtp.gmail.com with ESMTPSA id l62sm59620663pfl.167.2019.09.16.04.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 04:04:04 -0700 (PDT)
From:   Rhys Kidd <rhyskidd@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-accelerators@lists.ozlabs.org,
        Rhys Kidd <rhyskidd@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 1/1] USB: myriad-ma24xx-vsc: Firmware loader driver for USB Myriad ma24xx
Date:   Mon, 16 Sep 2019 21:03:41 +1000
Message-Id: <20190916110341.1310-2-rhyskidd@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916110341.1310-1-rhyskidd@gmail.com>
References: <20190916110341.1310-1-rhyskidd@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Myriad ma24xx in USB Intel Neural Compute Stick and Intel Neural
Compute Stick 2 provides an API to accelerate AI inference calculations
on the dedicated SHAVE VLIW vector co-processors, which are orchestrated
by one or more LEON SPARC v8 real time cores.

However, they need firmware to be loaded beforehand. An uninitialised
Myriad ma24xx presents with a distinctive USB ID. After firmware
loading, the device detaches from the USB bus and reattaches with a new
device ID. It can then be claimed by the usermode driver.

Signed-off-by: Rhys Kidd <rhyskidd@gmail.com>
---
 MAINTAINERS                          |   6 +
 drivers/usb/misc/Kconfig             |   8 ++
 drivers/usb/misc/Makefile            |   1 +
 drivers/usb/misc/myriad-ma24xx-vsc.c | 171 +++++++++++++++++++++++++++
 4 files changed, 186 insertions(+)
 create mode 100644 drivers/usb/misc/myriad-ma24xx-vsc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a50e97a63bc8..2c3ab39ac26a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16682,6 +16682,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
 S:	Maintained
 F:	sound/usb/midi.*
 
+USB MYRIAD MA24XX FIRMWARE DRIVER
+M:	Rhys Kidd <rhyskidd@gmail.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/usb/misc/myriad-ma24xx-vsc.c
+
 USB NETWORKING DRIVERS
 L:	linux-usb@vger.kernel.org
 S:	Odd Fixes
diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index bdae62b2ffe0..5d600fb8ac50 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -275,3 +275,11 @@ config USB_CHAOSKEY
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called chaoskey.
+
+config USB_MYRIAD_MA24XX_VSC
+	tristate "USB Intel Myriad MA24xx firmware loading support"
+	select FW_LOADER
+	help
+	  This driver loads firmware for Myriad ma24xx AI inference accelerators, as
+	  found in the USB Intel Neural Compute Stick (ma2450) and Intel Neural
+	  Compute Stick 2 (ma2485).
\ No newline at end of file
diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
index 109f54f5b9aa..e19d1348c5b6 100644
--- a/drivers/usb/misc/Makefile
+++ b/drivers/usb/misc/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_USB_ISIGHTFW)		+= isight_firmware.o
 obj-$(CONFIG_USB_LCD)			+= usblcd.o
 obj-$(CONFIG_USB_LD)			+= ldusb.o
 obj-$(CONFIG_USB_LEGOTOWER)		+= legousbtower.o
+obj-$(CONFIG_USB_MYRIAD_MA24XX_VSC)    += myriad-ma24xx-vsc.o
 obj-$(CONFIG_USB_RIO500)		+= rio500.o
 obj-$(CONFIG_USB_TEST)			+= usbtest.o
 obj-$(CONFIG_USB_EHSET_TEST_FIXTURE)    += ehset.o
diff --git a/drivers/usb/misc/myriad-ma24xx-vsc.c b/drivers/usb/misc/myriad-ma24xx-vsc.c
new file mode 100644
index 000000000000..f516c236a8f5
--- /dev/null
+++ b/drivers/usb/misc/myriad-ma24xx-vsc.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for loading USB Myriad ma24xx firmware
+ *
+ * Copyright (C) 2018 Rhys Kidd <rhyskidd@gmail.com>
+ *
+ * The Myriad ma24xx in USB Intel Neural Compute Stick and Intel Neural
+ * Compute Stick 2 provides an API to accelerate AI inference calculations
+ * on the dedicated SHAVE VLIW vector co-processors, which are orchestrated
+ * by one or more LEON SPARC v8 real time cores.
+ *
+ * However, they need firmware to be loaded beforehand. An uninitialised
+ * Myriad ma24xx presents with a distinctive USB ID. After firmware
+ * loading, the device detaches from the USB bus and reattaches with a new
+ * device ID. It can then be claimed by the usermode driver.
+ *
+ * The firmware is non-free and must be extracted by the user.
+ */
+
+/* Standard include files */
+#include <linux/errno.h>
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+
+#define usb_dbg(usb_if, format, arg...) \
+	dev_dbg(&(usb_if)->dev, format, ## arg)
+
+#define usb_err(usb_if, format, arg...) \
+	dev_err(&(usb_if)->dev, format, ## arg)
+
+/* Version Information */
+#define DRIVER_AUTHOR "Rhys Kidd <rhyskidd@gmail.com>"
+#define DRIVER_DESC   "Driver for loading USB Myriad ma24xx firmware"
+#define DRIVER_SHORT  "myriad_ma24xx_vsc"
+
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
+
+#define FW_DIR "myriad/"
+#define MA2450_FIRMWARE FW_DIR "mvncapi-2450.mvcmd"
+#define MA2480_FIRMWARE FW_DIR "mvncapi-2480.mvcmd"
+
+MODULE_FIRMWARE(MA2450_FIRMWARE);
+MODULE_FIRMWARE(MA2480_FIRMWARE);
+
+enum {
+	MA2450FW = 0,
+	MA2480FW
+};
+
+/* macros for struct usb_device_id */
+#define MYRIAD_CHIP_VERSION(x) \
+	((x)->driver_info & 0xf)
+
+#define MYRIAD_VID  0x03e7   /* Movidius Ltd, an Intel company */
+#define MA2450_PID  0x2150   /* ma2450 VSC loopback device, without fw */
+#define MA2485_PID  0x2485   /* ma2485 VSC loopback device, without fw */
+
+#define MYRIAD_BUF_LEN 512   /* max size of USB_SPEED_HIGH packet */
+#define WRITE_TIMEOUT  2000  /* milliseconds */
+
+static const struct usb_device_id id_table[] = {
+	{ USB_DEVICE(MYRIAD_VID, MA2450_PID), .driver_info = MA2450FW },
+	{ USB_DEVICE(MYRIAD_VID, MA2485_PID), .driver_info = MA2480FW },
+	{ },
+};
+MODULE_DEVICE_TABLE(usb, id_table);
+
+static int myriad_ma24xx_vsc_probe(struct usb_interface *intf,
+				    const struct usb_device_id *id)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	struct usb_host_interface *altsetting = intf->cur_altsetting;
+	struct usb_endpoint_descriptor *epd;
+	int out_ep, res, size;
+	const struct firmware *firmware = NULL;
+	const u8 *ptr;
+	int offset, ret = 0;
+	char *buf;
+	char *fw_family_name;
+
+	usb_dbg(intf, "probe %s-%s", dev->product, dev->serial);
+
+	/* Find the first bulk OUT endpoint and its packet size */
+	res = usb_find_bulk_out_endpoint(altsetting, &epd);
+	if (res) {
+		usb_err(intf, "no OUT endpoint found");
+		return res;
+	}
+
+	out_ep = usb_endpoint_num(epd);
+	size = usb_endpoint_maxp(epd);
+
+	/* Validate endpoint and size */
+	if (size <= 0) {
+		usb_err(intf, "invalid size (%d)", size);
+		return -ENODEV;
+	}
+
+	if (size > MYRIAD_BUF_LEN) {
+		usb_dbg(intf, "size reduced %d -> %d\n", size, MYRIAD_BUF_LEN);
+		size = MYRIAD_BUF_LEN;
+	}
+
+	buf = kmalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	switch (MYRIAD_CHIP_VERSION(id)) {
+	case MA2450FW:
+		fw_family_name = MA2450_FIRMWARE;
+		break;
+	case MA2480FW:
+		fw_family_name = MA2480_FIRMWARE;
+		break;
+	default:
+		usb_err(intf, "unsupported myriad ma24xx firmware family\n");
+		return -ENODEV;
+	}
+
+	if (request_firmware(&firmware, fw_family_name, &dev->dev) != 0) {
+		usb_err(intf, "unable to load myriad ma24xx firmware\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	ptr = firmware->data;
+
+	/* Handle the sending of firmware */
+	usb_dbg(intf, "starting firmware load...\n");
+
+	for (offset = 0; offset < firmware->size; offset += size) {
+		int thislen = min_t(int, size, firmware->size - offset);
+
+		memcpy(buf, firmware->data + offset, thislen);
+
+		if (usb_bulk_msg(dev,
+				 usb_sndbulkpipe(dev, out_ep),
+				 buf,
+				 thislen,
+				 NULL,
+				 WRITE_TIMEOUT) != 0) {
+			usb_err(intf, "failed to initialise myriad ma24xx firmware\n");
+			ret = -ENODEV;
+			goto out;
+		}
+	}
+	usb_dbg(intf, "firmware uploaded (%zu bytes)\n", firmware->size);
+
+out:
+	kfree(buf);
+	release_firmware(firmware);
+	return ret;
+}
+
+static void myriad_ma24xx_vsc_disconnect(struct usb_interface *intf)
+{
+}
+
+/* usb specific object needed to register this driver with the usb subsystem */
+static struct usb_driver myriad_ma24xx_vsc_driver = {
+	.name = DRIVER_SHORT,
+	.probe = myriad_ma24xx_vsc_probe,
+	.disconnect = myriad_ma24xx_vsc_disconnect,
+	.id_table = id_table,
+};
+
+module_usb_driver(myriad_ma24xx_vsc_driver);
-- 
2.20.1

