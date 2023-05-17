Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A42E4707608
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjEQXDe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjEQXDO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D492E6A65
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-0008M0-Sg; Thu, 18 May 2023 01:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAb-000wt4-5o; Thu, 18 May 2023 01:02:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-005UZe-P7; Thu, 18 May 2023 01:02:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 69/97] usb: ohci-platform: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:11 +0200
Message-Id: <20230517230239.187727-70-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=pX/UXaYfIQHWF3bIXvmVgpx3UgC+lxsAJKqG0P8ESj0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVyTQQFmXVxyWMkTG/OqKr95/tRS+U7bnKCKw xizfppsSQ6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVckwAKCRCPgPtYfRL+ TjPFCACUT5mMl7G3z0J18yeqJFBE7fmCCHa7UZglesGz4hHVwG5N9UhBl/tdRZyJk6FCbpqI0WJ 6PqhRPQYDPYQut4k5xRiRdQBFL7bnQ4XeBMjaT/03FukM97j0vHpt1DEQpIPQb/refxIl0tWC/T gF6WiyLI1OD46hf/E22MTqa4kRfhr8JoZUa9P/zfQGZCWRJJoIfXeGYrQv19GEf41Nli3U6e9pZ NHYZDRGd41kANS5OS+v1Pv0Dr75ANvTOSK/oyY4eKJR14488Oll3QEVwVJXVzG4g5ccoRyYKlbZ HJmE8h6CMHbv0f3bZy0QwPWcES0FPaMRmBW6nBuL+08NmgjL
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
 drivers/usb/host/ohci-platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index a84305091c43..03232c5936e8 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -239,7 +239,7 @@ static int ohci_platform_probe(struct platform_device *dev)
 	return err;
 }
 
-static int ohci_platform_remove(struct platform_device *dev)
+static void ohci_platform_remove(struct platform_device *dev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(dev);
 	struct usb_ohci_pdata *pdata = dev_get_platdata(&dev->dev);
@@ -264,8 +264,6 @@ static int ohci_platform_remove(struct platform_device *dev)
 
 	if (pdata == &ohci_platform_defaults)
 		dev->dev.platform_data = NULL;
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -347,7 +345,7 @@ static const struct dev_pm_ops ohci_platform_pm_ops = {
 static struct platform_driver ohci_platform_driver = {
 	.id_table	= ohci_platform_table,
 	.probe		= ohci_platform_probe,
-	.remove		= ohci_platform_remove,
+	.remove_new	= ohci_platform_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "ohci-platform",
-- 
2.39.2

