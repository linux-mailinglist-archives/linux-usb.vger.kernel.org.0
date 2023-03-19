Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68056C0049
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 10:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjCSJYr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 05:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjCSJYk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 05:24:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53ED217CFD
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 02:24:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHH-0003Oo-1f; Sun, 19 Mar 2023 10:24:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHG-005C7x-6A; Sun, 19 Mar 2023 10:24:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHF-0066PI-Jd; Sun, 19 Mar 2023 10:24:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.i.king@gmail.com>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 06/11] usb: phy: keystone: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 10:24:23 +0100
Message-Id: <20230319092428.283054-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ZHpFdXT1eV+HvtAKyjUeGncmMTPHMww/WftZDERlW9Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtTCYU1Jd5XIG7g4EVipaQ4zfsDKBIxa9okja MPcTckgJoGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUwgAKCRCPgPtYfRL+ Tg4uB/9qnhPSVenLbZqpx4U3tWPbV3bOcI/s3FtXOEBbnYAHdx63NNXjs3+zqA+DXGcTwvLpiYJ GvY9bFf8o2UHbBOdAyPAXJBCdi/gLy8asBJcvyHQJiQi4ppeVwcDMGwp5muEjMvzSNjJR0eJaI+ BRraFd/AIY/HCYApPjiPhL+Q+9hg3E61SBlEnKeF5xYWF/jyduICA/6akIgTXjrqVZIX1G1BZza ea+V54jcxlZYxHnHnamw22ALQ0Rn7byU65ruh3SJT9lMp50/FWTu2UccVp2yDBitayn5HVSGEc3 hHJwFOufN6TCSmFivjXQzgzs4ZaZTIPR7AQ7o/BXE2aAWpvp
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
 drivers/usb/phy/phy-keystone.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-keystone.c b/drivers/usb/phy/phy-keystone.c
index f75912279b39..bd9a98ad1b30 100644
--- a/drivers/usb/phy/phy-keystone.c
+++ b/drivers/usb/phy/phy-keystone.c
@@ -88,13 +88,11 @@ static int keystone_usbphy_probe(struct platform_device *pdev)
 	return usb_add_phy_dev(&k_phy->usb_phy_gen.phy);
 }
 
-static int keystone_usbphy_remove(struct platform_device *pdev)
+static void keystone_usbphy_remove(struct platform_device *pdev)
 {
 	struct keystone_usbphy *k_phy = platform_get_drvdata(pdev);
 
 	usb_remove_phy(&k_phy->usb_phy_gen.phy);
-
-	return 0;
 }
 
 static const struct of_device_id keystone_usbphy_ids[] = {
@@ -105,7 +103,7 @@ MODULE_DEVICE_TABLE(of, keystone_usbphy_ids);
 
 static struct platform_driver keystone_usbphy_driver = {
 	.probe          = keystone_usbphy_probe,
-	.remove         = keystone_usbphy_remove,
+	.remove_new     = keystone_usbphy_remove,
 	.driver         = {
 		.name   = "keystone-usbphy",
 		.of_match_table = keystone_usbphy_ids,
-- 
2.39.2

