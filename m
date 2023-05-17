Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD437075F7
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjEQXDV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjEQXDE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DE35FFA
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAX-000894-TP; Thu, 18 May 2023 01:02:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAV-000wqy-Uw; Thu, 18 May 2023 01:02:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAV-005UY9-75; Thu, 18 May 2023 01:02:51 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Justin Chen <justinpopo6@gmail.com>,
        Al Cooper <alcooperx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 46/97] usb: ehci-brcm: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:48 +0200
Message-Id: <20230517230239.187727-47-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1923; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=MI4AZeLzTmm6YhxSCcSKJx6V52fmTUxX3Blw+rwDlE8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxCOi03LGbbkWujkUqyXxJmQRCjIkSeYjr97 kuRk9u7Si+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcQgAKCRCPgPtYfRL+ Ttj9CACKuLD7yH0z3SRKoaPFI/abpMb2AriPjw0Ur6JnNsIsOnUpfnqZd8epUu8AjGcj+dtgsPG V3DSBo9B+IxmN3fUhOjbT6bn/pJdIOfeCaGkYAycy3g7jBkHdgjHdOsqNZsreNiJXs2/m9LCYlM LSs5AcVQV1M3kCav2SAdMlbMZpr3P0JtKGpCJ7dFVM8WT34CW1rmOGSKA0PNgyuHml2D69CbTEk K3S8Ra5TkUpYvoWq6GFxJFg+vtl+C2b5mPaGgDeARpkaFPyEeJ2cYWw4BrD+ELjrAk6oRgvOTY4 uPIRC6wsMlxlExMj+MIKVxqtIlgaeTwCYNOJ0GrDbDh1EmNo
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
 drivers/usb/host/ehci-brcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
index 6a0f64c9e5e8..0362a082abb4 100644
--- a/drivers/usb/host/ehci-brcm.c
+++ b/drivers/usb/host/ehci-brcm.c
@@ -188,7 +188,7 @@ static int ehci_brcm_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int ehci_brcm_remove(struct platform_device *dev)
+static void ehci_brcm_remove(struct platform_device *dev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(dev);
 	struct brcm_priv *priv = hcd_to_ehci_priv(hcd);
@@ -196,7 +196,6 @@ static int ehci_brcm_remove(struct platform_device *dev)
 	usb_remove_hcd(hcd);
 	clk_disable_unprepare(priv->clk);
 	usb_put_hcd(hcd);
-	return 0;
 }
 
 static int __maybe_unused ehci_brcm_suspend(struct device *dev)
@@ -250,7 +249,7 @@ static const struct of_device_id brcm_ehci_of_match[] = {
 
 static struct platform_driver ehci_brcm_driver = {
 	.probe		= ehci_brcm_probe,
-	.remove		= ehci_brcm_remove,
+	.remove_new	= ehci_brcm_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "ehci-brcm",
-- 
2.39.2

