Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7931027196C
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 04:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgIUCq5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Sep 2020 22:46:57 -0400
Received: from mga09.intel.com ([134.134.136.24]:53124 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgIUCq4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 20 Sep 2020 22:46:56 -0400
IronPort-SDR: nOmqYVi3x9gzGLhA2PAl60M6wZ2wJ23pt24W6+YJ3CMLfAI3Bn1w1ZdeVWB35myWkdKKRaxZu5
 8i1YwQ1oLRKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="161218615"
X-IronPort-AV: E=Sophos;i="5.77,285,1596524400"; 
   d="scan'208";a="161218615"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2020 19:46:55 -0700
IronPort-SDR: f/1z4HM1aPzJw0FW/ljD+OrbRIlGLd2eAQMVVadDlqoEkQC0yr0ukWqhgGR7niLLDX9L7UhFLA
 UE/XryNjGZxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,285,1596524400"; 
   d="scan'208";a="321538161"
Received: from wwanmoha-ilbpg2.png.intel.com ([10.88.227.42])
  by orsmga002.jf.intel.com with ESMTP; 20 Sep 2020 19:46:51 -0700
From:   Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
To:     kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mgross@linux.intel.com, lakshmi.bai.raja.subramanian@intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com
Subject: [PATCH 2/4] phy: intel: Add Keem Bay USB PHY support
Date:   Mon, 21 Sep 2020 10:44:57 +0800
Message-Id: <20200921024459.20899-3-wan.ahmad.zainie.wan.mohamad@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921024459.20899-1-wan.ahmad.zainie.wan.mohamad@intel.com>
References: <20200921024459.20899-1-wan.ahmad.zainie.wan.mohamad@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for USB PHY on Intel Keem Bay SoC.

Signed-off-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
---
 drivers/phy/intel/Kconfig                 |  12 +
 drivers/phy/intel/Makefile                |   1 +
 drivers/phy/intel/phy-intel-keembay-usb.c | 319 ++++++++++++++++++++++
 3 files changed, 332 insertions(+)
 create mode 100644 drivers/phy/intel/phy-intel-keembay-usb.c

diff --git a/drivers/phy/intel/Kconfig b/drivers/phy/intel/Kconfig
index 58ec695c92ec..914710660557 100644
--- a/drivers/phy/intel/Kconfig
+++ b/drivers/phy/intel/Kconfig
@@ -14,6 +14,18 @@ config PHY_INTEL_KEEMBAY_EMMC
 	  To compile this driver as a module, choose M here: the module
 	  will be called phy-keembay-emmc.ko.
 
+config PHY_INTEL_KEEMBAY_USB
+	tristate "Intel Keem Bay USB PHY driver"
+	depends on (OF && ARM64) || COMPILE_TEST
+	depends on HAS_IOMEM
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	help
+	  Choose this option if you have an Intel Keem Bay SoC.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called phy-keembay-usb.ko.
+
 config PHY_INTEL_LGM_COMBO
 	bool "Intel Lightning Mountain ComboPHY driver"
 	depends on X86 || COMPILE_TEST
diff --git a/drivers/phy/intel/Makefile b/drivers/phy/intel/Makefile
index a5e0af5ccd75..14550981a707 100644
--- a/drivers/phy/intel/Makefile
+++ b/drivers/phy/intel/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_PHY_INTEL_KEEMBAY_EMMC)	+= phy-intel-keembay-emmc.o
+obj-$(CONFIG_PHY_INTEL_KEEMBAY_USB)	+= phy-intel-keembay-usb.o
 obj-$(CONFIG_PHY_INTEL_LGM_COMBO)	+= phy-intel-lgm-combo.o
 obj-$(CONFIG_PHY_INTEL_LGM_EMMC)	+= phy-intel-lgm-emmc.o
diff --git a/drivers/phy/intel/phy-intel-keembay-usb.c b/drivers/phy/intel/phy-intel-keembay-usb.c
new file mode 100644
index 000000000000..3db88e765656
--- /dev/null
+++ b/drivers/phy/intel/phy-intel-keembay-usb.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Keem Bay USB PHY driver
+ * Copyright (C) 2020 Intel Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* USS (USB Subsystem) clock control registers */
+#define USS_CPR_CLK_EN		0x00
+#define USS_CPR_CLK_SET		0x04
+#define USS_CPR_CLK_CLR		0x08
+#define USS_CPR_RST_EN		0x10
+#define USS_CPR_RST_SET		0x14
+#define USS_CPR_RST_CLR		0x18
+
+/* USS clock/reset bit fields */
+#define USS_CPR_PHY_TST		BIT(6)
+#define USS_CPR_LOW_JIT		BIT(5)
+#define USS_CPR_CORE		BIT(4)
+#define USS_CPR_SUSPEND		BIT(3)
+#define USS_CPR_ALT_REF		BIT(2)
+#define USS_CPR_REF		BIT(1)
+#define USS_CPR_SYS		BIT(0)
+#define USS_CPR_MASK		0x7f
+
+/* USS APB slave registers */
+#define USS_USB_CTRL_CFG0		0x10
+#define  VCC_RESET_N_MASK		BIT(31)
+
+#define USS_USB_PHY_CFG0		0x30
+#define  POR_MASK			BIT(15)
+#define  PHY_RESET_MASK			BIT(14)
+#define  PHY_REF_USE_PAD_MASK		BIT(5)
+
+#define USS_USB_PHY_CFG6		0x64
+#define  PHY0_SRAM_EXT_LD_DONE_MASK	BIT(23)
+
+#define USS_USB_PARALLEL_IF_CTRL	0xa0
+#define  USB_PHY_CR_PARA_SEL_MASK	BIT(2)
+
+#define USS_USB_TSET_SIGNALS_AND_GLOB	0xac
+#define  USB_PHY_CR_PARA_CLK_EN_MASK	BIT(7)
+
+#define USS_USB_STATUS_REG		0xb8
+#define  PHY0_SRAM_INIT_DONE_MASK	BIT(3)
+
+#define USS_USB_TIEOFFS_CONSTANTS_REG1	0xc0
+#define  IDDQ_ENABLE_MASK		BIT(10)
+
+struct keembay_usb_phy {
+	struct device *dev;
+	struct regmap *regmap_cpr;
+	struct regmap *regmap_slv;
+};
+
+static const struct regmap_config keembay_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int keembay_usb_clocks_on(struct keembay_usb_phy *priv)
+{
+	int ret;
+
+	/* Enable USB subsystem clocks */
+	ret = regmap_update_bits(priv->regmap_cpr, USS_CPR_CLK_SET,
+				 USS_CPR_MASK, USS_CPR_MASK);
+	if (ret) {
+		dev_err(priv->dev, "error clock set: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_update_bits(priv->regmap_cpr, USS_CPR_RST_SET,
+				 USS_CPR_MASK, USS_CPR_MASK);
+	if (ret) {
+		dev_err(priv->dev, "error reset set: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Clear IDDQ enable bit ensuring all analog blocks are powered
+	 * up in USB2.0 PHY.
+	 */
+	ret = regmap_update_bits(priv->regmap_slv,
+				 USS_USB_TIEOFFS_CONSTANTS_REG1,
+				 IDDQ_ENABLE_MASK,
+				 FIELD_PREP(IDDQ_ENABLE_MASK, 0));
+	if (ret) {
+		dev_err(priv->dev, "error iddq enable: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(30, 50);
+
+	/*
+	 * Set bit 5 of USS_USB_PHY_CFG0 register.
+	 * This selects the external reference pads as the inputs for the
+	 * ref clk source as oppose to the alternate ref clk.
+	 */
+	ret = regmap_update_bits(priv->regmap_slv, USS_USB_PHY_CFG0,
+				 PHY_REF_USE_PAD_MASK,
+				 FIELD_PREP(PHY_REF_USE_PAD_MASK, 1));
+	if (ret)
+		dev_err(priv->dev, "error ref clock select: %d\n", ret);
+
+	return ret;
+}
+
+static int keembay_usb_core_off(struct keembay_usb_phy *priv)
+{
+	int ret;
+
+	/* Send the core back to the reset state */
+	ret = regmap_update_bits(priv->regmap_slv, USS_USB_CTRL_CFG0,
+				 VCC_RESET_N_MASK,
+				 FIELD_PREP(VCC_RESET_N_MASK, 0));
+	if (ret)
+		dev_err(priv->dev, "error core reset: %d\n", ret);
+
+	return ret;
+}
+
+static int keembay_usb_core_on(struct keembay_usb_phy *priv)
+{
+	int ret;
+
+	/* Release core reset (so that AXI slave can be used) */
+	ret = regmap_update_bits(priv->regmap_slv, USS_USB_CTRL_CFG0,
+				 VCC_RESET_N_MASK,
+				 FIELD_PREP(VCC_RESET_N_MASK, 1));
+	if (ret)
+		dev_err(priv->dev, "error core on: %d\n", ret);
+
+	return ret;
+}
+
+static int keembay_usb_phys_on(struct keembay_usb_phy *priv)
+{
+	int ret;
+
+	/* Bring PHYs out of reset */
+	ret = regmap_update_bits(priv->regmap_slv, USS_USB_PHY_CFG0,
+				 POR_MASK | PHY_RESET_MASK,
+				 FIELD_PREP(POR_MASK | PHY_RESET_MASK, 0));
+	if (ret)
+		dev_err(priv->dev, "error phys on: %d\n", ret);
+
+	return ret;
+}
+
+static int keembay_usb_phy_init(struct phy *phy)
+{
+	struct keembay_usb_phy *priv = phy_get_drvdata(phy);
+	u32 val;
+	int ret;
+
+	/* Reset the controller and both the USB2.0 and USB3.1 PHYs */
+	ret = keembay_usb_core_off(priv);
+	if (ret)
+		return ret;
+
+	/* Wait minimum 20us after clock enable */
+	usleep_range(20, 50);
+
+	/* to bring PHYs out of reset */
+	ret = keembay_usb_phys_on(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * Enable USB3.1 Control Register Parallel Interface
+	 *
+	 * (1) Clear bit 7 of USS_USB_TSET_SIGNALS_AND_GLOB register
+	 *     to disable the clock into the USB3.X parallel interface.
+	 * (2) Wait 2us.
+	 * (3) Set bit 2 of USS_USB_PARALLEL_IF_CTRL register to choose
+	 *     CR interface instead of JTAG.
+	 * (4) Set bit 7 of USS_USB_TSET_SIGNALS_AND_GLOB register
+	 *     to reenable the clock into the USB3.X parallel interface.
+	 */
+	ret = regmap_update_bits(priv->regmap_slv,
+				 USS_USB_TSET_SIGNALS_AND_GLOB,
+				 USB_PHY_CR_PARA_CLK_EN_MASK,
+				 FIELD_PREP(USB_PHY_CR_PARA_CLK_EN_MASK, 0));
+	if (ret) {
+		dev_err(priv->dev, "error cr clock disable: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(2, 10);
+
+	ret = regmap_update_bits(priv->regmap_slv,
+				 USS_USB_PARALLEL_IF_CTRL,
+				 USB_PHY_CR_PARA_SEL_MASK,
+				 FIELD_PREP(USB_PHY_CR_PARA_SEL_MASK, 1));
+	if (ret) {
+		dev_err(priv->dev, "error cr select: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_update_bits(priv->regmap_slv,
+				 USS_USB_TSET_SIGNALS_AND_GLOB,
+				 USB_PHY_CR_PARA_CLK_EN_MASK,
+				 FIELD_PREP(USB_PHY_CR_PARA_CLK_EN_MASK, 1));
+	if (ret) {
+		dev_err(priv->dev, "error cr clock enable: %d\n", ret);
+		return ret;
+	}
+
+	/* Wait for USB3.1 PHY0 SRAM init done */
+	ret = regmap_read_poll_timeout(priv->regmap_slv, USS_USB_STATUS_REG,
+				       val, (val & PHY0_SRAM_INIT_DONE_MASK),
+				       USEC_PER_MSEC, 10 * USEC_PER_MSEC);
+	if (ret) {
+		dev_err(priv->dev, "SRAM init not done: %d\n", ret);
+		return ret;
+	}
+
+	/* Set the SRAM load done bit */
+	ret = regmap_update_bits(priv->regmap_slv, USS_USB_PHY_CFG6,
+				 PHY0_SRAM_EXT_LD_DONE_MASK,
+				 FIELD_PREP(PHY0_SRAM_EXT_LD_DONE_MASK, 1));
+	if (ret) {
+		dev_err(priv->dev, "error SRAM init done set: %d\n", ret);
+		return ret;
+	}
+
+	/* Wait 20us */
+	usleep_range(20, 50);
+
+	/* and release the controller reset */
+	return keembay_usb_core_on(priv);
+}
+
+static const struct phy_ops ops = {
+	.init		= keembay_usb_phy_init,
+	.owner		= THIS_MODULE,
+};
+
+static int keembay_usb_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct keembay_usb_phy *priv;
+	struct phy *generic_phy;
+	struct phy_provider *phy_provider;
+	void __iomem *base;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource_byname(pdev, "cpr-apb-base");
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap_cpr = devm_regmap_init_mmio(dev, base,
+						 &keembay_regmap_config);
+	if (IS_ERR(priv->regmap_cpr))
+		return PTR_ERR(priv->regmap_cpr);
+
+	base = devm_platform_ioremap_resource_byname(pdev, "slv-apb-base");
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap_slv = devm_regmap_init_mmio(dev, base,
+						 &keembay_regmap_config);
+	if (IS_ERR(priv->regmap_slv))
+		return PTR_ERR(priv->regmap_slv);
+
+	generic_phy = devm_phy_create(dev, np, &ops);
+	if (IS_ERR(generic_phy))
+		return dev_err_probe(dev, PTR_ERR(generic_phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(generic_phy, priv);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "failed to register phy provider\n");
+
+	/* Setup USB subsystem clocks */
+	ret = keembay_usb_clocks_on(priv);
+	if (ret)
+		return ret;
+
+	/* and turn on the DWC3 core, prior to DWC3 driver init */
+	return keembay_usb_core_on(priv);
+}
+
+static const struct of_device_id keembay_usb_phy_dt_ids[] = {
+	{ .compatible = "intel,keembay-usb-phy" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, keembay_usb_phy_dt_ids);
+
+static struct platform_driver keembay_usb_phy_driver = {
+	.probe		= keembay_usb_phy_probe,
+	.driver		= {
+		.name	= "keembay-usb-phy",
+		.of_match_table = keembay_usb_phy_dt_ids,
+	},
+};
+module_platform_driver(keembay_usb_phy_driver);
+
+MODULE_AUTHOR("Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>");
+MODULE_DESCRIPTION("Intel Keem Bay USB PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

