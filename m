Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8A22F1949
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 16:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729445AbhAKPOa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 10:14:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbhAKPO3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 10:14:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CCAC06179F
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 07:13:49 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kyyt1-0006K4-Sw; Mon, 11 Jan 2021 16:13:39 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kyyt1-0007RJ-2T; Mon, 11 Jan 2021 16:13:39 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 2/2] usb: dwc2: use clk bulk API for supporting additional clocks
Date:   Mon, 11 Jan 2021 16:13:37 +0100
Message-Id: <20210111151337.5643-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210111151337.5643-1-s.hauer@pengutronix.de>
References: <20210111151337.5643-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This switches to the clk bulk API for the dwc2 driver. With this
additional clocks can be supported.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/usb/dwc2/core.h     |  2 ++
 drivers/usb/dwc2/platform.c | 18 ++++++++----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 7161344c6522..4c9e2c75f3dd 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1075,6 +1075,8 @@ struct dwc2_hsotg {
 	spinlock_t lock;
 	void *priv;
 	int     irq;
+	struct clk_bulk_data *clocks;
+	int num_clocks;
 	struct clk *clk;
 	struct reset_control *reset;
 	struct reset_control *reset_ecc;
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 5f18acac7406..d4a1a26103da 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -143,11 +143,9 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
 	if (ret)
 		return ret;
 
-	if (hsotg->clk) {
-		ret = clk_prepare_enable(hsotg->clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_bulk_prepare_enable(hsotg->num_clocks, hsotg->clocks);
+	if (ret)
+		return ret;
 
 	if (hsotg->uphy) {
 		ret = usb_phy_init(hsotg->uphy);
@@ -195,8 +193,7 @@ static int __dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
 	if (ret)
 		return ret;
 
-	if (hsotg->clk)
-		clk_disable_unprepare(hsotg->clk);
+	clk_bulk_disable_unprepare(hsotg->num_clocks, hsotg->clocks);
 
 	return 0;
 }
@@ -281,11 +278,12 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
 	hsotg->plat = dev_get_platdata(hsotg->dev);
 
 	/* Clock */
-	hsotg->clk = devm_clk_get_optional(hsotg->dev, "otg");
-	if (IS_ERR(hsotg->clk)) {
+	ret = devm_clk_bulk_get_all(hsotg->dev, &hsotg->clocks);
+	if (ret < 0) {
 		dev_err(hsotg->dev, "cannot get otg clock\n");
-		return PTR_ERR(hsotg->clk);
+		return ret;
 	}
+	hsotg->num_clocks = ret;
 
 	/* Regulators */
 	for (i = 0; i < ARRAY_SIZE(hsotg->supplies); i++)
-- 
2.20.1

