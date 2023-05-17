Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9A5F70761E
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjEQXDt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjEQXDY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320627292
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:05 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAg-00009X-Cc; Thu, 18 May 2023 01:03:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAf-000wul-Ah; Thu, 18 May 2023 01:03:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-005Ub8-Fs; Thu, 18 May 2023 01:03:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 91/97] usb: typec: intel_pmc_mux: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:33 +0200
Message-Id: <20230517230239.187727-92-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bG9wBd28wxmLTMkKSTsItzp6QolRIHljhEIInTU+sK4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVzwYs91iWZdJd2wNFkojDi3JYx1q1JnMXne1 jSWIPSi1TeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc8AAKCRCPgPtYfRL+ TqJDB/9PLyY/BEcczFaQlTIjoPGVuTuFIvzy1fRCyz5aexotLPiSAcm/Wo4eyPBK0RvbB8XYrV7 kkhsPFxf91qqJRrJClL8b7SwTNjTV2FwrWgZIhrNGF2ZI9dYlyJGuKbxPWksXtx6aVFZs5asxwK j4OMYXJ2T/z3D8ocXLENwp172BViZbfJT8ayPm/kzOItsEYlel4n3qmDIZIPV2NqFjVCMTZrWHy d+X2N9L3Vee/PXeeZx7truPG5GZcb7cR2MHGsRS3WJAqUylm8vqcJ0c+I2LnpxjGgkN46U/rKUD iiLW37SUAdX9JfBadQz7he3MWfxqZ2hydrXMcpJDXtI5m9v7
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
 drivers/usb/typec/mux/intel_pmc_mux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 34e4188a40ff..e049eadb591e 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -706,7 +706,7 @@ static int pmc_usb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int pmc_usb_remove(struct platform_device *pdev)
+static void pmc_usb_remove(struct platform_device *pdev)
 {
 	struct pmc_usb *pmc = platform_get_drvdata(pdev);
 	int i;
@@ -718,8 +718,6 @@ static int pmc_usb_remove(struct platform_device *pdev)
 	}
 
 	acpi_dev_put(pmc->iom_adev);
-
-	return 0;
 }
 
 static const struct acpi_device_id pmc_usb_acpi_ids[] = {
@@ -734,7 +732,7 @@ static struct platform_driver pmc_usb_driver = {
 		.acpi_match_table = ACPI_PTR(pmc_usb_acpi_ids),
 	},
 	.probe = pmc_usb_probe,
-	.remove = pmc_usb_remove,
+	.remove_new = pmc_usb_remove,
 };
 
 module_platform_driver(pmc_usb_driver);
-- 
2.39.2

