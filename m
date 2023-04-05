Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EADDD6D7EC2
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 16:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238145AbjDEOLN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 10:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232562AbjDEOKr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 10:10:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758443595
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 07:10:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q4-0003FD-W1; Wed, 05 Apr 2023 16:10:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q3-009Abb-Ry; Wed, 05 Apr 2023 16:10:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q2-00AmTm-PP; Wed, 05 Apr 2023 16:10:14 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 01/10] usb: musb: da8xx: Convert to platform remove callback returning void
Date:   Wed,  5 Apr 2023 16:10:00 +0200
Message-Id: <20230405141009.3400693-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9aNEuY5OUAI+bGd77FghSJhGtgSDG4h2uQbuqPjqi3A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkLYEx2P9s6ehdU4JQPG6/dgqSVIXmMWp5C83xt LpcyQEBlOOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZC2BMQAKCRCPgPtYfRL+ TlG+B/0Sqts44CAEbUr+SeVXq/1yBCZut1rIkHkK+ZtjHSQYdgpCSLpyCAjg9t1h97UBkSRxPt7 ls5NdFMms+/OdYNnj27f6tQnwBOfTgAqn2QYTIQgB3wG9GGGu5SKa3xW3Rn5RZDK3Mln+hzsvH8 KC8gYwdRuLzoai5wGTrXIoNusg6p2mjUcPnOwasCLi7ET7lDzW17Wfyx7l5zL20QIiZXs4bvmlz af8C5EZificSCVlDaATMYXibMkk4+aa7IYEKd9cm9b/poR1OOhx3awW28KnzX1OXReo3CQcqa36 /gD1TFWHTNlgI/+DYZvlCyRsJ/4F+5b7Ffrx6yHGgW2AniDf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/musb/da8xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index d47e5c94587b..912e32b78ac6 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -576,14 +576,12 @@ static int da8xx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int da8xx_remove(struct platform_device *pdev)
+static void da8xx_remove(struct platform_device *pdev)
 {
 	struct da8xx_glue		*glue = platform_get_drvdata(pdev);
 
 	platform_device_unregister(glue->musb);
 	usb_phy_generic_unregister(glue->usb_phy);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -626,7 +624,7 @@ MODULE_DEVICE_TABLE(of, da8xx_id_table);
 
 static struct platform_driver da8xx_driver = {
 	.probe		= da8xx_probe,
-	.remove		= da8xx_remove,
+	.remove_new	= da8xx_remove,
 	.driver		= {
 		.name	= "musb-da8xx",
 		.pm = &da8xx_pm_ops,
-- 
2.39.2

