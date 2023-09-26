Return-Path: <linux-usb+bounces-594-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA907AEFF5
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 17:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id D4791281E39
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 15:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3895930D1A;
	Tue, 26 Sep 2023 15:46:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5C30CFF
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 15:46:49 +0000 (UTC)
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B15126;
	Tue, 26 Sep 2023 08:46:46 -0700 (PDT)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 7BABD836FC;
	Tue, 26 Sep 2023 17:46:36 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Tue, 26 Sep 2023 17:46:27 +0200
Subject: [PATCH RFC v2 6/6] ARM: pxa: Convert gumstix Bluetooth to GPIO
 descriptors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230926-pxa-gpio-v2-6-984464d165dd@skole.hr>
References: <20230926-pxa-gpio-v2-0-984464d165dd@skole.hr>
In-Reply-To: <20230926-pxa-gpio-v2-0-984464d165dd@skole.hr>
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
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlEvzXcuEUSDa/D4G1iSz3FE96zRXUsszhKfvO/
 cfAj0gBIZWJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZRL81wAKCRCaEZ6wQi2W
 4T5tD/9Sqn/4LVKN8ztfsrZ5hkncZIFXvDxSfs5cOa2nTPv38vr826JczlpZafwRDsS8+m5RD6M
 pzXm4nww5abZCdDcJTjAOyh+G2Jr0Sukz/NUu3780UqtwoQ+Jdw62DMHDR1a+C5mLROhhpiwF4u
 5ZbYAok22ye3Bu4GCTkJYXO88pqUbQz+/7fE/hDRVubiGxgTkkctd7zspd/yc3a9FFGMfqvASoB
 ZkPrDWyeQLAk8kjERXayQ1lXmkwkCf0XfecgtURaxZ8W9XAkLgZD1hLKoJJE06Ef9P0AlqBKzv/
 boRgyucdS8SOG3tyvZa8ZYBNlIp1clSVAAh0yYrxjWluTWIZVVtcPkr3qpPXd1DdZqgvxZKlq4s
 AWNWUgDIN6KblADH5NVyy7tL+Pt3AtDKM/h75b03cnvrD7r33DG0oymTR4zDJ7WaZMs2mp7eNc1
 BuY0jk+gbzDrZf3a355NboaHrrr5LgKV9XVWicQ/Ru/EWi27TIuEn+4chKdAq6v9RAXzREL64EX
 FKevE9Kkoj2eLNkT/yXAWz7AP7op8fVP/KkyvlG84Fvyn9quSOuYkYclYvzCpj/LljmKvywccGa
 HL9Oyy5lEqU5oCMNzgE+K+B49J7FNd8aE61WT87uPQWJlpxA5NciewsTw/5M4+83IvI9dcQmUdl
 oVVYhEoJPJdNUFA==
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



