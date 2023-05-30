Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49AF47156E5
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 09:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjE3Hgo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 03:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjE3Hgn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 03:36:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5309AB
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 00:36:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3tuJ-0000vP-LM; Tue, 30 May 2023 09:36:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3tuI-003ow6-PJ; Tue, 30 May 2023 09:36:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3tuH-009Oaf-Qf; Tue, 30 May 2023 09:36:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] usb: misc: onboard_hub: Don't warn twice about problems during remove
Date:   Tue, 30 May 2023 09:36:33 +0200
Message-Id: <20230530073633.2193618-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=82P5No+Tzov1a6WdfbrcrMNWe16ZaUtIJd7jW7oTwBo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdaeAy9o8QMgE1lGRkoCNRxPAvBKYPo38nv/xH s7DiEQ9IpKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHWngAAKCRCPgPtYfRL+ TotOCACQJVpS+hGBq3+aMQZ6U8gPIvIQiwiXEO62tXF+IGea0cxfXlkiDI9MfEDtnt4t74+uXAv owlBxQ9JvTjCecihvn7wY/ykeeE2nAi7EggZd5R8GrJuv4b0d91ItYTwt8+2IPFY7IzDXUHpzHh wMW4AKMxpxQfYcPfen36eoqrEoz8Ip6udBQBjfzTrSZR6sMr+/UM6iAPayehPXOIfjXHwXma+Fk w2xoBTlpYmTMgoOdvdgZGzczgB58JjTnZFzZDVxNRwq09IrccqqbXzu0eB+j+G43nIyuUTzS/WT bNtH7JzgSrSqFh76qOoy/GzdCQc9DVT6bxKSsoV1f5nRqb6M
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

If onboard_hub_power_off() called by onboard_hub_remove() fails it emits
an error message. Forwarding the returned error value to the driver core
results in another error message. As the return value is otherwise
ignored, just drop the return value. There is no side effect apart from
suppressing the core's warning.

Instead of returning zero unconditionally, convert to .remove_new()
which has the same semantics as .remove() that unconditionally returns
zero.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/misc/onboard_usb_hub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 12fc6eb67c3b..83f14ca1d38e 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -278,7 +278,7 @@ static int onboard_hub_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int onboard_hub_remove(struct platform_device *pdev)
+static void onboard_hub_remove(struct platform_device *pdev)
 {
 	struct onboard_hub *hub = dev_get_drvdata(&pdev->dev);
 	struct usbdev_node *node;
@@ -306,7 +306,7 @@ static int onboard_hub_remove(struct platform_device *pdev)
 
 	mutex_unlock(&hub->lock);
 
-	return onboard_hub_power_off(hub);
+	onboard_hub_power_off(hub);
 }
 
 MODULE_DEVICE_TABLE(of, onboard_hub_match);
@@ -317,7 +317,7 @@ static const struct dev_pm_ops __maybe_unused onboard_hub_pm_ops = {
 
 static struct platform_driver onboard_hub_driver = {
 	.probe = onboard_hub_probe,
-	.remove = onboard_hub_remove,
+	.remove_new = onboard_hub_remove,
 
 	.driver = {
 		.name = "onboard-usb-hub",

base-commit: b4a4be8471846d96b0ac52a0e9e7d48005cc97e2
-- 
2.39.2

