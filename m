Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68A61707624
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjEQXD4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjEQXDx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF167281
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-0008TN-QY; Thu, 18 May 2023 01:03:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAd-000wu6-Kp; Thu, 18 May 2023 01:02:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-005UaW-Jk; Thu, 18 May 2023 01:02:58 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 82/97] usb: xhci-mtk: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:24 +0200
Message-Id: <20230517230239.187727-83-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IWOiTw+ADVbwJ5rlc3EcBNPlmG8kb/fjXta3x5EI4Rw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVzXNaMSHdEtEKzzkk7w5YQwFiIbWHuqlshQu nviguL8UOyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc1wAKCRCPgPtYfRL+ TnUqB/9BjFkMWnUO3mbVr1gawKFsFbBa5GW+4ZsmVAoidMHlv3ANo36hWRe07WCL+I9GnPCV3ps saEbyk+f28aVcnSXBOS6yCIMwcZJjGHJRvKKDebT402O+9ypyOfQdf2XbmmunPKXPgJ7Q/8IHFy uJUZmQbbJNMRqOvjdjtlvRuU3qKU+phMWrWdt3AawKBhhmQqmzeky7ekTODZ49sc1nAUkW+cGyv T4uqWotn9Yl1Qhy0seO1FT8pRKAdrozLK64FnCEJwONY4s3N/e2vlNi2L0wCeHC/IeDrjbYsoMa wGzu00nORwTWjj/GQCAFD7HulTf92L9YyxtRscoqCcLL9ExD
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
 drivers/usb/host/xhci-mtk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 90cf40d6d0c3..8d9a55b0281b 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -673,7 +673,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int xhci_mtk_remove(struct platform_device *pdev)
+static void xhci_mtk_remove(struct platform_device *pdev)
 {
 	struct xhci_hcd_mtk *mtk = platform_get_drvdata(pdev);
 	struct usb_hcd	*hcd = mtk->hcd;
@@ -703,8 +703,6 @@ static int xhci_mtk_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
-
-	return 0;
 }
 
 static int __maybe_unused xhci_mtk_suspend(struct device *dev)
@@ -824,7 +822,7 @@ MODULE_DEVICE_TABLE(of, mtk_xhci_of_match);
 
 static struct platform_driver mtk_xhci_driver = {
 	.probe	= xhci_mtk_probe,
-	.remove	= xhci_mtk_remove,
+	.remove_new = xhci_mtk_remove,
 	.driver	= {
 		.name = "xhci-mtk",
 		.pm = DEV_PM_OPS,
-- 
2.39.2

