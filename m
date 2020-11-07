Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB662AA44D
	for <lists+linux-usb@lfdr.de>; Sat,  7 Nov 2020 10:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgKGJtc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Nov 2020 04:49:32 -0500
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:52887 "EHLO
        out28-76.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbgKGJtb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 7 Nov 2020 04:49:31 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0385783-0.00195196-0.95947;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047207;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.ItlkgfC_1604742507;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.ItlkgfC_1604742507)
          by smtp.aliyun-inc.com(10.147.41.158);
          Sat, 07 Nov 2020 17:49:23 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, kishon@ti.com,
        vkoul@kernel.org, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, paul@crapouillou.net
Subject: [PATCH v8 3/3] PHY: Ingenic: Add USB PHY driver using generic PHY framework.
Date:   Sat,  7 Nov 2020 17:47:58 +0800
Message-Id: <20201107094758.83291-4-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201107094758.83291-1-zhouyanjie@wanyeetech.com>
References: <20201107094758.83291-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Used the generic PHY framework API to create the PHY, this driver
supoorts USB OTG PHY used in JZ4770 SoC, JZ4775 SoC, JZ4780 SoC,
X1000 SoC, X1830 SoC and X2000 SoC.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Co-developed-by: 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
Signed-off-by: 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v1->v2:
    Fix bug, ".of_match_table = of_match_ptr(ingenic_usb_phy_of_matches)" is wrong
    and should be replaced with ".of_match_table = ingenic_usb_phy_of_matches".
    
    v2->v3:
    1.Change "depends on (MACH_INGENIC && MIPS) || COMPILE_TEST" to
      "depends on MIPS || COMPILE_TEST".
    2.Keep the adjustments of "ingenic_usb_phy_init()" and "ingenic_usb_phu_exit()"
      positions in v2 to make them consistent with the order in "ingenic_usb_phy_ops",
      keep the adjustments to the positions of "ingenic_usb_phy_of_matches[]" in v2
      to keep them consistent with the styles of other USB PHY drivers. And remove
      some unnecessary changes to reduce the diff size, from the original 256 lines
      change to the current 209 lines.
    
    v3->v4:
    Only add new generic-PHY driver, without removing the old one. Because the
    jz4740-musb driver is not ready to use the generic PHY framework. When the
    jz4740-musb driver is modified to use the generic PHY framework, the old
    jz4770-phy driver can be "retired".
    
    v4->v5:
    1.Add an extra blank line between "devm_of_phy_provider_register" and "return".
    2.Remove unnecessary "phy_set_drvdata".
    3.Add Paul Cercueil's Reviewed-by.
    
    v5->v6:
    1.Revert the removal of "phy_set_drvdata" in v5, removing "phy_set_drvdata" will
      cause a kernel panic on CI20.
      Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
    2.Rewrite the macro definitions, replace the original code with "FIELD_PREP()"
      and "u32p_replace_bits()" according to Vinod Koul's suggestion.
    
    v6->v7:
    1.Remove the stray tab character.
    2.Remove unnecessary "platform_set_drvdata".
    3.Remove the "dev" field in priv structure, and use &phy->dev instead.
    
    v7->v8:
    Add support for Ingenic JZ4775 SoC and X2000 SoC.

 drivers/phy/Kconfig                   |   1 +
 drivers/phy/Makefile                  |   1 +
 drivers/phy/ingenic/Kconfig           |  12 +
 drivers/phy/ingenic/Makefile          |   2 +
 drivers/phy/ingenic/phy-ingenic-usb.c | 412 ++++++++++++++++++++++++++++++++++
 5 files changed, 428 insertions(+)
 create mode 100644 drivers/phy/ingenic/Kconfig
 create mode 100644 drivers/phy/ingenic/Makefile
 create mode 100644 drivers/phy/ingenic/phy-ingenic-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 01b53f86004c..00dabe5fab8a 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -66,6 +66,7 @@ source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/freescale/Kconfig"
 source "drivers/phy/hisilicon/Kconfig"
+source "drivers/phy/ingenic/Kconfig"
 source "drivers/phy/lantiq/Kconfig"
 source "drivers/phy/marvell/Kconfig"
 source "drivers/phy/mediatek/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index 6eb2916773c5..32261e164abd 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -15,6 +15,7 @@ obj-y					+= allwinner/	\
 					   cadence/	\
 					   freescale/	\
 					   hisilicon/	\
+					   ingenic/	\
 					   intel/	\
 					   lantiq/	\
 					   marvell/	\
diff --git a/drivers/phy/ingenic/Kconfig b/drivers/phy/ingenic/Kconfig
new file mode 100644
index 000000000000..912b14e512cb
--- /dev/null
+++ b/drivers/phy/ingenic/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Phy drivers for Ingenic platforms
+#
+config PHY_INGENIC_USB
+	tristate "Ingenic SoCs USB PHY Driver"
+	depends on MIPS || COMPILE_TEST
+	depends on USB_SUPPORT
+	select GENERIC_PHY
+	help
+	  This driver provides USB PHY support for the USB controller found
+	  on the JZ-series and X-series SoCs from Ingenic.
diff --git a/drivers/phy/ingenic/Makefile b/drivers/phy/ingenic/Makefile
new file mode 100644
index 000000000000..65d5ea00fc9d
--- /dev/null
+++ b/drivers/phy/ingenic/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-y		+= phy-ingenic-usb.o
diff --git a/drivers/phy/ingenic/phy-ingenic-usb.c b/drivers/phy/ingenic/phy-ingenic-usb.c
new file mode 100644
index 000000000000..4d1587d82286
--- /dev/null
+++ b/drivers/phy/ingenic/phy-ingenic-usb.c
@@ -0,0 +1,412 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Ingenic SoCs USB PHY driver
+ * Copyright (c) Paul Cercueil <paul@crapouillou.net>
+ * Copyright (c) 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
+ * Copyright (c) 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+/* OTGPHY register offsets */
+#define REG_USBPCR_OFFSET			0x00
+#define REG_USBRDT_OFFSET			0x04
+#define REG_USBVBFIL_OFFSET			0x08
+#define REG_USBPCR1_OFFSET			0x0c
+
+/* bits within the USBPCR register */
+#define USBPCR_USB_MODE				BIT(31)
+#define USBPCR_AVLD_REG				BIT(30)
+#define USBPCR_COMMONONN			BIT(25)
+#define USBPCR_VBUSVLDEXT			BIT(24)
+#define USBPCR_VBUSVLDEXTSEL		BIT(23)
+#define USBPCR_POR					BIT(22)
+#define USBPCR_SIDDQ				BIT(21)
+#define USBPCR_OTG_DISABLE			BIT(20)
+#define USBPCR_TXPREEMPHTUNE		BIT(6)
+
+#define USBPCR_IDPULLUP_MASK		GENMASK(29, 28)
+#define USBPCR_IDPULLUP_ALWAYS		0x2
+#define USBPCR_IDPULLUP_SUSPEND		0x1
+#define USBPCR_IDPULLUP_OTG			0x0
+
+#define USBPCR_COMPDISTUNE_MASK		GENMASK(19, 17)
+#define USBPCR_COMPDISTUNE_DFT		0x4
+
+#define USBPCR_OTGTUNE_MASK			GENMASK(16, 14)
+#define USBPCR_OTGTUNE_DFT			0x4
+
+#define USBPCR_SQRXTUNE_MASK		GENMASK(13, 11)
+#define USBPCR_SQRXTUNE_DCR_20PCT	0x7
+#define USBPCR_SQRXTUNE_DFT			0x3
+
+#define USBPCR_TXFSLSTUNE_MASK		GENMASK(10, 7)
+#define USBPCR_TXFSLSTUNE_DCR_50PPT	0xf
+#define USBPCR_TXFSLSTUNE_DCR_25PPT	0x7
+#define USBPCR_TXFSLSTUNE_DFT		0x3
+#define USBPCR_TXFSLSTUNE_INC_25PPT	0x1
+#define USBPCR_TXFSLSTUNE_INC_50PPT	0x0
+
+#define USBPCR_TXHSXVTUNE_MASK		GENMASK(5, 4)
+#define USBPCR_TXHSXVTUNE_DFT		0x3
+#define USBPCR_TXHSXVTUNE_DCR_15MV	0x1
+
+#define USBPCR_TXRISETUNE_MASK		GENMASK(5, 4)
+#define USBPCR_TXRISETUNE_DFT		0x3
+
+#define USBPCR_TXVREFTUNE_MASK		GENMASK(3, 0)
+#define USBPCR_TXVREFTUNE_INC_75PPT	0xb
+#define USBPCR_TXVREFTUNE_INC_25PPT	0x7
+#define USBPCR_TXVREFTUNE_DFT		0x5
+
+/* bits within the USBRDTR register */
+#define USBRDT_UTMI_RST				BIT(27)
+#define USBRDT_HB_MASK				BIT(26)
+#define USBRDT_VBFIL_LD_EN			BIT(25)
+#define USBRDT_IDDIG_EN				BIT(24)
+#define USBRDT_IDDIG_REG			BIT(23)
+#define USBRDT_VBFIL_EN				BIT(2)
+
+/* bits within the USBPCR1 register */
+#define USBPCR1_BVLD_REG			BIT(31)
+#define USBPCR1_DPPD				BIT(29)
+#define USBPCR1_DMPD				BIT(28)
+#define USBPCR1_USB_SEL				BIT(28)
+#define USBPCR1_PORT_RST			BIT(21)
+#define USBPCR1_WORD_IF_16BIT		BIT(19)
+
+enum ingenic_usb_phy_version {
+	ID_JZ4770,
+	ID_JZ4775,
+	ID_JZ4780,
+	ID_X1000,
+	ID_X1830,
+	ID_X2000,
+};
+
+struct ingenic_soc_info {
+	enum ingenic_usb_phy_version version;
+
+	void (*usb_phy_init)(struct phy *phy);
+};
+
+struct ingenic_usb_phy {
+	const struct ingenic_soc_info *soc_info;
+
+	struct phy *phy;
+	void __iomem *base;
+	struct clk *clk;
+	struct regulator *vcc_supply;
+};
+
+static int ingenic_usb_phy_init(struct phy *phy)
+{
+	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
+	int err;
+	u32 reg;
+
+	err = clk_prepare_enable(priv->clk);
+	if (err) {
+		dev_err(&phy->dev, "Unable to start clock: %d\n", err);
+		return err;
+	}
+
+	priv->soc_info->usb_phy_init(phy);
+
+	/* Wait for PHY to reset */
+	usleep_range(30, 300);
+	reg = readl(priv->base + REG_USBPCR_OFFSET);
+	writel(reg & ~USBPCR_POR, priv->base + REG_USBPCR_OFFSET);
+	usleep_range(300, 1000);
+
+	return 0;
+}
+
+static int ingenic_usb_phy_exit(struct phy *phy)
+{
+	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(priv->clk);
+	regulator_disable(priv->vcc_supply);
+
+	return 0;
+}
+
+static int ingenic_usb_phy_power_on(struct phy *phy)
+{
+	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
+	int err;
+
+	err = regulator_enable(priv->vcc_supply);
+	if (err) {
+		dev_err(&phy->dev, "Unable to enable VCC: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int ingenic_usb_phy_power_off(struct phy *phy)
+{
+	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
+
+	regulator_disable(priv->vcc_supply);
+
+	return 0;
+}
+
+static int ingenic_usb_phy_set_mode(struct phy *phy,
+				  enum phy_mode mode, int submode)
+{
+	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
+	u32 reg;
+
+	switch (mode) {
+	case PHY_MODE_USB_HOST:
+		reg = readl(priv->base + REG_USBPCR_OFFSET);
+		u32p_replace_bits(&reg, 1, USBPCR_USB_MODE);
+		u32p_replace_bits(&reg, 0, USBPCR_VBUSVLDEXT);
+		u32p_replace_bits(&reg, 0, USBPCR_VBUSVLDEXTSEL);
+		u32p_replace_bits(&reg, 0, USBPCR_OTG_DISABLE);
+		writel(reg, priv->base + REG_USBPCR_OFFSET);
+
+		break;
+	case PHY_MODE_USB_DEVICE:
+		reg = readl(priv->base + REG_USBPCR_OFFSET);
+		u32p_replace_bits(&reg, 0, USBPCR_USB_MODE);
+		u32p_replace_bits(&reg, 1, USBPCR_VBUSVLDEXT);
+		u32p_replace_bits(&reg, 1, USBPCR_VBUSVLDEXTSEL);
+		u32p_replace_bits(&reg, 1, USBPCR_OTG_DISABLE);
+		writel(reg, priv->base + REG_USBPCR_OFFSET);
+
+		break;
+	case PHY_MODE_USB_OTG:
+		reg = readl(priv->base + REG_USBPCR_OFFSET);
+		u32p_replace_bits(&reg, 1, USBPCR_USB_MODE);
+		u32p_replace_bits(&reg, 1, USBPCR_VBUSVLDEXT);
+		u32p_replace_bits(&reg, 1, USBPCR_VBUSVLDEXTSEL);
+		u32p_replace_bits(&reg, 0, USBPCR_OTG_DISABLE);
+		writel(reg, priv->base + REG_USBPCR_OFFSET);
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct phy_ops ingenic_usb_phy_ops = {
+	.init		= ingenic_usb_phy_init,
+	.exit		= ingenic_usb_phy_exit,
+	.power_on	= ingenic_usb_phy_power_on,
+	.power_off	= ingenic_usb_phy_power_off,
+	.set_mode	= ingenic_usb_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static void jz4770_usb_phy_init(struct phy *phy)
+{
+	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
+	u32 reg;
+
+	reg = USBPCR_AVLD_REG | USBPCR_COMMONONN | USBPCR_POR |
+		FIELD_PREP(USBPCR_IDPULLUP_MASK, USBPCR_IDPULLUP_ALWAYS) |
+		FIELD_PREP(USBPCR_COMPDISTUNE_MASK, USBPCR_COMPDISTUNE_DFT) |
+		FIELD_PREP(USBPCR_OTGTUNE_MASK, USBPCR_OTGTUNE_DFT) |
+		FIELD_PREP(USBPCR_SQRXTUNE_MASK, USBPCR_SQRXTUNE_DFT) |
+		FIELD_PREP(USBPCR_TXFSLSTUNE_MASK, USBPCR_TXFSLSTUNE_DFT) |
+		FIELD_PREP(USBPCR_TXRISETUNE_MASK, USBPCR_TXRISETUNE_DFT) |
+		FIELD_PREP(USBPCR_TXVREFTUNE_MASK, USBPCR_TXVREFTUNE_DFT);
+	writel(reg, priv->base + REG_USBPCR_OFFSET);
+}
+
+static void jz4775_usb_phy_init(struct phy *phy)
+{
+	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
+	u32 reg;
+
+	reg = readl(priv->base + REG_USBPCR1_OFFSET) | USBPCR1_USB_SEL |
+		USBPCR1_WORD_IF_16BIT;
+	writel(reg, priv->base + REG_USBPCR1_OFFSET);
+
+	reg = USBPCR_COMMONONN | USBPCR_POR |
+		FIELD_PREP(USBPCR_TXVREFTUNE_MASK, USBPCR_TXVREFTUNE_INC_75PPT);
+	writel(reg, priv->base + REG_USBPCR_OFFSET);
+}
+
+static void jz4780_usb_phy_init(struct phy *phy)
+{
+	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
+	u32 reg;
+
+	reg = readl(priv->base + REG_USBPCR1_OFFSET) | USBPCR1_USB_SEL |
+		USBPCR1_WORD_IF_16BIT;
+	writel(reg, priv->base + REG_USBPCR1_OFFSET);
+
+	reg = USBPCR_TXPREEMPHTUNE | USBPCR_COMMONONN | USBPCR_POR;
+	writel(reg, priv->base + REG_USBPCR_OFFSET);
+}
+
+static void x1000_usb_phy_init(struct phy *phy)
+{
+	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
+	u32 reg;
+
+	reg = readl(priv->base + REG_USBPCR1_OFFSET) | USBPCR1_WORD_IF_16BIT;
+	writel(reg, priv->base + REG_USBPCR1_OFFSET);
+
+	reg = USBPCR_TXPREEMPHTUNE | USBPCR_COMMONONN | USBPCR_POR |
+		FIELD_PREP(USBPCR_SQRXTUNE_MASK, USBPCR_SQRXTUNE_DCR_20PCT) |
+		FIELD_PREP(USBPCR_TXHSXVTUNE_MASK, USBPCR_TXHSXVTUNE_DCR_15MV) |
+		FIELD_PREP(USBPCR_TXVREFTUNE_MASK, USBPCR_TXVREFTUNE_INC_25PPT);
+	writel(reg, priv->base + REG_USBPCR_OFFSET);
+}
+
+static void x1830_usb_phy_init(struct phy *phy)
+{
+	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
+	u32 reg;
+
+	/* rdt */
+	writel(USBRDT_VBFIL_EN | USBRDT_UTMI_RST, priv->base + REG_USBRDT_OFFSET);
+
+	reg = readl(priv->base + REG_USBPCR1_OFFSET) | USBPCR1_WORD_IF_16BIT |
+		USBPCR1_DMPD | USBPCR1_DPPD;
+	writel(reg, priv->base + REG_USBPCR1_OFFSET);
+
+	reg = USBPCR_VBUSVLDEXT | USBPCR_TXPREEMPHTUNE | USBPCR_COMMONONN | USBPCR_POR |
+		FIELD_PREP(USBPCR_IDPULLUP_MASK, USBPCR_IDPULLUP_OTG);
+	writel(reg, priv->base + REG_USBPCR_OFFSET);
+}
+
+static void x2000_usb_phy_init(struct phy *phy)
+{
+	struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
+	u32 reg;
+
+	reg = readl(priv->base + REG_USBPCR1_OFFSET) | USBPCR1_DPPD | USBPCR1_DMPD;
+	writel(reg & ~USBPCR1_PORT_RST, priv->base + REG_USBPCR1_OFFSET);
+
+	reg = USBPCR_POR | FIELD_PREP(USBPCR_IDPULLUP_MASK, USBPCR_IDPULLUP_OTG);
+	writel(reg, priv->base + REG_USBPCR_OFFSET);
+}
+
+static const struct ingenic_soc_info jz4770_soc_info = {
+	.version = ID_JZ4770,
+
+	.usb_phy_init = jz4770_usb_phy_init,
+};
+
+static const struct ingenic_soc_info jz4775_soc_info = {
+	.version = ID_JZ4775,
+
+	.usb_phy_init = jz4775_usb_phy_init,
+};
+
+static const struct ingenic_soc_info jz4780_soc_info = {
+	.version = ID_JZ4780,
+
+	.usb_phy_init = jz4780_usb_phy_init,
+};
+
+static const struct ingenic_soc_info x1000_soc_info = {
+	.version = ID_X1000,
+
+	.usb_phy_init = x1000_usb_phy_init,
+};
+
+static const struct ingenic_soc_info x1830_soc_info = {
+	.version = ID_X1830,
+
+	.usb_phy_init = x1830_usb_phy_init,
+};
+
+static const struct ingenic_soc_info x2000_soc_info = {
+	.version = ID_X2000,
+
+	.usb_phy_init = x2000_usb_phy_init,
+};
+
+static int ingenic_usb_phy_probe(struct platform_device *pdev)
+{
+	struct ingenic_usb_phy *priv;
+	struct phy_provider *provider;
+	struct device *dev = &pdev->dev;
+	int err;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->soc_info = device_get_match_data(dev);
+	if (!priv->soc_info) {
+		dev_err(dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base)) {
+		dev_err(dev, "Failed to map registers\n");
+		return PTR_ERR(priv->base);
+	}
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		err = PTR_ERR(priv->clk);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get clock\n");
+		return err;
+	}
+
+	priv->vcc_supply = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(priv->vcc_supply)) {
+		err = PTR_ERR(priv->vcc_supply);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get regulator\n");
+		return err;
+	}
+
+	priv->phy = devm_phy_create(dev, NULL, &ingenic_usb_phy_ops);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	phy_set_drvdata(priv->phy, priv);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(provider);
+}
+
+static const struct of_device_id ingenic_usb_phy_of_matches[] = {
+	{ .compatible = "ingenic,jz4770-phy", .data = &jz4770_soc_info },
+	{ .compatible = "ingenic,jz4775-phy", .data = &jz4775_soc_info },
+	{ .compatible = "ingenic,jz4780-phy", .data = &jz4780_soc_info },
+	{ .compatible = "ingenic,x1000-phy", .data = &x1000_soc_info },
+	{ .compatible = "ingenic,x1830-phy", .data = &x1830_soc_info },
+	{ .compatible = "ingenic,x2000-phy", .data = &x2000_soc_info },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ingenic_usb_phy_of_matches);
+
+static struct platform_driver ingenic_usb_phy_driver = {
+	.probe		= ingenic_usb_phy_probe,
+	.driver		= {
+		.name	= "ingenic-usb-phy",
+		.of_match_table = ingenic_usb_phy_of_matches,
+	},
+};
+module_platform_driver(ingenic_usb_phy_driver);
+
+MODULE_AUTHOR("周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>");
+MODULE_AUTHOR("漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>");
+MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
+MODULE_DESCRIPTION("Ingenic SoCs USB PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.11.0

