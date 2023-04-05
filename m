Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A719F6D7ECD
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 16:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238483AbjDEOL3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 10:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238481AbjDEOLC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 10:11:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B00461B8
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 07:10:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q5-0003FN-2p; Wed, 05 Apr 2023 16:10:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q4-009Abm-57; Wed, 05 Apr 2023 16:10:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pk3q3-00AmTv-DA; Wed, 05 Apr 2023 16:10:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 04/10] usb: musb: mpfs: Convert to platform remove callback returning void
Date:   Wed,  5 Apr 2023 16:10:03 +0200
Message-Id: <20230405141009.3400693-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=33gaBA4Y6a4NaItjwqP6ZDVvbHUivrlSDU1JTOlXqYo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkLYE0cAo6wW2W/ZfnRAyWEZgKaGnL27Sw/5V1a LwcHR5o0XWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZC2BNAAKCRCPgPtYfRL+ TloSCACUkxuwkt7CPpgYZVAcJzKsyqRMZO+aTxnp616JRovzeEwiFsPb+C4pFnc+NSBISz3IIx/ yMr193y0Oji9VxGuiPzrJTR0iyHHgkfmt6E2drYrn2rKhIpGNE2/luuWcqUDuLX4nIPiOSKBl0G SzrIa9PXzc4KsIND0i6xATDxPHjB4ZRnodvJj254eyO+xUlDf2gO+RFlY3nsz9RYMPlNAXwQVz+ ClFoETrLnGGduLle/ZMzGhbJozjo2MbjoJPwiy5Ujv2q0gUT2aKhICo4wkPxO5pM6as8+G2w2WP QJkmGjMYlTIqpI6FYMxQacYLEYS9XRTldpPcHq6+H7L2kiTJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 drivers/usb/musb/mpfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index cea2e8108867..24b98716f7fc 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -235,15 +235,13 @@ static int mpfs_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mpfs_remove(struct platform_device *pdev)
+static void mpfs_remove(struct platform_device *pdev)
 {
 	struct mpfs_glue *glue = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(glue->clk);
 	platform_device_unregister(glue->musb);
 	usb_phy_generic_unregister(pdev);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -256,7 +254,7 @@ MODULE_DEVICE_TABLE(of, mpfs_id_table);
 
 static struct platform_driver mpfs_musb_driver = {
 	.probe = mpfs_probe,
-	.remove = mpfs_remove,
+	.remove_new = mpfs_remove,
 	.driver = {
 		.name = "mpfs-musb",
 		.of_match_table = of_match_ptr(mpfs_id_table)
-- 
2.39.2

