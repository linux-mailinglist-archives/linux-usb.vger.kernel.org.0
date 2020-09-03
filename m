Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE6325C06B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 13:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgICLf3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 07:35:29 -0400
Received: from crapouillou.net ([89.234.176.41]:51930 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728670AbgICLew (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Sep 2020 07:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599132400; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kBW+nkOsYyeAelK/KG7Nm9NdYHdCT7/Y8hAy7PO36OI=;
        b=u9xFXq2EP+7d+LmlwYPr2PlDeGx8LofH5vlp6CbMdTA7PVyuq7p56wjFh7Kr3Iz/7YZUHh
        6PAiCm4bE5jSsLrmXg3T1mnmLyfJvsTxHh36tbIvQn2EKg4aNICx1RVLaBCkornN3obBEM
        cDJ9dheuf5Xxpis21nnQ1SKic7lnxyY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Tony Prisk <linux@prisktech.co.nz>, Bin Liu <b-liu@ti.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 14/20] usb/phy: mxs-usb: Use pm_ptr() macro
Date:   Thu,  3 Sep 2020 13:25:48 +0200
Message-Id: <20200903112554.34263-15-paul@crapouillou.net>
In-Reply-To: <20200903112554.34263-1-paul@crapouillou.net>
References: <20200903112554.34263-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the newly introduced pm_ptr() macro, and mark the suspend/resume
functions __maybe_unused. These functions can then be moved outside the
CONFIG_PM_SUSPEND block, and the compiler can then process them and
detect build failures independently of the config. If unused, they will
simply be discarded by the compiler.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/phy/phy-mxs-usb.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 67b39dc62b37..c5e32d51563f 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -815,8 +815,8 @@ static int mxs_phy_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static void mxs_phy_enable_ldo_in_suspend(struct mxs_phy *mxs_phy, bool on)
+static void __maybe_unused
+mxs_phy_enable_ldo_in_suspend(struct mxs_phy *mxs_phy, bool on)
 {
 	unsigned int reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
 
@@ -832,7 +832,7 @@ static void mxs_phy_enable_ldo_in_suspend(struct mxs_phy *mxs_phy, bool on)
 			reg, BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG_SL);
 }
 
-static int mxs_phy_system_suspend(struct device *dev)
+static int __maybe_unused mxs_phy_system_suspend(struct device *dev)
 {
 	struct mxs_phy *mxs_phy = dev_get_drvdata(dev);
 
@@ -842,7 +842,7 @@ static int mxs_phy_system_suspend(struct device *dev)
 	return 0;
 }
 
-static int mxs_phy_system_resume(struct device *dev)
+static int __maybe_unused mxs_phy_system_resume(struct device *dev)
 {
 	struct mxs_phy *mxs_phy = dev_get_drvdata(dev);
 
@@ -851,7 +851,6 @@ static int mxs_phy_system_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static SIMPLE_DEV_PM_OPS(mxs_phy_pm, mxs_phy_system_suspend,
 		mxs_phy_system_resume);
@@ -862,7 +861,7 @@ static struct platform_driver mxs_phy_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = mxs_phy_dt_ids,
-		.pm = &mxs_phy_pm,
+		.pm = pm_ptr(&mxs_phy_pm),
 	 },
 };
 
-- 
2.28.0

