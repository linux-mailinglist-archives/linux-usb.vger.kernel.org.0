Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F34B07075F9
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjEQXDW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjEQXDF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F5A44A8
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-0007ze-Bj; Thu, 18 May 2023 01:02:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAT-000wq1-FB; Thu, 18 May 2023 01:02:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAS-005UXE-Bn; Thu, 18 May 2023 01:02:48 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Kalle Valo <kvalo@kernel.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 32/97] usb: gadget/m66592-udc: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:34 +0200
Message-Id: <20230517230239.187727-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0QqZY4n87DFusmRIBvszoMx55BZMxGrjEDjyWCIkUh8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwesj4SwMT4e9VlfrV2aG5yCKfXVcouX0gDn M5Lf3kD8f6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcHgAKCRCPgPtYfRL+ Tre6B/4qe1Vpx6WFzazCAJtIG6zAHC5pTtyg3JQsFKLk4JNRK1yxAtD245c/m0mDCW9EVPAU8Qn EilJiMBsyQEMgsrzU5qtrFo71aI2AeeaTGrLTQgpMAUjGvZhxzB3IXCY5GP0uNHEi1Bw+pRzwf+ QCH/Wi4FiTGMi3jFkE4tgBfM5nrqUhmSdYgFyKkMypVfFYRhFhAzQ3CD/tQLchJ7OyaR6o7L49f PnhscGlu7GXPDCIrx6gx37sS6uJZNAF+438BwxK90w/t/mKAQvSfDVtBU33Toen/G2fXiZ3jy3m kopMPB2sUOU/R0oKWGI9WvScuUUe0KMhNpuMdj2AsqWi4sQN
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
 drivers/usb/gadget/udc/m66592-udc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index 06e21cee431b..e05f45a4b56b 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1512,7 +1512,7 @@ static const struct usb_gadget_ops m66592_gadget_ops = {
 	.pullup			= m66592_pullup,
 };
 
-static int m66592_remove(struct platform_device *pdev)
+static void m66592_remove(struct platform_device *pdev)
 {
 	struct m66592		*m66592 = platform_get_drvdata(pdev);
 
@@ -1527,7 +1527,6 @@ static int m66592_remove(struct platform_device *pdev)
 		clk_put(m66592->clk);
 	}
 	kfree(m66592);
-	return 0;
 }
 
 static void nop_completion(struct usb_ep *ep, struct usb_request *r)
@@ -1688,7 +1687,7 @@ static int m66592_probe(struct platform_device *pdev)
 
 /*-------------------------------------------------------------------------*/
 static struct platform_driver m66592_driver = {
-	.remove =	m66592_remove,
+	.remove_new =	m66592_remove,
 	.driver		= {
 		.name =	udc_name,
 	},
-- 
2.39.2

