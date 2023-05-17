Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3ACF7075E2
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjEQXDD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjEQXCz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:02:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2615270
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:02:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-0007jN-Ou; Thu, 18 May 2023 01:02:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAN-000wns-Pr; Thu, 18 May 2023 01:02:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAN-005UVW-3A; Thu, 18 May 2023 01:02:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/97] usb: chipidea/ci_hdrc_imx: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:07 +0200
Message-Id: <20230517230239.187727-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=sHvodwK19h3h+4n4dSSPzKTcWBvUom7aYEkaMtq7fKU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVvw4WmtONgsfRlsxH8HGIqVnOV6sdCvctBtG +a/kcdpT/OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb8AAKCRCPgPtYfRL+ TjJDCACMC+WnCN88yj5eRDzv94ZnxwM7GeuV37g+Hy9dk9UHKbBIFLWiKuIXyz6qg6CZj2Cwj2n a/f80Guc2tK8rwbWyJeSDWh79Ddi3QJzREae9H7bpRZyv00c10QKEnDxahB3nPXnb/YfQCo0sCt 9dm6yZ6Sh9rwpO4yaUjDsUYQAPnYDmMfVXxs+moe3FZX5WFfR+YAob32zD6g4mTw40F5zwTizgY 6jr1gYnavHhlE3g3qPQzjdOThxd6eZVerFHGO/nCaq6/5DAHbPmCxyB4cULMvUG3u0DhizgdonH fOTfra55Tpx1J1flU7EZQFj+H+vYcnN8kcreSHXQ3ROGLW4t
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
 drivers/usb/chipidea/ci_hdrc_imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 2855ac303001..9f0f4ec701c5 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -502,7 +502,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ci_hdrc_imx_remove(struct platform_device *pdev)
+static void ci_hdrc_imx_remove(struct platform_device *pdev)
 {
 	struct ci_hdrc_imx_data *data = platform_get_drvdata(pdev);
 
@@ -522,8 +522,6 @@ static int ci_hdrc_imx_remove(struct platform_device *pdev)
 		if (data->hsic_pad_regulator)
 			regulator_disable(data->hsic_pad_regulator);
 	}
-
-	return 0;
 }
 
 static void ci_hdrc_imx_shutdown(struct platform_device *pdev)
@@ -650,7 +648,7 @@ static const struct dev_pm_ops ci_hdrc_imx_pm_ops = {
 };
 static struct platform_driver ci_hdrc_imx_driver = {
 	.probe = ci_hdrc_imx_probe,
-	.remove = ci_hdrc_imx_remove,
+	.remove_new = ci_hdrc_imx_remove,
 	.shutdown = ci_hdrc_imx_shutdown,
 	.driver = {
 		.name = "imx_usb",
-- 
2.39.2

