Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACF77075DD
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjEQXC7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjEQXCx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F8D4C02
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-0007nB-RW; Thu, 18 May 2023 01:02:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-000wop-6D; Thu, 18 May 2023 01:02:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-005UWI-FF; Thu, 18 May 2023 01:02:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 17/97] usb: dwc3-meson-g12a: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:19 +0200
Message-Id: <20230517230239.187727-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bBrKVx6OfZrSZVEoSGBtaNr7cq96r3z82Q7VQ738QaA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVv+Ga7t9fqZ/L85VfZ8l5ysQ6NNnQv1sZU9k 6uofkm64QOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb/gAKCRCPgPtYfRL+ ToHwB/0VhlUxmaahZ5cCzjtZfjbg+2Pcrb4WLXHPsXbMpPruGDJgYSv6if5+8c6PT2WDa/7BIVD gBx3lFgN37y48gZbTkPNrbn+rpnamKZnGUXfcyJtZma7eR/RiClNPo5lnY1f1QFeMGd2xXIiJ7q ouIZp03Pru/t+t9K+PzkCETDPPBnhfGC/OKVodus58h/Aqy2bjp2XsVhPtzhBg9wk5fuIVkyZcU KFqOVVbMRies1lkt67mFYiLji9tXpdkubkE2fUNMKAZoRU8Cc1C2bxL2BhhzSpb0oeSzomO4cXW yRgSZPTXnHDRqNj06Hu0+skz9rvTWr3vIYXUJAlOJVNgvceQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart from
emitting a warning) and this typically results in resource leaks. To improve
here there is a quest to make the remove callback return void. In the first
step of this quest all drivers are converted to .remove_new() which already
returns void. Eventually after all drivers are converted, .remove_new() is
renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index b282ad0e69c6..7ed5a21fb441 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -835,7 +835,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dwc3_meson_g12a_remove(struct platform_device *pdev)
+static void dwc3_meson_g12a_remove(struct platform_device *pdev)
 {
 	struct dwc3_meson_g12a *priv = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
@@ -859,8 +859,6 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
 
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
 				   priv->drvdata->clks);
-
-	return 0;
 }
 
 static int __maybe_unused dwc3_meson_g12a_runtime_suspend(struct device *dev)
@@ -971,7 +969,7 @@ MODULE_DEVICE_TABLE(of, dwc3_meson_g12a_match);
 
 static struct platform_driver dwc3_meson_g12a_driver = {
 	.probe		= dwc3_meson_g12a_probe,
-	.remove		= dwc3_meson_g12a_remove,
+	.remove_new	= dwc3_meson_g12a_remove,
 	.driver		= {
 		.name	= "dwc3-meson-g12a",
 		.of_match_table = dwc3_meson_g12a_match,
-- 
2.39.2

