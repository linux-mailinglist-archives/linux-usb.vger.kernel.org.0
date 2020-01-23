Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12779146BBF
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 15:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgAWOuQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jan 2020 09:50:16 -0500
Received: from mout-p-102.mailbox.org ([80.241.56.152]:16754 "EHLO
        mout-p-102.mailbox.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728057AbgAWOuP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jan 2020 09:50:15 -0500
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 Jan 2020 09:50:14 EST
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 483Q5N71VnzKmkB;
        Thu, 23 Jan 2020 15:44:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=loebl.cz; s=MBO0001;
        t=1579790647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=EpHcLPoiCqM0d3CDFpFonK4jTd+McfTp07xHXXe7/sQ=;
        b=n7JcRN+7DS6/eLdGImnc7jDg99YJuQgVYBu99WJ9EUGeZcEGuAYB+sxSTiu6mh/Is4SVZj
        0TnEbNQfotXLolvq6q5kbYxrx44xyxwEzVc6+YzIx7zCbTkV9YrIkUgDbJh/LQFcg9gKPt
        3AjnP/eZPHnzSbAhEKJofhnBScYZNvxMjWfjqrHavI+7p8/g794OWmf0c8m6hLSZ2It4qG
        O19xnYF0SPw61Bg/tjRoEQ3EfDMQp5a6l57TPyB34sqYtmPW6B4fbMS0OeynLd5NwrwSHC
        Ydvpf1usc+1z90ttm9nM5SLNIOAxR2p1JUZ/1FtQ2djkKnDriX1DHBSf4sQRIA==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id 6QpX4BrcjIKY; Thu, 23 Jan 2020 15:44:06 +0100 (CET)
From:   =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, m.szyprowski@samsung.com,
        =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH] usb: misc: usb3503: Use gpio descriptor interface
Date:   Thu, 23 Jan 2020 15:42:31 +0100
Message-Id: <20200123144231.284762-1-pavel@loebl.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Move gpio related code to descriptor-based interface. This makes
driver to respect active physical level as specified in DT. Existing
DT nodes are adjusted to reflect the former behaviour.

Signed-off-by: Pavel Löbl <pavel@loebl.cz>
---
 arch/arm/boot/dts/exynos5250-arndale.dts      |  4 +-
 .../boot/dts/sun8i-a83t-cubietruck-plus.dts   |  2 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     |  2 +-
 drivers/usb/misc/usb3503.c                    | 79 +++++++------------
 include/linux/platform_data/usb3503.h         |  6 +-
 5 files changed, 35 insertions(+), 58 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index d6c85efdb465..344e15a4c959 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -153,8 +153,8 @@ xxti {
 	usb_hub: usb-hub {
 		compatible = "smsc,usb3503a";
 
-		reset-gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
-		connect-gpios = <&gpd1 7 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpx3 5 GPIO_ACTIVE_HIGH>;
+		connect-gpios = <&gpd1 7 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
index d9be511f054f..fb928503ad45 100644
--- a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
@@ -101,7 +101,7 @@ usb-hub {
 		initial-mode = <1>; /* initialize in HUB mode */
 		disabled-ports = <1>;
 		intn-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
-		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+		reset-gpios = <&pio 4 16 GPIO_ACTIVE_HIGH>; /* PE16 */
 		connect-gpios = <&pio 4 17 GPIO_ACTIVE_HIGH>; /* PE17 */
 		refclk-frequency = <19200000>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index e12a36ce5d93..a1d3575edb39 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -498,7 +498,7 @@ wcnss@a21b000 {
 
 	usb2513 {
 		compatible = "smsc,usb3503";
-		reset-gpios = <&pm8916_gpios 3 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&pm8916_gpios 3 GPIO_ACTIVE_HIGH>;
 		initial-mode = <1>;
 	};
 
diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 72f39a9751b5..d9ffb2d5c318 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -47,19 +47,19 @@ struct usb3503 {
 	struct device		*dev;
 	struct clk		*clk;
 	u8	port_off_mask;
-	int	gpio_intn;
-	int	gpio_reset;
-	int	gpio_connect;
+	struct gpio_desc	*gpio_intn;
+	struct gpio_desc	*gpio_reset;
+	struct gpio_desc	*gpio_connect;
 	bool	secondary_ref_clk;
 };
 
 static int usb3503_reset(struct usb3503 *hub, int state)
 {
-	if (!state && gpio_is_valid(hub->gpio_connect))
-		gpio_set_value_cansleep(hub->gpio_connect, 0);
+	if (!state && hub->gpio_connect)
+		gpiod_set_value_cansleep(hub->gpio_connect, 0);
 
-	if (gpio_is_valid(hub->gpio_reset))
-		gpio_set_value_cansleep(hub->gpio_reset, state);
+	if (hub->gpio_reset)
+		gpiod_set_value_cansleep(hub->gpio_reset, state);
 
 	/* Wait T_HUBINIT == 4ms for hub logic to stabilize */
 	if (state)
@@ -115,8 +115,8 @@ static int usb3503_connect(struct usb3503 *hub)
 		}
 	}
 
-	if (gpio_is_valid(hub->gpio_connect))
-		gpio_set_value_cansleep(hub->gpio_connect, 1);
+	if (hub->gpio_connect)
+		gpiod_set_value_cansleep(hub->gpio_connect, 1);
 
 	hub->mode = USB3503_MODE_HUB;
 	dev_info(dev, "switched to HUB mode\n");
@@ -164,6 +164,7 @@ static int usb3503_probe(struct usb3503 *hub)
 	u32 mode = USB3503_MODE_HUB;
 	const u32 *property;
 	int len;
+	int intn_level;
 
 	if (pdata) {
 		hub->port_off_mask	= pdata->port_off_mask;
@@ -230,59 +231,35 @@ static int usb3503_probe(struct usb3503 *hub)
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
-		of_property_read_u32(np, "initial-mode", &mode);
-		hub->mode = mode;
-	}
-
-	if (hub->port_off_mask && !hub->regmap)
-		dev_err(dev, "Ports disabled with no control interface\n");
-
-	if (gpio_is_valid(hub->gpio_intn)) {
-		int val = hub->secondary_ref_clk ? GPIOF_OUT_INIT_LOW :
-						   GPIOF_OUT_INIT_HIGH;
-		err = devm_gpio_request_one(dev, hub->gpio_intn, val,
-					    "usb3503 intn");
+		intn_level = hub->secondary_ref_clk ? GPIOD_OUT_LOW : GPIOD_OUT_HIGH;
+		hub->gpio_intn	= devm_gpiod_get_optional(dev, "intn", intn_level);
+		err = PTR_ERR_OR_ZERO(hub->gpio_intn);
 		if (err) {
-			dev_err(dev,
-				"unable to request GPIO %d as interrupt pin (%d)\n",
-				hub->gpio_intn, err);
+			if (err != -EPROBE_DEFER)
+				dev_err(dev, "failed to get interrupt GPIO");
 			return err;
 		}
-	}
-
-	if (gpio_is_valid(hub->gpio_connect)) {
-		err = devm_gpio_request_one(dev, hub->gpio_connect,
-				GPIOF_OUT_INIT_LOW, "usb3503 connect");
+		hub->gpio_connect = devm_gpiod_get_optional(dev, "connect", GPIOD_OUT_LOW);
+		err = PTR_ERR_OR_ZERO(hub->gpio_connect);
 		if (err) {
-			dev_err(dev,
-				"unable to request GPIO %d as connect pin (%d)\n",
-				hub->gpio_connect, err);
+			if (err != -EPROBE_DEFER)
+				dev_err(dev, "failed to get GPIO for connect");
 			return err;
 		}
-	}
-
-	if (gpio_is_valid(hub->gpio_reset)) {
-		err = devm_gpio_request_one(dev, hub->gpio_reset,
-				GPIOF_OUT_INIT_LOW, "usb3503 reset");
-		/* Datasheet defines a hardware reset to be at least 100us */
-		usleep_range(100, 10000);
+		hub->gpio_reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+		err = PTR_ERR_OR_ZERO(hub->gpio_reset);
 		if (err) {
-			dev_err(dev,
-				"unable to request GPIO %d as reset pin (%d)\n",
-				hub->gpio_reset, err);
+			if (err != -EPROBE_DEFER)
+				dev_err(dev, "failed to get reset GPIO");
 			return err;
 		}
+		of_property_read_u32(np, "initial-mode", &mode);
+		hub->mode = mode;
 	}
 
+	if (hub->port_off_mask && !hub->regmap)
+		dev_err(dev, "Ports disabled with no control interface\n");
+
 	usb3503_switch_mode(hub, hub->mode);
 
 	dev_info(dev, "%s: probed in %s mode\n", __func__,
diff --git a/include/linux/platform_data/usb3503.h b/include/linux/platform_data/usb3503.h
index e049d51c1353..3e966a62277e 100644
--- a/include/linux/platform_data/usb3503.h
+++ b/include/linux/platform_data/usb3503.h
@@ -17,9 +17,9 @@ enum usb3503_mode {
 struct usb3503_platform_data {
 	enum usb3503_mode	initial_mode;
 	u8	port_off_mask;
-	int	gpio_intn;
-	int	gpio_connect;
-	int	gpio_reset;
+	struct gpio_desc	*gpio_intn;
+	struct gpio_desc	*gpio_connect;
+	struct gpio_desc	*gpio_reset;
 };
 
 #endif
-- 
2.24.1

