Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B438D61E33A
	for <lists+linux-usb@lfdr.de>; Sun,  6 Nov 2022 16:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbiKFPue (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Nov 2022 10:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiKFPua (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Nov 2022 10:50:30 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 61DB1F591;
        Sun,  6 Nov 2022 07:50:25 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CE171FB;
        Sun,  6 Nov 2022 07:50:31 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 305973F534;
        Sun,  6 Nov 2022 07:50:22 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 10/11] phy: sun4i-usb: Replace types with explicit quirk flags
Date:   Sun,  6 Nov 2022 15:48:25 +0000
Message-Id: <20221106154826.6687-11-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221106154826.6687-1-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

So far we were assigning some crude "type" (SoC name, really) to each
Allwinner USB PHY model, then guarding certain quirks based on this.
This does not only look weird, but gets more or more cumbersome to
maintain.

Remove the bogus type names altogether, instead introduce flags for each
quirk, and explicitly check for them.
This improves readability, and simplifies future extensions.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 50 ++++++++-------------------
 1 file changed, 15 insertions(+), 35 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 51fb24c6dcb3..422129c66282 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -99,27 +99,17 @@
 #define DEBOUNCE_TIME			msecs_to_jiffies(50)
 #define POLL_TIME			msecs_to_jiffies(250)
 
-enum sun4i_usb_phy_type {
-	sun4i_a10_phy,
-	sun6i_a31_phy,
-	sun8i_a33_phy,
-	sun8i_a83t_phy,
-	sun8i_h3_phy,
-	sun8i_r40_phy,
-	sun8i_v3s_phy,
-	sun50i_a64_phy,
-	sun50i_h6_phy,
-};
-
 struct sun4i_usb_phy_cfg {
 	int num_phys;
 	int hsic_index;
-	enum sun4i_usb_phy_type type;
 	u32 disc_thresh;
 	u32 hci_phy_ctl_clear;
 	u8 phyctl_offset;
 	bool dedicated_clocks;
 	bool phy0_dual_route;
+	bool phy2_is_hsic;
+	bool siddq_in_base;
+	bool poll_vbusen;
 	int missing_phys;
 };
 
@@ -251,7 +241,7 @@ static void sun4i_usb_phy_passby(struct sun4i_usb_phy *phy, int enable)
 		SUNXI_AHB_INCRX_ALIGN_EN | SUNXI_ULPI_BYPASS_EN;
 
 	/* A83T USB2 is HSIC */
-	if (phy_data->cfg->type == sun8i_a83t_phy && phy->index == 2)
+	if (phy_data->cfg->phy2_is_hsic && phy->index == 2)
 		bits |= SUNXI_EHCI_HS_FORCE | SUNXI_HSIC_CONNECT_INT |
 			SUNXI_HSIC;
 
@@ -295,8 +285,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		writel(val, phy->pmu + REG_HCI_PHY_CTL);
 	}
 
-	if (data->cfg->type == sun8i_a83t_phy ||
-	    data->cfg->type == sun50i_h6_phy) {
+	if (data->cfg->siddq_in_base) {
 		if (phy->index == 0) {
 			val = readl(data->base + data->cfg->phyctl_offset);
 			val |= PHY_CTL_VBUSVLDEXT;
@@ -340,8 +329,7 @@ static int sun4i_usb_phy_exit(struct phy *_phy)
 	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
 
 	if (phy->index == 0) {
-		if (data->cfg->type == sun8i_a83t_phy ||
-		    data->cfg->type == sun50i_h6_phy) {
+		if (data->cfg->siddq_in_base) {
 			void __iomem *phyctl = data->base +
 				data->cfg->phyctl_offset;
 
@@ -414,9 +402,8 @@ static bool sun4i_usb_phy0_poll(struct sun4i_usb_phy_data *data)
 	 * vbus using the N_VBUSEN pin on the pmic, so we must poll
 	 * when using the pmic for vbus-det _and_ we're driving vbus.
 	 */
-	if ((data->cfg->type == sun6i_a31_phy ||
-	     data->cfg->type == sun8i_a33_phy) &&
-	    data->vbus_power_supply && data->phys[0].regulator_on)
+	if (data->cfg->poll_vbusen && data->vbus_power_supply &&
+	    data->phys[0].regulator_on)
 		return true;
 
 	return false;
@@ -861,7 +848,6 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 
 static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
 	.num_phys = 1,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
@@ -869,7 +855,6 @@ static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
 	.num_phys = 3,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
@@ -877,7 +862,6 @@ static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun5i_a13_cfg = {
 	.num_phys = 2,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 2,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
@@ -885,15 +869,14 @@ static const struct sun4i_usb_phy_cfg sun5i_a13_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun6i_a31_cfg = {
 	.num_phys = 3,
-	.type = sun6i_a31_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
+	.poll_vbusen = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun7i_a20_cfg = {
 	.num_phys = 3,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 2,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
@@ -901,31 +884,31 @@ static const struct sun4i_usb_phy_cfg sun7i_a20_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun8i_a23_cfg = {
 	.num_phys = 2,
-	.type = sun6i_a31_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
+	.poll_vbusen = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_a33_cfg = {
 	.num_phys = 2,
-	.type = sun8i_a33_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
+	.poll_vbusen = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_a83t_cfg = {
 	.num_phys = 3,
 	.hsic_index = 2,
-	.type = sun8i_a83t_phy,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
+	.siddq_in_base = true,
+	.phy2_is_hsic = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
 	.num_phys = 4,
-	.type = sun8i_h3_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -935,7 +918,6 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
 	.num_phys = 3,
-	.type = sun8i_r40_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -945,7 +927,6 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
 	.num_phys = 1,
-	.type = sun8i_v3s_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -955,16 +936,15 @@ static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun20i_d1_cfg = {
 	.num_phys = 2,
-	.type = sun50i_h6_phy,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
 	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
 	.phy0_dual_route = true,
+	.siddq_in_base = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 	.num_phys = 2,
-	.type = sun50i_a64_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -974,11 +954,11 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
 	.num_phys = 4,
-	.type = sun50i_h6_phy,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
 	.phy0_dual_route = true,
 	.missing_phys = BIT(1) | BIT(2),
+	.siddq_in_base = true,
 };
 
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
-- 
2.35.5

