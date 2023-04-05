Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811E56D7EC5
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 16:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238512AbjDEOLS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 10:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238515AbjDEOKs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 10:10:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB7C3596
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 07:10:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q5-0003FU-D1; Wed, 05 Apr 2023 16:10:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q4-009Abv-NB; Wed, 05 Apr 2023 16:10:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q3-00AmU2-Qz; Wed, 05 Apr 2023 16:10:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 06/10] usb: musb: musb_dsps: Convert to platform remove callback returning void
Date:   Wed,  5 Apr 2023 16:10:05 +0200
Message-Id: <20230405141009.3400693-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6KE1F2nyUXQt1T0UuWoQejC3yG3gBo+mM2Ptn4QIZGo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkLYE3+WQgq2KrFae/2daNqMQZwehnNLauRVMz1 hHooInL4OuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZC2BNwAKCRCPgPtYfRL+ TryGCAC1bhLXlozOFqRjows7ZJb7VIi6Tk7wif26Pcdswo+DI9IrgxThjd7mZM7k/oC/uwXpCpR 52rrYMoXoGJbizpQPMXVl52PUVw/aeW/E4+2a1ShbD4qSbHLNjBiMkQYIO59yU4rQJvbDN7GP4H nQpJ5y44nFCFmqSC5LFJ4kwNDwWJOoVgW1BBuPqnOmQNgjEZXzAKLEWt8Z07dAwCPq8iLIlVOTP tiHpksIrsx/fXtLS69bfbETMZNG5UgmrUwT6DWEDulVNWmgepMEz6pCTt6UoWq05ANNtyZKENdm j5eMh2hTRYq16qXeq3Cw2W/vJZLTw7Yizz5V/BEOAFKAKU1l
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
 drivers/usb/musb/musb_dsps.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index f75cde0f2b43..9119b1d51370 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -915,7 +915,7 @@ static int dsps_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dsps_remove(struct platform_device *pdev)
+static void dsps_remove(struct platform_device *pdev)
 {
 	struct dsps_glue *glue = platform_get_drvdata(pdev);
 
@@ -923,8 +923,6 @@ static int dsps_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	iounmap(glue->usbss_base);
-
-	return 0;
 }
 
 static const struct dsps_musb_wrapper am33xx_driver_data = {
@@ -1036,7 +1034,7 @@ static SIMPLE_DEV_PM_OPS(dsps_pm_ops, dsps_suspend, dsps_resume);
 
 static struct platform_driver dsps_usbss_driver = {
 	.probe		= dsps_probe,
-	.remove         = dsps_remove,
+	.remove_new     = dsps_remove,
 	.driver         = {
 		.name   = "musb-dsps",
 		.pm	= &dsps_pm_ops,
-- 
2.39.2

