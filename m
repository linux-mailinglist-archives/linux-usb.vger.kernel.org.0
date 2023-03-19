Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACE56C004C
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 10:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjCSJYv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 05:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjCSJYn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 05:24:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4111630E
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 02:24:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHJ-0003PP-BY; Sun, 19 Mar 2023 10:24:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHG-005C88-Mi; Sun, 19 Mar 2023 10:24:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHG-0066PQ-2M; Sun, 19 Mar 2023 10:24:34 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Frank Li <Frank.Li@nxp.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 08/11] usb: phy: mxs: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 10:24:25 +0100
Message-Id: <20230319092428.283054-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=FQd/m4OLYSMuLHnbxr6FQyb8hFCGuMIhaYG0O6nsWzM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSxK0dYvwT83KFx8fihvHvON//83SH0RLEzw0EzU+Xb8 mXKrMt+djIaszAwcjHIiimy2DeuybSqkovsXPvvMswgViaQKQxcnAIwEa1tHAw7f3wx6l2Vuev1 pzUrt63wWSCvoVcwTWaVpCmr8IJrj7b69V/32N7f0jxldeSuSRJK8u2lnl/uLyydHlpf0cTtci/ 9+ks39hWSCVL/9nnHu9gkduXzNAfGzEqz8b+Q2Fk1Kyktv/64/ayi7Pd1CvzSufLPI8XDWEMFcx JX+d1zsu85G5W57MnMZfzPytPZb/ooh89W+R/26VejJ5e2+b33IXwz7kwxluiZH9DRfuvNRe9bz z64rSyzeK0ke13E7sOhI7KHrJONJI1POuw1j477+ImV4WvJwZtWzT35k2LTXjTb1ei2JpxqcIu+ 3Pq0nOlewuyU04LXG8sLD2g+Yv2xNHyS9bFlLLXydUoPAA==
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
 drivers/usb/phy/phy-mxs-usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index d2836ef5d15c..b21eecacc3b7 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -801,13 +801,11 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	return usb_add_phy_dev(&mxs_phy->phy);
 }
 
-static int mxs_phy_remove(struct platform_device *pdev)
+static void mxs_phy_remove(struct platform_device *pdev)
 {
 	struct mxs_phy *mxs_phy = platform_get_drvdata(pdev);
 
 	usb_remove_phy(&mxs_phy->phy);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -853,7 +851,7 @@ static SIMPLE_DEV_PM_OPS(mxs_phy_pm, mxs_phy_system_suspend,
 
 static struct platform_driver mxs_phy_driver = {
 	.probe = mxs_phy_probe,
-	.remove = mxs_phy_remove,
+	.remove_new = mxs_phy_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = mxs_phy_dt_ids,
-- 
2.39.2

