Return-Path: <linux-usb+bounces-544-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D91B77ACAEE
	for <lists+linux-usb@lfdr.de>; Sun, 24 Sep 2023 19:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id ABE6EB20A46
	for <lists+linux-usb@lfdr.de>; Sun, 24 Sep 2023 17:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24CADDB0;
	Sun, 24 Sep 2023 17:17:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6624DD52C
	for <linux-usb@vger.kernel.org>; Sun, 24 Sep 2023 17:17:21 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC008FE;
	Sun, 24 Sep 2023 10:17:18 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 95E8482085;
	Sun, 24 Sep 2023 19:11:33 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Sun, 24 Sep 2023 18:42:59 +0200
Subject: [PATCH RFC 6/6] ARM: pxa: Convert gumstix Bluetooth to GPIO
 descriptors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230924-pxa-gpio-v1-6-2805b87d8894@skole.hr>
References: <20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr>
In-Reply-To: <20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Russell King <linux@armlinux.org.uk>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=H9m5GKPOjDqHvnoQunanjp8s8qAFx4LJD9KoCMZ/UEw=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlEG28X5NLVBm4Qm0+u6B6FKoxQly/0Ciuq8Dwq
 QSFwx5tDyiJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZRBtvAAKCRCaEZ6wQi2W
 4WIQEACd3lw4SAlg1f15xp4lmNLT7RcoKchhGt8EYTWfn55MAR/JinvBIGpVqMdgxB8EAXj+y6U
 8K9GsDCvTXhFBwvCJzt6noLutTilUD1CzM3CJOXfS7ADUZur+AenZ9ueyN7iv4SbJYOZ5eGbEhS
 RR+wxCLltnrtnTdj7CYCbEbGVXp5Onahvon6xS1TMjaiIKJt4gT61wrXMjyHSHh69icqlMT5LKD
 +EfLU128BhOFkif3M4gkRXpKZPqn3NFKlTEfIXV6fWSR05NCWIhatqDbjJBJO/abPamHMBRr87Y
 a9FZ9Su3ElS2ePbsM7HDRChmg/WIukHYudItJYEIo1X1GfZIt8ob6NHL8BtDYwgC7BSID6s/M2O
 ngF+atGZtLGG+DMpSDqD0Db62Dor7IPgGE1GVFIV8bTQQdOWtriOa6ZS+swQnNY6Av9xV2UtBQd
 KBP7ZNp/E7wJwqUzoxOxO08Pp3b2Fqz4YoRQKSAB/pwoUCyZUaz8rEsX/YBU4yo1eRZsQhsF2o/
 zixUHhAyOSPxOyY5bh438obvqYCtMSK8TgMeAyXIFLpLnkh4796NuwLF6XS9wv7AbXB52mS1Saw
 w5Oa0t5wLzMITGy17grLQ8wf1N9W3c5XSK4CbkyH9SmHlCkcc5A7eCyWIvysZ11il4X20lF02Aa
 Rfxtr3YB8cD6uWg==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Gumstix still uses the legacy GPIO interface for resetting the Bluetooth
device.

Convert it to use the GPIO descriptor interface.

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



