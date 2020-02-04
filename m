Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 686AB151980
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 12:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgBDLTK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Feb 2020 06:19:10 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:19196 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgBDLTJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Feb 2020 06:19:09 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3953150001>; Tue, 04 Feb 2020 03:18:45 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 04 Feb 2020 03:19:08 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 04 Feb 2020 03:19:08 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 11:19:07 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 4 Feb 2020 11:19:07 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e3953280002>; Tue, 04 Feb 2020 03:19:07 -0800
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V4 04/19] phy: tegra: xusb: Add usb-phy support
Date:   Tue, 4 Feb 2020 16:46:50 +0530
Message-ID: <1580815025-10915-5-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580815025-10915-1-git-send-email-nkristam@nvidia.com>
References: <1580815025-10915-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580815125; bh=zKTeyFUNsRn96F6Uc0UkINYhSSylKTEGSVBcsXNNV5U=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=AZ5H0GfwA3S0VL1T5w3/PauZ7CyJ3qwPb4p80GzwgkI5Cl4L1G720q5iH3iDkK3pB
         gM1JooemJQPX0sS52nONL1ABYAEIctolEvR6iV9hkyCmhNtKXQ9ZEJI7DlUk1dEIo+
         gs23y2jM/4EtFQDNj/9W+RctaPLYsmXgm4FcZJTGHIUIjy90ce5f6HfoNNcy2O/V9J
         smhwC7W/Jzt4kKL8Kr6scYzE0SWLpPs4ldA/05hQqe/yBZPiS/zX7w9wGBehqWc5FK
         mERFSsLvHXEBTSKPAVoiZ9Yx8Ntus/YUykpNIO5TWlUOaFMfFBkVsndD8uNtUY6dt+
         J3nITupw6S1iA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For USB 2 ports that has usb-role-switch enabled, add usb-phy for
corresponding USB 2 phy. USB role changes from role switch are then
updated to corresponding host and device mode drivers via usb-phy notifier
block.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V4:
 - Addressed nit comments from Thierry.
 - usb_phy_event is set accoring to received usb_role.
 - Added Acked-by info.
V3:
 - Updated arguments and variable allignments as per Thierry inputs.
---
V2:
 - Added dev_set_drvdata for port->dev.
---
 drivers/phy/tegra/xusb.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h |  2 ++
 2 files changed, 86 insertions(+)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 0fdbaa2..2c0e29c 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -532,6 +532,8 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
 	if (err < 0)
 		goto unregister;
 
+	dev_set_drvdata(&port->dev, port);
+
 	return 0;
 
 unregister:
@@ -544,6 +546,8 @@ static void tegra_xusb_port_unregister(struct tegra_xusb_port *port)
 	if (!IS_ERR_OR_NULL(port->usb_role_sw)) {
 		of_platform_depopulate(&port->dev);
 		usb_role_switch_unregister(port->usb_role_sw);
+		cancel_work_sync(&port->usb_phy_work);
+		usb_remove_phy(&port->usb_phy);
 	}
 
 	device_unregister(&port->dev);
@@ -562,15 +566,70 @@ static const char * const usb_roles[] = {
 	[USB_ROLE_DEVICE]	= "device",
 };
 
+static enum usb_phy_events to_usb_phy_event(enum usb_role role)
+{
+	switch (role) {
+	case USB_ROLE_DEVICE: return USB_EVENT_VBUS;
+	case USB_ROLE_HOST: return USB_EVENT_ID;
+	default: return USB_EVENT_NONE;
+	}
+}
+
+static void tegra_xusb_usb_phy_work(struct work_struct *work)
+{
+	struct tegra_xusb_port *port = container_of(work,
+						    struct tegra_xusb_port,
+						    usb_phy_work);
+	enum usb_role role = usb_role_switch_get_role(port->usb_role_sw);
+
+	usb_phy_set_event(&port->usb_phy, to_usb_phy_event(role));
+
+	dev_dbg(&port->dev, "%s(): calling notifier for role %s\n", __func__,
+		usb_roles[role]);
+
+	atomic_notifier_call_chain(&port->usb_phy.notifier, 0, &port->usb_phy);
+}
+
 static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role role)
 {
+	struct tegra_xusb_port *port = dev_get_drvdata(dev);
+
 	dev_dbg(dev, "%s(): role %s\n", __func__, usb_roles[role]);
 
+	schedule_work(&port->usb_phy_work);
+
+	return 0;
+}
+
+static int tegra_xusb_set_peripheral(struct usb_otg *otg,
+				     struct usb_gadget *gadget)
+{
+	struct tegra_xusb_port *port = container_of(otg->usb_phy,
+						    struct tegra_xusb_port,
+						    usb_phy);
+
+	if (gadget != NULL)
+		schedule_work(&port->usb_phy_work);
+
 	return 0;
 }
 
+static int tegra_xusb_set_host(struct usb_otg *otg, struct usb_bus *host)
+{
+	struct tegra_xusb_port *port = container_of(otg->usb_phy,
+						    struct tegra_xusb_port,
+						    usb_phy);
+
+	if (host != NULL)
+		schedule_work(&port->usb_phy_work);
+
+	return 0;
+}
+
+
 static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
 {
+	struct tegra_xusb_lane *lane;
 	struct usb_role_switch_desc role_sx_desc = {
 		.fwnode = dev_fwnode(&port->dev),
 		.set = tegra_xusb_role_sw_set,
@@ -597,6 +656,31 @@ static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
 		return err;
 	}
 
+	INIT_WORK(&port->usb_phy_work, tegra_xusb_usb_phy_work);
+
+	port->usb_phy.otg = devm_kzalloc(&port->dev, sizeof(struct usb_otg),
+					 GFP_KERNEL);
+	if (!port->usb_phy.otg)
+		return -ENOMEM;
+
+	lane = tegra_xusb_find_lane(port->padctl, "usb2", port->index);
+
+	/*
+	 * Assign phy dev to usb-phy dev. Host/device drivers can use phy
+	 * reference to retrieve usb-phy details.
+	 */
+	port->usb_phy.dev = &lane->pad->lanes[port->index]->dev;
+	port->usb_phy.dev->driver = port->padctl->dev->driver;
+	port->usb_phy.otg->usb_phy = &port->usb_phy;
+	port->usb_phy.otg->set_peripheral = tegra_xusb_set_peripheral;
+	port->usb_phy.otg->set_host = tegra_xusb_set_host;
+
+	err = usb_add_phy_dev(&port->usb_phy);
+	if (err < 0) {
+		dev_err(&port->dev, "Failed to add USB PHY: %d\n", err);
+		return err;
+	}
+
 	/* populate connector entry */
 	of_platform_populate(port->dev.of_node, NULL, NULL, &port->dev);
 
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 9f27899..2345657 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -268,6 +268,8 @@ struct tegra_xusb_port {
 	struct device dev;
 
 	struct usb_role_switch *usb_role_sw;
+	struct work_struct usb_phy_work;
+	struct usb_phy usb_phy;
 
 	const struct tegra_xusb_port_ops *ops;
 };
-- 
2.7.4

