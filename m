Return-Path: <linux-usb+bounces-3048-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2737F1FD6
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 23:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8638E28237F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 22:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FDE3985F;
	Mon, 20 Nov 2023 21:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A06CA
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 13:59:52 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ4-0003rn-MK; Mon, 20 Nov 2023 22:59:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ4-00ARFH-44; Mon, 20 Nov 2023 22:59:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ3-004fD9-R5; Mon, 20 Nov 2023 22:59:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 4/5] usb: gadget: lpc32xx_udc: Convert to platform remove callback returning void
Date: Mon, 20 Nov 2023 22:58:35 +0100
Message-ID: <20231120215830.71071-5-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2232; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3SdjmLgJICEsEXALoysm7lgD+64vKlenp6vBy0cQ/YM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlW9aKvUuMMkSuuNYETCdGXHvGW0WMp9Dp/+V+L ZU+ymHaxd6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVvWigAKCRCPgPtYfRL+ TlqFCACmYfAoAs1ZHUMoYiXnlbRZ4zHiUYFI47y9B57KYSvplbC8Dblpx8fd3UgYbRNYdTthzwN klpn2YrDuREVOxW89kG2cCkU161QccqvbLMVgxytwq9kY4jG+Rw2Kwvuc1ogbZHwzG5mxmtGkOA OVNKMY/FQW6UT2f710g2G5dkb/VLbFyDOP96IhhSs78kQ6V+mxMgdc4VYmgt1sbnEKh3PRsEdxM ReZPkmC4ojy97FTbsoPeWnjWB41rN4mTHRcF/IYnS7buBTPFY3r5/ZOUTph0el7XFaLy+b2E4sk raRH83XItLJEMe64G6fcczYWBBXlWIiUatl30tI93POxsMZS
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
 drivers/usb/gadget/udc/lpc32xx_udc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index a917cc9a32ab..d5f29f8fe481 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3174,13 +3174,16 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	return retval;
 }
 
-static int lpc32xx_udc_remove(struct platform_device *pdev)
+static void lpc32xx_udc_remove(struct platform_device *pdev)
 {
 	struct lpc32xx_udc *udc = platform_get_drvdata(pdev);
 
 	usb_del_gadget_udc(&udc->gadget);
-	if (udc->driver)
-		return -EBUSY;
+	if (udc->driver) {
+		dev_err(&pdev->dev,
+			"Driver still in use but removing anyhow\n");
+		return;
+	}
 
 	udc_clk_set(udc, 1);
 	udc_disable(udc);
@@ -3194,8 +3197,6 @@ static int lpc32xx_udc_remove(struct platform_device *pdev)
 			  udc->udca_v_base, udc->udca_p_base);
 
 	clk_disable_unprepare(udc->usb_slv_clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -3255,7 +3256,7 @@ MODULE_DEVICE_TABLE(of, lpc32xx_udc_of_match);
 
 static struct platform_driver lpc32xx_udc_driver = {
 	.probe		= lpc32xx_udc_probe,
-	.remove		= lpc32xx_udc_remove,
+	.remove_new	= lpc32xx_udc_remove,
 	.shutdown	= lpc32xx_udc_shutdown,
 	.suspend	= lpc32xx_udc_suspend,
 	.resume		= lpc32xx_udc_resume,
-- 
2.42.0


