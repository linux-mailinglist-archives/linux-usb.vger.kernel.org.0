Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3CF12B196
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2019 07:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfL0GC0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Dec 2019 01:02:26 -0500
Received: from inva020.nxp.com ([92.121.34.13]:47120 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726014AbfL0GCZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Dec 2019 01:02:25 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4719C1A1042;
        Fri, 27 Dec 2019 07:02:23 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 69B2A1A0E06;
        Fri, 27 Dec 2019 07:02:19 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 15E26402DF;
        Fri, 27 Dec 2019 14:02:15 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
Date:   Fri, 27 Dec 2019 13:59:08 +0800
Message-Id: <1577426348-31227-1-git-send-email-peter.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is a Cadence USB3 core for imx8qm and imx8qxp SoCs, the cdns
core is the child for this glue layer device.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/Kconfig     |  10 ++
 drivers/usb/cdns3/Makefile    |   1 +
 drivers/usb/cdns3/cdns3-imx.c | 220 ++++++++++++++++++++++++++++++++++
 3 files changed, 231 insertions(+)
 create mode 100644 drivers/usb/cdns3/cdns3-imx.c

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index 2a1e89d12ed9..b1f526d20f03 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -53,4 +53,14 @@ config USB_CDNS3_TI
 
 	  e.g. J721e.
 
+config USB_CDNS3_IMX
+	tristate "Cadence USB3 support on NXP i.MX platforms"
+	depends on ARCH_MXC
+	default USB_CDNS3
+	help
+	  Say 'Y' or 'M' here if you are building for NXP i.MX
+	  platforms that contain Cadence USB3 controller core.
+
+	  For example, imx8qm and imx8qxp.
+
 endif
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index 948e6b88d1a9..d47e341a6f39 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -15,3 +15,4 @@ cdns3-$(CONFIG_USB_CDNS3_HOST)		+= host.o
 
 obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+= cdns3-pci-wrap.o
 obj-$(CONFIG_USB_CDNS3_TI)		+= cdns3-ti.o
+obj-$(CONFIG_USB_CDNS3_IMX)		+= cdns3-imx.o
diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
new file mode 100644
index 000000000000..53b47306bcc2
--- /dev/null
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * cdns3-imx.c - NXP i.MX specific Glue layer for Cadence USB Controller
+ *
+ * Copyright (C) 2019 NXP
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
+#include <linux/iopoll.h>
+
+#define USB3_CORE_CTRL1    0x00
+#define USB3_CORE_CTRL2    0x04
+#define USB3_INT_REG       0x08
+#define USB3_CORE_STATUS   0x0c
+#define XHCI_DEBUG_LINK_ST 0x10
+#define XHCI_DEBUG_BUS     0x14
+#define USB3_SSPHY_CTRL1   0x40
+#define USB3_SSPHY_CTRL2   0x44
+#define USB3_SSPHY_STATUS  0x4c
+#define USB2_PHY_CTRL1     0x50
+#define USB2_PHY_CTRL2     0x54
+#define USB2_PHY_STATUS    0x5c
+
+/* Register bits definition */
+
+/* USB3_CORE_CTRL1 */
+#define SW_RESET_MASK	(0x3f << 26)
+#define PWR_SW_RESET	(1 << 31)
+#define APB_SW_RESET	(1 << 30)
+#define AXI_SW_RESET	(1 << 29)
+#define RW_SW_RESET	(1 << 28)
+#define PHY_SW_RESET	(1 << 27)
+#define PHYAHB_SW_RESET	(1 << 26)
+#define ALL_SW_RESET	(PWR_SW_RESET | APB_SW_RESET | AXI_SW_RESET | \
+		RW_SW_RESET | PHY_SW_RESET | PHYAHB_SW_RESET)
+#define OC_DISABLE	(1 << 9)
+#define MDCTRL_CLK_SEL	(1 << 7)
+#define MODE_STRAP_MASK	(0x7)
+#define DEV_MODE	(1 << 2)
+#define HOST_MODE	(1 << 1)
+#define OTG_MODE	(1 << 0)
+
+/* USB3_INT_REG */
+#define CLK_125_REQ	(1 << 29)
+#define LPM_CLK_REQ	(1 << 28)
+#define DEVU3_WAEKUP_EN	(1 << 14)
+#define OTG_WAKEUP_EN	(1 << 12)
+#define DEV_INT_EN (3 << 8) /* DEV INT b9:8 */
+#define HOST_INT1_EN (1 << 0) /* HOST INT b7:0 */
+
+/* USB3_CORE_STATUS */
+#define MDCTRL_CLK_STATUS	(1 << 15)
+#define DEV_POWER_ON_READY	(1 << 13)
+#define HOST_POWER_ON_READY	(1 << 12)
+
+/* USB3_SSPHY_STATUS */
+#define CLK_VALID_MASK		(0x3f << 26)
+#define CLK_VALID_COMPARE_BITS	(0xf << 28)
+#define PHY_REFCLK_REQ		(1 << 0)
+
+struct cdns_imx {
+	struct device *dev;
+	void __iomem *noncore;
+	struct clk_bulk_data *clks;
+	int num_clks;
+};
+
+static inline u32 cdns_imx_readl(struct cdns_imx *data, u32 offset)
+{
+	return readl(data->noncore + offset);
+}
+
+static inline void cdns_imx_writel(struct cdns_imx *data, u32 offset, u32 value)
+{
+	writel(value, data->noncore + offset);
+}
+
+static const struct clk_bulk_data imx_cdns3_core_clks[] = {
+	{ .id = "usb3_lpm_clk" },
+	{ .id = "usb3_bus_clk" },
+	{ .id = "usb3_aclk" },
+	{ .id = "usb3_ipg_clk" },
+	{ .id = "usb3_core_pclk" },
+};
+
+static int cdns_imx_noncore_init(struct cdns_imx *data)
+{
+	u32 value;
+	int ret;
+	struct device *dev = data->dev;
+
+	cdns_imx_writel(data, USB3_SSPHY_STATUS, CLK_VALID_MASK);
+	udelay(1);
+	ret = readl_poll_timeout(data->noncore + USB3_SSPHY_STATUS, value,
+		(value & CLK_VALID_COMPARE_BITS) == CLK_VALID_COMPARE_BITS,
+		10, 100000);
+	if (ret) {
+		dev_err(dev, "wait clkvld timeout\n");
+		return ret;
+	}
+
+	value = cdns_imx_readl(data, USB3_CORE_CTRL1);
+	value |= ALL_SW_RESET;
+	cdns_imx_writel(data, USB3_CORE_CTRL1, value);
+	udelay(1);
+
+	value = cdns_imx_readl(data, USB3_CORE_CTRL1);
+	value = (value & ~MODE_STRAP_MASK) | OTG_MODE | OC_DISABLE;
+	cdns_imx_writel(data, USB3_CORE_CTRL1, value);
+
+	value = cdns_imx_readl(data, USB3_INT_REG);
+	value |= HOST_INT1_EN | DEV_INT_EN;
+	cdns_imx_writel(data, USB3_INT_REG, value);
+
+	value = cdns_imx_readl(data, USB3_CORE_CTRL1);
+	value &= ~ALL_SW_RESET;
+	cdns_imx_writel(data, USB3_CORE_CTRL1, value);
+	return ret;
+}
+
+static int cdns_imx_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct cdns_imx *data;
+	int ret;
+
+	if (!node)
+		return -ENODEV;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, data);
+	data->dev = dev;
+	data->noncore = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->noncore)) {
+		dev_err(dev, "can't map IOMEM resource\n");
+		return PTR_ERR(data->noncore);
+	}
+
+	data->num_clks = ARRAY_SIZE(imx_cdns3_core_clks);
+	data->clks = (struct clk_bulk_data *)imx_cdns3_core_clks;
+	ret = devm_clk_bulk_get(dev, data->num_clks, data->clks);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(data->num_clks, data->clks);
+	if (ret)
+		return ret;
+
+	ret = cdns_imx_noncore_init(data);
+	if (ret)
+		goto err;
+
+	ret = of_platform_populate(node, NULL, NULL, dev);
+	if (ret) {
+		dev_err(dev, "failed to create children: %d\n", ret);
+		goto err;
+	}
+
+	return ret;
+
+err:
+	clk_bulk_disable_unprepare(data->num_clks, data->clks);
+	return ret;
+}
+
+static int cdns_imx_remove_core(struct device *dev, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	platform_device_unregister(pdev);
+
+	return 0;
+}
+
+static int cdns_imx_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	device_for_each_child(dev, NULL, cdns_imx_remove_core);
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+
+	platform_set_drvdata(pdev, NULL);
+
+	return 0;
+}
+
+static const struct of_device_id cdns_imx_of_match[] = {
+	{ .compatible = "fsl,imx8qm-usb3", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cdns_imx_of_match);
+
+static struct platform_driver cdns_imx_driver = {
+	.probe		= cdns_imx_probe,
+	.remove		= cdns_imx_remove,
+	.driver		= {
+		.name	= "cdns3-imx",
+		.of_match_table	= cdns_imx_of_match,
+	},
+};
+module_platform_driver(cdns_imx_driver);
+
+MODULE_ALIAS("platform:cdns3-imx");
+MODULE_AUTHOR("Peter Chen <peter.chen@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Cadence USB3 i.MX Glue Layer");
-- 
2.17.1

