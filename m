Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 378751A9673
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 10:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894558AbgDOI2u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 04:28:50 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4454 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894481AbgDOI1K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Apr 2020 04:27:10 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e96c4980000>; Wed, 15 Apr 2020 01:23:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 15 Apr 2020 01:25:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 15 Apr 2020 01:25:42 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 08:25:41 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Apr 2020 08:25:41 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e96c5010002>; Wed, 15 Apr 2020 01:25:40 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V2 6/8] phy: tegra: xusb: Add support for charger detect
Date:   Wed, 15 Apr 2020 13:55:06 +0530
Message-ID: <1586939108-10075-7-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586939032; bh=fzRzTvCVK3zQgga98rvTRBlhCxtbdz/QlhV06FzfVXs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=o2cG1vCACzzkDVZM3rCnujnc/HFiavjyn6qsjNZZHttwwYvng32OZQxuqZdXiTiOZ
         M/K8KAV2QauqbcB1ymTpCh52Ai4KcG+5c44/aiMpac1YH7F85+UlRapPGPGpEPBu6U
         xkVllueU/PhNjyi7RKrKoogPYZ7vFsuRHSGCcHhavXgBLmd1Yky+y0vF9PwC9ziLgA
         iQxfnaWOOQ/wEcRCFqloHVVPGJUqM2i3M5qmIdoHaxu8kNUu/yPRIpxHs6tKeJ+55t
         i5uZh8I6ertkIziXSLUeA2Wk71bzAo4/lW3C4MpRh+iIBXyInqhCb8N2VGweJOoEjV
         lUyrgob3Vfxlg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Perform charger-detect operation if corresponding dt property is enabled.
Update usb-phy with the detected charger state and max current values.
Register charger-detect API's of usb-phy to provide needed functionalities.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V2:
 - Patch re-based.
---
 drivers/phy/tegra/Makefile        |   2 +-
 drivers/phy/tegra/xusb-tegra-cd.c | 300 ++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.c          |  80 ++++++++++
 drivers/phy/tegra/xusb.h          |   7 +
 4 files changed, 388 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/tegra/xusb-tegra-cd.c

diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
index 89b8406..25ea9a9 100644
--- a/drivers/phy/tegra/Makefile
+++ b/drivers/phy/tegra/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_PHY_TEGRA_XUSB) += phy-tegra-xusb.o
 
-phy-tegra-xusb-y += xusb.o
+phy-tegra-xusb-y += xusb.o xusb-tegra-cd.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_124_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
diff --git a/drivers/phy/tegra/xusb-tegra-cd.c b/drivers/phy/tegra/xusb-tegra-cd.c
new file mode 100644
index 0000000..0fafc68
--- /dev/null
+++ b/drivers/phy/tegra/xusb-tegra-cd.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+
+#include "xusb.h"
+
+/* Data contact detection timeout */
+#define TDCD_TIMEOUT_MS                         400
+
+#define USB2_BATTERY_CHRG_OTGPADX_CTL0(x)       (0x80 + (x) * 0x40)
+#define  PD_CHG                                 (1 << 0)
+#define  VDCD_DET_FILTER_EN                     (1 << 4)
+#define  VDAT_DET                               (1 << 5)
+#define  VDAT_DET_FILTER_EN                     (1 << 8)
+#define  OP_SINK_EN                             (1 << 9)
+#define  OP_SRC_EN                              (1 << 10)
+#define  ON_SINK_EN                             (1 << 11)
+#define  ON_SRC_EN                              (1 << 12)
+#define  OP_I_SRC_EN                            (1 << 13)
+#define  ZIP_FILTER_EN                          (1 << 21)
+#define  ZIN_FILTER_EN                          (1 << 25)
+#define  DCD_DETECTED                           (1 << 26)
+
+#define USB2_BATTERY_CHRG_OTGPADX_CTL1(x)       (0x84 + (x) * 0x40)
+#define  PD_VREG                                (1 << 6)
+#define  VREG_LEV(x)                            (((x) & 0x3) << 7)
+#define  VREG_DIR(x)                            (((x) & 0x3) << 11)
+#define  VREG_DIR_IN                            VREG_DIR(1)
+#define  VREG_DIR_OUT                           VREG_DIR(2)
+#define  USBOP_RPD_OVRD                         (1 << 16)
+#define  USBOP_RPD_OVRD_VAL                     (1 << 17)
+#define  USBOP_RPU_OVRD                         (1 << 18)
+#define  USBOP_RPU_OVRD_VAL                     (1 << 19)
+#define  USBON_RPD_OVRD                         (1 << 20)
+#define  USBON_RPD_OVRD_VAL                     (1 << 21)
+#define  USBON_RPU_OVRD                         (1 << 22)
+#define  USBON_RPU_OVRD_VAL                     (1 << 23)
+
+#define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x)	(0x88 + (x) * 0x40)
+#define  USB2_OTG_PD2                           (1 << 27)
+#define  USB2_OTG_PD2_OVRD_EN                   (1 << 28)
+#define  USB2_OTG_PD_ZI                         (1 << 29)
+
+#define XUSB_PADCTL_USB2_BATTERY_CHRG_TDCD_DBNC_TIMER_0 (0x280)
+#define   TDCD_DBNC(x)                          (((x) & 0x7ff) << 0)
+
+static void tegra_xusb_padctl_set_debounce_time(
+				struct tegra_xusb_padctl *padctl, u32 val)
+{
+	u32 value;
+
+	value = padctl_readl(padctl,
+		XUSB_PADCTL_USB2_BATTERY_CHRG_TDCD_DBNC_TIMER_0);
+	value &= ~(TDCD_DBNC(0));
+	value |= TDCD_DBNC(val);
+	padctl_writel(padctl, value,
+		XUSB_PADCTL_USB2_BATTERY_CHRG_TDCD_DBNC_TIMER_0);
+}
+
+static void tegra_xusb_padctl_utmi_pad_charger_detect_on(
+				struct tegra_xusb_padctl *padctl, u32 index)
+{
+	u32 value;
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+	value &= ~USB2_OTG_PD_ZI;
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+	value |= (USB2_OTG_PD2 | USB2_OTG_PD2_OVRD_EN);
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	value &= ~PD_CHG;
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+
+	/* Set DP/DN Pull up/down to zero by default */
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+	value &= ~(USBOP_RPD_OVRD_VAL | USBOP_RPU_OVRD_VAL |
+		USBON_RPD_OVRD_VAL | USBON_RPU_OVRD_VAL);
+	value |= (USBOP_RPD_OVRD | USBOP_RPU_OVRD |
+		USBON_RPD_OVRD | USBON_RPU_OVRD);
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+
+	/* Disable DP/DN as src/sink */
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	value &= ~(OP_SRC_EN | ON_SINK_EN |
+	ON_SRC_EN | OP_SINK_EN);
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+}
+
+static void tegra_xusb_padctl_utmi_pad_charger_detect_off(
+				struct tegra_xusb_padctl *padctl, u32 index)
+{
+	u32 value;
+
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+	value &= ~(USBOP_RPD_OVRD | USBOP_RPU_OVRD |
+		 USBON_RPD_OVRD | USBON_RPU_OVRD);
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+
+	/* power down necessary stuff */
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	value |= PD_CHG;
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+	value &= ~(USB2_OTG_PD2 | USB2_OTG_PD2_OVRD_EN);
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+}
+
+
+static void tegra_xusb_padctl_detect_filters(
+				struct tegra_xusb_padctl *padctl, u32 index,
+				bool on)
+{
+	u32 value;
+
+	if (on) {
+		value = padctl_readl(padctl,
+				     USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+		value |= (VDCD_DET_FILTER_EN | VDAT_DET_FILTER_EN |
+			  ZIP_FILTER_EN | ZIN_FILTER_EN);
+		padctl_writel(padctl, value,
+			      USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	} else {
+		value = padctl_readl(padctl,
+				     USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+		value &= ~(VDCD_DET_FILTER_EN | VDAT_DET_FILTER_EN |
+			   ZIP_FILTER_EN | ZIN_FILTER_EN);
+		padctl_writel(padctl, value,
+			      USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	}
+}
+
+static void tegra_xusb_padctl_utmi_pad_dcd(struct tegra_xusb_padctl *padctl,
+					      u32 index)
+{
+	u32 value;
+	int dcd_timeout_ms = 0;
+	bool ret = false;
+
+	/* Turn on IDP_SRC */
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	value |= OP_I_SRC_EN;
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+
+	/* Turn on D- pull-down resistor */
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+	value |= USBON_RPD_OVRD_VAL;
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+
+	/* Wait for TDCD_DBNC */
+	usleep_range(10000, 120000);
+
+	while (dcd_timeout_ms < TDCD_TIMEOUT_MS) {
+		value = padctl_readl(padctl,
+				     USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+		if (value & DCD_DETECTED) {
+			dev_dbg(padctl->dev, "USB2 port %d DCD successful\n",
+				index);
+			ret = true;
+			break;
+		}
+
+		usleep_range(20000, 22000);
+		dcd_timeout_ms += 22;
+	}
+
+	if (!ret)
+		dev_info(padctl->dev, "%s: DCD timeout %d ms\n", __func__,
+			 dcd_timeout_ms);
+
+	/* Turn off IP_SRC, clear DCD DETECTED*/
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	value &= ~OP_I_SRC_EN;
+	value |= DCD_DETECTED;
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+
+	/* Turn off D- pull-down resistor */
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+	value &= ~USBON_RPD_OVRD_VAL;
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+
+	dev_dbg(padctl->dev, "DCD: %d\n", ret);
+}
+
+static bool tegra_xusb_padctl_utmi_pad_primary_charger_detect(
+				struct tegra_xusb_padctl *padctl, u32 index)
+{
+	u32 value;
+	int ret = false;
+
+	/* data contact detection */
+	tegra_xusb_padctl_utmi_pad_dcd(padctl, index);
+
+	/* Source D+ to D- */
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	value |= OP_SRC_EN | ON_SINK_EN;
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+
+	/* Wait for TVDPSRC_ON */
+	msleep(40);
+
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	ret = !!(value & VDAT_DET);
+
+	/* Turn off OP_SRC, ON_SINK, clear VDAT, ZIN status change */
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	value &= ~(OP_SRC_EN | ON_SINK_EN);
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+
+	return ret;
+}
+
+static bool tegra_xusb_padctl_utmi_pad_secondary_charger_detect(
+				struct tegra_xusb_padctl *padctl, u32 index)
+{
+	u32 value;
+	bool ret = false;
+
+	/* Source D- to D+ */
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	value |= ON_SRC_EN | OP_SINK_EN;
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+
+	/* Wait for TVDPSRC_ON */
+	msleep(40);
+
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	ret = !(value & VDAT_DET);
+
+	/* Turn off ON_SRC, OP_SINK, clear VDAT, ZIP status change */
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+	value &= ~(ON_SRC_EN | OP_SINK_EN);
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL0(index));
+
+	return ret;
+}
+
+enum usb_charger_type tegra_xusb_padctl_charger_detect(
+					  struct tegra_xusb_port *port)
+{
+	struct tegra_xusb_padctl *padctl = port->padctl;
+	struct phy *phy = port->lane->pad->lanes[port->index];
+	struct tegra_xusb_usb2_lane *usb2 = to_usb2_lane(port->lane);
+	u32 index = port->index;
+	enum usb_charger_type chrg_type;
+	bool pad_power_off = false;
+
+	mutex_lock(&padctl->lock);
+
+	if (!usb2->powered_on) {
+		padctl->soc->ops->utmi_pad_power_on(phy);
+		pad_power_off = true;
+	}
+
+	tegra_xusb_padctl_utmi_pad_charger_detect_on(padctl, index);
+	tegra_xusb_padctl_set_debounce_time(padctl, 0xa);
+	tegra_xusb_padctl_detect_filters(padctl, index, true);
+
+	if (tegra_xusb_padctl_utmi_pad_primary_charger_detect(padctl,
+								 index)) {
+		/*
+		 * wait 20ms (max of TVDMSRC_DIS) for D- to be disabled
+		 * from host side, before we perform secondary detection.
+		 * Some hosts may not respond well if we do secondary
+		 * detection right after primary detection.
+		 */
+		msleep(20);
+		if (tegra_xusb_padctl_utmi_pad_secondary_charger_detect(padctl,
+									index))
+			chrg_type = CDP_TYPE;
+		else
+			chrg_type = DCP_TYPE;
+	} else {
+		chrg_type = SDP_TYPE;
+	}
+
+	dev_dbg(&port->dev, "charger detected of type %d", chrg_type);
+
+	tegra_xusb_padctl_detect_filters(padctl, index, false);
+	tegra_xusb_padctl_utmi_pad_charger_detect_off(padctl, index);
+
+	if (pad_power_off)
+		padctl->soc->ops->utmi_pad_power_down(phy);
+
+	mutex_unlock(&padctl->lock);
+	return chrg_type;
+}
+
+MODULE_AUTHOR("Nagarjuna Kristam <nkristam@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra186 XUSB charger detect driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index de4a46f..e505ac4 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -591,6 +591,50 @@ static enum usb_phy_events to_usb_phy_event(enum usb_role role)
 	}
 }
 
+#define VON_DIV2P0_DET BIT(0)
+#define VON_DIV2P7_DET BIT(1)
+#define VOP_DIV2P0_DET BIT(2)
+#define VOP_DIV2P7_DET BIT(3)
+
+#define VREG_CUR_LEVEL_0        500
+#define VREG_CUR_LEVEL_1        900
+#define VREG_CUR_LEVEL_2        1500
+#define VREG_CUR_LEVEL_3        2000
+
+#define IS_CUR_IN_RANGE(ma, low, high)  \
+	((ma >= VREG_CUR_LEVEL_##low) && (ma <= (VREG_CUR_LEVEL_##high - 1)))
+#define VREG_LVL(ma, level)     IS_CUR_IN_RANGE(ma, level, level + 1)
+
+static void tegra_xusb_padctl_vbus_pad_portection(struct tegra_xusb_port *port)
+{
+	struct tegra_xusb_padctl *padctl = port->padctl;
+	int level = 0;
+	enum tegra_vbus_dir dir = TEGRA_VBUS_SINK;
+	int max_ua, min_ua;
+
+	if (!padctl->soc->ops->utmi_pad_set_protection_level)
+		return;
+
+	usb_phy_get_charger_current(&port->usb_phy, &min_ua, &max_ua);
+
+	if (max_ua == 0) {
+		level = -1;
+		dir = TEGRA_VBUS_DEFAULT;
+	} else if (VREG_LVL(max_ua, 0)) {
+		level = 0;
+	} else if (VREG_LVL(max_ua, 1)) {
+		level = 1;
+	} else if (VREG_LVL(max_ua, 2)) {
+		level = 2;
+	} else if (max_ua >= VREG_CUR_LEVEL_3) {
+		level = 3;
+	} else {
+		return;
+	}
+
+	padctl->soc->ops->utmi_pad_set_protection_level(port, max_ua, dir);
+}
+
 static void tegra_xusb_usb_phy_work(struct work_struct *work)
 {
 	struct tegra_xusb_port *port = container_of(work,
@@ -598,6 +642,10 @@ static void tegra_xusb_usb_phy_work(struct work_struct *work)
 						    usb_phy_work);
 	enum usb_role role = usb_role_switch_get_role(port->usb_role_sw);
 
+	/* Set role to none, if charger is DCP type */
+	if (port->chrg_type == DCP_TYPE)
+		role = USB_ROLE_NONE;
+
 	usb_phy_set_event(&port->usb_phy, to_usb_phy_event(role));
 
 	dev_dbg(&port->dev, "%s(): calling notifier for role %s\n", __func__,
@@ -610,9 +658,26 @@ static int tegra_xusb_role_sw_set(struct usb_role_switch *sw,
 				  enum usb_role role)
 {
 	struct tegra_xusb_port *port = usb_role_switch_get_drvdata(sw);
+	enum usb_charger_state charger_state;
 
 	dev_dbg(&port->dev, "%s(): role %s\n", __func__, usb_roles[role]);
 
+	/* Do charger detect if role is Device and charger detect is enabled */
+	if (port->charger_detect) {
+		if (role == USB_ROLE_DEVICE)
+			port->chrg_type =
+					 tegra_xusb_padctl_charger_detect(port);
+		else
+			port->chrg_type = UNKNOWN_TYPE;
+
+		charger_state = (port->chrg_type == UNKNOWN_TYPE) ?
+				 USB_CHARGER_ABSENT : USB_CHARGER_PRESENT;
+
+		usb_phy_set_charger_state(&port->usb_phy, charger_state);
+
+		tegra_xusb_padctl_vbus_pad_portection(port);
+	}
+
 	schedule_work(&port->usb_phy_work);
 
 	return 0;
@@ -643,6 +708,14 @@ static int tegra_xusb_set_host(struct usb_otg *otg, struct usb_bus *host)
 	return 0;
 }
 
+static enum usb_charger_type tegra_xusb_charger_detect(struct usb_phy *usb_phy)
+{
+	struct tegra_xusb_port *port = container_of(usb_phy,
+						    struct tegra_xusb_port,
+						    usb_phy);
+
+	return port->chrg_type;
+}
 
 static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
 {
@@ -693,6 +766,9 @@ static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
 	port->usb_phy.otg->set_peripheral = tegra_xusb_set_peripheral;
 	port->usb_phy.otg->set_host = tegra_xusb_set_host;
 
+	if (port->charger_detect)
+		port->usb_phy.charger_detect = tegra_xusb_charger_detect;
+
 	err = usb_add_phy_dev(&port->usb_phy);
 	if (err < 0) {
 		dev_err(&port->dev, "Failed to add USB PHY: %d\n", err);
@@ -727,6 +803,10 @@ static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
 		usb2->mode = USB_DR_MODE_HOST;
 	}
 
+	if (port->padctl->soc->charger_detect &&
+	    of_property_read_bool(np, "nvidia,charger-detect"))
+		port->charger_detect = true;
+
 	/* usb-role-switch property is mandatory for OTG/Peripheral modes */
 	if (usb2->mode == USB_DR_MODE_PERIPHERAL ||
 	    usb2->mode == USB_DR_MODE_OTG) {
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 79e96b0..714bca2 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -282,6 +282,9 @@ struct tegra_xusb_port {
 	struct work_struct usb_phy_work;
 	struct usb_phy usb_phy;
 
+	bool charger_detect;
+	enum usb_charger_type chrg_type;
+
 	const struct tegra_xusb_port_ops *ops;
 };
 
@@ -306,6 +309,9 @@ struct tegra_xusb_port *
 tegra_xusb_find_port(struct tegra_xusb_padctl *padctl, const char *type,
 		     unsigned int index);
 
+enum usb_charger_type tegra_xusb_padctl_charger_detect(
+					  struct tegra_xusb_port *port);
+
 struct tegra_xusb_usb2_port {
 	struct tegra_xusb_port base;
 
@@ -430,6 +436,7 @@ struct tegra_xusb_padctl_soc {
 	unsigned int num_supplies;
 	bool supports_gen2;
 	bool need_fake_usb3_port;
+	bool charger_detect;
 };
 
 struct tegra_xusb_padctl {
-- 
2.7.4

