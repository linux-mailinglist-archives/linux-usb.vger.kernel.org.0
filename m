Return-Path: <linux-usb+bounces-2503-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5E7E073A
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 18:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F8AB281F1B
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 17:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF56D1F616;
	Fri,  3 Nov 2023 17:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B7E1C6AE
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 17:14:55 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625BF13E
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 10:14:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyxkp-0000xK-5O; Fri, 03 Nov 2023 18:14:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyxko-006NEa-4G; Fri, 03 Nov 2023 18:14:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyxkn-00CTl5-RA; Fri, 03 Nov 2023 18:14:41 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] USB: usbip: vudc: Convert to platform remove callback returning void
Date: Fri,  3 Nov 2023 18:14:29 +0100
Message-ID: <20231103171428.3636570-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wb7HKG8qqxy4/8uF5ahW233jByJYDRq4CSWBwEWFblQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlRSp0dvVdQwjuF01NcAhUJJh/uMs9F4IUHTQ6p PCtylnC8WqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUUqdAAKCRCPgPtYfRL+ TrIkB/9Wou9M0JxplWJC7/iUocnUPLxRcLM9ckWZaUuSjhVlO9Mh9HxwSkyqvLpRtZ1jkTvlPdk 9g1yhg0INig/wJOvHijl0IQ8FiSBYlxb/HAbpo4ofEb3e/66t0Xp8S8hZj3deXwvp+QtBomaxgn Lnmd2nZWVJFy3CqgQrQlhJe3MVi77lQdZe1Y+4otUUXFqioJkTmOh5ISH6kPcMLCVzmpR3FnOiu 7QnsKfLSNbxFu1SrkHCgZGZOKVHtDv49uMxbL/EYqUc3pykut7UagyUcjncTSR/+gl1MiB/t6Vx SGb7BaJuoIccGKFaex+0uJWOeWmHdzsIVrYiJjfF/rdsHIWi
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

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/usbip/vudc.h      | 2 +-
 drivers/usb/usbip/vudc_dev.c  | 3 +--
 drivers/usb/usbip/vudc_main.c | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
index 1bd4bc005829..faf61c9c6a98 100644
--- a/drivers/usb/usbip/vudc.h
+++ b/drivers/usb/usbip/vudc.h
@@ -173,6 +173,6 @@ struct vudc_device *alloc_vudc_device(int devid);
 void put_vudc_device(struct vudc_device *udc_dev);
 
 int vudc_probe(struct platform_device *pdev);
-int vudc_remove(struct platform_device *pdev);
+void vudc_remove(struct platform_device *pdev);
 
 #endif /* __USBIP_VUDC_H */
diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index 44b04c54c086..f11535020e35 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -628,12 +628,11 @@ int vudc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-int vudc_remove(struct platform_device *pdev)
+void vudc_remove(struct platform_device *pdev)
 {
 	struct vudc *udc = platform_get_drvdata(pdev);
 
 	usb_del_gadget_udc(&udc->gadget);
 	cleanup_vudc_hw(udc);
 	kfree(udc);
-	return 0;
 }
diff --git a/drivers/usb/usbip/vudc_main.c b/drivers/usb/usbip/vudc_main.c
index 993e721cb840..8bee553e4894 100644
--- a/drivers/usb/usbip/vudc_main.c
+++ b/drivers/usb/usbip/vudc_main.c
@@ -19,7 +19,7 @@ MODULE_PARM_DESC(num, "number of emulated controllers");
 
 static struct platform_driver vudc_driver = {
 	.probe		= vudc_probe,
-	.remove		= vudc_remove,
+	.remove_new	= vudc_remove,
 	.driver		= {
 		.name	= GADGET_NAME,
 		.dev_groups = vudc_groups,

base-commit: e27090b1413ff236ca1aec26d6b022149115de2c
-- 
2.42.0


