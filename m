Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A04815FAE61
	for <lists+linux-usb@lfdr.de>; Tue, 11 Oct 2022 10:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiJKI3s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Oct 2022 04:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiJKI3n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Oct 2022 04:29:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F2DBF3
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 01:29:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdl-0005Sv-76; Tue, 11 Oct 2022 10:29:29 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdj-000r7H-QH; Tue, 11 Oct 2022 10:29:27 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdi-003iNm-Df; Tue, 11 Oct 2022 10:29:26 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Peter Chen <peter.chen@kernel.org>,
        Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 4/6] usb: chipidea: usbmisc_imx: Add prefix to register defines
Date:   Tue, 11 Oct 2022 10:29:22 +0200
Message-Id: <20221011082924.884123-5-s.hauer@pengutronix.de>
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

The driver is used for a broad range of i.MX SoCs and most of the
register defines have a SoC/regname specific prefix to make clear
in which context they should be used. Add such a prefix to the
MX7D_USB_OTG_PHY_CFG1 defines as well.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/usb/chipidea/usbmisc_imx.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 95f2ba01c0df1..63de7d6fea427 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -126,8 +126,8 @@
 #define MX7D_USB_OTG_PHY_STATUS_CHRGDET		BIT(29)
 
 #define MX7D_USB_OTG_PHY_CFG1		0x30
-#define TXPREEMPAMPTUNE0		GENMASK(29, 28)
-#define TXVREFTUNE0			GENMASK(23, 20)
+#define MX7D_USB_OTG_PHY_CFG1_TXPREEMPAMPTUNE0	GENMASK(29, 28)
+#define MX7D_USB_OTG_PHY_CFG1_TXVREFTUNE0	GENMASK(23, 20)
 
 #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
 				 MX6_BM_ID_WAKEUP)
@@ -659,15 +659,19 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
 		/* PHY tuning for signal quality */
 		reg = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
 		if (data->emp_curr_control &&
-		    FIELD_FIT(TXPREEMPAMPTUNE0, data->emp_curr_control)) {
-			reg &= ~TXPREEMPAMPTUNE0;
-			reg |= FIELD_PREP(TXPREEMPAMPTUNE0, data->emp_curr_control);
+		    FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_TXPREEMPAMPTUNE0,
+			      data->emp_curr_control)) {
+			reg &= ~MX7D_USB_OTG_PHY_CFG1_TXPREEMPAMPTUNE0;
+			reg |= FIELD_PREP(MX7D_USB_OTG_PHY_CFG1_TXPREEMPAMPTUNE0,
+					  data->emp_curr_control);
 		}
 
 		if (data->dc_vol_level_adjust &&
-		    FIELD_FIT(TXVREFTUNE0, data->dc_vol_level_adjust)) {
-			reg &= ~TXVREFTUNE0;
-			reg |= FIELD_PREP(TXVREFTUNE0, data->dc_vol_level_adjust);
+		    FIELD_FIT(MX7D_USB_OTG_PHY_CFG1_TXVREFTUNE0,
+			      data->dc_vol_level_adjust)) {
+			reg &= ~MX7D_USB_OTG_PHY_CFG1_TXVREFTUNE0;
+			reg |= FIELD_PREP(MX7D_USB_OTG_PHY_CFG1_TXVREFTUNE0,
+					  data->dc_vol_level_adjust);
 		}
 
 		writel(reg, usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
-- 
2.30.2

