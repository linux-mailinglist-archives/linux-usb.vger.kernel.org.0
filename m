Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91BC1707613
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 01:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjEQXDm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 19:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjEQXDV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 19:03:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA34B6EB3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 16:03:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAe-0008Re-Pb; Thu, 18 May 2023 01:03:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAd-000wty-Bz; Thu, 18 May 2023 01:02:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-005UaS-Dw; Thu, 18 May 2023 01:02:58 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 81/97] usb: xhci-histb: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:23 +0200
Message-Id: <20230517230239.187727-82-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1910; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=eZyDJVhxkrTcsnnyfDchhvK9mON+Q+WN1AbSH6Ne9+A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVzRzHfjo2UFiE9YzfaIlFAKoEsE1Dr/s5alB nDZn5BYpmCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc0QAKCRCPgPtYfRL+ TgZCB/0TK6aj7ABPtAbBwnsi66xfVmlFVmOkV56MTcuqcAPUZrGioR7/pFuBQlamhsE3oX+dY7/ VXKTCp057dF/ctp9EozwQtIDMbc90TKKjQkjTpX1nqq2quuUjkQZPo3zhoHOX4hH52yjxdcqNMI 2d/+IdPsfq5UI+z8XkEDmu1butgPtBtSuimkeyUzkQzHPSPKgQcDCfKowvVN+YUjxVXaY0rar9s x8Lmcx/FG7OoOs7oq/Ef7tQv0Or4bprFdyrGLG0Iy1AyfUnXrZvPNlT5fvsgLgHwXu7C5DU0U96 /FJUPhCiPQ0BSEFq4DWkq9lm66aC6a/OttycTxV0BnJhNNDn
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
 drivers/usb/host/xhci-histb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-histb.c b/drivers/usb/host/xhci-histb.c
index 08369857686e..9d953c91cb46 100644
--- a/drivers/usb/host/xhci-histb.c
+++ b/drivers/usb/host/xhci-histb.c
@@ -319,7 +319,7 @@ static int xhci_histb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int xhci_histb_remove(struct platform_device *dev)
+static void xhci_histb_remove(struct platform_device *dev)
 {
 	struct xhci_hcd_histb *histb = platform_get_drvdata(dev);
 	struct usb_hcd *hcd = histb->hcd;
@@ -339,8 +339,6 @@ static int xhci_histb_remove(struct platform_device *dev)
 	usb_put_hcd(hcd);
 	pm_runtime_put_sync(&dev->dev);
 	pm_runtime_disable(&dev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused xhci_histb_suspend(struct device *dev)
@@ -385,7 +383,7 @@ MODULE_DEVICE_TABLE(of, histb_xhci_of_match);
 
 static struct platform_driver histb_xhci_driver = {
 	.probe	= xhci_histb_probe,
-	.remove	= xhci_histb_remove,
+	.remove_new = xhci_histb_remove,
 	.driver	= {
 		.name = "xhci-histb",
 		.pm = DEV_PM_OPS,
-- 
2.39.2

