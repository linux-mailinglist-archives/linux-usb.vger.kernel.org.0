Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90C18707600
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbjEQXD3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjEQXDK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59995B99
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAV-0007yD-EW; Thu, 18 May 2023 01:02:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-000wpv-5r; Thu, 18 May 2023 01:02:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAR-005UWs-9l; Thu, 18 May 2023 01:02:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Cristian Birsan <cristian.birsan@microchip.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 26/97] usb: gadget/atmel_usba_udc: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:28 +0200
Message-Id: <20230517230239.187727-27-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nIGMRwP16/S7YCje/oPKRJD33QIYgeCG6HhFveJ7vVs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwNFXiyM/lMJwozsWfxT2Vqi+7y1Wa3VPJZk fh6CfkiupGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcDQAKCRCPgPtYfRL+ TmzoB/sGkWa9eIFSQQbRUC7bOWpFAGc28nOJxQsgHIjA66LBDZr3JvOB4NunleCRlDrRAROOd0I F/7/tc67b2nIcM7QX3bu99iuW0s2s0fbx0LlHKITF3UckAd0sxYpar2icywAGh+WMAlzmzBaT3C nFIq2R06iZ/Ukc3nx1WZL5joDKfVmj/WQ5k49T3Q2Jrny1LPQvlNyVjYMmR2t2UK4cfFgSIf+1D ZH04pkfW+zNNCcpE4F4bqC29geA5Se21IfbTxMZV6sSy+DUUL8/1Lt4QPYJXXQJRAbEWKXctifg TwlO65lOE34FHdvPXTndb8AkoXYC+F6QYa5R+j/0LSnm6t03
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
 drivers/usb/gadget/udc/atmel_usba_udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 53ca38c4b3ec..6c0ed3fa5eb1 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -2369,7 +2369,7 @@ static int usba_udc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int usba_udc_remove(struct platform_device *pdev)
+static void usba_udc_remove(struct platform_device *pdev)
 {
 	struct usba_udc *udc;
 	int i;
@@ -2382,8 +2382,6 @@ static int usba_udc_remove(struct platform_device *pdev)
 	for (i = 1; i < udc->num_ep; i++)
 		usba_ep_cleanup_debugfs(&udc->usba_ep[i]);
 	usba_cleanup_debugfs(udc);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -2450,7 +2448,7 @@ static SIMPLE_DEV_PM_OPS(usba_udc_pm_ops, usba_udc_suspend, usba_udc_resume);
 
 static struct platform_driver udc_driver = {
 	.probe		= usba_udc_probe,
-	.remove		= usba_udc_remove,
+	.remove_new	= usba_udc_remove,
 	.driver		= {
 		.name		= "atmel_usba_udc",
 		.pm		= &usba_udc_pm_ops,
-- 
2.39.2

