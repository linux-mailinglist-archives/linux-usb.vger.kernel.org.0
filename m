Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7C83A7CC8
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 13:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhFOLJ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 07:09:58 -0400
Received: from foss.arm.com ([217.140.110.172]:60702 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230481AbhFOLJd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Jun 2021 07:09:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 764B31396;
        Tue, 15 Jun 2021 04:07:28 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F2BE3F719;
        Tue, 15 Jun 2021 04:07:26 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v7 12/19] phy: sun4i-usb: Rework HCI PHY (aka. "pmu_unk1") handling
Date:   Tue, 15 Jun 2021 12:06:29 +0100
Message-Id: <20210615110636.23403-13-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210615110636.23403-1-andre.przywara@arm.com>
References: <20210615110636.23403-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As Icenowy pointed out, newer manuals (starting with H6) actually
document the register block at offset 0x800 as "HCI controller and PHY
interface", also describe the bits in our "PMU_UNK1" register.
Let's put proper names to those "unknown" variables and symbols.

While we are at it, generalise the existing code by allowing a bitmap
of bits to clear and set, to cover newer SoCs: The A100 and H616 use a
different bit for the SIDDQ control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 30 ++++++++++++---------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 788dd5cdbb7d..142f4cafdc78 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -43,7 +43,7 @@
 #define REG_PHYCTL_A33			0x10
 #define REG_PHY_OTGCTL			0x20
 
-#define REG_PMU_UNK1			0x10
+#define REG_HCI_PHY_CTL			0x10
 
 #define PHYCTL_DATA			BIT(7)
 
@@ -82,6 +82,7 @@
 /* A83T specific control bits for PHY0 */
 #define PHY_CTL_VBUSVLDEXT		BIT(5)
 #define PHY_CTL_SIDDQ			BIT(3)
+#define PHY_CTL_H3_SIDDQ		BIT(1)
 
 /* A83T specific control bits for PHY2 HSIC */
 #define SUNXI_EHCI_HS_FORCE		BIT(20)
@@ -115,9 +116,9 @@ struct sun4i_usb_phy_cfg {
 	int hsic_index;
 	enum sun4i_usb_phy_type type;
 	u32 disc_thresh;
+	u32 hci_phy_ctl_clear;
 	u8 phyctl_offset;
 	bool dedicated_clocks;
-	bool enable_pmu_unk1;
 	bool phy0_dual_route;
 	int missing_phys;
 };
@@ -288,6 +289,12 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		return ret;
 	}
 
+	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {
+		val = readl(phy->pmu + REG_HCI_PHY_CTL);
+		val &= ~data->cfg->hci_phy_ctl_clear;
+		writel(val, phy->pmu + REG_HCI_PHY_CTL);
+	}
+
 	if (data->cfg->type == sun8i_a83t_phy ||
 	    data->cfg->type == sun50i_h6_phy) {
 		if (phy->index == 0) {
@@ -297,11 +304,6 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 			writel(val, data->base + data->cfg->phyctl_offset);
 		}
 	} else {
-		if (phy->pmu && data->cfg->enable_pmu_unk1) {
-			val = readl(phy->pmu + REG_PMU_UNK1);
-			writel(val & ~2, phy->pmu + REG_PMU_UNK1);
-		}
-
 		/* Enable USB 45 Ohm resistor calibration */
 		if (phy->index == 0)
 			sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);
@@ -863,7 +865,6 @@ static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
-	.enable_pmu_unk1 = false,
 };
 
 static const struct sun4i_usb_phy_cfg sun5i_a13_cfg = {
@@ -872,7 +873,6 @@ static const struct sun4i_usb_phy_cfg sun5i_a13_cfg = {
 	.disc_thresh = 2,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
-	.enable_pmu_unk1 = false,
 };
 
 static const struct sun4i_usb_phy_cfg sun6i_a31_cfg = {
@@ -881,7 +881,6 @@ static const struct sun4i_usb_phy_cfg sun6i_a31_cfg = {
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
-	.enable_pmu_unk1 = false,
 };
 
 static const struct sun4i_usb_phy_cfg sun7i_a20_cfg = {
@@ -890,7 +889,6 @@ static const struct sun4i_usb_phy_cfg sun7i_a20_cfg = {
 	.disc_thresh = 2,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
-	.enable_pmu_unk1 = false,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_a23_cfg = {
@@ -899,7 +897,6 @@ static const struct sun4i_usb_phy_cfg sun8i_a23_cfg = {
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
-	.enable_pmu_unk1 = false,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_a33_cfg = {
@@ -908,7 +905,6 @@ static const struct sun4i_usb_phy_cfg sun8i_a33_cfg = {
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
-	.enable_pmu_unk1 = false,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_a83t_cfg = {
@@ -925,7 +921,7 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
-	.enable_pmu_unk1 = true,
+	.hci_phy_ctl_clear = PHY_CTL_H3_SIDDQ,
 	.phy0_dual_route = true,
 };
 
@@ -935,7 +931,7 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
-	.enable_pmu_unk1 = true,
+	.hci_phy_ctl_clear = PHY_CTL_H3_SIDDQ,
 	.phy0_dual_route = true,
 };
 
@@ -945,7 +941,7 @@ static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
-	.enable_pmu_unk1 = true,
+	.hci_phy_ctl_clear = PHY_CTL_H3_SIDDQ,
 	.phy0_dual_route = true,
 };
 
@@ -955,7 +951,7 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
-	.enable_pmu_unk1 = true,
+	.hci_phy_ctl_clear = PHY_CTL_H3_SIDDQ,
 	.phy0_dual_route = true,
 };
 
-- 
2.17.5

