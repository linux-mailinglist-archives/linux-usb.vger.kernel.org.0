Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B2E571EA0
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 17:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbiGLPOX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 11:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbiGLPNu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 11:13:50 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC63D1393;
        Tue, 12 Jul 2022 08:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657638410; x=1689174410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OfgXpXXnxYkkdwb4bULIi/Pbx109DJwee81W/cf3QsM=;
  b=Maf5gXjPcn35A/9jvJKn2XzTDtwdW6Wlo+WOt8ObjYqYFhqpHWlKCJGe
   /wLhQpe54FVfcjpN+puM8xN21nQhzZkW6xqzkYw0dVyPryiUKQyWiniYC
   bldaEJ+vcQKVgoqB+Mw2j//894ScxVWeW3a02HeIhRc0S1Kt8+bkjBPvm
   /RVrCN1Kp28IixrDbxkLgXzVBJnc0+3v7CTJgeC1Wy+ted8waRKyZAf7T
   zS95DvSk84WZBRLvcfims6OKOexZIfDnJMUDJrJOosIb/CH/zjbPnIZHp
   7/d9/YeEBEIUO+Tbglnew6v74SiXghR6lo1qbiU1m04pksZpdShRER+OO
   g==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650924000"; 
   d="scan'208";a="25005746"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 12 Jul 2022 17:06:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 12 Jul 2022 17:06:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 12 Jul 2022 17:06:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657638407; x=1689174407;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OfgXpXXnxYkkdwb4bULIi/Pbx109DJwee81W/cf3QsM=;
  b=pZxY0k/GxPT9fzQAfFCsullpK6SF5cWRHKvR6cqycTBkoXt2CxrUkfKP
   dt7QilL6/Zflulc0E0Ir23Bh/Rq2XnoyP01/jRxpzU6YFlWG1ILhq1Vrj
   5ya14V7fuwA4a+TjRFmbnhDCDb3FHvnPCH2AX1X3FdFWOKKKS4ckZuJJY
   FLZhxosavLGGcxUlUQRkQ1ywo7lLYJ8cRbAREgCIeUXCOwQf3nglH379T
   DTLKkE6/jiv+XNA4Uk/Enwi48I5qVgMpH6PQU7gy81hPCmIwKKSCLLQfh
   9d2VWiC5VaBZw70fJYHhBCOZhzuvN+RuSdSjRmkn/Dejs0ZPictoyNtwn
   g==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650924000"; 
   d="scan'208";a="25005739"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Jul 2022 17:06:32 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 02425280072;
        Tue, 12 Jul 2022 17:06:31 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Date:   Tue, 12 Jul 2022 17:06:26 +0200
Message-Id: <20220712150627.1444761-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Despite default reset upon probe, release reset line after powering up
the hub and assert reset again before powering down.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
My current DT node on my TQMa8MPxL looks like this
```
&usb_dwc3_1 {
	dr_mode = "host";
	#address-cells = <1>;
	#size-cells = <0>;
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_usbhub>;
	status = "okay";

	hub_2_0: hub@1 {
		compatible = "usb451,8142";
		reg = <1>;
		peer-hub = <&hub_3_0>;
		reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
	};

	hub_3_0: hub@2 {
		compatible = "usb451,8140";
		reg = <2>;
		peer-hub = <&hub_2_0>;
		reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
	};
};
```
which I don't like much for 2 reasons:
* the pinctrl has to be put in a common top-node of USB hub node. The pinctrl
  can not be requested twice.
* Apparently there is no conflict on the reset-gpio only because just one device
  gets probed here:
> $ ls /sys/bus/platform/drivers/onboard-usb-hub/
> 38200000.usb:hub@1  bind  uevent  unbind

But this seems better than to use a common fixed-regulator referenced by both
hub nodes, which just is controlled by GPIO and does not supply any voltages.
Note: It might also be necessary to add bindings to specify ramp up times and/or
reset timeouts.

 drivers/usb/misc/onboard_usb_hub.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 6b9b949d17d3..348fb5270266 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -7,6 +7,7 @@
 
 #include <linux/device.h>
 #include <linux/export.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -38,6 +39,7 @@ struct usbdev_node {
 struct onboard_hub {
 	struct regulator *vdd;
 	struct device *dev;
+	struct gpio_desc *reset_gpio;
 	bool always_powered_in_suspend;
 	bool is_powered_on;
 	bool going_away;
@@ -56,6 +58,10 @@ static int onboard_hub_power_on(struct onboard_hub *hub)
 		return err;
 	}
 
+	/* Deassert reset */
+	usleep_range(3000, 3100);
+	gpiod_set_value_cansleep(hub->reset_gpio, 0);
+
 	hub->is_powered_on = true;
 
 	return 0;
@@ -65,6 +71,10 @@ static int onboard_hub_power_off(struct onboard_hub *hub)
 {
 	int err;
 
+	/* Assert reset */
+	gpiod_set_value_cansleep(hub->reset_gpio, 1);
+	usleep_range(4000, 5000);
+
 	err = regulator_disable(hub->vdd);
 	if (err) {
 		dev_err(hub->dev, "failed to disable regulator: %d\n", err);
@@ -231,6 +241,14 @@ static int onboard_hub_probe(struct platform_device *pdev)
 	if (IS_ERR(hub->vdd))
 		return PTR_ERR(hub->vdd);
 
+	/* Put the hub into reset, pull reset line low, and assure 4ms reset low timing. */
+	hub->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(hub->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), "failed to get reset GPIO\n");
+
+	usleep_range(4000, 5000);
+
 	hub->dev = dev;
 	mutex_init(&hub->lock);
 	INIT_LIST_HEAD(&hub->udev_list);
-- 
2.25.1

