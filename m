Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7387075FF
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjEQXD2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjEQXDI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB1C61B3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-0008KH-8m; Thu, 18 May 2023 01:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-000wsh-Gq; Thu, 18 May 2023 01:02:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-005UZB-Bn; Thu, 18 May 2023 01:02:54 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 62/97] usb: isp1362-hcd: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:04 +0200
Message-Id: <20230517230239.187727-63-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=DQnzFn4rbDba6ZbBXzVbLS4VGIx4iGr7o+VlgE5yQhM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVx3v3EJ0qbvMlgxxGsf+ZdTSD3L2e6R+6Jp0 FrD1kYgZoOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcdwAKCRCPgPtYfRL+ Tt5nCACBYece6YToLt3+115xqPw301OJvtJ8lW1XCUmOOEP+2thRunhSJm2Q1Dab9RAnDI96K6a WALani42suiqdsCLQPAn3lpE1VN5ZatMMa0JiP2PCjdSPeqkHBmsGf01wW0lLq9CdtsZFh/Bc4z o6QBOWg4pLCYS8NpZm0dRemeVGX8SZXjP3xcE2641JX7l9P1JIszPbdksb0t9rbnuz9q4dlwqQC j50eey3yn9KUKmP2KOCLjAVi+v11pTIp0B7gecdM6bleSgfDeTE8QX5D9ImqnJDDj0rwAinoasZ Mp+HGX6/G5lyOiqXs5Dpdz18zL+8VSXfx7BxjiBb+CRbpDqU
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
 drivers/usb/host/isp1362-hcd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
index b0da143ef4be..606f0a64f3b7 100644
--- a/drivers/usb/host/isp1362-hcd.c
+++ b/drivers/usb/host/isp1362-hcd.c
@@ -2606,7 +2606,7 @@ static const struct hc_driver isp1362_hc_driver = {
 
 /*-------------------------------------------------------------------------*/
 
-static int isp1362_remove(struct platform_device *pdev)
+static void isp1362_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct isp1362_hcd *isp1362_hcd = hcd_to_isp1362_hcd(hcd);
@@ -2617,8 +2617,6 @@ static int isp1362_remove(struct platform_device *pdev)
 	DBG(0, "%s: put_hcd\n", __func__);
 	usb_put_hcd(hcd);
 	DBG(0, "%s: Done\n", __func__);
-
-	return 0;
 }
 
 static int isp1362_probe(struct platform_device *pdev)
@@ -2760,7 +2758,7 @@ static int isp1362_resume(struct platform_device *pdev)
 
 static struct platform_driver isp1362_driver = {
 	.probe = isp1362_probe,
-	.remove = isp1362_remove,
+	.remove_new = isp1362_remove,
 
 	.suspend = isp1362_suspend,
 	.resume = isp1362_resume,
-- 
2.39.2

