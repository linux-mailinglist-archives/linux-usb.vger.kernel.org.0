Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11CCB7075F1
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjEQXDQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjEQXDA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348483AB3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-0007jB-Vk; Thu, 18 May 2023 01:02:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAN-000wnh-7g; Thu, 18 May 2023 01:02:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAM-005UVM-FB; Thu, 18 May 2023 01:02:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/97] usb: cdns3-imx: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:04 +0200
Message-Id: <20230517230239.187727-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=i3Ljt+mhX1a8pXNB9oz0DmFo8/3jux/qS6o8QqN5XYQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVvsGVkXDa2IxloDSH3LT4AKJxqGnXwaWdik4 5U/LzcJvmuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb7AAKCRCPgPtYfRL+ TkSkCACGVcExiEq/wEzaC6IJh4ykWTgH99Je3S5N72owWnxzKbqXtaJHkwOM67RWgmfCLOuv345 /X56zlUVMuLUzii6Qo0l3Eno7yRLS8gYqvbqgEOpzMfUTZ0XX3ImghWkCcdB4Djl6b3AzV5xt0K b1P1ll/o5QaojZApu0zRys8TaP33zeiIWTw1+vm4fy3+/cUp+MTF2virr+q6n3+WMAKfGiua3D5 KKb9p3cmbXPM63fY8cWeZ8tL2md1CCwHINaMaUk22PI31YkVfrRgHiBxIavoid+tE/d8A87JJ/s vbQbTvxr1uZqvh/9FrxMzkahNvOXsrTDI2Q0j5OhrAyrfKFu
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
 drivers/usb/cdns3/cdns3-imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index 59860d1753fd..e5930f894315 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -218,7 +218,7 @@ static int cdns_imx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cdns_imx_remove(struct platform_device *pdev)
+static void cdns_imx_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct cdns_imx *data = dev_get_drvdata(dev);
@@ -229,8 +229,6 @@ static int cdns_imx_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 	platform_set_drvdata(pdev, NULL);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -416,7 +414,7 @@ MODULE_DEVICE_TABLE(of, cdns_imx_of_match);
 
 static struct platform_driver cdns_imx_driver = {
 	.probe		= cdns_imx_probe,
-	.remove		= cdns_imx_remove,
+	.remove_new	= cdns_imx_remove,
 	.driver		= {
 		.name	= "cdns3-imx",
 		.of_match_table	= cdns_imx_of_match,
-- 
2.39.2

