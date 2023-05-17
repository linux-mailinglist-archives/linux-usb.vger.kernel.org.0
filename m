Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A747D7075D2
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjEQXCy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjEQXCu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6745276
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-0007m5-7E; Thu, 18 May 2023 01:02:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-000woZ-Fq; Thu, 18 May 2023 01:02:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-005UVu-At; Thu, 18 May 2023 01:02:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 11/97] usb: dwc2/platform: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:13 +0200
Message-Id: <20230517230239.187727-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OGgS/GQVc+n0DjeVx3kCPbw/xZNkDel9cy+Cog9KMuI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVv3ph7GbV3zffwh3MvjJIWxoBT2SclZfkpfV WpqX1XUjOOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb9wAKCRCPgPtYfRL+ TsMpB/0fajK6xhDXQbSfqWl9vja+JuK6r6Lp9jtCttI5I/IVgDAXKcuCnhv0P0BqF5irsMGw1u4 rAa53fEvg0YSdJmBglx7wyigRdCn2d0d21izgsfY5S69ezA/bZOLSRGugV4qI1dB4bo04jm2w1C IIs0YhDyuiyZlH53sFUlLaVbC3sfmeabfi5fs3fbfZ+ockuNfX8GFqyfec+cr8/F4actyeHdRby NrSWILHxQb/Ty6D9y9k4kgD8E10d5WCU3C5LmU72Gr4LcaXGLrgz/2KYsZ60BFrwbskwFuYnICu 14p0hImaUpUZGuE0w3agA0MhsaFUWirHWqsJPoRfUooxesW7
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
 drivers/usb/dwc2/platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 5aee284018c0..3157db9f21bd 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -288,7 +288,7 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
  * stops device processing. Any resources used on behalf of this device are
  * freed.
  */
-static int dwc2_driver_remove(struct platform_device *dev)
+static void dwc2_driver_remove(struct platform_device *dev)
 {
 	struct dwc2_hsotg *hsotg = platform_get_drvdata(dev);
 	struct dwc2_gregs_backup *gr;
@@ -341,8 +341,6 @@ static int dwc2_driver_remove(struct platform_device *dev)
 
 	reset_control_assert(hsotg->reset);
 	reset_control_assert(hsotg->reset_ecc);
-
-	return 0;
 }
 
 /**
@@ -746,7 +744,7 @@ static struct platform_driver dwc2_platform_driver = {
 		.pm = &dwc2_dev_pm_ops,
 	},
 	.probe = dwc2_driver_probe,
-	.remove = dwc2_driver_remove,
+	.remove_new = dwc2_driver_remove,
 	.shutdown = dwc2_driver_shutdown,
 };
 
-- 
2.39.2

