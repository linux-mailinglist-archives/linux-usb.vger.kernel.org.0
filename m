Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFAE16C0044
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 10:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjCSJYo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 05:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjCSJYk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 05:24:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EECD15887
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 02:24:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHG-0003OT-0c; Sun, 19 Mar 2023 10:24:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHF-005C7i-C1; Sun, 19 Mar 2023 10:24:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHE-0066P3-M1; Sun, 19 Mar 2023 10:24:32 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 02/11] usb: phy: am335x: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 10:24:19 +0100
Message-Id: <20230319092428.283054-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=l1JWSr4Dg3nNw1Z42y7j9KxyX4mmsc1IaXPMdrb2Eng=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtS9X4yD4MrhUknX/ui5l4p5pf2pDV/oG/On4 iqHUwSXMAuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUvQAKCRCPgPtYfRL+ TtrkB/9KDyZ88q69NJvWMMesTRY6C2Nb/U5U18FcJfDJCAFkPwF0nwr3JdKLe9+p225Rc/RnWBo Qbu45JAPvYZI3LJ7d1P2npg07RrjGCg5K51P/jl+DOeYZmXVPj05glRELfS4PHySSFD45uZ7sRC W+w3YG/SnVlow4ir9+cJ0r5O3lU7k5h/vIuKRR+Fw/nckNRlUJWUPhGHtle+sQ5xXA/wQBtvwWN 2J4Z/od5E6e/GeNat7WMB9WWI5Pw4f0hMQvZtZGyBp12OH9LzZI18rbGbEZmEiKAdNBuNXwcUFg XHY6wWfImb0rOdnVZDKKtita254cDz8b50SlzfZ8Ns80mdXb
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
 drivers/usb/phy/phy-am335x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy-am335x.c b/drivers/usb/phy/phy-am335x.c
index 8524475d942d..e39665cf4b4a 100644
--- a/drivers/usb/phy/phy-am335x.c
+++ b/drivers/usb/phy/phy-am335x.c
@@ -82,12 +82,11 @@ static int am335x_phy_probe(struct platform_device *pdev)
 	return usb_add_phy_dev(&am_phy->usb_phy_gen.phy);
 }
 
-static int am335x_phy_remove(struct platform_device *pdev)
+static void am335x_phy_remove(struct platform_device *pdev)
 {
 	struct am335x_phy *am_phy = platform_get_drvdata(pdev);
 
 	usb_remove_phy(&am_phy->usb_phy_gen.phy);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -134,7 +133,7 @@ MODULE_DEVICE_TABLE(of, am335x_phy_ids);
 
 static struct platform_driver am335x_phy_driver = {
 	.probe          = am335x_phy_probe,
-	.remove         = am335x_phy_remove,
+	.remove_new     = am335x_phy_remove,
 	.driver         = {
 		.name   = "am335x-phy-driver",
 		.pm = &am335x_pm_ops,
-- 
2.39.2

