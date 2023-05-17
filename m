Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD4FC7075F2
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjEQXDQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjEQXDD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F7B5BBD
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-0008EO-QN; Thu, 18 May 2023 01:02:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAX-000wrc-RD; Thu, 18 May 2023 01:02:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-005UYi-W8; Thu, 18 May 2023 01:02:53 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 55/97] usb: ehci-ppc-of: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:57 +0200
Message-Id: <20230517230239.187727-56-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iAYnM9HtcvhrEUQqzAdaDJmhAUJ63FvFNtL/m+7J3oA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxglbPpZuKGL625nQQNmISuVgt6G/qsLw4JJ 5PSsox0weaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcYAAKCRCPgPtYfRL+ Tl19B/4vNLCdt+ix9sIbjwJz7wao+bPknDGlkC30cI9PR9DXp45X1NlC5S/G2OkafKPR59qsWpS fStZDqRoJCURZtPEUCznnMws6CPIr7XZ/zgx28t7qqMeMp8jDPrqW5st00+TOe2H7J7vcvrc6by VuuERbCW9VKJFYPPVIxysOChh0ogvMEa8JMq5A5RtmnF68a6rKWvjGNLfSlntn11eGMmFBK3kZm sKCUjQL4eiYbZXT87L5Pq0chobzcGDc69d3bUP9WNzZF+Z8zidNUbleQTWl+KlM1QNBu46rB7D2 Lt1TL/q3m7z0Egz/eQjSTUsglzneXDGxP5JeEn1xo7AAv0FM
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
 drivers/usb/host/ehci-ppc-of.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-ppc-of.c b/drivers/usb/host/ehci-ppc-of.c
index b3aa464e9d2c..7fd83e806ae4 100644
--- a/drivers/usb/host/ehci-ppc-of.c
+++ b/drivers/usb/host/ehci-ppc-of.c
@@ -184,7 +184,7 @@ static int ehci_hcd_ppc_of_probe(struct platform_device *op)
 }
 
 
-static int ehci_hcd_ppc_of_remove(struct platform_device *op)
+static void ehci_hcd_ppc_of_remove(struct platform_device *op)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(op);
 	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
@@ -216,8 +216,6 @@ static int ehci_hcd_ppc_of_remove(struct platform_device *op)
 		}
 	}
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 
@@ -232,7 +230,7 @@ MODULE_DEVICE_TABLE(of, ehci_hcd_ppc_of_match);
 
 static struct platform_driver ehci_hcd_ppc_of_driver = {
 	.probe		= ehci_hcd_ppc_of_probe,
-	.remove		= ehci_hcd_ppc_of_remove,
+	.remove_new	= ehci_hcd_ppc_of_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name = "ppc-of-ehci",
-- 
2.39.2

