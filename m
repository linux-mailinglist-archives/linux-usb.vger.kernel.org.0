Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4430022A8A1
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 08:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgGWGOK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 02:14:10 -0400
Received: from out28-169.mail.aliyun.com ([115.124.28.169]:53073 "EHLO
        out28-169.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbgGWGOD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 02:14:03 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00883257-0.000119466-0.991048;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03268;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.I6H78tB_1595484804;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I6H78tB_1595484804)
          by smtp.aliyun-inc.com(10.147.40.7);
          Thu, 23 Jul 2020 14:13:54 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v5 3/4] USB: PHY: JZ4770: Add support for new Ingenic SoCs.
Date:   Thu, 23 Jul 2020 14:13:00 +0800
Message-Id: <20200723061301.82583-4-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200723061301.82583-1-zhouyanjie@wanyeetech.com>
References: <20200723061301.82583-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for probing the phy-jz4770 driver on the JZ4780 SoC,
the X1000 SoC and the X1830 SoC from Ingenic.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Co-developed-by: 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
Signed-off-by: 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    Add bindings for the JZ4780 SoC.
    
    v2->v3:
    Use "of_device_get_match_data" instead "of_match_device"
    to get version information.
    
    v3->v4:
    Fix typos.
    
    v4->v5:
    1.Modify the help message, make it more future-proof.
    2.Drop the unnecessary comment about hardware reset.
    3.Create 'soc_info' structures instead having ID_* as platform data.

 drivers/usb/phy/Kconfig      |   4 +-
 drivers/usb/phy/phy-jz4770.c | 192 ++++++++++++++++++++++++++++++++++++-------
 2 files changed, 163 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 4b3fa78995cf..ef4787cd3d37 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -185,11 +185,11 @@ config USB_ULPI_VIEWPORT
 	  controllers with a viewport register (e.g. Chipidea/ARC controllers).
 
 config JZ4770_PHY
-	tristate "Ingenic JZ4770 Transceiver Driver"
+	tristate "Ingenic SoCs Transceiver Driver"
 	depends on MIPS || COMPILE_TEST
 	select USB_PHY
 	help
 	  This driver provides PHY support for the USB controller found
-	  on the JZ4770 SoC from Ingenic.
+	  on the JZ-series and X-series SoCs from Ingenic.
 
 endmenu
diff --git a/drivers/usb/phy/phy-jz4770.c b/drivers/usb/phy/phy-jz4770.c
index 00209d5469d3..5c6e5cbb6f30 100644
--- a/drivers/usb/phy/phy-jz4770.c
+++ b/drivers/usb/phy/phy-jz4770.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Ingenic JZ4770 USB PHY driver
+ * Ingenic SoCs USB PHY driver
  * Copyright (c) Paul Cercueil <paul@crapouillou.net>
+ * Copyright (c) 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
+ * Copyright (c) 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
  */
 
 #include <linux/clk.h>
@@ -12,12 +14,13 @@
 #include <linux/usb/otg.h>
 #include <linux/usb/phy.h>
 
+/* OTGPHY register offsets */
 #define REG_USBPCR_OFFSET	0x00
 #define REG_USBRDT_OFFSET	0x04
 #define REG_USBVBFIL_OFFSET	0x08
 #define REG_USBPCR1_OFFSET	0x0c
 
-/* USBPCR */
+/* bits within the USBPCR register */
 #define USBPCR_USB_MODE		BIT(31)
 #define USBPCR_AVLD_REG		BIT(30)
 #define USBPCR_COMMONONN	BIT(25)
@@ -44,11 +47,21 @@
 
 #define USBPCR_SQRXTUNE_LSB	11
 #define USBPCR_SQRXTUNE_MASK	GENMASK(13, USBPCR_SQRXTUNE_LSB)
+#define USBPCR_SQRXTUNE_DCR_20PCT	(0x7 << USBPCR_SQRXTUNE_LSB)
 #define USBPCR_SQRXTUNE_DFT	(0x3 << USBPCR_SQRXTUNE_LSB)
 
 #define USBPCR_TXFSLSTUNE_LSB	7
 #define USBPCR_TXFSLSTUNE_MASK	GENMASK(10, USBPCR_TXFSLSTUNE_LSB)
+#define USBPCR_TXFSLSTUNE_DCR_50PPT	(0xf << USBPCR_TXFSLSTUNE_LSB)
+#define USBPCR_TXFSLSTUNE_DCR_25PPT	(0x7 << USBPCR_TXFSLSTUNE_LSB)
 #define USBPCR_TXFSLSTUNE_DFT	(0x3 << USBPCR_TXFSLSTUNE_LSB)
+#define USBPCR_TXFSLSTUNE_INC_25PPT	(0x1 << USBPCR_TXFSLSTUNE_LSB)
+#define USBPCR_TXFSLSTUNE_INC_50PPT	(0x0 << USBPCR_TXFSLSTUNE_LSB)
+
+#define USBPCR_TXHSXVTUNE_LSB		4
+#define USBPCR_TXHSXVTUNE_MASK		GENMASK(5, USBPCR_TXHSXVTUNE_LSB)
+#define USBPCR_TXHSXVTUNE_DFT		(0x3 << USBPCR_TXHSXVTUNE_LSB)
+#define USBPCR_TXHSXVTUNE_DCR_15MV	(0x1 << USBPCR_TXHSXVTUNE_LSB)
 
 #define USBPCR_TXRISETUNE_LSB	4
 #define USBPCR_TXRISETUNE_MASK	GENMASK(5, USBPCR_TXRISETUNE_LSB)
@@ -56,14 +69,40 @@
 
 #define USBPCR_TXVREFTUNE_LSB	0
 #define USBPCR_TXVREFTUNE_MASK	GENMASK(3, USBPCR_TXVREFTUNE_LSB)
+#define USBPCR_TXVREFTUNE_INC_25PPT	(0x7 << USBPCR_TXVREFTUNE_LSB)
 #define USBPCR_TXVREFTUNE_DFT	(0x5 << USBPCR_TXVREFTUNE_LSB)
 
-/* USBRDT */
+/* bits within the USBRDTR register */
+#define USBRDT_UTMI_RST				BIT(27)
+#define USBRDT_HB_MASK				BIT(26)
 #define USBRDT_VBFIL_LD_EN	BIT(25)
 #define USBRDT_IDDIG_EN		BIT(24)
 #define USBRDT_IDDIG_REG	BIT(23)
+#define USBRDT_VBFIL_EN				BIT(2)
+
+/* bits within the USBPCR1 register */
+#define USBPCR1_BVLD_REG			BIT(31)
+#define USBPCR1_DPPD				BIT(29)
+#define USBPCR1_DMPD				BIT(28)
+#define USBPCR1_USB_SEL				BIT(28)
+#define USBPCR1_WORD_IF_16BIT		BIT(19)
+
+enum ingenic_usb_phy_version {
+	ID_JZ4770,
+	ID_JZ4780,
+	ID_X1000,
+	ID_X1830,
+};
+
+struct ingenic_soc_info {
+	enum ingenic_usb_phy_version version;
+
+	void (*usb_phy_init)(struct usb_phy *phy);
+};
 
 struct jz4770_phy {
+	const struct ingenic_soc_info *soc_info;
+
 	struct usb_phy phy;
 	struct usb_otg otg;
 	struct device *dev;
@@ -82,12 +121,18 @@ static inline struct jz4770_phy *phy_to_jz4770_phy(struct usb_phy *phy)
 	return container_of(phy, struct jz4770_phy, phy);
 }
 
-static int jz4770_phy_set_peripheral(struct usb_otg *otg,
+static int ingenic_usb_phy_set_peripheral(struct usb_otg *otg,
 				     struct usb_gadget *gadget)
 {
 	struct jz4770_phy *priv = otg_to_jz4770_phy(otg);
 	u32 reg;
 
+	if (priv->soc_info->version >= ID_X1000) {
+		reg = readl(priv->base + REG_USBPCR1_OFFSET);
+		reg |= USBPCR1_BVLD_REG;
+		writel(reg, priv->base + REG_USBPCR1_OFFSET);
+	}
+
 	reg = readl(priv->base + REG_USBPCR_OFFSET);
 	reg &= ~USBPCR_USB_MODE;
 	reg |= USBPCR_VBUSVLDEXT | USBPCR_VBUSVLDEXTSEL | USBPCR_OTG_DISABLE;
@@ -96,7 +141,7 @@ static int jz4770_phy_set_peripheral(struct usb_otg *otg,
 	return 0;
 }
 
-static int jz4770_phy_set_host(struct usb_otg *otg, struct usb_bus *host)
+static int ingenic_usb_phy_set_host(struct usb_otg *otg, struct usb_bus *host)
 {
 	struct jz4770_phy *priv = otg_to_jz4770_phy(otg);
 	u32 reg;
@@ -109,7 +154,7 @@ static int jz4770_phy_set_host(struct usb_otg *otg, struct usb_bus *host)
 	return 0;
 }
 
-static int jz4770_phy_init(struct usb_phy *phy)
+static int ingenic_usb_phy_init(struct usb_phy *phy)
 {
 	struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
 	int err;
@@ -127,11 +172,7 @@ static int jz4770_phy_init(struct usb_phy *phy)
 		return err;
 	}
 
-	reg = USBPCR_AVLD_REG | USBPCR_COMMONONN | USBPCR_IDPULLUP_ALWAYS |
-		USBPCR_COMPDISTUNE_DFT | USBPCR_OTGTUNE_DFT | USBPCR_SQRXTUNE_DFT |
-		USBPCR_TXFSLSTUNE_DFT | USBPCR_TXRISETUNE_DFT | USBPCR_TXVREFTUNE_DFT |
-		USBPCR_POR;
-	writel(reg, priv->base + REG_USBPCR_OFFSET);
+	priv->soc_info->usb_phy_init(phy);
 
 	/* Wait for PHY to reset */
 	usleep_range(30, 300);
@@ -141,7 +182,7 @@ static int jz4770_phy_init(struct usb_phy *phy)
 	return 0;
 }
 
-static void jz4770_phy_shutdown(struct usb_phy *phy)
+static void ingenic_usb_phy_shutdown(struct usb_phy *phy)
 {
 	struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
 
@@ -149,11 +190,100 @@ static void jz4770_phy_shutdown(struct usb_phy *phy)
 	regulator_disable(priv->vcc_supply);
 }
 
-static void jz4770_phy_remove(void *phy)
+static void ingenic_usb_phy_remove(void *phy)
 {
 	usb_remove_phy(phy);
 }
 
+static void jz4770_usb_phy_init(struct usb_phy *phy)
+{
+	struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
+	u32 reg;
+
+	reg = USBPCR_AVLD_REG | USBPCR_COMMONONN | USBPCR_IDPULLUP_ALWAYS |
+		USBPCR_COMPDISTUNE_DFT | USBPCR_OTGTUNE_DFT | USBPCR_SQRXTUNE_DFT |
+		USBPCR_TXFSLSTUNE_DFT | USBPCR_TXRISETUNE_DFT | USBPCR_TXVREFTUNE_DFT |
+		USBPCR_POR;
+	writel(reg, priv->base + REG_USBPCR_OFFSET);
+}
+
+static void jz4780_usb_phy_init(struct usb_phy *phy)
+{
+	struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
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
+static void x1000_usb_phy_init(struct usb_phy *phy)
+{
+	struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
+	u32 reg;
+
+	reg = readl(priv->base + REG_USBPCR1_OFFSET) | USBPCR1_WORD_IF_16BIT;
+	writel(reg, priv->base + REG_USBPCR1_OFFSET);
+
+	reg = USBPCR_SQRXTUNE_DCR_20PCT | USBPCR_TXPREEMPHTUNE |
+		USBPCR_TXHSXVTUNE_DCR_15MV | USBPCR_TXVREFTUNE_INC_25PPT |
+		USBPCR_COMMONONN | USBPCR_POR;
+	writel(reg, priv->base + REG_USBPCR_OFFSET);
+}
+
+static void x1830_usb_phy_init(struct usb_phy *phy)
+{
+	struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
+	u32 reg;
+
+	/* rdt */
+	writel(USBRDT_VBFIL_EN | USBRDT_UTMI_RST, priv->base + REG_USBRDT_OFFSET);
+
+	reg = readl(priv->base + REG_USBPCR1_OFFSET) | USBPCR1_WORD_IF_16BIT |
+		USBPCR1_DMPD | USBPCR1_DPPD;
+	writel(reg, priv->base + REG_USBPCR1_OFFSET);
+
+	reg = USBPCR_IDPULLUP_OTG | USBPCR_VBUSVLDEXT |	USBPCR_TXPREEMPHTUNE |
+		USBPCR_COMMONONN | USBPCR_POR;
+	writel(reg, priv->base + REG_USBPCR_OFFSET);
+}
+
+static const struct ingenic_soc_info jz4770_soc_info = {
+	.version = ID_JZ4770,
+
+	.usb_phy_init = jz4770_usb_phy_init,
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
+static const struct of_device_id ingenic_usb_phy_of_matches[] = {
+	{ .compatible = "ingenic,jz4770-phy", .data = &jz4770_soc_info },
+	{ .compatible = "ingenic,jz4780-phy", .data = &jz4780_soc_info },
+	{ .compatible = "ingenic,x1000-phy", .data = &x1000_soc_info },
+	{ .compatible = "ingenic,x1830-phy", .data = &x1830_soc_info },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ingenic_usb_phy_of_matches);
+
 static int jz4770_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -164,18 +294,24 @@ static int jz4770_phy_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->soc_info = device_get_match_data(&pdev->dev);
+	if (!priv->soc_info) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+
 	platform_set_drvdata(pdev, priv);
 	priv->dev = dev;
 	priv->phy.dev = dev;
 	priv->phy.otg = &priv->otg;
-	priv->phy.label = "jz4770-phy";
-	priv->phy.init = jz4770_phy_init;
-	priv->phy.shutdown = jz4770_phy_shutdown;
+	priv->phy.label = "ingenic-usb-phy";
+	priv->phy.init = ingenic_usb_phy_init;
+	priv->phy.shutdown = ingenic_usb_phy_shutdown;
 
 	priv->otg.state = OTG_STATE_UNDEFINED;
 	priv->otg.usb_phy = &priv->phy;
-	priv->otg.set_host = jz4770_phy_set_host;
-	priv->otg.set_peripheral = jz4770_phy_set_peripheral;
+	priv->otg.set_host = ingenic_usb_phy_set_host;
+	priv->otg.set_peripheral = ingenic_usb_phy_set_peripheral;
 
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base)) {
@@ -206,26 +342,20 @@ static int jz4770_phy_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	return devm_add_action_or_reset(dev, jz4770_phy_remove, &priv->phy);
+	return devm_add_action_or_reset(dev, ingenic_usb_phy_remove, &priv->phy);
 }
 
-#ifdef CONFIG_OF
-static const struct of_device_id jz4770_phy_of_matches[] = {
-	{ .compatible = "ingenic,jz4770-phy" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, jz4770_phy_of_matches);
-#endif
-
-static struct platform_driver jz4770_phy_driver = {
+static struct platform_driver ingenic_phy_driver = {
 	.probe		= jz4770_phy_probe,
 	.driver		= {
 		.name	= "jz4770-phy",
-		.of_match_table = of_match_ptr(jz4770_phy_of_matches),
+		.of_match_table = of_match_ptr(ingenic_usb_phy_of_matches),
 	},
 };
-module_platform_driver(jz4770_phy_driver);
+module_platform_driver(ingenic_phy_driver);
 
+MODULE_AUTHOR("周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>");
+MODULE_AUTHOR("漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>");
 MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
-MODULE_DESCRIPTION("Ingenic JZ4770 USB PHY driver");
+MODULE_DESCRIPTION("Ingenic SoCs USB PHY driver");
 MODULE_LICENSE("GPL");
-- 
2.11.0

