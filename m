Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDB26D7ECA
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 16:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238339AbjDEOLW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 10:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238286AbjDEOKy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 10:10:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2973E4EDB
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 07:10:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q6-0003H0-F2; Wed, 05 Apr 2023 16:10:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q5-009AcF-Qv; Wed, 05 Apr 2023 16:10:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q4-00AmUI-JF; Wed, 05 Apr 2023 16:10:16 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 10/10] usb: musb: ux500: Convert to platform remove callback returning void
Date:   Wed,  5 Apr 2023 16:10:09 +0200
Message-Id: <20230405141009.3400693-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=eLu4VSPwdEZkERiXVgtXQcIuc34wrNncmVN9nUn/meQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkLYE81erFsrPrNRsIFG11KRo/L3B2X+Ts17oJf FqIDuTOCQSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZC2BPAAKCRCPgPtYfRL+ Tn+3B/9JATq6Y6RamcK5orLBtsBTiC+zmeFY5CLye1O/U2sZjaATMtUbws0D9x5JxiC/xjqvVDE tQXgQ/91yWGYYlitz+v/kqXwDme9DTqiHAxg5lXvaOyyaLwe3DhI+t4tm1WvuSGXSd1vNS4tsey TLWA8jJv+/sr4Fik8vql1G2RWz94yxJmyXut5vuuTgMS9VQjpH8+Pqw/n+OT7YwxgS3sGKcLzIv 4A9IHjmBLXxuV0hASO5prd7FCvSnbxSZP0ERgv0GoLdtFcUPNVZVcDOKM1AsVNkXpJ7C7RnPRL/ NDCM3hz6BltBbpH3FRHz0mDY9HrTTqH6vUHVWF26ViD6IvTz
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
 drivers/usb/musb/ux500.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/ux500.c b/drivers/usb/musb/ux500.c
index 8ea62c344328..c8d9d2a1d2f0 100644
--- a/drivers/usb/musb/ux500.c
+++ b/drivers/usb/musb/ux500.c
@@ -303,14 +303,12 @@ static int ux500_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ux500_remove(struct platform_device *pdev)
+static void ux500_remove(struct platform_device *pdev)
 {
 	struct ux500_glue	*glue = platform_get_drvdata(pdev);
 
 	platform_device_unregister(glue->musb);
 	clk_disable_unprepare(glue->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -357,7 +355,7 @@ MODULE_DEVICE_TABLE(of, ux500_match);
 
 static struct platform_driver ux500_driver = {
 	.probe		= ux500_probe,
-	.remove		= ux500_remove,
+	.remove_new	= ux500_remove,
 	.driver		= {
 		.name	= "musb-ux500",
 		.pm	= &ux500_pm_ops,
-- 
2.39.2

