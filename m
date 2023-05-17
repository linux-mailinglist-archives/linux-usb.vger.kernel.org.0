Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6808D7075F0
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbjEQXDP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjEQXDA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6815BA5
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-0008CN-23; Thu, 18 May 2023 01:02:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAX-000wrO-1K; Thu, 18 May 2023 01:02:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAV-005UYL-Of; Thu, 18 May 2023 01:02:51 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 49/97] usb: ehci-grlib: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:51 +0200
Message-Id: <20230517230239.187727-50-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=a2alzHjRApaqWVslTMSS2APYTN14voyOgRjWLr+uf7s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxKeuTvQtGz0NowOvjSxwB9Hb8fQnF5a7efW kjrDTmASyOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcSgAKCRCPgPtYfRL+ TtoOB/93ODl32efd/uXF1iw4aEOxs9DKtfXmLPoT7LtPM0vM72vK4L0JFxMfJcAKkmU2aBlVz6y oyWkv3Gj1G/eWR72TmlJHJyhK0i5VQMhP5yDTtwmmiG2UdeySXTYyFhIsi/TgTbj0aoHDF+1oCs PfvW4YLB/b/puxBzIjRb862ggjoAiz/o9x3hStmpxFYAZoAi5oglHfSAqmMEbh/UVKQczB1OTuF vkrcqRVIvEe6WK0KdYJbGPUPlSkNOUJPBKa95A+Be6xg+xWYLhRlu4kw1SwZXdOPZB+k+YD3rpS mfmNVCsjXaKO96mhKnPPOqqcswF1oFlrKc4g0nJTsKWHNf9p
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
 drivers/usb/host/ehci-grlib.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-grlib.c b/drivers/usb/host/ehci-grlib.c
index 0717f2ccf49d..14150e4d3382 100644
--- a/drivers/usb/host/ehci-grlib.c
+++ b/drivers/usb/host/ehci-grlib.c
@@ -140,7 +140,7 @@ static int ehci_hcd_grlib_probe(struct platform_device *op)
 }
 
 
-static int ehci_hcd_grlib_remove(struct platform_device *op)
+static void ehci_hcd_grlib_remove(struct platform_device *op)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(op);
 
@@ -151,8 +151,6 @@ static int ehci_hcd_grlib_remove(struct platform_device *op)
 	irq_dispose_mapping(hcd->irq);
 
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 
@@ -170,7 +168,7 @@ MODULE_DEVICE_TABLE(of, ehci_hcd_grlib_of_match);
 
 static struct platform_driver ehci_grlib_driver = {
 	.probe		= ehci_hcd_grlib_probe,
-	.remove		= ehci_hcd_grlib_remove,
+	.remove_new	= ehci_hcd_grlib_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name = "grlib-ehci",
-- 
2.39.2

