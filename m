Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343E47075E7
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjEQXDH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjEQXC4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F105B99
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAU-0007xI-Tf; Thu, 18 May 2023 01:02:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAS-000wpo-Uc; Thu, 18 May 2023 01:02:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAS-005UX6-08; Thu, 18 May 2023 01:02:48 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Li Yang <leoyang.li@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kernel@pengutronix.de
Subject: [PATCH 30/97] usb: gadget/fsl_qe_udc: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:32 +0200
Message-Id: <20230517230239.187727-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=En3KNUJ/RA3U3pMVZQZ/9cfHAOUWZwuPGVw0CK6AIno=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwXunVuPOl3Y4CmP3Wu1ME3ZEWWeCmAkWTKp NG1QVf+ysuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcFwAKCRCPgPtYfRL+ TlXAB/4rVpLK0r2J4aiduOJ8JWUMGjwhO3kHxXTLF1NNQ8wBBg9YHetvuVr9rtxWS1BwJjHX8hK ARATuw55h2gO/poc7k5+KNAiEePT9PUrVcaR5t0Yf+XSi0vXANy+i/klgwghWVy15yMPfgQLFXW CHD8930JrfbuoR4zgvLIKYynchHmDxPqxQfIXMRiPe+1Zrjxk0gmrMdP6CmTTUDxW3H58U4lbd3 itYG8Ab7oIzB6oQvwPP+9i0ftJclDuhSLEUDzweiD4sEht8uLyYIV11FVU8bqgjE5s0wXgfFmd8 wT7XpKwWoDIjhblwq++dJhDv/UHcJmRGIGXJTvLYvbp9v8SJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/usb/gadget/udc/fsl_qe_udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 3b1cc8fa30c8..9c5dc1c1a68e 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -2628,7 +2628,7 @@ static int qe_udc_resume(struct platform_device *dev)
 }
 #endif
 
-static int qe_udc_remove(struct platform_device *ofdev)
+static void qe_udc_remove(struct platform_device *ofdev)
 {
 	struct qe_udc *udc = platform_get_drvdata(ofdev);
 	struct qe_ep *ep;
@@ -2679,8 +2679,6 @@ static int qe_udc_remove(struct platform_device *ofdev)
 
 	/* wait for release() of gadget.dev to free udc */
 	wait_for_completion(&done);
-
-	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
@@ -2708,7 +2706,7 @@ static struct platform_driver udc_driver = {
 		.of_match_table = qe_udc_match,
 	},
 	.probe          = qe_udc_probe,
-	.remove         = qe_udc_remove,
+	.remove_new     = qe_udc_remove,
 #ifdef CONFIG_PM
 	.suspend        = qe_udc_suspend,
 	.resume         = qe_udc_resume,
-- 
2.39.2

