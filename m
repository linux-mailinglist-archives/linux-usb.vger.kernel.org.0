Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDA8708982
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 22:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjERU0q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 16:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjERU0p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 16:26:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E3510CF
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 13:26:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzkCu-0003A8-Pp; Thu, 18 May 2023 22:26:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzkCs-0019uv-Lu; Thu, 18 May 2023 22:26:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzkCr-005kzo-VB; Thu, 18 May 2023 22:26:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] usb: host: fhci-hcd: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 22:26:36 +0200
Message-Id: <20230518202636.273407-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=U/pz3gpSTGklDMn/VihzIDzUveB3lzRbFSPOeNyWh9U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZon7DlnyywFKXWL9kpDiImjXYe57qYSuHnhtF 5tq1TJ7xziJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGaJ+wAKCRCPgPtYfRL+ TgM+B/wLX69xHUhP1UmEBK7HKJ7YGaY3fSkfQ5W+joAD1wMyPIKuXZS86moQSsF3OSD2L8GtvQ8 TMON9t9G8yYF5hKNZZxCZowpNX8jLvF+cVNu9iqAQBuQNElSXtLyosG5F4SH/Vh9njDN9i5apSg GmG4TTHxwo5rm0S9x8CYXHbduW0DHE57gWzAoPHUq4wAUTaHn8XoOqCO8xTE0ZqtjxY5b1xz45X qLzujwKa7EHyPCoFflDze0NV7k/l3Om5aXeXLdwOlQz6kQKXqJ4FIWpMLyscbL/eVB3j1VQjBxG 2U4WA8dUUrx8XR8wr7BauHRSq3ewibrlleDhBLv3HoDMAAkM
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
returning an error code.  However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero to the void
returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/host/fhci-hcd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 92794ffc25c8..66a045e01dad 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -757,7 +757,7 @@ static int of_fhci_probe(struct platform_device *ofdev)
 	return ret;
 }
 
-static int fhci_remove(struct device *dev)
+static void fhci_remove(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct fhci_hcd *fhci = hcd_to_fhci(hcd);
@@ -771,12 +771,11 @@ static int fhci_remove(struct device *dev)
 		qe_pin_free(fhci->pins[j]);
 	fhci_dfs_destroy(fhci);
 	usb_put_hcd(hcd);
-	return 0;
 }
 
-static int of_fhci_remove(struct platform_device *ofdev)
+static void of_fhci_remove(struct platform_device *ofdev)
 {
-	return fhci_remove(&ofdev->dev);
+	fhci_remove(&ofdev->dev);
 }
 
 static const struct of_device_id of_fhci_match[] = {
@@ -791,7 +790,7 @@ static struct platform_driver of_fhci_driver = {
 		.of_match_table = of_fhci_match,
 	},
 	.probe		= of_fhci_probe,
-	.remove		= of_fhci_remove,
+	.remove_new	= of_fhci_remove,
 };
 
 module_platform_driver(of_fhci_driver);

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

