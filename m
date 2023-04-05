Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D846D7EC3
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 16:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238534AbjDEOLP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 10:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238160AbjDEOKr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 10:10:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F9959D0
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 07:10:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q5-0003G8-NJ; Wed, 05 Apr 2023 16:10:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q5-009Abz-2C; Wed, 05 Apr 2023 16:10:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q4-00AmUF-CU; Wed, 05 Apr 2023 16:10:16 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 09/10] usb: musb: tusb6010: Convert to platform remove callback returning void
Date:   Wed,  5 Apr 2023 16:10:08 +0200
Message-Id: <20230405141009.3400693-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=P2Rr3wxJ8RtCwrVv8C67f+927sxLjVnIvdqFJiIrgD4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkLYE610yxluT1n7rHPvoOFhGLs/MFXP1T0Psym SUQvNoSZyKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZC2BOgAKCRCPgPtYfRL+ TnZYB/982d1elPkzqHwjPiU9kIwZKVlJiw+XLG4iW+UUjLfnxWpBfVvhx9bchKHtgs3zzaqzlfV ZAvK+tgXpvAkd43nR63xSOs084uMdu2pWrfbMNEcYaoQzLQLSLZ83MPROYjqwhVpYSac4n1ULpv jX3J8oqNKLahAD2z5RVZGwyIUU4uJvVFjeY/YrFUYZqx1nojdTUU+32H0IwHX+1oOf2tHhcT9e6 XV48HLYKqT0IR6XiYtOVUS67JARXs+GiFnu2w0qA4/j0iH6P/ybxZAzbI7VSpKSLGfucDZ4egdA z0kebBwLY0JjHV/m1YPANT08fX27iRV2lwkADbdkp3+29Mun
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
 drivers/usb/musb/tusb6010.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 5609b4e84d40..a1f29dbc62e6 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -1258,19 +1258,17 @@ static int tusb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tusb_remove(struct platform_device *pdev)
+static void tusb_remove(struct platform_device *pdev)
 {
 	struct tusb6010_glue		*glue = platform_get_drvdata(pdev);
 
 	platform_device_unregister(glue->musb);
 	usb_phy_generic_unregister(glue->phy);
-
-	return 0;
 }
 
 static struct platform_driver tusb_driver = {
 	.probe		= tusb_probe,
-	.remove		= tusb_remove,
+	.remove_new	= tusb_remove,
 	.driver		= {
 		.name	= "musb-tusb",
 	},
-- 
2.39.2

