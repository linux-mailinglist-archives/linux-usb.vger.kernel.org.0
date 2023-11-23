Return-Path: <linux-usb+bounces-3254-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC35C7F60E1
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 14:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 929C5281FA6
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 13:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE9A2E83A;
	Thu, 23 Nov 2023 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="N8Dg/nEY"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 351 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Nov 2023 05:53:37 PST
Received: from mail.fris.de (unknown [IPv6:2a01:4f8:c2c:390b::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22B1B9
	for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 05:53:37 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54028BFC26;
	Thu, 23 Nov 2023 14:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1700747259; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=P+qJkp9/x0LF6AlZcKBVhLb5rg5xcRwmC1heMFnS1dA=;
	b=N8Dg/nEYgbKV1lxtWHHDD4991rt98n2eXNnl2jtHjw39cN+6imtMRTEbxsWR8oxQkgwfNl
	MUDWm+qqaXJ+SYIl2SvdJ5nL13uAQTjDicZzI1X+gFQIwN05SJMipPTE7tpYdA0UFxPevh
	z0vC9g2v6+BcApw3ZxYZPohpyWbjea4lj6Phoe5btvVmQ9vKhoYGbfSPCeCnJY9dvLXKw0
	EBvdpkD1zZne/P8F1othz9D13GEzX6Ysok6lnMOyxAyMySv2lgHlDrnHyIYVB48EtAStCm
	wWwU+SH1O/lVsdvHc41lKjRYpWV7Lz4CYAVR8Mi6x/P+GuUtADMPf4S8nxy/kA==
From: Frieder Schrempf <frieder@fris.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Anand Moon <linux.amoon@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 1/2] usb: misc: onboard_usb_hub: Add support for clock input
Date: Thu, 23 Nov 2023 14:47:20 +0100
Message-ID: <20231123134728.709533-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Most onboard USB hubs have a dedicated crystal oscillator but on some
boards the clock signal for the hub is provided by the SoC.

In order to support this, we add the possibility of specifying a
clock in the devicetree that gets enabled/disabled when the hub
is powered up/down.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/usb/misc/onboard_usb_hub.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index a341b2fbb7b44..e710e3c82ba9b 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2022, Google LLC
  */
 
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
@@ -60,12 +61,19 @@ struct onboard_hub {
 	bool going_away;
 	struct list_head udev_list;
 	struct mutex lock;
+	struct clk *clk;
 };
 
 static int onboard_hub_power_on(struct onboard_hub *hub)
 {
 	int err;
 
+	err = clk_prepare_enable(hub->clk);
+	if (err) {
+		dev_err(hub->dev, "failed to enable clock: %d\n", err);
+		return err;
+	}
+
 	err = regulator_bulk_enable(hub->pdata->num_supplies, hub->supplies);
 	if (err) {
 		dev_err(hub->dev, "failed to enable supplies: %d\n", err);
@@ -92,6 +100,8 @@ static int onboard_hub_power_off(struct onboard_hub *hub)
 		return err;
 	}
 
+	clk_disable_unprepare(hub->clk);
+
 	hub->is_powered_on = false;
 
 	return 0;
@@ -266,6 +276,10 @@ static int onboard_hub_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	hub->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(hub->clk))
+		return dev_err_probe(dev, PTR_ERR(hub->clk), "failed to get clock\n");
+
 	hub->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(hub->reset_gpio))
-- 
2.42.1


