Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372C53BAF81
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jul 2021 00:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhGDW6r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Jul 2021 18:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhGDW6k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Jul 2021 18:58:40 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8639CC061762;
        Sun,  4 Jul 2021 15:56:04 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id d16so29013197lfn.3;
        Sun, 04 Jul 2021 15:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gm9I2QpSuLh79ZB8IOk5CD4sOHN/l1V3YBlVd3Fb7uQ=;
        b=qmaqevLgz2MdBK1LvLjE12tO9eZsFjkJHwomekRmXB+V2b0yoK/+c4U+/mKsjylsZL
         5ou17zYg2o1ftCng+XwdquP8F1NubdhFv8R5WvRHYMUKf93aCgXS8eVd7U+kVlaur04p
         YGx27s+rq0q1IciVxh1jPux9CA897/n7bfqdK/Tkg+8TGg8nc+eETkL/oNuj7UxdAbR1
         cVOSppBqKhDYHZ3UkIxTXMAMRfulmlG1p5hw+bDxu5Xg/gnrp3hP7GhkCwUg9LH5TtfX
         zTUWhuToHGn/nQaRc3B4g+bYuBzgTO1KG/bAK03MmgSvoi2V3IglLJGiditgjG7Fa6G0
         EvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gm9I2QpSuLh79ZB8IOk5CD4sOHN/l1V3YBlVd3Fb7uQ=;
        b=jc2SC9fowANcDXmeLYmvzshbx7X0/ijMwAdt0sbseSFtrFSl/F6tnOA5FYYLhJgIvS
         8SktpAVmlM/ThgI+ZboY9MmZX/kxiC8cprg6IXZgrH+LUVeYJgnRW3unxjWaUUugkHI+
         rykFdFrfdkjBarXSBBix/wG8I4s3C8H7sMnF1E2VBjszVwCXZtlW8CEbSSfJbxaBLV4J
         4ZSmpDR876GHWbGJxKnU8hkHQBjGZFR9w6orSRsDuHiHieK19j8j7zzvpoLh18CKnx30
         loErh/DiVWNIW7/bPix1LHQZ43aeIF0wapm67oChiS27noN9IfrTIZgxg8+aQAPzFjf9
         C1GQ==
X-Gm-Message-State: AOAM5335mohFNjBh0arSHlaN+YGx7Fx6EGa6H9JsbgsCdNnxxvWWsFTq
        ePo4iFQOmHKyrEO+YqRNlVJnmBZBwc4=
X-Google-Smtp-Source: ABdhPJyjmBIzE4lbbQcFHy44DcPC1fQyhtrlFywwSDBrNj6plCQGn5KRmJTEOa85jFkp3swE6FLfeA==
X-Received: by 2002:ac2:4345:: with SMTP id o5mr8098343lfl.599.1625439362869;
        Sun, 04 Jul 2021 15:56:02 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id i13sm497921lfc.111.2021.07.04.15.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 15:56:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 04/12] usb: phy: tegra: Support OTG mode programming
Date:   Mon,  5 Jul 2021 01:54:25 +0300
Message-Id: <20210704225433.32029-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210704225433.32029-1-digetx@gmail.com>
References: <20210704225433.32029-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support programming USB PHY into OTG mode.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 202 +++++++++++++++++++++++++++++-
 include/linux/usb/tegra_usb_phy.h |   5 +
 2 files changed, 202 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index c0f432d509aa..7d7fa5e54950 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -63,6 +63,10 @@
 #define   A_VBUS_VLD_WAKEUP_EN			BIT(30)
 
 #define USB_PHY_VBUS_WAKEUP_ID			0x408
+#define   ID_INT_EN				BIT(0)
+#define   ID_CHG_DET				BIT(1)
+#define   VBUS_WAKEUP_INT_EN			BIT(8)
+#define   VBUS_WAKEUP_CHG_DET			BIT(9)
 #define   VBUS_WAKEUP_STS			BIT(10)
 #define   VBUS_WAKEUP_WAKEUP_EN			BIT(30)
 
@@ -158,6 +162,10 @@
 #define   USB_USBMODE_HOST			(3 << 0)
 #define   USB_USBMODE_DEVICE			(2 << 0)
 
+#define PMC_USB_AO				0xf0
+#define   VBUS_WAKEUP_PD_P0			BIT(2)
+#define   ID_PD_P0				BIT(3)
+
 static DEFINE_SPINLOCK(utmip_pad_lock);
 static unsigned int utmip_pad_count;
 
@@ -533,13 +541,14 @@ static int utmi_phy_power_on(struct tegra_usb_phy *phy)
 	val &= ~USB_WAKE_ON_RESUME_EN;
 	writel_relaxed(val, base + USB_SUSP_CTRL);
 
-	if (phy->mode == USB_DR_MODE_PERIPHERAL) {
+	if (phy->mode != USB_DR_MODE_HOST) {
 		val = readl_relaxed(base + USB_SUSP_CTRL);
 		val &= ~(USB_WAKE_ON_CNNT_EN_DEV | USB_WAKE_ON_DISCON_EN_DEV);
 		writel_relaxed(val, base + USB_SUSP_CTRL);
 
 		val = readl_relaxed(base + USB_PHY_VBUS_WAKEUP_ID);
 		val &= ~VBUS_WAKEUP_WAKEUP_EN;
+		val &= ~(ID_CHG_DET | VBUS_WAKEUP_CHG_DET);
 		writel_relaxed(val, base + USB_PHY_VBUS_WAKEUP_ID);
 
 		val = readl_relaxed(base + USB_PHY_VBUS_SENSORS);
@@ -687,9 +696,10 @@ static int utmi_phy_power_off(struct tegra_usb_phy *phy)
 		 * Ask VBUS sensor to generate wake event once cable is
 		 * connected.
 		 */
-		if (phy->mode == USB_DR_MODE_PERIPHERAL) {
+		if (phy->mode != USB_DR_MODE_HOST) {
 			val = readl_relaxed(base + USB_PHY_VBUS_WAKEUP_ID);
 			val |= VBUS_WAKEUP_WAKEUP_EN;
+			val &= ~(ID_CHG_DET | VBUS_WAKEUP_CHG_DET);
 			writel_relaxed(val, base + USB_PHY_VBUS_WAKEUP_ID);
 
 			val = readl_relaxed(base + USB_PHY_VBUS_SENSORS);
@@ -904,26 +914,150 @@ static void tegra_usb_phy_shutdown(struct usb_phy *u_phy)
 	phy->freq = NULL;
 }
 
+static irqreturn_t tegra_usb_phy_isr(int irq, void *data)
+{
+	u32 val, int_mask = ID_CHG_DET | VBUS_WAKEUP_CHG_DET;
+	struct tegra_usb_phy *phy = data;
+	void __iomem *base = phy->regs;
+
+	/*
+	 * The PHY interrupt also wakes the USB controller driver since
+	 * interrupt is shared. We don't do anything in the PHY driver,
+	 * so just clear the interrupt.
+	 */
+	val = readl_relaxed(base + USB_PHY_VBUS_WAKEUP_ID);
+	writel_relaxed(val, base + USB_PHY_VBUS_WAKEUP_ID);
+
+	return val & int_mask ? IRQ_HANDLED : IRQ_NONE;
+}
+
 static int tegra_usb_phy_set_wakeup(struct usb_phy *u_phy, bool enable)
 {
 	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
+	void __iomem *base = phy->regs;
+	int ret = 0;
+	u32 val;
+
+	if (phy->wakeup_enabled && phy->mode != USB_DR_MODE_HOST &&
+	    phy->irq > 0) {
+		disable_irq(phy->irq);
+
+		val = readl_relaxed(base + USB_PHY_VBUS_WAKEUP_ID);
+		val &= ~(ID_INT_EN | VBUS_WAKEUP_INT_EN);
+		writel_relaxed(val, base + USB_PHY_VBUS_WAKEUP_ID);
+
+		enable_irq(phy->irq);
+
+		free_irq(phy->irq, phy);
+
+		phy->wakeup_enabled = false;
+	}
+
+	if (enable && phy->mode != USB_DR_MODE_HOST && phy->irq > 0) {
+		ret = request_irq(phy->irq, tegra_usb_phy_isr, IRQF_SHARED,
+				  dev_name(phy->u_phy.dev), phy);
+		if (!ret) {
+			disable_irq(phy->irq);
+
+			/*
+			 * USB clock will be resumed once wake event will be
+			 * generated.  The ID-change event requires to have
+			 * interrupts enabled, otherwise it won't be generated.
+			 */
+			val = readl_relaxed(base + USB_PHY_VBUS_WAKEUP_ID);
+			val |= ID_INT_EN | VBUS_WAKEUP_INT_EN;
+			writel_relaxed(val, base + USB_PHY_VBUS_WAKEUP_ID);
+
+			enable_irq(phy->irq);
+		} else {
+			dev_err(phy->u_phy.dev,
+				"Failed to request interrupt: %d", ret);
+			enable = false;
+		}
+	}
 
 	phy->wakeup_enabled = enable;
 
-	return 0;
+	return ret;
 }
 
 static int tegra_usb_phy_set_suspend(struct usb_phy *u_phy, int suspend)
 {
 	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
+	int ret;
 
 	if (WARN_ON(!phy->freq))
 		return -EINVAL;
 
+	/*
+	 * PHY is sharing IRQ with the CI driver, hence here we either
+	 * disable interrupt for both PHY and CI or for CI only.  The
+	 * interrupt needs to be disabled while hardware is reprogrammed
+	 * because interrupt touches the programmed registers, and thus,
+	 * there could be a race condition.
+	 */
+	if (phy->irq > 0)
+		disable_irq(phy->irq);
+
 	if (suspend)
-		return tegra_usb_phy_power_off(phy);
+		ret = tegra_usb_phy_power_off(phy);
 	else
-		return tegra_usb_phy_power_on(phy);
+		ret = tegra_usb_phy_power_on(phy);
+
+	if (phy->irq > 0)
+		enable_irq(phy->irq);
+
+	return ret;
+}
+
+static int tegra_usb_phy_configure_pmc(struct tegra_usb_phy *phy)
+{
+	int err, val = 0;
+
+	/* older device-trees don't have PMC regmap */
+	if (!phy->pmc_regmap)
+		return 0;
+
+	/* should be initialized if regmap presents */
+	if (WARN_ON(phy->instance < 0))
+		return 0;
+
+	/*
+	 * Tegra20 has a different layout of PMC USB register bits and AO is
+	 * enabled by default after system reset on Tegra20, so assume nothing
+	 * to do on Tegra20.
+	 */
+	if (!phy->soc_config->requires_pmc_ao_power_up)
+		return 0;
+
+	/* enable VBUS wake-up detector */
+	if (phy->mode != USB_DR_MODE_HOST)
+		val |= VBUS_WAKEUP_PD_P0 << phy->instance * 4;
+
+	/* enable ID-pin ACC detector for OTG mode switching */
+	if (phy->mode == USB_DR_MODE_OTG)
+		val |= ID_PD_P0 << phy->instance * 4;
+
+	/* disable detectors to reset them */
+	err = regmap_set_bits(phy->pmc_regmap, PMC_USB_AO, val);
+	if (err) {
+		dev_err(phy->u_phy.dev, "Failed to disable PMC AO: %d\n", err);
+		return err;
+	}
+
+	usleep_range(10, 100);
+
+	/* enable detectors */
+	err = regmap_clear_bits(phy->pmc_regmap, PMC_USB_AO, val);
+	if (err) {
+		dev_err(phy->u_phy.dev, "Failed to enable PMC AO: %d\n", err);
+		return err;
+	}
+
+	/* detectors starts to work after 10ms */
+	usleep_range(10000, 15000);
+
+	return 0;
 }
 
 static int tegra_usb_phy_init(struct usb_phy *u_phy)
@@ -967,6 +1101,10 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 			goto disable_vbus;
 	}
 
+	err = tegra_usb_phy_configure_pmc(phy);
+	if (err)
+		goto close_phy;
+
 	err = tegra_usb_phy_power_on(phy);
 	if (err)
 		goto close_phy;
@@ -1135,11 +1273,50 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 	return 0;
 }
 
+static void tegra_usb_phy_put_pmc_device(void *dev)
+{
+	put_device(dev);
+}
+
+static struct regmap *tegra_usb_phy_get_pmc_regmap(struct device *dev)
+{
+	struct platform_device *pmc_pdev;
+	struct device_node *np;
+	struct regmap *regmap;
+	int err;
+
+	np = of_parse_phandle(dev->of_node, "nvidia,pmc", 0);
+	if (!np) {
+		dev_warn_once(dev, "nvidia,pmc is missing, please update your device-tree\n");
+		return NULL;
+	}
+
+	pmc_pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pmc_pdev)
+		return ERR_PTR(-ENODEV);
+
+	err = devm_add_action_or_reset(dev, tegra_usb_phy_put_pmc_device,
+				       &pmc_pdev->dev);
+	if (err)
+		return ERR_PTR(err);
+
+	if (!platform_get_drvdata(pmc_pdev))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	regmap = dev_get_regmap(&pmc_pdev->dev, "usb_sleepwalk");
+	if (!regmap)
+		return ERR_PTR(-EINVAL);
+
+	return regmap;
+}
+
 static const struct tegra_phy_soc_config tegra20_soc_config = {
 	.utmi_pll_config_in_car_module = false,
 	.has_hostpc = false,
 	.requires_usbmode_setup = false,
 	.requires_extra_tuning_parameters = false,
+	.requires_pmc_ao_power_up = false,
 };
 
 static const struct tegra_phy_soc_config tegra30_soc_config = {
@@ -1147,6 +1324,7 @@ static const struct tegra_phy_soc_config tegra30_soc_config = {
 	.has_hostpc = true,
 	.requires_usbmode_setup = true,
 	.requires_extra_tuning_parameters = true,
+	.requires_pmc_ao_power_up = true,
 };
 
 static const struct of_device_id tegra_usb_phy_id_table[] = {
@@ -1172,6 +1350,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	tegra_phy->soc_config = of_device_get_match_data(&pdev->dev);
+	tegra_phy->irq = platform_get_irq_optional(pdev, 0);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -1215,6 +1394,19 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	tegra_phy->pmc_regmap = tegra_usb_phy_get_pmc_regmap(&pdev->dev);
+	err = PTR_ERR_OR_ZERO(tegra_phy->pmc_regmap);
+	if (err) {
+		dev_err_probe(&pdev->dev, err, "Failed to get PMC regmap\n");
+		return err;
+	}
+
+	/* older device-trees don't specify instance ID */
+	err = of_property_read_u32(np, "nvidia,phy-instance",
+				   &tegra_phy->instance);
+	if (err)
+		tegra_phy->instance = -1;
+
 	phy_type = of_usb_get_phy_mode(np);
 	switch (phy_type) {
 	case USBPHY_INTERFACE_MODE_UTMI:
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index fd1c9f6a4e37..d3e65eb9e16f 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -18,6 +18,7 @@
 
 #include <linux/clk.h>
 #include <linux/gpio.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/usb/otg.h>
 
@@ -30,6 +31,7 @@
  *      enter host mode
  * requires_extra_tuning_parameters: true if xcvr_hsslew, hssquelch_level
  *      and hsdiscon_level should be set for adequate signal quality
+ * requires_pmc_ao_power_up: true if USB AO is powered down by default
  */
 
 struct tegra_phy_soc_config {
@@ -37,6 +39,7 @@ struct tegra_phy_soc_config {
 	bool has_hostpc;
 	bool requires_usbmode_setup;
 	bool requires_extra_tuning_parameters;
+	bool requires_pmc_ao_power_up;
 };
 
 struct tegra_utmip_config {
@@ -62,6 +65,7 @@ enum tegra_usb_phy_port_speed {
 struct tegra_xtal_freq;
 
 struct tegra_usb_phy {
+	int irq;
 	int instance;
 	const struct tegra_xtal_freq *freq;
 	void __iomem *regs;
@@ -70,6 +74,7 @@ struct tegra_usb_phy {
 	struct clk *pll_u;
 	struct clk *pad_clk;
 	struct regulator *vbus;
+	struct regmap *pmc_regmap;
 	enum usb_dr_mode mode;
 	void *config;
 	const struct tegra_phy_soc_config *soc_config;
-- 
2.32.0

