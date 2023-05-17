Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE8B0707623
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjEQXDz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbjEQXDx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150F16EA2
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-00084n-B6; Thu, 18 May 2023 01:02:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAU-000wqV-K8; Thu, 18 May 2023 01:02:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-005UXi-Px; Thu, 18 May 2023 01:02:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Zheng Wang <zyytlz.wz@163.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 39/97] usb: gadget/renesas_usb3: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:41 +0200
Message-Id: <20230517230239.187727-40-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2052; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=jQiPorhy6sNtZg2n3wvkp/teyD+YbG0swuuTx0hPAG0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVw1+egEb8vx2pZgEJczEhbNjlP2vUbJAdzF+ iqIDRRGs7KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcNQAKCRCPgPtYfRL+ TrefB/94n9QainGS7gVjWaf91wMRQfDpGRsWKld5YL1KQb6d/Oi4m6ihR5WdgER8ivIuNIYtse6 2GTK0fvjTyeV9KshlwwS9to0rflDYs1z5zsPphKEhFH30pALYtiND8JaPzQpXukyxYtPKy8vMJd P+9EULRlIZJRnNPq6pjAzFIUHLQ+CTGAhoR673pnhghLO2xDVjSqkP2QgtVtS6RE+xstuIixOy4 Y5ageGyWIDzsXqquX7G7sQE1LaV7Sa2v7r6FchTGylZOgtjFSUwFkSvazQPYUVld0hwFC4jpk2O k7+SrwC02eAoPhMlXaQSEKA+FhJqlKy+HZHJaa9kdn920SOr
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
 drivers/usb/gadget/udc/renesas_usb3.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index aac8bc185afa..7443b60da5d2 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2653,7 +2653,7 @@ static void renesas_usb3_debugfs_init(struct renesas_usb3 *usb3,
 }
 
 /*------- platform_driver ------------------------------------------------*/
-static int renesas_usb3_remove(struct platform_device *pdev)
+static void renesas_usb3_remove(struct platform_device *pdev)
 {
 	struct renesas_usb3 *usb3 = platform_get_drvdata(pdev);
 
@@ -2669,8 +2669,6 @@ static int renesas_usb3_remove(struct platform_device *pdev)
 
 	__renesas_usb3_ep_free_request(usb3->ep0_req);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int renesas_usb3_init_ep(struct renesas_usb3 *usb3, struct device *dev,
@@ -3015,7 +3013,7 @@ static SIMPLE_DEV_PM_OPS(renesas_usb3_pm_ops, renesas_usb3_suspend,
 
 static struct platform_driver renesas_usb3_driver = {
 	.probe		= renesas_usb3_probe,
-	.remove		= renesas_usb3_remove,
+	.remove_new	= renesas_usb3_remove,
 	.driver		= {
 		.name =	udc_name,
 		.pm		= &renesas_usb3_pm_ops,
-- 
2.39.2

