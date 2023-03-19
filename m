Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6C76C0048
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 10:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjCSJYs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 05:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjCSJYl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 05:24:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0245818174
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 02:24:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHH-0003Op-J4; Sun, 19 Mar 2023 10:24:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHG-005C81-C6; Sun, 19 Mar 2023 10:24:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHF-0066PE-C2; Sun, 19 Mar 2023 10:24:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 05/11] usb: phy: gpio-vbus: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 10:24:22 +0100
Message-Id: <20230319092428.283054-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qvrRA9u1FB1PRAhAWCHD/P9/clrivgUMclMXJBySd2M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtTA7H8MqgECmaHJbTEA5uWgdb7wjUXdp3/kS PtqNp0eF0KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUwAAKCRCPgPtYfRL+ TkehCACVNEkHHM63wV5t0pIZxhAcKXNXuzlrHiROYt+BR8E+ogE2mFbBUMK0UYUpzAJqvYhk1xI bLa8Y39X5RLsbfhW+o2Oc+4yAVmC/qLFnwg+7nlJJvfkivjc/3hBC4RyEgIcmJyXP/Ndsw10KHZ 8ekVXUDLoue1NMBglprearuMcG72riXBMLtJr5cuosaIy008Z+YJkQqUaBWjA/Y+ZhnLkRQB6RH NOhcl7fDXr/PqlIWMX2BojinKTBv/lypLFtvC90sojW73+extlJc4/uFYLFO8ST2qwswm4/1tqU Xd58pRIP9b48MP2sV4cZhm9WN+HfSGqIvT81IQLmxu+OSNHW
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
 drivers/usb/phy/phy-gpio-vbus-usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index 12dfeff7de3d..817c242a76ca 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -325,7 +325,7 @@ static int gpio_vbus_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int gpio_vbus_remove(struct platform_device *pdev)
+static void gpio_vbus_remove(struct platform_device *pdev)
 {
 	struct gpio_vbus_data *gpio_vbus = platform_get_drvdata(pdev);
 
@@ -333,8 +333,6 @@ static int gpio_vbus_remove(struct platform_device *pdev)
 	cancel_delayed_work_sync(&gpio_vbus->work);
 
 	usb_remove_phy(&gpio_vbus->phy);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -386,7 +384,7 @@ static struct platform_driver gpio_vbus_driver = {
 		.of_match_table = gpio_vbus_of_match,
 	},
 	.probe		= gpio_vbus_probe,
-	.remove		= gpio_vbus_remove,
+	.remove_new	= gpio_vbus_remove,
 };
 
 module_platform_driver(gpio_vbus_driver);
-- 
2.39.2

