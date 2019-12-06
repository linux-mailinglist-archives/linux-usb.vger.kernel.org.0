Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 560A5114F45
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 11:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfLFKv7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 05:51:59 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18829 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfLFKv7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 05:51:59 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dea32bd0000>; Fri, 06 Dec 2019 02:51:41 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 06 Dec 2019 02:51:58 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 06 Dec 2019 02:51:58 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 10:51:58 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 6 Dec 2019 10:51:57 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.64.167]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dea32ca0002>; Fri, 06 Dec 2019 02:51:57 -0800
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH 09/18] usb: gadget: tegra-xudc: Remove usb-role-switch support
Date:   Fri, 6 Dec 2019 16:20:12 +0530
Message-ID: <1575629421-7039-10-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
References: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1575629501; bh=k+s3efeXSyA3EdApXkR5/cjkooHg+PgX6OkPfA93Sh4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=DnKOif6K9TZBbKrDYzVqYEEITB8T5H2lW5qsre/qQq0b2C9pp+l3+b6Pu4eIn3kzA
         N2zbJdLNnhqAmffzTUAJVFXQ8ILwDA6YY34bHsjwMZ9oQTONTc4mEI/E8DUgJ0ge6G
         vnR2B6mBtS9P4sJM6yBk4hy692HI97P8UqStFhyscvtPqAMmLtv34uRIYk5a9Abmlt
         f0yneGx6PxpypVWjsDg/sz8BSypy7XhrYFsSEhh3zJLXe16rS/U9TI+t+7xxokgn3m
         nMmgzAR9mupd3kAGR87kHhOKjlU/H/efIN7FOjG4VDbgAO8HsGLrznZzzORKHhiq/q
         INIlpu1S7zvlA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Padctl driver will act as a central driver to receive USB role changes via
usb-role-switch. This is updated to corresponding host, device drivers.
Hence remove usb-role-switch from XUDC driver.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 65 ++++++++++---------------------------
 1 file changed, 17 insertions(+), 48 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 634c2c1..6ddb974 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -477,8 +477,8 @@ struct tegra_xudc {
 
 	struct clk_bulk_data *clks;
 
-	enum usb_role device_mode;
-	struct usb_role_switch *usb_role_sw;
+	enum usb_role role;
+	bool device_mode;
 	struct work_struct usb_role_sw_work;
 
 	struct phy *usb3_phy;
@@ -596,6 +596,8 @@ static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 {
 	int err;
 
+	if (xudc->device_mode)
+		return;
 	pm_runtime_get_sync(xudc->dev);
 
 	err = phy_power_on(xudc->utmi_phy);
@@ -610,7 +612,8 @@ static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 
 	tegra_xusb_padctl_set_vbus_override(xudc->padctl, true);
 
-	xudc->device_mode = USB_ROLE_DEVICE;
+	xudc->device_mode = true;
+
 }
 
 static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
@@ -619,6 +622,9 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 	u32 pls, val;
 	int err;
 
+	if (!xudc->device_mode)
+		return;
+
 	dev_dbg(xudc->dev, "device mode off\n");
 
 	connected = !!(xudc_readl(xudc, PORTSC) & PORTSC_CCS);
@@ -643,7 +649,7 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 		xudc_writel(xudc, val, PORTSC);
 	}
 
-	xudc->device_mode = USB_ROLE_NONE;
+	xudc->device_mode = false;
 
 	/* Wait for disconnect event. */
 	if (connected)
@@ -668,31 +674,13 @@ static void tegra_xudc_usb_role_sw_work(struct work_struct *work)
 	struct tegra_xudc *xudc = container_of(work, struct tegra_xudc,
 					       usb_role_sw_work);
 
-	if (!xudc->usb_role_sw ||
-		usb_role_switch_get_role(xudc->usb_role_sw) == USB_ROLE_DEVICE)
+	if (xudc->role == USB_ROLE_DEVICE)
 		tegra_xudc_device_mode_on(xudc);
 	else
 		tegra_xudc_device_mode_off(xudc);
 
 }
 
-static int tegra_xudc_usb_role_sw_set(struct device *dev, enum usb_role role)
-{
-	struct tegra_xudc *xudc = dev_get_drvdata(dev);
-	unsigned long flags;
-
-	dev_dbg(dev, "%s role is %d\n", __func__, role);
-
-	spin_lock_irqsave(&xudc->lock, flags);
-
-	if (!xudc->suspended)
-		schedule_work(&xudc->usb_role_sw_work);
-
-	spin_unlock_irqrestore(&xudc->lock, flags);
-
-	return 0;
-}
-
 static void tegra_xudc_plc_reset_work(struct work_struct *work)
 {
 	struct delayed_work *dwork = to_delayed_work(work);
@@ -729,8 +717,7 @@ static void tegra_xudc_port_reset_war_work(struct work_struct *work)
 
 	spin_lock_irqsave(&xudc->lock, flags);
 
-	if ((xudc->device_mode == USB_ROLE_DEVICE)
-			      && xudc->wait_for_sec_prc) {
+	if (xudc->device_mode && xudc->wait_for_sec_prc) {
 		pls = (xudc_readl(xudc, PORTSC) & PORTSC_PLS_MASK) >>
 			PORTSC_PLS_SHIFT;
 		dev_dbg(xudc->dev, "pls = %x\n", pls);
@@ -3457,7 +3444,6 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 {
 	struct tegra_xudc *xudc;
 	struct resource *res;
-	struct usb_role_switch_desc role_sx_desc = { 0 };
 	unsigned int i;
 	int err;
 
@@ -3587,23 +3573,10 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&xudc->port_reset_war_work,
 				tegra_xudc_port_reset_war_work);
 
-	if (of_property_read_bool(xudc->dev->of_node, "usb-role-switch")) {
-		role_sx_desc.set = tegra_xudc_usb_role_sw_set;
-		role_sx_desc.fwnode = dev_fwnode(xudc->dev);
-
-		xudc->usb_role_sw = usb_role_switch_register(xudc->dev,
-							&role_sx_desc);
-		if (IS_ERR(xudc->usb_role_sw)) {
-			err = PTR_ERR(xudc->usb_role_sw);
-			dev_err(xudc->dev, "Failed to register USB role SW: %d",
-					   err);
-			goto free_eps;
-		}
-	} else {
-		/* Set the mode as device mode and this keeps phy always ON */
-		dev_info(xudc->dev, "Set usb role to device mode always");
-		schedule_work(&xudc->usb_role_sw_work);
-	}
+	/* Set the mode as device mode and this keeps phy always ON */
+	dev_info(xudc->dev, "Set usb role to device mode always");
+	xudc->role = USB_ROLE_DEVICE;
+	schedule_work(&xudc->usb_role_sw_work);
 
 	pm_runtime_enable(&pdev->dev);
 
@@ -3643,11 +3616,7 @@ static int tegra_xudc_remove(struct platform_device *pdev)
 	pm_runtime_get_sync(xudc->dev);
 
 	cancel_delayed_work(&xudc->plc_reset_work);
-
-	if (xudc->usb_role_sw) {
-		usb_role_switch_unregister(xudc->usb_role_sw);
-		cancel_work_sync(&xudc->usb_role_sw_work);
-	}
+	cancel_work_sync(&xudc->usb_role_sw_work);
 
 	usb_del_gadget_udc(&xudc->gadget);
 
-- 
2.7.4

