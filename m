Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 383D670762C
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjEQXEG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbjEQXED (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:04:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD3761A9
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-0008LH-Sf; Thu, 18 May 2023 01:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-000wsu-Uc; Thu, 18 May 2023 01:02:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-005UZL-OV; Thu, 18 May 2023 01:02:54 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     linux-usb@vger.kernel.org,
        "moderated list:ARM/Microchip" <linux-arm-kernel@lists.infradead.org>,
        kernel@pengutronix.de
Subject: [PATCH 64/97] usb: ohci-at91: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:06 +0200
Message-Id: <20230517230239.187727-65-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=pQgq9pUQpD7LYIQdFFv6qN96jLnJk6T/5ZPZG1XwZlw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVyESJOA8OHeVR46Xd+pF/tfVoVZD+GH01re6 QegbgbxP+CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVchAAKCRCPgPtYfRL+ TnQkB/9/qROL2Kum4SAUk1GorGhA2yuCZ4D2wNA0jWQYzUNM78B0fEIWJvSicNEkkdAibHSao/o CyuFUUS2eybJnywFAG98wGlUI6EIiU5y02ZSIsEtGJK5K5Qph0njW1n8e5oGokbZuRplj/iLbN8 gI1iDUiWfCWnv9rVwciByn5GQAZHmsGv3NahTjT6MXlkt3GAXTGGzQq3xTBKdrm6HSUVJoO9fHQ sp+2FaQIXgGcICJY/dO7hNeenZ+yrbSi+RBGbUrZxT94j8h9ho0I69Q35WLPOTkJqW8i1lEya3J IV8j4mBHbWnHnEVXVsy7lUBwYIxJKOWEpX5+SFhfa3PcSmnR
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
 drivers/usb/host/ohci-at91.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
index 533537ef3c21..b9ce8d80f20b 100644
--- a/drivers/usb/host/ohci-at91.c
+++ b/drivers/usb/host/ohci-at91.c
@@ -599,7 +599,7 @@ static int ohci_hcd_at91_drv_probe(struct platform_device *pdev)
 	return usb_hcd_at91_probe(&ohci_at91_hc_driver, pdev);
 }
 
-static int ohci_hcd_at91_drv_remove(struct platform_device *pdev)
+static void ohci_hcd_at91_drv_remove(struct platform_device *pdev)
 {
 	struct at91_usbh_data	*pdata = dev_get_platdata(&pdev->dev);
 	int			i;
@@ -611,7 +611,6 @@ static int ohci_hcd_at91_drv_remove(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 0);
 	usb_hcd_at91_remove(platform_get_drvdata(pdev), pdev);
-	return 0;
 }
 
 static int __maybe_unused
@@ -683,7 +682,7 @@ static SIMPLE_DEV_PM_OPS(ohci_hcd_at91_pm_ops, ohci_hcd_at91_drv_suspend,
 
 static struct platform_driver ohci_hcd_at91_driver = {
 	.probe		= ohci_hcd_at91_drv_probe,
-	.remove		= ohci_hcd_at91_drv_remove,
+	.remove_new	= ohci_hcd_at91_drv_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "at91_ohci",
-- 
2.39.2

