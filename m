Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58796C004D
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 10:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjCSJYx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 05:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjCSJYo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 05:24:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEC2166D2
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 02:24:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHK-0003Ob-8t; Sun, 19 Mar 2023 10:24:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHF-005C7o-Ou; Sun, 19 Mar 2023 10:24:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHF-0066PA-5Z; Sun, 19 Mar 2023 10:24:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Li Jun <jun.li@nxp.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 04/11] usb: phy: generic: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 10:24:21 +0100
Message-Id: <20230319092428.283054-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1681; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ydWiiLHjJK9Ik+y7HR48dwJPBFCPagA2sGzhNW7BPq0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtS/kABQDIrOq2bOLlvG5XZTs7h0ddtpOwu8P YYumJywBKCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUvwAKCRCPgPtYfRL+ TihPB/9aDCBEfOjy+SkB2VDP4Ki3GqhtTQipeU72vKbBLmiL7ZBinH6yAfYCDofJQwGbi6Dzvc0 +q/fE9hBfrLlqIb1+jmHaUaXwEnaZO6+f6295C7MIYhDm9qrG5894zZ377S/WoZVTkuy3k1FD23 WpbB2CYHfjV+7bVhMc1xUfXH5rC2fOdI+1F1tzp9Vx+nSN4OrqBZzp9++/1vAgunuKgz/pOomir MRog9OX5AXz8Q1dTi5if+E7n8KOkQVxmmdBVCv9gSC7noPHQwphXVg88eXDGPdtXt01WId6NYXy CE4v02O+5oQE4xZ24yB2UJyMDmSYT3s09+MpmKmuFS/geXAv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/phy/phy-generic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index c1309ea24a52..770081b828a4 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -330,13 +330,11 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int usb_phy_generic_remove(struct platform_device *pdev)
+static void usb_phy_generic_remove(struct platform_device *pdev)
 {
 	struct usb_phy_generic *nop = platform_get_drvdata(pdev);
 
 	usb_remove_phy(&nop->phy);
-
-	return 0;
 }
 
 static const struct of_device_id nop_xceiv_dt_ids[] = {
@@ -348,7 +346,7 @@ MODULE_DEVICE_TABLE(of, nop_xceiv_dt_ids);
 
 static struct platform_driver usb_phy_generic_driver = {
 	.probe		= usb_phy_generic_probe,
-	.remove		= usb_phy_generic_remove,
+	.remove_new	= usb_phy_generic_remove,
 	.driver		= {
 		.name	= "usb_phy_generic",
 		.of_match_table = nop_xceiv_dt_ids,
-- 
2.39.2

