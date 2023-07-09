Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0634A74C670
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jul 2023 18:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbjGIQeJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jul 2023 12:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjGIQeI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jul 2023 12:34:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE61D1
        for <linux-usb@vger.kernel.org>; Sun,  9 Jul 2023 09:34:06 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qIXM7-0001sl-4H; Sun, 09 Jul 2023 18:33:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qIXM4-00DE3K-KZ; Sun, 09 Jul 2023 18:33:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qIXM3-003ZSr-J6; Sun, 09 Jul 2023 18:33:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH] usb: mtu3: Convert to platform remove callback returning void
Date:   Sun,  9 Jul 2023 18:33:35 +0200
Message-Id: <20230709163335.3458886-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/T81r6WMwxUmMRasfxa3EFZ+33Itiuk1lnEmTTIiUEE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkquFeaWYzHB0WPRXpdx3gj8S2IYC/Tb6hepJB1 5si0hE78zyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZKrhXgAKCRCPgPtYfRL+ TtB3CACqUHCt0leatj03pGWzZcvTc7K7duu3YsJl9lvMXFRPBFSuX/URjSb0jT7nr0FfXYKh3/g seOqPRKvDqfdgDZUAZqKBG/O4G/3wwvl0+drPI8zXz9aNs7jF8Wqk0jbB+koZsUyq9rQqA1bE5j ILN/9NZW58jpKMvwRervrT1nttwDo0DIJyBCu92iMLwrovFFF0uQk3kMulHihpY0Ob9K11fpR3V IsdWmfQjOdBSDczX+GdspxQzpy5KViD7JcbIDtKA2yDsgoJPALhuTqIT91UmDHqqcEyevyCTOp5 W6tXo5XsL1Tp8COTPAccBbscIH/oefZlDOube+CCXlr/7lkd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

The function mtu3_remove() can only return a non-zero value if
ssusb->dr_mode is neiter USB_DR_MODE_PERIPHERAL nor USB_DR_MODE_HOST nor
USB_DR_MODE_OTG. In this case however the probe callback doesn't succeed
and so the remove callback isn't called at all. So the code branch
resulting in this error path can just be dropped and then mtu3_remove()
be converted to return void trivially.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/mtu3/mtu3_plat.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 6f264b129243..cc53bfa25b23 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -451,7 +451,7 @@ static int mtu3_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtu3_remove(struct platform_device *pdev)
+static void mtu3_remove(struct platform_device *pdev)
 {
 	struct ssusb_mtk *ssusb = platform_get_drvdata(pdev);
 
@@ -469,8 +469,6 @@ static int mtu3_remove(struct platform_device *pdev)
 		ssusb_gadget_exit(ssusb);
 		ssusb_host_exit(ssusb);
 		break;
-	default:
-		return -EINVAL;
 	}
 
 	ssusb_rscs_exit(ssusb);
@@ -478,8 +476,6 @@ static int mtu3_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-
-	return 0;
 }
 
 static int resume_ip_and_ports(struct ssusb_mtk *ssusb, pm_message_t msg)
@@ -615,7 +611,7 @@ MODULE_DEVICE_TABLE(of, mtu3_of_match);
 
 static struct platform_driver mtu3_driver = {
 	.probe = mtu3_probe,
-	.remove = mtu3_remove,
+	.remove_new = mtu3_remove,
 	.driver = {
 		.name = MTU3_DRIVER_NAME,
 		.pm = DEV_PM_OPS,

base-commit: 1c7873e3364570ec89343ff4877e0f27a7b21a61
-- 
2.39.2

