Return-Path: <linux-usb+bounces-3349-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5F97F9E7B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 12:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E173EB20D53
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 11:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C93199BF;
	Mon, 27 Nov 2023 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="a6FFS39b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B921BCA;
	Mon, 27 Nov 2023 03:24:00 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5231DC00A1;
	Mon, 27 Nov 2023 12:23:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1701084238; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=lIwxznIaQ/Q1UMhEJA7Uobh5avUf1uO3muzdBhAnjx8=;
	b=a6FFS39b2rc9P5CPQxqSCTBAyumOVqCsBGy6MNAnHSUWQaEwM/20G7JbBgBweeT5hPpnRt
	ZD957/9piH9yq1LbI9D9r1k99RH1c/3NUQnL7xEQg9SABvJ3tp+ZwF5F0kTFEEaNUJ1N+B
	CNXKOFHmZGDWMh4qs4gxzhYnVao8CDgysH80xhu1hNban7PZ179WdlmjU/QIPhhq36KifO
	ZQhNKkDId7ty3Muy14/c94b9Xl20DGzJ5iUzyNfCSvaRRc3Z/1Ys3zVBc7QfFaXW/FAZyd
	xcq4inQ7VcclNwxYODoofi/qe3iWi/YWhnH0uRTPd1QE5GQGQozyJkTc5cRjMQ==
From: Frieder Schrempf <frieder@fris.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Anand Moon <linux.amoon@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [RESEND PATCH v2 1/3] usb: misc: onboard_usb_hub: Print symbolic error names
Date: Mon, 27 Nov 2023 12:22:24 +0100
Message-ID: <20231127112234.109073-1-frieder@fris.de>
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


