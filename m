Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFA61AC0F5
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 14:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635362AbgDPMUF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 08:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635285AbgDPMTb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 08:19:31 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA50C03C1AA
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 05:19:24 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f13so4504973wrm.13
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0T4e6l7kAQsVdQHzlm77vFvHvaFQgmwy8jkFziwVGh0=;
        b=iSDX8K26E7ByX5n7jBb7SEQgbmFQ/rWCgYWIwy1u6PV2HYQMZHXhqS2DBcqGL2EgEX
         f68bOeuzwlGZXqtaz40/jD/ruWzHJQ5jn/OhtR8XyeBTUoJ+rlmi3SBogNze1AoKYAKo
         XOIy7ZYX3Nj6pb/Ysn08GAkJfwlC4S4FqtJrlMqqy0YU+sKz29Of0FOdtpomcuOejN0c
         Sbdl2xxMrd25Xas62pdK2aD3ftjI1349+Iys85CG8ot2DtcNdevKHc5vVwqNz7lZmIyo
         lYGXV2C1qR4U6Jpz0JuM2TWOR55TRyA1rTZyaPjBPyhxAx8Kjzkg8/WPHDvl60CXIB8k
         3xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0T4e6l7kAQsVdQHzlm77vFvHvaFQgmwy8jkFziwVGh0=;
        b=qP0npHRDE+toRl4efVHiWVsqD24qHNcMA+no7qbzGxP/cRmEvJsl+dWhOnhu9Zy79M
         hEtiETQEKsBI4bPSwclGQioTBfNE7bhrAdXn2CeJdxNF8N0b3HSlJgpS7knPCvZUtBYG
         einbtN+g3kt/Xo5bQI0ZX81Tlaqeexsh+idvWymsH5PJHYEhtEJUpbuflTGZDA5Tm8Pn
         WOxxqE6piycJF3fxjWjIEydGg/Goh31g+9F+SQURZPW0QxcXRP8hMj8Q7QuKo/+gy1AU
         W0MANjC4UVB+/YAVnSu3UF2JlIAMkwH22idqC/VzPzzXdebvawLDzAQzCMJd5Vcrisix
         NSNg==
X-Gm-Message-State: AGi0PuYYfvmj3LYENDo/k22TWUoQHPZk1JSgRgUOM6lVW9NYqKvZyvQT
        +g13yQCMDf8TtFtU8N9eM44u4g==
X-Google-Smtp-Source: APiQypIxPszfM6LqUKKuk7WUz9VTRpnLJ2urTQ9lH+jnodE6Gvp11VklQbGhVOfB6l5l9/lkK8KDpA==
X-Received: by 2002:adf:a18c:: with SMTP id u12mr30518457wru.325.1587039563385;
        Thu, 16 Apr 2020 05:19:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
        by smtp.gmail.com with ESMTPSA id i13sm22035602wro.50.2020.04.16.05.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 05:19:22 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 5/8] phy: amlogic: meson-gxl-usb3: remove code for non-existing PHY
Date:   Thu, 16 Apr 2020 14:19:07 +0200
Message-Id: <20200416121910.12723-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416121910.12723-1-narmstrong@baylibre.com>
References: <20200416121910.12723-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

The registers which are managed by the meson-gxl-usb3 PHY driver are
actually "USB control" registers (which are "glue" registers which
manage OTG detection and routing of the OTG capable port between the
DWC2 peripheral-only controller and the DWC3 host-only controller).

Drop the meson-gxl-usb3 PHY driver now that the dwc3-meson-g12a-usb
driver supports the USB control registers on GXL and GXM SoCs (these
were previously managed by the meson-gxl-usb3 PHY driver).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/phy/meson-gxl-usb3-phy.txt       |  31 --
 drivers/phy/amlogic/Kconfig                   |  12 -
 drivers/phy/amlogic/Makefile                  |   1 -
 drivers/phy/amlogic/phy-meson-gxl-usb3.c      | 283 ------------------
 4 files changed, 327 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
 delete mode 100644 drivers/phy/amlogic/phy-meson-gxl-usb3.c

diff --git a/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt b/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
deleted file mode 100644
index 114947e1de3d..000000000000
--- a/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-* Amlogic Meson GXL and GXM USB3 PHY and OTG detection binding
-
-Required properties:
-- compatible:	Should be "amlogic,meson-gxl-usb3-phy"
-- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
-- reg:		The base address and length of the registers
-- interrupts:	the interrupt specifier for the OTG detection
-- clocks:	phandles to the clocks for
-		- the USB3 PHY
-		- and peripheral mode/OTG detection
-- clock-names:	must contain "phy" and "peripheral"
-- resets:	phandle to the reset lines for:
-		- the USB3 PHY and
-		- peripheral mode/OTG detection
-- reset-names:	must contain "phy" and "peripheral"
-
-Optional properties:
-- phy-supply:	see phy-bindings.txt in this directory
-
-
-Example:
-	usb3_phy0: phy@78080 {
-		compatible = "amlogic,meson-gxl-usb3-phy";
-		#phy-cells = <0>;
-		reg = <0x0 0x78080 0x0 0x20>;
-		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clkc CLKID_USB_OTG>, <&clkc_AO CLKID_AO_CEC_32K>;
-		clock-names = "phy", "peripheral";
-		resets = <&reset RESET_USB_OTG>, <&reset RESET_USB_OTG>;
-		reset-names = "phy", "peripheral";
-	};
diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index 71801e30d601..df214ef008dc 100644
--- a/drivers/phy/amlogic/Kconfig
+++ b/drivers/phy/amlogic/Kconfig
@@ -26,18 +26,6 @@ config PHY_MESON_GXL_USB2
 	  GXL and GXM SoCs.
 	  If unsure, say N.
 
-config PHY_MESON_GXL_USB3
-	tristate "Meson GXL and GXM USB3 PHY drivers"
-	default ARCH_MESON
-	depends on OF && (ARCH_MESON || COMPILE_TEST)
-	depends on USB_SUPPORT
-	select GENERIC_PHY
-	select REGMAP_MMIO
-	help
-	  Enable this to support the Meson USB3 PHY and OTG detection
-	  IP block found in Meson GXL and GXM SoCs.
-	  If unsure, say N.
-
 config PHY_MESON_G12A_USB2
 	tristate "Meson G12A USB2 PHY driver"
 	default ARCH_MESON
diff --git a/drivers/phy/amlogic/Makefile b/drivers/phy/amlogic/Makefile
index e2baa133f7af..99702a45e9be 100644
--- a/drivers/phy/amlogic/Makefile
+++ b/drivers/phy/amlogic/Makefile
@@ -2,7 +2,6 @@
 obj-$(CONFIG_PHY_MESON8B_USB2)			+= phy-meson8b-usb2.o
 obj-$(CONFIG_PHY_MESON_GXL_USB2)		+= phy-meson-gxl-usb2.o
 obj-$(CONFIG_PHY_MESON_G12A_USB2)		+= phy-meson-g12a-usb2.o
-obj-$(CONFIG_PHY_MESON_GXL_USB3)		+= phy-meson-gxl-usb3.o
 obj-$(CONFIG_PHY_MESON_G12A_USB3_PCIE)		+= phy-meson-g12a-usb3-pcie.o
 obj-$(CONFIG_PHY_MESON_AXG_PCIE)		+= phy-meson-axg-pcie.o
 obj-$(CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG)	+= phy-meson-axg-mipi-pcie-analog.o
diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb3.c b/drivers/phy/amlogic/phy-meson-gxl-usb3.c
deleted file mode 100644
index c0e9e4c16149..000000000000
--- a/drivers/phy/amlogic/phy-meson-gxl-usb3.c
+++ /dev/null
@@ -1,283 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Meson GXL USB3 PHY and OTG mode detection driver
- *
- * Copyright (C) 2018 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
- */
-
-#include <linux/bitfield.h>
-#include <linux/bitops.h>
-#include <linux/clk.h>
-#include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/phy/phy.h>
-#include <linux/regmap.h>
-#include <linux/reset.h>
-#include <linux/platform_device.h>
-
-#define USB_R0							0x00
-	#define USB_R0_P30_FSEL_MASK				GENMASK(5, 0)
-	#define USB_R0_P30_PHY_RESET				BIT(6)
-	#define USB_R0_P30_TEST_POWERDOWN_HSP			BIT(7)
-	#define USB_R0_P30_TEST_POWERDOWN_SSP			BIT(8)
-	#define USB_R0_P30_ACJT_LEVEL_MASK			GENMASK(13, 9)
-	#define USB_R0_P30_TX_BOOST_LEVEL_MASK			GENMASK(16, 14)
-	#define USB_R0_P30_LANE0_TX2RX_LOOPBACK			BIT(17)
-	#define USB_R0_P30_LANE0_EXT_PCLK_REQ			BIT(18)
-	#define USB_R0_P30_PCS_RX_LOS_MASK_VAL_MASK		GENMASK(28, 19)
-	#define USB_R0_U2D_SS_SCALEDOWN_MODE_MASK		GENMASK(30, 29)
-	#define USB_R0_U2D_ACT					BIT(31)
-
-#define USB_R1							0x04
-	#define USB_R1_U3H_BIGENDIAN_GS				BIT(0)
-	#define USB_R1_U3H_PME_ENABLE				BIT(1)
-	#define USB_R1_U3H_HUB_PORT_OVERCURRENT_MASK		GENMASK(6, 2)
-	#define USB_R1_U3H_HUB_PORT_PERM_ATTACH_MASK		GENMASK(11, 7)
-	#define USB_R1_U3H_HOST_U2_PORT_DISABLE_MASK		GENMASK(15, 12)
-	#define USB_R1_U3H_HOST_U3_PORT_DISABLE			BIT(16)
-	#define USB_R1_U3H_HOST_PORT_POWER_CONTROL_PRESENT	BIT(17)
-	#define USB_R1_U3H_HOST_MSI_ENABLE			BIT(18)
-	#define USB_R1_U3H_FLADJ_30MHZ_REG_MASK			GENMASK(24, 19)
-	#define USB_R1_P30_PCS_TX_SWING_FULL_MASK		GENMASK(31, 25)
-
-#define USB_R2							0x08
-	#define USB_R2_P30_CR_DATA_IN_MASK			GENMASK(15, 0)
-	#define USB_R2_P30_CR_READ				BIT(16)
-	#define USB_R2_P30_CR_WRITE				BIT(17)
-	#define USB_R2_P30_CR_CAP_ADDR				BIT(18)
-	#define USB_R2_P30_CR_CAP_DATA				BIT(19)
-	#define USB_R2_P30_PCS_TX_DEEMPH_3P5DB_MASK		GENMASK(25, 20)
-	#define USB_R2_P30_PCS_TX_DEEMPH_6DB_MASK		GENMASK(31, 26)
-
-#define USB_R3							0x0c
-	#define USB_R3_P30_SSC_ENABLE				BIT(0)
-	#define USB_R3_P30_SSC_RANGE_MASK			GENMASK(3, 1)
-	#define USB_R3_P30_SSC_REF_CLK_SEL_MASK			GENMASK(12, 4)
-	#define USB_R3_P30_REF_SSP_EN				BIT(13)
-	#define USB_R3_P30_LOS_BIAS_MASK			GENMASK(18, 16)
-	#define USB_R3_P30_LOS_LEVEL_MASK			GENMASK(23, 19)
-	#define USB_R3_P30_MPLL_MULTIPLIER_MASK			GENMASK(30, 24)
-
-#define USB_R4							0x10
-	#define USB_R4_P21_PORT_RESET_0				BIT(0)
-	#define USB_R4_P21_SLEEP_M0				BIT(1)
-	#define USB_R4_MEM_PD_MASK				GENMASK(3, 2)
-	#define USB_R4_P21_ONLY					BIT(4)
-
-#define USB_R5							0x14
-	#define USB_R5_ID_DIG_SYNC				BIT(0)
-	#define USB_R5_ID_DIG_REG				BIT(1)
-	#define USB_R5_ID_DIG_CFG_MASK				GENMASK(3, 2)
-	#define USB_R5_ID_DIG_EN_0				BIT(4)
-	#define USB_R5_ID_DIG_EN_1				BIT(5)
-	#define USB_R5_ID_DIG_CURR				BIT(6)
-	#define USB_R5_ID_DIG_IRQ				BIT(7)
-	#define USB_R5_ID_DIG_TH_MASK				GENMASK(15, 8)
-	#define USB_R5_ID_DIG_CNT_MASK				GENMASK(23, 16)
-
-/* read-only register */
-#define USB_R6							0x18
-	#define USB_R6_P30_CR_DATA_OUT_MASK			GENMASK(15, 0)
-	#define USB_R6_P30_CR_ACK				BIT(16)
-
-struct phy_meson_gxl_usb3_priv {
-	struct regmap		*regmap;
-	enum phy_mode		mode;
-	struct clk		*clk_phy;
-	struct clk		*clk_peripheral;
-	struct reset_control	*reset;
-};
-
-static const struct regmap_config phy_meson_gxl_usb3_regmap_conf = {
-	.reg_bits = 8,
-	.val_bits = 32,
-	.reg_stride = 4,
-	.max_register = USB_R6,
-};
-
-static int phy_meson_gxl_usb3_power_on(struct phy *phy)
-{
-	struct phy_meson_gxl_usb3_priv *priv = phy_get_drvdata(phy);
-
-	regmap_update_bits(priv->regmap, USB_R5, USB_R5_ID_DIG_EN_0,
-			   USB_R5_ID_DIG_EN_0);
-	regmap_update_bits(priv->regmap, USB_R5, USB_R5_ID_DIG_EN_1,
-			   USB_R5_ID_DIG_EN_1);
-	regmap_update_bits(priv->regmap, USB_R5, USB_R5_ID_DIG_TH_MASK,
-			   FIELD_PREP(USB_R5_ID_DIG_TH_MASK, 0xff));
-
-	return 0;
-}
-
-static int phy_meson_gxl_usb3_power_off(struct phy *phy)
-{
-	struct phy_meson_gxl_usb3_priv *priv = phy_get_drvdata(phy);
-
-	regmap_update_bits(priv->regmap, USB_R5, USB_R5_ID_DIG_EN_0, 0);
-	regmap_update_bits(priv->regmap, USB_R5, USB_R5_ID_DIG_EN_1, 0);
-
-	return 0;
-}
-
-static int phy_meson_gxl_usb3_set_mode(struct phy *phy,
-				       enum phy_mode mode, int submode)
-{
-	struct phy_meson_gxl_usb3_priv *priv = phy_get_drvdata(phy);
-
-	switch (mode) {
-	case PHY_MODE_USB_HOST:
-		regmap_update_bits(priv->regmap, USB_R0, USB_R0_U2D_ACT, 0);
-		regmap_update_bits(priv->regmap, USB_R4, USB_R4_P21_SLEEP_M0,
-				   0);
-		break;
-
-	case PHY_MODE_USB_DEVICE:
-		regmap_update_bits(priv->regmap, USB_R0, USB_R0_U2D_ACT,
-				   USB_R0_U2D_ACT);
-		regmap_update_bits(priv->regmap, USB_R4, USB_R4_P21_SLEEP_M0,
-				   USB_R4_P21_SLEEP_M0);
-		break;
-
-	default:
-		dev_err(&phy->dev, "unsupported PHY mode %d\n", mode);
-		return -EINVAL;
-	}
-
-	priv->mode = mode;
-
-	return 0;
-}
-
-static int phy_meson_gxl_usb3_init(struct phy *phy)
-{
-	struct phy_meson_gxl_usb3_priv *priv = phy_get_drvdata(phy);
-	int ret;
-
-	ret = reset_control_reset(priv->reset);
-	if (ret)
-		goto err;
-
-	ret = clk_prepare_enable(priv->clk_phy);
-	if (ret)
-		goto err;
-
-	ret = clk_prepare_enable(priv->clk_peripheral);
-	if (ret)
-		goto err_disable_clk_phy;
-
-	ret = phy_meson_gxl_usb3_set_mode(phy, priv->mode, 0);
-	if (ret)
-		goto err_disable_clk_peripheral;
-
-	regmap_update_bits(priv->regmap, USB_R1,
-			   USB_R1_U3H_FLADJ_30MHZ_REG_MASK,
-			   FIELD_PREP(USB_R1_U3H_FLADJ_30MHZ_REG_MASK, 0x20));
-
-	return 0;
-
-err_disable_clk_peripheral:
-	clk_disable_unprepare(priv->clk_peripheral);
-err_disable_clk_phy:
-	clk_disable_unprepare(priv->clk_phy);
-err:
-	return ret;
-}
-
-static int phy_meson_gxl_usb3_exit(struct phy *phy)
-{
-	struct phy_meson_gxl_usb3_priv *priv = phy_get_drvdata(phy);
-
-	clk_disable_unprepare(priv->clk_peripheral);
-	clk_disable_unprepare(priv->clk_phy);
-
-	return 0;
-}
-
-static const struct phy_ops phy_meson_gxl_usb3_ops = {
-	.power_on	= phy_meson_gxl_usb3_power_on,
-	.power_off	= phy_meson_gxl_usb3_power_off,
-	.set_mode	= phy_meson_gxl_usb3_set_mode,
-	.init		= phy_meson_gxl_usb3_init,
-	.exit		= phy_meson_gxl_usb3_exit,
-	.owner		= THIS_MODULE,
-};
-
-static int phy_meson_gxl_usb3_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct phy_meson_gxl_usb3_priv *priv;
-	struct resource *res;
-	struct phy *phy;
-	struct phy_provider *phy_provider;
-	void __iomem *base;
-	int ret;
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	priv->regmap = devm_regmap_init_mmio(dev, base,
-					     &phy_meson_gxl_usb3_regmap_conf);
-	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
-
-	priv->clk_phy = devm_clk_get(dev, "phy");
-	if (IS_ERR(priv->clk_phy))
-		return PTR_ERR(priv->clk_phy);
-
-	priv->clk_peripheral = devm_clk_get(dev, "peripheral");
-	if (IS_ERR(priv->clk_peripheral))
-		return PTR_ERR(priv->clk_peripheral);
-
-	priv->reset = devm_reset_control_array_get_shared(dev);
-	if (IS_ERR(priv->reset))
-		return PTR_ERR(priv->reset);
-
-	/*
-	 * default to host mode as hardware defaults and/or boot-loader
-	 * behavior can result in this PHY starting up in device mode. this
-	 * default and the initialization in phy_meson_gxl_usb3_init ensure
-	 * that we reproducibly start in a known mode on all devices.
-	 */
-	priv->mode = PHY_MODE_USB_HOST;
-
-	phy = devm_phy_create(dev, np, &phy_meson_gxl_usb3_ops);
-	if (IS_ERR(phy)) {
-		ret = PTR_ERR(phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to create PHY\n");
-
-		return ret;
-	}
-
-	phy_set_drvdata(phy, priv);
-
-	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-
-	return PTR_ERR_OR_ZERO(phy_provider);
-}
-
-static const struct of_device_id phy_meson_gxl_usb3_of_match[] = {
-	{ .compatible = "amlogic,meson-gxl-usb3-phy", },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, phy_meson_gxl_usb3_of_match);
-
-static struct platform_driver phy_meson_gxl_usb3_driver = {
-	.probe	= phy_meson_gxl_usb3_probe,
-	.driver	= {
-		.name		= "phy-meson-gxl-usb3",
-		.of_match_table	= phy_meson_gxl_usb3_of_match,
-	},
-};
-module_platform_driver(phy_meson_gxl_usb3_driver);
-
-MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
-MODULE_DESCRIPTION("Meson GXL USB3 PHY and OTG detection driver");
-MODULE_LICENSE("GPL v2");
-- 
2.22.0

