Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A42866C004A
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 10:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjCSJYt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 05:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjCSJYl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 05:24:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CABC18178
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 02:24:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHH-0003Oa-FU; Sun, 19 Mar 2023 10:24:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHF-005C7n-ON; Sun, 19 Mar 2023 10:24:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHE-0066P6-VH; Sun, 19 Mar 2023 10:24:32 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Ran Wang <ran.wang_1@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kernel@pengutronix.de
Subject: [PATCH 03/11] usb: phy: fsl: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 10:24:20 +0100
Message-Id: <20230319092428.283054-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=FznivNj01CkvJ0Tfq79ZXPvIH2iBmPqYvrjxDu3JqL4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtS+Gx9MU/uPvG0E2e38YSGb+CT/REIMrTgOT kVLUaiOS+KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUvgAKCRCPgPtYfRL+ TgLpB/9D68sZE38fxGiX60CbSnNMFrBnHdzgJJ5YMEPSKquUKjOw4adeZvN9qaI4rqkQgbKYGBf xlzMPPD22gaGYsbiEkFOCfeL23CdrGvg2CDvd92s35ciqZFhz9d1o14i/EFW8Q9/AKS2HHXTpRU B3Jhrd16fsFuyc7+xxKhuuekdn4mOSl7mjaEe3kV1If3IpFmNnhCWq46am3ujDKcU3H27dsQ94z wtAOqAfteskKlHiOproDJzC6P6uTX25SSFfTo2LpFZeU+RMLr/nxLmMjgkxvkfzb3Kb2MHrEiBM fsGxFkPJTF00/+/E121qiG55AGfEIbHTc8DsFL3p6NlFc7Em
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/phy/phy-fsl-usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 972704262b02..79617bb0a70e 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -983,7 +983,7 @@ static int fsl_otg_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_otg_remove(struct platform_device *pdev)
+static void fsl_otg_remove(struct platform_device *pdev)
 {
 	struct fsl_usb2_platform_data *pdata = dev_get_platdata(&pdev->dev);
 
@@ -998,13 +998,11 @@ static int fsl_otg_remove(struct platform_device *pdev)
 
 	if (pdata->exit)
 		pdata->exit(pdev);
-
-	return 0;
 }
 
 struct platform_driver fsl_otg_driver = {
 	.probe = fsl_otg_probe,
-	.remove = fsl_otg_remove,
+	.remove_new = fsl_otg_remove,
 	.driver = {
 		.name = driver_name,
 		.owner = THIS_MODULE,
-- 
2.39.2

