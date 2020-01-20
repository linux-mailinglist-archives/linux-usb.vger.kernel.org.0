Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2D601421BE
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 03:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729093AbgATC6g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 21:58:36 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:50849 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729081AbgATC6g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jan 2020 21:58:36 -0500
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
Subject: [PATCH v7 4/5] usb: dwc3: Add Amlogic A1 DWC3 glue
Date:   Mon, 20 Jan 2020 10:58:05 +0800
Message-ID: <1579489086-157767-5-git-send-email-hanjie.lin@amlogic.com>
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

Adds support for Amlogic A1 USB Control Glue HW.

The Amlogic A1 SoC Family embeds 1 USB Controllers:
- a DWC3 IP configured as Host for USB2 and USB3

A glue connects the controllers to the USB2 PHY of A1 SoC.

Signed-off-by: Yue Wang <yue.wang@amlogic.com>
Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 172 +++++++++++++++++++++++++------------
 1 file changed, 116 insertions(+), 56 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 8a3ec1a..70d24b9 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -107,10 +107,37 @@ static const char *phy_names[PHY_COUNT] = {
 	"usb2-phy0", "usb2-phy1", "usb3-phy0",
 };
 
+static struct clk_bulk_data meson_g12a_clocks[] = {
+	{ .id = NULL },
+};
+
+static struct clk_bulk_data meson_a1_clocks[] = {
+	{ .id = "usb_ctrl" },
+	{ .id = "usb_bus" },
+	{ .id = "xtal_usb_ctrl" },
+};
+
+struct dwc3_meson_g12a_drvdata {
+	bool otg_switch_supported;
+	struct clk_bulk_data *clks;
+	int num_clks;
+};
+
+static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
+	.otg_switch_supported = true,
+	.clks = meson_g12a_clocks,
+	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
+};
+
+static struct dwc3_meson_g12a_drvdata a1_drvdata = {
+	.otg_switch_supported = false,
+	.clks = meson_a1_clocks,
+	.num_clks = ARRAY_SIZE(meson_a1_clocks),
+};
+
 struct dwc3_meson_g12a {
 	struct device		*dev;
 	struct regmap		*regmap;
-	struct clk		*clk;
 	struct reset_control	*reset;
 	struct phy		*phys[PHY_COUNT];
 	enum usb_dr_mode	otg_mode;
@@ -120,6 +147,7 @@ struct dwc3_meson_g12a {
 	struct regulator	*vbus;
 	struct usb_role_switch_desc switch_desc;
 	struct usb_role_switch	*role_switch;
+	const struct dwc3_meson_g12a_drvdata *drvdata;
 };
 
 static void dwc3_meson_g12a_usb2_set_mode(struct dwc3_meson_g12a *priv,
@@ -151,7 +179,7 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
 				   U2P_R0_POWER_ON_RESET,
 				   U2P_R0_POWER_ON_RESET);
 
-		if (i == USB2_OTG_PHY) {
+		if (priv->drvdata->otg_switch_supported && i == USB2_OTG_PHY) {
 			regmap_update_bits(priv->regmap,
 				U2P_R0 + (U2P_REG_SIZE * i),
 				U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS,
@@ -295,7 +323,7 @@ static int dwc3_meson_g12a_otg_mode_set(struct dwc3_meson_g12a *priv,
 {
 	int ret;
 
-	if (!priv->phys[USB2_OTG_PHY])
+	if (!priv->drvdata->otg_switch_supported || !priv->phys[USB2_OTG_PHY])
 		return -EINVAL;
 
 	if (mode == PHY_MODE_USB_HOST)
@@ -380,14 +408,60 @@ static struct device *dwc3_meson_g12_find_child(struct device *dev,
 	return &pdev->dev;
 }
 
+static int dwc3_meson_g12a_otg_init(struct platform_device *pdev,
+				    struct dwc3_meson_g12a *priv)
+{
+	enum phy_mode otg_id;
+	int ret, irq;
+	struct device *dev = &pdev->dev;
+
+	if (!priv->drvdata->otg_switch_supported)
+		return 0;
+
+	if (priv->otg_mode == USB_DR_MODE_OTG) {
+		/* Ack irq before registering */
+		regmap_update_bits(priv->regmap, USB_R5,
+				   USB_R5_ID_DIG_IRQ, 0);
+
+		irq = platform_get_irq(pdev, 0);
+		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+						dwc3_meson_g12a_irq_thread,
+						IRQF_ONESHOT, pdev->name, priv);
+		if (ret)
+			return ret;
+	}
+
+	/* Setup OTG mode corresponding to the ID pin */
+	if (priv->otg_mode == USB_DR_MODE_OTG) {
+		otg_id = dwc3_meson_g12a_get_id(priv);
+		if (otg_id != priv->otg_phy_mode) {
+			if (dwc3_meson_g12a_otg_mode_set(priv, otg_id))
+				dev_warn(dev, "Failed to switch OTG mode\n");
+		}
+	}
+
+	/* Setup role switcher */
+	priv->switch_desc.usb2_port = dwc3_meson_g12_find_child(dev,
+								"snps,dwc3");
+	priv->switch_desc.udc = dwc3_meson_g12_find_child(dev, "snps,dwc2");
+	priv->switch_desc.allow_userspace_control = true;
+	priv->switch_desc.set = dwc3_meson_g12a_role_set;
+	priv->switch_desc.get = dwc3_meson_g12a_role_get;
+
+	priv->role_switch = usb_role_switch_register(dev, &priv->switch_desc);
+	if (IS_ERR(priv->role_switch))
+		dev_warn(dev, "Unable to register Role Switch\n");
+
+	return ret;
+}
+
 static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 {
 	struct dwc3_meson_g12a	*priv;
 	struct device		*dev = &pdev->dev;
 	struct device_node	*np = dev->of_node;
 	void __iomem *base;
-	enum phy_mode otg_id;
-	int ret, i, irq;
+	int ret, i;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -409,17 +483,18 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 		priv->vbus = NULL;
 	}
 
-	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
+	priv->drvdata = of_device_get_match_data(&pdev->dev);
 
-	ret = clk_prepare_enable(priv->clk);
+	ret = devm_clk_bulk_get(dev,
+				priv->drvdata->num_clks,
+				priv->drvdata->clks);
 	if (ret)
 		return ret;
 
-	devm_add_action_or_reset(dev,
-				 (void(*)(void *))clk_disable_unprepare,
-				 priv->clk);
+	ret = clk_bulk_prepare_enable(priv->drvdata->num_clks,
+				      priv->drvdata->clks);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, priv);
 	priv->dev = dev;
@@ -433,41 +508,28 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	ret = reset_control_reset(priv->reset);
 	if (ret)
-		return ret;
+		goto err_disable_clks;
 
 	ret = dwc3_meson_g12a_get_phys(priv);
 	if (ret)
-		return ret;
+		goto err_disable_clks;
 
 	if (priv->vbus) {
 		ret = regulator_enable(priv->vbus);
 		if (ret)
-			return ret;
+			goto err_disable_clks;
 	}
 
 	/* Get dr_mode */
 	priv->otg_mode = usb_get_dr_mode(dev);
 
-	if (priv->otg_mode == USB_DR_MODE_OTG) {
-		/* Ack irq before registering */
-		regmap_update_bits(priv->regmap, USB_R5,
-				   USB_R5_ID_DIG_IRQ, 0);
-
-		irq = platform_get_irq(pdev, 0);
-		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-						dwc3_meson_g12a_irq_thread,
-						IRQF_ONESHOT, pdev->name, priv);
-		if (ret)
-			return ret;
-	}
-
 	dwc3_meson_g12a_usb_init(priv);
 
 	/* Init PHYs */
 	for (i = 0 ; i < PHY_COUNT ; ++i) {
 		ret = phy_init(priv->phys[i]);
 		if (ret)
-			return ret;
+			goto err_disable_clks;
 	}
 
 	/* Set PHY Power */
@@ -478,31 +540,12 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	}
 
 	ret = of_platform_populate(np, NULL, NULL, dev);
-	if (ret) {
-		clk_disable_unprepare(priv->clk);
+	if (ret)
 		goto err_phys_power;
-	}
-
-	/* Setup OTG mode corresponding to the ID pin */
-	if (priv->otg_mode == USB_DR_MODE_OTG) {
-		otg_id = dwc3_meson_g12a_get_id(priv);
-		if (otg_id != priv->otg_phy_mode) {
-			if (dwc3_meson_g12a_otg_mode_set(priv, otg_id))
-				dev_warn(dev, "Failed to switch OTG mode\n");
-		}
-	}
 
-	/* Setup role switcher */
-	priv->switch_desc.usb2_port = dwc3_meson_g12_find_child(dev,
-								"snps,dwc3");
-	priv->switch_desc.udc = dwc3_meson_g12_find_child(dev, "snps,dwc2");
-	priv->switch_desc.allow_userspace_control = true;
-	priv->switch_desc.set = dwc3_meson_g12a_role_set;
-	priv->switch_desc.get = dwc3_meson_g12a_role_get;
-
-	priv->role_switch = usb_role_switch_register(dev, &priv->switch_desc);
-	if (IS_ERR(priv->role_switch))
-		dev_warn(dev, "Unable to register Role Switch\n");
+	ret = dwc3_meson_g12a_otg_init(pdev, priv);
+	if (ret)
+		goto err_phys_power;
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
@@ -518,6 +561,10 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	for (i = 0 ; i < PHY_COUNT ; ++i)
 		phy_exit(priv->phys[i]);
 
+err_disable_clks:
+	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
+				   priv->drvdata->clks);
+
 	return ret;
 }
 
@@ -527,7 +574,8 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int i;
 
-	usb_role_switch_unregister(priv->role_switch);
+	if (priv->drvdata->otg_switch_supported)
+		usb_role_switch_unregister(priv->role_switch);
 
 	of_platform_depopulate(dev);
 
@@ -540,6 +588,9 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 
+	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
+				   priv->drvdata->clks);
+
 	return 0;
 }
 
@@ -547,7 +598,8 @@ static int __maybe_unused dwc3_meson_g12a_runtime_suspend(struct device *dev)
 {
 	struct dwc3_meson_g12a	*priv = dev_get_drvdata(dev);
 
-	clk_disable(priv->clk);
+	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
+				   priv->drvdata->clks);
 
 	return 0;
 }
@@ -556,7 +608,8 @@ static int __maybe_unused dwc3_meson_g12a_runtime_resume(struct device *dev)
 {
 	struct dwc3_meson_g12a	*priv = dev_get_drvdata(dev);
 
-	return clk_enable(priv->clk);
+	return clk_bulk_prepare_enable(priv->drvdata->num_clks,
+				       priv->drvdata->clks);
 }
 
 static int __maybe_unused dwc3_meson_g12a_suspend(struct device *dev)
@@ -619,7 +672,14 @@ static const struct dev_pm_ops dwc3_meson_g12a_dev_pm_ops = {
 };
 
 static const struct of_device_id dwc3_meson_g12a_match[] = {
-	{ .compatible = "amlogic,meson-g12a-usb-ctrl" },
+	{
+		.compatible = "amlogic,meson-g12a-usb-ctrl",
+		.data = &g12a_drvdata,
+	},
+	{
+		.compatible = "amlogic,meson-a1-usb-ctrl",
+		.data = &a1_drvdata,
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_meson_g12a_match);
-- 
2.7.4

