Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194967075FD
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjEQXD0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjEQXDH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C53761AF
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAb-0008I2-49; Thu, 18 May 2023 01:02:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-000wsG-Cb; Thu, 18 May 2023 01:02:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-005UZ8-4e; Thu, 18 May 2023 01:02:54 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Olav Kongas <ok@artecdesign.ee>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 61/97] usb: isp116x-hcd: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:03 +0200
Message-Id: <20230517230239.187727-62-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OnyJtVMfx7k9+s48D/pTsYAcJRBUL0Qv2mqShtgy5Fk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxxQw0WpMmNWPv+7z+tAcmMnP6jt1Jt/wabn uIKg1tF3DeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVccQAKCRCPgPtYfRL+ Tpz+CACgSVxRH3PozdwbI4j5l79SGMncgHXf6mo3YOD/ty3cbg2d/66lfmyCP0aqmHcoZbxhVXl oZSHaa9O40ktXava3ASHZvILRzxXN15oyq318Lr5CjbdarxzeMNWvsKUi5/eqppv72vERIH28TH tEOlpNNX4qDlyQ86K60HgJFhX0bQZFDoQ4HFttIz88tRHFX2oipkk9h7irXEOt/YL1kRpE1UAkY mZxhdpn+Wh0pJL3WNxokfX0tCbwI78OtDYQ6LHVnSulRYuuYm6X6Xdf+ff4wwBn+pkgRi7GaRYk 2jWl2MNd4zU1hWJPl6FbY0xAmvuNsMJNVCn3SeIkXVCI7W4o
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
 drivers/usb/host/isp116x-hcd.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
index 49ae01487af4..a82d8926e922 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -1526,14 +1526,14 @@ static const struct hc_driver isp116x_hc_driver = {
 
 /*----------------------------------------------------------------*/
 
-static int isp116x_remove(struct platform_device *pdev)
+static void isp116x_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct isp116x *isp116x;
 	struct resource *res;
 
 	if (!hcd)
-		return 0;
+		return;
 	isp116x = hcd_to_isp116x(hcd);
 	remove_debug_file(isp116x);
 	usb_remove_hcd(hcd);
@@ -1548,7 +1548,6 @@ static int isp116x_remove(struct platform_device *pdev)
 		release_mem_region(res->start, 2);
 
 	usb_put_hcd(hcd);
-	return 0;
 }
 
 static int isp116x_probe(struct platform_device *pdev)
@@ -1685,7 +1684,7 @@ MODULE_ALIAS("platform:isp116x-hcd");
 
 static struct platform_driver isp116x_driver = {
 	.probe = isp116x_probe,
-	.remove = isp116x_remove,
+	.remove_new = isp116x_remove,
 	.suspend = isp116x_suspend,
 	.resume = isp116x_resume,
 	.driver = {
-- 
2.39.2

