Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93C9E707609
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjEQXDf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjEQXDO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709306A78
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAd-0008N1-DL; Thu, 18 May 2023 01:02:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAb-000wtE-Ma; Thu, 18 May 2023 01:02:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-005UZy-O7; Thu, 18 May 2023 01:02:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 74/97] usb: ohci-spear: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:16 +0200
Message-Id: <20230517230239.187727-75-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6SqCZCQZS2c2IYPV1zkJBguFd8F7bVmtQ8iwH3EbuUU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVyjg07HaSLgam1x4CCyft+V5DvR2T1JFv/42 u75lwKQyPOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcowAKCRCPgPtYfRL+ TnzcB/9+Y+uStPhXZzvL0KqnchrAATqXAYsr5Qdzt8bzYhbaQUv2jNi6w1mLi+BM6gvmMgV6j5a rhJfsr2JpxaFyu2HHXviYObsMf6puLRDxe8bhgylOjqc824BsNUnzmEGAnppEMYNTLu0JpHWM7y ON5NCC1+wsRpKrV5zq4RifZdLEj9xgwx1f1H8oddA6rYYLc/9gRKPBPPXd9TXw6PUunpdalf5lx m4kxvVK13IPu/ongWDNazyg7i8EK0fiGxJHcUpIsqTP5JFwLf+BuwnblxrwvRmcPrHGHJopnyRy mBBYJVkZa9zxTUZrlWlkG1OXy/sxvdpfIoWJMc1/SFIuIAEX
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
 drivers/usb/host/ohci-spear.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
index 196951a27f3f..f4b2656407dd 100644
--- a/drivers/usb/host/ohci-spear.c
+++ b/drivers/usb/host/ohci-spear.c
@@ -98,7 +98,7 @@ static int spear_ohci_hcd_drv_probe(struct platform_device *pdev)
 	return retval;
 }
 
-static int spear_ohci_hcd_drv_remove(struct platform_device *pdev)
+static void spear_ohci_hcd_drv_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct spear_ohci *sohci_p = to_spear_ohci(hcd);
@@ -108,7 +108,6 @@ static int spear_ohci_hcd_drv_remove(struct platform_device *pdev)
 		clk_disable_unprepare(sohci_p->clk);
 
 	usb_put_hcd(hcd);
-	return 0;
 }
 
 #if defined(CONFIG_PM)
@@ -159,7 +158,7 @@ MODULE_DEVICE_TABLE(of, spear_ohci_id_table);
 /* Driver definition to register with the platform bus */
 static struct platform_driver spear_ohci_hcd_driver = {
 	.probe =	spear_ohci_hcd_drv_probe,
-	.remove =	spear_ohci_hcd_drv_remove,
+	.remove_new =	spear_ohci_hcd_drv_remove,
 #ifdef CONFIG_PM
 	.suspend =	spear_ohci_hcd_drv_suspend,
 	.resume =	spear_ohci_hcd_drv_resume,
-- 
2.39.2

