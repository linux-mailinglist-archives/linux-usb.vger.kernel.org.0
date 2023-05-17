Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF8D7075CC
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjEQXCv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjEQXCt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B205270
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-0007jc-9d; Thu, 18 May 2023 01:02:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-000wo9-I5; Thu, 18 May 2023 01:02:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAN-005UVm-SO; Thu, 18 May 2023 01:02:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 09/97] usb: chipidea/core: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:11 +0200
Message-Id: <20230517230239.187727-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1/yllDkjCwUIbCR9lpoGxvNeDyvYPOuETKlwOlDlVX4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVv0xjqo1yr6eEzwAzMf8jUEYvDui0dZJWD8m XR0dfAsqwyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb9AAKCRCPgPtYfRL+ TntRCACa4+qmvUCjTvU8H3JaDN14to/EWRY/GmPmHssP+dEP/yEc09+3F5E/pgrK3jV20sozZuq tWUDQY0rW/Al0dMsWZMJyIbCMPM2c2QhuLnKsTsQtFaENDqJIM14QGhBq/3zOMYqdDCt9vvqID7 077iDjTd8fk1emOoKPW9XMFq7Jmtaj6EE8PMzghJxgtrE07B47hYlUutyn21bjvdbRkSgV058uv 0TjgdxnATRetlzP4rmTzHFGAxCautpZa4+etANNGSuAk8HltW5TUX23PoytzygCkkXony1PZGKX xxXmmWtUQE+GNQOFbXR7pEeA0IRtIKjaOErkr+sQGF/sLjcg
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
 drivers/usb/chipidea/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 798cb077867a..51994d655b82 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1227,7 +1227,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ci_hdrc_remove(struct platform_device *pdev)
+static void ci_hdrc_remove(struct platform_device *pdev)
 {
 	struct ci_hdrc *ci = platform_get_drvdata(pdev);
 
@@ -1245,8 +1245,6 @@ static int ci_hdrc_remove(struct platform_device *pdev)
 	ci_hdrc_enter_lpm(ci, true);
 	ci_usb_phy_exit(ci);
 	ci_ulpi_exit(ci);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -1485,7 +1483,7 @@ static const struct dev_pm_ops ci_pm_ops = {
 
 static struct platform_driver ci_hdrc_driver = {
 	.probe	= ci_hdrc_probe,
-	.remove	= ci_hdrc_remove,
+	.remove_new = ci_hdrc_remove,
 	.driver	= {
 		.name	= "ci_hdrc",
 		.pm	= &ci_pm_ops,
-- 
2.39.2

