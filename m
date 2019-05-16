Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6961FFA9
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 08:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbfEPGkY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 02:40:24 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4920 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfEPGkX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 02:40:23 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdd05dc0002>; Wed, 15 May 2019 23:40:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 15 May 2019 23:40:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 15 May 2019 23:40:22 -0700
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 06:40:21 +0000
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 06:40:21 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 May 2019 06:40:21 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdd05d30002>; Wed, 15 May 2019 23:40:21 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 3/8] phy: tegra: xusb: t210: add vbus override support
Date:   Thu, 16 May 2019 12:09:27 +0530
Message-ID: <1557988772-15406-4-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557988829; bh=fwRlDQIHTB+pwmLeKGvEOwLrM7QycTjdbRneiKP3lEY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=BojHhKrTakudD09FVv19yShoTt3VZidgrK8ADqDVorHj9Lu7yYkV7FA7muLlOL/wi
         mm0FulEKWpy4AoMczBboZ7blq0TItA+SaL1olYlko+X1HnWsyAutBTH/qtWu9fs1Dl
         MG0BdtoeeQm8Va6L3PRRbn5pfRlJbfr9D/E1Zf8b2QknvemOWXl8cq1ktgZcz+RU4t
         tkVg1+SKJvhdJVSmVwwneJN10pOaNLhF29XfNORkgXDCoG7ZbpdpkzIaatkxFwhnfY
         MfkwBs0ad5kj+DMkhosxoQP35R2ZG9ldiFRk2tZX9gxH1xjFTxWWhTEuyBMe6x33O7
         j5BvOgf3bO9Xw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tegra XUSB device control driver needs to control vbus override
during its operations, add API for the support.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 59 +++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.c          | 22 +++++++++++++++
 drivers/phy/tegra/xusb.h          |  2 ++
 include/linux/phy/tegra/xusb.h    |  6 ++--
 4 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 829aca5..363d2aa 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -73,6 +73,10 @@
 #define XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(x) (1 << (1 + (x)))
 #define XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(x) (1 << (8 + (x)))
 
+#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(x) (0x080 + (x) * 0x40)
+#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP (1 << 18)
+#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN (1 << 22)
+
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x40)
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
@@ -235,6 +239,12 @@
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
@@ -2024,6 +2034,53 @@ static const struct tegra_xusb_port_ops tegra210_usb3_port_ops = {
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
+	struct device *dev;
+	u32 value;
+
+	lane = phy_get_drvdata(phy);
+	padctl = lane->pad->padctl;
+	dev = padctl->dev;
+
+	value = padctl_readl(padctl,
+			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(0));
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
@@ -2086,6 +2143,8 @@ static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
 	.remove = tegra210_xusb_padctl_remove,
 	.usb3_set_lfps_detect = tegra210_usb3_set_lfps_detect,
 	.hsic_set_idle = tegra210_hsic_set_idle,
+	.vbus_override = tegra210_xusb_padctl_vbus_override,
+	.utmi_port_reset = tegra210_utmi_port_reset,
 };
 
 const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc = {
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 6618db7..e333532 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1133,6 +1133,28 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
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
index 26dd6d2..cb22a70 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -381,6 +381,8 @@ struct tegra_xusb_padctl_ops {
 			     unsigned int index, bool idle);
 	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
 				    unsigned int index, bool enable);
+	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
+	int (*utmi_port_reset)(struct phy *phy);
 };
 
 struct tegra_xusb_padctl_soc {
diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
index 8e1a57a..9b8351c 100644
--- a/include/linux/phy/tegra/xusb.h
+++ b/include/linux/phy/tegra/xusb.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2016-2019, NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -26,5 +26,7 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_padctl *padctl,
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

