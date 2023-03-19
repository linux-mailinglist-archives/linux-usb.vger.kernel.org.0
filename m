Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2F86C0043
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 10:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjCSJYn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 05:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjCSJYk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 05:24:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCED6166D2
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 02:24:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHH-0003Oq-2W; Sun, 19 Mar 2023 10:24:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHG-005C83-DP; Sun, 19 Mar 2023 10:24:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHF-0066PL-QR; Sun, 19 Mar 2023 10:24:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 07/11] usb: phy: mv: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 10:24:24 +0100
Message-Id: <20230319092428.283054-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ElIlGN1g/54EG2AJH2PAHYfpjBdFwQ4TsUJFIVPivSE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtTDt0qSjuxkAzaHOqfsavsV3sLzoui6nv3Ky KhNyaHdEqiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUwwAKCRCPgPtYfRL+ TqzHB/93I6HZKPE30jIWZnuRgkSw7Bgr2K5hbB53NRQk6KiRGyHkIsY4YVFQsFJruara0xETqXq lGvBQI0kNOo6pXuCFIim9nxZHafK1/Gm9JwvWT7Mct7ydxv/j8BxUPS3CreCD+lEHCWYJ7NFj8t +4ZSFl8s9tU3g9BdYx24hk1mhfXPlyuDLV7uUREyh4beD5IhM8unPmaNwzd0t/+7hLSB0RN9LL4 SsPTDwTWS0GPpeX857cdbt/onynavJ8QiJNU0NLvvGij+dfr7aXlRn2Wd76qLcUeEGE16WuNUJt +bKcOWJYe/AQ4f4MKSTQhDwtokNeXNNwEEJ/A8Ztab0Zbr23
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
 drivers/usb/phy/phy-mv-usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
index 86503b7d695c..df7c27474a75 100644
--- a/drivers/usb/phy/phy-mv-usb.c
+++ b/drivers/usb/phy/phy-mv-usb.c
@@ -644,7 +644,7 @@ static const struct attribute_group *mv_otg_groups[] = {
 	NULL,
 };
 
-static int mv_otg_remove(struct platform_device *pdev)
+static void mv_otg_remove(struct platform_device *pdev)
 {
 	struct mv_otg *mvotg = platform_get_drvdata(pdev);
 
@@ -654,8 +654,6 @@ static int mv_otg_remove(struct platform_device *pdev)
 	mv_otg_disable(mvotg);
 
 	usb_remove_phy(&mvotg->phy);
-
-	return 0;
 }
 
 static int mv_otg_probe(struct platform_device *pdev)
@@ -869,7 +867,7 @@ static int mv_otg_resume(struct platform_device *pdev)
 
 static struct platform_driver mv_otg_driver = {
 	.probe = mv_otg_probe,
-	.remove = mv_otg_remove,
+	.remove_new = mv_otg_remove,
 	.driver = {
 		   .name = driver_name,
 		   .dev_groups = mv_otg_groups,
-- 
2.39.2

