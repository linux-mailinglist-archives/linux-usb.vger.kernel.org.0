Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1BA707610
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjEQXDk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbjEQXDU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33B16E8C
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-0008C6-VM; Thu, 18 May 2023 01:02:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-000wrJ-TB; Thu, 18 May 2023 01:02:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-005UYU-5u; Thu, 18 May 2023 01:02:52 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org,
        kernel@pengutronix.de
Subject: [PATCH 51/97] usb: ehci-npcm7xx: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:53 +0200
Message-Id: <20230517230239.187727-52-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IRWEUFMehPOrEoxzzFclPKCD9mj9SY5PpVKOk0B4CZA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxRgucUFRjS2RpKiqEjtIfGj4ugvO727yoho bkPUFUM6W+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcUQAKCRCPgPtYfRL+ Tsy7B/wN36tuMK6nrqt6n8p5P8bn9x78qW7mzBsIsTUJUQ2C0cdwIOAiHYux4CQr/V8TiOwv2gi HQxyQlQXdp95Ga+36L7/NRbEXFTg8whe/LI3EoTMiBvFazW+qJE8i6cPYD1o+HqI5HNhCsrYVy7 Bpy/9N2ibXaQfXt6r9J1Kt/SswwrCA8aqPtzouwd/U7Mhmsqonp5/9CAZ3hi52xx/pehV8TkQRs 4vP/Mxfoy/bv/Sr1Cj+jJZrOVw9f8GB2CkAuOwX1h2qpPxjnVZQ+pS6/a0WffDSDp5bLyW/2m02 BH2OU5DBUuPYl9WpzZ5qT5OY7KwiOnM0jE9qIDOXJY+Xwz+S
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
 drivers/usb/host/ehci-npcm7xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-npcm7xx.c b/drivers/usb/host/ehci-npcm7xx.c
index 63af1a827fcb..ad79ce63afcf 100644
--- a/drivers/usb/host/ehci-npcm7xx.c
+++ b/drivers/usb/host/ehci-npcm7xx.c
@@ -106,15 +106,13 @@ static int npcm7xx_ehci_hcd_drv_probe(struct platform_device *pdev)
 	return retval;
 }
 
-static int npcm7xx_ehci_hcd_drv_remove(struct platform_device *pdev)
+static void npcm7xx_ehci_hcd_drv_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
 
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 static const struct of_device_id npcm7xx_ehci_id_table[] = {
@@ -125,7 +123,7 @@ MODULE_DEVICE_TABLE(of, npcm7xx_ehci_id_table);
 
 static struct platform_driver npcm7xx_ehci_hcd_driver = {
 	.probe		= npcm7xx_ehci_hcd_drv_probe,
-	.remove		= npcm7xx_ehci_hcd_drv_remove,
+	.remove_new	= npcm7xx_ehci_hcd_drv_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name = "npcm7xx-ehci",
-- 
2.39.2

