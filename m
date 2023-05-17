Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 976307075CB
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjEQXCu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjEQXCt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0E84C02
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-0007jO-NA; Thu, 18 May 2023 01:02:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-000wny-1P; Thu, 18 May 2023 01:02:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAN-005UVa-96; Thu, 18 May 2023 01:02:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 06/97] usb: chipidea/ci_hdrc_msm: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:08 +0200
Message-Id: <20230517230239.187727-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=RORguVK6mnzE5lSxME4akuhf14yhjd2E0pj7rGc3qoc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVvxTm4DpzI6LCt/oGN1BqrW1r8W2NdgPSGcF WXHkRiH2Y+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb8QAKCRCPgPtYfRL+ TjthB/9BmQUqZ4aygaUbjlnsnWZ0iGUiU81V8bhweerxtmlR14UlKXoCWOFgYStNvQpVXIa++k9 wG8k4qS/fD4HjF0IEmAf6Fju65Tn9lGNw9k9kzYGPBiYEEW0I0WuwdYyGkEagWG2aw8hldcO1o1 dElcxuq9CD+rP61veYxIkYa+zQCLV/rUItoZEKmfRKCuNUZAuJQr5i3WOhSudtwp1dAMKn5WiRD bq/D/QJAoULTJMEfEvVOb3fFYGHZwrDRqXN3yzcj2XEA1HFN9RVOP+hoacZUffXqmjykRLKfY3l IGcfYjp2O1VZhV2Ii95WE61CWdGCth/dG89v76brkwxM7JtW
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
 drivers/usb/chipidea/ci_hdrc_msm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index 46105457e1ca..7b5b47ce8a02 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -274,7 +274,7 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ci_hdrc_msm_remove(struct platform_device *pdev)
+static void ci_hdrc_msm_remove(struct platform_device *pdev)
 {
 	struct ci_hdrc_msm *ci = platform_get_drvdata(pdev);
 
@@ -282,8 +282,6 @@ static int ci_hdrc_msm_remove(struct platform_device *pdev)
 	ci_hdrc_remove_device(ci->ci);
 	clk_disable_unprepare(ci->iface_clk);
 	clk_disable_unprepare(ci->core_clk);
-
-	return 0;
 }
 
 static const struct of_device_id msm_ci_dt_match[] = {
@@ -294,7 +292,7 @@ MODULE_DEVICE_TABLE(of, msm_ci_dt_match);
 
 static struct platform_driver ci_hdrc_msm_driver = {
 	.probe = ci_hdrc_msm_probe,
-	.remove = ci_hdrc_msm_remove,
+	.remove_new = ci_hdrc_msm_remove,
 	.driver = {
 		.name = "msm_hsusb",
 		.of_match_table = msm_ci_dt_match,
-- 
2.39.2

