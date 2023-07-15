Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5F5754923
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jul 2023 16:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjGOOHe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Jul 2023 10:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjGOOHd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Jul 2023 10:07:33 -0400
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD3BC0
        for <linux-usb@vger.kernel.org>; Sat, 15 Jul 2023 07:07:30 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id Kfviq6N6ev5uIKfvjqdtU7; Sat, 15 Jul 2023 16:07:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689430048; bh=Hmsl+U9gv4J0srKRqFPI6BoITQucNXNyaXVZfOaYRSI=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=jsN1sDt/Fir7+4DMqKemG9Br4BvBFVmc1sG7L66TMb7daA4BXBuJRlYubLGxgOMrx
         fSdFEM34ahAf0la7/gDMcKKql2wjdFaAWVnsBT4fnpk2KgL6R9QA14mGqbyCr37Qa6
         knpHhcWK9nDVcqEa1t4nss0bNmN4I+xB9j3M1G65cjtce7O/YMMkaCn92pg0bmszan
         J74uAOgfPoVfJ8cXllqRf/ZUNjLSTI0NL0x+4e+Zi2VlHt1GHwGwL8Q+WEBC0Rbj8D
         uPh3YjPn3bdew9RT/b2nAuU26+Vi9nFOr2Em5CfRoMVGnFKLCbz/ageKj6c16zcfJG
         Wdvt3QxPuGP8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689430048; bh=Hmsl+U9gv4J0srKRqFPI6BoITQucNXNyaXVZfOaYRSI=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=jsN1sDt/Fir7+4DMqKemG9Br4BvBFVmc1sG7L66TMb7daA4BXBuJRlYubLGxgOMrx
         fSdFEM34ahAf0la7/gDMcKKql2wjdFaAWVnsBT4fnpk2KgL6R9QA14mGqbyCr37Qa6
         knpHhcWK9nDVcqEa1t4nss0bNmN4I+xB9j3M1G65cjtce7O/YMMkaCn92pg0bmszan
         J74uAOgfPoVfJ8cXllqRf/ZUNjLSTI0NL0x+4e+Zi2VlHt1GHwGwL8Q+WEBC0Rbj8D
         uPh3YjPn3bdew9RT/b2nAuU26+Vi9nFOr2Em5CfRoMVGnFKLCbz/ageKj6c16zcfJG
         Wdvt3QxPuGP8A==
Date:   Sat, 15 Jul 2023 16:07:26 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aswath Govindraju <a-govindraju@ti.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3-am62: Rename private data
Message-ID: <ZLKoHhJvT+Y6aM+C@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfF9OGjbFl2ina8HzzsCnvipawopKH+c3NJTSZjS0ahWRNYPlon9bvK9XDQQsNDIKL41tQHSbTRYbfmMxhnpqTZffsgi/dEtEDYaAgDSbGgceaI4IRRxR
 oB684lgu6Otrya8IwSR870ayGFnzm/Ar7nthxqth0w9gwiNPTAUXQH6zQv1Q/Ehuh9v6u5XwezvP5vS95i255UHX7YCkWCs62yr6ntGNygxDwqm7E9t/HYh2
 r0hQObLG4wbfH4ofbmoOaOSASxGiZITtycHy2ApvgEk=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Rename dwc3_data to dwc3_am62 to make it consistent with other
glue drivers, it's clearer that this is am62's specific.
While there, do the same for data variable.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 drivers/usb/dwc3/dwc3-am62.c | 94 ++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index 1755f2f848c5..94dcbc443cf2 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -102,7 +102,7 @@
 
 #define DWC3_AM62_AUTOSUSPEND_DELAY	100
 
-struct dwc3_data {
+struct dwc3_am62 {
 	struct device *dev;
 	void __iomem *usbss;
 	struct clk *usb2_refclk;
@@ -129,19 +129,19 @@ static const int dwc3_ti_rate_table[] = {	/* in KHZ */
 	52000,
 };
 
-static inline u32 dwc3_ti_readl(struct dwc3_data *data, u32 offset)
+static inline u32 dwc3_ti_readl(struct dwc3_am62 *am62, u32 offset)
 {
-	return readl((data->usbss) + offset);
+	return readl((am62->usbss) + offset);
 }
 
-static inline void dwc3_ti_writel(struct dwc3_data *data, u32 offset, u32 value)
+static inline void dwc3_ti_writel(struct dwc3_am62 *am62, u32 offset, u32 value)
 {
-	writel(value, (data->usbss) + offset);
+	writel(value, (am62->usbss) + offset);
 }
 
-static int phy_syscon_pll_refclk(struct dwc3_data *data)
+static int phy_syscon_pll_refclk(struct dwc3_am62 *am62)
 {
-	struct device *dev = data->dev;
+	struct device *dev = am62->dev;
 	struct device_node *node = dev->of_node;
 	struct of_phandle_args args;
 	struct regmap *syscon;
@@ -153,16 +153,16 @@ static int phy_syscon_pll_refclk(struct dwc3_data *data)
 		return PTR_ERR(syscon);
 	}
 
-	data->syscon = syscon;
+	am62->syscon = syscon;
 
 	ret = of_parse_phandle_with_fixed_args(node, "ti,syscon-phy-pll-refclk", 1,
 					       0, &args);
 	if (ret)
 		return ret;
 
-	data->offset = args.args[0];
+	am62->offset = args.args[0];
 
-	ret = regmap_update_bits(data->syscon, data->offset, PHY_PLL_REFCLK_MASK, data->rate_code);
+	ret = regmap_update_bits(am62->syscon, am62->offset, PHY_PLL_REFCLK_MASK, am62->rate_code);
 	if (ret) {
 		dev_err(dev, "failed to set phy pll reference clock rate\n");
 		return ret;
@@ -175,32 +175,32 @@ static int dwc3_ti_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
-	struct dwc3_data *data;
+	struct dwc3_am62 *am62;
 	int i, ret;
 	unsigned long rate;
 	u32 reg;
 
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
+	am62 = devm_kzalloc(dev, sizeof(*am62), GFP_KERNEL);
+	if (!am62)
 		return -ENOMEM;
 
-	data->dev = dev;
-	platform_set_drvdata(pdev, data);
+	am62->dev = dev;
+	platform_set_drvdata(pdev, am62);
 
-	data->usbss = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->usbss)) {
+	am62->usbss = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(am62->usbss)) {
 		dev_err(dev, "can't map IOMEM resource\n");
-		return PTR_ERR(data->usbss);
+		return PTR_ERR(am62->usbss);
 	}
 
-	data->usb2_refclk = devm_clk_get(dev, "ref");
-	if (IS_ERR(data->usb2_refclk)) {
+	am62->usb2_refclk = devm_clk_get(dev, "ref");
+	if (IS_ERR(am62->usb2_refclk)) {
 		dev_err(dev, "can't get usb2_refclk\n");
-		return PTR_ERR(data->usb2_refclk);
+		return PTR_ERR(am62->usb2_refclk);
 	}
 
 	/* Calculate the rate code */
-	rate = clk_get_rate(data->usb2_refclk);
+	rate = clk_get_rate(am62->usb2_refclk);
 	rate /= 1000;	// To KHz
 	for (i = 0; i < ARRAY_SIZE(dwc3_ti_rate_table); i++) {
 		if (dwc3_ti_rate_table[i] == rate)
@@ -212,20 +212,20 @@ static int dwc3_ti_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	data->rate_code = i;
+	am62->rate_code = i;
 
 	/* Read the syscon property and set the rate code */
-	ret = phy_syscon_pll_refclk(data);
+	ret = phy_syscon_pll_refclk(am62);
 	if (ret)
 		return ret;
 
 	/* VBUS divider select */
-	data->vbus_divider = device_property_read_bool(dev, "ti,vbus-divider");
-	reg = dwc3_ti_readl(data, USBSS_PHY_CONFIG);
-	if (data->vbus_divider)
+	am62->vbus_divider = device_property_read_bool(dev, "ti,vbus-divider");
+	reg = dwc3_ti_readl(am62, USBSS_PHY_CONFIG);
+	if (am62->vbus_divider)
 		reg |= 1 << USBSS_PHY_VBUS_SEL_SHIFT;
 
-	dwc3_ti_writel(data, USBSS_PHY_CONFIG, reg);
+	dwc3_ti_writel(am62, USBSS_PHY_CONFIG, reg);
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
@@ -233,7 +233,7 @@ static int dwc3_ti_probe(struct platform_device *pdev)
 	 * Don't ignore its dependencies with its children
 	 */
 	pm_suspend_ignore_children(dev, false);
-	clk_prepare_enable(data->usb2_refclk);
+	clk_prepare_enable(am62->usb2_refclk);
 	pm_runtime_get_noresume(dev);
 
 	ret = of_platform_populate(node, NULL, NULL, dev);
@@ -243,9 +243,9 @@ static int dwc3_ti_probe(struct platform_device *pdev)
 	}
 
 	/* Set mode valid bit to indicate role is valid */
-	reg = dwc3_ti_readl(data, USBSS_MODE_CONTROL);
+	reg = dwc3_ti_readl(am62, USBSS_MODE_CONTROL);
 	reg |= USBSS_MODE_VALID;
-	dwc3_ti_writel(data, USBSS_MODE_CONTROL, reg);
+	dwc3_ti_writel(am62, USBSS_MODE_CONTROL, reg);
 
 	/* Device has capability to wakeup system from sleep */
 	device_set_wakeup_capable(dev, true);
@@ -261,7 +261,7 @@ static int dwc3_ti_probe(struct platform_device *pdev)
 	return 0;
 
 err_pm_disable:
-	clk_disable_unprepare(data->usb2_refclk);
+	clk_disable_unprepare(am62->usb2_refclk);
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
 	return ret;
@@ -278,18 +278,18 @@ static int dwc3_ti_remove_core(struct device *dev, void *c)
 static void dwc3_ti_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct dwc3_data *data = platform_get_drvdata(pdev);
+	struct dwc3_am62 *am62 = platform_get_drvdata(pdev);
 	u32 reg;
 
 	device_for_each_child(dev, NULL, dwc3_ti_remove_core);
 
 	/* Clear mode valid bit */
-	reg = dwc3_ti_readl(data, USBSS_MODE_CONTROL);
+	reg = dwc3_ti_readl(am62, USBSS_MODE_CONTROL);
 	reg &= ~USBSS_MODE_VALID;
-	dwc3_ti_writel(data, USBSS_MODE_CONTROL, reg);
+	dwc3_ti_writel(am62, USBSS_MODE_CONTROL, reg);
 
 	pm_runtime_put_sync(dev);
-	clk_disable_unprepare(data->usb2_refclk);
+	clk_disable_unprepare(am62->usb2_refclk);
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
 
@@ -299,15 +299,15 @@ static void dwc3_ti_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM
 static int dwc3_ti_suspend_common(struct device *dev)
 {
-	struct dwc3_data *data = dev_get_drvdata(dev);
+	struct dwc3_am62 *am62 = dev_get_drvdata(dev);
 	u32 reg, current_prtcap_dir;
 
 	if (device_may_wakeup(dev)) {
-		reg = dwc3_ti_readl(data, USBSS_CORE_STAT);
+		reg = dwc3_ti_readl(am62, USBSS_CORE_STAT);
 		current_prtcap_dir = (reg & USBSS_CORE_OPERATIONAL_MODE_MASK)
 				     >> USBSS_CORE_OPERATIONAL_MODE_SHIFT;
 		/* Set wakeup config enable bits */
-		reg = dwc3_ti_readl(data, USBSS_WAKEUP_CONFIG);
+		reg = dwc3_ti_readl(am62, USBSS_WAKEUP_CONFIG);
 		if (current_prtcap_dir == DWC3_GCTL_PRTCAP_HOST) {
 			reg = USBSS_WAKEUP_CFG_LINESTATE_EN | USBSS_WAKEUP_CFG_OVERCURRENT_EN;
 		} else {
@@ -317,30 +317,30 @@ static int dwc3_ti_suspend_common(struct device *dev)
 			 * and in U2/L3 state else it causes spurious wake-up.
 			 */
 		}
-		dwc3_ti_writel(data, USBSS_WAKEUP_CONFIG, reg);
+		dwc3_ti_writel(am62, USBSS_WAKEUP_CONFIG, reg);
 		/* clear wakeup status so we know what caused the wake up */
-		dwc3_ti_writel(data, USBSS_WAKEUP_STAT, USBSS_WAKEUP_STAT_CLR);
+		dwc3_ti_writel(am62, USBSS_WAKEUP_STAT, USBSS_WAKEUP_STAT_CLR);
 	}
 
-	clk_disable_unprepare(data->usb2_refclk);
+	clk_disable_unprepare(am62->usb2_refclk);
 
 	return 0;
 }
 
 static int dwc3_ti_resume_common(struct device *dev)
 {
-	struct dwc3_data *data = dev_get_drvdata(dev);
+	struct dwc3_am62 *am62 = dev_get_drvdata(dev);
 	u32 reg;
 
-	clk_prepare_enable(data->usb2_refclk);
+	clk_prepare_enable(am62->usb2_refclk);
 
 	if (device_may_wakeup(dev)) {
 		/* Clear wakeup config enable bits */
-		dwc3_ti_writel(data, USBSS_WAKEUP_CONFIG, USBSS_WAKEUP_CFG_NONE);
+		dwc3_ti_writel(am62, USBSS_WAKEUP_CONFIG, USBSS_WAKEUP_CFG_NONE);
 	}
 
-	reg = dwc3_ti_readl(data, USBSS_WAKEUP_STAT);
-	data->wakeup_stat = reg;
+	reg = dwc3_ti_readl(am62, USBSS_WAKEUP_STAT);
+	am62->wakeup_stat = reg;
 
 	return 0;
 }
-- 
2.39.2

