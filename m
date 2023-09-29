Return-Path: <linux-usb+bounces-766-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A27B333F
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 15:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 89E321C20A32
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 13:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDD91A735;
	Fri, 29 Sep 2023 13:15:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E950C1A5A5
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 13:15:14 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75861B5;
	Fri, 29 Sep 2023 06:15:11 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 53D598348A;
	Fri, 29 Sep 2023 15:15:10 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Fri, 29 Sep 2023 15:14:03 +0200
Subject: [PATCH RFC v3 5/6] ARM: pxa: Convert Spitz hsync to GPIO
 descriptors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230929-pxa-gpio-v3-5-af8d5e5d1f34@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=NMVwZ6uSKQb1sBoOjO7it3qE3OIABseOJrIHnJKgy24=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlFs3X897QJzOUWADVn5rHWt6cyl1VYEt1hVHDp
 jUFeQYRlyKJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZRbN1wAKCRCaEZ6wQi2W
 4U8uD/9dFJ8dmhfP4EqRksHodrWdwnA2hLySE6WMagwcZgKqbDHUExpZh9hpG8UlqtnKk61Iqa+
 wVNRXlqd6xeO/UoF87brssvsOQupZKjaftwsXqlHWkBUxVgDXo894Jqp5yXNyxqORU8em15lrnB
 wD1t4c+0MGHjKhQP2yeAFPfk57Vaxov0ATbotwG7dNswh/1EgXikHgVRebJuX7C1Bd5095ZHSou
 v9EV1HvdewXVQMyYgcxBn6yFG3Pr9huhfDn+IGvncSbIMGNDGHQkJ8NrrhfdjO7SVHUCKhr26Oe
 wBQ/ZUxQ5Oa+abZLWExcTErbXBGUJlI8CgkJfO5CBR8wrQaGLbp6OatL47Ke3mbjrCY7foDYbcG
 Z//oz8734x17BEFvPJ3Q9BknHg++5Dycc5pVBcyCvLxiBAAAndKo7Sr5jYLLthSUwCcpnla6j1F
 CmnN8eQPe7+Fi5Ar4qDBRRkhElu0eM6aBOknoOZo4UVprmfE7yoTEHyD8Vyfs37Pfs7cc26lxyh
 U+dTdCxBuGgwz8a7JfZDhLqg4VpNhRiLSLZ8CVPHJTpU7z1k33Rs1B9eBLm3ojkUttKDZAgnrmi
 5B48oJVIVxT+DhOoJRw5zreFKBcW6p36IrJ4ZFflX6Z559CSq4LQbrTTDbvDOU3sveo9bG1j2v4
 A1TciqL+9UD/g5w==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Sharp's Spitz still uses the legacy GPIO interface in its
wait_for_hsync() function.

Convert it to use the GPIO descriptor interface.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm/mach-pxa/spitz.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index c789eeaf3c2c..25878daec986 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -520,12 +520,14 @@ static inline void spitz_leds_init(void) {}
  * SSP Devices
  ******************************************************************************/
 #if defined(CONFIG_SPI_PXA2XX) || defined(CONFIG_SPI_PXA2XX_MODULE)
+static struct gpio_desc *hsync;
+
 static void spitz_ads7846_wait_for_hsync(void)
 {
-	while (gpio_get_value(SPITZ_GPIO_HSYNC))
+	while (gpiod_get_value(hsync))
 		cpu_relax();
 
-	while (!gpio_get_value(SPITZ_GPIO_HSYNC))
+	while (!gpiod_get_value(hsync))
 		cpu_relax();
 }
 
@@ -543,6 +545,8 @@ static struct gpiod_lookup_table spitz_ads7846_gpio_table = {
 	.table = {
 		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_TP_INT,
 			    "pendown", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_HSYNC,
+			    "hsync", GPIO_ACTIVE_LOW),
 		{ }
 	},
 };
@@ -622,8 +626,13 @@ static void __init spitz_spi_init(void)
 
 	gpiod_add_lookup_table(&spitz_ads7846_gpio_table);
 	gpiod_add_lookup_table(&spitz_spi_gpio_table);
+	hsync = gpiod_get(NULL, "hsync", GPIOD_IN);
 	pxa2xx_set_spi_info(2, &spitz_spi_info);
-	spi_register_board_info(ARRAY_AND_SIZE(spitz_spi_devices));
+	if (IS_ERR(hsync)) {
+		pr_err("Failed to get hsync GPIO: %ld\n", PTR_ERR(hsync));
+		spi_register_board_info(ARRAY_AND_SIZE(&spitz_spi_devices[1]));
+	} else
+		spi_register_board_info(ARRAY_AND_SIZE(spitz_spi_devices));
 }
 #else
 static inline void spitz_spi_init(void) {}

-- 
2.42.0



