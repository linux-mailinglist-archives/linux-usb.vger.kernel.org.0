Return-Path: <linux-usb+bounces-3049-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1A17F1FD8
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 23:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 285C1B21B2B
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 22:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7338439863;
	Mon, 20 Nov 2023 21:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B59D2
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 13:59:54 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ5-0003rr-5i; Mon, 20 Nov 2023 22:59:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ4-00ARFL-AN; Mon, 20 Nov 2023 22:59:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ4-004fDD-1K; Mon, 20 Nov 2023 22:59:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 5/5] usb: gadget: pxa25x_udc: Convert to platform remove callback returning void
Date: Mon, 20 Nov 2023 22:58:36 +0100
Message-ID: <20231120215830.71071-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231120215830.71071-1-u.kleine-koenig@pengutronix.de>
References: <20231120215830.71071-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ogZo9r07S2IqZjbF99sFoydnhxg6c4XaTH9AnS4DFrU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlW9aLuec/NEu6mslnSQcR+/A2cAlAWA6khhOyy fQoojD3cxCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVvWiwAKCRCPgPtYfRL+ TuiNB/9TCYqYW7N8LnUAV51Opma7TR7tSD6SwEMn9qEUG/uog4pPGgEF1CCsw8FVBf5jckY6HH3 /49oVYsZyvrlEJK28iG5VzrduMUNsiIg7gulI3ZetMtPJ+AUZHJ3CRKhXeivVjRkHZ0nrUnO+Oq 6ROrmAu8piQGNSNEz6Em3KfM1fVMQhqy3m7mR1b45N6lHQMQB0XnwD4MfWTrLiH00CE9tdpK5U/ 1oR5a3HQihdIWXMSPodlUfJD1iahvzw8mEhWmgtojKLq8rAnz1YYwM+k9ooVXua4ENJ4a+8DzWH rtEmNR59aKrRZWwhKiaXj26zvAQzzOdu2n7Hp7VN2fb//H1U
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

In the error path emit an error message replacing the (less useful)
message by the core. Apart from the improved error message there is no
change in behaviour.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/gadget/udc/pxa25x_udc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index df0551ecc810..1ac26cb49ecf 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -2397,12 +2397,15 @@ static void pxa25x_udc_shutdown(struct platform_device *_dev)
 	pullup_off();
 }
 
-static int pxa25x_udc_remove(struct platform_device *pdev)
+static void pxa25x_udc_remove(struct platform_device *pdev)
 {
 	struct pxa25x_udc *dev = platform_get_drvdata(pdev);
 
-	if (dev->driver)
-		return -EBUSY;
+	if (dev->driver) {
+		dev_err(&pdev->dev,
+			"Driver still in use but removing anyhow\n");
+		return;
+	}
 
 	usb_del_gadget_udc(&dev->gadget);
 	dev->pullup = 0;
@@ -2414,7 +2417,6 @@ static int pxa25x_udc_remove(struct platform_device *pdev)
 		dev->transceiver = NULL;
 
 	the_controller = NULL;
-	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
@@ -2472,7 +2474,7 @@ static int pxa25x_udc_resume(struct platform_device *dev)
 static struct platform_driver udc_driver = {
 	.shutdown	= pxa25x_udc_shutdown,
 	.probe		= pxa25x_udc_probe,
-	.remove		= pxa25x_udc_remove,
+	.remove_new	= pxa25x_udc_remove,
 	.suspend	= pxa25x_udc_suspend,
 	.resume		= pxa25x_udc_resume,
 	.driver		= {
-- 
2.42.0


