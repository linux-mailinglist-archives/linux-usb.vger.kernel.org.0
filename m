Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 764657075EA
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjEQXDJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjEQXC5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D835B9C
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-00083O-CE; Thu, 18 May 2023 01:02:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAU-000wqO-9V; Thu, 18 May 2023 01:02:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-005UXe-K2; Thu, 18 May 2023 01:02:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 38/97] usb: gadget/r8a66597-udc: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:40 +0200
Message-Id: <20230517230239.187727-39-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NDY1z3UVJjfsaLxnsnm+4fEeVi8s19FlTEjtWSTeQ7k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVw0I+F8ByazoxLSC9g0HQrr8uNUAgZnhICwP UxKXtu60yyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcNAAKCRCPgPtYfRL+ TqBjCACKN1ypIP6SHzHgNtFeviP4t+GsU6SPJPCGxTJ0yNrwh10fyzqXmObmeUSQu4JhCOC8foo u4ho6aHlBt9pHmJk3TeAXsXyHBmTjj7wm8TBG6JRPCV51XBiDx4JIqwInUqWog4qEu/9gUHrPui 2xqiCCPlgNAMHSiadhY2JO4qYPH+bYyexUVn5wtJqWjWpRJrfx7vctRdDXQoLYFW2MY+2dfHzwl LzwcD+/Ck+QazQu4Nzk5Fn+C36Ki2y6FtBuW9O9Xzh84OoaPP7wjDQ7dD2/iL+k9bhQVkLAUcrI FORzQovAophFkJq0QU14OF53AAgC79fpyLAUpf/5SBe/uXZa
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
 drivers/usb/gadget/udc/r8a66597-udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r8a66597-udc.c
index 38e4d6b505a0..51b665f15c8e 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -1805,7 +1805,7 @@ static const struct usb_gadget_ops r8a66597_gadget_ops = {
 	.set_selfpowered	= r8a66597_set_selfpowered,
 };
 
-static int r8a66597_remove(struct platform_device *pdev)
+static void r8a66597_remove(struct platform_device *pdev)
 {
 	struct r8a66597		*r8a66597 = platform_get_drvdata(pdev);
 
@@ -1816,8 +1816,6 @@ static int r8a66597_remove(struct platform_device *pdev)
 	if (r8a66597->pdata->on_chip) {
 		clk_disable_unprepare(r8a66597->clk);
 	}
-
-	return 0;
 }
 
 static void nop_completion(struct usb_ep *ep, struct usb_request *r)
@@ -1966,7 +1964,7 @@ static int r8a66597_probe(struct platform_device *pdev)
 
 /*-------------------------------------------------------------------------*/
 static struct platform_driver r8a66597_driver = {
-	.remove =	r8a66597_remove,
+	.remove_new =	r8a66597_remove,
 	.driver		= {
 		.name =	udc_name,
 	},
-- 
2.39.2

