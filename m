Return-Path: <linux-usb+bounces-3350-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A2B7F9E7D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 12:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B83AB20F0B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 11:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD78199CC;
	Mon, 27 Nov 2023 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="YzAC6mU7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.fris.de (unknown [IPv6:2a01:4f8:c2c:390b::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF95E1BE2;
	Mon, 27 Nov 2023 03:24:02 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EF12C00F5;
	Mon, 27 Nov 2023 12:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1701084240; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=TtObVw8YUfhzjUng8rafUVONqr/7XfXzj8lQVXj7nE0=;
	b=YzAC6mU7eSXCWNV/s6NbfpkGalIernf22FZMLR/7LYe2CApjm1wXlI1Yl95mOIpgrLtr8p
	FVrM8cVM1a8ecMDCML33ZKk9QsnHeaBE3WlBA5hTSmJS2To6XEO9l0J93QWbmFxmIznhpf
	w4NR0Kyh8T1vUZHCroZgjxKGYoJQe8Q3PXZQMLsWG/eYoBiruPKyFAGfpeD7W9y2kNzxDi
	mUacNXuUE3tjZ2+P9xMLyBAhqxiSK3aVAZF+qgTYCFlp4DwhgXau2lGOd0eR81TXaUt/dF
	N/8rNrDsPqotxPllIyl8Fj671fpDXn+M7MtR5a4UFqoZZbTjfca6sLtDQWKu8g==
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
Subject: [RESEND PATCH v2 2/3] usb: misc: onboard_usb_hub: Add support for clock input
Date: Mon, 27 Nov 2023 12:22:25 +0100
Message-ID: <20231127112234.109073-2-frieder@fris.de>
In-Reply-To: <20231127112234.109073-1-frieder@fris.de>
References: <20231127112234.109073-1-frieder@fris.de>
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
Changes in v2:
* use %pe to print symbolic error name
---
 drivers/usb/misc/onboard_usb_hub.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 077824beffa01..0d84b16deab50 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2022, Google LLC
  */
 
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/export.h>
 #include <linux/err.h>
@@ -61,12 +62,19 @@ struct onboard_hub {
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
+		dev_err(hub->dev, "failed to enable clock: %pe\n", ERR_PTR(err));
+		return err;
+	}
+
 	err = regulator_bulk_enable(hub->pdata->num_supplies, hub->supplies);
 	if (err) {
 		dev_err(hub->dev, "failed to enable supplies: %pe\n", ERR_PTR(err));
@@ -93,6 +101,8 @@ static int onboard_hub_power_off(struct onboard_hub *hub)
 		return err;
 	}
 
+	clk_disable_unprepare(hub->clk);
+
 	hub->is_powered_on = false;
 
 	return 0;
@@ -267,6 +277,10 @@ static int onboard_hub_probe(struct platform_device *pdev)
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


