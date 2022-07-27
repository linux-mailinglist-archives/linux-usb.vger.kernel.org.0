Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A219C582849
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 16:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233349AbiG0OL3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 10:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbiG0OL1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 10:11:27 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7724C1CFFA;
        Wed, 27 Jul 2022 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658931086; x=1690467086;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m7F1W/DE5iYKj7SLPTvR+wGTzZX2PO7RknXp3Vp7DKg=;
  b=T854otFbrQxb9LjpWff0Ig4PxfHHTge8fEFrGHQYfvkzM3BxTTESH+Zo
   Y+79kc0W0/W8qbAkfoPJzR2BlM3Qh+9e0nTEOTzb96OJgc/xWu36UxlLf
   pFm8dQ1qGcqbiExiTGeH4lUNcS85g4qN9nAWw9g0sCQ6V9i/D0GEt32xc
   VtRQBpG5zLp2zdagP9yIJ7t86jk1K9kjhaI0rSTSZAYoVGrzVFuHVbUMZ
   X54ZNU0pgwkOZT/TimhwVcJpN0nQjCNEErCh6tbA6EispyI2P7zaS+Shf
   32D/8p/Hrrnk9yrGGvK7LYgNTKl57i2DeqibcQ+q3fgiJ08Jm60XLTR1q
   w==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654552800"; 
   d="scan'208";a="25297897"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 27 Jul 2022 16:11:22 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 27 Jul 2022 16:11:22 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 27 Jul 2022 16:11:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658931082; x=1690467082;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m7F1W/DE5iYKj7SLPTvR+wGTzZX2PO7RknXp3Vp7DKg=;
  b=DHXP+7N4HorAZmR3lgFW/OspN3eRD4zcY6YyZeW02t9Q01oX7lupdZTp
   vN++hWwaCwNNgUt73aLh8mca4uxqa/eOrVSl5oBMC38lifxmGbmdjctUC
   KFIjcG7sY9iFuama0qyyA3rHiZUBuErF7WcDcIpBQRTQI1/wh6FsbGx/k
   Lk7EljBaNf+M6IpvqDCMdwyDBGCQqHK842MAejRmsnm3+F92KitsJwuNP
   iD+kD+vDuCeQPfr6vX7aatKbDOqi1cCdWAPxR/e1UTXM4VLxAbZES+iwE
   wu+n9F5DKj7Ju8QfRHwpoczonrNqefiJhw+SoErYYlGxl67Z0LWs0Gz40
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654552800"; 
   d="scan'208";a="25297895"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 27 Jul 2022 16:11:22 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E63D6280056;
        Wed, 27 Jul 2022 16:11:21 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 1/2] usb: misc: onboard_usb_hub: Add reset-gpio support
Date:   Wed, 27 Jul 2022 16:11:16 +0200
Message-Id: <20220727141117.909361-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Despite default reset upon probe, release reset line after powering up
the hub and assert reset again before powering down.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
* Patch 1 dropped as it already applied

Changes in v4:
* Rebased to [1] commit e0c6b1f3d757 ("USB: usbsevseg: convert sysfs snprintf to sysfs_emit")
* Added platform data for usb424
  Reset pulse length taken from [2], Table 3-2 Symbol RESET_N
  Completely untested

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git Branch usb-testing
[2] http://ww1.microchip.com/downloads/en/devicedoc/00001692c.pdf

 drivers/usb/misc/onboard_usb_hub.c | 28 ++++++++++++++++++++++++++++
 drivers/usb/misc/onboard_usb_hub.h | 22 +++++++++++++++++-----
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index de3627af3c84..0c81417dd9a7 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -7,6 +7,7 @@
 
 #include <linux/device.h>
 #include <linux/export.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -38,6 +39,8 @@ struct usbdev_node {
 struct onboard_hub {
 	struct regulator *vdd;
 	struct device *dev;
+	const struct onboard_hub_pdata *pdata;
+	struct gpio_desc *reset_gpio;
 	bool always_powered_in_suspend;
 	bool is_powered_on;
 	bool going_away;
@@ -56,6 +59,9 @@ static int onboard_hub_power_on(struct onboard_hub *hub)
 		return err;
 	}
 
+	fsleep(hub->pdata->reset_us);
+	gpiod_set_value_cansleep(hub->reset_gpio, 0);
+
 	hub->is_powered_on = true;
 
 	return 0;
@@ -65,6 +71,11 @@ static int onboard_hub_power_off(struct onboard_hub *hub)
 {
 	int err;
 
+	if (hub->reset_gpio) {
+		gpiod_set_value_cansleep(hub->reset_gpio, 1);
+		fsleep(hub->pdata->reset_us);
+	}
+
 	err = regulator_disable(hub->vdd);
 	if (err) {
 		dev_err(hub->dev, "failed to disable regulator: %d\n", err);
@@ -219,6 +230,7 @@ static void onboard_hub_attach_usb_driver(struct work_struct *work)
 
 static int onboard_hub_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *of_id;
 	struct device *dev = &pdev->dev;
 	struct onboard_hub *hub;
 	int err;
@@ -227,10 +239,26 @@ static int onboard_hub_probe(struct platform_device *pdev)
 	if (!hub)
 		return -ENOMEM;
 
+	of_id = of_match_device(onboard_hub_match, &pdev->dev);
+	if (!of_id)
+		return -ENODEV;
+
+	hub->pdata = of_id->data;
+	if (!hub->pdata)
+		return -EINVAL;
+
 	hub->vdd = devm_regulator_get(dev, "vdd");
 	if (IS_ERR(hub->vdd))
 		return PTR_ERR(hub->vdd);
 
+	hub->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(hub->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), "failed to get reset GPIO\n");
+
+	if (hub->reset_gpio)
+		fsleep(hub->pdata->reset_us);
+
 	hub->dev = dev;
 	mutex_init(&hub->lock);
 	INIT_LIST_HEAD(&hub->udev_list);
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index 3820669eb98c..562fa48fcf10 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -6,12 +6,24 @@
 #ifndef _USB_MISC_ONBOARD_USB_HUB_H
 #define _USB_MISC_ONBOARD_USB_HUB_H
 
+struct onboard_hub_pdata {
+	unsigned long reset_us;		/* reset pulse width in us */
+};
+
+static const struct onboard_hub_pdata microchip_usb424_data = {
+	.reset_us = 1,
+};
+
+static const struct onboard_hub_pdata realtek_rts5411_data = {
+	.reset_us = 0,
+};
+
 static const struct of_device_id onboard_hub_match[] = {
-	{ .compatible = "usb424,2514" },
-	{ .compatible = "usbbda,411" },
-	{ .compatible = "usbbda,5411" },
-	{ .compatible = "usbbda,414" },
-	{ .compatible = "usbbda,5414" },
+	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
+	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
+	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
+	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
+	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
 	{}
 };
 
-- 
2.25.1

