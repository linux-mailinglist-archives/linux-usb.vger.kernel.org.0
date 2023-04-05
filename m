Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 649BA6D7EC4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 16:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238195AbjDEOLQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 10:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238512AbjDEOKr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 10:10:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40DD6EAB
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 07:10:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q5-0003FS-64; Wed, 05 Apr 2023 16:10:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q4-009Abr-I2; Wed, 05 Apr 2023 16:10:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q3-00AmTy-Kb; Wed, 05 Apr 2023 16:10:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 05/10] usb: musb: musb_core: Convert to platform remove callback returning void
Date:   Wed,  5 Apr 2023 16:10:04 +0200
Message-Id: <20230405141009.3400693-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=crGRuOuPMXl4l9l1Z2XFjbub8rVkugfAjCe7A1fNn3U=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhTdRrPkstdrQhwW+t1UMbVvO7antHWBL4OrveHOq1/W5 fSUPBPqZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAic6XZ/+dy/U1ni8nUSowN a5O9mPrBPHxqysxtEUzaZ+ZUxzQWCV83mjnhw33TwP98vZaf18c+k9sksGnSk+o3b95N4EgTrYy dsrLcgqFqVmx8+9IpK3PPz25iEWA+k+v0ZHJgwHsT75ML7u16/SyNqS21wtIqwHKfiPbqVaFabD OlP5hprCgUniDyPDmrMZxJO+zK3ODVqX7q/TPbv3smvo7XiWu6p6X/OS44UOSck+wEk6KpTToOv SsiHgvNsV8mwbR9iYB175MHflN4uP7d3CY3keV2uVrMxtaKFIHWA1LRSbvOpHI/jtKpv3hcNHHX 46d7mXy67LpPznEz6A0O8VucXrpxX6bs1CeToxwrzrUDAA==
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
 drivers/usb/musb/musb_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 648bb6021c5e..d162afbbe19f 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2621,7 +2621,7 @@ static int musb_probe(struct platform_device *pdev)
 	return musb_init_controller(dev, irq, base);
 }
 
-static int musb_remove(struct platform_device *pdev)
+static void musb_remove(struct platform_device *pdev)
 {
 	struct device	*dev = &pdev->dev;
 	struct musb	*musb = dev_to_musb(dev);
@@ -2657,7 +2657,6 @@ static int musb_remove(struct platform_device *pdev)
 	usb_phy_shutdown(musb->xceiv);
 	musb_free(musb);
 	device_init_wakeup(dev, 0);
-	return 0;
 }
 
 #ifdef	CONFIG_PM
@@ -2955,7 +2954,7 @@ static struct platform_driver musb_driver = {
 		.dev_groups	= musb_groups,
 	},
 	.probe		= musb_probe,
-	.remove		= musb_remove,
+	.remove_new	= musb_remove,
 };
 
 module_platform_driver(musb_driver);
-- 
2.39.2

