Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E906270760F
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjEQXDk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjEQXDT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263DD5BBD
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAX-00082Z-Q5; Thu, 18 May 2023 01:02:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAU-000wqK-4D; Thu, 18 May 2023 01:02:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-005UXU-7C; Thu, 18 May 2023 01:02:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Richard Leitner <richard.leitner@linux.dev>,
        Colin Ian King <colin.i.king@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 36/97] usb: gadget/omap_udc: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:38 +0200
Message-Id: <20230517230239.187727-37-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BEpoIGFwDuicKHv28sqGt3VfmN27wr8s2JJtjkEWcmo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVws+jbX089C16AYYv0oZGqLTLl+4RxbLfZi/ fgSwLA5jOqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcLAAKCRCPgPtYfRL+ ThmMB/9VwaKQ5fkbdJGcFK3AqhgHv3DqGO429yUz1dORlZC8y65k0VKcZ2cR0LKngh0HMAHEsw0 JiUSKP6H2EQRxsUhbRVymnmDEZwJKFvSDEtnWfbUP6xZqfx603IQQ2DD3qu5TyoCLP6MPlSeS60 KnDLZTyAYeYVJ4hJgnDruOsGl5y1NVwlln4z2kCD9nLfzsZa1IS8PLLeqyBucasXMYzFh5V8om3 eZK4KMlwlFt/IfbzNC4yJ9TDy+U8z3RNPyEvSRskSCtSsCZyr6m9ygQO8uofdMw5VF4B082y5no apGKi6+uJsmDENpiabpk+Lm3jnNiaO499FiWaUng8TRsZm9C
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
 drivers/usb/gadget/udc/omap_udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index 2d87c7cd5f7e..10c5d7f726a1 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -2927,7 +2927,7 @@ static int omap_udc_probe(struct platform_device *pdev)
 	return status;
 }
 
-static int omap_udc_remove(struct platform_device *pdev)
+static void omap_udc_remove(struct platform_device *pdev)
 {
 	DECLARE_COMPLETION_ONSTACK(done);
 
@@ -2939,8 +2939,6 @@ static int omap_udc_remove(struct platform_device *pdev)
 
 	release_mem_region(pdev->resource[0].start,
 			   resource_size(&pdev->resource[0]));
-
-	return 0;
 }
 
 /* suspend/resume/wakeup from sysfs (echo > power/state) or when the
@@ -2985,7 +2983,7 @@ static int omap_udc_resume(struct platform_device *dev)
 
 static struct platform_driver udc_driver = {
 	.probe		= omap_udc_probe,
-	.remove		= omap_udc_remove,
+	.remove_new	= omap_udc_remove,
 	.suspend	= omap_udc_suspend,
 	.resume		= omap_udc_resume,
 	.driver		= {
-- 
2.39.2

