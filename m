Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D84BB707605
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjEQXDd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjEQXDN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35430659C
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-0008Jl-Bf; Thu, 18 May 2023 01:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-000wsb-BA; Thu, 18 May 2023 01:02:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-005UZP-19; Thu, 18 May 2023 01:02:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 65/97] usb: ohci-da8xx: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:07 +0200
Message-Id: <20230517230239.187727-66-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ygPDCDguwYgHmgkX/C7YeIfj8XphlIjB72M0L/6PPH0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVyFSfCeMB6W1uivxO7U+rAvl781U8C4MU5Hb wxx7VO5Q1qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVchQAKCRCPgPtYfRL+ Tok1B/0TFkEdcg4Ua3drq4Ap4YPvXLUE/I5kFQGihFq1BilVW6XeEQQ6c69RyGzKFkbK1Db+aui dW5uzDtbSbHM2HiFEavGz9r8bKCaBKr7YmGc8NIrGJOhaUfkXZE3l35IE5pNxejMFP1ryolK99o +ud121AT3srWjSd8DhyrdtRakHKbNxKKeQEPgLFzGhVDnfDg2deBlcLQHa5rXTpUskiN6yZK1K/ zsXHql+na1i6gIBvfU13HlsdcdYtN+sPMV5fzKYKoADvt9IGXkOJo+3i53Fxv/stjQNNLrkjfcZ F39pGXrhY/AeshB2Tee9xABiAs1cm9+5gsGMrCoKzGT+9UBr
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
 drivers/usb/host/ohci-da8xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index d4818e8d652b..e4191a868944 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -469,14 +469,12 @@ static int ohci_da8xx_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int ohci_da8xx_remove(struct platform_device *pdev)
+static void ohci_da8xx_remove(struct platform_device *pdev)
 {
 	struct usb_hcd	*hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -533,7 +531,7 @@ static const struct ohci_driver_overrides da8xx_overrides __initconst = {
  */
 static struct platform_driver ohci_hcd_da8xx_driver = {
 	.probe		= ohci_da8xx_probe,
-	.remove		= ohci_da8xx_remove,
+	.remove_new	= ohci_da8xx_remove,
 	.shutdown 	= usb_hcd_platform_shutdown,
 #ifdef	CONFIG_PM
 	.suspend	= ohci_da8xx_suspend,
-- 
2.39.2

