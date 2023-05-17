Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F07A670763C
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjEQXEP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjEQXEH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:04:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303FA61B5
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAj-0000Ji-P5; Thu, 18 May 2023 01:03:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAi-000wv7-Jy; Thu, 18 May 2023 01:03:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAh-005UbN-Ti; Thu, 18 May 2023 01:03:03 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 94/97] usb: typec: tcpci_mt6360: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:36 +0200
Message-Id: <20230517230239.187727-95-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ySuLhF08/2hdk62A9ACfiAgi7gCczjq8XSfTGIJpywg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVz+8PYwX2lrDs+Qf8KByZmrjGyD10wS7UFA1 Oh8O9pZRfqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc/gAKCRCPgPtYfRL+ TlJ8CAC2GJLqxGYleQ1mGLAx+k6RSWPZXL4n2QpFoJZITUa1mqFClasT5/I22TKMcbAQ7Q83gH3 HPfCNNri+Jnu/mBrTLOaJFO3EY1bewAauiyKsLIgUoIjNlT/dg18VISgnTTFEy8NLHhYzjIL6xI jFcws8gdn/kwxMrqb+CSC/u3k1QNAdgYMdlSX9SLIyAmBuwPjBT+BL78VLNNEOAwRJTHT+tLT7G ME9+jO4hkRFx5L65OkRD0f4av0MXwtf+qFHcLreFu9TAPtiwpR8PALIe4tcsYVR5vRKesUyvVCy q3mThNI9igqVmFFgkT5EZL8uZGgesbhsYI3qqYpGc8zDQtgs
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
 drivers/usb/typec/tcpm/tcpci_mt6370.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
index c5bb201a5163..2a079464b398 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
@@ -178,12 +178,10 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mt6370_tcpc_remove(struct platform_device *pdev)
+static void mt6370_tcpc_remove(struct platform_device *pdev)
 {
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-
-	return 0;
 }
 
 static const struct of_device_id mt6370_tcpc_devid_table[] = {
@@ -198,7 +196,7 @@ static struct platform_driver mt6370_tcpc_driver = {
 		.of_match_table = mt6370_tcpc_devid_table,
 	},
 	.probe = mt6370_tcpc_probe,
-	.remove = mt6370_tcpc_remove,
+	.remove_new = mt6370_tcpc_remove,
 };
 module_platform_driver(mt6370_tcpc_driver);
 
-- 
2.39.2

