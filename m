Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAD660566
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 13:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728788AbfGELmI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 07:42:08 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14513 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728783AbfGELmI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Jul 2019 07:42:08 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1f378c0000>; Fri, 05 Jul 2019 04:42:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 05 Jul 2019 04:42:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 05 Jul 2019 04:42:06 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Jul
 2019 11:42:05 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 5 Jul 2019 11:42:05 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d1f378b0000>; Fri, 05 Jul 2019 04:42:05 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V5 3/8] phy: tegra: xusb: Add vbus override support on Tegra210
Date:   Fri, 5 Jul 2019 17:11:46 +0530
Message-ID: <1562326911-26855-4-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562326911-26855-1-git-send-email-nkristam@nvidia.com>
References: <1562326911-26855-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562326925; bh=RSwevXyTrAV4olJSX3IujgN3JLnD3f/vjUzu85VTsS0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=dlKnHcjgvU+nXmcHKeWeRF5V2+Ab+3ZVlynO2f2Wpz+tNbNnzwkSO0hnbzZrv4hJZ
         fbFiPhDScsb+/d6dGas7GvY9A0H5z8iZBCOu3zGcohCvysXVS0lCr3hNjUwQiTvsdu
         p8L4lPfAAJk6+PtMIxjNPE+RRHNIq1XLCEpekW+wtGGv6Me9L1DbzoOj78jXFX5IFS
         qk8rFnmL2r/GL5Ul/kUTGEsqU2MAyj/Jk2hCjwJZoI+viCvcH/wp9yaV3radFdJk4X
         F2c8416OoNbJOnjYK4QuCFdUkTVQghjofrOOOsN9WC42DN8vu0SgRs900mbouuUbvg
         twn07f+1qPBKA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tegra XUSB device control driver needs to control vbus override
during its operations, add API for the support.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 57 +++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.c          | 22 +++++++++++++++
 drivers/phy/tegra/xusb.h          |  2 ++
 include/linux/phy/tegra/xusb.h    |  4 ++-
 4 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 8c31f03..9e6f14b 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -65,6 +65,10 @@
 #define XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(x) (1 << (1 + (x)))
 #define XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(x) (1 << (8 + (x)))
 
+#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(x) (0x080 + (x) * 0x40)
+#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP (1 << 18)
+#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN (1 << 22)
+
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x40)
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
@@ -227,6 +231,12 @@
 #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(x) (0xa74 + (x) * 0x40)
 #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL 0xfcf01368
 
+#define XUSB_PADCTL_USB2_VBUS_ID 0xc60
+#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON (1 << 14)
+#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT 18
+#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK 0xf
+#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING 8
+
 struct tegra210_xusb_fuse_calibration {
 	u32 hs_curr_level[4];
 	u32 hs_term_range_adj;
@@ -2016,6 +2026,51 @@ static const struct tegra_xusb_port_ops tegra210_usb3_port_ops = {
 	.map = tegra210_usb3_port_map,
 };
 
+static int tegra210_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
+					      bool status)
+{
+	u32 value;
+
+	dev_dbg(padctl->dev, "%s vbus override\n", status ? "set" : "clear");
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS_ID);
+
+	if (status) {
+		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
+		value &= ~(XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK <<
+			   XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
+		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING <<
+			 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
+	} else
+		value &= ~XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
+
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_VBUS_ID);
+
+	return 0;
+}
+
+static int tegra210_utmi_port_reset(struct phy *phy)
+{
+	struct tegra_xusb_padctl *padctl;
+	struct tegra_xusb_lane *lane;
+	u32 value;
+
+	lane = phy_get_drvdata(phy);
+	padctl = lane->pad->padctl;
+
+	value = padctl_readl(padctl,
+		     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(lane->index));
+
+	if ((value & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP) ||
+	    (value & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN)) {
+		tegra210_xusb_padctl_vbus_override(padctl, false);
+		tegra210_xusb_padctl_vbus_override(padctl, true);
+		return 1;
+	}
+
+	return 0;
+}
+
 static int
 tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_fuse_calibration *fuse)
 {
@@ -2078,6 +2133,8 @@ static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
 	.remove = tegra210_xusb_padctl_remove,
 	.usb3_set_lfps_detect = tegra210_usb3_set_lfps_detect,
 	.hsic_set_idle = tegra210_hsic_set_idle,
+	.vbus_override = tegra210_xusb_padctl_vbus_override,
+	.utmi_port_reset = tegra210_utmi_port_reset,
 };
 
 static const char * const tegra210_xusb_padctl_supply_names[] = {
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index b4b217e..bf4b008 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1121,6 +1121,28 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
 }
 EXPORT_SYMBOL_GPL(tegra_xusb_padctl_usb3_set_lfps_detect);
 
+int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
+							bool val)
+{
+	if (padctl->soc->ops->vbus_override)
+		return padctl->soc->ops->vbus_override(padctl, val);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_set_vbus_override);
+
+int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+
+	if (padctl->soc->ops->utmi_port_reset)
+		return padctl->soc->ops->utmi_port_reset(phy);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_port_reset);
+
 MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
 MODULE_DESCRIPTION("Tegra XUSB Pad Controller driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index bd91832..da94fcc 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -373,6 +373,8 @@ struct tegra_xusb_padctl_ops {
 			     unsigned int index, bool idle);
 	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
 				    unsigned int index, bool enable);
+	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
+	int (*utmi_port_reset)(struct phy *phy);
 };
 
 struct tegra_xusb_padctl_soc {
diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
index ee59562..1235865 100644
--- a/include/linux/phy/tegra/xusb.h
+++ b/include/linux/phy/tegra/xusb.h
@@ -18,5 +18,7 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_padctl *padctl,
 				    unsigned int port, bool idle);
 int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
 					   unsigned int port, bool enable);
-
+int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
+					bool val);
+int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
 #endif /* PHY_TEGRA_XUSB_H */
-- 
2.7.4

