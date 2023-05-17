Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C8D7075E8
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjEQXDI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbjEQXCz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340E54EF3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-0007sd-VR; Thu, 18 May 2023 01:02:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAS-000wpZ-60; Thu, 18 May 2023 01:02:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-005UWk-Rl; Thu, 18 May 2023 01:02:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 24/97] usb: gadget: hid: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:26 +0200
Message-Id: <20230517230239.187727-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1PRI/mCipOGi8CtQHbGDFoQEMoyvZqKEjaTqhrDxJCw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwGAvSnSf1C4Wd8ldbDfLVnitx+uG7OsjTbL pFbhqEGN8uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcBgAKCRCPgPtYfRL+ To0YB/4in6/Ww5/y4b6GVokCZu+TmHG8JCk2OCZS/DVe/y6fV/j/13iad0S/ZAJBgQF3Hqgy20g LsvyPRcardAG2jGlzyowhKojNi6cD3iMujC50/n2KS+It0zuPC9wrVJ/jdDtQIATp/MP28nf9TE 3E3ll/57nyeYDvjHlQnBokmoldK5kPBqWzTjZfveawjFeTLir3lNwxHhJv4v+sKRTeLAmsNZNK1 NkUZAmAAMqikshqmoO182ZriecMAFf+TODjPKA5dHlN3JVdPaFbzRSRkcgMsF9GAKgcZEIz0prs wmjVyZMOY+/K9KIhe/NyGmHK3+vaDfuDuCVAaQxl6DglBDbU
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
 drivers/usb/gadget/legacy/hid.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/legacy/hid.c b/drivers/usb/gadget/legacy/hid.c
index 133daf88162e..4ca67b2f8f24 100644
--- a/drivers/usb/gadget/legacy/hid.c
+++ b/drivers/usb/gadget/legacy/hid.c
@@ -237,7 +237,7 @@ static int hidg_plat_driver_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int hidg_plat_driver_remove(struct platform_device *pdev)
+static void hidg_plat_driver_remove(struct platform_device *pdev)
 {
 	struct hidg_func_node *e, *n;
 
@@ -245,8 +245,6 @@ static int hidg_plat_driver_remove(struct platform_device *pdev)
 		list_del(&e->node);
 		kfree(e);
 	}
-
-	return 0;
 }
 
 
@@ -263,7 +261,7 @@ static struct usb_composite_driver hidg_driver = {
 };
 
 static struct platform_driver hidg_plat_driver = {
-	.remove		= hidg_plat_driver_remove,
+	.remove_new	= hidg_plat_driver_remove,
 	.driver		= {
 		.name	= "hidg",
 	},
-- 
2.39.2

