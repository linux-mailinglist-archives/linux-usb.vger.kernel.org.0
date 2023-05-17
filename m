Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95A127075E1
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjEQXDC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjEQXCy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4291F49C1
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAR-0007pF-PD; Thu, 18 May 2023 01:02:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAR-000wpB-0e; Thu, 18 May 2023 01:02:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-005UWY-96; Thu, 18 May 2023 01:02:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 21/97] usb: dwc3-st: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:23 +0200
Message-Id: <20230517230239.187727-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=K8cwbiNwd+f+qmr+JugO2uK7CLbH7gcETdaoCKNxExU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwC869KaQR6o4cPUZRT2exnJfWyXW+ffMRwO ag0v6D6kdOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcAgAKCRCPgPtYfRL+ TiA5CACzuW1C4/VGO1XToOtEj5wBjkPoFNxWYvcKmnW1qDXW3xTD/1j4B3CJ0Mqehvf89V6xz5I eXfbTU2PLhxKzQb27B5qeG2vRmFO7OU+G8VnfaleZp+lkFmvI/zKlZdYjVoUMFGrZ201zXqd0z6 FekLmQSRBKxJ1gamu+O9cB4YSxlmASZAPBYvwh/n3B4UQWj8x7lBivrUSVa8w7RhfuMNGLFZNku ygT6qy38snUSidkh0Kd+qItMCCNY4/ENBKGILiWm3EOyDzfaFYU408qC6//kNevnrdcg0Jn8hFk dcXCoKVYC38lN9xh8xZRN6K8cRE6naAPR9KdrgNV5XnWZM4m
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
 drivers/usb/dwc3/dwc3-st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index fea5290de83f..211360eee95a 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -305,7 +305,7 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int st_dwc3_remove(struct platform_device *pdev)
+static void st_dwc3_remove(struct platform_device *pdev)
 {
 	struct st_dwc3 *dwc3_data = platform_get_drvdata(pdev);
 
@@ -313,8 +313,6 @@ static int st_dwc3_remove(struct platform_device *pdev)
 
 	reset_control_assert(dwc3_data->rstc_pwrdn);
 	reset_control_assert(dwc3_data->rstc_rst);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -364,7 +362,7 @@ MODULE_DEVICE_TABLE(of, st_dwc3_match);
 
 static struct platform_driver st_dwc3_driver = {
 	.probe = st_dwc3_probe,
-	.remove = st_dwc3_remove,
+	.remove_new = st_dwc3_remove,
 	.driver = {
 		.name = "usb-st-dwc3",
 		.of_match_table = st_dwc3_match,
-- 
2.39.2

