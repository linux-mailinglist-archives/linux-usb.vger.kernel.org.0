Return-Path: <linux-usb+bounces-1470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA6D7C554C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 15:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E2891C20ED9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 13:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91AAB200B1;
	Wed, 11 Oct 2023 13:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E91F17E
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 13:24:11 +0000 (UTC)
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DD0B0;
	Wed, 11 Oct 2023 06:24:09 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 5C77683D57;
	Wed, 11 Oct 2023 15:24:08 +0200 (CEST)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Wed, 11 Oct 2023 15:23:50 +0200
Subject: [PATCH RFT v8 6/6] input: ads7846: Move wait_for_sync() logic to
 driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231011-pxa-gpio-v8-6-eed08a0fcac8@skole.hr>
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
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4335;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=hLQnV8iEM0wjd0pcahGJ4bctZFgXhk/IhBNsSp9HwMo=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlJqHoRDOmjVTvSFHLzr6aNcs+5NQri6sp9mYBE
 d4+Myg3UfCJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZSah6AAKCRCaEZ6wQi2W
 4TY+EACKSGTfTH+rg84nsBegzJzGn4jdak4ozwgaSyl0X+Qsqg4Ed+fUZoKlE1VWLm80AK2ugCM
 +ronDsIxKMQPtBS6MRLHKLb5Qc40wxqUzE5o2HlGdUm3pr/Im8/bf0R2i2aHSCds/4hQ30VFHOg
 ZaSk8i0FR7AhwIQQZ2Q5Ua87DdsKZ1uyzUZLCvNf+4mLMpIwWqR6AFMdQ8VZR1j9vcQfJVhW6w8
 ivI9lEddh1cwOKGMqvvxVYQBFxSr7it/7cIef21dYZGJjGmjhfNXCUhjRNcVO8Xj18erGEHwj7e
 nATrU8AgUYOTLk/3z5BBq/PffcAhG5oNTCB5SZknLHBgLfdh6PFMc7x0gbTPfo2ghER651gYiwo
 G7WT4YBH4AIosPE9RMnTH2uzzwvoIS3FKAtYt2et/qCOqW+KvQuQVwnL1UFUGRB+IBrrH9xqCfW
 dezRYJ8kMHeP9oaLw+YJ/Ze6BvO74n/6zfB3ixGTedJSYqIVPs0cyMYngS9Sh/wOQbMTiuwPGbQ
 J1xcjpYfJrvus4o1fslhZP93eW2umXac2Co3zYpQC+v7YZGnbO7tDUi8gRQcJ7ovkT/tbxe/K/y
 UFShYT5mJ2D30DRbsSATabOzLN+hSLGhh5Cyy9qG/eUN7fvAs4LZQtyQkDzznp0iDtuoLscRJHF
 phEFsqG8Ljp69wA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

If this code is left in the board file, the sync GPIO would have to be
separated into another lookup table during conversion to the GPIO
descriptor API (which is also done in this patch).

The only user of this code (Sharp Spitz) is also converted in this
patch.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm/mach-pxa/spitz.c           | 12 ++----------
 drivers/input/touchscreen/ads7846.c | 22 +++++++++++++++-------
 include/linux/spi/ads7846.h         |  1 -
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index acb2b5495dbe..e086a13950d2 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -516,22 +516,12 @@ static inline void spitz_leds_init(void) {}
  * SSP Devices
  ******************************************************************************/
 #if defined(CONFIG_SPI_PXA2XX) || defined(CONFIG_SPI_PXA2XX_MODULE)
-static void spitz_ads7846_wait_for_hsync(void)
-{
-	while (gpio_get_value(SPITZ_GPIO_HSYNC))
-		cpu_relax();
-
-	while (!gpio_get_value(SPITZ_GPIO_HSYNC))
-		cpu_relax();
-}
-
 static struct ads7846_platform_data spitz_ads7846_info = {
 	.model			= 7846,
 	.vref_delay_usecs	= 100,
 	.x_plate_ohms		= 419,
 	.y_plate_ohms		= 486,
 	.pressure_max		= 1024,
-	.wait_for_sync		= spitz_ads7846_wait_for_hsync,
 };
 
 static struct gpiod_lookup_table spitz_ads7846_gpio_table = {
@@ -539,6 +529,8 @@ static struct gpiod_lookup_table spitz_ads7846_gpio_table = {
 	.table = {
 		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_TP_INT,
 			    "pendown", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("gpio-pxa", SPITZ_GPIO_HSYNC,
+			    "sync", GPIO_ACTIVE_LOW),
 		{ }
 	},
 };
diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index faea40dd66d0..139b0f3735d0 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -138,8 +138,7 @@ struct ads7846 {
 	void			*filter_data;
 	int			(*get_pendown_state)(void);
 	struct gpio_desc	*gpio_pendown;
-
-	void			(*wait_for_sync)(void);
+	struct gpio_desc	*sync;
 };
 
 enum ads7846_filter {
@@ -636,9 +635,15 @@ static const struct attribute_group ads784x_attr_group = {
 };
 
 /*--------------------------------------------------------------------------*/
-
-static void null_wait_for_sync(void)
+static void ads7846_wait_for_sync_gpio(struct ads7846 *ts)
 {
+	if (!ts->sync)
+		return;
+	while (!gpiod_get_value(ts->sync))
+		cpu_relax();
+
+	while (gpiod_get_value(ts->sync))
+		cpu_relax();
 }
 
 static int ads7846_debounce_filter(void *ads, int data_idx, int *val)
@@ -803,7 +808,7 @@ static void ads7846_read_state(struct ads7846 *ts)
 	packet->last_cmd_idx = 0;
 
 	while (true) {
-		ts->wait_for_sync();
+		ads7846_wait_for_sync_gpio(ts);
 
 		m = &ts->msg[msg_idx];
 		error = spi_sync(ts->spi, m);
@@ -1261,8 +1266,6 @@ static int ads7846_probe(struct spi_device *spi)
 		ts->penirq_recheck_delay_usecs =
 				pdata->penirq_recheck_delay_usecs;
 
-	ts->wait_for_sync = pdata->wait_for_sync ? : null_wait_for_sync;
-
 	snprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(dev));
 	snprintf(ts->name, sizeof(ts->name), "ADS%d Touchscreen", ts->model);
 
@@ -1361,6 +1364,11 @@ static int ads7846_probe(struct spi_device *spi)
 	if (err)
 		return err;
 
+	ts->sync = devm_gpiod_get_optional(dev, "sync", GPIOD_IN);
+	if (IS_ERR(ts->sync))
+		return dev_err_probe(dev, PTR_ERR(ts->sync),
+				"Failed to get sync GPIO");
+
 	err = input_register_device(input_dev);
 	if (err)
 		return err;
diff --git a/include/linux/spi/ads7846.h b/include/linux/spi/ads7846.h
index a04c1c34c344..fa7c4f119023 100644
--- a/include/linux/spi/ads7846.h
+++ b/include/linux/spi/ads7846.h
@@ -38,7 +38,6 @@ struct ads7846_platform_data {
 	int	gpio_pendown_debounce;	/* platform specific debounce time for
 					 * the gpio_pendown */
 	int	(*get_pendown_state)(void);
-	void	(*wait_for_sync)(void);
 	bool	wakeup;
 	unsigned long irq_flags;
 };

-- 
2.42.0



