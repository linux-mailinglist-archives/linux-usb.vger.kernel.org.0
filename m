Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63F7707631
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjEQXEI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjEQXEE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:04:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8A6526E
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-0008Oh-2p; Thu, 18 May 2023 01:03:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-000wtZ-Gw; Thu, 18 May 2023 01:02:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-005UZW-DM; Thu, 18 May 2023 01:02:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Vladimir Zapolskiy <vz@mleia.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 67/97] usb: ohci-nxp: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:09 +0200
Message-Id: <20230517230239.187727-68-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=h7oAuprEWjC3/8xhmUO7guBCsplrTBMLffMOTy85L0o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVyH1yQbkFw5cNu+1Avg8LKv5VTIPmdOiijid mcfD2kbYzOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVchwAKCRCPgPtYfRL+ TqwVB/wPGUOLU2nvajEW+60e+ycBAgXjJg/xaLMHQG3man0d2rF+t3F04+c2aKiQ6IDh8Lm7lJR zJjV0n8hUnwYKRv6FezYjtudEVlhE8xKde3Hp4pI9U+mMOIrNDE8JWD8ocvOghZMChoJ01dxXHP ELn5AMTru7KD1RwqtjlyAvXZsjb13AVHvjDLipEdYploadG/VOT+h0GTf/tQIimcb4qsCc/rwwe 69GmPMAFJE1srTkdYsGTwefnXzlgM67aGNzRlU3pMQa+bncwaxUDHyZK5Z/qujg7hIqBiYG6XnA bdmf7BQih3MMZNLJ1XYIx7Yo1WuvdfWt7lBv+asAyBdwOAFY
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
 drivers/usb/host/ohci-nxp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
index 5b32e683e367..c04b2af5c766 100644
--- a/drivers/usb/host/ohci-nxp.c
+++ b/drivers/usb/host/ohci-nxp.c
@@ -237,7 +237,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ohci_hcd_nxp_remove(struct platform_device *pdev)
+static void ohci_hcd_nxp_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
@@ -246,8 +246,6 @@ static int ohci_hcd_nxp_remove(struct platform_device *pdev)
 	usb_put_hcd(hcd);
 	clk_disable_unprepare(usb_host_clk);
 	isp1301_i2c_client = NULL;
-
-	return 0;
 }
 
 /* work with hotplug and coldplug */
@@ -267,7 +265,7 @@ static struct platform_driver ohci_hcd_nxp_driver = {
 		.of_match_table = of_match_ptr(ohci_hcd_nxp_match),
 	},
 	.probe = ohci_hcd_nxp_probe,
-	.remove = ohci_hcd_nxp_remove,
+	.remove_new = ohci_hcd_nxp_remove,
 };
 
 static int __init ohci_nxp_init(void)
-- 
2.39.2

