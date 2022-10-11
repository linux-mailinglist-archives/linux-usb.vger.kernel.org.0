Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC3F5FAE63
	for <lists+linux-usb@lfdr.de>; Tue, 11 Oct 2022 10:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiJKI3u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Oct 2022 04:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiJKI3n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Oct 2022 04:29:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55642C2A
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 01:29:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdl-0005Ss-73; Tue, 11 Oct 2022 10:29:29 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdj-000r79-DS; Tue, 11 Oct 2022 10:29:27 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdi-003iNp-EI; Tue, 11 Oct 2022 10:29:26 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Peter Chen <peter.chen@kernel.org>,
        Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 5/6] usb: chipidea: usbmisc_imx: Add device tree properties for i.MX7 phy tuning
Date:   Tue, 11 Oct 2022 10:29:23 +0200
Message-Id: <20221011082924.884123-6-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221011082924.884123-1-s.hauer@pengutronix.de>
References: <20221011082924.884123-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds support for configuring the remaining phy tuning options
from device tree. Some properties are already configurable, the
remaining properties are added following the same pattern.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 14 ++++++
 drivers/usb/chipidea/ci_hdrc_imx.h |  7 +++
 drivers/usb/chipidea/usbmisc_imx.c | 71 +++++++++++++++++++++++++++++-
 3 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 9ffcecd3058c1..a7c8c0065b9b7 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -172,8 +172,22 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
 
 	of_property_read_u32(np, "samsung,picophy-pre-emp-curr-control",
 			&data->emp_curr_control);
+	of_property_read_u32(np, "samsung,picophy-usb-source-impedance-adjust",
+			&data->usb_source_impedance_adjust);
+	of_property_read_u32(np, "samsung,picophy-hs-rise-time-adjust",
+			&data->hs_transmitter_rise_time_adjust);
 	of_property_read_u32(np, "samsung,picophy-dc-vol-level-adjust",
 			&data->dc_vol_level_adjust);
+	of_property_read_u32(np, "samsung,picophy-fs-ls-source-impedance-adjust",
+			&data->fs_ls_source_impedance_adjust);
+	of_property_read_u32(np, "samsung,picophy-transmitter-hs-crossover-adjust",
+			&data->transmitter_hs_crossover_adjust);
+	of_property_read_u32(np, "samsung,picophy-vbus-valid-threshold-adjust",
+			&data->vbus_valid_threshold_adjust);
+	of_property_read_u32(np, "samsung,picophy-squelsh-threshold-adjust",
+			&data->squelsh_threshold_adjust);
+	of_property_read_u32(np, "samsung,picophy-disconnect-threshold-adjust",
+			&data->disconnect_threshold_adjust);
 
 	return data;
 }
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index 7daccb9c5006a..c38f4746d6903 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -27,7 +27,14 @@ struct imx_usbmisc_data {
 	struct usb_phy *usb_phy;
 	enum usb_dr_mode available_role; /* runtime usb dr mode */
 	int emp_curr_control;
+	int hs_transmitter_rise_time_adjust;
 	int dc_vol_level_adjust;
+	int usb_source_impedance_adjust;
+	int fs_ls_source_impedance_adjust;
+	int transmitter_hs_crossover_adjust;
+	int vbus_valid_threshold_adjust;
+	int squelsh_threshold_adjust;
+	int disconnect_threshold_adjust;
 };
 
 int imx_usbmisc_init(struct imx_usbmisc_data *data);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 63de7d6fea427..23dea390bf99b 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -126,8 +126,19 @@
 #define MX7D_USB_OTG_PHY_STATUS_CHRGDET		BIT(29)
 
 #define MX7D_USB_OTG_PHY_CFG1		0x30
-#define MX7D_USB_OTG_PHY_CFG1_TXPREEMPAMPTUNE0	GENMASK(29, 28)
-#define MX7D_USB_OTG_PHY_CFG1_TXVREFTUNE0	GENMASK(23, 20)
+#define MX7D_USB_OTG_PHY_CFG1_CHRGDET_MEGAMIX		BIT(31)
+#define MX7D_USB_OTG_PHY_CFG1_TXPREEMPPULSETUNE0	BIT(30)
+#define MX7D_USB_OTG_PHY_CFG1_TXPREEMPAMPTUNE0		GENMASK(29, 28)
+#define MX7D_USB_OTG_PHY_CFG1_TXRESTUNE0		GENMASK(27, 26)
+#define MX7D_USB_OTG_PHY_CFG1_TXRISETUNE0		GENMASK(25, 24)
+#define MX7D_USB_OTG_PHY_CFG1_TXVREFTUNE0		GENMASK(23, 20)
+#define MX7D_USB_OTG_PHY_CFG1_TXFSLSTUNE0		GENMASK(19, 16)
+#define MX7D_USB_OTG_PHY_CFG1_TXHSXVTUNE0		GENMASK(14, 13)
+#define MX7D_USB_OTG_PHY_CFG1_OTGTUNE0			GENMASK(12, 10)
+#define MX7D_USB_OTG_PHY_CFG1_SQRTUNE0			GENMASK(9, 7)
+#define MX7D_USB_OTG_PHY_CFG1_COMPDISTUNE0		GENMASK(6, 4)
+#define MX7D_USB_OTG_PHY_CFG1_FSEL			GENMASK(3, 1)
+#define MX7D_USB_OTG_PHY_CFG1_COMMONONN			BIT(0)
 
 #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
 				 MX6_BM_ID_WAKEUP)
@@ -666,6 +677,22 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
 					  data->emp_curr_control);
 		}
 
+		if (data->usb_source_impedance_adjust &&
+		    FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_TXRESTUNE0,
+			      data->usb_source_impedance_adjust)) {
+			reg &= ~MX7D_USB_OTG_PHY_CFG1_TXRESTUNE0;
+			reg |= FIELD_PREP(MX7D_USB_OTG_PHY_CFG1_TXRESTUNE0,
+					  data->usb_source_impedance_adjust);
+		}
+
+		if (data->hs_transmitter_rise_time_adjust &&
+		    FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_TXRISETUNE0,
+			      data->hs_transmitter_rise_time_adjust)) {
+			reg &= ~MX7D_USB_OTG_PHY_CFG1_TXRISETUNE0;
+			reg |= FIELD_PREP(MX7D_USB_OTG_PHY_CFG1_TXRISETUNE0,
+					  data->hs_transmitter_rise_time_adjust);
+		}
+
 		if (data->dc_vol_level_adjust &&
 		    FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_TXVREFTUNE0,
 			      data->dc_vol_level_adjust)) {
@@ -674,6 +701,46 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
 					  data->dc_vol_level_adjust);
 		}
 
+		if (data->fs_ls_source_impedance_adjust &&
+		    FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_TXFSLSTUNE0,
+			      data->fs_ls_source_impedance_adjust)) {
+			reg &= ~MX7D_USB_OTG_PHY_CFG1_TXFSLSTUNE0;
+			reg |= FIELD_PREP(MX7D_USB_OTG_PHY_CFG1_TXFSLSTUNE0,
+					  data->fs_ls_source_impedance_adjust);
+		}
+
+		if (data->transmitter_hs_crossover_adjust &&
+		    FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_TXHSXVTUNE0,
+			      data->transmitter_hs_crossover_adjust)) {
+			reg &= ~MX7D_USB_OTG_PHY_CFG1_TXHSXVTUNE0;
+			reg |= FIELD_PREP(MX7D_USB_OTG_PHY_CFG1_TXHSXVTUNE0,
+					  data->transmitter_hs_crossover_adjust);
+		}
+
+		if (data->vbus_valid_threshold_adjust &&
+		    FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_OTGTUNE0,
+			      data->vbus_valid_threshold_adjust)) {
+			reg &= ~MX7D_USB_OTG_PHY_CFG1_OTGTUNE0;
+			reg |= FIELD_PREP(MX7D_USB_OTG_PHY_CFG1_OTGTUNE0,
+					  data->vbus_valid_threshold_adjust);
+		}
+
+		if (data->squelsh_threshold_adjust &&
+		    FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_SQRTUNE0,
+			      data->squelsh_threshold_adjust)) {
+			reg &= ~MX7D_USB_OTG_PHY_CFG1_SQRTUNE0;
+			reg |= FIELD_PREP(MX7D_USB_OTG_PHY_CFG1_SQRTUNE0,
+					  data->squelsh_threshold_adjust);
+		}
+
+		if (data->disconnect_threshold_adjust &&
+		    FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_COMPDISTUNE0,
+			      data->disconnect_threshold_adjust)) {
+			reg &= ~MX7D_USB_OTG_PHY_CFG1_COMPDISTUNE0;
+			reg |= FIELD_PREP(MX7D_USB_OTG_PHY_CFG1_COMPDISTUNE0,
+					  data->disconnect_threshold_adjust);
+		}
+
 		writel(reg, usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
 	}
 
-- 
2.30.2

