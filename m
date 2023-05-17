Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87C6E7075C8
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjEQXCr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjEQXCq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C8F44A8
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAN-0007jA-QI; Thu, 18 May 2023 01:02:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAN-000wna-1L; Thu, 18 May 2023 01:02:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAM-005UVJ-9T; Thu, 18 May 2023 01:02:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 01/97] usb: c67x00-drv: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:03 +0200
Message-Id: <20230517230239.187727-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1739; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hPZfHp02+Vw04AFiKV3JOnpPcnGBs9VthvWfAFQ8oxI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVvrY0leO0Fw+vm+tEqXqqU/v8R+H4VcsNaID lFYOzo+PaCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb6wAKCRCPgPtYfRL+ TrrLCACjffi1vVdN+eYClFjsaiJzarpQH72TbWk8zAHxgOIQk+IvHScD7UnFrxqkJ+iOsMq0NpP q8tGt5GKjp/KrAsTmObMd065U40K/f3MIsKDoqeTWre3ccjMLseZLaqIdceNwX6qC0iMd5mCFIr n4gjQFUOdeZcPgdy1Tm5IFjEL/iLVnwAUHq4Mf0v0fVdlzP7gJT1OjjvDh09Sy6WIzJebbRDRPA 9mp6HzIkguMhQU2VtpIfwfG+E315lDUzbBjAcHLj9HdfXLmGSQH48mXyNS+bWFvC2tB+EGefKjs K1Q4jJEKa2W4FpAeu1qr25lOsrR/hkTUZIrKI0y1vGQyi+Ux
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
 drivers/usb/c67x00/c67x00-drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/c67x00/c67x00-drv.c b/drivers/usb/c67x00/c67x00-drv.c
index 6db5cb1b2dbb..bb9d5d7ffefc 100644
--- a/drivers/usb/c67x00/c67x00-drv.c
+++ b/drivers/usb/c67x00/c67x00-drv.c
@@ -177,7 +177,7 @@ static int c67x00_drv_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int c67x00_drv_remove(struct platform_device *pdev)
+static void c67x00_drv_remove(struct platform_device *pdev)
 {
 	struct c67x00_device *c67x00 = platform_get_drvdata(pdev);
 	struct resource *res;
@@ -197,13 +197,11 @@ static int c67x00_drv_remove(struct platform_device *pdev)
 	release_mem_region(res->start, resource_size(res));
 
 	kfree(c67x00);
-
-	return 0;
 }
 
 static struct platform_driver c67x00_driver = {
 	.probe	= c67x00_drv_probe,
-	.remove	= c67x00_drv_remove,
+	.remove_new = c67x00_drv_remove,
 	.driver	= {
 		.name = "c67x00",
 	},
-- 
2.39.2

