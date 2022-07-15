Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6B8A575C6E
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jul 2022 09:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbiGOHdJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jul 2022 03:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiGOHdI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jul 2022 03:33:08 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB017BE15;
        Fri, 15 Jul 2022 00:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657870386; x=1689406386;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EtijF1TtJbE7eHGNasjw3sq90Rj8NAQWPgQrZ6WvuZY=;
  b=kNrls2tmHHZ0mJoqN8OC92v49U5civAk4fhZYvExMz29bt2yzo8CUrpo
   r4x4l2DJNaEl/ClDh4AXU+T1oeZEJZ2f5sDz0hqdpgAOjzxzzFxE1sgAW
   kXD4LJ8tgqasLJNv3JXZSLu8hXQ4bsV0mpHVmSXV03pU7A1lEKvFdMd6H
   60fGoZDIM5I0x7e+c0QyfoZZUco9OjhJALAcNbF6ndv92c+gGSkIZ3UBu
   nBFv6wqD+JUOlQG4oC2yVtae0MPtoVcRkGmGyrWym4YTuA6anZCXsvNHQ
   7bg/B/Dxwe8XL9wGQ/KcpOhkiPFPSyXCRzdjHlDUPH49aZCm8rlX91Sm7
   w==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25068550"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Jul 2022 09:33:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 15 Jul 2022 09:33:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 15 Jul 2022 09:33:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657870384; x=1689406384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EtijF1TtJbE7eHGNasjw3sq90Rj8NAQWPgQrZ6WvuZY=;
  b=G/xBnLTcckUPL0cuWDvjSdwgIH/CYNT7K9pt+3fkJIT24GvFh/TEw+oG
   14tvy/lDPw8JfhrisWqCBzVYsBb73lAXBWMUXs/d60i5vlLgXV1xQmFbH
   2ohIx57sGOzCm1n/DpSrMhQHhl7y/XZiQdp5x0Pb7GYdnKQZ9CzAbohGZ
   8UT8mGA54rqg+4GfvBAeRM0pIldPzzMTcdYJ2YByBE2Z3wts99nsVhr15
   3gtddVp25t/NI64xIrE46Z4BHvjAbiKrl8Tmbs8NagKA1iBVmtkaD7o04
   Yk5IRNZeSYCrmO9waIIOLgkeKBpVLmU8e9kOZBbVbrJiGz4WNWG+4BCxQ
   A==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25068548"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jul 2022 09:33:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A0ABF280072;
        Fri, 15 Jul 2022 09:33:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Date:   Fri, 15 Jul 2022 09:32:59 +0200
Message-Id: <20220715073300.868087-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715073300.868087-1-alexander.stein@ew.tq-group.com>
References: <20220715073300.868087-1-alexander.stein@ew.tq-group.com>
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
Changes in v2:
* Use device specific sleep times, if present
* Use fsleep instead of usleep_range

 drivers/usb/misc/onboard_usb_hub.c | 29 +++++++++++++++++++++++++++++
 drivers/usb/misc/onboard_usb_hub.h |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 6b9b949d17d3..1dd7f4767def 100644
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
+	const struct onboard_hub_devtype_data *devtype_data;
+	struct gpio_desc *reset_gpio;
 	bool always_powered_in_suspend;
 	bool is_powered_on;
 	bool going_away;
@@ -56,6 +59,11 @@ static int onboard_hub_power_on(struct onboard_hub *hub)
 		return err;
 	}
 
+	if (hub->devtype_data)
+		fsleep(hub->devtype_data->power_stable_time);
+	if (hub->reset_gpio)
+		gpiod_set_value_cansleep(hub->reset_gpio, 0);
+
 	hub->is_powered_on = true;
 
 	return 0;
@@ -65,6 +73,12 @@ static int onboard_hub_power_off(struct onboard_hub *hub)
 {
 	int err;
 
+	if (hub->reset_gpio) {
+		gpiod_set_value_cansleep(hub->reset_gpio, 1);
+		if (hub->devtype_data)
+			fsleep(hub->devtype_data->reset_duration);
+	}
+
 	err = regulator_disable(hub->vdd);
 	if (err) {
 		dev_err(hub->dev, "failed to disable regulator: %d\n", err);
@@ -219,6 +233,7 @@ static void onboard_hub_attach_usb_driver(struct work_struct *work)
 
 static int onboard_hub_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *of_id;
 	struct device *dev = &pdev->dev;
 	struct onboard_hub *hub;
 	int err;
@@ -227,10 +242,24 @@ static int onboard_hub_probe(struct platform_device *pdev)
 	if (!hub)
 		return -ENOMEM;
 
+	of_id = of_match_device(onboard_hub_match, &pdev->dev);
+	if (of_id)
+		hub->devtype_data = of_id->data;
+	else
+		return -ENODEV;
+
 	hub->vdd = devm_regulator_get(dev, "vdd");
 	if (IS_ERR(hub->vdd))
 		return PTR_ERR(hub->vdd);
 
+	hub->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(hub->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), "failed to get reset GPIO\n");
+
+	if (hub->devtype_data && hub->reset_gpio)
+		fsleep(hub->devtype_data->reset_duration);
+
 	hub->dev = dev;
 	mutex_init(&hub->lock);
 	INIT_LIST_HEAD(&hub->udev_list);
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index d3a5b6938582..7e743f4c8aaa 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -6,6 +6,11 @@
 #ifndef _USB_MISC_ONBOARD_USB_HUB_H
 #define _USB_MISC_ONBOARD_USB_HUB_H
 
+struct onboard_hub_devtype_data {
+	unsigned long power_stable_time;	/* power stabilization time in us */
+	unsigned long reset_duration;		/* reset pulse width in us */
+};
+
 static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usbbda,411" },
 	{ .compatible = "usbbda,5411" },
-- 
2.25.1

