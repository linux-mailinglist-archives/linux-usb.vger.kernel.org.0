Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 272E2707618
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbjEQXDr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjEQXDW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035347284
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-0008PB-Jf; Thu, 18 May 2023 01:03:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-000wti-Ou; Thu, 18 May 2023 01:02:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAb-005Ua7-5k; Thu, 18 May 2023 01:02:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 76/97] usb: oxu210hp-hcd: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:18 +0200
Message-Id: <20230517230239.187727-77-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WtBr02uVpsnynmA7DGznlg6jmmC1FMDGRtwJL1hxzmE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVyq79ZL9HQCOCzYABpevMxBAN3EPwIWeaxKj lfl/K7QKEGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcqgAKCRCPgPtYfRL+ Tu+JB/9EgVLkrktvLERc7Y7l+/lOORQCvs8Fwvmtx6w6Q+wF+lMRo9LmPJfeEivDS7qLkhksY8q 34oQpuZOH/Yk0PeRPXdmFin9XICJOBksQUHWcZlEvRJgArpFVOOjQj/yixkrekJ9UdalVwe0GU0 rA4X5G2zd3cIMxRu6PL2Yb4AnTGAuX65F9+MY9ZfUXWoRl9I3wcwEHaCmiBBQT5wBgCJ7B6s8ID eOTtWPshWDZVhdm7IvhYYIr4opMUJR+0DXIWjvzzhR7bL+wwZ2B0zU3yUjgbz5HVaQr9jtxQJXC ScLZLxtuCyoOZz46ICKvAt8cziK6zlF53ass858aRdVnPxYI
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
 drivers/usb/host/oxu210hp-hcd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index f998d3f1a78a..50c1ccabb0f5 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -4278,14 +4278,12 @@ static void oxu_remove(struct platform_device *pdev, struct usb_hcd *hcd)
 	usb_put_hcd(hcd);
 }
 
-static int oxu_drv_remove(struct platform_device *pdev)
+static void oxu_drv_remove(struct platform_device *pdev)
 {
 	struct oxu_info *info = platform_get_drvdata(pdev);
 
 	oxu_remove(pdev, info->hcd[0]);
 	oxu_remove(pdev, info->hcd[1]);
-
-	return 0;
 }
 
 static void oxu_drv_shutdown(struct platform_device *pdev)
@@ -4317,7 +4315,7 @@ static int oxu_drv_resume(struct device *dev)
 
 static struct platform_driver oxu_driver = {
 	.probe		= oxu_drv_probe,
-	.remove		= oxu_drv_remove,
+	.remove_new	= oxu_drv_remove,
 	.shutdown	= oxu_drv_shutdown,
 	.suspend	= oxu_drv_suspend,
 	.resume		= oxu_drv_resume,
-- 
2.39.2

