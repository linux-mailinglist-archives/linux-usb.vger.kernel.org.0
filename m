Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E748707603
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjEQXDb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbjEQXDK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC165270
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-000815-VG; Thu, 18 May 2023 01:02:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-000wqD-QG; Thu, 18 May 2023 01:02:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-005UXP-0J; Thu, 18 May 2023 01:02:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shaomin Deng <dengshaomin@cdjrlc.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 35/97] usb: gadget/net2272: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:37 +0200
Message-Id: <20230517230239.187727-36-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=aXHekxaoErRnaG+fXwazrKam9LtPHQRggt9kK1RP/XU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwrtoQFMyiI8LJ1OuceNtBGeHGansq6aM5vL Nup/whTY9qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcKwAKCRCPgPtYfRL+ Tt6AB/sFEjTfkEgDrDjeLN+f86/7Kvzp+od0jnlCasf7dQu/8L9h3d5lCun0G0hwjSETMXf+u/q 64RVceAswJFmaEh/twqYQUUONUYGhkrP5KOGAzYm8hu5JWWmhH4iWkzW8FEEPyM1O1nu3B36vq6 Y0G1P3wNP0JdRYJNyt/i3+zr1Gkrhf0eB6WzcVa5WDmbsqRZd7999JtAJelzCKoZbq2RmjId5+U r/Uedni6h4PHXoonSOYk39Z+E+rUCXe8rKFT7T/og/WEyCl9nv0t/Eh80ctXtmedwJ5yhG2wQ4z Up78QUnTsMqEg7BUARtTUxC8JqdCbLjZ1M5J5/s4F0UsNAWI
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
 drivers/usb/gadget/udc/net2272.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 538c1b9a2883..12e76bb62c20 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -2670,7 +2670,7 @@ net2272_plat_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int
+static void
 net2272_plat_remove(struct platform_device *pdev)
 {
 	struct net2272 *dev = platform_get_drvdata(pdev);
@@ -2681,13 +2681,11 @@ net2272_plat_remove(struct platform_device *pdev)
 		resource_size(&pdev->resource[0]));
 
 	usb_put_gadget(&dev->gadget);
-
-	return 0;
 }
 
 static struct platform_driver net2272_plat_driver = {
 	.probe   = net2272_plat_probe,
-	.remove  = net2272_plat_remove,
+	.remove_new = net2272_plat_remove,
 	.driver  = {
 		.name  = driver_name,
 	},
-- 
2.39.2

