Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9126157054
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 09:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbgBJIMg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 03:12:36 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:3653 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgBJIMf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 03:12:35 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4110330000>; Mon, 10 Feb 2020 00:11:31 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Feb 2020 00:12:33 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Feb 2020 00:12:33 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 08:12:33 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 10 Feb 2020 08:12:33 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e41106d0000>; Mon, 10 Feb 2020 00:12:32 -0800
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V5 03/21] phy: tegra: xusb: Add usb-role-switch support
Date:   Mon, 10 Feb 2020 13:41:29 +0530
Message-ID: <1581322307-11140-4-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581322291; bh=Ws5oWFOv3YkTqsJ+DYlxCW+4SJ5Mja+XN/GFeLkJ48I=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=FOszr1d3R2aXb3KJtX/RZcTVaotwfhYyiUdhX2dhWwfqyFyyjdY4ZJDFzfIWPG1nk
         pWEj76OgDAxhRwjSxCamSrWS+HqGkclawYzDiBFkrtrF0Z75vuRwC7cjd/Edytl07g
         8Vr9mbzZ7Mxk9GLMjLxnJNRnvha7XWLZvvZEO2JmT/DBnVPg0B4sQbjb3fpS5eXoPg
         3Ei9etauCjcA5Ggw/xjntglv6KlG29azrLATtOxEE1LjvUdxbqzya89EPE+qDOPD0X
         Z/kTncCDTMzKKO+BEK+gXIH9alshjwTV410rK8ahwKUEbrJc89qN33Qv4O+FCAdhXJ
         XzbbYmV3IW3+Q==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If usb-role-switch property is present in USB 2 port, register
usb-role-switch to receive usb role changes.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V5
 - No changes
---
V4:
 - Updated function name in debug messages as suggested by Thierry.
 - Added owner info to port->dev during USB role switch registration.
---
V3:
 - Driver aborts if usb-role-switch is not added in dt forotg/peripheral
   roles.
 - Added role name strings instead of enum values in debug prints.
 - Updated arguments and variable allignments as per Thierry inputs.
---
V2:
 - Removed dev_set_drvdata for port->dev.
 - Added of_platform_depopulate during error handling and driver removal.
---
 drivers/phy/tegra/Kconfig |  1 +
 drivers/phy/tegra/xusb.c  | 67 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h  |  3 +++
 3 files changed, 71 insertions(+)

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index f9817c3..df07c4d 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -2,6 +2,7 @@
 config PHY_TEGRA_XUSB
 	tristate "NVIDIA Tegra XUSB pad controller driver"
 	depends on ARCH_TEGRA
+	select USB_CONN_GPIO
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
 
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index f98ec39..0fdbaa2 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -541,6 +541,11 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
 
 static void tegra_xusb_port_unregister(struct tegra_xusb_port *port)
 {
+	if (!IS_ERR_OR_NULL(port->usb_role_sw)) {
+		of_platform_depopulate(&port->dev);
+		usb_role_switch_unregister(port->usb_role_sw);
+	}
+
 	device_unregister(&port->dev);
 }
 
@@ -551,11 +556,59 @@ static const char *const modes[] = {
 	[USB_DR_MODE_OTG] = "otg",
 };
 
+static const char * const usb_roles[] = {
+	[USB_ROLE_NONE]		= "none",
+	[USB_ROLE_HOST]		= "host",
+	[USB_ROLE_DEVICE]	= "device",
+};
+
+static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role role)
+{
+	dev_dbg(dev, "%s(): role %s\n", __func__, usb_roles[role]);
+
+	return 0;
+}
+
+static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
+{
+	struct usb_role_switch_desc role_sx_desc = {
+		.fwnode = dev_fwnode(&port->dev),
+		.set = tegra_xusb_role_sw_set,
+	};
+	int err = 0;
+
+	/*
+	 * USB role switch driver needs parent driver owner info. This is a
+	 * suboptimal solution. TODO: Need to revisit this in a follow-up patch
+	 * where an optimal solution is possible with changes to USB role
+	 * switch driver.
+	 */
+	port->dev.driver = devm_kzalloc(&port->dev,
+					sizeof(struct device_driver),
+					GFP_KERNEL);
+	port->dev.driver->owner	 = THIS_MODULE;
+
+	port->usb_role_sw = usb_role_switch_register(&port->dev,
+						     &role_sx_desc);
+	if (IS_ERR(port->usb_role_sw)) {
+		err = PTR_ERR(port->usb_role_sw);
+		dev_err(&port->dev, "failed to register USB role switch: %d",
+			err);
+		return err;
+	}
+
+	/* populate connector entry */
+	of_platform_populate(port->dev.of_node, NULL, NULL, &port->dev);
+
+	return err;
+}
+
 static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
 {
 	struct tegra_xusb_port *port = &usb2->base;
 	struct device_node *np = port->dev.of_node;
 	const char *mode;
+	int err;
 
 	usb2->internal = of_property_read_bool(np, "nvidia,internal");
 
@@ -572,6 +625,20 @@ static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
 		usb2->mode = USB_DR_MODE_HOST;
 	}
 
+	/* usb-role-switch property is mandatory for OTG/Peripheral modes */
+	if (usb2->mode == USB_DR_MODE_PERIPHERAL ||
+	    usb2->mode == USB_DR_MODE_OTG) {
+		if (of_property_read_bool(np, "usb-role-switch")) {
+			err = tegra_xusb_setup_usb_role_switch(port);
+			if (err < 0)
+				return err;
+		} else {
+			dev_err(&port->dev, "usb-role-switch not found for %s mode",
+				modes[usb2->mode]);
+			return -EINVAL;
+		}
+	}
+
 	usb2->supply = devm_regulator_get(&port->dev, "vbus");
 	return PTR_ERR_OR_ZERO(usb2->supply);
 }
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index da94fcc..9f27899 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -12,6 +12,7 @@
 #include <linux/workqueue.h>
 
 #include <linux/usb/otg.h>
+#include <linux/usb/role.h>
 
 /* legacy entry points for backwards-compatibility */
 int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev);
@@ -266,6 +267,8 @@ struct tegra_xusb_port {
 	struct list_head list;
 	struct device dev;
 
+	struct usb_role_switch *usb_role_sw;
+
 	const struct tegra_xusb_port_ops *ops;
 };
 
-- 
2.7.4

