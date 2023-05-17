Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36D41707601
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjEQXDa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjEQXDK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9067561B5
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-0008JR-1v; Thu, 18 May 2023 01:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-000wsW-59; Thu, 18 May 2023 01:02:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-005UYc-I8; Thu, 18 May 2023 01:02:52 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 53/97] usb: ehci-orion: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:55 +0200
Message-Id: <20230517230239.187727-54-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/vlaP3u29DjeV0AOkhPpaEOyXLsMwHICdELt7b4+SyA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxZbSyw4QS7kGECINWHlk1T1q+cP2MPUQegi teoFP9Mi/2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcWQAKCRCPgPtYfRL+ TrBoB/0RuPScUC09pvrpAbyjkH+LvqHjljpubUP6GYQ4ZZwTocYyYqaWG5KJEGRbuSxboFPruLo wpY6CQfi4OW1dc+acMGMTUrayYTygYn/+nh/bf+Wf30hyBSrNn8QHdyGraFMejH8leQmu6Jzhh2 xM4eGY6vg5igXFewTxrIXqVhbQSdJl7ukNM3XUZ/cNMm9JJrVjzNR5OcZPYL4j5QTiF5MSxrG2H lHpGW1jBTRosaiHPuhXX688UQi1VwFtBK0fydEfol0r2fB0sbEzUU77SSrkKqQn1RBoXHjPATlB 6fRf5Bnmw3vJvRsEnD5Ck9rk0Xlahj/duiUsDhrk7MGLRt3x
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
 drivers/usb/host/ehci-orion.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index a3454a3ea4e0..2cfb27dc943a 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -321,7 +321,7 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int ehci_orion_drv_remove(struct platform_device *pdev)
+static void ehci_orion_drv_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct orion_ehci_hcd *priv = hcd_to_orion_priv(hcd);
@@ -332,8 +332,6 @@ static int ehci_orion_drv_remove(struct platform_device *pdev)
 		clk_disable_unprepare(priv->clk);
 
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 static const struct of_device_id ehci_orion_dt_ids[] = {
@@ -345,7 +343,7 @@ MODULE_DEVICE_TABLE(of, ehci_orion_dt_ids);
 
 static struct platform_driver ehci_orion_driver = {
 	.probe		= ehci_orion_drv_probe,
-	.remove		= ehci_orion_drv_remove,
+	.remove_new	= ehci_orion_drv_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name	= "orion-ehci",
-- 
2.39.2

