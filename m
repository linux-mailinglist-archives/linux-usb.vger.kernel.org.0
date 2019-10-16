Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58119D869B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 05:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403940AbfJPDeE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 23:34:04 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46956 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403926AbfJPDeD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 23:34:03 -0400
Received: by mail-pg1-f195.google.com with SMTP id e15so5392558pgu.13
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 20:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xagVe9Yqjp30L3CH/AkBbW6XTA2w//rI82PLgD7cLOY=;
        b=FCG3oi+wtp8WuNIu+Mj5Xi6zpckok2804ZhLuVVAM/UPmgGPZgIRNcoZ+FLno8BalL
         9xR660aCw9gHCn4sb+789tetZoeFdSJms1H/XxtkX5QccB0ZsTiyzIc5daYbhF6X8FjX
         h3XndUeWdDaDZCdbOkUyGiAwpjE+e26OxhohCVmIM52DCq6qgZuH89RiHbG16RPMIuoa
         WxmViHk759exoEZaSWw6hHZut2L7m9+Q5RGVV8sKUC+l+kjNojogq9ZerxqGEMWAfoVK
         i5DfeGg8sqY8Ayiudd5l2B5+1l2RU+FUpctMXiPgfZbsc3plPulJJyoT+biy3nkerECK
         4brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xagVe9Yqjp30L3CH/AkBbW6XTA2w//rI82PLgD7cLOY=;
        b=QDloms0UJFQwN+GNgzjYYSBBOegDk7x8OGBjkfDqP5uxe/dxLq5JRoa0uAwOFWEWh4
         avb+84F01gJSmMJuI/pnZf9t1ps8j6gJJnebDgm2Ui3mX6SvpGO3iHIg/+oRkWfkcUCI
         q70cbECR2Phi65M5OQskUqP+lulejBVUoXnbBtOhdQhJ/hzj3bTIweGJ9TCDaqjtGmxt
         ZJNl4LxC63hr2QPXXnPJyms45vRNBzdX+LKolQbWhaAAMZ9MSQ/NB3e+CpEclFofMa2s
         rzEwoccBUL+h4/nTsjQ5qU0pn4ggH/D9IlSXDq/jdNVs3vE89/gwAp7SFtRRA0TAreJZ
         fkfA==
X-Gm-Message-State: APjAAAX1vciLwaNjl6tilbvcvs/mTriDmPre3UW6rHyxEhSDmkWJEARH
        xAVgiW8D0x5f8pyuThNTTnYkKw==
X-Google-Smtp-Source: APXvYqyjznVOrrf/7tKLsDK6LxpZJ0h4ZdLLFiHJOkW6Rcda1DTtbAt+tRl/yGJyszQBRoTNvSQgXA==
X-Received: by 2002:a62:ce01:: with SMTP id y1mr2104635pfg.176.1571196840691;
        Tue, 15 Oct 2019 20:34:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id l23sm748356pjy.12.2019.10.15.20.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 20:34:00 -0700 (PDT)
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
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH v3 11/11] misc: hisi_hikey_usb: Driver to support usb functionality of Hikey960
Date:   Wed, 16 Oct 2019 03:33:40 +0000
Message-Id: <20191016033340.1288-12-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016033340.1288-1-john.stultz@linaro.org>
References: <20191016033340.1288-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

The HiKey960 has a fairly complex USB configuration due to it
needing to support a USB-C port for host/device mode and multiple
USB-A ports in host mode using a single USB controller.

See schematics here:
  https://github.com/96boards/documentation/raw/master/consumer/hikey/hikey960/hardware-docs/HiKey960_Schematics.pdf

This driver acts as a usb-role-switch intermediary, intercepting
the role switch notifications from the tcpm code, and passing
them on to the dwc3 core.

In doing so, it also controls the onboard hub and power gpios in
order to properly route the data lines between the USB-C port
and the onboard hub to the USB-A ports.

NOTE: It was noted that controlling the TYPEC_VBUS_POWER_OFF and
TYPEC_VBUS_POWER_ON values here is not reccomended. I'm looking
for a way to remove that bit from the logic here, but wanted to
still get feedback on this approach.

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
---
 drivers/misc/Kconfig          |   6 ++
 drivers/misc/Makefile         |   1 +
 drivers/misc/hisi_hikey_usb.c | 178 ++++++++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 drivers/misc/hisi_hikey_usb.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index c55b63750757..bf42d1e234ea 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -466,6 +466,12 @@ config PVPANIC
 	  a paravirtualized device provided by QEMU; it lets a virtual machine
 	  (guest) communicate panic events to the host.
 
+config HISI_HIKEY_USB
+	tristate "USB functionality of HiSilicon Hikey Platform"
+	depends on OF && GPIOLIB
+	help
+	  If you say yes here you get support for usb functionality of HiSilicon Hikey Platform.
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

