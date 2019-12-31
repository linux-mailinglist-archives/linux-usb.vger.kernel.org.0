Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDC212DAB8
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2019 18:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfLaRu7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Dec 2019 12:50:59 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43737 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfLaRu7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Dec 2019 12:50:59 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so27386860lfq.10
        for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2019 09:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7K4is6sTot0/1etjIcFQMjvHkYMZNanIhfzmbHHbql4=;
        b=QVxAPaqShna9fN498zTZxTV4Nf7XaNRqf3bwUJgNk/bEBC0zV7QYF5zzNE9hqlO0EF
         Th/Caip1cvM2WmDhok8TA7BgJq5nc7eXPUgB9WIpVBjW2NN1sbSZjDvQwamCP5a+KN5C
         ToXqs3tnw2f+lXIrlOS0+O9dZOSMlPCyKPweXjyorL/IQrBM80BFpE1kcQs919fNhTY7
         z9+kWdzxpJIo5RoLxqFUYymidPujVl9iqs1VTqULme+4h4PhUqxdrTdF8flW8f9QY9vE
         p8crTjmXeiSVbA4tLXuLleT+sRqYvvAaz+So+eviTgyjjuZZsOLwWKzsNwgpohgQa/Vk
         144Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7K4is6sTot0/1etjIcFQMjvHkYMZNanIhfzmbHHbql4=;
        b=otLwnYpGUZH86c3ARhPscQiTgOrK37L7I8l6/cLChVHyrTXSAbGPlOMAWTsrV+mVNc
         k/qGuzIS/KxyiTQvi+z0zaNFipP69PFx/Cs3b7TG/s4S49/nQjkPjbGV7FIp5icAR2gx
         kBdQAm15nlK5kgJm3qNEuh1IHD8SmwRiOPZCe8zXelesIDl8s7phoI7dypD2PlXq2KCY
         j5n6+wAMC4s2ZMZVce5KrbrSqVMuQRjH+RbKDTEvYViyjvoemDE0NYezGlA9X6jpFmBZ
         8TkwcgrYOU4Bq15e0eM6GzEvaL3zg3BdvU8TFGLALtI6cwXb1Gvei2gPgTDjcDVQ9Ejp
         hiBw==
X-Gm-Message-State: APjAAAU93edKqR1dpk8NgDY8cj2YWnrexOd1EI+99eK8ePfLmk5ev6Qt
        BSRfd1yGjoyTF9GPQ2+nFCsvcg==
X-Google-Smtp-Source: APXvYqzaFlU1g5VR5NeoLpAaKOEqu5SEHY8hG6dqzRe1A+HizeyJsxLfqthAwuXulbgMg7Cn25RXhA==
X-Received: by 2002:a19:2486:: with SMTP id k128mr41965914lfk.16.1577814654852;
        Tue, 31 Dec 2019 09:50:54 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id v7sm20474663lfa.10.2019.12.31.09.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 09:50:54 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: [PATCH] usb: phy: phy-gpio-vbus-usb: Convert to GPIO descriptors
Date:   Tue, 31 Dec 2019 18:48:48 +0100
Message-Id: <20191231174848.741314-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Instead of using the legacy GPIO API and keeping track on
polarity inversion semantics in the driver, switch to use
GPIO descriptors for this driver and change all consumers
in the process.

This makes it possible to retire platform data completely:
the only remaining platform data member was "wakeup" which
was intended to make the vbus interrupt wakeup capable,
but was not set by any users and thus remained unused. VBUS
was not waking any devices up. Leave a comment about it so
later developers using the platform can consider setting it
to always enabled so plugging in USB wakes up the platform.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This change hits arch/arm/mach-pxa/* and
arch/arm/mach-s3c64* so I have CC to the most active
maintainers.
---
 arch/arm/mach-pxa/colibri-pxa320.c  | 16 ++---
 arch/arm/mach-pxa/eseries.c         | 40 +++++++-----
 arch/arm/mach-pxa/gumstix.c         | 18 +++---
 arch/arm/mach-pxa/hx4700.c          | 22 ++++---
 arch/arm/mach-pxa/magician.c        | 22 ++++---
 arch/arm/mach-pxa/mioa701.c         | 15 +++--
 arch/arm/mach-pxa/palm27x.c         | 34 +++++------
 arch/arm/mach-pxa/palmt5.c          |  1 -
 arch/arm/mach-pxa/palmtc.c          | 18 +++---
 arch/arm/mach-pxa/palmte2.c         | 18 +++---
 arch/arm/mach-pxa/palmtx.c          |  1 -
 arch/arm/mach-pxa/palmz72.c         |  1 -
 arch/arm/mach-pxa/tosa.c            | 18 +++---
 arch/arm/mach-pxa/vpac270.c         | 15 ++---
 arch/arm/mach-s3c64xx/mach-smartq.c | 13 ++--
 drivers/usb/phy/phy-gpio-vbus-usb.c | 95 +++++++++++++----------------
 include/linux/usb/gpio_vbus.h       | 33 ----------
 17 files changed, 188 insertions(+), 192 deletions(-)
 delete mode 100644 include/linux/usb/gpio_vbus.h

diff --git a/arch/arm/mach-pxa/colibri-pxa320.c b/arch/arm/mach-pxa/colibri-pxa320.c
index eba917d69c0a..35dd3adb7712 100644
--- a/arch/arm/mach-pxa/colibri-pxa320.c
+++ b/arch/arm/mach-pxa/colibri-pxa320.c
@@ -11,9 +11,9 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
-#include <linux/usb/gpio_vbus.h>
 
 #include <asm/mach-types.h>
 #include <linux/sizes.h>
@@ -144,17 +144,18 @@ static inline void __init colibri_pxa320_init_eth(void) {}
 #endif /* CONFIG_AX88796 */
 
 #if defined(CONFIG_USB_PXA27X)||defined(CONFIG_USB_PXA27X_MODULE)
-static struct gpio_vbus_mach_info colibri_pxa320_gpio_vbus_info = {
-	.gpio_vbus		= mfp_to_gpio(MFP_PIN_GPIO96),
-	.gpio_pullup		= -1,
+static struct gpiod_lookup_table gpio_vbus_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", MFP_PIN_GPIO96,
+			    "vbus", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct platform_device colibri_pxa320_gpio_vbus = {
 	.name	= "gpio-vbus",
 	.id	= -1,
-	.dev	= {
-		.platform_data	= &colibri_pxa320_gpio_vbus_info,
-	},
 };
 
 static void colibri_pxa320_udc_command(int cmd)
@@ -173,6 +174,7 @@ static struct pxa2xx_udc_mach_info colibri_pxa320_udc_info __initdata = {
 static void __init colibri_pxa320_init_udc(void)
 {
 	pxa_set_udc_info(&colibri_pxa320_udc_info);
+	gpiod_add_lookup_table(&gpio_vbus_gpiod_table);
 	platform_device_register(&colibri_pxa320_gpio_vbus);
 }
 #else
diff --git a/arch/arm/mach-pxa/eseries.c b/arch/arm/mach-pxa/eseries.c
index 91f7c3e40065..f37c44b6139d 100644
--- a/arch/arm/mach-pxa/eseries.c
+++ b/arch/arm/mach-pxa/eseries.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/clk-provider.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio.h>
 #include <linux/delay.h>
 #include <linux/platform_device.h>
@@ -22,7 +23,6 @@
 #include <linux/mfd/t7l66xb.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
-#include <linux/usb/gpio_vbus.h>
 #include <linux/memblock.h>
 
 #include <video/w100fb.h>
@@ -51,18 +51,20 @@ void __init eseries_fixup(struct tag *tags, char **cmdline)
 		memblock_add(0xa0000000, SZ_64M);
 }
 
-struct gpio_vbus_mach_info e7xx_udc_info = {
-	.gpio_vbus   = GPIO_E7XX_USB_DISC,
-	.gpio_pullup = GPIO_E7XX_USB_PULLUP,
-	.gpio_pullup_inverted = 1
+static struct gpiod_lookup_table e7xx_gpio_vbus_gpiod_table __maybe_unused = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO_E7XX_USB_DISC,
+			    "vbus", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa", GPIO_E7XX_USB_PULLUP,
+			    "pullup", GPIO_ACTIVE_LOW),
+		{ },
+	},
 };
 
 static struct platform_device e7xx_gpio_vbus __maybe_unused = {
 	.name	= "gpio-vbus",
 	.id	= -1,
-	.dev	= {
-		.platform_data	= &e7xx_udc_info,
-	},
 };
 
 struct pxaficp_platform_data e7xx_ficp_platform_data = {
@@ -165,6 +167,7 @@ static void __init e330_init(void)
 	pxa_set_stuart_info(NULL);
 	eseries_register_clks();
 	eseries_get_tmio_gpios();
+	gpiod_add_lookup_table(&e7xx_gpio_vbus_gpiod_table);
 	platform_add_devices(ARRAY_AND_SIZE(e330_devices));
 }
 
@@ -216,6 +219,7 @@ static void __init e350_init(void)
 	pxa_set_stuart_info(NULL);
 	eseries_register_clks();
 	eseries_get_tmio_gpios();
+	gpiod_add_lookup_table(&e7xx_gpio_vbus_gpiod_table);
 	platform_add_devices(ARRAY_AND_SIZE(e350_devices));
 }
 
@@ -340,6 +344,7 @@ static void __init e400_init(void)
 	eseries_register_clks();
 	eseries_get_tmio_gpios();
 	pxa_set_fb_info(NULL, &e400_pxafb_mach_info);
+	gpiod_add_lookup_table(&e7xx_gpio_vbus_gpiod_table);
 	platform_add_devices(ARRAY_AND_SIZE(e400_devices));
 }
 
@@ -534,6 +539,7 @@ static void __init e740_init(void)
 	clk_add_alias("CLK_CK48M", e740_t7l66xb_device.name,
 			"UDCCLK", &pxa25x_device_udc.dev),
 	eseries_get_tmio_gpios();
+	gpiod_add_lookup_table(&e7xx_gpio_vbus_gpiod_table);
 	platform_add_devices(ARRAY_AND_SIZE(e740_devices));
 	pxa_set_ac97_info(NULL);
 	pxa_set_ficp_info(&e7xx_ficp_platform_data);
@@ -733,6 +739,7 @@ static void __init e750_init(void)
 	clk_add_alias("CLK_CK3P6MI", e750_tc6393xb_device.name,
 			"GPIO11_CLK", NULL),
 	eseries_get_tmio_gpios();
+	gpiod_add_lookup_table(&e7xx_gpio_vbus_gpiod_table);
 	platform_add_devices(ARRAY_AND_SIZE(e750_devices));
 	pxa_set_ac97_info(NULL);
 	pxa_set_ficp_info(&e7xx_ficp_platform_data);
@@ -888,18 +895,20 @@ static struct platform_device e800_fb_device = {
 
 /* --------------------------- UDC definitions --------------------------- */
 
-static struct gpio_vbus_mach_info e800_udc_info = {
-	.gpio_vbus   = GPIO_E800_USB_DISC,
-	.gpio_pullup = GPIO_E800_USB_PULLUP,
-	.gpio_pullup_inverted = 1
+static struct gpiod_lookup_table e800_gpio_vbus_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO_E800_USB_DISC,
+			    "vbus", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa", GPIO_E800_USB_PULLUP,
+			    "pullup", GPIO_ACTIVE_LOW),
+		{ },
+	},
 };
 
 static struct platform_device e800_gpio_vbus = {
 	.name	= "gpio-vbus",
 	.id	= -1,
-	.dev	= {
-		.platform_data	= &e800_udc_info,
-	},
 };
 
 
@@ -949,6 +958,7 @@ static void __init e800_init(void)
 	clk_add_alias("CLK_CK3P6MI", e800_tc6393xb_device.name,
 			"GPIO11_CLK", NULL),
 	eseries_get_tmio_gpios();
+	gpiod_add_lookup_table(&e800_gpio_vbus_gpiod_table);
 	platform_add_devices(ARRAY_AND_SIZE(e800_devices));
 	pxa_set_ac97_info(NULL);
 }
diff --git a/arch/arm/mach-pxa/gumstix.c b/arch/arm/mach-pxa/gumstix.c
index 4b4589cf431f..49dd618b10f7 100644
--- a/arch/arm/mach-pxa/gumstix.c
+++ b/arch/arm/mach-pxa/gumstix.c
@@ -20,10 +20,10 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio.h>
 #include <linux/err.h>
 #include <linux/clk.h>
-#include <linux/usb/gpio_vbus.h>
 
 #include <asm/setup.h>
 #include <asm/memory.h>
@@ -101,21 +101,25 @@ static void __init gumstix_mmc_init(void)
 #endif
 
 #ifdef CONFIG_USB_PXA25X
-static struct gpio_vbus_mach_info gumstix_udc_info = {
-	.gpio_vbus		= GPIO_GUMSTIX_USB_GPIOn,
-	.gpio_pullup		= GPIO_GUMSTIX_USB_GPIOx,
+static struct gpiod_lookup_table gumstix_gpio_vbus_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO_GUMSTIX_USB_GPIOn,
+			    "vbus", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa", GPIO_GUMSTIX_USB_GPIOx,
+			    "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct platform_device gumstix_gpio_vbus = {
 	.name	= "gpio-vbus",
 	.id	= -1,
-	.dev	= {
-		.platform_data	= &gumstix_udc_info,
-	},
 };
 
 static void __init gumstix_udc_init(void)
 {
+	gpiod_add_lookup_table(&gumstix_gpio_vbus_gpiod_table);
 	platform_device_register(&gumstix_gpio_vbus);
 }
 #else
diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
index 311268d186ab..238a751a8797 100644
--- a/arch/arm/mach-pxa/hx4700.c
+++ b/arch/arm/mach-pxa/hx4700.c
@@ -34,7 +34,6 @@
 #include <linux/spi/ads7846.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/pxa2xx_spi.h>
-#include <linux/usb/gpio_vbus.h>
 #include <linux/platform_data/i2c-pxa.h>
 
 #include <mach/hardware.h>
@@ -578,18 +577,24 @@ static struct pwm_lookup hx4700_pwm_lookup[] = {
  * USB "Transceiver"
  */
 
-static struct gpio_vbus_mach_info gpio_vbus_info = {
-	.gpio_pullup        = GPIO76_HX4700_USBC_PUEN,
-	.gpio_vbus          = GPIOD14_nUSBC_DETECT,
-	.gpio_vbus_inverted = 1,
+static struct gpiod_lookup_table gpio_vbus_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		/* This GPIO is on ASIC3 */
+		GPIO_LOOKUP("asic3",
+			    /* Convert to a local offset on the ASIC3 */
+			    GPIOD14_nUSBC_DETECT - HX4700_ASIC3_GPIO_BASE,
+			    "vbus", GPIO_ACTIVE_LOW),
+		/* This one is on the primary SOC GPIO */
+		GPIO_LOOKUP("gpio-pxa", GPIO76_HX4700_USBC_PUEN,
+			    "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct platform_device gpio_vbus = {
 	.name          = "gpio-vbus",
 	.id            = -1,
-	.dev = {
-		.platform_data = &gpio_vbus_info,
-	},
 };
 
 static struct pxa2xx_udc_mach_info hx4700_udc_info;
@@ -883,6 +888,7 @@ static void __init hx4700_init(void)
 	pxa_set_stuart_info(NULL);
 
 	gpiod_add_lookup_table(&bq24022_gpiod_table);
+	gpiod_add_lookup_table(&gpio_vbus_gpiod_table);
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 	pwm_add_table(hx4700_pwm_lookup, ARRAY_SIZE(hx4700_pwm_lookup));
 
diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
index e1a394ac3eea..5a1976e431e7 100644
--- a/arch/arm/mach-pxa/magician.c
+++ b/arch/arm/mach-pxa/magician.c
@@ -27,7 +27,6 @@
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/gpio-regulator.h>
 #include <linux/regulator/machine.h>
-#include <linux/usb/gpio_vbus.h>
 #include <linux/platform_data/i2c-pxa.h>
 
 #include <mach/hardware.h>
@@ -506,9 +505,20 @@ static struct resource gpio_vbus_resource = {
 	.end	= IRQ_MAGICIAN_VBUS,
 };
 
-static struct gpio_vbus_mach_info gpio_vbus_info = {
-	.gpio_pullup	= GPIO27_MAGICIAN_USBC_PUEN,
-	.gpio_vbus	= EGPIO_MAGICIAN_CABLE_VBUS,
+static struct gpiod_lookup_table gpio_vbus_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		/*
+		 * EGPIO on register 4 index 1, the second EGPIO chip
+		 * starts at register 4 so this will be at index 1 on that
+		 * chip.
+		 */
+		GPIO_LOOKUP("htc-egpio-1", 1,
+			    "vbus", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa", GPIO27_MAGICIAN_USBC_PUEN,
+			    "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct platform_device gpio_vbus = {
@@ -516,9 +526,6 @@ static struct platform_device gpio_vbus = {
 	.id		= -1,
 	.num_resources	= 1,
 	.resource	= &gpio_vbus_resource,
-	.dev = {
-		.platform_data = &gpio_vbus_info,
-	},
 };
 
 /*
@@ -1032,6 +1039,7 @@ static void __init magician_init(void)
 		ARRAY_SIZE(pwm_backlight_supply), 5000000);
 
 	gpiod_add_lookup_table(&bq24022_gpiod_table);
+	gpiod_add_lookup_table(&gpio_vbus_gpiod_table);
 	platform_add_devices(ARRAY_AND_SIZE(devices));
 }
 
diff --git a/arch/arm/mach-pxa/mioa701.c b/arch/arm/mach-pxa/mioa701.c
index c360023a989c..0b8bae9610f1 100644
--- a/arch/arm/mach-pxa/mioa701.c
+++ b/arch/arm/mach-pxa/mioa701.c
@@ -24,7 +24,6 @@
 #include <linux/power_supply.h>
 #include <linux/wm97xx.h>
 #include <linux/mtd/physmap.h>
-#include <linux/usb/gpio_vbus.h>
 #include <linux/reboot.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/max1586.h>
@@ -368,10 +367,13 @@ static struct pxa2xx_udc_mach_info mioa701_udc_info = {
 	.gpio_pullup	  = GPIO22_USB_ENABLE,
 };
 
-struct gpio_vbus_mach_info gpio_vbus_data = {
-	.gpio_vbus = GPIO13_nUSB_DETECT,
-	.gpio_vbus_inverted = 1,
-	.gpio_pullup = -1,
+static struct gpiod_lookup_table gpio_vbus_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO13_nUSB_DETECT,
+			    "vbus", GPIO_ACTIVE_LOW),
+		{ },
+	},
 };
 
 /*
@@ -677,7 +679,7 @@ MIO_SIMPLE_DEV(mioa701_led,	  "leds-gpio",	    &gpio_led_info)
 MIO_SIMPLE_DEV(pxa2xx_pcm,	  "pxa2xx-pcm",	    NULL)
 MIO_SIMPLE_DEV(mioa701_sound,	  "mioa701-wm9713", NULL)
 MIO_SIMPLE_DEV(mioa701_board,	  "mioa701-board",  NULL)
-MIO_SIMPLE_DEV(gpio_vbus,	  "gpio-vbus",      &gpio_vbus_data);
+MIO_SIMPLE_DEV(gpio_vbus,	  "gpio-vbus",      NULL);
 
 static struct platform_device *devices[] __initdata = {
 	&mioa701_gpio_keys,
@@ -750,6 +752,7 @@ static void __init mioa701_machine_init(void)
 	pxa_set_ac97_info(&mioa701_ac97_info);
 	pm_power_off = mioa701_poweroff;
 	pwm_add_table(mioa701_pwm_lookup, ARRAY_SIZE(mioa701_pwm_lookup));
+	gpiod_add_lookup_table(&gpio_vbus_gpiod_table);
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 	gsm_init();
 
diff --git a/arch/arm/mach-pxa/palm27x.c b/arch/arm/mach-pxa/palm27x.c
index 3ad0b3915ae1..b600b63af3a6 100644
--- a/arch/arm/mach-pxa/palm27x.c
+++ b/arch/arm/mach-pxa/palm27x.c
@@ -13,10 +13,10 @@
 #include <linux/pda_power.h>
 #include <linux/pwm.h>
 #include <linux/pwm_backlight.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio.h>
 #include <linux/wm97xx.h>
 #include <linux/power_supply.h>
-#include <linux/usb/gpio_vbus.h>
 #include <linux/regulator/max1586.h>
 #include <linux/platform_data/i2c-pxa.h>
 
@@ -159,32 +159,32 @@ void __init palm27x_lcd_init(int power, struct pxafb_mode_info *mode)
  ******************************************************************************/
 #if	defined(CONFIG_USB_PXA27X) || \
 	defined(CONFIG_USB_PXA27X_MODULE)
-static struct gpio_vbus_mach_info palm27x_udc_info = {
-	.gpio_vbus_inverted	= 1,
+
+/* The actual GPIO offsets get filled in in the palm27x_udc_init() call */
+static struct gpiod_lookup_table palm27x_udc_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 0,
+			    "vbus", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa", 0,
+			    "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct platform_device palm27x_gpio_vbus = {
 	.name	= "gpio-vbus",
 	.id	= -1,
-	.dev	= {
-		.platform_data	= &palm27x_udc_info,
-	},
 };
 
 void __init palm27x_udc_init(int vbus, int pullup, int vbus_inverted)
 {
-	palm27x_udc_info.gpio_vbus	= vbus;
-	palm27x_udc_info.gpio_pullup	= pullup;
-
-	palm27x_udc_info.gpio_vbus_inverted = vbus_inverted;
-
-	if (!gpio_request(pullup, "USB Pullup")) {
-		gpio_direction_output(pullup,
-			palm27x_udc_info.gpio_vbus_inverted);
-		gpio_free(pullup);
-	} else
-		return;
+	palm27x_udc_gpiod_table.table[0].chip_hwnum = vbus;
+	palm27x_udc_gpiod_table.table[1].chip_hwnum = pullup;
+	if (vbus_inverted)
+		palm27x_udc_gpiod_table.table[0].flags = GPIO_ACTIVE_LOW;
 
+	gpiod_add_lookup_table(&palm27x_udc_gpiod_table);
 	platform_device_register(&palm27x_gpio_vbus);
 }
 #endif
diff --git a/arch/arm/mach-pxa/palmt5.c b/arch/arm/mach-pxa/palmt5.c
index 902403367786..7c7cbb4e677e 100644
--- a/arch/arm/mach-pxa/palmt5.c
+++ b/arch/arm/mach-pxa/palmt5.c
@@ -23,7 +23,6 @@
 #include <linux/gpio.h>
 #include <linux/wm97xx.h>
 #include <linux/power_supply.h>
-#include <linux/usb/gpio_vbus.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-pxa/palmtc.c b/arch/arm/mach-pxa/palmtc.c
index f52bd155e825..fda9deaaae02 100644
--- a/arch/arm/mach-pxa/palmtc.c
+++ b/arch/arm/mach-pxa/palmtc.c
@@ -23,7 +23,6 @@
 #include <linux/power_supply.h>
 #include <linux/gpio_keys.h>
 #include <linux/mtd/physmap.h>
-#include <linux/usb/gpio_vbus.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -319,22 +318,25 @@ static inline void palmtc_mkp_init(void) {}
  * UDC
  ******************************************************************************/
 #if defined(CONFIG_USB_PXA25X)||defined(CONFIG_USB_PXA25X_MODULE)
-static struct gpio_vbus_mach_info palmtc_udc_info = {
-	.gpio_vbus		= GPIO_NR_PALMTC_USB_DETECT_N,
-	.gpio_vbus_inverted	= 1,
-	.gpio_pullup		= GPIO_NR_PALMTC_USB_POWER,
+static struct gpiod_lookup_table palmtc_udc_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO_NR_PALMTC_USB_DETECT_N,
+			    "vbus", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("gpio-pxa", GPIO_NR_PALMTC_USB_POWER,
+			    "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct platform_device palmtc_gpio_vbus = {
 	.name	= "gpio-vbus",
 	.id	= -1,
-	.dev	= {
-		.platform_data	= &palmtc_udc_info,
-	},
 };
 
 static void __init palmtc_udc_init(void)
 {
+	gpiod_add_lookup_table(&palmtc_udc_gpiod_table);
 	platform_device_register(&palmtc_gpio_vbus);
 };
 #else
diff --git a/arch/arm/mach-pxa/palmte2.c b/arch/arm/mach-pxa/palmte2.c
index a92b9665f425..7171014fd311 100644
--- a/arch/arm/mach-pxa/palmte2.c
+++ b/arch/arm/mach-pxa/palmte2.c
@@ -23,7 +23,6 @@
 #include <linux/gpio.h>
 #include <linux/wm97xx.h>
 #include <linux/power_supply.h>
-#include <linux/usb/gpio_vbus.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -201,18 +200,20 @@ static struct pxaficp_platform_data palmte2_ficp_platform_data = {
 /******************************************************************************
  * UDC
  ******************************************************************************/
-static struct gpio_vbus_mach_info palmte2_udc_info = {
-	.gpio_vbus		= GPIO_NR_PALMTE2_USB_DETECT_N,
-	.gpio_vbus_inverted	= 1,
-	.gpio_pullup		= GPIO_NR_PALMTE2_USB_PULLUP,
+static struct gpiod_lookup_table palmte2_udc_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO_NR_PALMTE2_USB_DETECT_N,
+			    "vbus", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("gpio-pxa", GPIO_NR_PALMTE2_USB_PULLUP,
+			    "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct platform_device palmte2_gpio_vbus = {
 	.name	= "gpio-vbus",
 	.id	= -1,
-	.dev	= {
-		.platform_data	= &palmte2_udc_info,
-	},
 };
 
 /******************************************************************************
@@ -368,6 +369,7 @@ static void __init palmte2_init(void)
 	pxa_set_ficp_info(&palmte2_ficp_platform_data);
 
 	pwm_add_table(palmte2_pwm_lookup, ARRAY_SIZE(palmte2_pwm_lookup));
+	gpiod_add_lookup_table(&palmte2_udc_gpiod_table);
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 }
 
diff --git a/arch/arm/mach-pxa/palmtx.c b/arch/arm/mach-pxa/palmtx.c
index 926593ecf1c9..07332c92c9f7 100644
--- a/arch/arm/mach-pxa/palmtx.c
+++ b/arch/arm/mach-pxa/palmtx.c
@@ -23,7 +23,6 @@
 #include <linux/gpio.h>
 #include <linux/wm97xx.h>
 #include <linux/power_supply.h>
-#include <linux/usb/gpio_vbus.h>
 #include <linux/mtd/platnand.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/physmap.h>
diff --git a/arch/arm/mach-pxa/palmz72.c b/arch/arm/mach-pxa/palmz72.c
index 77fe2e367324..4df443943579 100644
--- a/arch/arm/mach-pxa/palmz72.c
+++ b/arch/arm/mach-pxa/palmz72.c
@@ -25,7 +25,6 @@
 #include <linux/gpio.h>
 #include <linux/wm97xx.h>
 #include <linux/power_supply.h>
-#include <linux/usb/gpio_vbus.h>
 #include <linux/platform_data/i2c-gpio.h>
 #include <linux/gpio/machine.h>
 
diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
index 4e13893edeb9..3d2c108e911e 100644
--- a/arch/arm/mach-pxa/tosa.c
+++ b/arch/arm/mach-pxa/tosa.c
@@ -33,7 +33,6 @@
 #include <linux/spi/pxa2xx_spi.h>
 #include <linux/input/matrix_keypad.h>
 #include <linux/platform_data/i2c-pxa.h>
-#include <linux/usb/gpio_vbus.h>
 #include <linux/reboot.h>
 #include <linux/memblock.h>
 
@@ -240,18 +239,20 @@ static struct scoop_pcmcia_config tosa_pcmcia_config = {
 /*
  * USB Device Controller
  */
-static struct gpio_vbus_mach_info tosa_udc_info = {
-	.gpio_pullup		= TOSA_GPIO_USB_PULLUP,
-	.gpio_vbus		= TOSA_GPIO_USB_IN,
-	.gpio_vbus_inverted	= 1,
+static struct gpiod_lookup_table tosa_udc_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_USB_IN,
+			    "vbus", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_USB_PULLUP,
+			    "pullup", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct platform_device tosa_gpio_vbus = {
 	.name	= "gpio-vbus",
 	.id	= -1,
-	.dev	= {
-		.platform_data	= &tosa_udc_info,
-	},
 };
 
 /*
@@ -949,6 +950,7 @@ static void __init tosa_init(void)
 
 	clk_add_alias("CLK_CK3P6MI", tc6393xb_device.name, "GPIO11_CLK", NULL);
 
+	gpiod_add_lookup_table(&tosa_udc_gpiod_table);
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 }
 
diff --git a/arch/arm/mach-pxa/vpac270.c b/arch/arm/mach-pxa/vpac270.c
index 26a5ebc00069..14505e83479e 100644
--- a/arch/arm/mach-pxa/vpac270.c
+++ b/arch/arm/mach-pxa/vpac270.c
@@ -14,7 +14,6 @@
 #include <linux/leds.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
-#include <linux/usb/gpio_vbus.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
@@ -352,17 +351,18 @@ static inline void vpac270_uhc_init(void) {}
  * USB Gadget
  ******************************************************************************/
 #if defined(CONFIG_USB_PXA27X)||defined(CONFIG_USB_PXA27X_MODULE)
-static struct gpio_vbus_mach_info vpac270_gpio_vbus_info = {
-	.gpio_vbus		= GPIO41_VPAC270_UDC_DETECT,
-	.gpio_pullup		= -1,
+static struct gpiod_lookup_table vpac270_gpio_vbus_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO41_VPAC270_UDC_DETECT,
+			    "vbus", GPIO_ACTIVE_HIGH),
+		{ },
+	},
 };
 
 static struct platform_device vpac270_gpio_vbus = {
 	.name	= "gpio-vbus",
 	.id	= -1,
-	.dev	= {
-		.platform_data	= &vpac270_gpio_vbus_info,
-	},
 };
 
 static void vpac270_udc_command(int cmd)
@@ -381,6 +381,7 @@ static struct pxa2xx_udc_mach_info vpac270_udc_info __initdata = {
 static void __init vpac270_udc_init(void)
 {
 	pxa_set_udc_info(&vpac270_udc_info);
+	gpiod_add_lookup_table(&vpac270_gpio_vbus_gpiod_table);
 	platform_device_register(&vpac270_gpio_vbus);
 }
 #else
diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64xx/mach-smartq.c
index 951208f168e7..eedab7b912bb 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -13,7 +13,6 @@
 #include <linux/serial_core.h>
 #include <linux/serial_s3c.h>
 #include <linux/spi/spi_gpio.h>
-#include <linux/usb/gpio_vbus.h>
 #include <linux/platform_data/s3c-hsotg.h>
 
 #include <asm/mach-types.h>
@@ -124,15 +123,16 @@ static struct s3c2410_hcd_info smartq_usb_host_info = {
 	.enable_oc	= smartq_usb_host_enableoc,
 };
 
-static struct gpio_vbus_mach_info smartq_usb_otg_vbus_pdata = {
-	.gpio_vbus		= S3C64XX_GPL(9),
-	.gpio_pullup		= -1,
-	.gpio_vbus_inverted	= true,
+static struct gpiod_lookup_table smartq_usb_otg_vbus_gpiod_table = {
+	.dev_id = "gpio-vbus",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 9, "vbus", GPIO_ACTIVE_LOW),
+		{ },
+	},
 };
 
 static struct platform_device smartq_usb_otg_vbus_dev = {
 	.name			= "gpio-vbus",
-	.dev.platform_data	= &smartq_usb_otg_vbus_pdata,
 };
 
 static struct pwm_lookup smartq_pwm_lookup[] = {
@@ -418,6 +418,7 @@ void __init smartq_machine_init(void)
 
 	pwm_add_table(smartq_pwm_lookup, ARRAY_SIZE(smartq_pwm_lookup));
 	gpiod_add_lookup_table(&smartq_lcd_control_gpiod_table);
+	gpiod_add_lookup_table(&smartq_usb_otg_vbus_gpiod_table);
 	platform_add_devices(smartq_devices, ARRAY_SIZE(smartq_devices));
 
 	gpiod_add_lookup_table(&smartq_audio_gpios);
diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index 553e2573c74f..05c5173d560b 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -7,7 +7,7 @@
 
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
@@ -17,7 +17,6 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/usb/gadget.h>
-#include <linux/usb/gpio_vbus.h>
 #include <linux/usb/otg.h>
 
 
@@ -29,6 +28,8 @@
  * Needs to be loaded before the UDC driver that will use it.
  */
 struct gpio_vbus_data {
+	struct gpio_desc	*vbus_gpiod;
+	struct gpio_desc	*pullup_gpiod;
 	struct usb_phy		phy;
 	struct device          *dev;
 	struct regulator       *vbus_draw;
@@ -83,38 +84,30 @@ static void set_vbus_draw(struct gpio_vbus_data *gpio_vbus, unsigned mA)
 	gpio_vbus->mA = mA;
 }
 
-static int is_vbus_powered(struct gpio_vbus_mach_info *pdata)
+static int is_vbus_powered(struct gpio_vbus_data *gpio_vbus)
 {
-	int vbus;
-
-	vbus = gpio_get_value(pdata->gpio_vbus);
-	if (pdata->gpio_vbus_inverted)
-		vbus = !vbus;
-
-	return vbus;
+	return gpiod_get_value(gpio_vbus->vbus_gpiod);
 }
 
 static void gpio_vbus_work(struct work_struct *work)
 {
 	struct gpio_vbus_data *gpio_vbus =
 		container_of(work, struct gpio_vbus_data, work.work);
-	struct gpio_vbus_mach_info *pdata = dev_get_platdata(gpio_vbus->dev);
-	int gpio, status, vbus;
+	int status, vbus;
 
 	if (!gpio_vbus->phy.otg->gadget)
 		return;
 
-	vbus = is_vbus_powered(pdata);
+	vbus = is_vbus_powered(gpio_vbus);
 	if ((vbus ^ gpio_vbus->vbus) == 0)
 		return;
 	gpio_vbus->vbus = vbus;
 
 	/* Peripheral controllers which manage the pullup themselves won't have
-	 * gpio_pullup configured here.  If it's configured here, we'll do what
-	 * isp1301_omap::b_peripheral() does and enable the pullup here... although
-	 * that may complicate usb_gadget_{,dis}connect() support.
+	 * a pullup GPIO configured here.  If it's configured here, we'll do
+	 * what isp1301_omap::b_peripheral() does and enable the pullup here...
+	 * although that may complicate usb_gadget_{,dis}connect() support.
 	 */
-	gpio = pdata->gpio_pullup;
 
 	if (vbus) {
 		status = USB_EVENT_VBUS;
@@ -126,16 +119,16 @@ static void gpio_vbus_work(struct work_struct *work)
 		set_vbus_draw(gpio_vbus, 100);
 
 		/* optionally enable D+ pullup */
-		if (gpio_is_valid(gpio))
-			gpio_set_value(gpio, !pdata->gpio_pullup_inverted);
+		if (gpio_vbus->pullup_gpiod)
+			gpiod_set_value(gpio_vbus->pullup_gpiod, 1);
 
 		atomic_notifier_call_chain(&gpio_vbus->phy.notifier,
 					   status, gpio_vbus->phy.otg->gadget);
 		usb_phy_set_event(&gpio_vbus->phy, USB_EVENT_ENUMERATED);
 	} else {
 		/* optionally disable D+ pullup */
-		if (gpio_is_valid(gpio))
-			gpio_set_value(gpio, pdata->gpio_pullup_inverted);
+		if (gpio_vbus->pullup_gpiod)
+			gpiod_set_value(gpio_vbus->pullup_gpiod, 0);
 
 		set_vbus_draw(gpio_vbus, 0);
 
@@ -154,12 +147,11 @@ static void gpio_vbus_work(struct work_struct *work)
 static irqreturn_t gpio_vbus_irq(int irq, void *data)
 {
 	struct platform_device *pdev = data;
-	struct gpio_vbus_mach_info *pdata = dev_get_platdata(&pdev->dev);
 	struct gpio_vbus_data *gpio_vbus = platform_get_drvdata(pdev);
 	struct usb_otg *otg = gpio_vbus->phy.otg;
 
 	dev_dbg(&pdev->dev, "VBUS %s (gadget: %s)\n",
-		is_vbus_powered(pdata) ? "supplied" : "inactive",
+		is_vbus_powered(gpio_vbus) ? "supplied" : "inactive",
 		otg->gadget ? otg->gadget->name : "none");
 
 	if (otg->gadget)
@@ -175,22 +167,18 @@ static int gpio_vbus_set_peripheral(struct usb_otg *otg,
 					struct usb_gadget *gadget)
 {
 	struct gpio_vbus_data *gpio_vbus;
-	struct gpio_vbus_mach_info *pdata;
 	struct platform_device *pdev;
-	int gpio;
 
 	gpio_vbus = container_of(otg->usb_phy, struct gpio_vbus_data, phy);
 	pdev = to_platform_device(gpio_vbus->dev);
-	pdata = dev_get_platdata(gpio_vbus->dev);
-	gpio = pdata->gpio_pullup;
 
 	if (!gadget) {
 		dev_dbg(&pdev->dev, "unregistering gadget '%s'\n",
 			otg->gadget->name);
 
 		/* optionally disable D+ pullup */
-		if (gpio_is_valid(gpio))
-			gpio_set_value(gpio, pdata->gpio_pullup_inverted);
+		if (gpio_vbus->pullup_gpiod)
+			gpiod_set_value(gpio_vbus->pullup_gpiod, 0);
 
 		set_vbus_draw(gpio_vbus, 0);
 
@@ -242,16 +230,13 @@ static int gpio_vbus_set_suspend(struct usb_phy *phy, int suspend)
 
 static int gpio_vbus_probe(struct platform_device *pdev)
 {
-	struct gpio_vbus_mach_info *pdata = dev_get_platdata(&pdev->dev);
 	struct gpio_vbus_data *gpio_vbus;
 	struct resource *res;
+	struct gpio_desc *gpiod;
+	struct device *dev = &pdev->dev;
 	int err, gpio, irq;
 	unsigned long irqflags;
 
-	if (!pdata || !gpio_is_valid(pdata->gpio_vbus))
-		return -EINVAL;
-	gpio = pdata->gpio_vbus;
-
 	gpio_vbus = devm_kzalloc(&pdev->dev, sizeof(struct gpio_vbus_data),
 				 GFP_KERNEL);
 	if (!gpio_vbus)
@@ -273,37 +258,43 @@ static int gpio_vbus_probe(struct platform_device *pdev)
 	gpio_vbus->phy.otg->usb_phy = &gpio_vbus->phy;
 	gpio_vbus->phy.otg->set_peripheral = gpio_vbus_set_peripheral;
 
-	err = devm_gpio_request(&pdev->dev, gpio, "vbus_detect");
-	if (err) {
-		dev_err(&pdev->dev, "can't request vbus gpio %d, err: %d\n",
-			gpio, err);
+	/* Look up the VBUS sensing GPIO */
+	gpio_vbus->vbus_gpiod = devm_gpiod_get(dev, "vbus", GPIOD_IN);
+	if (IS_ERR(gpio_vbus->vbus_gpiod)) {
+		err = PTR_ERR(gpio_vbus->vbus_gpiod);
+		dev_err(&pdev->dev, "can't request vbus gpio, err: %d\n", err);
 		return err;
 	}
-	gpio_direction_input(gpio);
+	gpiod_set_consumer_name(gpio_vbus->vbus_gpiod, "vbus_detect");
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (res) {
 		irq = res->start;
 		irqflags = (res->flags & IRQF_TRIGGER_MASK) | IRQF_SHARED;
 	} else {
-		irq = gpio_to_irq(gpio);
+		irq = gpiod_to_irq(gpio_vbus->vbus_gpiod);
 		irqflags = VBUS_IRQ_FLAGS;
 	}
 
 	gpio_vbus->irq = irq;
 
-	/* if data line pullup is in use, initialize it to "not pulling up" */
-	gpio = pdata->gpio_pullup;
-	if (gpio_is_valid(gpio)) {
-		err = devm_gpio_request(&pdev->dev, gpio, "udc_pullup");
-		if (err) {
-			dev_err(&pdev->dev,
-				"can't request pullup gpio %d, err: %d\n",
-				gpio, err);
-			return err;
-		}
-		gpio_direction_output(gpio, pdata->gpio_pullup_inverted);
+	/*
+	 * The VBUS sensing GPIO should have a pulldown, which will normally be
+	 * part of a resistor ladder turning a 4.0V-5.25V level on VBUS into a
+	 * value the GPIO detects as active. Some systems will use comparators.
+	 * Get the optional D+ or D- pullup GPIO. If the data line pullup is
+	 * in use, initialize it to "not pulling up"
+	 */
+	gpio_vbus->pullup_gpiod = devm_gpiod_get_optional(dev, "pullup",
+							  GPIOD_OUT_LOW);
+	if (IS_ERR(gpio_vbus->pullup_gpiod)) {
+		err = PTR_ERR(gpio_vbus->pullup_gpiod);
+		dev_err(&pdev->dev, "can't request pullup gpio, err: %d\n",
+			err);
+		return err;
 	}
+	if (gpio_vbus->pullup_gpiod)
+		gpiod_set_consumer_name(gpio_vbus->pullup_gpiod, "udc_pullup");
 
 	err = devm_request_irq(&pdev->dev, irq, gpio_vbus_irq, irqflags,
 			       "vbus_detect", pdev);
@@ -330,7 +321,7 @@ static int gpio_vbus_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	device_init_wakeup(&pdev->dev, pdata->wakeup);
+	/* TODO: wakeup could be enabled here with device_init_wakeup(dev, 1) */
 
 	return 0;
 }
diff --git a/include/linux/usb/gpio_vbus.h b/include/linux/usb/gpio_vbus.h
deleted file mode 100644
index 804fb06cf6d6..000000000000
--- a/include/linux/usb/gpio_vbus.h
+++ /dev/null
@@ -1,33 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * A simple GPIO VBUS sensing driver for B peripheral only devices
- * with internal transceivers.
- * Optionally D+ pullup can be controlled by a second GPIO.
- *
- * Copyright (c) 2008 Philipp Zabel <philipp.zabel@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- */
-
-/**
- * struct gpio_vbus_mach_info - configuration for gpio_vbus
- * @gpio_vbus: VBUS sensing GPIO
- * @gpio_pullup: optional D+ or D- pullup GPIO (else negative/invalid)
- * @gpio_vbus_inverted: true if gpio_vbus is active low
- * @gpio_pullup_inverted: true if gpio_pullup is active low
- * @wakeup: configure gpio_vbus as a wake-up source
- *
- * The VBUS sensing GPIO should have a pulldown, which will normally be
- * part of a resistor ladder turning a 4.0V-5.25V level on VBUS into a
- * value the GPIO detects as active.  Some systems will use comparators.
- */
-struct gpio_vbus_mach_info {
-	int gpio_vbus;
-	int gpio_pullup;
-	bool gpio_vbus_inverted;
-	bool gpio_pullup_inverted;
-	bool wakeup;
-};
-- 
2.23.0

