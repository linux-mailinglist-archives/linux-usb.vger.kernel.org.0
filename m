Return-Path: <linux-usb+bounces-1465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2097C5536
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 15:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47EEB1C20EE9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 13:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15321F931;
	Wed, 11 Oct 2023 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DEB1F17E
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 13:24:07 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027389E;
	Wed, 11 Oct 2023 06:24:05 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 27B6E83D9B;
	Wed, 11 Oct 2023 15:24:04 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Wed, 11 Oct 2023 15:23:46 +0200
Subject: [PATCH RFT v8 2/6] ARM: pxa: Convert Spitz LEDs to GPIO
 descriptors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231011-pxa-gpio-v8-2-eed08a0fcac8@skole.hr>
References: <20231011-pxa-gpio-v8-0-eed08a0fcac8@skole.hr>
In-Reply-To: <20231011-pxa-gpio-v8-0-eed08a0fcac8@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=2i2mzqzeK5dKls1oQllrI2VaEq4mqrMjUDr4Yj1khYo=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlJqHoeXC5/SuJUFyiywTo7tDbkBQsYucN+zAMe
 ts4o/BsUE6JAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZSah6AAKCRCaEZ6wQi2W
 4UYHD/49wIrHmeNOmaf6udOGaV3KZpISkBwOENe5AldQXqVIw5VAGUWTUGSvzElbHdFFoXvX5u2
 vPNhfGKDzjEkzNoJ24IxCAF4J8Q5TtgISR1s+/pYB3EQ1+jUJswQy7bDv9oQlQT+ZvL8RgPV2Jc
 56GQ7LFh4or+WvAVp4RLgs085tF35aR0g75QT6Ovq1+RaUKzbUUyhbcL4WwFPpB5GYXsKl3lVr4
 xhVsnFtSicfeieZTFr6jAe8Jr1O2jZnVU1u6WCSO8rnHLG3FZXVDBnrNtqAQyONwXvQtqaTikW6
 aqfaQxJ5PM0eAZFfsGhCg1GIBzccUrjwzt7doP9F4YhFaE7cRUgsqTU6a22/s/RQtjFRaAgSm0d
 +hFe9aaQutooNStUV3WriC/LXSmddJq7y8IybNfZnyHHhiHkgR9K+pJyQqzYyVcQLjk+tThMx3e
 tGEl2hzV3/V1nkihQWTGFoUrE0HoYyJockIehjpv1IkS2K9CxN7up8UEEtUaPVYCVcwdt5WQL8o
 r2UNgVMJDHfPumDZNjiEu5Wnjehga0jJH+sN/oob1cPK2DfSpkE1k+PiU3txzGUyR1qELKTqEAs
 II5/plNTxcCtsbBi79QsaqjJ7bCFfeo54Q3bUJONdo5pXoJR6lMXLJyOnQnhCW2nqlC4vvjAA5S
 iCno2CxAKmDTxdA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Sharp's Spitz board still uses the legacy GPIO interface for configuring
its two onboard LEDs.

Convert them to use the GPIO descriptor interface.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm/mach-pxa/spitz.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 535e2b2e997b..9efd603c715a 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -452,16 +452,25 @@ static inline void spitz_keys_init(void) {}
  * LEDs
  ******************************************************************************/
 #if defined(CONFIG_LEDS_GPIO) || defined(CONFIG_LEDS_GPIO_MODULE)
+static struct gpiod_lookup_table spitz_led_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("pxa-gpio", SPITZ_GPIO_LED_ORANGE, NULL, 0,
+				GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("pxa-gpio", SPITZ_GPIO_LED_GREEN, NULL, 1,
+				GPIO_ACTIVE_HIGH),
+		{ }
+	}
+};
+
 static struct gpio_led spitz_gpio_leds[] = {
 	{
 		.name			= "spitz:amber:charge",
 		.default_trigger	= "sharpsl-charge",
-		.gpio			= SPITZ_GPIO_LED_ORANGE,
 	},
 	{
 		.name			= "spitz:green:hddactivity",
 		.default_trigger	= "disk-activity",
-		.gpio			= SPITZ_GPIO_LED_GREEN,
 	},
 };
 
@@ -480,6 +489,7 @@ static struct platform_device spitz_led_device = {
 
 static void __init spitz_leds_init(void)
 {
+	gpiod_add_lookup_table(&spitz_led_gpio_table);
 	platform_device_register(&spitz_led_device);
 }
 #else

-- 
2.42.0



