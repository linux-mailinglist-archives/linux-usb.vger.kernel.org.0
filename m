Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542C8707606
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjEQXDd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjEQXDN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D93365BB
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-0008LY-Oo; Thu, 18 May 2023 01:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAb-000wsz-1R; Thu, 18 May 2023 01:02:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-005UZl-6f; Thu, 18 May 2023 01:02:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 71/97] usb: ohci-pxa27x: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:13 +0200
Message-Id: <20230517230239.187727-72-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2110; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=gr7bf4lQWTT4VSRt7+gpTFYbT7HeOmglkEH/7USCz4Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVybjualn9D/znkblQVggTq0CZLUA5brAaNej mjrWVHSEe+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcmwAKCRCPgPtYfRL+ Tn+sB/4+sTR0FWLlKMUm3ziqcgFPrHPpGZ0Ukojz/MizkK3CC0T1QIAMU8zjmRlcYLs24aSeVAk vmtSLpPItkXoPerOWUSn7ILFhmw0Q7JlJ1wzaqzXaJDb75z6Pp3sQzZXp3AwnSC7REea+cDZtLz 8l75k4V9ap77YWDpezqV92p2fqlcGXnjMmnKyJU6uCDvygEb2TDmI1h/2L2XceZcUsRvU4UxI/p /xurSztJprVKo8C4Dpsd7ybQaQ5O+nM3+Jl40zZb6UEdcnmIz54BhtmgI8DQ2moMhPwr/GUAV7R eln8h21Md4YzIglFFYudYoK2q9J5srDEua8KCQjDSFE8Pbt1
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
 drivers/usb/host/ohci-pxa27x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
index 0bc7e96bcc93..6f571c776d11 100644
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -506,7 +506,7 @@ static int ohci_hcd_pxa27x_probe(struct platform_device *pdev)
  * the HCD's stop() method.  It is always called from a thread
  * context, normally "rmmod", "apmd", or something similar.
  */
-static int ohci_hcd_pxa27x_remove(struct platform_device *pdev)
+static void ohci_hcd_pxa27x_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct pxa27x_ohci *pxa_ohci = to_pxa27x_ohci(hcd);
@@ -519,7 +519,6 @@ static int ohci_hcd_pxa27x_remove(struct platform_device *pdev)
 		pxa27x_ohci_set_vbus_power(pxa_ohci, i, false);
 
 	usb_put_hcd(hcd);
-	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
@@ -577,7 +576,7 @@ static const struct dev_pm_ops ohci_hcd_pxa27x_pm_ops = {
 
 static struct platform_driver ohci_hcd_pxa27x_driver = {
 	.probe		= ohci_hcd_pxa27x_probe,
-	.remove		= ohci_hcd_pxa27x_remove,
+	.remove_new	= ohci_hcd_pxa27x_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "pxa27x-ohci",
-- 
2.39.2

