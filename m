Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2F38707612
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjEQXDm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjEQXDU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24B96E8B
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-0008P8-Cg; Thu, 18 May 2023 01:03:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-000wth-Nb; Thu, 18 May 2023 01:02:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-005UaJ-1R; Thu, 18 May 2023 01:02:58 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 79/97] usb: uhci-grlib: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:21 +0200
Message-Id: <20230517230239.187727-80-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zFIZ8upc3XCaeowtE0Lngd9b4UTM37aGY8JhPPpoYuo=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTUmD09+fcDKkSdLIoaW77LJOnGX9aNMXrZmrh2ryuTg olamnEnozELAyMXg6yYIot945pMqyq5yM61/y7DDGJlApnCwMUpABP5uZSDYXLDbeebmq9tTb7q /2x9fnFa1aSOFxlfWWuqmtVk/25a6L6icrpxKbvC9Tj26+Wfzb+9UOZ8oWT1hDND5uHEHH2+x1c 80rw/M36vMHwT5MssejCx6l328T9/t1ZdDl3IV3SxakLYtTNf+eP/rzzaevmmnJnK48Pe7IXs9g Knu1pUtjir1edw3zDa03j2/V/lf9wP3t630gmb9Cvn0lKhd3vPRu5mYF9a9jR3Xt+PhF3SUulh4 hrPji+ceTNa8qUFQ96jjrzd7wODH3xi0T6sHbRyi1CxpZOIgutbvhjXZQauq9vjec/UhnS4JSX+ KT1ocvKMjvx8Fi2G8jevVv+s3utcsLrdT9836Yf9t6QFAA==
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
 drivers/usb/host/uhci-grlib.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/uhci-grlib.c b/drivers/usb/host/uhci-grlib.c
index 907d5f01edfd..ac3fc5970315 100644
--- a/drivers/usb/host/uhci-grlib.c
+++ b/drivers/usb/host/uhci-grlib.c
@@ -147,7 +147,7 @@ static int uhci_hcd_grlib_probe(struct platform_device *op)
 	return rv;
 }
 
-static int uhci_hcd_grlib_remove(struct platform_device *op)
+static void uhci_hcd_grlib_remove(struct platform_device *op)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(op);
 
@@ -157,8 +157,6 @@ static int uhci_hcd_grlib_remove(struct platform_device *op)
 
 	irq_dispose_mapping(hcd->irq);
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 /* Make sure the controller is quiescent and that we're not using it
@@ -185,7 +183,7 @@ MODULE_DEVICE_TABLE(of, uhci_hcd_grlib_of_match);
 
 static struct platform_driver uhci_grlib_driver = {
 	.probe		= uhci_hcd_grlib_probe,
-	.remove		= uhci_hcd_grlib_remove,
+	.remove_new	= uhci_hcd_grlib_remove,
 	.shutdown	= uhci_hcd_grlib_shutdown,
 	.driver = {
 		.name = "grlib-uhci",
-- 
2.39.2

