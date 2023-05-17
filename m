Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 288B27075D3
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjEQXCz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjEQXCu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF41F5588
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-0007mk-KZ; Thu, 18 May 2023 01:02:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-000wol-WD; Thu, 18 May 2023 01:02:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-005UWE-8i; Thu, 18 May 2023 01:02:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 16/97] usb: dwc3-keystone: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:18 +0200
Message-Id: <20230517230239.187727-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9oQ5FZlheGoiZxTsB/AhzlUE7gUOhffJXUeCwa855MY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVv8Ipp+w3ZEAX96/FLT3q4m7ca89yfmcwfWu kUdy3uFo6OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb/AAKCRCPgPtYfRL+ TtZKCACK+hI9pjTHUQ21DN5s9lGFeYhF7JSRoMBsWHAKHj5YQJsEkyfff8tMu5mDc+XvUDYfnoU 4Gzi7IIB4bXWoUGCN//NAD6+bPr+pxoJXm1I7ofVEVgHKhssEAhHx/dG9aZDjGBqUJeLLTDZCap I1ySbbvaLWY1OZphoUS1+qiYX8xT6Oh09moO1vDfDTqPJWwmUBF4qsZ9XDotq6dra2Gn4W6LyaQ b00NVgdAEw/bnspyvJH0AvRsKzAN8BYVVgahnIBO5fvlyCZpNzmvbX75pXidV2D7n1dDfSs/34k MW3jwYrDGJeqTlD4t4bZ4zaNGuKsEBGP06TZYXKWcXWwkNX7
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
 drivers/usb/dwc3/dwc3-keystone.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
index 1317959294e6..0a09aedc2573 100644
--- a/drivers/usb/dwc3/dwc3-keystone.c
+++ b/drivers/usb/dwc3/dwc3-keystone.c
@@ -181,7 +181,7 @@ static int kdwc3_remove_core(struct device *dev, void *c)
 	return 0;
 }
 
-static int kdwc3_remove(struct platform_device *pdev)
+static void kdwc3_remove(struct platform_device *pdev)
 {
 	struct dwc3_keystone *kdwc = platform_get_drvdata(pdev);
 	struct device_node *node = pdev->dev.of_node;
@@ -198,8 +198,6 @@ static int kdwc3_remove(struct platform_device *pdev)
 	phy_pm_runtime_put_sync(kdwc->usb3_phy);
 
 	platform_set_drvdata(pdev, NULL);
-
-	return 0;
 }
 
 static const struct of_device_id kdwc3_of_match[] = {
@@ -211,7 +209,7 @@ MODULE_DEVICE_TABLE(of, kdwc3_of_match);
 
 static struct platform_driver kdwc3_driver = {
 	.probe		= kdwc3_probe,
-	.remove		= kdwc3_remove,
+	.remove_new	= kdwc3_remove,
 	.driver		= {
 		.name	= "keystone-dwc3",
 		.of_match_table	= kdwc3_of_match,
-- 
2.39.2

