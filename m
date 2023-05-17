Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C227075DF
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjEQXDB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjEQXCx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9164EF3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-0007mb-D1; Thu, 18 May 2023 01:02:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-000wog-MK; Thu, 18 May 2023 01:02:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-005UWA-2r; Thu, 18 May 2023 01:02:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 15/97] usb: dwc3-imx8mp: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:17 +0200
Message-Id: <20230517230239.187727-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Y50UTmH5h7TgL9YmdQgZF0UwMlcQILrKLKScyZezHW4=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTU6N/PnP97cKsxba6zufpy5eF9zlzOD97xzu4LaD957 Y+o7Nu+TkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAm4hbO/lfIcJmTvOBc97Bl W1hCzZzMLVZ1VnpWKc6frL9wqS/TQZ3jc133Xuw3vKWelWJiUpB4uN6/3Lc87XLvRG+/jphiXUP +9DBpndcFiur/2XonMP9MD1w60bB1/V5JHRlNx+4vCQ+1G5gzGgqTn5ee1V//R897kdO/pTdtZl uubjuSUZpQH/k/XS8tRZvH1m6efpSy4NS7rFdEHzXyVSflK925zJWV/XSBsdLcjTx9d1iSZ9/6v O6l1de7m4ofpdfvqXWZ1S12zHTH54g7KodiX2658/ZajICVX/bsV7m8nLO37F+Yv9a21t3y550m z3kmjxaLu/8SSDj097lOSErsY8VTORPWb4vkdnwX3vMUAA==
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
 drivers/usb/dwc3/dwc3-imx8mp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 174f07614318..8b9a3bb587bf 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -266,7 +266,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int dwc3_imx8mp_remove(struct platform_device *pdev)
+static void dwc3_imx8mp_remove(struct platform_device *pdev)
 {
 	struct dwc3_imx8mp *dwc3_imx = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
@@ -280,8 +280,6 @@ static int dwc3_imx8mp_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 	platform_set_drvdata(pdev, NULL);
-
-	return 0;
 }
 
 static int __maybe_unused dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx,
@@ -411,7 +409,7 @@ MODULE_DEVICE_TABLE(of, dwc3_imx8mp_of_match);
 
 static struct platform_driver dwc3_imx8mp_driver = {
 	.probe		= dwc3_imx8mp_probe,
-	.remove		= dwc3_imx8mp_remove,
+	.remove_new	= dwc3_imx8mp_remove,
 	.driver		= {
 		.name	= "imx8mp-dwc3",
 		.pm	= &dwc3_imx8mp_dev_pm_ops,
-- 
2.39.2

