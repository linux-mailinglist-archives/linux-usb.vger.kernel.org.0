Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 236DBDED34
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 15:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbfJUNOU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 09:14:20 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39742 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728840AbfJUNOT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 09:14:19 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9LDE7B7121513;
        Mon, 21 Oct 2019 08:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571663647;
        bh=f+6GI+LbBw1WuyNQvMxFbFdVBF7LdvDUjpMd4xYGnqM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xTBJZmcq3JHguGr+gKHCjoUWXk0AlGOFPaWyzEmaZXij/VNZylV0qxEEftAFZqg9P
         eNUY65990ua/O0deR3YS35BgOcbqyS3kddeou8HI1AhK/ctRJPS3G6oq645xLiUm/4
         l3X6RRA3zsd2UoWquoFkpUSpO6EHZLCm5uy+vElk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9LDDbhm105997
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 21 Oct 2019 08:13:37 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 21
 Oct 2019 08:13:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 21 Oct 2019 08:13:27 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9LDDE7g017365;
        Mon, 21 Oct 2019 08:13:19 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <felipe.balbi@linux.intel.com>, <gregkh@linuxfoundation.org>
CC:     <pawell@cadence.com>, <peter.chen@nxp.com>, <nsekhar@ti.com>,
        <kurahul@cadence.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2 2/2] usb: cdns3: Add TI specific wrapper driver
Date:   Mon, 21 Oct 2019 16:13:05 +0300
Message-ID: <20191021131305.8689-3-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021131305.8689-1-rogerq@ti.com>
References: <20191021131305.8689-1-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The J721e platform comes with 2 Cadence USB3 controller
instances. This driver supports the TI specific wrapper
on this platform.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 drivers/usb/cdns3/Kconfig    |  10 ++
 drivers/usb/cdns3/Makefile   |   1 +
 drivers/usb/cdns3/cdns3-ti.c | 236 +++++++++++++++++++++++++++++++++++
 3 files changed, 247 insertions(+)
 create mode 100644 drivers/usb/cdns3/cdns3-ti.c

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index d0331613a355..2a1e89d12ed9 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -43,4 +43,14 @@ config USB_CDNS3_PCI_WRAP
 	  If you choose to build this driver as module it will
 	  be dynamically linked and module will be called cdns3-pci.ko
 
+config USB_CDNS3_TI
+	tristate "Cadence USB3 support on TI platforms"
+	depends on ARCH_K3 || COMPILE_TEST
+	default USB_CDNS3
+	help
+	  Say 'Y' or 'M' here if you are building for Texas Instruments
+	  platforms that contain Cadence USB3 controller core.
+
+	  e.g. J721e.
+
 endif
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index a703547350bb..948e6b88d1a9 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -14,3 +14,4 @@ endif
 cdns3-$(CONFIG_USB_CDNS3_HOST)		+= host.o
 
 obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+= cdns3-pci-wrap.o
+obj-$(CONFIG_USB_CDNS3_TI)		+= cdns3-ti.o
diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
new file mode 100644
index 000000000000..5541cba71965
--- /dev/null
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * cdns_ti-ti.c - TI specific Glue layer for Cadence USB Controller
+ *
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+
+/* USB Wrapper register offsets */
+#define USBSS_PID		0x0
+#define	USBSS_W1		0x4
+#define USBSS_STATIC_CONFIG	0x8
+#define USBSS_PHY_TEST		0xc
+#define	USBSS_DEBUG_CTRL	0x10
+#define	USBSS_DEBUG_INFO	0x14
+#define	USBSS_DEBUG_LINK_STATE	0x18
+#define	USBSS_DEVICE_CTRL	0x1c
+
+/* Wrapper 1 register bits */
+#define USBSS_W1_PWRUP_RST		BIT(0)
+#define USBSS_W1_OVERCURRENT_SEL	BIT(8)
+#define USBSS_W1_MODESTRAP_SEL		BIT(9)
+#define USBSS_W1_OVERCURRENT		BIT(16)
+#define USBSS_W1_MODESTRAP_MASK		GENMASK(18, 17)
+#define USBSS_W1_MODESTRAP_SHIFT	17
+#define USBSS_W1_USB2_ONLY		BIT(19)
+
+/* Static config register bits */
+#define USBSS1_STATIC_PLL_REF_SEL_MASK	GENMASK(8, 5)
+#define USBSS1_STATIC_PLL_REF_SEL_SHIFT	5
+#define USBSS1_STATIC_LOOPBACK_MODE_MASK	GENMASK(4, 3)
+#define USBSS1_STATIC_LOOPBACK_MODE_SHIFT	3
+#define USBSS1_STATIC_VBUS_SEL_MASK	GENMASK(2, 1)
+#define USBSS1_STATIC_VBUS_SEL_SHIFT	1
+#define USBSS1_STATIC_LANE_REVERSE	BIT(0)
+
+/* Modestrap modes */
+enum modestrap_mode { USBSS_MODESTRAP_MODE_NONE,
+		      USBSS_MODESTRAP_MODE_HOST,
+		      USBSS_MODESTRAP_MODE_PERIPHERAL};
+
+struct cdns_ti {
+	struct device *dev;
+	void __iomem *usbss;
+	int usb2_only:1;
+	int vbus_divider:1;
+	struct clk *usb2_refclk;
+	struct clk *lpm_clk;
+};
+
+static const int cdns_ti_rate_table[] = {	/* in KHZ */
+	9600,
+	10000,
+	12000,
+	19200,
+	20000,
+	24000,
+	25000,
+	26000,
+	38400,
+	40000,
+	58000,
+	50000,
+	52000,
+};
+
+static inline u32 cdns_ti_readl(struct cdns_ti *data, u32 offset)
+{
+	return readl(data->usbss + offset);
+}
+
+static inline void cdns_ti_writel(struct cdns_ti *data, u32 offset, u32 value)
+{
+	writel(value, data->usbss + offset);
+}
+
+static int cdns_ti_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
+	struct cdns_ti *data;
+	struct resource	*res;
+	int error;
+	u32 reg;
+	int rate_code, i;
+	unsigned long rate;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, data);
+
+	data->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	data->usbss = devm_ioremap_resource(dev, res);
+	if (IS_ERR(data->usbss))
+		return PTR_ERR(data->usbss);
+
+	data->usb2_refclk = devm_clk_get(dev, "ref");
+	if (IS_ERR(data->usb2_refclk)) {
+		dev_err(dev, "can't get usb2_refclk\n");
+		return PTR_ERR(data->usb2_refclk);
+	}
+
+	data->lpm_clk = devm_clk_get(dev, "lpm");
+	if (IS_ERR(data->lpm_clk)) {
+		dev_err(dev, "can't get lpm_clk\n");
+		return PTR_ERR(data->lpm_clk);
+	}
+
+	rate = clk_get_rate(data->usb2_refclk);
+	rate /= 1000;	/* To KHz */
+	for (i = 0; i < ARRAY_SIZE(cdns_ti_rate_table); i++) {
+		if (cdns_ti_rate_table[i] == rate)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(cdns_ti_rate_table)) {
+		dev_err(dev, "unsupported usb2_refclk rate: %lu KHz\n", rate);
+		return -EINVAL;
+	}
+
+	rate_code = i;
+
+	pm_runtime_enable(dev);
+	error = pm_runtime_get_sync(dev);
+	if (error < 0) {
+		dev_err(dev, "pm_runtime_get_sync failed: %d\n", error);
+		goto err_get;
+	}
+
+	/* assert RESET */
+	reg = cdns_ti_readl(data, USBSS_W1);
+	reg &= ~USBSS_W1_PWRUP_RST;
+	cdns_ti_writel(data, USBSS_W1, reg);
+
+	/* set static config */
+	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
+	reg &= ~USBSS1_STATIC_PLL_REF_SEL_MASK;
+	reg |= rate_code << USBSS1_STATIC_PLL_REF_SEL_SHIFT;
+
+	reg &= ~USBSS1_STATIC_VBUS_SEL_MASK;
+	data->vbus_divider = device_property_read_bool(dev, "ti,vbus-divider");
+	if (data->vbus_divider)
+		reg |= 1 << USBSS1_STATIC_VBUS_SEL_SHIFT;
+
+	cdns_ti_writel(data, USBSS_STATIC_CONFIG, reg);
+	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
+
+	/* set USB2_ONLY mode if requested */
+	reg = cdns_ti_readl(data, USBSS_W1);
+	data->usb2_only = device_property_read_bool(dev, "ti,usb2-only");
+	if (data->usb2_only)
+		reg |= USBSS_W1_USB2_ONLY;
+
+	/* set default modestrap */
+	reg |= USBSS_W1_MODESTRAP_SEL;
+	reg &= ~USBSS_W1_MODESTRAP_MASK;
+	reg |= USBSS_MODESTRAP_MODE_NONE << USBSS_W1_MODESTRAP_SHIFT;
+	cdns_ti_writel(data, USBSS_W1, reg);
+
+	/* de-assert RESET */
+	reg |= USBSS_W1_PWRUP_RST;
+	cdns_ti_writel(data, USBSS_W1, reg);
+
+	error = of_platform_populate(node, NULL, NULL, dev);
+	if (error) {
+		dev_err(dev, "failed to create children: %d\n", error);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	pm_runtime_put_sync(data->dev);
+err_get:
+	pm_runtime_disable(data->dev);
+
+	return error;
+}
+
+static int cdns_ti_remove_core(struct device *dev, void *c)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	platform_device_unregister(pdev);
+
+	return 0;
+}
+
+static int cdns_ti_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	device_for_each_child(dev, NULL, cdns_ti_remove_core);
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+
+	platform_set_drvdata(pdev, NULL);
+
+	return 0;
+}
+
+static const struct of_device_id cdns_ti_of_match[] = {
+	{ .compatible = "ti,j721e-usb", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cdns_ti_of_match);
+
+static struct platform_driver cdns_ti_driver = {
+	.probe		= cdns_ti_probe,
+	.remove		= cdns_ti_remove,
+	.driver		= {
+		.name	= "cdns3-ti",
+		.of_match_table	= cdns_ti_of_match,
+	},
+};
+
+module_platform_driver(cdns_ti_driver);
+
+MODULE_ALIAS("platform:cdns3-ti");
+MODULE_AUTHOR("Roger Quadros <rogerq@ti.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Cadence USB3 TI Glue Layer");
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

