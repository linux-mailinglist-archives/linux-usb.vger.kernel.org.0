Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797C67075DB
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjEQXC7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjEQXCw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCC649C1
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAS-0007pj-81; Thu, 18 May 2023 01:02:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAR-000wpO-IW; Thu, 18 May 2023 01:02:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-005UWg-Lw; Thu, 18 May 2023 01:02:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 23/97] usb: fotg210: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:25 +0200
Message-Id: <20230517230239.187727-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0EVPeeXYnFzs0REvfAsMPZGA7dNmwc9neKov2L8WQgI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwFvnGZXBo4p3f3EQVZdLtjjRzrSyhTAZDYI Ze+8JfUGSiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcBQAKCRCPgPtYfRL+ Tnw/CACZz9d/liDEloXB7xtHkr3RVszLunK7unuQ9BHU4D9SAoI02dR7pJ4+9sc8kG2usARE8ec BfcUEcfmgoQszSxqdX93ptqYx52vFB+uhhQoeuMqTlyfxeW8Y8tYbbyBU1862kdEv1uc7m2HY8i c/MLDo+qUVjt6CMEhKzDeOS3wfeog6w7z7+tLDbq4gtzzhBoG7YL8FS9cjgTwcbwR9pc2eCOuqP HsrOEuaR+BqtnL0qIw0T2N+XqgSuFp2BBMHtQf2iv6L/K3ZsV35wU7HaDxqXuMSVrxyGT32SHeF lUv0y48vE62TTuetRr05R/OhUggBblG8owhnfrUqpnJnbqQN
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
 drivers/usb/fotg210/fotg210-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
index cb75464ab290..958fc40eae86 100644
--- a/drivers/usb/fotg210/fotg210-core.c
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -165,7 +165,7 @@ static int fotg210_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fotg210_remove(struct platform_device *pdev)
+static void fotg210_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	enum usb_dr_mode mode;
@@ -176,8 +176,6 @@ static int fotg210_remove(struct platform_device *pdev)
 		fotg210_udc_remove(pdev);
 	else
 		fotg210_hcd_remove(pdev);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -196,7 +194,7 @@ static struct platform_driver fotg210_driver = {
 		.of_match_table = of_match_ptr(fotg210_of_match),
 	},
 	.probe  = fotg210_probe,
-	.remove = fotg210_remove,
+	.remove_new = fotg210_remove,
 };
 
 static int __init fotg210_init(void)
-- 
2.39.2

