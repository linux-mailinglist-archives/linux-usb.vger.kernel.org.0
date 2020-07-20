Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746C222615F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 15:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgGTNzi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 09:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgGTNzh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jul 2020 09:55:37 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC83C061794
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 06:55:37 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e8so20365763ljb.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 06:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Vtav3s6bv1gV27kgdkFoBZQmgByayoCma4ohjXPPVI=;
        b=zRqLShQGHqIqoOy2y8lblcMWNCr30YtQhhhgy8Gi5D/BDshl6dwPxVlQHdyHMcjUHn
         kgKOs5Kox8r8+YS2BnDMTELM1D+ZGdya7ZvBlp8pRYfv0OXQhvGMYj0BqoSGfPrnmEXv
         BIQA+SU4uBTv7L95fSEE6mzUvMwi3C0Ayv0GLdS365SKPxjBUE4lyY6PYK7GnYWy7JCn
         kVa7nFFIhk2zefsR7BokKmvHoVEPtU/toqX5Ka9UCmzHw3z+EGggBWreQ09X8+RPAFNo
         HfvPFop/IDTP3E6N+yEwGxr8/BIUfueV5DfbAz27tJw84r/QEweCDkDIrXhsvrLMzVxU
         BJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Vtav3s6bv1gV27kgdkFoBZQmgByayoCma4ohjXPPVI=;
        b=SGH8hF1eQ7GZGaTlSgCS7OgSISswt9Gyhz6NmXK9vUrEGIasq+z8fLgBbUj2PW8Xv3
         Y//tzmKhs8yFU+Ai6dLuQa+6BZhDtEQDsW/579LG8X68HPMT5o330habYPH2P3P9amRr
         8RXjqSbDMPEnSh72aezqBueSqxCtVuM+kCTx4w2GMHrNt2Okxiw1sOiBKb/0KORu3SWM
         RD00p2hLNkDNNZLSebaKIIIjnsj82apP6DBwGzFgK5OG9UHcjBIfZHDVueEeJb7P1RgA
         +JM0yNXM4nput26DkUYWF/l5AHWYn0xVnaQNtrWF+6YIyrXiohwjQcphwVL1DYIKNI7E
         i5Pg==
X-Gm-Message-State: AOAM532mEiDH+xXndtHSpojHyW+tyB8Jqey98YV3p1l9L2AkmHPSWXTO
        fio4VGj6AhCG4CKDv+LTsAMrN4PUjG8=
X-Google-Smtp-Source: ABdhPJxAVVvk87KE4nG9nEvka4XvWCRx08tw8sS1TdlsNGGSiM1UJt24uSvAul8HbrxUj0y9V1OPtg==
X-Received: by 2002:a2e:3316:: with SMTP id d22mr10803217ljc.18.1595253335605;
        Mon, 20 Jul 2020 06:55:35 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id b18sm648683lfp.36.2020.07.20.06.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 06:55:35 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 2/2 v3] usb: ohci-omap: Convert to use GPIO descriptors
Date:   Mon, 20 Jul 2020 15:55:24 +0200
Message-Id: <20200720135524.100374-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200720135524.100374-1-linus.walleij@linaro.org>
References: <20200720135524.100374-1-linus.walleij@linaro.org>
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
two GPIOs as machine described GPIO descriptors.

I noticed the overcurrent GPIO line is not really used in the
code so dropped in a little comment for other developers.

Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Fix spelling error in commit message.
- Add a helpful comment and TODO to the overcurrent handling.
- Collected Alan's ACK.
ChangeLog v1->v2:
- Rebase on the changes to patch 1
- Fix up the errorpath in the same vein as in patch 1
---
 arch/arm/mach-omap1/board-osk.c | 17 ++++++++++
 drivers/usb/host/ohci-omap.c    | 59 ++++++++++++++++++---------------
 2 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index 4df15e693b6e..144b9caa935c 100644
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
+		GPIO_LOOKUP("i2c-tps65010", 1, "power", GPIO_ACTIVE_HIGH),
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
index a4bdd2b7af83..9ccdf2c216b5 100644
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
@@ -334,6 +318,29 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 	hcd->rsrc_len = pdev->resource[0].end - pdev->resource[0].start + 1;
 	priv = hcd_to_ohci_omap_priv(hcd);
 
+	/* Obtain two optional GPIO lines */
+	priv->power = devm_gpiod_get_optional(&pdev->dev, "power", GPIOD_ASIS);
+	if (IS_ERR(priv->power)) {
+		retval = PTR_ERR(priv->power);
+		goto err_put_hcd;
+	}
+	if (priv->power)
+		gpiod_set_consumer_name(priv->power, "OHCI power");
+
+	/*
+	 * This "overcurrent" GPIO line isn't really used in the code,
+	 * but has a designated hardware function.
+	 * TODO: implement proper overcurrent handling.
+	 */
+	priv->overcurrent = devm_gpiod_get_optional(&pdev->dev, "overcurrent",
+						    GPIOD_IN);
+	if (IS_ERR(priv->overcurrent)) {
+		retval = PTR_ERR(priv->overcurrent);
+		goto err_put_hcd;
+	}
+	if (priv->overcurrent)
+		gpiod_set_consumer_name(priv->overcurrent, "OHCI overcurrent");
+
 	priv->usb_host_ck = clk_get(&pdev->dev, "usb_hhc_ck");
 	if (IS_ERR(priv->usb_host_ck)) {
 		retval = PTR_ERR(priv->usb_host_ck);
@@ -411,8 +418,6 @@ static int ohci_hcd_omap_remove(struct platform_device *pdev)
 		(void) otg_set_host(hcd->usb_phy->otg, 0);
 		usb_put_phy(hcd->usb_phy);
 	}
-	if (machine_is_omap_osk())
-		gpio_free(9);
 	iounmap(hcd->regs);
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 	clk_put(priv->usb_dc_ck);
-- 
2.26.2

