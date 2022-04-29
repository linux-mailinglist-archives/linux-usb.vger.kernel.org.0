Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFBD05142D0
	for <lists+linux-usb@lfdr.de>; Fri, 29 Apr 2022 09:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354883AbiD2HE6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Apr 2022 03:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354849AbiD2HE4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Apr 2022 03:04:56 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15867B8228;
        Fri, 29 Apr 2022 00:01:39 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id x52so4637934pfu.11;
        Fri, 29 Apr 2022 00:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z2EBEXpBv9EPRs2ABOXKmLkAk88CEehciQnn+WWQkas=;
        b=eYyJ1z4k6RDLTrhjPoPk0ctStY4P4dX9tk0rHBi1JgwDCoAN3bG4HNcZt2tlClyKMG
         97H4fGg6X55UtY7EgzZZx4e6AIiycZJXp/tmsq7VNwuM7v5rqaE4FX1NJa/knt/X4cUO
         1d57DBgBSVUSviJEWudF/UxWycmRZyLxFEbMU6H1xEJaZEhVpfTT0NQ7rk8SwVVt5rqB
         XQ+q65C0YRdZwX/X/7n/i1yRhl1Tfb9GEou0n3+u3pAyxy4vMA0e1hZj74Jx0EvQDG1v
         uuKfmzBEkBej8ooTarxBsFOiOYjbxGWpPllS2JbR3J/CVv29dYG1Qwn9gXTHtNxmDOxW
         qs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z2EBEXpBv9EPRs2ABOXKmLkAk88CEehciQnn+WWQkas=;
        b=lD6ESJD46hvOWdsihgYELfW0Rb1dEjJ//dKh8PygKl/5y0xKh7BWnsa4uDRp+pT71/
         wdX+b+QlzK/KO2oyZhiEXivOBi6x2kUZlXkVkhqZrv4MXuQa+XUuSXvCaCkdX9STFyat
         F5KAY/VEvjGPNfWJ8tTFUwpKYFtA87w7gF2LgZ3FR1V/FV9EZpMvb5nwYbFm8y/gYd81
         1lc6tro95ud/pBMgJ5b7C+BBbOotFuMh93j/o2vxOnnSL9QtpxjPGblafQkcd5Z2ZwAN
         j5t644G8ub5xKny1doSABOSKOWR6CBn2UWsgrqP6sF55C1xa/oum2eQ0lLr5OHgBmI1D
         hVTA==
X-Gm-Message-State: AOAM533J3b6Qn/rCJ9jYht6CQ5eTemQqeVWpqE8NXIaAC0VhteMM1aho
        WjRR6vRjApvFHkrar13O7+U=
X-Google-Smtp-Source: ABdhPJyzGLR7x+BDuGuRaiyl8y0G/VTd6v5k50vjiJ/nK8mxUajpw+qwZIgEnQnrC2aVASR1n7CyKg==
X-Received: by 2002:a05:6a00:1249:b0:50d:b4c6:fb8e with SMTP id u9-20020a056a00124900b0050db4c6fb8emr1311394pfi.85.1651215698155;
        Fri, 29 Apr 2022 00:01:38 -0700 (PDT)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id iy19-20020a17090b16d300b001cd4989fee6sm13148106pjb.50.2022.04.29.00.01.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2022 00:01:37 -0700 (PDT)
From:   Vincent Shih <vincent.sunplus@gmail.com>
To:     kishon@ti.com, vkoul@kernel.org, p.zabel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        wells.lu@sunplus.com
Cc:     Vincent Shih <vincent.sunplus@gmail.com>
Subject: [PATCH v2 1/2] phy: usb: Add USB2.0 phy driver for Sunplus SP7021
Date:   Fri, 29 Apr 2022 15:00:55 +0800
Message-Id: <1651215656-19024-2-git-send-email-vincent.sunplus@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1651215656-19024-1-git-send-email-vincent.sunplus@gmail.com>
References: <1651215656-19024-1-git-send-email-vincent.sunplus@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add USB2.0 phy driver for Sunplus SP7021

Signed-off-by: Vincent Shih <vincent.sunplus@gmail.com>
---
Changes in v2:
 - Addressed the comments from Mr. Vinod Koul

 MAINTAINERS                            |   8 +
 drivers/phy/Kconfig                    |   1 +
 drivers/phy/Makefile                   |   1 +
 drivers/phy/sunplus/Kconfig            |  13 ++
 drivers/phy/sunplus/Makefile           |   2 +
 drivers/phy/sunplus/phy-sunplus-usb2.c | 296 +++++++++++++++++++++++++++++++++
 6 files changed, 321 insertions(+)
 create mode 100644 drivers/phy/sunplus/Kconfig
 create mode 100644 drivers/phy/sunplus/Makefile
 create mode 100644 drivers/phy/sunplus/phy-sunplus-usb2.c

diff --git a/MAINTAINERS b/MAINTAINERS
index dd61684..6b88a7b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18914,6 +18914,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/serial/sunplus,sp7021-uart.yaml
 F:	drivers/tty/serial/sunplus-uart.c
 
+SUNPLUS USB2 PHY DRIVER
+M:	Vincent Shih <vincent.sunplus@gmail.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/phy/sunplus/Kconfig
+F:	drivers/phy/sunplus/Makefile
+F:	drivers/phy/sunplus/phy-sunplus-usb2.c
+
 SUPERH
 M:	Yoshinori Sato <ysato@users.sourceforge.jp>
 M:	Rich Felker <dalias@libc.org>
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 82b63e6..d97e22e 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -90,6 +90,7 @@ source "drivers/phy/rockchip/Kconfig"
 source "drivers/phy/samsung/Kconfig"
 source "drivers/phy/socionext/Kconfig"
 source "drivers/phy/st/Kconfig"
+source "drivers/phy/sunplus/Kconfig"
 source "drivers/phy/tegra/Kconfig"
 source "drivers/phy/ti/Kconfig"
 source "drivers/phy/intel/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index 01e9eff..54f312c 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -31,6 +31,7 @@ obj-y					+= allwinner/	\
 					   samsung/	\
 					   socionext/	\
 					   st/		\
+					   sunplus/	\
 					   tegra/	\
 					   ti/		\
 					   xilinx/
diff --git a/drivers/phy/sunplus/Kconfig b/drivers/phy/sunplus/Kconfig
new file mode 100644
index 0000000..bad4cf6
--- /dev/null
+++ b/drivers/phy/sunplus/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config PHY_SUNPLUS_USB
+	tristate "Sunplus SP7021 USB 2.0 PHY driver"
+	depends on OF && (SOC_SP7021 || COMPILE_TEST)
+	select GENERIC_PHY
+	select NVMEM_SUNPLUS_OCOTP
+	help
+	  Enable this to support the USB 2.0 PHY on Sunplus SP7021
+	  SoC. The USB 2.0 PHY controller supports battery charger
+	  and synchronous signals, various power down modes including
+	  operating, partial and suspend modes, and high-speed,
+	  full-speed and low-speed data transfer.
diff --git a/drivers/phy/sunplus/Makefile b/drivers/phy/sunplus/Makefile
new file mode 100644
index 0000000..71754d5
--- /dev/null
+++ b/drivers/phy/sunplus/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_SUNPLUS_USB)	+= phy-sunplus-usb2.o
diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
new file mode 100644
index 0000000..2707b6f
--- /dev/null
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Sunplus SP7021 USB 2.0 phy driver
+ *
+ * Copyright (C) 2022 Sunplus Technology Inc., All rights reserved.
+ *
+ * Note 1 : non-posted write command for the registers accesses of
+ * Sunplus SP7021.
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#define HIGH_MASK_BITS				GENMASK(31, 16)
+#define LOW_MASK_BITS				GENMASK(15, 0)
+#define OTP_DISC_LEVEL_DEFAULT			0xd
+
+/* GROUP UPHY */
+#define CONFIG1					0x4
+#define J_HS_TX_PWRSAV				BIT(5)
+#define CONFIG3					0xc
+#define J_FORCE_DISC_ON				BIT(5)
+#define J_DEBUG_CTRL_ADDR_MACRO			BIT(0)
+#define CONFIG7					0x1c
+#define J_DISC					0X1f
+#define CONFIG9					0x24
+#define J_ECO_PATH				BIT(6)
+#define CONFIG16				0x40
+#define J_TBCWAIT_MASK				GENMASK(6, 5)
+#define J_TBCWAIT_1P1_MS			FIELD_PREP(J_TBCWAIT_MASK, 0)
+#define J_TVDM_SRC_DIS_MASK			GENMASK(4, 3)
+#define J_TVDM_SRC_DIS_8P2_MS			FIELD_PREP(J_TVDM_SRC_DIS_MASK, 3)
+#define J_TVDM_SRC_EN_MASK			GENMASK(2, 1)
+#define J_TVDM_SRC_EN_1P6_MS			FIELD_PREP(J_TVDM_SRC_EN_MASK, 0)
+#define J_BC_EN					BIT(0)
+#define CONFIG17				0x44
+#define IBG_TRIM0_MASK				GENMASK(7, 5)
+#define IBG_TRIM0_SSLVHT			FIELD_PREP(IBG_TRIM0_MASK, 4)
+#define J_VDATREE_TRIM_MASK			GENMASK(4, 1)
+#define J_VDATREE_TRIM_DEFAULT			FIELD_PREP(J_VDATREE_TRIM_MASK, 9)
+#define CONFIG23				0x5c
+#define PROB_MASK				GENMASK(5, 3)
+#define PROB					FIELD_PREP(PROB_MASK, 7)
+
+/* GROUP MOON4 */
+#define UPHY_CONTROL0				0x0
+#define UPHY_CONTROL1				0x4
+#define UPHY_CONTROL2				0x8
+#define MO1_UPHY_RX_CLK_SEL			BIT(6)
+#define MASK_MO1_UPHY_RX_CLK_SEL		BIT(6 + 16)
+#define UPHY_CONTROL3				0xc
+#define MO1_UPHY_PLL_POWER_OFF_SEL		BIT(7)
+#define MASK_MO1_UPHY_PLL_POWER_OFF_SEL		BIT(7 + 16)
+#define MO1_UPHY_PLL_POWER_OFF			BIT(3)
+#define MASK_UPHY_PLL_POWER_OFF			BIT(3 + 16)
+
+struct sp_usbphy {
+	struct device *dev;
+	struct resource *phy_res_mem;
+	struct resource *moon4_res_mem;
+	struct reset_control *rstc;
+	struct clk *phy_clk;
+	void __iomem *phy_regs;
+	void __iomem *moon4_regs;
+	u32 disc_vol_addr_off;
+};
+
+static int update_disc_vol(struct sp_usbphy *usbphy)
+{
+	struct nvmem_cell *cell;
+	char *disc_name = "disc_vol";
+	ssize_t otp_l = 0;
+	char *otp_v;
+	u32 val, set;
+
+	cell = nvmem_cell_get(usbphy->dev, disc_name);
+	if (IS_ERR_OR_NULL(cell)) {
+		if (PTR_ERR(cell) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+	}
+
+	otp_v = nvmem_cell_read(cell, &otp_l);
+	nvmem_cell_put(cell);
+
+	if (otp_v) {
+		set = *(otp_v + 1);
+		set = (set << (sizeof(char) * 8)) | *otp_v;
+		set = (set >> usbphy->disc_vol_addr_off) & J_DISC;
+	}
+
+	if (!otp_v || set == 0)
+		set = OTP_DISC_LEVEL_DEFAULT;
+
+	val = readl(usbphy->phy_regs + CONFIG7);
+	val = (val & ~J_DISC) | set;
+	writel(val, usbphy->phy_regs + CONFIG7);
+
+	return 0;
+}
+
+static int sp_uphy_init(struct phy *phy)
+{
+	struct sp_usbphy *usbphy = phy_get_drvdata(phy);
+	u32 val;
+	int ret;
+
+	ret = clk_prepare_enable(usbphy->phy_clk);
+	if (ret)
+		goto err_clk;
+
+	ret = reset_control_deassert(usbphy->rstc);
+	if (ret)
+		goto err_reset;
+
+	/* Default value modification */
+	writel(HIGH_MASK_BITS | 0x4002, usbphy->moon4_regs + UPHY_CONTROL0);
+	writel(HIGH_MASK_BITS | 0x8747, usbphy->moon4_regs + UPHY_CONTROL1);
+
+	/* disconnect voltage */
+	ret = update_disc_vol(usbphy);
+	if (ret < 0)
+		return ret;
+
+	/* board uphy 0 internal register modification for tid certification */
+	val = readl(usbphy->phy_regs + CONFIG9);
+	val &= ~(J_ECO_PATH);
+	writel(val, usbphy->phy_regs + CONFIG9);
+
+	val = readl(usbphy->phy_regs + CONFIG1);
+	val &= ~(J_HS_TX_PWRSAV);
+	writel(val, usbphy->phy_regs + CONFIG1);
+
+	val = readl(usbphy->phy_regs + CONFIG23);
+	val = (val & ~PROB) | PROB;
+	writel(val, usbphy->phy_regs + CONFIG23);
+
+	/* port 0 uphy clk fix */
+	writel(MASK_MO1_UPHY_RX_CLK_SEL | MO1_UPHY_RX_CLK_SEL,
+	       usbphy->moon4_regs + UPHY_CONTROL2);
+
+	/* battery charger */
+	writel(J_TBCWAIT_1P1_MS | J_TVDM_SRC_DIS_8P2_MS | J_TVDM_SRC_EN_1P6_MS | J_BC_EN,
+	       usbphy->phy_regs + CONFIG16);
+	writel(IBG_TRIM0_SSLVHT | J_VDATREE_TRIM_DEFAULT, usbphy->phy_regs + CONFIG17);
+
+	/* chirp mode */
+	writel(J_FORCE_DISC_ON | J_DEBUG_CTRL_ADDR_MACRO, usbphy->phy_regs + CONFIG3);
+
+	return 0;
+
+err_reset:
+	reset_control_assert(usbphy->rstc);
+err_clk:
+	clk_disable_unprepare(usbphy->phy_clk);
+
+	return ret;
+}
+
+static int sp_uphy_power_on(struct phy *phy)
+{
+	struct sp_usbphy *usbphy = phy_get_drvdata(phy);
+	u32 pll_pwr_on, pll_pwr_off;
+
+	/* PLL power off/on twice */
+	pll_pwr_off = (readl(usbphy->moon4_regs + UPHY_CONTROL3) & ~LOW_MASK_BITS)
+			| MO1_UPHY_PLL_POWER_OFF_SEL | MO1_UPHY_PLL_POWER_OFF;
+	pll_pwr_on = (readl(usbphy->moon4_regs + UPHY_CONTROL3) & ~LOW_MASK_BITS)
+			| MO1_UPHY_PLL_POWER_OFF_SEL;
+
+	writel(MASK_MO1_UPHY_PLL_POWER_OFF_SEL | MASK_UPHY_PLL_POWER_OFF | pll_pwr_off,
+	       usbphy->moon4_regs + UPHY_CONTROL3);
+	mdelay(1);
+	writel(MASK_MO1_UPHY_PLL_POWER_OFF_SEL | MASK_UPHY_PLL_POWER_OFF | pll_pwr_on,
+	       usbphy->moon4_regs + UPHY_CONTROL3);
+	mdelay(1);
+	writel(MASK_MO1_UPHY_PLL_POWER_OFF_SEL | MASK_UPHY_PLL_POWER_OFF | pll_pwr_off,
+	       usbphy->moon4_regs + UPHY_CONTROL3);
+	mdelay(1);
+	writel(MASK_MO1_UPHY_PLL_POWER_OFF_SEL | MASK_UPHY_PLL_POWER_OFF | pll_pwr_on,
+	       usbphy->moon4_regs + UPHY_CONTROL3);
+	mdelay(1);
+	writel(MASK_MO1_UPHY_PLL_POWER_OFF_SEL | MASK_UPHY_PLL_POWER_OFF | 0x0,
+	       usbphy->moon4_regs + UPHY_CONTROL3);
+
+	return 0;
+}
+
+static int sp_uphy_power_off(struct phy *phy)
+{
+	struct sp_usbphy *usbphy = phy_get_drvdata(phy);
+	u32 pll_pwr_off;
+
+	pll_pwr_off = (readl(usbphy->moon4_regs + UPHY_CONTROL3) & ~LOW_MASK_BITS)
+			| MO1_UPHY_PLL_POWER_OFF_SEL | MO1_UPHY_PLL_POWER_OFF;
+	writel(MASK_MO1_UPHY_PLL_POWER_OFF_SEL | MASK_UPHY_PLL_POWER_OFF | pll_pwr_off,
+	       usbphy->moon4_regs + UPHY_CONTROL3);
+	mdelay(1);
+	writel(MASK_MO1_UPHY_PLL_POWER_OFF_SEL | MASK_UPHY_PLL_POWER_OFF | 0x0,
+	       usbphy->moon4_regs + UPHY_CONTROL3);
+
+	return 0;
+}
+
+static int sp_uphy_exit(struct phy *phy)
+{
+	struct sp_usbphy *usbphy = phy_get_drvdata(phy);
+
+	reset_control_assert(usbphy->rstc);
+	clk_disable_unprepare(usbphy->phy_clk);
+
+	return 0;
+}
+
+static const struct phy_ops sp_uphy_ops = {
+	.init		= sp_uphy_init,
+	.power_on	= sp_uphy_power_on,
+	.power_off	= sp_uphy_power_off,
+	.exit		= sp_uphy_exit,
+};
+
+static const struct of_device_id sp_uphy_dt_ids[] = {
+	{.compatible = "sunplus,sp7021-usb2-phy", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sp_uphy_dt_ids);
+
+static int sp_usb_phy_probe(struct platform_device *pdev)
+{
+	struct sp_usbphy *usbphy;
+	struct phy_provider *phy_provider;
+	struct phy *phy;
+	int ret;
+
+	usbphy = devm_kzalloc(&pdev->dev, sizeof(*usbphy), GFP_KERNEL);
+	if (!usbphy)
+		return -ENOMEM;
+
+	usbphy->dev = &pdev->dev;
+
+	usbphy->phy_res_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
+	usbphy->phy_regs = devm_ioremap_resource(&pdev->dev, usbphy->phy_res_mem);
+	if (IS_ERR(usbphy->phy_regs))
+		return PTR_ERR(usbphy->phy_regs);
+
+	usbphy->moon4_res_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "moon4");
+	usbphy->moon4_regs = devm_ioremap(&pdev->dev, usbphy->moon4_res_mem->start,
+					  resource_size(usbphy->moon4_res_mem));
+	if (IS_ERR(usbphy->moon4_regs))
+		return PTR_ERR(usbphy->moon4_regs);
+
+	usbphy->phy_clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(usbphy->phy_clk))
+		return PTR_ERR(usbphy->phy_clk);
+
+	usbphy->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(usbphy->rstc))
+		return PTR_ERR(usbphy->rstc);
+
+	of_property_read_u32(pdev->dev.of_node, "sunplus,disc-vol-addr-off",
+			     &usbphy->disc_vol_addr_off);
+
+	phy = devm_phy_create(&pdev->dev, NULL, &sp_uphy_ops);
+	if (IS_ERR(phy)) {
+		ret = -PTR_ERR(phy);
+		return ret;
+	}
+
+	phy_set_drvdata(phy, usbphy);
+	phy_provider = devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver sunplus_usb_phy_driver = {
+	.probe		= sp_usb_phy_probe,
+	.driver		= {
+		.name	= "sunplus-usb2-phy",
+		.of_match_table = sp_uphy_dt_ids,
+	},
+};
+module_platform_driver(sunplus_usb_phy_driver);
+
+MODULE_AUTHOR("Vincent Shih <vincent.shih@sunplus.com>");
+MODULE_DESCRIPTION("Sunplus USB 2.0 phy driver");
+MODULE_LICENSE("GPL");
+
-- 
2.7.4

