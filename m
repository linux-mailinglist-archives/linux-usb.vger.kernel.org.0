Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 144F970760B
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjEQXDh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbjEQXDQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5102B6E9A
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-0008QG-Cf; Thu, 18 May 2023 01:03:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAd-000wtu-4t; Thu, 18 May 2023 01:02:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-005UaN-7R; Thu, 18 May 2023 01:02:58 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 80/97] usb: uhci-platform: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:22 +0200
Message-Id: <20230517230239.187727-81-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2000; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nq5llLRtqxTeiCKz9CiVLPyrxx2u5Rt3ymD7c+iJv54=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVzH302yAan/O1jyQoTcbj/aa5B1roPiaHX3+ IB0GO7woo2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcxwAKCRCPgPtYfRL+ Tq8BB/41xDNLk+plWzrriMOagRBjZhMeUi9C1CKrQ6/ohvJjferkSwQ2fThmFJ87iYTTo/FrT5F 2+mM7xTWcwL4/FmXpBzfIsV/LXqpqgJqIO+SOnxCxfwAIPaGebrfvMiO36+MzzDZoAoi2fgyIb4 LfO7ZpEIhcsusLrKqCb457APiqtou7TgcCH9HWOdYS2Jv+gKY/56AJgVqo2XnHIdNdgPSWebv3i kPtKIK8cBjcJRcQGGKK3nERCGVgKrPQZ6dMPbK3VLuvKqfqwTfECnf5zSX3vd5DzjEDdcGUf+rP W2Sn3JgrtJtucucbf0jvMHe5jhI28PXkmDEilAXlDWhLB5bj
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
 drivers/usb/host/uhci-platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
index b2049b47a08d..71ca532fc086 100644
--- a/drivers/usb/host/uhci-platform.c
+++ b/drivers/usb/host/uhci-platform.c
@@ -152,7 +152,7 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int uhci_hcd_platform_remove(struct platform_device *pdev)
+static void uhci_hcd_platform_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
@@ -160,8 +160,6 @@ static int uhci_hcd_platform_remove(struct platform_device *pdev)
 	clk_disable_unprepare(uhci->clk);
 	usb_remove_hcd(hcd);
 	usb_put_hcd(hcd);
-
-	return 0;
 }
 
 /* Make sure the controller is quiescent and that we're not using it
@@ -187,7 +185,7 @@ MODULE_DEVICE_TABLE(of, platform_uhci_ids);
 
 static struct platform_driver uhci_platform_driver = {
 	.probe		= uhci_hcd_platform_probe,
-	.remove		= uhci_hcd_platform_remove,
+	.remove_new	= uhci_hcd_platform_remove,
 	.shutdown	= uhci_hcd_platform_shutdown,
 	.driver = {
 		.name = "platform-uhci",
-- 
2.39.2

