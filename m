Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0F7C707622
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjEQXDy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjEQXDw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC286EA0
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:24 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAX-0007zc-Iu; Thu, 18 May 2023 01:02:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-000wq0-Ex; Thu, 18 May 2023 01:02:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAS-005UXA-5e; Thu, 18 May 2023 01:02:48 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 31/97] usb: gadget/fusb300_udc: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:33 +0200
Message-Id: <20230517230239.187727-32-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=R4tDeXyFW9SyhShxJC0E+iv5Shp+tVOz0vyHN3o0/XE=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTUGFl+wWDhs3uOixpWcDm8z0s6tO3InGy3R9bHVScs6 Z27UU6yk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJXOniYNgQnZNz7YvGDT3l qM4elbV7TFO4Iox8bignyEQ/s/xR5HS/+KzFhTNrRfYfUjLdcMIhnvPDnpX6io88ytUu9YvFsof sPfo9drvXTfPdZl9/XlgjVZnTcMWGN09SyY5VhC/qRUqIybmGVdIPrL08v3NKT2IVmnXhfUcX/5 pDUxzXussGm4Sxyly2K346uYufbX+di9mdvdcfyl+wSdBV/G7ik1pyu/RE9eonc/cs3Wh/3aMkU 0xFUWv9Ki2jGVcWNsjmRGbPXX/k6fI1R269ihEPYGWWnaH1q+fo4kbO9gzeklCFcnOBLWwvlM/O v+zu9FBnY0a37uLXB698/qoi7tYr9H6iWbZQABPPCwlfAA==
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
 drivers/usb/gadget/udc/fusb300_udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
index 08ba9c8c1e67..bd03d475f927 100644
--- a/drivers/usb/gadget/udc/fusb300_udc.c
+++ b/drivers/usb/gadget/udc/fusb300_udc.c
@@ -1338,7 +1338,7 @@ static const struct usb_gadget_ops fusb300_gadget_ops = {
 	.udc_stop	= fusb300_udc_stop,
 };
 
-static int fusb300_remove(struct platform_device *pdev)
+static void fusb300_remove(struct platform_device *pdev)
 {
 	struct fusb300 *fusb300 = platform_get_drvdata(pdev);
 	int i;
@@ -1352,8 +1352,6 @@ static int fusb300_remove(struct platform_device *pdev)
 	for (i = 0; i < FUSB300_MAX_NUM_EP; i++)
 		kfree(fusb300->ep[i]);
 	kfree(fusb300);
-
-	return 0;
 }
 
 static int fusb300_probe(struct platform_device *pdev)
@@ -1508,7 +1506,7 @@ static int fusb300_probe(struct platform_device *pdev)
 }
 
 static struct platform_driver fusb300_driver = {
-	.remove =	fusb300_remove,
+	.remove_new =	fusb300_remove,
 	.driver		= {
 		.name =	udc_name,
 	},
-- 
2.39.2

