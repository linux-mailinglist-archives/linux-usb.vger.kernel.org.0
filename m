Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7BB6C0042
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 10:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjCSJYm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 05:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjCSJYk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 05:24:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4CC1630E
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 02:24:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHF-0003OS-RS; Sun, 19 Mar 2023 10:24:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHF-005C7e-6Z; Sun, 19 Mar 2023 10:24:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHE-0066P0-Ft; Sun, 19 Mar 2023 10:24:32 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 01/11] usb: phy: ab8500: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 10:24:18 +0100
Message-Id: <20230319092428.283054-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1815; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=SIF2N0pmcxiRbDelgQ2VPpL6bcfW7vXj264alJ7PUTM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtS8bEWdHgT8lqiLY82G5a+iIYksqcz5pHqYU 8wjyuGWGayJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUvAAKCRCPgPtYfRL+ TkGgB/wMBl8fbeAtw1gG/lZd7qKiHCyBlvUnh6oc1zIHWGL422t1UP/2OEemP8xWTwvLfLV3/Tc GUn62ERxA0O2vP4nli4CgVnUJJZJYAgFGXlXZ8ymmKOWaVKT1AN5O/v6vzM+lqb8T3Wweyy9ELB H0zkhOeAyIc5o2ifsMQIeoPomiy3SmJCSKaAvAVKCSi4d+JoD8FKLGGw35tQPQKoqgkUzYaIG2A YgccrKkdu04+zUkEB94cIx66sYaQduTgWSlrluinFkFA/4otxx9tQOtbj8dHADlPgx83U/iznBS diQfOVOTdBrsSzn7wI7zrcawYrbf8VLbaayRtkftrw0JtasF
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
 drivers/usb/phy/phy-ab8500-usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-ab8500-usb.c b/drivers/usb/phy/phy-ab8500-usb.c
index 4c52ba96f17e..408f47e39025 100644
--- a/drivers/usb/phy/phy-ab8500-usb.c
+++ b/drivers/usb/phy/phy-ab8500-usb.c
@@ -965,7 +965,7 @@ static int ab8500_usb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ab8500_usb_remove(struct platform_device *pdev)
+static void ab8500_usb_remove(struct platform_device *pdev)
 {
 	struct ab8500_usb *ab = platform_get_drvdata(pdev);
 
@@ -977,8 +977,6 @@ static int ab8500_usb_remove(struct platform_device *pdev)
 		ab8500_usb_host_phy_dis(ab);
 	else if (ab->mode == USB_PERIPHERAL)
 		ab8500_usb_peri_phy_dis(ab);
-
-	return 0;
 }
 
 static const struct platform_device_id ab8500_usb_devtype[] = {
@@ -989,7 +987,7 @@ MODULE_DEVICE_TABLE(platform, ab8500_usb_devtype);
 
 static struct platform_driver ab8500_usb_driver = {
 	.probe		= ab8500_usb_probe,
-	.remove		= ab8500_usb_remove,
+	.remove_new	= ab8500_usb_remove,
 	.id_table	= ab8500_usb_devtype,
 	.driver		= {
 		.name	= "abx5x0-usb",
-- 
2.39.2

