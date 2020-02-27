Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73623171535
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 11:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgB0KmU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 05:42:20 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39261 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728847AbgB0KmU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 05:42:20 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7GcR-0003f8-Ay; Thu, 27 Feb 2020 11:42:15 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7GcP-0004o4-6a; Thu, 27 Feb 2020 11:42:13 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Peter.Chen@nxp.com, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, linux-imx@nxp.com, stern@rowland.harvard.edu,
        jun.li@freescale.com
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 3/3] Revert "usb: chipidea: add a flag for turn on vbus early for host"
Date:   Thu, 27 Feb 2020 11:42:12 +0100
Message-Id: <20200227104212.12562-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227104212.12562-1-m.felsch@pengutronix.de>
References: <20200227104212.12562-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The flag is no longer needed and can be removed since the quirk is now
handled within the port_power() callback.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 10 ++--------
 include/linux/usb/chipidea.h       | 17 ++++++++---------
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index d8e7eb2f97b9..5c66921bbb9b 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -23,8 +23,7 @@ struct ci_hdrc_imx_platform_flag {
 };
 
 static const struct ci_hdrc_imx_platform_flag imx23_usb_data = {
-	.flags = CI_HDRC_TURN_VBUS_EARLY_ON |
-		CI_HDRC_DISABLE_STREAMING,
+	.flags = CI_HDRC_DISABLE_STREAMING,
 };
 
 static const struct ci_hdrc_imx_platform_flag imx27_usb_data = {
@@ -33,31 +32,26 @@ static const struct ci_hdrc_imx_platform_flag imx27_usb_data = {
 
 static const struct ci_hdrc_imx_platform_flag imx28_usb_data = {
 	.flags = CI_HDRC_IMX28_WRITE_FIX |
-		CI_HDRC_TURN_VBUS_EARLY_ON |
 		CI_HDRC_DISABLE_STREAMING,
 };
 
 static const struct ci_hdrc_imx_platform_flag imx6q_usb_data = {
 	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM |
-		CI_HDRC_TURN_VBUS_EARLY_ON |
 		CI_HDRC_DISABLE_STREAMING,
 };
 
 static const struct ci_hdrc_imx_platform_flag imx6sl_usb_data = {
 	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM |
-		CI_HDRC_TURN_VBUS_EARLY_ON |
 		CI_HDRC_DISABLE_HOST_STREAMING,
 };
 
 static const struct ci_hdrc_imx_platform_flag imx6sx_usb_data = {
 	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM |
-		CI_HDRC_TURN_VBUS_EARLY_ON |
 		CI_HDRC_DISABLE_HOST_STREAMING,
 };
 
 static const struct ci_hdrc_imx_platform_flag imx6ul_usb_data = {
-	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM |
-		CI_HDRC_TURN_VBUS_EARLY_ON,
+	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM,
 };
 
 static const struct ci_hdrc_imx_platform_flag imx7d_usb_data = {
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index edd89b7c8f18..fa373aafa80e 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -53,15 +53,14 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_DUAL_ROLE_NOT_OTG	BIT(4)
 #define CI_HDRC_IMX28_WRITE_FIX		BIT(5)
 #define CI_HDRC_FORCE_FULLSPEED		BIT(6)
-#define CI_HDRC_TURN_VBUS_EARLY_ON	BIT(7)
-#define CI_HDRC_SET_NON_ZERO_TTHA	BIT(8)
-#define CI_HDRC_OVERRIDE_AHB_BURST	BIT(9)
-#define CI_HDRC_OVERRIDE_TX_BURST	BIT(10)
-#define CI_HDRC_OVERRIDE_RX_BURST	BIT(11)
-#define CI_HDRC_OVERRIDE_PHY_CONTROL	BIT(12) /* Glue layer manages phy */
-#define CI_HDRC_REQUIRES_ALIGNED_DMA	BIT(13)
-#define CI_HDRC_IMX_IS_HSIC		BIT(14)
-#define CI_HDRC_PMQOS			BIT(15)
+#define CI_HDRC_SET_NON_ZERO_TTHA	BIT(7)
+#define CI_HDRC_OVERRIDE_AHB_BURST	BIT(8)
+#define CI_HDRC_OVERRIDE_TX_BURST	BIT(9)
+#define CI_HDRC_OVERRIDE_RX_BURST	BIT(10)
+#define CI_HDRC_OVERRIDE_PHY_CONTROL	BIT(11) /* Glue layer manages phy */
+#define CI_HDRC_REQUIRES_ALIGNED_DMA	BIT(12)
+#define CI_HDRC_IMX_IS_HSIC		BIT(13)
+#define CI_HDRC_PMQOS			BIT(14)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
-- 
2.20.1

