Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C27A114F4E
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 11:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfLFKwM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 05:52:12 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:19281 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfLFKwL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 05:52:11 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dea32d40000>; Fri, 06 Dec 2019 02:52:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 06 Dec 2019 02:52:09 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 06 Dec 2019 02:52:09 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 10:52:09 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 10:52:08 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 6 Dec 2019 10:52:08 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.64.167]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dea32d50000>; Fri, 06 Dec 2019 02:52:08 -0800
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Nagarjuna Kristam" <nkristam@nvidia.com>
Subject: [PATCH 12/18] usb: gadget: tegra-xudc: support multiple device modes
Date:   Fri, 6 Dec 2019 16:20:15 +0530
Message-ID: <1575629421-7039-13-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
References: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1575629525; bh=G83OwqPGkBaYgwEjll/U+4Hzd0X8xYkdM55QCb/xBPc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=l7NcVgxOoPdKrYuvtOdGkxwCKYOZmXP2MgDwl/KltA2gXneIoE1+W/n3x1nONoXPk
         JqUiOaW0HjZXFLiq8pxuSLmhMFmbNPkcGb+0ma1EWr4HRkx/m+F0rCsImIINWOxRwX
         c40o4HokDSAnNhvodq6mxJUI2TgxCWt7WfegoWFg06uvZU4F+vdXCcq3G3JhWIzykT
         +nyOwR/ViRUrq6pDiO+6R0X2g8WaAgOfs8J6P8SIgiWbhcKjO3cdGasduVLgipic8M
         Y2LKJugedducs6pJIncEGCLllI/hUrx5GikbUAXLWmlR3GywTzzxR5vakHeSJRLQEU
         s0QXmo+49ePLA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This change supports limited multiple device modes by:
- At most 4 ports contains OTG/Device capability.
- One port run as device mode at a time.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 229 ++++++++++++++++++++++++++----------
 1 file changed, 167 insertions(+), 62 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 283c320..a17d896 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -483,14 +483,15 @@ struct tegra_xudc {
 	bool device_mode;
 	struct work_struct usb_role_sw_work;
 
-	struct phy *usb3_phy;
-	struct phy *utmi_phy;
+	struct phy **usb3_phy;
+	struct phy **utmi_phy;
 
 	struct tegra_xudc_save_regs saved_regs;
 	bool suspended;
 	bool powergated;
 
-	struct usb_phy *usbphy;
+	struct usb_phy **usbphy;
+	int current_phy_index;
 	struct notifier_block vbus_nb;
 
 	struct completion disconnect_complete;
@@ -522,6 +523,7 @@ struct tegra_xudc_soc {
 	unsigned int num_supplies;
 	const char * const *clock_names;
 	unsigned int num_clks;
+	unsigned int num_phys;
 	bool u1_enable;
 	bool u2_enable;
 	bool lpm_enable;
@@ -605,17 +607,18 @@ static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 		return;
 	pm_runtime_get_sync(xudc->dev);
 
-	err = phy_power_on(xudc->utmi_phy);
+	err = phy_power_on(xudc->utmi_phy[xudc->current_phy_index]);
 	if (err < 0)
 		dev_err(xudc->dev, "utmi power on failed %d\n", err);
 
-	err = phy_power_on(xudc->usb3_phy);
+	err = phy_power_on(xudc->usb3_phy[xudc->current_phy_index]);
 	if (err < 0)
 		dev_err(xudc->dev, "usb3 phy power on failed %d\n", err);
 
 	dev_dbg(xudc->dev, "device mode on\n");
 
-	phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG, USB_ROLE_DEVICE);
+	phy_set_mode_ext(xudc->utmi_phy[xudc->current_phy_index],
+			 PHY_MODE_USB_OTG, USB_ROLE_DEVICE);
 
 	xudc->device_mode = true;
 
@@ -636,7 +639,8 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 
 	reinit_completion(&xudc->disconnect_complete);
 
-	phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
+	phy_set_mode_ext(xudc->utmi_phy[xudc->current_phy_index],
+			 PHY_MODE_USB_OTG, USB_ROLE_NONE);
 
 	pls = (xudc_readl(xudc, PORTSC) & PORTSC_PLS_MASK) >>
 		PORTSC_PLS_SHIFT;
@@ -663,11 +667,11 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 	/* Make sure interrupt handler has completed before powergating. */
 	synchronize_irq(xudc->irq);
 
-	err = phy_power_off(xudc->utmi_phy);
+	err = phy_power_off(xudc->utmi_phy[xudc->current_phy_index]);
 	if (err < 0)
 		dev_err(xudc->dev, "utmi_phy power off failed %d\n", err);
 
-	err = phy_power_off(xudc->usb3_phy);
+	err = phy_power_off(xudc->usb3_phy[xudc->current_phy_index]);
 	if (err < 0)
 		dev_err(xudc->dev, "usb3_phy power off failed %d\n", err);
 
@@ -685,17 +689,43 @@ static void tegra_xudc_usb_role_sw_work(struct work_struct *work)
 		tegra_xudc_device_mode_off(xudc);
 }
 
-static int tegra_xudc_vbus_notifier(struct notifier_block *nb,
+static int tegra_xudc_get_phy_index(struct tegra_xudc *xudc,
+					      struct usb_phy *usbphy)
+{
+	int i;
+
+	for (i = 0; i < xudc->soc->num_phys; i++) {
+		if (xudc->usbphy[i] && usbphy == xudc->usbphy[i])
+			return i;
+	}
+
+	dev_info(xudc->dev, "phy index could not be found for shared usb-phy");
+	return -1;
+}
+
+static int tegra_xudc_vbus_notify(struct notifier_block *nb,
 					 unsigned long action, void *data)
 {
 	struct tegra_xudc *xudc = container_of(nb, struct tegra_xudc,
 					       vbus_nb);
+	struct usb_phy *usbphy = (struct usb_phy *)data;
 
 	dev_dbg(xudc->dev, "%s action is %ld\n", __func__, action);
 
+	if ((xudc->device_mode && action == USB_ROLE_DEVICE) ||
+	    (!xudc->device_mode && action != USB_ROLE_DEVICE)) {
+		dev_info(xudc->dev, "Same role(%d) received. Ignore",
+			 xudc->device_mode);
+		return NOTIFY_OK;
+	}
+
 	xudc->role = (enum usb_role)action;
 
-	if (!xudc->suspended)
+	xudc->current_phy_index = tegra_xudc_get_phy_index(xudc, usbphy);
+	dev_dbg(xudc->dev, "%s current phy index is %d\n", __func__,
+		xudc->current_phy_index);
+
+	if (!xudc->suspended && xudc->current_phy_index != -1)
 		schedule_work(&xudc->usb_role_sw_work);
 
 	return NOTIFY_OK;
@@ -716,10 +746,12 @@ static void tegra_xudc_plc_reset_work(struct work_struct *work)
 
 		if (pls == PORTSC_PLS_INACTIVE) {
 			dev_info(xudc->dev, "PLS = Inactive. Toggle VBUS\n");
-			phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG,
-					 USB_ROLE_NONE);
-			phy_set_mode_ext(xudc->utmi_phy, PHY_MODE_USB_OTG,
-					 USB_ROLE_DEVICE);
+			phy_set_mode_ext(
+					xudc->utmi_phy[xudc->current_phy_index],
+					PHY_MODE_USB_OTG, USB_ROLE_NONE);
+			phy_set_mode_ext(
+					xudc->utmi_phy[xudc->current_phy_index],
+					PHY_MODE_USB_OTG, USB_ROLE_DEVICE);
 
 			xudc->wait_csc = false;
 		}
@@ -747,7 +779,8 @@ static void tegra_xudc_port_reset_war_work(struct work_struct *work)
 		if (pls == PORTSC_PLS_DISABLED) {
 			dev_dbg(xudc->dev, "toggle vbus\n");
 			/* PRC doesn't complete in 100ms, toggle the vbus */
-			ret = tegra_phy_xusb_utmi_port_reset(xudc->utmi_phy);
+			ret = tegra_phy_xusb_utmi_port_reset(
+				xudc->utmi_phy[xudc->current_phy_index]);
 			if (ret == 1)
 				xudc->wait_for_sec_prc = 0;
 		}
@@ -1935,7 +1968,7 @@ static int tegra_xudc_gadget_start(struct usb_gadget *gadget,
 	struct tegra_xudc *xudc = to_xudc(gadget);
 	unsigned long flags;
 	u32 val;
-	int ret;
+	int ret, i;
 
 	if (!driver)
 		return -EINVAL;
@@ -1971,8 +2004,9 @@ static int tegra_xudc_gadget_start(struct usb_gadget *gadget,
 		xudc_writel(xudc, val, CTRL);
 	}
 
-	if (xudc->usbphy)
-		otg_set_peripheral(xudc->usbphy->otg, gadget);
+	for (i = 0; i < xudc->soc->num_phys; i++)
+		if (xudc->usbphy[i])
+			otg_set_peripheral(xudc->usbphy[i]->otg, gadget);
 
 	xudc->driver = driver;
 unlock:
@@ -1989,13 +2023,15 @@ static int tegra_xudc_gadget_stop(struct usb_gadget *gadget)
 	struct tegra_xudc *xudc = to_xudc(gadget);
 	unsigned long flags;
 	u32 val;
+	int i;
 
 	pm_runtime_get_sync(xudc->dev);
 
 	spin_lock_irqsave(&xudc->lock, flags);
 
-	if (xudc->usbphy)
-		otg_set_peripheral(xudc->usbphy->otg, NULL);
+	for (i = 0; i < xudc->soc->num_phys; i++)
+		if (xudc->usbphy[i])
+			otg_set_peripheral(xudc->usbphy[i]->otg, NULL);
 
 	val = xudc_readl(xudc, CTRL);
 	val &= ~(CTRL_IE | CTRL_ENABLE);
@@ -3329,33 +3365,117 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 	xudc_writel(xudc, val, CFG_DEV_SSPI_XFER);
 }
 
-static int tegra_xudc_phy_init(struct tegra_xudc *xudc)
+static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 {
-	int err;
+	int err = 0, i, usb3;
 
-	err = phy_init(xudc->utmi_phy);
-	if (err < 0) {
-		dev_err(xudc->dev, "utmi phy init failed: %d\n", err);
-		return err;
-	}
+	xudc->utmi_phy = devm_kcalloc(xudc->dev, xudc->soc->num_phys,
+					   sizeof(*xudc->utmi_phy), GFP_KERNEL);
+	if (!xudc->utmi_phy)
+		return -ENOMEM;
 
-	err = phy_init(xudc->usb3_phy);
-	if (err < 0) {
-		dev_err(xudc->dev, "usb3 phy init failed: %d\n", err);
-		goto exit_utmi_phy;
+	xudc->usb3_phy = devm_kcalloc(xudc->dev, xudc->soc->num_phys,
+					   sizeof(*xudc->usb3_phy), GFP_KERNEL);
+	if (!xudc->usb3_phy)
+		return -ENOMEM;
+
+	xudc->usbphy = devm_kcalloc(xudc->dev, xudc->soc->num_phys,
+					   sizeof(*xudc->usbphy), GFP_KERNEL);
+	if (!xudc->usbphy)
+		return -ENOMEM;
+
+	xudc->vbus_nb.notifier_call = tegra_xudc_vbus_notify;
+
+	for (i = 0; i < xudc->soc->num_phys; i++) {
+		char phy_name[] = "usb.-.";
+
+		/* Get USB2 phy */
+		snprintf(phy_name, sizeof(phy_name), "usb2-%d", i);
+		xudc->utmi_phy[i] = devm_phy_optional_get(xudc->dev, phy_name);
+		if (IS_ERR(xudc->utmi_phy[i])) {
+			err = PTR_ERR(xudc->utmi_phy[i]);
+			if (err != -EPROBE_DEFER)
+				dev_err(xudc->dev, "failed to get usb2-%d phy: %d\n",
+					i, err);
+
+			goto clean_up;
+		} else if (xudc->utmi_phy[i]) {
+			/* Get usb-phy, if utmi phy is available */
+			xudc->usbphy[i] = devm_usb_get_phy_by_node(xudc->dev,
+						xudc->utmi_phy[i]->dev.of_node,
+						&xudc->vbus_nb);
+			if (IS_ERR(xudc->usbphy[i])) {
+				dev_err(xudc->dev, "failed to get usbphy-%d: %d\n",
+					i, err);
+				goto clean_up;
+			}
+		} else if (!xudc->utmi_phy[i]) {
+			/* if utmi phy is not available, ignore USB3 phy get */
+			continue;
+		}
+
+		/* Get USB3 phy */
+		usb3 = tegra_xusb_padctl_get_usb3_companion(xudc->padctl, i);
+		if (usb3 < 0)
+			continue;
+
+		snprintf(phy_name, sizeof(phy_name), "usb3-%d", usb3);
+		xudc->usb3_phy[i] = devm_phy_optional_get(xudc->dev, phy_name);
+		if (IS_ERR(xudc->usb3_phy[i])) {
+			err = PTR_ERR(xudc->usb3_phy[i]);
+			if (err != -EPROBE_DEFER)
+				dev_err(xudc->dev, "failed to get usb3-%d phy: %d\n",
+					usb3, err);
+
+			goto clean_up;
+		} else if (xudc->usb3_phy[i])
+			dev_dbg(xudc->dev, "usb3_phy-%d registered", usb3);
 	}
 
-	return 0;
+	return err;
+
+clean_up:
+	for (i = 0; i < xudc->soc->num_phys; i++) {
+		xudc->usb3_phy[i] = NULL;
+		xudc->utmi_phy[i] = NULL;
+		xudc->usbphy[i] = NULL;
+	}
 
-exit_utmi_phy:
-	phy_exit(xudc->utmi_phy);
 	return err;
 }
 
 static void tegra_xudc_phy_exit(struct tegra_xudc *xudc)
 {
-	phy_exit(xudc->usb3_phy);
-	phy_exit(xudc->utmi_phy);
+	int i;
+
+	for (i = 0; i < xudc->soc->num_phys; i++) {
+		phy_exit(xudc->usb3_phy[i]);
+		phy_exit(xudc->utmi_phy[i]);
+	}
+}
+
+static int tegra_xudc_phy_init(struct tegra_xudc *xudc)
+{
+	int err, i;
+
+	for (i = 0; i < xudc->soc->num_phys; i++) {
+		err = phy_init(xudc->utmi_phy[i]);
+		if (err < 0) {
+			dev_err(xudc->dev, "utmi phy init failed: %d\n", err);
+			goto exit_phy;
+		}
+
+		err = phy_init(xudc->usb3_phy[i]);
+		if (err < 0) {
+			dev_err(xudc->dev, "usb3 phy init failed: %d\n", err);
+			goto exit_phy;
+		}
+	}
+	return 0;
+
+exit_phy:
+	tegra_xudc_phy_exit(xudc);
+	return err;
 }
 
 static const char * const tegra210_xudc_supply_names[] = {
@@ -3383,6 +3503,7 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.num_supplies = ARRAY_SIZE(tegra210_xudc_supply_names),
 	.clock_names = tegra210_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra210_xudc_clock_names),
+	.num_phys = 4,
 	.u1_enable = false,
 	.u2_enable = true,
 	.lpm_enable = false,
@@ -3395,6 +3516,7 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.clock_names = tegra186_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
+	.num_phys = 4,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = false,
@@ -3560,19 +3682,9 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 		goto put_padctl;
 	}
 
-	xudc->usb3_phy = devm_phy_optional_get(&pdev->dev, "usb3");
-	if (IS_ERR(xudc->usb3_phy)) {
-		err = PTR_ERR(xudc->usb3_phy);
-		dev_err(xudc->dev, "failed to get usb3 phy: %d\n", err);
-		goto disable_regulator;
-	}
-
-	xudc->utmi_phy = devm_phy_optional_get(&pdev->dev, "usb2");
-	if (IS_ERR(xudc->utmi_phy)) {
-		err = PTR_ERR(xudc->utmi_phy);
-		dev_err(xudc->dev, "failed to get usb2 phy: %d\n", err);
-		goto disable_regulator;
-	}
+	err = tegra_xudc_phy_get(xudc);
+		if (err)
+			goto disable_regulator;
 
 	err = tegra_xudc_powerdomain_init(xudc);
 	if (err)
@@ -3601,16 +3713,6 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&xudc->port_reset_war_work,
 				tegra_xudc_port_reset_war_work);
 
-	xudc->vbus_nb.notifier_call = tegra_xudc_vbus_notifier;
-	xudc->usbphy = devm_usb_get_phy_by_node(xudc->dev,
-						xudc->utmi_phy->dev.of_node,
-						&xudc->vbus_nb);
-	if (IS_ERR(xudc->usbphy)) {
-		err = PTR_ERR(xudc->usbphy);
-		dev_err(xudc->dev, "failed to get usbphy phy: %d\n", err);
-		goto free_eps;
-	}
-
 	pm_runtime_enable(&pdev->dev);
 
 	xudc->gadget.ops = &tegra_xudc_gadget_ops;
@@ -3645,6 +3747,7 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 static int tegra_xudc_remove(struct platform_device *pdev)
 {
 	struct tegra_xudc *xudc = platform_get_drvdata(pdev);
+	int i;
 
 	pm_runtime_get_sync(xudc->dev);
 
@@ -3660,8 +3763,10 @@ static int tegra_xudc_remove(struct platform_device *pdev)
 
 	regulator_bulk_disable(xudc->soc->num_supplies, xudc->supplies);
 
-	phy_power_off(xudc->utmi_phy);
-	phy_power_off(xudc->usb3_phy);
+	for (i = 0; i < xudc->soc->num_phys; i++) {
+		phy_power_off(xudc->utmi_phy[i]);
+		phy_power_off(xudc->usb3_phy[i]);
+	}
 
 	tegra_xudc_phy_exit(xudc);
 
-- 
2.7.4

