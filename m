Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94377075E9
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjEQXDI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjEQXC4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396DA49C1
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-0007jC-VS; Thu, 18 May 2023 01:02:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAN-000wnl-GJ; Thu, 18 May 2023 01:02:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAM-005UVP-Lf; Thu, 18 May 2023 01:02:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 03/97] usb: cdns3-plat: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:05 +0200
Message-Id: <20230517230239.187727-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vdKSgUZZ4+0Kc2s0BPzhsIKgtcMeZ+DFMYp64Me5948=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVvtrf8iU45REOXG34wNsRZ37Vv0jkCk0R2dO GdJr+kLV9yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb7QAKCRCPgPtYfRL+ TllbCACUew+1Z5EhahdGSPphfH+9RKOjuDAFvt8fKh5MRafld2wIZ6IA8ujeAvTWCOuE/xgeI4r p89bbBgYc+dM3yBYn0plDtlT8CKQtVFIMSVDjcXXatBbmSwIzDDI7BJYYzbduRxnqt2/MxsSNC/ oW6VEuV0vaanj2tsu8nn+KzRgWPrQnVoqn3TTJA9fJFYPzqfU9ROAHKtJTNSaybEYG0B3+9RUDt 4gUD1/DdO7yvWbloSvCO6agR/S3HVTlaOAegzaKvmTorQMX5vfxslNquOHUuw9dA0f2Nl9VsFmh /ywiksj6AN1qxa+2xauTb3zRoN6Jb9fdnHWCMDtgBSfhMAMX
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
 drivers/usb/cdns3/cdns3-plat.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 2bc5d094548b..884e2301237f 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -175,7 +175,7 @@ static int cdns3_plat_probe(struct platform_device *pdev)
  *
  * Returns 0 on success otherwise negative errno
  */
-static int cdns3_plat_remove(struct platform_device *pdev)
+static void cdns3_plat_remove(struct platform_device *pdev)
 {
 	struct cdns *cdns = platform_get_drvdata(pdev);
 	struct device *dev = cdns->dev;
@@ -187,7 +187,6 @@ static int cdns3_plat_remove(struct platform_device *pdev)
 	set_phy_power_off(cdns);
 	phy_exit(cdns->usb2_phy);
 	phy_exit(cdns->usb3_phy);
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -320,7 +319,7 @@ MODULE_DEVICE_TABLE(of, of_cdns3_match);
 
 static struct platform_driver cdns3_driver = {
 	.probe		= cdns3_plat_probe,
-	.remove		= cdns3_plat_remove,
+	.remove_new	= cdns3_plat_remove,
 	.driver		= {
 		.name	= "cdns-usb3",
 		.of_match_table	= of_match_ptr(of_cdns3_match),
-- 
2.39.2

