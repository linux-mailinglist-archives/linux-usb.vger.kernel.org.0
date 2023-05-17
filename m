Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 206C37075D5
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjEQXC4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjEQXCu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D79F5B99
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-0007nt-WE; Thu, 18 May 2023 01:02:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-000wow-C5; Thu, 18 May 2023 01:02:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-005UWN-Kq; Thu, 18 May 2023 01:02:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 18/97] usb: dwc3-of-simple: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:20 +0200
Message-Id: <20230517230239.187727-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=dWcN5cIWOM4UBejp6HhCqo0zpup7VCGR/ViAFNVJDOQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVv/6JagR22opDJGF+lKBSsDjifpaAAAXEg9x EU+bcbGf3CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb/wAKCRCPgPtYfRL+ TlRuB/4g2Tav1z/dZJJK7v0mi1xtabxpDuGWvHYqhWW33LhO02cLT1vW5grYAZg0pw47lmeBn5i IE4qb3vQh+EKC/c5royvJSzsS8+T1gh3quSrJDvVsvlx8Ns53pln77yDSg8TcN3hRxKFN0CiHUp a4f1EpLJLeAxY4WY+C771keTHn3EfvJxUVoDzvpwxoohauhfd61jl0CES4TKa+DNIKy5EOIpl4J 5PCSJE41WHP71HehUfF5VTpS3zdWwfQstoeDhK2m1aytVeiLug+D/1JgqwXmVgMXKDoKY0RH+W7 ytjC9TIpORefN3l7J7mNKvQ25tJsNp3z528KcGOLZMqBWbKR
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
 drivers/usb/dwc3/dwc3-of-simple.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index 71fd620c5161..7e6ad8fe61a5 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -112,13 +112,11 @@ static void __dwc3_of_simple_teardown(struct dwc3_of_simple *simple)
 	pm_runtime_set_suspended(simple->dev);
 }
 
-static int dwc3_of_simple_remove(struct platform_device *pdev)
+static void dwc3_of_simple_remove(struct platform_device *pdev)
 {
 	struct dwc3_of_simple	*simple = platform_get_drvdata(pdev);
 
 	__dwc3_of_simple_teardown(simple);
-
-	return 0;
 }
 
 static void dwc3_of_simple_shutdown(struct platform_device *pdev)
@@ -183,7 +181,7 @@ MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
 
 static struct platform_driver dwc3_of_simple_driver = {
 	.probe		= dwc3_of_simple_probe,
-	.remove		= dwc3_of_simple_remove,
+	.remove_new	= dwc3_of_simple_remove,
 	.shutdown	= dwc3_of_simple_shutdown,
 	.driver		= {
 		.name	= "dwc3-of-simple",
-- 
2.39.2

