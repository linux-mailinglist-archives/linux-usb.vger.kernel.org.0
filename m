Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF9E707616
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjEQXDp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbjEQXDW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300106E91
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAb-0008I6-A7; Thu, 18 May 2023 01:02:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-000wsI-Ej; Thu, 18 May 2023 01:02:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAX-005UZ0-Np; Thu, 18 May 2023 01:02:53 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@amd.com>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 59/97] usb: ehci-xilinx-of: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:01 +0200
Message-Id: <20230517230239.187727-60-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=YGQBTpPXOgfPTC/rJCvHuTP8LurfHLFjMK2/4JY54cI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTUmPxzC5kWRkoXFk9J2RAoEyZ/lL8/I8Gm1v9azuK/a iHa9k6djMYsDIxcDLJiiiz2jWsyrarkIjvX/rsMM4iVCWQKAxenAExkWjz7/3r2i4Kp6faOLJLd 9//NKGrL7Ij4dNZ2ocHV9/94Ys+6e961EfJnijifcezJll5hD/8tR7cWvr8icMbX0SNIb1aWn6i 1a6ve//XcfdGdOzzcTXcuNXpcZe0xd0mKbfjrL3tv3zG77rTk9eovol53CveGBlqXxV1h+SAfsP hj2XzL2BCfCIvXvIdvP7+493vey73GVyN0380sTUg399Hf/Kt3W7mrbZzW4km1yYkqdY3nqkr5w 1tDV3c8/5a5aWLN1HTtTm2ZL1+jIhv9HDnYlwk/SRKqvyYsXrArnFNwbaLhlBcyZ6X+rYvaMdP0 31uPlbc8f0ffXvzPJVbab0PUn4kZ+pLvjuqvz+2e6RcAAA==
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
 drivers/usb/host/ehci-xilinx-of.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-xilinx-of.c b/drivers/usb/host/ehci-xilinx-of.c
index 3d7893747835..a2112c28f631 100644
--- a/drivers/usb/host/ehci-xilinx-of.c
+++ b/drivers/usb/host/ehci-xilinx-of.c
@@ -201,7 +201,7 @@ static int ehci_hcd_xilinx_of_probe(struct platform_device *op)
  *
  * Return: Always return 0
  */
-static int ehci_hcd_xilinx_of_remove(struct platform_device *op)
+static void ehci_hcd_xilinx_of_remove(struct platform_device *op)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(op);
 
@@ -210,8 +210,6 @@ static int ehci_hcd_xilinx_of_remove(struct platform_device *op)
 	usb_remove_hcd(hcd);
 
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 static const struct of_device_id ehci_hcd_xilinx_of_match[] = {
@@ -222,7 +220,7 @@ MODULE_DEVICE_TABLE(of, ehci_hcd_xilinx_of_match);
 
 static struct platform_driver ehci_hcd_xilinx_of_driver = {
 	.probe		= ehci_hcd_xilinx_of_probe,
-	.remove		= ehci_hcd_xilinx_of_remove,
+	.remove_new	= ehci_hcd_xilinx_of_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
 		.name = "xilinx-of-ehci",
-- 
2.39.2

