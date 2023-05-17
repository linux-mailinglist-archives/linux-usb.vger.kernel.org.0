Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 439C27075CE
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjEQXCw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjEQXCu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71EF649C1
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-0007lu-6q; Thu, 18 May 2023 01:02:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-000woT-8T; Thu, 18 May 2023 01:02:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-005UW3-Lv; Thu, 18 May 2023 01:02:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 13/97] usb: dwc3-am62: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:15 +0200
Message-Id: <20230517230239.187727-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9V9gRu8K0laR4ZMkL+6LJuFgAUBxGO0zZORttVpkS6g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVv5yapp4u3/UeQZ49Ab5EWNlkQbTcJConG7M 71eO6b1u0KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb+QAKCRCPgPtYfRL+ Tub/B/sH3Gc9bRQQJSzS5kPSSK+jcdUb9oHCC8kbcWSp9L1EDoFKCTHapoCIUxG0mo/Arectpe4 bNqNdNYgFW4JxRZl0WUUouurfGhldMzBH80uytR3QqcEqZ2BUrtXK2om56hy0Q94TzsWOpZcvGI yzQY7j+IWfJyM/PWINPyB1um1l0J0Foh+tu+G7aJELwE/gYIPHWAYGHS/Tqx3/FY72rPrL+8Yrk H2+Y7oI0firf5a4Iper9obZmqydJuyWZqcZcQzGz2JF3zi1xSW1wDOJvfXNM0HIFfpIyVgYNhHV o4DYSEMvrXXByqVATNaoX+pyneTyZWFIq3Fsv/dvhP2ZpQbQ
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
 drivers/usb/dwc3/dwc3-am62.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index cda9458c809b..1755f2f848c5 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -275,7 +275,7 @@ static int dwc3_ti_remove_core(struct device *dev, void *c)
 	return 0;
 }
 
-static int dwc3_ti_remove(struct platform_device *pdev)
+static void dwc3_ti_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dwc3_data *data = platform_get_drvdata(pdev);
@@ -294,7 +294,6 @@ static int dwc3_ti_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(dev);
 
 	platform_set_drvdata(pdev, NULL);
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -362,7 +361,7 @@ MODULE_DEVICE_TABLE(of, dwc3_ti_of_match);
 
 static struct platform_driver dwc3_ti_driver = {
 	.probe		= dwc3_ti_probe,
-	.remove		= dwc3_ti_remove,
+	.remove_new	= dwc3_ti_remove,
 	.driver		= {
 		.name	= "dwc3-am62",
 		.pm	= DEV_PM_OPS,
-- 
2.39.2

