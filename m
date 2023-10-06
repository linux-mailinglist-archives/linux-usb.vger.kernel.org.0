Return-Path: <linux-usb+bounces-1196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D47BB992
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 15:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90E961C20B38
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 13:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181B723768;
	Fri,  6 Oct 2023 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9294B241F8
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 13:45:18 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DABA83;
	Fri,  6 Oct 2023 06:45:16 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 11DAA82B6A;
	Fri,  6 Oct 2023 15:45:15 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Fri, 06 Oct 2023 15:44:29 +0200
Subject: [PATCH RFT v6 5/6] ARM: pxa: Convert gumstix Bluetooth to GPIO
 descriptors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231006-pxa-gpio-v6-5-981b4910d599@skole.hr>
References: <20231006-pxa-gpio-v6-0-981b4910d599@skole.hr>
In-Reply-To: <20231006-pxa-gpio-v6-0-981b4910d599@skole.hr>
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
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2189;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=Dr351d93QVsgkRcO0eJVhSNl8Av1yPt3sqc414h6Tbk=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlIA9d/F9TLkLIhHM3hDILl8MSvW4bu2FnfuQE0
 diAXQhbz32JAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZSAPXQAKCRCaEZ6wQi2W
 4YPqD/9k4FrU/yzrM/Bg2eziLiJJCSgeoqztb0z7j4FNXVdgITVRohK/R2vbtWDGmeFS5L5rl0V
 1skAo9ak776xAEWm4fN8E0FlUsovzMwT/IFDQTAnLf2Z7J4+QRik5PQBdTNl8lqiZz/WQDiU0zf
 PqV62Tx4YanhkIYIa1c1THAlMqjmGYxX2zCaMtY6Iky/QOq8MMdvtHaUKJ7mUDdhSMToPSXQ8WU
 WpVl0MCMgJP0I0JCzqZoBGiRCTQ/ZagxYUgg/pGTi9WkWWK46RUsSmwDbgr5prxzCV48r9imNL2
 agS5umSy9p89jC/QXzamxu7W9YCE1FXtw/M5WwT1dYOHOir5vWWIYQ6YQTQRPCIk0WGurwTxaQg
 dX/5NNZ1rEI4QRX/kBkpdS5V2pHbhB+NZE0RYVO4/J6v0AeReJuzAOXHcv/krE9PiAUdz7zC9Su
 kxWC8yDM7HoTp/E/fWtKm0RtyoG0NW7n9xRx9rAYn/1iJq8LNZr6V4/w7fi+Cki8uI2fPR0iSz1
 FBQbem2LGjue1aXMoCNxxsXLv6d+QpwcaxSdG0zqMgxZ+hhZvXQTm6bl8K86EnBxr5qlNsx+gAL
 oQ+E/DkoW4n/Ah7ie7fX6tAqpb4He+u11cVtZh1o76irg8Sn7N60H+sKmNBfwfonMtrQ9G2Wt3v
 GhfdN9TPB3Drtww==
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
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm/mach-pxa/gumstix.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-pxa/gumstix.c b/arch/arm/mach-pxa/gumstix.c
index c9f0f62187bd..0bca6e2c80a9 100644
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
 
@@ -129,6 +129,11 @@ static void gumstix_udc_init(void)
 #endif
 
 #ifdef CONFIG_BT
+GPIO_LOOKUP_SINGLE(gumstix_bt_gpio_table, "pxa2xx-uart.1", "pxa-gpio",
+		GPIO_GUMSTIX_BTRESET, "BTRST", GPIO_ACTIVE_LOW);
+
+static struct gpio_desc *bt_reset;
+
 /* Normally, the bootloader would have enabled this 32kHz clock but many
 ** boards still have u-boot 1.1.4 so we check if it has been turned on and
 ** if not, we turn it on with a warning message. */
@@ -153,24 +158,19 @@ static void gumstix_setup_bt_clock(void)
 
 static void __init gumstix_bluetooth_init(void)
 {
-	int err;
+	gpiod_add_lookup_table(&gumstix_bt_gpio_table);
 
 	gumstix_setup_bt_clock();
 
-	err = gpio_request(GPIO_GUMSTIX_BTRESET, "BTRST");
-	if (err) {
+	bt_reset = gpiod_get(&pxa_device_btuart.dev, "BTRST", GPIOD_OUT_HIGH);
+	if (IS_ERR(bt_reset)) {
 		pr_err("gumstix: failed request gpio for bluetooth reset\n");
 		return;
 	}
 
-	err = gpio_direction_output(GPIO_GUMSTIX_BTRESET, 1);
-	if (err) {
-		pr_err("gumstix: can't reset bluetooth\n");
-		return;
-	}
-	gpio_set_value(GPIO_GUMSTIX_BTRESET, 0);
+	gpiod_set_value(bt_reset, 1);
 	udelay(100);
-	gpio_set_value(GPIO_GUMSTIX_BTRESET, 1);
+	gpiod_set_value(bt_reset, 0);
 }
 #else
 static void gumstix_bluetooth_init(void)

-- 
2.42.0



