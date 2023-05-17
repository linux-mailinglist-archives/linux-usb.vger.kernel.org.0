Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39D22707611
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjEQXDl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjEQXDT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D848F7281
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAf-00005k-Ox; Thu, 18 May 2023 01:03:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-000wuY-Iz; Thu, 18 May 2023 01:03:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAd-005Uaw-Ro; Thu, 18 May 2023 01:02:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 88/97] usb: renesas_usbhs: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:30 +0200
Message-Id: <20230517230239.187727-89-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=PE3Y8VeKdt6Y5BRvWuchRxkAbkaOsO8OtYOEhPv3/nM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVzt8vvwBhyKvOgc59T3rV+T7ahqC/26xQizy eQ3GTlnfvOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc7QAKCRCPgPtYfRL+ ThMSCACyhp0r3FSO6MLicvwc2MeBj6hClocQgjbpIkdc2ZmrzcYhYaKR3tZWjidH09xbuDgxxYJ Eto3JqjFgpDHz+7UEahvxPzQ/ywP+5HCFKwZIjvNZY/3UnED1hQZwbmcjd3ggHY24loUxFTlA96 T++aTlpzufRb9/GZPoMWJrrJp38WMtvtmTUkoTfNiAX2A/kLhukqQpvkEfhluOP2hl2jiq0foa7 hKTOO1N8AkVmsOUFOkAUmTWThB6D+8JK3uDsY3nldmmpGfGOC+pOsmq3yb47Cyjpq7IJ2PaO3m5 Whsnwncas3KlcFL7PtlGjHAPmi4lE0hJrxfVaP2A/ur86BD9
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
 drivers/usb/renesas_usbhs/common.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index fa34efabcccf..111b7ee152c4 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -762,7 +762,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int usbhs_remove(struct platform_device *pdev)
+static void usbhs_remove(struct platform_device *pdev)
 {
 	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
 
@@ -780,8 +780,6 @@ static int usbhs_remove(struct platform_device *pdev)
 	usbhs_mod_remove(priv);
 	usbhs_fifo_remove(priv);
 	usbhs_pipe_remove(priv);
-
-	return 0;
 }
 
 static __maybe_unused int usbhsc_suspend(struct device *dev)
@@ -826,7 +824,7 @@ static struct platform_driver renesas_usbhs_driver = {
 		.of_match_table = usbhs_of_match,
 	},
 	.probe		= usbhs_probe,
-	.remove		= usbhs_remove,
+	.remove_new	= usbhs_remove,
 };
 
 module_platform_driver(renesas_usbhs_driver);
-- 
2.39.2

