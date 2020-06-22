Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB660203948
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 16:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729479AbgFVO0p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 10:26:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:48008 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729466AbgFVO0o (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 10:26:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B4A85B6F3;
        Mon, 22 Jun 2020 14:26:41 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     f.fainelli@gmail.com, gregkh@linuxfoundation.org, robh@kernel.org,
        wahrenst@gmx.net, p.zabel@pengutronix.de
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, tim.gover@raspberrypi.org,
        linux-pci@vger.kernel.org, helgaas@kernel.org,
        andy.shevchenko@gmail.com, mathias.nyman@linux.intel.com,
        lorenzo.pieralisi@arm.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH v4 2/9] reset: Add Raspberry Pi 4 firmware reset controller
Date:   Mon, 22 Jun 2020 12:38:11 +0200
Message-Id: <20200622103817.476-3-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622103817.476-1-nsaenzjulienne@suse.de>
References: <20200622103817.476-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Raspberry Pi 4's co-processor controls some of the board's HW
initialization process, but it's up to Linux to trigger it when
relevant. Introduce a reset controller capable of interfacing with
RPi4's co-processor that models these firmware initialization routines as
reset lines.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

---

Changes since v2:
 - Get ids from dt-binding

Changes since v1:
  - Make the whole driver less USB centric as per Florian's comments

 drivers/reset/Kconfig             |  11 +++
 drivers/reset/Makefile            |   1 +
 drivers/reset/reset-raspberrypi.c | 122 ++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 drivers/reset/reset-raspberrypi.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d9efbfd29646..97e848740e13 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -140,6 +140,17 @@ config RESET_QCOM_PDC
 	  to control reset signals provided by PDC for Modem, Compute,
 	  Display, GPU, Debug, AOP, Sensors, Audio, SP and APPS.
 
+config RESET_RASPBERRYPI
+	tristate "Raspberry Pi 4 Firmware Reset Driver"
+	depends on RASPBERRYPI_FIRMWARE || (RASPBERRYPI_FIRMWARE=n && COMPILE_TEST)
+	default USB_XHCI_PCI
+	help
+	  Raspberry Pi 4's co-processor controls some of the board's HW
+	  initialization process, but it's up to Linux to trigger it when
+	  relevant. This driver provides a reset controller capable of
+	  interfacing with RPi4's co-processor and model these firmware
+	  initialization routines as reset lines.
+
 config RESET_SCMI
 	tristate "Reset driver controlled via ARM SCMI interface"
 	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 249ed357c997..16947610cc3b 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_RESET_OXNAS) += reset-oxnas.o
 obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
 obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
 obj-$(CONFIG_RESET_QCOM_PDC) += reset-qcom-pdc.o
+obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_STM32MP157) += reset-stm32mp1.o
diff --git a/drivers/reset/reset-raspberrypi.c b/drivers/reset/reset-raspberrypi.c
new file mode 100644
index 000000000000..91aa29f893b9
--- /dev/null
+++ b/drivers/reset/reset-raspberrypi.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Raspberry Pi 4 firmware reset driver
+ *
+ * Copyright (C) 2020 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
+ */
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <soc/bcm2835/raspberrypi-firmware.h>
+#include <dt-bindings/reset/raspberrypi,firmware-reset.h>
+
+struct rpi_reset {
+	struct reset_controller_dev rcdev;
+	struct rpi_firmware *fw;
+};
+
+static inline struct rpi_reset *to_rpi(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct rpi_reset, rcdev);
+}
+
+static int rpi_reset_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct rpi_reset *priv = to_rpi(rcdev);
+	u32 dev_addr;
+	int ret;
+
+	switch (id) {
+	case RASPBERRYPI_FIRMWARE_RESET_ID_USB:
+		/*
+		 * The Raspberry Pi 4 gets its USB functionality from VL805, a
+		 * PCIe chip that implements xHCI. After a PCI reset, VL805's
+		 * firmware may either be loaded directly from an EEPROM or, if
+		 * not present, by the SoC's co-processor, VideoCore. rpi's
+		 * VideoCore OS contains both the non public firmware load
+		 * logic and the VL805 firmware blob. This triggers the
+		 * aforementioned process.
+		 *
+		 * The pci device address is expected is expected by the
+		 * firmware encoded like this:
+		 *
+		 *	PCI_BUS << 20 | PCI_SLOT << 15 | PCI_FUNC << 12
+		 *
+		 * But since rpi's PCIe is hardwired, we know the address in
+		 * advance.
+		 */
+		dev_addr = 0x100000;
+		ret = rpi_firmware_property(priv->fw, RPI_FIRMWARE_NOTIFY_XHCI_RESET,
+					    &dev_addr, sizeof(dev_addr));
+		if (ret)
+			return ret;
+
+		/* Wait for vl805 to startup */
+		usleep_range(200, 1000);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct reset_control_ops rpi_reset_ops = {
+	.reset	= rpi_reset_reset,
+};
+
+static int rpi_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *fw_node;
+	struct rpi_firmware *fw;
+	struct rpi_reset *priv;
+
+	fw_node = of_get_parent(dev->of_node);
+	if (!fw_node) {
+		dev_err(dev, "Missing firmware node\n");
+		return -ENOENT;
+	}
+
+	fw = rpi_firmware_get(fw_node);
+	of_node_put(fw_node);
+	if (!fw)
+		return -EPROBE_DEFER;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, priv);
+
+	priv->fw = fw;
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.nr_resets = RASPBERRYPI_FIRMWARE_RESET_NUM_IDS;
+	priv->rcdev.ops = &rpi_reset_ops;
+	priv->rcdev.of_node = dev->of_node;
+
+	return devm_reset_controller_register(dev, &priv->rcdev);
+}
+
+static const struct of_device_id rpi_reset_of_match[] = {
+	{ .compatible = "raspberrypi,firmware-reset" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rpi_reset_of_match);
+
+static struct platform_driver rpi_reset_driver = {
+	.probe	= rpi_reset_probe,
+	.driver	= {
+		.name = "raspberrypi-reset",
+		.of_match_table = rpi_reset_of_match,
+	},
+};
+module_platform_driver(rpi_reset_driver);
+
+MODULE_AUTHOR("Nicolas Saenz Julienne <nsaenzjulienne@suse.de>");
+MODULE_DESCRIPTION("Raspberry Pi 4 firmware reset driver");
+MODULE_LICENSE("GPL");
-- 
2.27.0

