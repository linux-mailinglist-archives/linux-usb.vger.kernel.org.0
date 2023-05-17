Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1854570763D
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbjEQXEP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjEQXEG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:04:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91328768C
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAj-0000L4-TG; Thu, 18 May 2023 01:03:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAj-000wvH-8s; Thu, 18 May 2023 01:03:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAi-005UbT-A9; Thu, 18 May 2023 01:03:04 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?utf-8?q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 96/97] usb: typec: ucsi: acpi: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:38 +0200
Message-Id: <20230517230239.187727-97-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=TxAZQR+6V48OEiodlRUPKA8wNn8lRv8uDH0e5dgPQ8M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZV0Fg69ufz5KF/pNePgaChnxkM+TxnIyS0MzR 17qTmDpoiyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVdBQAKCRCPgPtYfRL+ TrUeB/9pueVdriQuInGJMvM8ohck32POoFjmzk1VTIqWGQuwIBg19f+WridmwSOL5Z9wZ4xVXbt vY5ngVFf53YVflpHHVKpFpva9pS3DMKr10+utBAw6ZCk62R8RRz2aV4EnubEguUGaP/0ROfFR1t oLzxT5SxxiiCGid3TTLtOdWJyaYCM4PdarKQvpqA/EsjsdrrD3DLtMJ8xqHnUAHAoM/YGk8p1F9 RYLv3l+vgO6O6foUOu9IwGXCXoUnrwM+GshDAtAOhNcjs4NmjHGDPOpg42NkNvLwDzpB19cOJuB qpG2xFrNLMaIFAWp7sQoq6bwVb60eFbLbylgkrsN4Y9q/iV1
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
 drivers/usb/typec/ucsi/ucsi_acpi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 217355f1f9b9..6bbf490ac401 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -212,7 +212,7 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ucsi_acpi_remove(struct platform_device *pdev)
+static void ucsi_acpi_remove(struct platform_device *pdev)
 {
 	struct ucsi_acpi *ua = platform_get_drvdata(pdev);
 
@@ -221,8 +221,6 @@ static int ucsi_acpi_remove(struct platform_device *pdev)
 
 	acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev), ACPI_DEVICE_NOTIFY,
 				   ucsi_acpi_notify);
-
-	return 0;
 }
 
 static int ucsi_acpi_resume(struct device *dev)
@@ -247,7 +245,7 @@ static struct platform_driver ucsi_acpi_platform_driver = {
 		.acpi_match_table = ACPI_PTR(ucsi_acpi_match),
 	},
 	.probe = ucsi_acpi_probe,
-	.remove = ucsi_acpi_remove,
+	.remove_new = ucsi_acpi_remove,
 };
 
 module_platform_driver(ucsi_acpi_platform_driver);
-- 
2.39.2

