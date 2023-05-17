Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60047707637
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjEQXEL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbjEQXEF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:04:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C335661A4
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:35 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-00089P-47; Thu, 18 May 2023 01:02:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-000wr2-2R; Thu, 18 May 2023 01:02:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAV-005UY5-0L; Thu, 18 May 2023 01:02:51 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     linux-usb@vger.kernel.org,
        "moderated list:ARM/Microchip" <linux-arm-kernel@lists.infradead.org>,
        kernel@pengutronix.de
Subject: [PATCH 45/97] usb: ehci-atmel: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:47 +0200
Message-Id: <20230517230239.187727-46-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1911; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ulAxmCHRWMykEde6D6EcrVSrSjxFVHlauwoooCF5sYo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxBuvbIF60jJfbtcBL+G0g+NyxzPPibkoKMD m3vAARHunuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcQQAKCRCPgPtYfRL+ Ti8AB/9YVz7ioXf039zx3iZrIJsQq1uWGuCeeJhCdZIVH9Jf9CyK85JQhrClsXyNkLJLGEddAS/ 3tgCmNbLX7leUl6R++tgg5wKxfTFZ7M+JdrI/cLBHLpsk5vM6+eJALKwdjMNkr/1DMk3jvN420k 7t0sRCZtMHsCLT9fyNq5c8w+4TESzBDGDIoCv83MUcWVOs0PrVOzNRbBbCG5ZEZY2pEaHBzkzIg iqa4vdhOk4zkNjk+WlusEJ9/RKkiBTPapO7WnFvs1KmCYRPUUnjOoOmY+EZFjBKPDRe/jkeQ7/B XwRsNTpoaEyo7WSaq8vHNoaIedWeHAEp6PI3xFGtVn5/QrtP
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
 drivers/usb/host/ehci-atmel.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
index 8b775e7bab06..61808c51e702 100644
--- a/drivers/usb/host/ehci-atmel.c
+++ b/drivers/usb/host/ehci-atmel.c
@@ -173,7 +173,7 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
 	return retval;
 }
 
-static int ehci_atmel_drv_remove(struct platform_device *pdev)
+static void ehci_atmel_drv_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
@@ -181,8 +181,6 @@ static int ehci_atmel_drv_remove(struct platform_device *pdev)
 	usb_put_hcd(hcd);
 
 	atmel_stop_ehci(pdev);
-
-	return 0;
 }
 
 static int __maybe_unused ehci_atmel_drv_suspend(struct device *dev)
@@ -223,7 +221,7 @@ static SIMPLE_DEV_PM_OPS(ehci_atmel_pm_ops, ehci_atmel_drv_suspend,
 
 static struct platform_driver ehci_atmel_driver = {
 	.probe		= ehci_atmel_drv_probe,
-	.remove		= ehci_atmel_drv_remove,
+	.remove_new	= ehci_atmel_drv_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "atmel-ehci",
-- 
2.39.2

