Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8397075FA
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjEQXDX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjEQXDG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD29619A
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-0008GH-JM; Thu, 18 May 2023 01:02:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-000ws1-KH; Thu, 18 May 2023 01:02:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAX-005UYo-64; Thu, 18 May 2023 01:02:53 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 56/97] usb: ehci-sh: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:58 +0200
Message-Id: <20230517230239.187727-57-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Koh3tzRVoCFXgW8AkgjOEJiFgrC5ufFfxcb1BlRfJ7M=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTUmDSfH0kXTSabe7DZ/uT4z3AxR8Sq3UpSL9FW7LrGM 3Xne3adjMYsDIxcDLJiiiz2jWsyrarkIjvX/rsMM4iVCWQKAxenAEzkxnH2/7VM3av3l8nmZqov Lc6bt9jvcXqj3v+5td8f7oh+2TDzyWaPJ6uXfny2YbnmE7PGW3qPNgqJmpz782qimZq5C+NBsV5 DDeHv9us2XDBnl5Vy76p4NDHV4zW3ali9zYz2DZpardlTzjVa6IYsD0v4tZNbKiFMlH9mURpnod yv9iM7i3nV3yR3/HBM+5t5J+rb87tFeREuWz8xFL3J+FwauHtztIjp8XJZwWVTazw3Jkrscdfc/ 7bNtHHDuW2yax6qNq9d4qrB9OyFrVLQHa/VF0ynxLHcnjh90TF145TDHmv1hBYy6VuEJ1z59Ppm XNOhP+b1lVeqslr+XrRelvVNOCA41dfWLOP0N37DrZKmAA==
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
 drivers/usb/host/ehci-sh.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-sh.c b/drivers/usb/host/ehci-sh.c
index c25c51d26f26..0520e762801d 100644
--- a/drivers/usb/host/ehci-sh.c
+++ b/drivers/usb/host/ehci-sh.c
@@ -147,7 +147,7 @@ static int ehci_hcd_sh_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ehci_hcd_sh_remove(struct platform_device *pdev)
+static void ehci_hcd_sh_remove(struct platform_device *pdev)
 {
 	struct ehci_sh_priv *priv = platform_get_drvdata(pdev);
 	struct usb_hcd *hcd = priv->hcd;
@@ -157,8 +157,6 @@ static int ehci_hcd_sh_remove(struct platform_device *pdev)
 
 	clk_disable(priv->fclk);
 	clk_disable(priv->iclk);
-
-	return 0;
 }
 
 static void ehci_hcd_sh_shutdown(struct platform_device *pdev)
@@ -172,7 +170,7 @@ static void ehci_hcd_sh_shutdown(struct platform_device *pdev)
 
 static struct platform_driver ehci_hcd_sh_driver = {
 	.probe		= ehci_hcd_sh_probe,
-	.remove		= ehci_hcd_sh_remove,
+	.remove_new	= ehci_hcd_sh_remove,
 	.shutdown	= ehci_hcd_sh_shutdown,
 	.driver		= {
 		.name	= "sh_ehci",
-- 
2.39.2

