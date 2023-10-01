Return-Path: <linux-usb+bounces-883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4412C7B47DE
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 16:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 58ECC1C20A26
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 14:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AE7182A2;
	Sun,  1 Oct 2023 14:13:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF1A179AA
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 14:13:07 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC65FA6;
	Sun,  1 Oct 2023 07:13:05 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 79DAD836EA;
	Sun,  1 Oct 2023 16:13:04 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Sun, 01 Oct 2023 16:12:56 +0200
Subject: [PATCH RFC v4 5/6] ARM: pxa: Convert gumstix Bluetooth to GPIO
 descriptors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231001-pxa-gpio-v4-5-0f3b975e6ed5@skole.hr>
References: <20231001-pxa-gpio-v4-0-0f3b975e6ed5@skole.hr>
In-Reply-To: <20231001-pxa-gpio-v4-0-0f3b975e6ed5@skole.hr>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Russell King <linux@armlinux.org.uk>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-spi@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=iuWT35T+pUGdfAj4zdYMGj+Bj0cXb5OTfKVaTOQr/5k=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlGX5oUa8Zw23lPXVy8SqVKx1jldghSwj9GmogH
 Dm2K+0yBZOJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZRl+aAAKCRCaEZ6wQi2W
 4T4+D/9UXJlbUcC9ellaDRwD9fD5QSbYUvMGxUcaUIDmi/tcwO2jDFIStFEW7ZC66UkWSPAn4kb
 Rwo9UI1weqRgpoFLg99O8LoM7L/pcDCVoTxGfaP6/+uNWWw1gCQpXUisr6y4JZM8nsGqMAZSzLy
 uO2cBdPSm5Dbj8ITCepq2brfJNMSQ7s4iAMHzeWrlI851tYj/+M7CL2l7GSe+1F76e3Bwq5q7pS
 YmbZDAg9unl3OvKKjMVj+JQO2SGyEBbryuiePxDkb+39RgRYsSan3z4lJ8uQSwrCXAvaF56QfFK
 kFwV8+4PBoSaUyE2otTwUdUkhAk4ThqOipeYswz51Dnwo73OPTIVHvu3o0UD05W1LvfJ0ME3Xnq
 Nq7Jlv5MwueroGBtBAhGQOOB38K6FUA6B1IslCZ7hL9NX8Ut2c/QvDXNq7sse8W7eVw3Qd/2Cti
 97SlxkA6OchUSUufb3l+wRQj/9ea+1tK6bX3HMSCo+d9IeBf5xDWG+orOZmwizhK5NfJoFLDdZs
 GvVNZbogSyTNFgtqh/K/QxuPvTp/Mxc9/H+/Lg6zZwbzsGT9DkilYChjybY36FtNorKSJ1W+xfa
 vH1W2JD2l3aSBR9Gbj7QNalOJegrc4LJhyCtlSNbAZhM4xvq3TiQWJmkaa+ke+Uxc9SX3NzASn4
 h1EL9YyO34U5ABw==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Gumstix still uses the legacy GPIO interface for resetting the Bluetooth
device.

Convert it to use the GPIO descriptor interface.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm/mach-pxa/gumstix.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-pxa/gumstix.c b/arch/arm/mach-pxa/gumstix.c
index c9f0f62187bd..14e1b9274d7a 100644
--- a/arch/arm/mach-pxa/gumstix.c
+++ b/arch/arm/mach-pxa/gumstix.c
@@ -20,8 +20,8 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
-#include <linux/gpio.h>
 #include <linux/err.h>
 #include <linux/clk.h>
 
@@ -129,6 +129,9 @@ static void gumstix_udc_init(void)
 #endif
 
 #ifdef CONFIG_BT
+GPIO_LOOKUP_SINGLE(gumstix_bt_gpio_table, "pxa2xx-uart.1", "pxa-gpio",
+		GPIO_GUMSTIX_BTRESET, "BTRST", GPIO_ACTIVE_LOW);
+
 /* Normally, the bootloader would have enabled this 32kHz clock but many
 ** boards still have u-boot 1.1.4 so we check if it has been turned on and
 ** if not, we turn it on with a warning message. */
@@ -153,24 +156,23 @@ static void gumstix_setup_bt_clock(void)
 
 static void __init gumstix_bluetooth_init(void)
 {
-	int err;
+	struct gpio_desc *desc;
+
+	gpiod_add_lookup_table(&gumstix_bt_gpio_table);
 
 	gumstix_setup_bt_clock();
 
-	err = gpio_request(GPIO_GUMSTIX_BTRESET, "BTRST");
-	if (err) {
+	desc = gpiod_get(&pxa_device_btuart.dev, "BTRST", GPIOD_OUT_HIGH);
+	if (IS_ERR(desc)) {
 		pr_err("gumstix: failed request gpio for bluetooth reset\n");
 		return;
 	}
 
-	err = gpio_direction_output(GPIO_GUMSTIX_BTRESET, 1);
-	if (err) {
-		pr_err("gumstix: can't reset bluetooth\n");
-		return;
-	}
-	gpio_set_value(GPIO_GUMSTIX_BTRESET, 0);
+	gpiod_set_value(desc, 0);
 	udelay(100);
-	gpio_set_value(GPIO_GUMSTIX_BTRESET, 1);
+	gpiod_set_value(desc, 1);
+
+	gpiod_put(desc);
 }
 #else
 static void gumstix_bluetooth_init(void)

-- 
2.42.0



