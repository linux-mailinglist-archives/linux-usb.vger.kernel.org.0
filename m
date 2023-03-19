Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA6BE6C0047
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 10:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjCSJYq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 05:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjCSJYl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 05:24:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7351814A
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 02:24:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHI-0003Rs-3d; Sun, 19 Mar 2023 10:24:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHH-005C8L-GB; Sun, 19 Mar 2023 10:24:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHG-0066Pc-N8; Sun, 19 Mar 2023 10:24:34 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 11/11] usb: phy: twl6030: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 10:24:28 +0100
Message-Id: <20230319092428.283054-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=U9pQGegT+g60+oi7tcjAuIRbzIkvAyBrysvPZGk8zEw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtTHo288qorTern4Njm4PO9B3a74+YcwLjT/j 3yn2eKry9OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUxwAKCRCPgPtYfRL+ Tp//CACpk7b1PNIzjtg+kjqZMUovfmAgS3y9gnpW9NxBTe4VQCBk8akwPiO1Y8YwwzqsVdPEu5E G/elnAtjd0LrZQ4B+b7qJC2VycgFu6f7mf3dMQxmaiPKq/qUyOygqe7HD94BAN8LKySI9bVuFBp SuXpzr3fKqAEM3Nd7KShy0n772/du3qWVgjIzZBv8adJqN9JzDq5BuyBV+w1yNR8oKHEdi8vGow 90PoVFipMNBO7ScwwskWhOLiBrrcV5fACV+VSEkRWsl3mKFoDu6nu26gmLuyo8GmHSLx1WID64d nga95oVtRYddBh+eSA4wGBWIEGgQd+5StfaMyb8U53h9HQbb
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/usb/phy/phy-twl6030-usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index ab3c38a7d8ac..c3ce6b1054f1 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -409,7 +409,7 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	return status;
 }
 
-static int twl6030_usb_remove(struct platform_device *pdev)
+static void twl6030_usb_remove(struct platform_device *pdev)
 {
 	struct twl6030_usb *twl = platform_get_drvdata(pdev);
 
@@ -422,8 +422,6 @@ static int twl6030_usb_remove(struct platform_device *pdev)
 	free_irq(twl->irq2, twl);
 	regulator_put(twl->usb3v3);
 	cancel_work_sync(&twl->set_vbus_work);
-
-	return 0;
 }
 
 static const struct of_device_id twl6030_usb_id_table[] = {
@@ -434,7 +432,7 @@ MODULE_DEVICE_TABLE(of, twl6030_usb_id_table);
 
 static struct platform_driver twl6030_usb_driver = {
 	.probe		= twl6030_usb_probe,
-	.remove		= twl6030_usb_remove,
+	.remove_new	= twl6030_usb_remove,
 	.driver		= {
 		.name	= "twl6030_usb",
 		.of_match_table = of_match_ptr(twl6030_usb_id_table),
-- 
2.39.2

