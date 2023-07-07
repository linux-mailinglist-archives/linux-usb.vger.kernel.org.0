Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F20F174AC07
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jul 2023 09:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjGGHh2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jul 2023 03:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232413AbjGGHhZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jul 2023 03:37:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E2C31FEA
        for <linux-usb@vger.kernel.org>; Fri,  7 Jul 2023 00:37:16 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qHg1V-0003tW-OG; Fri, 07 Jul 2023 09:37:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qHg1S-00CgIj-Cn; Fri, 07 Jul 2023 09:36:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qHg1R-002wpH-J2; Fri, 07 Jul 2023 09:36:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Minda Chen <minda.chen@starfivetech.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Roger Quadros <rogerq@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] usb: cdns3: starfive: Convert to platform remove callback returning void
Date:   Fri,  7 Jul 2023 09:36:53 +0200
Message-Id: <20230707073653.3396988-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EjGU5IA+QV8IMaHMCAPe1bG3vScw+H40F0BF87nyzjU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkp8CUTJKvfbqjVsGgzJJKbYN8y6AXVWMXb6DNh spgyeNUWgqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZKfAlAAKCRCPgPtYfRL+ ToMXB/4kimNYH8qLRhouQQdJZ9cPTh39Z5U9QsC1dsGUpbVvL9YbGWoDjl2xNIJo5GSFHbw7P7L /wmeW8VGC5gs3OE0+hnzoXSodLSYJRyEoGZbRx7qGDTD8j2cEoqIpq3nnRZOAZjrEE0yU7azkUE ovuuhmpAqK/Me1nDj9nGmVq1kRLTNCxhjVshFAF0pCAHQKCJ64DuNTezZ1xXf6rAVn48qmncvQr YCkSWiuev1A+4sUjR9WHTTX3L8JLfeNuUxWnu4+ElrFpvqTe4h/qf+pt31zFp0oPk+4FrqQvL4T F2KyAnJTvWdyjRiaHOInW5hkhVZHy7EB4EgcqsHbrR9tVh7Y
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
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/cdns3/cdns3-starfive.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-starfive.c b/drivers/usb/cdns3/cdns3-starfive.c
index fc1f003b145d..a7265b86e427 100644
--- a/drivers/usb/cdns3/cdns3-starfive.c
+++ b/drivers/usb/cdns3/cdns3-starfive.c
@@ -166,7 +166,7 @@ static int cdns_starfive_remove_core(struct device *dev, void *c)
 	return 0;
 }
 
-static int cdns_starfive_remove(struct platform_device *pdev)
+static void cdns_starfive_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct cdns_starfive *data = dev_get_drvdata(dev);
@@ -178,8 +178,6 @@ static int cdns_starfive_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	cdns_clk_rst_deinit(data);
 	platform_set_drvdata(pdev, NULL);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -232,7 +230,7 @@ MODULE_DEVICE_TABLE(of, cdns_starfive_of_match);
 
 static struct platform_driver cdns_starfive_driver = {
 	.probe		= cdns_starfive_probe,
-	.remove		= cdns_starfive_remove,
+	.remove_new	= cdns_starfive_remove,
 	.driver		= {
 		.name	= "cdns3-starfive",
 		.of_match_table	= cdns_starfive_of_match,

base-commit: 5133c9e51de41bfa902153888e11add3342ede18
-- 
2.39.2

