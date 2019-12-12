Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6FB11C27C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 02:44:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbfLLBmq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 20:42:46 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:41690 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727613AbfLLBmp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 20:42:45 -0500
Received: by mail-pj1-f67.google.com with SMTP id ca19so315231pjb.8
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 17:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=okKeUrpGRdRMM1YttfPu++dPsYz1GD2rw9QI6vDbyQ4=;
        b=fEiCjzD2vzN0vq5Yvk8MuiJWXuVxsYSs8Ohm9vcxVt4HuVC115y9PZl/iP6JFB87sD
         Z06vMHEE4ybMVnm6B7L+3RrKBdtDVBRTp84+7MFNLZHJpf8NsRBH0Z0Ed5sO4PoNfUnU
         Oegr5NAMSpg2elSJ82GKbecEiWSG67wATl7KVgPJjgAfBDc30uzZVDRG0FGo37OymIkV
         9LPlAT8nhgXDqo63ZA58CJVNCEwElFMH/L39Iu2X/xYrkdv8WghJTFXi5h2PfVcfnToh
         UNY9DiOlKpZvUi6F+TJqBofFvhYrN6pA1HqcBuu/rTDjYvn+/wbILUCT8RP+m+RnKhf4
         0fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=okKeUrpGRdRMM1YttfPu++dPsYz1GD2rw9QI6vDbyQ4=;
        b=P6tyqFJaB2wN2YcvuWVrms4H7QJC7lL5Wir3qS4VSEiZjTIJ5NNZSIeXPHeHf/yv4Y
         ayHb6QfOClUo3WoBI0we1xaYj2nxBpyupc4IvuCv3GDEnWmtJEtCbEWUIPaiABJU4MEm
         aSRqTivKe8D5GgrKqfbjYGTRTON/Cu4kWcLieDUE2eSMfDybomZwszG75ciM4vecKY8L
         U/YP1c+w6QBKgQi9DY2OruWKs0pr/Y9ZDLXxONxUkPnzVuGE8olvUW35wPB+gxUcWXp3
         AFuv/wrpd9xTeOVFRvdaf5qFfTN/r8vh7Z5kj5BIecL/yOHjR+gvgCKMKbrrzSvXejho
         4fsg==
X-Gm-Message-State: APjAAAVrbCOZN5s3s6x/HJonTUvI655mP96EWeZuz/Uov8Gpf2PGMLc2
        lWW+lwczk/i3WA2R1JsK33bGuQ==
X-Google-Smtp-Source: APXvYqxvESeTDKX7aFK/kefdrKXspH/aC5ujQXlsEEpZCgVR9C5X2KaPnz+m0r/s83c6Ales87cUNQ==
X-Received: by 2002:a17:90a:250a:: with SMTP id j10mr7112628pje.134.1576114965024;
        Wed, 11 Dec 2019 17:42:45 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id p16sm4217996pgi.50.2019.12.11.17.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 17:42:44 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: [PATCH v7 8/8] misc: hisi_hikey_usb: Driver to support onboard USB gpio hub on Hikey960
Date:   Thu, 12 Dec 2019 01:42:33 +0000
Message-Id: <20191212014233.32799-9-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212014233.32799-1-john.stultz@linaro.org>
References: <20191212014233.32799-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

The HiKey960 has a fairly complex USB configuration due to it
needing to support a USB-C port for host/device mode and multiple
USB-A ports in host mode, all using a single USB controller.

See schematics here:
  https://github.com/96boards/documentation/raw/master/consumer/hikey/hikey960/hardware-docs/HiKey960_Schematics.pdf

This driver acts as a usb-role-switch intermediary, intercepting
the role switch notifications from the tcpm code, and passing
them on to the dwc3 core.

In doing so, it also controls the onboard hub and power gpios in
order to properly route the data lines between the USB-C port
and the onboard hub to the USB-A ports.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Yu Chen <chenyu56@huawei.com>
[jstultz: Major rework to make the driver a usb-role-switch
          intermediary]
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3:
* Major rework to make the driver a usb-role-switch intermediary
  rather then trying to do notifier callbacks from the role switch
  logic
v7:
* Add MAINTAINERS entry and more verbose Kconfig description
---
 MAINTAINERS                   |   7 ++
 drivers/misc/Kconfig          |   9 ++
 drivers/misc/Makefile         |   1 +
 drivers/misc/hisi_hikey_usb.c | 178 ++++++++++++++++++++++++++++++++++
 4 files changed, 195 insertions(+)
 create mode 100644 drivers/misc/hisi_hikey_usb.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bd5847e802de..ae5bebc2b3e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7422,6 +7422,13 @@ F:	include/uapi/linux/if_hippi.h
 F:	net/802/hippi.c
 F:	drivers/net/hippi/
 
+HIKEY960 ONBOARD USB GPIO HUB DRIVER
+M:	John Stultz <john.stultz@linaro.org>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	drivers/misc/hisi_hikey_usb.c
+F:	Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
+
 HISILICON SECURITY ENGINE V2 DRIVER (SEC2)
 M:	Zaibo Xu <xuzaibo@huawei.com>
 L:	linux-crypto@vger.kernel.org
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 7f0d48f406e3..563492f67be3 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -465,6 +465,15 @@ config PVPANIC
 	  a paravirtualized device provided by QEMU; it lets a virtual machine
 	  (guest) communicate panic events to the host.
 
+config HISI_HIKEY_USB
+	tristate "USB GPIO Hub on HiSilicon Hikey960 Platform"
+	depends on OF && GPIOLIB
+	help
+	  If you say yes here this adds support for the on-board USB gpio hub
+	  found on the HiKey960, which is necssary to support switching between
+	  the dual-role USB-C port and the USB-A host ports using only one USB
+	  controller.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index c1860d35dc7e..e5e85ad0dd57 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -57,3 +57,4 @@ obj-y				+= cardreader/
 obj-$(CONFIG_PVPANIC)   	+= pvpanic.o
 obj-$(CONFIG_HABANA_AI)		+= habanalabs/
 obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
+obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
diff --git a/drivers/misc/hisi_hikey_usb.c b/drivers/misc/hisi_hikey_usb.c
new file mode 100644
index 000000000000..32015bc9ccf6
--- /dev/null
+++ b/drivers/misc/hisi_hikey_usb.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support for usb functionality of Hikey series boards
+ * based on Hisilicon Kirin Soc.
+ *
+ * Copyright (C) 2017-2018 Hilisicon Electronics Co., Ltd.
+ *		http://www.huawei.com
+ *
+ * Authors: Yu Chen <chenyu56@huawei.com>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/usb/role.h>
+
+#define DEVICE_DRIVER_NAME "hisi_hikey_usb"
+
+#define HUB_VBUS_POWER_ON 1
+#define HUB_VBUS_POWER_OFF 0
+#define USB_SWITCH_TO_HUB 1
+#define USB_SWITCH_TO_TYPEC 0
+#define TYPEC_VBUS_POWER_ON 1
+#define TYPEC_VBUS_POWER_OFF 0
+
+struct hisi_hikey_usb {
+	struct gpio_desc *otg_switch;
+	struct gpio_desc *typec_vbus;
+	struct gpio_desc *hub_vbus;
+
+	struct usb_role_switch *hub_role_sw;
+	struct usb_role_switch *dev_role_sw;
+	struct notifier_block nb;
+};
+
+static void hub_power_ctrl(struct hisi_hikey_usb *hisi_hikey_usb, int value)
+{
+	gpiod_set_value_cansleep(hisi_hikey_usb->hub_vbus, value);
+}
+
+static void usb_switch_ctrl(struct hisi_hikey_usb *hisi_hikey_usb,
+			    int switch_to)
+{
+	gpiod_set_value_cansleep(hisi_hikey_usb->otg_switch, switch_to);
+}
+
+static void usb_typec_power_ctrl(struct hisi_hikey_usb *hisi_hikey_usb,
+				 int value)
+{
+	gpiod_set_value_cansleep(hisi_hikey_usb->typec_vbus, value);
+}
+
+static int hub_usb_role_switch_set(struct device *dev, enum usb_role role)
+{
+	struct hisi_hikey_usb *hisi_hikey_usb = dev_get_drvdata(dev);
+
+	if (!hisi_hikey_usb || !hisi_hikey_usb->dev_role_sw)
+		return -EINVAL;
+
+	switch (role) {
+	case USB_ROLE_NONE:
+		usb_typec_power_ctrl(hisi_hikey_usb, TYPEC_VBUS_POWER_OFF);
+		usb_switch_ctrl(hisi_hikey_usb, USB_SWITCH_TO_HUB);
+		hub_power_ctrl(hisi_hikey_usb, HUB_VBUS_POWER_ON);
+		break;
+	case USB_ROLE_HOST:
+		hub_power_ctrl(hisi_hikey_usb, HUB_VBUS_POWER_OFF);
+		usb_switch_ctrl(hisi_hikey_usb, USB_SWITCH_TO_TYPEC);
+		usb_typec_power_ctrl(hisi_hikey_usb, TYPEC_VBUS_POWER_ON);
+		break;
+	case USB_ROLE_DEVICE:
+		hub_power_ctrl(hisi_hikey_usb, HUB_VBUS_POWER_OFF);
+		usb_typec_power_ctrl(hisi_hikey_usb, TYPEC_VBUS_POWER_OFF);
+		usb_switch_ctrl(hisi_hikey_usb, USB_SWITCH_TO_TYPEC);
+		break;
+	default:
+		break;
+	}
+
+	return usb_role_switch_set_role(hisi_hikey_usb->dev_role_sw, role);
+}
+
+static enum usb_role hub_usb_role_switch_get(struct device *dev)
+{
+	struct hisi_hikey_usb *hisi_hikey_usb = dev_get_drvdata(dev);
+
+	if (!hisi_hikey_usb || !hisi_hikey_usb->dev_role_sw)
+		return -EINVAL;
+
+	return usb_role_switch_get_role(hisi_hikey_usb->dev_role_sw);
+}
+
+static int hisi_hikey_usb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct hisi_hikey_usb *hisi_hikey_usb;
+	struct usb_role_switch_desc hub_role_switch = {NULL};
+
+	hisi_hikey_usb = devm_kzalloc(dev, sizeof(*hisi_hikey_usb), GFP_KERNEL);
+	if (!hisi_hikey_usb)
+		return -ENOMEM;
+
+	hisi_hikey_usb->typec_vbus = devm_gpiod_get(dev, "typec-vbus",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(hisi_hikey_usb->typec_vbus))
+		return PTR_ERR(hisi_hikey_usb->typec_vbus);
+
+	hisi_hikey_usb->otg_switch = devm_gpiod_get(dev, "otg-switch",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(hisi_hikey_usb->otg_switch))
+		return PTR_ERR(hisi_hikey_usb->otg_switch);
+
+	/* hub-vdd33-en is optional */
+	hisi_hikey_usb->hub_vbus = devm_gpiod_get_optional(dev, "hub-vdd33-en",
+							   GPIOD_OUT_HIGH);
+	if (IS_ERR(hisi_hikey_usb->hub_vbus))
+		return PTR_ERR(hisi_hikey_usb->hub_vbus);
+
+	hisi_hikey_usb->dev_role_sw = usb_role_switch_get(dev);
+	if (!hisi_hikey_usb->dev_role_sw)
+		return -EPROBE_DEFER;
+	if (IS_ERR(hisi_hikey_usb->dev_role_sw))
+		return PTR_ERR(hisi_hikey_usb->dev_role_sw);
+
+	hub_role_switch.fwnode = dev_fwnode(dev);
+	hub_role_switch.set = hub_usb_role_switch_set;
+	hub_role_switch.get = hub_usb_role_switch_get;
+	hisi_hikey_usb->hub_role_sw = usb_role_switch_register(dev,
+							&hub_role_switch);
+
+	if (IS_ERR(hisi_hikey_usb->hub_role_sw)) {
+		usb_role_switch_put(hisi_hikey_usb->dev_role_sw);
+		return PTR_ERR(hisi_hikey_usb->hub_role_sw);
+	}
+
+	platform_set_drvdata(pdev, hisi_hikey_usb);
+
+	return 0;
+}
+
+static int  hisi_hikey_usb_remove(struct platform_device *pdev)
+{
+	struct hisi_hikey_usb *hisi_hikey_usb = platform_get_drvdata(pdev);
+
+	if (hisi_hikey_usb->hub_role_sw)
+		usb_role_switch_unregister(hisi_hikey_usb->hub_role_sw);
+
+	if (hisi_hikey_usb->dev_role_sw)
+		usb_role_switch_put(hisi_hikey_usb->dev_role_sw);
+
+	return 0;
+}
+
+static const struct of_device_id id_table_hisi_hikey_usb[] = {
+	{.compatible = "hisilicon,gpio_hubv1"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, id_table_hisi_hikey_usb);
+
+static struct platform_driver hisi_hikey_usb_driver = {
+	.probe = hisi_hikey_usb_probe,
+	.remove = hisi_hikey_usb_remove,
+	.driver = {
+		.name = DEVICE_DRIVER_NAME,
+		.of_match_table = id_table_hisi_hikey_usb,
+	},
+};
+
+module_platform_driver(hisi_hikey_usb_driver);
+
+MODULE_AUTHOR("Yu Chen <chenyu56@huawei.com>");
+MODULE_DESCRIPTION("Driver Support for USB functionality of Hikey");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

