Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC5017075FE
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjEQXD2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjEQXDI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FC761A9
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAb-0008IQ-Hn; Thu, 18 May 2023 01:02:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-000wsP-My; Thu, 18 May 2023 01:02:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-005UZG-Iq; Thu, 18 May 2023 01:02:54 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Artur Bujdoso <artur.bujdoso@gmail.com>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 63/97] usb: octeon-hcd: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:05 +0200
Message-Id: <20230517230239.187727-64-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=us258rPKgcRldb8M3YpSySbmJcLMbXTXMqU6SIkk4/Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVx+MB45OTD5xhRqCAnxTdAUQ7XWpssFvQh1Z sCY4krDUKWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcfgAKCRCPgPtYfRL+ TvX2B/40FKZd/Vz0FH2Lp0Bjp4XXQgwW0eOcmlB4FUnmonZEmvPwkf040m3cFG2Lwa4NpTqGBky otpovUhulUb/kSpdOSkRHwzdiTUPq1/hl7yyUjeRiBzSe/1gHiqi7UCtpfgV9pUtDx6M2m4ATMZ TQSkahNdt2sAyv/76ocqpWcZZMzMEbCA9N25HzseIa3jcN1pZa6Uj9dTvypNpGzORp+Ogdeuq0z TI7Wysgwg2heRADiiu7Ue0M7QnCq5nI84KDASCiV3ZjLCUg4OV72dY+xU8sgq94uLQ/xXslhIIM nlHTHDJXxDwB9tDj/iBvmDKEiv2Zcst+OLumZmH0p/q8b+hB
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
 drivers/usb/host/octeon-hcd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index a1cd81d4a114..19d5777f5db2 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -3680,7 +3680,7 @@ static int octeon_usb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int octeon_usb_remove(struct platform_device *pdev)
+static void octeon_usb_remove(struct platform_device *pdev)
 {
 	int status;
 	struct device *dev = &pdev->dev;
@@ -3696,8 +3696,6 @@ static int octeon_usb_remove(struct platform_device *pdev)
 		dev_dbg(dev, "USB shutdown failed with %d\n", status);
 
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 static const struct of_device_id octeon_usb_match[] = {
@@ -3714,7 +3712,7 @@ static struct platform_driver octeon_usb_driver = {
 		.of_match_table = octeon_usb_match,
 	},
 	.probe      = octeon_usb_probe,
-	.remove     = octeon_usb_remove,
+	.remove_new = octeon_usb_remove,
 };
 
 static int __init octeon_usb_driver_init(void)
-- 
2.39.2

