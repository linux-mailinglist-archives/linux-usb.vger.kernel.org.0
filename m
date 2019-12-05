Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A58611431F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 15:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbfLEO4j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 09:56:39 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41980 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729187AbfLEO4j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 09:56:39 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so2703601lfp.8
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2019 06:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s7lJKp8V/0X9lAvhTddZQVaN+3G+ix+QQhM/9ih6VGA=;
        b=GJejUrg8tFlA5Ut0p9a8bMzRu++iJuFtD1goVst24m6EyKR78ezla4MgAuW33V4YZd
         V0jupjSQtxmERrC3DxdDBxOZBytz1W9bpRiWqkZGatOgEGuVxErPwp0OeHht5zUnent6
         2nj3GRyYGlBdvtozA3xWzxr6aR+FKvAPLdWM5iUAlqSgMyuOEPW4Cc04i+mgYCEOJ6+T
         0vcuv/kHXa50cokeApnga+VDpfs1YgFIDq4DOm5aY/YnEiyMB1krgjLLHYhgQsVbSFwP
         n5sL36V+I445YZu1nUV3Ez7jy19VtjBZRr6AfWWt0zYcN/VF1Kz+KUqcGSpKApTofYfq
         qXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s7lJKp8V/0X9lAvhTddZQVaN+3G+ix+QQhM/9ih6VGA=;
        b=LveQrYAropzKdngvD5YXBx5HVrI2rQ4yf8FRd1tyX0za6QhH8pS/d3ixJAhvhOs8wJ
         4SmjfY2VGy9dZlJt78R439GbAHXSMI+qtn4262e+fAvzijPrZynq5rh6xLbMfYz3704f
         NA4pN3Lgo5qe8E+TVUAUkqT3nr5orjxzz6uoFi+27VIxEmWQnkVRMN5sUa7mF4UAURcP
         i5qFo0blO9+WEzjQKbYxzeuRUXM4gR/AaFAivvkwGjAwTil/qXPDxT2NrvEejTDXF9PD
         tc0iB/1y//pqMyxq2MNkPPpdmCEx+57m2uX/cWKWxoUk2qK2no0+HNwmabLPgiu/lddL
         hGig==
X-Gm-Message-State: APjAAAXI1qw27VUWRBLrLjuPos32uhppTqRtkdGGEFogfClWJkES79GC
        sBR0Dhfm4OETCb3G/ht/uzNRIQ==
X-Google-Smtp-Source: APXvYqymrjS/NNnR1tdy05mq8Vesr0hMo9mFm3ahAKXWxg7hDTNe5bBh5YUTszIZNv9trMjGnt2nkQ==
X-Received: by 2002:a19:ec14:: with SMTP id b20mr1468063lfa.63.1575557796685;
        Thu, 05 Dec 2019 06:56:36 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id f11sm5833131lfa.9.2019.12.05.06.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 06:56:35 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] usb: usb3503: Convert to use GPIO descriptors
Date:   Thu,  5 Dec 2019 15:56:33 +0100
Message-Id: <20191205145633.187511-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This converts the USB3503 to pick GPIO descriptors from the
device tree instead of iteratively picking out GPIO number
references and then referencing these from the global GPIO
numberspace.

The USB3503 is only used from device tree among the in-tree
platforms. If board files would still desire to use it they can
provide machine descriptor tables.

Make sure to preserve semantics such as the reset delay
introduced by Stefan.

Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/misc/usb3503.c            | 94 ++++++++++-----------------
 include/linux/platform_data/usb3503.h |  3 -
 2 files changed, 35 insertions(+), 62 deletions(-)

diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 72f39a9751b5..c3c1f65f4196 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -7,11 +7,10 @@
 
 #include <linux/clk.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/usb3503.h>
 #include <linux/regmap.h>
@@ -47,19 +46,19 @@ struct usb3503 {
 	struct device		*dev;
 	struct clk		*clk;
 	u8	port_off_mask;
-	int	gpio_intn;
-	int	gpio_reset;
-	int	gpio_connect;
+	struct gpio_desc	*intn;
+	struct gpio_desc 	*reset;
+	struct gpio_desc 	*connect;
 	bool	secondary_ref_clk;
 };
 
 static int usb3503_reset(struct usb3503 *hub, int state)
 {
-	if (!state && gpio_is_valid(hub->gpio_connect))
-		gpio_set_value_cansleep(hub->gpio_connect, 0);
+	if (!state && hub->connect)
+		gpiod_set_value_cansleep(hub->connect, 0);
 
-	if (gpio_is_valid(hub->gpio_reset))
-		gpio_set_value_cansleep(hub->gpio_reset, state);
+	if (hub->reset)
+		gpiod_set_value_cansleep(hub->reset, state);
 
 	/* Wait T_HUBINIT == 4ms for hub logic to stabilize */
 	if (state)
@@ -115,8 +114,8 @@ static int usb3503_connect(struct usb3503 *hub)
 		}
 	}
 
-	if (gpio_is_valid(hub->gpio_connect))
-		gpio_set_value_cansleep(hub->gpio_connect, 1);
+	if (hub->connect)
+		gpiod_set_value_cansleep(hub->connect, 1);
 
 	hub->mode = USB3503_MODE_HUB;
 	dev_info(dev, "switched to HUB mode\n");
@@ -163,13 +162,11 @@ static int usb3503_probe(struct usb3503 *hub)
 	int err;
 	u32 mode = USB3503_MODE_HUB;
 	const u32 *property;
+	enum gpiod_flags flags;
 	int len;
 
 	if (pdata) {
 		hub->port_off_mask	= pdata->port_off_mask;
-		hub->gpio_intn		= pdata->gpio_intn;
-		hub->gpio_connect	= pdata->gpio_connect;
-		hub->gpio_reset		= pdata->gpio_reset;
 		hub->mode		= pdata->initial_mode;
 	} else if (np) {
 		u32 rate = 0;
@@ -230,59 +227,38 @@ static int usb3503_probe(struct usb3503 *hub)
 			}
 		}
 
-		hub->gpio_intn	= of_get_named_gpio(np, "intn-gpios", 0);
-		if (hub->gpio_intn == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		hub->gpio_connect = of_get_named_gpio(np, "connect-gpios", 0);
-		if (hub->gpio_connect == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		hub->gpio_reset = of_get_named_gpio(np, "reset-gpios", 0);
-		if (hub->gpio_reset == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
 		of_property_read_u32(np, "initial-mode", &mode);
 		hub->mode = mode;
 	}
 
-	if (hub->port_off_mask && !hub->regmap)
-		dev_err(dev, "Ports disabled with no control interface\n");
-
-	if (gpio_is_valid(hub->gpio_intn)) {
-		int val = hub->secondary_ref_clk ? GPIOF_OUT_INIT_LOW :
-						   GPIOF_OUT_INIT_HIGH;
-		err = devm_gpio_request_one(dev, hub->gpio_intn, val,
-					    "usb3503 intn");
-		if (err) {
-			dev_err(dev,
-				"unable to request GPIO %d as interrupt pin (%d)\n",
-				hub->gpio_intn, err);
-			return err;
-		}
-	}
-
-	if (gpio_is_valid(hub->gpio_connect)) {
-		err = devm_gpio_request_one(dev, hub->gpio_connect,
-				GPIOF_OUT_INIT_LOW, "usb3503 connect");
-		if (err) {
-			dev_err(dev,
-				"unable to request GPIO %d as connect pin (%d)\n",
-				hub->gpio_connect, err);
-			return err;
-		}
-	}
-
-	if (gpio_is_valid(hub->gpio_reset)) {
-		err = devm_gpio_request_one(dev, hub->gpio_reset,
-				GPIOF_OUT_INIT_LOW, "usb3503 reset");
+	if (hub->secondary_ref_clk)
+		flags = GPIOD_OUT_LOW;
+	else
+		flags = GPIOD_OUT_HIGH;
+	hub->intn = devm_gpiod_get_optional(dev, "intn", flags);
+	if (IS_ERR(hub->intn))
+		return PTR_ERR(hub->intn);
+	if (hub->intn)
+		gpiod_set_consumer_name(hub->intn, "usb3503 intn");
+
+	hub->connect = devm_gpiod_get_optional(dev, "connect", GPIOD_OUT_LOW);
+	if (IS_ERR(hub->connect))
+		return PTR_ERR(hub->connect);
+	if (hub->connect)
+		gpiod_set_consumer_name(hub->connect, "usb3503 connect");
+
+	hub->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(hub->reset))
+		return PTR_ERR(hub->reset);
+	if (hub->reset) {
 		/* Datasheet defines a hardware reset to be at least 100us */
 		usleep_range(100, 10000);
-		if (err) {
-			dev_err(dev,
-				"unable to request GPIO %d as reset pin (%d)\n",
-				hub->gpio_reset, err);
-			return err;
-		}
+		gpiod_set_consumer_name(hub->reset, "usb3503 reset");
 	}
 
+	if (hub->port_off_mask && !hub->regmap)
+		dev_err(dev, "Ports disabled with no control interface\n");
+
 	usb3503_switch_mode(hub, hub->mode);
 
 	dev_info(dev, "%s: probed in %s mode\n", __func__,
diff --git a/include/linux/platform_data/usb3503.h b/include/linux/platform_data/usb3503.h
index e049d51c1353..d01ef97ddf36 100644
--- a/include/linux/platform_data/usb3503.h
+++ b/include/linux/platform_data/usb3503.h
@@ -17,9 +17,6 @@ enum usb3503_mode {
 struct usb3503_platform_data {
 	enum usb3503_mode	initial_mode;
 	u8	port_off_mask;
-	int	gpio_intn;
-	int	gpio_connect;
-	int	gpio_reset;
 };
 
 #endif
-- 
2.23.0

