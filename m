Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44BEB213F01
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 20:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgGCSAg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 14:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCSAg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 14:00:36 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398E9C061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 11:00:36 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q4so2226767lji.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 11:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tbO2ldHuRsGqvWzI09Mc6Y2vW9AGGHy5SX8r+bpR3WA=;
        b=JuDoBwv1Khb5PQqJJkg88XXI2Vc+ZY2IveG053Y4UA7mztNJ291KBIRmYvI5Jn47Xd
         ioFDDO34TwNmqok/yetGaeecKhzni5Y+UUy8mlzAff6YL3aAenp3QIpkRvgA1phDV19H
         kUZbLCjdlU7A7MEyT4WrE4C4vi2CVkU97cxITlAeyyzRlUls18620TP2d1ZlQFdaHDsk
         meta87qqZdIwMLJnkgDm2GTAFLKBdStXE2fJhyXrfSzQ/15FtIfb0wD0OuNv5Lul0jJ0
         89A/VB86cuHkEQnpALg4DyHOQxmE1TzgionZeqaeL5/z+VOW7tIvpV5vqArMhNTY+PB9
         RgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tbO2ldHuRsGqvWzI09Mc6Y2vW9AGGHy5SX8r+bpR3WA=;
        b=PDW+mKyEzSfbNs7n1ucg7oARVrWyUI8aPt3jmbgwcmYhZjVcgFO73NwpuI55ghxhsI
         1QaqADnEuP/qcpLttUSNbPKh4eXbz6qlZfQ7krU/6kfPBoOextsnSuDLvTeL8xKHbGQv
         z7RDdeuT5Ra5MvfTA29Arpzya0SNTnTdIsu33alXSlxfbM84qDuT9BjwC6JahuKxx6Fh
         3cTdeiQdTLQ5GyQdtGq35MKHcxVl912kek/AmWI61kVOlmsErzCsMMTM4nf11tsfsKAa
         wnoZd6k8qSapexMwJYSCpTTKHdU2MpoxGkhKhEAUKOHWIzVk11pK7loxfkQjMDLNclv1
         qH5A==
X-Gm-Message-State: AOAM531pnrbKn/vM/qPj+ldwC9ys7f4Pj5pW24w2jIwRmKO8eyt/92Bb
        bpERjdoTS1lRktFW86ThAIpmhesNiK9cTw==
X-Google-Smtp-Source: ABdhPJwvLGF07om0xFbtVPXECSN5Qu8dKrk5toAppkpm+E+QzqCSa1dERK1yMgSw9NCf7Jk2qBsECA==
X-Received: by 2002:a2e:3a15:: with SMTP id h21mr8580285lja.112.1593799234547;
        Fri, 03 Jul 2020 11:00:34 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id a23sm4900795lfb.10.2020.07.03.11.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 11:00:34 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH 2/2] usb: ohci-omap: Convert to use GPIO descriptors
Date:   Fri,  3 Jul 2020 19:57:01 +0200
Message-Id: <20200703175701.570446-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200703175701.570446-1-linus.walleij@linaro.org>
References: <20200703175701.570446-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The OMAP1 OHCI driver is using the legacy GPIO API to grab some
random GPIO lines. One is from the TPS65010 chip and used for
power, another one is for overcurrent and while the driver picks
this line it doesn't watch it at all.

Convert the driver and the OMAP1 OSK board file to pass these
two GPIOs as machine descrived GPIO descriptors.

Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/board-osk.c | 17 ++++++++
 drivers/usb/host/ohci-omap.c    | 75 ++++++++++++++++-----------------
 2 files changed, 53 insertions(+), 39 deletions(-)

diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index 4df15e693b6e..d5d139bbac34 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -26,6 +26,7 @@
  * 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
@@ -55,6 +56,9 @@
 
 #include "common.h"
 
+/* Name of the GPIO chip used by the OMAP for GPIOs 0..15 */
+#define OMAP_GPIO_LABEL		"gpio-0-15"
+
 /* At OMAP5912 OSK the Ethernet is directly connected to CS1 */
 #define OMAP_OSK_ETHR_START		0x04800300
 
@@ -240,7 +244,9 @@ static struct tps65010_board tps_board = {
 
 static struct i2c_board_info __initdata osk_i2c_board_info[] = {
 	{
+		/* This device will get the name "i2c-tps65010" */
 		I2C_BOARD_INFO("tps65010", 0x48),
+		.dev_name = "tps65010",
 		.platform_data	= &tps_board,
 
 	},
@@ -278,6 +284,16 @@ static void __init osk_init_cf(void)
 	irq_set_irq_type(gpio_to_irq(62), IRQ_TYPE_EDGE_FALLING);
 }
 
+static struct gpiod_lookup_table osk_usb_gpio_table = {
+	.dev_id = "ohci",
+	.table = {
+		/* Power GPIO on the I2C-attached TPS65010 */
+                GPIO_LOOKUP("i2c-tps65010", 1, "power", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP(OMAP_GPIO_LABEL, 9, "overcurrent",
+			    GPIO_ACTIVE_HIGH),
+	},
+};
+
 static struct omap_usb_config osk_usb_config __initdata = {
 	/* has usb host connector (A) ... for development it can also
 	 * be used, with a NONSTANDARD gender-bending cable/dongle, as
@@ -581,6 +597,7 @@ static void __init osk_init(void)
 	l |= (3 << 1);
 	omap_writel(l, USB_TRANSCEIVER_CTRL);
 
+	gpiod_add_lookup_table(&osk_usb_gpio_table);
 	omap1_usb_init(&osk_usb_config);
 
 	/* irq for tps65010 chip */
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index add2eac53a98..df44cc425036 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -18,7 +18,7 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
@@ -53,25 +53,11 @@
 
 #define DRIVER_DESC "OHCI OMAP driver"
 
-#ifdef CONFIG_TPS65010
-#include <linux/mfd/tps65010.h>
-#else
-
-#define LOW	0
-#define HIGH	1
-
-#define GPIO1	1
-
-static inline int tps65010_set_gpio_out_value(unsigned gpio, unsigned value)
-{
-	return 0;
-}
-
-#endif
-
 struct ohci_omap_priv {
 	struct clk *usb_host_ck;
 	struct clk *usb_dc_ck;
+	struct gpio_desc *power;
+	struct gpio_desc *overcurrent;
 };
 
 static const char hcd_name[] = "ohci-omap";
@@ -97,22 +83,22 @@ static void omap_ohci_clock_power(struct ohci_omap_priv *priv, int on)
  * Board specific gang-switched transceiver power on/off.
  * NOTE:  OSK supplies power from DC, not battery.
  */
-static int omap_ohci_transceiver_power(int on)
+static int omap_ohci_transceiver_power(struct ohci_omap_priv *priv, int on)
 {
 	if (on) {
 		if (machine_is_omap_innovator() && cpu_is_omap1510())
 			__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
 				| ((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
 			       INNOVATOR_FPGA_CAM_USB_CONTROL);
-		else if (machine_is_omap_osk())
-			tps65010_set_gpio_out_value(GPIO1, LOW);
+		else if (priv->power)
+			gpiod_set_value(priv->power, 0);
 	} else {
 		if (machine_is_omap_innovator() && cpu_is_omap1510())
 			__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
 				& ~((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
 			       INNOVATOR_FPGA_CAM_USB_CONTROL);
-		else if (machine_is_omap_osk())
-			tps65010_set_gpio_out_value(GPIO1, HIGH);
+		else if (priv->power)
+			gpiod_set_value(priv->power, 1);
 	}
 
 	return 0;
@@ -272,8 +258,6 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 
 			/* gpio9 for overcurrent detction */
 			omap_cfg_reg(W8_1610_GPIO9);
-			gpio_request(9, "OHCI overcurrent");
-			gpio_direction_input(9);
 
 			/* for paranoia's sake:  disable USB.PUEN */
 			omap_cfg_reg(W4_USB_HIGHZ);
@@ -287,7 +271,7 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 	}
 
 	/* FIXME hub_wq hub requests should manage power switching */
-	omap_ohci_transceiver_power(1);
+	omap_ohci_transceiver_power(priv, 1);
 
 	/* board init will have already handled HMC and mux setup.
 	 * any external transceiver should already be initialized
@@ -327,17 +311,32 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 
 	hcd = usb_create_hcd(&ohci_omap_hc_driver, &pdev->dev,
 			dev_name(&pdev->dev));
-	if (!hcd) {
-		retval = -ENOMEM;
-		goto err0;
-	}
+	if (!hcd)
+		return -ENOMEM;
+
 	hcd->rsrc_start = pdev->resource[0].start;
 	hcd->rsrc_len = pdev->resource[0].end - pdev->resource[0].start + 1;
 	priv = hcd_to_ohci_omap_priv(hcd);
 
+	/* Obtain two optional GPIO lines */
+	priv->power = devm_gpiod_get_optional(&pdev->dev, "power", GPIOD_ASIS);
+	if (IS_ERR(priv->power))
+		return PTR_ERR(priv->power);
+	if (priv->power)
+		gpiod_set_consumer_name(priv->power, "OHCI power");
+	priv->overcurrent = devm_gpiod_get_optional(&pdev->dev, "overcurrent",
+						    GPIOD_IN);
+	if (IS_ERR(priv->overcurrent))
+		return PTR_ERR(priv->overcurrent);
+	if (priv->overcurrent)
+		gpiod_set_consumer_name(priv->overcurrent, "OHCI overcurrent");
+
+
 	priv->usb_host_ck = clk_get(&pdev->dev, "usb_hhc_ck");
-	if (IS_ERR(priv->usb_host_ck))
-		return PTR_ERR(priv->usb_host_ck);
+	if (IS_ERR(priv->usb_host_ck)) {
+		retval = PTR_ERR(priv->usb_host_ck);
+		goto err0;
+	}
 
 	if (!cpu_is_omap15xx())
 		priv->usb_dc_ck = clk_get(&pdev->dev, "usb_dc_ck");
@@ -345,8 +344,8 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 		priv->usb_dc_ck = clk_get(&pdev->dev, "lb_ck");
 
 	if (IS_ERR(priv->usb_dc_ck)) {
-		clk_put(priv->usb_host_ck);
-		return PTR_ERR(priv->usb_dc_ck);
+		retval = PTR_ERR(priv->usb_dc_ck);
+		goto err1;
 	}
 
 	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
@@ -377,11 +376,11 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 	iounmap(hcd->regs);
 err2:
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
-err1:
-	usb_put_hcd(hcd);
-err0:
 	clk_put(priv->usb_dc_ck);
+err1:
 	clk_put(priv->usb_host_ck);
+err0:
+	usb_put_hcd(hcd);
 	return retval;
 }
 
@@ -409,13 +408,11 @@ static int ohci_hcd_omap_remove(struct platform_device *pdev)
 		(void) otg_set_host(hcd->usb_phy->otg, 0);
 		usb_put_phy(hcd->usb_phy);
 	}
-	if (machine_is_omap_osk())
-		gpio_free(9);
 	iounmap(hcd->regs);
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
-	usb_put_hcd(hcd);
 	clk_put(priv->usb_dc_ck);
 	clk_put(priv->usb_host_ck);
+	usb_put_hcd(hcd);
 	return 0;
 }
 
-- 
2.25.4

