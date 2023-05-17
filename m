Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C141570760C
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjEQXDh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjEQXDQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F5E6A7D
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-0008Oy-6h; Thu, 18 May 2023 01:03:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-000wtc-Jy; Thu, 18 May 2023 01:02:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAb-005UaF-HM; Thu, 18 May 2023 01:02:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 78/97] usb: sl811-hcd: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:20 +0200
Message-Id: <20230517230239.187727-79-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=jVaci8yAuX7gAMmFzYZ3oz25EEEPy3Iq7BAuf/Ya7LQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVyxocboya9WQ2NWAJ0lvB4sP2V9AIL+c5u2W gtDGukQZNWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcsQAKCRCPgPtYfRL+ TqAvB/9k7+TTe8g6+jn+wCXK5t1wJ4aaFE/NSMhyerdofb+UglML1XuU1qFEURIpnNARL7vbEjb jQMiQ2De//XcKsiClNFzyvBhgZYXp3wI63Ax/Ic81xB4LmhMK2I+41quhieTgXvFMsqiKXjGz0A ZLGzCCeyFarS9dAEBkCV2imm1dAzP5SXRA8sH0a+61opR2sqfp5XGKOlC7TWBAFej7o1U14t/tr 12cyT9Qn8PX3RgXP32baJSHMmfo2Yp0e2jphbxmws5aWx4vVkJV9cHj7QYgd462Y31HqD1JWkpS q1e5pM+FvKjhFR2Z0igNUTlPJdo3Cv3CnG4HoX7DcbFywbib
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
 drivers/usb/host/sl811-hcd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index b8b90eec9107..0956495bba57 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1579,7 +1579,7 @@ static const struct hc_driver sl811h_hc_driver = {
 
 /*-------------------------------------------------------------------------*/
 
-static int
+static void
 sl811h_remove(struct platform_device *dev)
 {
 	struct usb_hcd		*hcd = platform_get_drvdata(dev);
@@ -1599,7 +1599,6 @@ sl811h_remove(struct platform_device *dev)
 		iounmap(sl811->addr_reg);
 
 	usb_put_hcd(hcd);
-	return 0;
 }
 
 static int
@@ -1783,7 +1782,7 @@ sl811h_resume(struct platform_device *dev)
 /* this driver is exported so sl811_cs can depend on it */
 struct platform_driver sl811h_driver = {
 	.probe =	sl811h_probe,
-	.remove =	sl811h_remove,
+	.remove_new =	sl811h_remove,
 
 	.suspend =	sl811h_suspend,
 	.resume =	sl811h_resume,
-- 
2.39.2

