Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8904B7075DE
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjEQXDA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjEQXCx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF8F4C2C
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAS-0007pV-1M; Thu, 18 May 2023 01:02:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAR-000wpH-8t; Thu, 18 May 2023 01:02:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-005UWc-FT; Thu, 18 May 2023 01:02:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@amd.com>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 22/97] usb: dwc3-xilinx: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:24 +0200
Message-Id: <20230517230239.187727-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=t7VzUnIkM2e38shH9Y4kGTLDFowMlVRPRL2pu+1oAeM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTUGOajrJxxQYUtd4p5fp85e09ikszcvqNlu+9+Vyhs5 +0Q837dyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEtBg5GBZfUy/M+yHuzcfk NENAu5XrlU9t/a/v1c1mHQlremexRkmfYvvGkGNgLWOi051TLrzJsELtVOvlj4e7J2f/N5p77Ez Gl7sGxbJi7KUr5wsvEuQyP+Z/pl77gY/D4997FRc1r2X8dYz7gVN8bOqfU9I2f8peXdDgYpLYlC LGZvjButHv3Lr8ez1Cq7xTltoGtNvuSPnWtVC3tGMhy3rx8oT2LuMtj9JDJSPU997iEC2O+N55U H513omuE7qqb9dvnrPpfSp3a7qNS5LoBS7u2XPTlU5GMx9auJf3IHfmPnan/KLC2tf39x7MqY8T mnv+M1/Vtkr3nxFGUy2ncmZvtPxfyPBwm9Gtdam2RzcDAA==
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
 drivers/usb/dwc3/dwc3-xilinx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 2c36f97652ca..19307d24f3a0 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -305,7 +305,7 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dwc3_xlnx_remove(struct platform_device *pdev)
+static void dwc3_xlnx_remove(struct platform_device *pdev)
 {
 	struct dwc3_xlnx	*priv_data = platform_get_drvdata(pdev);
 	struct device		*dev = &pdev->dev;
@@ -318,8 +318,6 @@ static int dwc3_xlnx_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
-
-	return 0;
 }
 
 static int __maybe_unused dwc3_xlnx_runtime_suspend(struct device *dev)
@@ -388,7 +386,7 @@ static const struct dev_pm_ops dwc3_xlnx_dev_pm_ops = {
 
 static struct platform_driver dwc3_xlnx_driver = {
 	.probe		= dwc3_xlnx_probe,
-	.remove		= dwc3_xlnx_remove,
+	.remove_new	= dwc3_xlnx_remove,
 	.driver		= {
 		.name		= "dwc3-xilinx",
 		.of_match_table	= dwc3_xlnx_of_match,
-- 
2.39.2

