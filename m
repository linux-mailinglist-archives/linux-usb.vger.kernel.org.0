Return-Path: <linux-usb+bounces-3344-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A4F7F9E50
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 12:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEAF2B20DDC
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 11:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4852719464;
	Mon, 27 Nov 2023 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="qa+lUfhG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.fris.de (unknown [IPv6:2a01:4f8:c2c:390b::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C5DB8;
	Mon, 27 Nov 2023 03:14:45 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82235BFC75;
	Mon, 27 Nov 2023 12:14:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1701083681; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=lIwxznIaQ/Q1UMhEJA7Uobh5avUf1uO3muzdBhAnjx8=;
	b=qa+lUfhGMubLGaou1/eMPZmlh3vVzmAHWKAXTggKTkoF0hCuFsSCXibUdO5L7U6zJneAjX
	hySObMmc3XVsDdC0qKJhfLx60Kq1A7Q5FdrZWHRpbeOEa6b6ZOzN1lWtNP+DXroo/qaSje
	xIv/YOruSKYOMTaUK4HY4pb0V5AFlN2JF/9NWp+RgtwGqXy90OfkILyQQm4lNqKpH83ypu
	6EVj9tchg43WPFkojxiG1Irwc53Tf2u9631wwLoyRWEsCTJJmN2ZaKoDkaj9plWLlY7obS
	wwyMtEuiQveZOH+Rs+qfebNhJXlUVy848MfL9nv4zedCRPNlu1g8BWIRCyARyQ==
From: Frieder Schrempf <frieder@fris.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Anand Moon <linux.amoon@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 1/3] usb: misc: onboard_usb_hub: Print symbolic error names
Date: Mon, 27 Nov 2023 12:13:22 +0100
Message-ID: <20231127111332.107640-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Instead of printing the decimal error codes, let's use the more
human-readable symbolic error names provided by the %pe printk
format specifier.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes in v2:
* new patch
---
 drivers/usb/misc/onboard_usb_hub.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index a341b2fbb7b44..077824beffa01 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -7,6 +7,7 @@
 
 #include <linux/device.h>
 #include <linux/export.h>
+#include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -68,7 +69,7 @@ static int onboard_hub_power_on(struct onboard_hub *hub)
 
 	err = regulator_bulk_enable(hub->pdata->num_supplies, hub->supplies);
 	if (err) {
-		dev_err(hub->dev, "failed to enable supplies: %d\n", err);
+		dev_err(hub->dev, "failed to enable supplies: %pe\n", ERR_PTR(err));
 		return err;
 	}
 
@@ -88,7 +89,7 @@ static int onboard_hub_power_off(struct onboard_hub *hub)
 
 	err = regulator_bulk_disable(hub->pdata->num_supplies, hub->supplies);
 	if (err) {
-		dev_err(hub->dev, "failed to disable supplies: %d\n", err);
+		dev_err(hub->dev, "failed to disable supplies: %pe\n", ERR_PTR(err));
 		return err;
 	}
 
@@ -235,7 +236,7 @@ static void onboard_hub_attach_usb_driver(struct work_struct *work)
 
 	err = driver_attach(&onboard_hub_usbdev_driver.drvwrap.driver);
 	if (err)
-		pr_err("Failed to attach USB driver: %d\n", err);
+		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
 }
 
 static int onboard_hub_probe(struct platform_device *pdev)
@@ -262,7 +263,7 @@ static int onboard_hub_probe(struct platform_device *pdev)
 
 	err = devm_regulator_bulk_get(dev, hub->pdata->num_supplies, hub->supplies);
 	if (err) {
-		dev_err(dev, "Failed to get regulator supplies: %d\n", err);
+		dev_err(dev, "Failed to get regulator supplies: %pe\n", ERR_PTR(err));
 		return err;
 	}
 
-- 
2.42.1


