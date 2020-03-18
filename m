Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C94F189970
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2020 11:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgCRKcB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Mar 2020 06:32:01 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7094 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727800AbgCRKcA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Mar 2020 06:32:00 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e71f8910000>; Wed, 18 Mar 2020 03:31:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 18 Mar 2020 03:31:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 18 Mar 2020 03:31:58 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 10:31:58 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 18 Mar 2020 10:31:58 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e71f8990002>; Wed, 18 Mar 2020 03:31:57 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <kishon@ti.com>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <jckuo@nvidia.com>, Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V1 5/8] phy: tegra: xusb: Add soc ops API to enable UTMI PAD protection
Date:   Wed, 18 Mar 2020 16:01:04 +0530
Message-ID: <1584527467-8058-6-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584527467-8058-1-git-send-email-nkristam@nvidia.com>
References: <1584527467-8058-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584527505; bh=pY6qvJepwpU2bb/SniBNpFYzDjpr4moHCnxDbEyBKfk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=m6AYWv4vVTKPhDh1xjxqPjnGfjXaJC7VELyEa0GptwvzyfqDkKb0PYNM83K12994L
         wE+FCnQ0NXVlALk8U6q24fClox6hyfyAVsgMvz4J0y1pdq/q54s0oGk0g1vRXkiGpS
         TzxrZPh3KNxAw8exppAGJ8AAVs7oxWS1euPz1j60pGp0FE/InIEZX6X6ty4mz16Eas
         9Em0szhIk5fXiTdiyTrVFRpjEEe2Ff9DTKg3XD8BeNJrLEw1q9+VGW5EH6ueMC99Xy
         5OCrQtQxrWET4lXZPZDu9BQemosnHvuEcFyItg669/hBz43VOR5QIqPbkUo50mkPKE
         mvTFR6K/fLzOw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

AWhen USB charger is enabled, UTMI PAD needs to be protected according
to the direction and current level. Add support for the same on Tegra210
and Tegra186.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 40 +++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb-tegra210.c | 31 ++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h          | 13 +++++++++++++
 3 files changed, 84 insertions(+)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 18ed3d6..5d8f3229 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -68,6 +68,13 @@
 #define   PORTX_SPEED_SUPPORT_MASK		(0x3)
 #define     PORT_SPEED_SUPPORT_GEN1		(0x0)
 
+#define USB2_BATTERY_CHRG_OTGPADX_CTL1(x)       (0x84 + (x) * 0x40)
+#define  PD_VREG                                (1 << 6)
+#define  VREG_LEV(x)                            (((x) & 0x3) << 7)
+#define  VREG_DIR(x)                            (((x) & 0x3) << 11)
+#define  VREG_DIR_IN                            VREG_DIR(1)
+#define  VREG_DIR_OUT                           VREG_DIR(2)
+
 #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x)	(0x88 + (x) * 0x40)
 #define  HS_CURR_LEVEL(x)			((x) & 0x3f)
 #define  TERM_SEL				BIT(25)
@@ -289,6 +296,37 @@ static void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
 	usb2->powered_on = false;
 }
 
+static void tegra186_xusb_padctl_utmi_pad_set_protection_level(
+				struct tegra_xusb_port *port, int level,
+				enum tegra_vbus_dir dir)
+{
+	u32 value;
+	struct tegra_xusb_padctl *padctl = port->padctl;
+	unsigned int index = port->index;
+
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+
+	if (level < 0) {
+		/* disable pad protection */
+		value |= PD_VREG;
+		value &= ~VREG_LEV(~0);
+		value &= ~VREG_DIR(~0);
+	} else {
+		if (dir == TEGRA_VBUS_SOURCE)
+			value |= VREG_DIR_OUT;
+		else if (dir == TEGRA_VBUS_SINK)
+			value |= VREG_DIR_IN;
+
+		value &= ~PD_VREG;
+		value &= ~VREG_DIR(~0);
+		value &= ~VREG_LEV(~0);
+		value |= VREG_LEV(level);
+	}
+
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+}
+
+
 static int tegra186_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
 					       bool status)
 {
@@ -931,6 +969,8 @@ static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.vbus_override = tegra186_xusb_padctl_vbus_override,
 	.utmi_pad_power_on = tegra_phy_xusb_utmi_pad_power_on,
 	.utmi_pad_power_down = tegra_phy_xusb_utmi_pad_power_down,
+	.utmi_pad_set_protection_level =
+			tegra186_xusb_padctl_utmi_pad_set_protection_level,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 0841564..93517b1 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -74,6 +74,8 @@
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL 0x1
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18 (1 << 6)
+#define USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(x) (((x) & 0x3) << 7)
+#define USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_DIR(x) (((x) & 0x3) << 11)
 
 #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x) (0x088 + (x) * 0x40)
 #define XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD_ZI (1 << 29)
@@ -1116,6 +1118,33 @@ void tegra210_usb2_pad_power_down(struct phy *phy)
 	usb2->powered_on = false;
 }
 
+static void tegra210_xusb_padctl_utmi_pad_set_protection_level(
+				struct tegra_xusb_port *port, int level,
+				enum tegra_vbus_dir dir)
+{
+	u32 value;
+	struct tegra_xusb_padctl *padctl = port->padctl;
+	unsigned int index = port->index;
+
+	value = padctl_readl(padctl,
+			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+
+	if (level < 0) {
+		/* disable pad protection */
+		value |= XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
+		value &= USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(~0);
+		value &= ~USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_DIR(~0);
+	} else {
+		value &= ~XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
+		value &= ~USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_DIR(~0);
+		value &= USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(~0);
+		value |= USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(level);
+	}
+
+	padctl_writel(padctl, value,
+		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+}
+
 static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
 				      int submode)
 {
@@ -2286,6 +2315,8 @@ static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
 	.utmi_port_reset = tegra210_utmi_port_reset,
 	.utmi_pad_power_on = tegra210_usb2_pad_power_on,
 	.utmi_pad_power_down = tegra210_usb2_pad_power_down,
+	.utmi_pad_set_protection_level =
+			tegra210_xusb_padctl_utmi_pad_set_protection_level,
 };
 
 static const char * const tegra210_xusb_padctl_supply_names[] = {
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index ba5ee88..81dd01b 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -259,6 +259,17 @@ to_sata_pad(struct tegra_xusb_pad *pad)
  */
 struct tegra_xusb_port_ops;
 
+/*
+ * Tegra OTG port VBUS direction:
+ * default (based on port capability) or
+ * as source or sink
+ */
+enum tegra_vbus_dir {
+	TEGRA_VBUS_DEFAULT,
+	TEGRA_VBUS_SOURCE,
+	TEGRA_VBUS_SINK
+};
+
 struct tegra_xusb_port {
 	struct tegra_xusb_padctl *padctl;
 	struct tegra_xusb_lane *lane;
@@ -383,6 +394,8 @@ struct tegra_xusb_padctl_ops {
 	int (*utmi_port_reset)(struct phy *phy);
 	void (*utmi_pad_power_on)(struct phy *phy);
 	void (*utmi_pad_power_down)(struct phy *phy);
+	void (*utmi_pad_set_protection_level)(struct tegra_xusb_port *port,
+					int max_ua, enum tegra_vbus_dir dir);
 };
 
 struct tegra_xusb_padctl_soc {
-- 
2.7.4

