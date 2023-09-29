Return-Path: <linux-usb+bounces-764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6C7B333C
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 15:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 80AD3283A96
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 13:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CF01A5AB;
	Fri, 29 Sep 2023 13:15:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419ED1A593
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 13:15:13 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8611AE;
	Fri, 29 Sep 2023 06:15:09 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 1860A8347F;
	Fri, 29 Sep 2023 15:15:07 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Fri, 29 Sep 2023 15:14:00 +0200
Subject: [PATCH RFC v3 2/6] ARM: pxa: Convert Spitz LEDs to GPIO
 descriptors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230929-pxa-gpio-v3-2-af8d5e5d1f34@skole.hr>
References: <20230929-pxa-gpio-v3-0-af8d5e5d1f34@skole.hr>
In-Reply-To: <20230929-pxa-gpio-v3-0-af8d5e5d1f34@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=YWNiyCxNsU8MmTyH6WiBM69WsGVSRGwp1wU7bY9Kw6M=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlFs3X304DDyKC0uR3vS5VnlJD0Kr4pUR83cnSQ
 +onNw+6IouJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZRbN1wAKCRCaEZ6wQi2W
 4cz7D/9dlWMHeVtBJISPMPBb2V0Fewc86D8PHtoymudyxNY/zXJorP8gXwAeLzFO5Wq98rmVydH
 JoJK5cRb80YmAYzv2bpZgngOTq35c0C9NsMMRHADjSdGJRuK2533R9i8vUkeAUnyMPD9FGWagpm
 b3iAMl5681X2j4N+ViX3U7yiFixVGh0nZ+vIlwr496uZnzORKwmyYHxtlmZQwhKSFeJw206QBny
 wp1LdI9yrKxUL1WG8Tm2hThodNRRetvVwpPJty3Ws0XrbeeKhKlre3tpES+9ZCSmRSMn3FZT/F1
 IPRcKg21Dya5uVmHGy1zMI6LuXgoP/SAJFmwByIQKnX7UMXm4NAQEhsXRdCYJFOHhk9yMwYGkW7
 R92Qo+TwviwPxdRrIf3KrUSWcr5BeoE2uQCakkb7y1scyQ1Jdm4yvrgVd/A7tiNMa7n/j9P4uU4
 n/wKY3RQbFC3qwQPhZcmc0PGJRUSNBtMBIzY3wzHP4639HvE+sFfDMb8/Eedp+wrhkZndOvTVLd
 6k8TGYR5k8OwX5YbVr+fnpp/ldpv/7bwwxeRFVMm2359yd1ycnhtnT5O6//qWw4Tg9EbOXysQdg
 qcbhwoIrhwWH/+xaIxvRyWdfNUKAK/8DSQG06tv0gtDgnT+D3zVMUP6EwEgzxiDvo4NLgqAULXO
 Ph/GeU0YokOlDVA==
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

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm/mach-pxa/spitz.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 535e2b2e997b..6aa4a3a9f7aa 100644
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
 
@@ -480,6 +489,11 @@ static struct platform_device spitz_led_device = {
 
 static void __init spitz_leds_init(void)
 {
+	gpiod_add_lookup_table(&spitz_led_gpio_table);
+	spitz_gpio_leds[0].gpiod = gpiod_get_index(&spitz_led_device.dev,
+			NULL, 0, GPIOD_ASIS);
+	spitz_gpio_leds[1].gpiod = gpiod_get_index(&spitz_led_device.dev,
+			NULL, 1, GPIOD_ASIS);
 	platform_device_register(&spitz_led_device);
 }
 #else

-- 
2.42.0



