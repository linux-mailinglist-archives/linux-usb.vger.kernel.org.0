Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D37F70762E
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjEQXEG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbjEQXEE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:04:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A6761AF
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-0008G8-IH; Thu, 18 May 2023 01:02:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-000wrw-H4; Thu, 18 May 2023 01:02:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAX-005UYx-Hb; Thu, 18 May 2023 01:02:53 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 58/97] usb: ehci-st: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:00 +0200
Message-Id: <20230517230239.187727-59-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ElCJMQt4cGChGckTd0HzKvzz4rhWCMP37gM23+PdldI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxu+agG4dxmeWJfHC+8maBQZIxJw7alF2D+N 4qYcmFCSR2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcbgAKCRCPgPtYfRL+ Tk9UB/9KrPatQVvww+nP/hDM6lGFkt0kh6+xJ0fsATqc65Vh7S//sGx0gg8EZ7+Kok44nc4Xhcr ZgDswmkd6fI5gwhfpoRqnQYjISnDHmaj5YRurFDcPMa1gCQ1jPfYTvT6UyzlMdFwev9Oh+1T7x7 PyeGok1sUM30WEG5B/Ek10lA/DwZ+AAhF4hM/rY2ixNrM9gSMCe86qs9/j7xbrynBHRXSklxdwY /aitToSvAnAML5iDPD6vVa+aAKGkZi/Q7ixIw5dov8PpxKHLgBvfwkmKTGxdRH5qLVYRvyBkg+6 DKEJVXh3jW7oAMhXvj/m0Q92QXUvZ8EBrbRRZ5FAV526sR2y
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
 drivers/usb/host/ehci-st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-st.c b/drivers/usb/host/ehci-st.c
index f731dc98c533..ee0976b815b4 100644
--- a/drivers/usb/host/ehci-st.c
+++ b/drivers/usb/host/ehci-st.c
@@ -252,7 +252,7 @@ static int st_ehci_platform_probe(struct platform_device *dev)
 	return err;
 }
 
-static int st_ehci_platform_remove(struct platform_device *dev)
+static void st_ehci_platform_remove(struct platform_device *dev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(dev);
 	struct usb_ehci_pdata *pdata = dev_get_platdata(&dev->dev);
@@ -271,8 +271,6 @@ static int st_ehci_platform_remove(struct platform_device *dev)
 
 	if (pdata == &ehci_platform_defaults)
 		dev->dev.platform_data = NULL;
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -328,7 +326,7 @@ MODULE_DEVICE_TABLE(of, st_ehci_ids);
 
 static struct platform_driver ehci_platform_driver = {
 	.probe		= st_ehci_platform_probe,
-	.remove		= st_ehci_platform_remove,
+	.remove_new	= st_ehci_platform_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver		= {
 		.name	= "st-ehci",
-- 
2.39.2

