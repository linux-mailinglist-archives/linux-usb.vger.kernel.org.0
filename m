Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1475158234A
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 11:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbiG0JiV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 05:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbiG0JiN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 05:38:13 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCABD481E5;
        Wed, 27 Jul 2022 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658914689; x=1690450689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W/S32JS7VkSC+0JdmPsjSlkef3ixWmUJsKcVIMRt3sM=;
  b=JH++dD1YWC5jPwIqOxu/K1JzKRpJfrk+/qc9WrOXBEnlaAFuA2dLGItm
   frseSy2oz0AgVWDp335uANzLw7gn7D8bIQ3njx6k6JxVgr5t89ktCu4qj
   qL5BoEqIFOtzxzfMSpNeazJqrcFZcosZBkqVPkgO2h72FxagNa881H6wC
   zr7m1MCO+pBKj0nyaTKLn4AT5wftbfgh/OcFEHxRsThg1Eqiju2EQYOww
   y95wvbvj+c6gyEXxfzrwdX194sGl6WCPy0SVAX4thBPTL7u7SgHHrB/gX
   Y9otd3T9yYNr7k5JCbGJtj+apm7QJdz6YymT3omhArRK1CYRoR6O9A2Ik
   A==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654552800"; 
   d="scan'208";a="25289991"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 27 Jul 2022 11:38:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 27 Jul 2022 11:38:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 27 Jul 2022 11:38:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658914685; x=1690450685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W/S32JS7VkSC+0JdmPsjSlkef3ixWmUJsKcVIMRt3sM=;
  b=a1G8eOogT3dRfCdtr7NMilZRXZePABecnRCIn7oHxKr+xMDt7StLQPAR
   cSMCghPoy6+QRXfAaT0c4D8GeSc1V3grHdbe74A4lvPY4DKyjKTp8ysxg
   ZOcbFf+oOZt7GXr2Es/+2wD25EgZKEHHJS3GoJgjwWPEkx3yOLi4X/O9J
   3oXVgRvhJ8OncLq+VKaMGlEkLgWSQx7oTx5DpUZo4tp3m6ovKO1dxYi/M
   mwuP2z2lL4yi3AeUvuK6uM1s8zGafvQHc+ZUuRYYuKzGZXUl2rd04XO4b
   x+lnXpoedLx4Eb53R39WTzHft7+hr5I/9kwazh2ygtS/62RUPGpVtQM8p
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654552800"; 
   d="scan'208";a="25289988"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 27 Jul 2022 11:38:05 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EEDBA280072;
        Wed, 27 Jul 2022 11:38:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Date:   Wed, 27 Jul 2022 11:38:00 +0200
Message-Id: <20220727093801.687361-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727093801.687361-1-alexander.stein@ew.tq-group.com>
References: <20220727093801.687361-1-alexander.stein@ew.tq-group.com>
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
Thanks Matthias for your review.

Changes in v3:
* Require platform data unconditionally
* Removed unecessary checks for that reason
* Merged power_stable_time into reset_duration (no difference for now)
* Rename 'reset_duration' to 'reset_us'
* Renamed platform structure to onboard_hub_pdata
* Renamed device struct field to pdata as well

Changes in v2:
* Use device specific sleep times, if present
* Use fsleep instead of usleep_range

 drivers/usb/misc/onboard_usb_hub.c | 28 ++++++++++++++++++++++++++++
 drivers/usb/misc/onboard_usb_hub.h | 16 ++++++++++++----
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 6b9b949d17d3..2aa1db528b31 100644
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
index d3a5b6938582..01d067db81f2 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -6,11 +6,19 @@
 #ifndef _USB_MISC_ONBOARD_USB_HUB_H
 #define _USB_MISC_ONBOARD_USB_HUB_H
 
+struct onboard_hub_pdata {
+	unsigned long reset_us;		/* reset pulse width in us */
+};
+
+static const struct onboard_hub_pdata realtek_rts5411_data = {
+	.reset_us = 0,
+};
+
 static const struct of_device_id onboard_hub_match[] = {
-	{ .compatible = "usbbda,411" },
-	{ .compatible = "usbbda,5411" },
-	{ .compatible = "usbbda,414" },
-	{ .compatible = "usbbda,5414" },
+	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
+	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
+	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
+	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
 	{}
 };
 
-- 
2.25.1

