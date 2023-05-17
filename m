Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E3C707615
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjEQXDo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjEQXDW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F1C5B9C
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-00083T-Oa; Thu, 18 May 2023 01:02:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAU-000wqQ-Ay; Thu, 18 May 2023 01:02:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-005UXY-Dj; Thu, 18 May 2023 01:02:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 37/97] usb: gadget/pxa27x_udc: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:39 +0200
Message-Id: <20230517230239.187727-38-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=AB6Qc5t/8gqVgqQitKrVK5pHAZ3kpC/w1Xz6/501WaY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwusaOORV0/PZ+MFMU1KGWA+wYFWmTfhVjF4 XvSeOEID4SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcLgAKCRCPgPtYfRL+ TvI2CAChfq00NMwsfSmmb4w2bXtwhuQHTHrmSm5wscUPeK1Hi0phdb/6mJ5Tn8M75kgdFwXD+gP 8GubIYYl0HKF9h66Znm4JZSUrv1TAGHBgrduYCTNRQI7zXe9nxHCwk7dZFeMzhDAx76aPp1FPKu TkLItUX5g6i8gQBl351OBxDyNXqVcKx8ZL8iGYzzzd2ZOdX/3+655m6jSD4xaZh2CVZYf8B0vxs vEYPbvtyF7HTW3upZSpLKnmmtU3Qn+MUK51nNOp16sZsojcMqnHC61gkGylO5a4cIf1DcATzPEK piKzKnI74nyVF+usymQFpGE4I7pbTy1te37lbdT2X7DFQw5y
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
 drivers/usb/gadget/udc/pxa27x_udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 0ecdfd2ba9e9..ab31fe35f059 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2445,7 +2445,7 @@ static int pxa_udc_probe(struct platform_device *pdev)
  * pxa_udc_remove - removes the udc device driver
  * @_dev: platform device
  */
-static int pxa_udc_remove(struct platform_device *_dev)
+static void pxa_udc_remove(struct platform_device *_dev)
 {
 	struct pxa_udc *udc = platform_get_drvdata(_dev);
 
@@ -2460,8 +2460,6 @@ static int pxa_udc_remove(struct platform_device *_dev)
 	udc->transceiver = NULL;
 	the_controller = NULL;
 	clk_unprepare(udc->clk);
-
-	return 0;
 }
 
 static void pxa_udc_shutdown(struct platform_device *_dev)
@@ -2547,7 +2545,7 @@ static struct platform_driver udc_driver = {
 		.of_match_table = of_match_ptr(udc_pxa_dt_ids),
 	},
 	.probe		= pxa_udc_probe,
-	.remove		= pxa_udc_remove,
+	.remove_new	= pxa_udc_remove,
 	.shutdown	= pxa_udc_shutdown,
 #ifdef CONFIG_PM
 	.suspend	= pxa_udc_suspend,
-- 
2.39.2

