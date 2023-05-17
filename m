Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA1D70760E
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjEQXDj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjEQXDT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 994AA6E87
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAd-0008Ny-Va; Thu, 18 May 2023 01:03:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-000wtL-3V; Thu, 18 May 2023 01:02:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-005UZu-I1; Thu, 18 May 2023 01:02:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 73/97] usb: ohci-sm501: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:15 +0200
Message-Id: <20230517230239.187727-74-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=up1rvxcl2THt3x6C7p0bI43DfWhjvAUHLBt7XLbwvTc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVydBVHXmu1Q/y0OEBvGz5pQmM5EJPiAfeR1/ FeEZ+afja6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcnQAKCRCPgPtYfRL+ TuI+B/98ctrdoPR+hMpNVGs3VRL9BpMm9/iGBCSe84V9USo/oCS9f7iPjPXWP/ZmTLGypF+veWf gpUkFvf7py+SK5bga0UQWlOWdVt0Zu+jEtyMxJhin+d6EwdCp5gXACgj72eGulb3pITvjC3N9Fr 90CYSQH7vANrUrfN8mY5POCC8Ne9bqGYFoJdadSO2qDz4F5Nxfx5iGACX75wWOz1oYFhe8kMaiQ qq/CLeCg3tWYegAcAZxWu8kLa0Ia62Zc0cPDFhCFQ6CjRQA5jI3nxm1RcrBab/MbEJbdZp1/wn1 /WlcPkKEF0zErSnuqtwEyUzNW0jNCDBbAjH2kGGg1Dr1YdHT
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
 drivers/usb/host/ohci-sm501.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ohci-sm501.c b/drivers/usb/host/ohci-sm501.c
index f5de586454e3..0468eeb4fcfd 100644
--- a/drivers/usb/host/ohci-sm501.c
+++ b/drivers/usb/host/ohci-sm501.c
@@ -185,7 +185,7 @@ static int ohci_hcd_sm501_drv_probe(struct platform_device *pdev)
 	return retval;
 }
 
-static int ohci_hcd_sm501_drv_remove(struct platform_device *pdev)
+static void ohci_hcd_sm501_drv_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct resource	*mem;
@@ -202,8 +202,6 @@ static int ohci_hcd_sm501_drv_remove(struct platform_device *pdev)
 
 	sm501_modify_reg(pdev->dev.parent, SM501_IRQ_MASK, 0, 1 << 6);
 	sm501_unit_power(pdev->dev.parent, SM501_GATE_USB_HOST, 0);
-
-	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
@@ -255,7 +253,7 @@ static int ohci_sm501_resume(struct platform_device *pdev)
  */
 static struct platform_driver ohci_hcd_sm501_driver = {
 	.probe		= ohci_hcd_sm501_drv_probe,
-	.remove		= ohci_hcd_sm501_drv_remove,
+	.remove_new	= ohci_hcd_sm501_drv_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.suspend	= ohci_sm501_suspend,
 	.resume		= ohci_sm501_resume,
-- 
2.39.2

