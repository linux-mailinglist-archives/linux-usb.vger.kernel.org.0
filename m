Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 098BB70761F
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjEQXDu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjEQXDZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C067B6195
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:06 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-00089k-GS; Thu, 18 May 2023 01:02:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-000wr5-51; Thu, 18 May 2023 01:02:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAV-005UYC-D2; Thu, 18 May 2023 01:02:51 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 47/97] usb: ehci-exynos: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:49 +0200
Message-Id: <20230517230239.187727-48-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=sdaNvSMllo7FJ63Vr0mA/chKoNhlxVQIVWkT2Ljhub0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxDmaaDrhv91DXiU7i7NVl741g+M8SJbCsTJ Sgb1xbXKyWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcQwAKCRCPgPtYfRL+ TjyrB/41RYWaqrAk8sl+HM93vnNGtFVoBUcC77MY3ceLYEqZUUrBJt/euLJ2rjmPFdgW/23Wm1N XUR7azX1aPOfT+RMfhEK4vN6b589iblCvhwm7iJNdPpMYj/49gKGTJ5Hrk9Ji35s6skSvu9wszp KvYXYT7rVOd0KhkQO5I3s9PdZ7lBiOs1QafTP2lx5w1Oop8hXt13J0QrFeWNmqfuDR1p+yXly13 dCM48XE22T21JYQq0gf7b0jY6PsAdKJPw+1urv7MlNGK9Vpb/TKn2vdJ1PWCE8CoWi6tD3xJWJ3 Yq9zRCuS48sCSXn6OU/LGo/alMlCLO2dyDNJkpjDD41dQrGt
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
 drivers/usb/host/ehci-exynos.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index 47c9f06c3d84..20f8c0ec6810 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -230,7 +230,7 @@ static int exynos_ehci_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int exynos_ehci_remove(struct platform_device *pdev)
+static void exynos_ehci_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
@@ -244,8 +244,6 @@ static int exynos_ehci_remove(struct platform_device *pdev)
 	clk_disable_unprepare(exynos_ehci->clk);
 
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -311,7 +309,7 @@ MODULE_DEVICE_TABLE(of, exynos_ehci_match);
 
 static struct platform_driver exynos_ehci_driver = {
 	.probe		= exynos_ehci_probe,
-	.remove		= exynos_ehci_remove,
+	.remove_new	= exynos_ehci_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name	= "exynos-ehci",
-- 
2.39.2

