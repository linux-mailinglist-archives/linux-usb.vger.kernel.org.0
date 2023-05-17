Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7FF17075FB
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjEQXDY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjEQXDG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6CD5588
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-0008Fv-DA; Thu, 18 May 2023 01:02:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-000wrq-Dl; Thu, 18 May 2023 01:02:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-005UYf-Nc; Thu, 18 May 2023 01:02:52 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 54/97] usb: ehci-platform: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:56 +0200
Message-Id: <20230517230239.187727-55-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vGVcW37lCh+0YUFKFc9sSG9amXfxRU5Y5mm1ILry/ek=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTUmCjXwm///x9vrvPb+d/tVy6H3Yr9SSudJ+zxsVJZc 1+DkSukk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJBLuz/zMT7nLn2Mb+/pd/ tJnbBcf5BwTvLd3Ruji/d2vTF8saKSWWkPNtbGHnZMwOyXVkqwiJd0cF8xg3+ezpks+u7JE1bfR njPjawBEb0nYutFO/VO3ln0tvS3YrtnDcYFIwnhfUeNuRbwn/0fsPOC+c6ctcO08/sSpOcl6TkY bx2Ry2mZJ3DrJ+r3rVdixkQ1zI81c1Sx6eEXGx8WW5n5WR6vd33o2zKU1y664c+PKB5VRm7hH2s mnS2dcP7ejQ3XUk5veCJxZb2PoKvEJ99+pIlly5tf15c5VzNc+knxI/04OUtfJU5rcF9rf6amcf /fdHK/vMFimmPOs9mSoBFgU7TQ0c3s63ur10f72x+H0A
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
 drivers/usb/host/ehci-platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index fe497c876d76..83bf56c9424f 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -400,7 +400,7 @@ static int ehci_platform_probe(struct platform_device *dev)
 	return err;
 }
 
-static int ehci_platform_remove(struct platform_device *dev)
+static void ehci_platform_remove(struct platform_device *dev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(dev);
 	struct usb_ehci_pdata *pdata = dev_get_platdata(&dev->dev);
@@ -424,8 +424,6 @@ static int ehci_platform_remove(struct platform_device *dev)
 
 	if (pdata == &ehci_platform_defaults)
 		dev->dev.platform_data = NULL;
-
-	return 0;
 }
 
 static int __maybe_unused ehci_platform_suspend(struct device *dev)
@@ -511,7 +509,7 @@ static SIMPLE_DEV_PM_OPS(ehci_platform_pm_ops, ehci_platform_suspend,
 static struct platform_driver ehci_platform_driver = {
 	.id_table	= ehci_platform_table,
 	.probe		= ehci_platform_probe,
-	.remove		= ehci_platform_remove,
+	.remove_new	= ehci_platform_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "ehci-platform",
-- 
2.39.2

