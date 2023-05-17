Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A48BD7075ED
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjEQXDM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbjEQXC6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666934C02
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAX-00087k-HR; Thu, 18 May 2023 01:02:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAV-000wqm-Fy; Thu, 18 May 2023 01:02:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAU-005UXt-BN; Thu, 18 May 2023 01:02:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 42/97] usb: gadget/snps_udc_plat: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:44 +0200
Message-Id: <20230517230239.187727-43-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=GZKZtr6FvVppdTP0wluupIzhs1D1LebeK0y89z4ljPM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTUGAu27GrnyP+Rc0PPiHrzXy81f/O9L/H4LY3cKVNnr Tit+7C1k9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJZKzkYJgXuoXxbcWdC7kB IUW5a/iW86nWNVk0tdypWv6kRNQ9PMhF+3bz4azTW15c5Fdk25eQOqOdmzP5yK8rSQE7f6u9KXs 1Q0bed+MVs4obYYz3bRXZlocnbFZq3xf5iEPgqsCppmlHg6z3MTy59tF/8k+uX9vd6nNvKwg79p SuMbhZxpMtkHgh6v/51QsKi47UTP2TmafjJuuwcuGxrJJTttclOiobOXb953sR9e5Bwc2VdxLtS zxuCbr2GJf7Rosb5r/ulj5caT/hfsXnRy41GVNuNggvVPu6liflkeGeTYt9jx9WOxYf9+yoxS+b 77v/bZZW5K7skqrVd1bTcm+vKctiznB4e1htq/rfju3vAQ==
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
 drivers/usb/gadget/udc/snps_udc_plat.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index 0d3e705655b9..0ed685db149d 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -225,7 +225,7 @@ static int udc_plat_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int udc_plat_remove(struct platform_device *pdev)
+static void udc_plat_remove(struct platform_device *pdev)
 {
 	struct udc *dev;
 
@@ -234,7 +234,7 @@ static int udc_plat_remove(struct platform_device *pdev)
 	usb_del_gadget_udc(&dev->gadget);
 	/* gadget driver must not be registered */
 	if (WARN_ON(dev->driver))
-		return 0;
+		return;
 
 	/* dma pool cleanup */
 	free_dma_pools(dev);
@@ -248,8 +248,6 @@ static int udc_plat_remove(struct platform_device *pdev)
 	extcon_unregister_notifier(dev->edev, EXTCON_USB, &dev->nb);
 
 	dev_info(&pdev->dev, "Synopsys UDC platform driver removed\n");
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -315,7 +313,7 @@ MODULE_DEVICE_TABLE(of, of_udc_match);
 
 static struct platform_driver udc_plat_driver = {
 	.probe		= udc_plat_probe,
-	.remove		= udc_plat_remove,
+	.remove_new	= udc_plat_remove,
 	.driver		= {
 		.name	= "snps-udc-plat",
 		.of_match_table = of_match_ptr(of_udc_match),
-- 
2.39.2

