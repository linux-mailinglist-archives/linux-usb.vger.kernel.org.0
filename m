Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E0C70763B
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjEQXEO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjEQXEG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:04:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3433AB3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAj-0000KK-Or; Thu, 18 May 2023 01:03:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAj-000wvE-00; Thu, 18 May 2023 01:03:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAi-005UbQ-4Z; Thu, 18 May 2023 01:03:04 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 95/97] usb: typec: wcove: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:37 +0200
Message-Id: <20230517230239.187727-96-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xfNyIZ49j7sBxqDhXVimkSXV6vubEqwDh0T/tNqP7H8=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVz/JP+8NR2JfT15n7w0RnMkv8ov2VL3EC+ty uG0Z8Bi2gSJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc/wAKCRCPgPtYfRL+ TjqaB/dgiB9Sd9IHfhV9kqmZglDsARJtSXkHriKoBKTo+oymYJ74AKytbPP5ME3/XzNQPg9aisl 0ECraAF1WVhdMqMpbLJVKkO93xCh4KuGT3ubvuqnpQfso/7WdhIaCg6cHv6sVHETO1F70F+3Prl JRMEGAYodLJQW5B3UH8Buq1T4ywwdLnk+DKNdLLiJHs51G/z8D820Bb9QPnwuhH+VLw+99Hg4aU nEocVYYzYiN7UzWRX+VIpmz6QxXEVaH1m8kOUdchHCPb8HY4xvb20lYum6XYEnpNvV0x8+rMXCj litq455W1efms0ayMpSk1l7Rka7DzMDxGtvYNSNeMYbxtH0=
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
 drivers/usb/typec/tcpm/wcove.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/wcove.c b/drivers/usb/typec/tcpm/wcove.c
index 20917d85d6f4..87d4abde0ea2 100644
--- a/drivers/usb/typec/tcpm/wcove.c
+++ b/drivers/usb/typec/tcpm/wcove.c
@@ -671,7 +671,7 @@ static int wcove_typec_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int wcove_typec_remove(struct platform_device *pdev)
+static void wcove_typec_remove(struct platform_device *pdev)
 {
 	struct wcove_typec *wcove = platform_get_drvdata(pdev);
 	unsigned int val;
@@ -684,8 +684,6 @@ static int wcove_typec_remove(struct platform_device *pdev)
 
 	tcpm_unregister_port(wcove->tcpm);
 	fwnode_remove_software_node(wcove->tcpc.fwnode);
-
-	return 0;
 }
 
 static struct platform_driver wcove_typec_driver = {
@@ -693,7 +691,7 @@ static struct platform_driver wcove_typec_driver = {
 		.name		= "bxt_wcove_usbc",
 	},
 	.probe			= wcove_typec_probe,
-	.remove			= wcove_typec_remove,
+	.remove_new		= wcove_typec_remove,
 };
 
 module_platform_driver(wcove_typec_driver);
-- 
2.39.2

