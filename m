Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F93707634
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjEQXEJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjEQXEE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:04:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61CBA7289
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAX-00088U-RT; Thu, 18 May 2023 01:02:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAV-000wqt-Lw; Thu, 18 May 2023 01:02:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAU-005UXp-5m; Thu, 18 May 2023 01:02:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 41/97] usb: gadget/rzv2m_usb3drd: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:43 +0200
Message-Id: <20230517230239.187727-42-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1971; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=w54+42McoK76jI0g6Y71OmcuxsZ4Tbj0xof+53QQfpM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVw34DEN5EDPwgdOmTaXvKczCEAj4mNVi97qA QHrRt2CACKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcNwAKCRCPgPtYfRL+ Th6gCACpVBY3g/EHSwqBLLOskJMgo1sFcBibMVYh7c1HAzXCzG0veism3uT8m+kJqt719j+QJqc OVxhZTxfRA8tMuM0EbJaGqPhCSCcjHVgARZNHAyTiF7mHvR3hLvdwDk/4Ak4+/6KxZkAmjlNPCj /diJs5RKoEhWXdXLyZ6R6vISkRHEXEKsKKwqQXqDS2C6kwSWaDQNijVIG3eG4HHQSg6b3CuwxQt 0LnsQK95KdijXTq1Lp3w2pJ2Nz3QNVLHYGkfaU8QZNE3WYPn1Fe7I7NoxfZPAvbcB16omkT4vPa D7kvEf/6JeDOs57/VkGtdQGepyRLg2a9jyrP3bTxKrOWfACE
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
 drivers/usb/gadget/udc/rzv2m_usb3drd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/rzv2m_usb3drd.c b/drivers/usb/gadget/udc/rzv2m_usb3drd.c
index 589c7252e014..36f4ff00d22f 100644
--- a/drivers/usb/gadget/udc/rzv2m_usb3drd.c
+++ b/drivers/usb/gadget/udc/rzv2m_usb3drd.c
@@ -58,7 +58,7 @@ void rzv2m_usb3drd_reset(struct device *dev, bool host)
 }
 EXPORT_SYMBOL_GPL(rzv2m_usb3drd_reset);
 
-static int rzv2m_usb3drd_remove(struct platform_device *pdev)
+static void rzv2m_usb3drd_remove(struct platform_device *pdev)
 {
 	struct rzv2m_usb3drd *usb3 = platform_get_drvdata(pdev);
 
@@ -66,8 +66,6 @@ static int rzv2m_usb3drd_remove(struct platform_device *pdev)
 	pm_runtime_put(usb3->dev);
 	pm_runtime_disable(&pdev->dev);
 	reset_control_assert(usb3->drd_rstc);
-
-	return 0;
 }
 
 static int rzv2m_usb3drd_probe(struct platform_device *pdev)
@@ -129,7 +127,7 @@ static struct platform_driver rzv2m_usb3drd_driver = {
 		.of_match_table = rzv2m_usb3drd_of_match,
 	},
 	.probe = rzv2m_usb3drd_probe,
-	.remove = rzv2m_usb3drd_remove,
+	.remove_new = rzv2m_usb3drd_remove,
 };
 module_platform_driver(rzv2m_usb3drd_driver);
 
-- 
2.39.2

