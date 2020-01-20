Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB4D21421BC
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 03:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgATC6f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 21:58:35 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:50849 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729080AbgATC6e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jan 2020 21:58:34 -0500
Received: from droid10.amlogic.com (10.18.11.213) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Mon, 20 Jan 2020
 10:58:56 +0800
From:   Hanjie Lin <hanjie.lin@amlogic.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>
CC:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: [PATCH v7 3/5] phy: amlogic: Add Amlogic A1 USB2 PHY Driver
Date:   Mon, 20 Jan 2020 10:58:04 +0800
Message-ID: <1579489086-157767-4-git-send-email-hanjie.lin@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579489086-157767-1-git-send-email-hanjie.lin@amlogic.com>
References: <1579489086-157767-1-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.18.11.213]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds support for the USB2 PHY found in the Amlogic A1 SoC Family.

It supports host mode only.

Signed-off-by: Yue Wang <yue.wang@amlogic.com>
Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/phy/amlogic/phy-meson-g12a-usb2.c | 85 +++++++++++++++++++++----------
 1 file changed, 59 insertions(+), 26 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index 9065ffc..33296f8 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -146,11 +146,17 @@
 #define RESET_COMPLETE_TIME					1000
 #define PLL_RESET_COMPLETE_TIME					100
 
+enum meson_soc_id {
+	MESON_SOC_G12A  = 0,
+	MESON_SOC_A1,
+};
+
 struct phy_meson_g12a_usb2_priv {
 	struct device		*dev;
 	struct regmap		*regmap;
 	struct clk		*clk;
 	struct reset_control	*reset;
+	int                     soc_id;
 };
 
 static const struct regmap_config phy_meson_g12a_usb2_regmap_conf = {
@@ -164,6 +170,7 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 {
 	struct phy_meson_g12a_usb2_priv *priv = phy_get_drvdata(phy);
 	int ret;
+	unsigned int value;
 
 	ret = reset_control_reset(priv->reset);
 	if (ret)
@@ -192,18 +199,22 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 		     FIELD_PREP(PHY_CTRL_R17_MPLL_FILTER_PVT2, 2) |
 		     FIELD_PREP(PHY_CTRL_R17_MPLL_FILTER_PVT1, 9));
 
-	regmap_write(priv->regmap, PHY_CTRL_R18,
-		     FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
-		     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
-		     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
-		     FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
-		     FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
-		     FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
-		     FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
-		     FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
-		     FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
-		     FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
-		     PHY_CTRL_R18_MPLL_ACG_RANGE);
+	value = FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
+		FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
+		FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
+		FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
+		FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
+		FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
+		FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
+		FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
+		FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
+		FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
+		PHY_CTRL_R18_MPLL_ACG_RANGE;
+
+	if (priv->soc_id == MESON_SOC_A1)
+		value |= PHY_CTRL_R18_MPLL_DCO_CLK_SEL;
+
+	regmap_write(priv->regmap, PHY_CTRL_R18, value);
 
 	udelay(PLL_RESET_COMPLETE_TIME);
 
@@ -227,13 +238,24 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_VREF_4_0, 0) |
 		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_DBG_1_0, 0));
 
-	regmap_write(priv->regmap, PHY_CTRL_R4,
-		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_7_0, 0xf) |
-		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_15_8, 0xf) |
-		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_23_16, 0xf) |
-		     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
-		     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
-		     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
+	if (priv->soc_id == MESON_SOC_G12A)
+		regmap_write(priv->regmap, PHY_CTRL_R4,
+			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_7_0, 0xf) |
+			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_15_8, 0xf) |
+			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_23_16, 0xf) |
+			     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
+			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
+			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
+	else if (priv->soc_id == MESON_SOC_A1) {
+		regmap_write(priv->regmap, PHY_CTRL_R21,
+			     PHY_CTRL_R21_USB2_CAL_ACK_EN |
+			     PHY_CTRL_R21_USB2_TX_STRG_PD |
+			     FIELD_PREP(PHY_CTRL_R21_USB2_OTG_ACA_TRIM_1_0, 2));
+
+		/* Analog Settings */
+		regmap_write(priv->regmap, PHY_CTRL_R13,
+			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
+	}
 
 	/* Tuning Disconnect Threshold */
 	regmap_write(priv->regmap, PHY_CTRL_R3,
@@ -241,11 +263,13 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 		     FIELD_PREP(PHY_CTRL_R3_HSDIC_REF, 1) |
 		     FIELD_PREP(PHY_CTRL_R3_DISC_THRESH, 3));
 
-	/* Analog Settings */
-	regmap_write(priv->regmap, PHY_CTRL_R14, 0);
-	regmap_write(priv->regmap, PHY_CTRL_R13,
-		     PHY_CTRL_R13_UPDATE_PMA_SIGNALS |
-		     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
+	if (priv->soc_id == MESON_SOC_G12A) {
+		/* Analog Settings */
+		regmap_write(priv->regmap, PHY_CTRL_R14, 0);
+		regmap_write(priv->regmap, PHY_CTRL_R13,
+			     PHY_CTRL_R13_UPDATE_PMA_SIGNALS |
+			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
+	}
 
 	return 0;
 }
@@ -286,6 +310,8 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	priv->soc_id = (enum meson_soc_id)of_device_get_match_data(&pdev->dev);
+
 	priv->regmap = devm_regmap_init_mmio(dev, base,
 					     &phy_meson_g12a_usb2_regmap_conf);
 	if (IS_ERR(priv->regmap))
@@ -321,8 +347,15 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_meson_g12a_usb2_of_match[] = {
-	{ .compatible = "amlogic,g12a-usb2-phy", },
-	{ },
+	{
+		.compatible = "amlogic,g12a-usb2-phy",
+		.data = (void *)MESON_SOC_G12A,
+	},
+	{
+		.compatible = "amlogic,a1-usb2-phy",
+		.data = (void *)MESON_SOC_A1,
+	},
+	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, phy_meson_g12a_usb2_of_match);
 
-- 
2.7.4

