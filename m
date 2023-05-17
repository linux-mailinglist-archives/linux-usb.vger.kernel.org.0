Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8369A70761B
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjEQXDs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjEQXDX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599966E9D
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-0008HJ-Tu; Thu, 18 May 2023 01:02:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-000wsA-1o; Thu, 18 May 2023 01:02:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAX-005UZ3-TO; Thu, 18 May 2023 01:02:53 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Darren Stevens <darren@stevens-zone.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 60/97] usb: fsl-mph-dr-of: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:02 +0200
Message-Id: <20230517230239.187727-61-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=01dextRJZ0CAKyffcG5PKCKiPJIVH454WWOQH4hfJE0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxwDO2v3AQuDX+mJQD5X9Rs0+aHZXZCQmvjM kIPR0EnavCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVccAAKCRCPgPtYfRL+ Tof0B/9F7KuOdDF0hnAeEd0FxcHgbY2i2RJ4uHHOduaymegMNmux+oU9kbkboXzcKy5YsP+8ovl 54ipAUUNru87EdNhocGsH7Axw9kLw7xv1jBfxSnG/xfjz6nzskdiI767XA4pPb7imyF1KYzPOPA YaANfcTq0nic6RoPFlfBS6juxNXCG0J9y6VsjqO9LJuN9IEJ0L2x5DqW5245uduoaMXNQLJpQNB uvce/2lqPC9aWiEky1Mw9fAncUmHhXRyFQXBhquVN/dINOy9vZ6h0exmO9A5N6Esd7OOVmwU3Tk mNDmxnOH39sWVZi00Fng8EEr07xg8BNcwABfG0AWf+F4ouzR
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
 drivers/usb/host/fsl-mph-dr-of.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index 9db909d12354..a9877f2569f4 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -265,10 +265,9 @@ static int __unregister_subdev(struct device *dev, void *d)
 	return 0;
 }
 
-static int fsl_usb2_mph_dr_of_remove(struct platform_device *ofdev)
+static void fsl_usb2_mph_dr_of_remove(struct platform_device *ofdev)
 {
 	device_for_each_child(&ofdev->dev, NULL, __unregister_subdev);
-	return 0;
 }
 
 #ifdef CONFIG_PPC_MPC512x
@@ -362,7 +361,7 @@ static struct platform_driver fsl_usb2_mph_dr_driver = {
 		.of_match_table = fsl_usb2_mph_dr_of_match,
 	},
 	.probe	= fsl_usb2_mph_dr_of_probe,
-	.remove	= fsl_usb2_mph_dr_of_remove,
+	.remove_new = fsl_usb2_mph_dr_of_remove,
 };
 
 module_platform_driver(fsl_usb2_mph_dr_driver);
-- 
2.39.2

