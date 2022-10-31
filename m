Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 520A161344A
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 12:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbiJaLOb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 07:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbiJaLO3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 07:14:29 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 46C1AE08C;
        Mon, 31 Oct 2022 04:14:29 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FA5313D5;
        Mon, 31 Oct 2022 04:14:35 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B1A13F703;
        Mon, 31 Oct 2022 04:14:26 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 3/7] phy: sun4i-usb: Introduce port2 SIDDQ quirk
Date:   Mon, 31 Oct 2022 11:13:54 +0000
Message-Id: <20221031111358.3387297-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031111358.3387297-1-andre.przywara@arm.com>
References: <20221031111358.3387297-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

At least the Allwinner H616 SoC requires a weird quirk to make most
USB PHYs work: Only port2 works out of the box, but all other ports
need some help from this port2 to work correctly: The CLK_BUS_PHY2 and
RST_USB_PHY2 clock and reset need to be enabled, and the SIDDQ bit in
the PMU PHY control register needs to be cleared. For this register to
be accessible, CLK_BUS_ECHI2 needs to be ungated. Don't ask ....

Instead of disguising this as some generic feature, treat it more like
a quirk (what it really is):
If the quirk bit is set, and we initialise a PHY other than PHY2, ungate
this one special clock, and clear the SIDDQ bit. We also pick the clock
and reset from PHY2 and enable them as well.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 3a3831f6059a3..e39f5ad62cc19 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -120,6 +120,7 @@ struct sun4i_usb_phy_cfg {
 	u8 phyctl_offset;
 	bool dedicated_clocks;
 	bool phy0_dual_route;
+	bool needs_phy2_siddq;
 	int missing_phys;
 };
 
@@ -289,6 +290,50 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		return ret;
 	}
 
+	/* Some PHYs on some SoCs need the help of PHY2 to work. */
+	if (data->cfg->needs_phy2_siddq && phy->index != 2) {
+		struct sun4i_usb_phy *phy2 = &data->phys[2];
+
+		ret = clk_prepare_enable(phy2->clk);
+		if (ret) {
+			reset_control_assert(phy->reset);
+			clk_disable_unprepare(phy->clk2);
+			clk_disable_unprepare(phy->clk);
+			return ret;
+		}
+
+		ret = reset_control_deassert(phy2->reset);
+		if (ret) {
+			clk_disable_unprepare(phy2->clk);
+			reset_control_assert(phy->reset);
+			clk_disable_unprepare(phy->clk2);
+			clk_disable_unprepare(phy->clk);
+			return ret;
+		}
+
+		/*
+		 * This extra clock is just needed to access the
+		 * REG_HCI_PHY_CTL PMU register for PHY2.
+		 */
+		ret = clk_prepare_enable(phy2->clk2);
+		if (ret) {
+			reset_control_assert(phy2->reset);
+			clk_disable_unprepare(phy2->clk);
+			reset_control_assert(phy->reset);
+			clk_disable_unprepare(phy->clk2);
+			clk_disable_unprepare(phy->clk);
+			return ret;
+		}
+
+		if (phy2->pmu && data->cfg->hci_phy_ctl_clear) {
+			val = readl(phy2->pmu + REG_HCI_PHY_CTL);
+			val &= ~data->cfg->hci_phy_ctl_clear;
+			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
+		}
+
+		clk_disable_unprepare(phy->clk2);
+	}
+
 	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {
 		val = readl(phy->pmu + REG_HCI_PHY_CTL);
 		val &= ~data->cfg->hci_phy_ctl_clear;
@@ -354,6 +399,13 @@ static int sun4i_usb_phy_exit(struct phy *_phy)
 		data->phy0_init = false;
 	}
 
+	if (data->cfg->needs_phy2_siddq && phy->index != 2) {
+		struct sun4i_usb_phy *phy2 = &data->phys[2];
+
+		clk_disable_unprepare(phy2->clk);
+		reset_control_assert(phy2->reset);
+	}
+
 	sun4i_usb_phy_passby(phy, 0);
 	reset_control_assert(phy->reset);
 	clk_disable_unprepare(phy->clk2);
@@ -785,6 +837,13 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 				dev_err(dev, "failed to get clock %s\n", name);
 				return PTR_ERR(phy->clk2);
 			}
+		} else {
+			snprintf(name, sizeof(name), "pmu%d_clk", i);
+			phy->clk2 = devm_clk_get_optional(dev, name);
+			if (IS_ERR(phy->clk2)) {
+				dev_err(dev, "failed to get clock %s\n", name);
+				return PTR_ERR(phy->clk2);
+			}
 		}
 
 		snprintf(name, sizeof(name), "usb%d_reset", i);
-- 
2.25.1

