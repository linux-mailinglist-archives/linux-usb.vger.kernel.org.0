Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D852E7075E3
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjEQXDE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjEQXCy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76583AB3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAR-0007kc-ES; Thu, 18 May 2023 01:02:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-000woG-Sr; Thu, 18 May 2023 01:02:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-005UVq-3o; Thu, 18 May 2023 01:02:44 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Prashanth K <quic_prashk@quicinc.com>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 10/97] usb: common: usb-conn-gpio: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:12 +0200
Message-Id: <20230517230239.187727-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1882; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iAI9OTHwn+ri33OrQsc8ms0447IPbtHUXp9nab+ukH4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVv1wddOJ/yxMnKKFUe50iNomSKAeBulUbiJE 5eHi1dS6iaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb9QAKCRCPgPtYfRL+ Tp2LB/9qTMI65H21sXLpSWxpJlDULGvenv94tJp8SxhqP9Xcf2UviKBh3iVnmF130qCt+RJoFDg 6TRYV3AHcwC1rrdaUHVZ5HppQfqHcuc4xmh8H2FTAZ9lq3LdM9Vi6D4r0e+DdU4v3IgB5ABm9// dJLF/3Cmm0I0dMWe5yfsaT587cp0kw8pggih83u/KLixZyC8lfH/4Xq7vkQudEgQTZ23XVTIUo1 qg9PY8HqIVjHEYjjsmD4s+3VslRoy0zcsQap5Wsr0Je/vzfUgjRH1QD1LYAmqyWHpU5CATBVvYo d+Y9o1LeAcPCvT24xVVN3Ru/QdBbEDfjcK0fiNA2nEz/4YOM
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
 drivers/usb/common/usb-conn-gpio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index e20874caba36..766005d20bae 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -267,7 +267,7 @@ static int usb_conn_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int usb_conn_remove(struct platform_device *pdev)
+static void usb_conn_remove(struct platform_device *pdev)
 {
 	struct usb_conn_info *info = platform_get_drvdata(pdev);
 
@@ -277,8 +277,6 @@ static int usb_conn_remove(struct platform_device *pdev)
 		regulator_disable(info->vbus);
 
 	usb_role_switch_put(info->role_sw);
-
-	return 0;
 }
 
 static int __maybe_unused usb_conn_suspend(struct device *dev)
@@ -338,7 +336,7 @@ MODULE_DEVICE_TABLE(of, usb_conn_dt_match);
 
 static struct platform_driver usb_conn_driver = {
 	.probe		= usb_conn_probe,
-	.remove		= usb_conn_remove,
+	.remove_new	= usb_conn_remove,
 	.driver		= {
 		.name	= "usb-conn-gpio",
 		.pm	= &usb_conn_pm_ops,
-- 
2.39.2

