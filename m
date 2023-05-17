Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4ADE7075E0
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjEQXDC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjEQXCy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47BE34C02
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-0007uN-To; Thu, 18 May 2023 01:02:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAS-000wpf-DF; Thu, 18 May 2023 01:02:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAR-005UX3-Qm; Thu, 18 May 2023 01:02:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 29/97] usb: gadget/dummy_hcd: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:31 +0200
Message-Id: <20230517230239.187727-30-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hI7FrwGABRccHSnkKR2OzfLIJAe4ovOlx+PI+4evkaQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwQ/SwapgRznoBm08VHB4FYFwLbZTVtnSyAc lwj7gabTQyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcEAAKCRCPgPtYfRL+ Tq9DB/9kT9fssYA+b3JvY8BoBNOGVIdQtsuqUSOevc5WzgEWjaMUP/s43k8CDRs1zpwc62wC4vy FbEg7uheEFnoNdGMX55HBaegqGaMDv+8JLnDyB/Hd3pvSIquhRqIOZBkTllkjcrbYMYdBVpDpaJ z2V5gGkQSqsPceVxIpdO00tLs1L3Wxg/flB908ZAC8fzhEINletLySmlvWVPrl0Wq6R/WbSNCBf rNgHpDZUroJJrq2mE8E/zbIqVTS8VR83QvQAj0yQWRkoLAzar4R6ctL5m++NPUA6o9p3B83tUP6 bXQtZKXkTzj3XxXr16mINDwx6GnaBh2/K1KVTXTIwiFU3M5a
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
 drivers/usb/gadget/udc/dummy_hcd.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 899ac9f9c279..0953e1b5c030 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1108,13 +1108,12 @@ static int dummy_udc_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int dummy_udc_remove(struct platform_device *pdev)
+static void dummy_udc_remove(struct platform_device *pdev)
 {
 	struct dummy	*dum = platform_get_drvdata(pdev);
 
 	device_remove_file(&dum->gadget.dev, &dev_attr_function);
 	usb_del_gadget_udc(&dum->gadget);
-	return 0;
 }
 
 static void dummy_udc_pm(struct dummy *dum, struct dummy_hcd *dum_hcd,
@@ -1150,7 +1149,7 @@ static int dummy_udc_resume(struct platform_device *pdev)
 
 static struct platform_driver dummy_udc_driver = {
 	.probe		= dummy_udc_probe,
-	.remove		= dummy_udc_remove,
+	.remove_new	= dummy_udc_remove,
 	.suspend	= dummy_udc_suspend,
 	.resume		= dummy_udc_resume,
 	.driver		= {
@@ -2701,7 +2700,7 @@ static int dummy_hcd_probe(struct platform_device *pdev)
 	return retval;
 }
 
-static int dummy_hcd_remove(struct platform_device *pdev)
+static void dummy_hcd_remove(struct platform_device *pdev)
 {
 	struct dummy		*dum;
 
@@ -2717,8 +2716,6 @@ static int dummy_hcd_remove(struct platform_device *pdev)
 
 	dum->hs_hcd = NULL;
 	dum->ss_hcd = NULL;
-
-	return 0;
 }
 
 static int dummy_hcd_suspend(struct platform_device *pdev, pm_message_t state)
@@ -2753,7 +2750,7 @@ static int dummy_hcd_resume(struct platform_device *pdev)
 
 static struct platform_driver dummy_hcd_driver = {
 	.probe		= dummy_hcd_probe,
-	.remove		= dummy_hcd_remove,
+	.remove_new	= dummy_hcd_remove,
 	.suspend	= dummy_hcd_suspend,
 	.resume		= dummy_hcd_resume,
 	.driver		= {
-- 
2.39.2

