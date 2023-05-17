Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2CC17075EF
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjEQXDO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjEQXDA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4393D5588
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-0008AL-E6; Thu, 18 May 2023 01:02:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-000wr9-An; Thu, 18 May 2023 01:02:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAV-005UYG-Im; Thu, 18 May 2023 01:02:51 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 48/97] usb: ehci-fsl: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:50 +0200
Message-Id: <20230517230239.187727-49-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=aRch/8zx14C7od5k0ECgKh6hDD+WUEGbNMiS1Q6GGdM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxJ8U76kvaSc+jzHomtp/8XSt5FPsZWhG2Tj iKN6SfPrvWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcSQAKCRCPgPtYfRL+ TsRCB/9UnHKFgTcul+32abWMzEZ/Eibz+cscIQ8xqIeUZ4p4zLWbwZXtO2nziMS74XWvets3yPg /6n+7Wy5E6UiN69/iv5M/IL486Oe6cc8uplI7MbT4bbc2tE5FT20ZF8eljzgaiibsHZiuQJp7MB pqUoy0JQR4sh8X2feCHEhSxII/Z1EpH1gjx4/MgnnZL42oaqLtXOdrBwjz2y0YkQz+wcU2UaJZr g3NuTGSdEkVS+1N5ci/oN939/2kdHU0N0AiYe+GT6ZCfHpgIs/oz5qnhzZuAj9HPw5DhkR6+6kK kyZ5NRF0tMbEcytJRQmvUOoIrNNp4GuxVojJCHlqTl20KZFh
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
 drivers/usb/host/ehci-fsl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index d74fa5ba845b..81d60a695510 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -684,7 +684,7 @@ static const struct ehci_driver_overrides ehci_fsl_overrides __initconst = {
  *
  * Reverses the effect of usb_hcd_fsl_probe().
  */
-static int fsl_ehci_drv_remove(struct platform_device *pdev)
+static void fsl_ehci_drv_remove(struct platform_device *pdev)
 {
 	struct fsl_usb2_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
@@ -703,13 +703,11 @@ static int fsl_ehci_drv_remove(struct platform_device *pdev)
 	if (pdata->exit)
 		pdata->exit(pdev);
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 static struct platform_driver ehci_fsl_driver = {
 	.probe = fsl_ehci_drv_probe,
-	.remove = fsl_ehci_drv_remove,
+	.remove_new = fsl_ehci_drv_remove,
 	.shutdown = usb_hcd_platform_shutdown,
 	.driver = {
 		.name = DRV_NAME,
-- 
2.39.2

