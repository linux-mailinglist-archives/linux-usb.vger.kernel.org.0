Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9413B6C0046
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 10:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjCSJYo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 05:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjCSJYk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 05:24:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C71B17CD5
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 02:24:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHH-0003Qd-K3; Sun, 19 Mar 2023 10:24:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHG-005C8C-VC; Sun, 19 Mar 2023 10:24:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHG-0066PT-9C; Sun, 19 Mar 2023 10:24:34 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 09/11] usb: phy: tahvo: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 10:24:26 +0100
Message-Id: <20230319092428.283054-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=PwVttHTKkvQaDC4TxzOACXeyTYsl3btaTzIkidzRG5o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtTFBBqBOA2v86DPb4GsTzpFJgooN7hFcJ5mt DT1T6C1uP+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUxQAKCRCPgPtYfRL+ TkrGB/9LD+ue/9RE+nHE3Ef6wvs3tu1g+lip6TalOCq+ktsGcnUJLGMDKqKTQGPvyjXuwO0v3Lz h/mJ9hO2/Wo9Du0HVT+Ef5F8dETmxxleAQuQXMeMG/PojTRWJGDUM85TCWEWi1mnwwBI1/2HWgc 3FjVGhJpYPfny7VLIQf1q7nNzac+QZ0kLHJhzc95t3heilagpqOPMsiWWAYxxf3p+75Kv4mpTpc kVH54QiSMwHRplEWGAAfTW5jYHobdZm0uYLMvePIFIVrQmcA/gWG7+K35x8uLXfTbgKTzOjmVAr lr+IRYz3+dj4EMknd3eQZOap4kCSfAWKDPjDbl2rlY9vniqQ
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
 drivers/usb/phy/phy-tahvo.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
index f2d2cc586c5b..47562d49dfc1 100644
--- a/drivers/usb/phy/phy-tahvo.c
+++ b/drivers/usb/phy/phy-tahvo.c
@@ -412,7 +412,7 @@ static int tahvo_usb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tahvo_usb_remove(struct platform_device *pdev)
+static void tahvo_usb_remove(struct platform_device *pdev)
 {
 	struct tahvo_usb *tu = platform_get_drvdata(pdev);
 
@@ -420,13 +420,11 @@ static int tahvo_usb_remove(struct platform_device *pdev)
 	usb_remove_phy(&tu->phy);
 	if (!IS_ERR(tu->ick))
 		clk_disable(tu->ick);
-
-	return 0;
 }
 
 static struct platform_driver tahvo_usb_driver = {
 	.probe		= tahvo_usb_probe,
-	.remove		= tahvo_usb_remove,
+	.remove_new	= tahvo_usb_remove,
 	.driver		= {
 		.name	= "tahvo-usb",
 		.dev_groups = tahvo_groups,
-- 
2.39.2

