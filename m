Return-Path: <linux-usb+bounces-25961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C7B0A7AE
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jul 2025 17:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1DBC5C0C75
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jul 2025 15:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA362E0B5C;
	Fri, 18 Jul 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gEMvo0fR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE2E2DEA87
	for <linux-usb@vger.kernel.org>; Fri, 18 Jul 2025 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852559; cv=none; b=W025H8DC42w0nC3C5Uxc435CldK4+Qi8KdkccT5ou2DpdBhnLbyllEP5BMHr4uNUREn90ItoRfVblmQVu3d2kOqc7Rbu6tp/a+4vrnFaSCb09LYcL7umlAoZ7IOXGa+OtbEoHISBcyz0owe3thWlnpDzB9487EfC5LCLqjeqkTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852559; c=relaxed/simple;
	bh=pNWBmdX42Cj+KseLmy2wDdUnAJ44WfaEn1AkZMwCBLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiDVU30tUE67bGExA89J08nWHnUs5qsqeJm8k/18eipOz8H7hpf1Ky01FJSOLiwq5nNZqCLejd1tZf+4SryGu64CMLAMYiFroRi6ikBu9TywXonc1mc5KIOUSmjeygTWKN+oGgB59seI98kyZSz605osSeH+LGc/wDYn+FUD+Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gEMvo0fR; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32f2947ab0bso16963121fa.3
        for <linux-usb@vger.kernel.org>; Fri, 18 Jul 2025 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752852554; x=1753457354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqRz3QcZGu1A4x3k8lELm1/fHH2/qOSuF/RSy3k5QzI=;
        b=gEMvo0fRIMhgTETXDuNr85oYQMgl2DY4ybIn/wZFJJFTAtFsIYV1OYoR0yw7ND4cy+
         YRZ1wBpehsRSqt1Uo8ZJaR7JrJCUDJG5tvdUt0TiIXfFZ00sf9ibRP21Y3B/gBkJZfEZ
         JRUoc/ZhD6qe0F9wWMTvXrAEhRklqe8Nyu5L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852554; x=1753457354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqRz3QcZGu1A4x3k8lELm1/fHH2/qOSuF/RSy3k5QzI=;
        b=f86da/0WSPiKMusGXPUUFLyQuwwZfPTtzdaHyb2lfQQ4hNLHckDRTn63QEE9I6iK6w
         uMmKuheU0WwU/rhlzLqPzC7hfWUuXs2a1QriOP6n4RcwzBoI/QVhcffZr4F2CoYIh+2E
         EuF/JTrrJdLbDEYMbaIybd7eecBeC/hsaSvTearQtrdd6F9X8ciXsPgGBYrw2k6NtVNk
         hKuNoGSoItAWtTNPCxFr5Yeyo0m0kUU2z4YLPdtseeswJrkljjCG+UlHUYPNXsyWnzBp
         Va43cPs9ryJIXQU7fbch3Yo4nzkG23B1/9k2lwsFu3MAW/AfKQuO7zs35umiC4RKy/bI
         emPA==
X-Forwarded-Encrypted: i=1; AJvYcCUPQPAkiSOwwxNobtcaFat8f7FBdKijlejUGAuse+wDFl2oacM44JIXmhuT1rT8bODcMdG3FX7iLe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlzMNxXvPnejSdGgqtlODi7DAUekUoN59isoT/TADqQBZFpMMR
	hsfw568pMZwCnBKDh+X2OzGfJqxjj3QKrmrCZpXlJESxvSD3wXBcjoMeDQgujRPHWw==
X-Gm-Gg: ASbGnctrRbAQpfeQQcWY1Kg6lO/a7UNbzb49q3iGgYSsfGUfl8lTEdReKlOPXFVirr3
	BizKHbk7S5VpRBSc3e0qDGZ8fVt1hDX62h2v9jNBKL6ILIBkhZmXqhd8BPWCcl2svXPM95SnR+J
	YU9eV2daiE3KA/Ja7bQgNxnfxnuvcH8bK93gVCyKklbILVaDLCts+o4jddZhRJ3yn0t+z0tQSB1
	gWGe89yYKDRmNAKhJAPz7rJ0dcZ7Cs5HmR1qdoaYZw+XgHKA03SQ2nNCcJ7Yrw+s66LIgrcYG10
	8GI6hNJsXpzGCaO6S0+0SZa8SXB/CmRJpdU98DBHp847QFW9uLIrLEg+L0eHfROh0ZWWElj77kL
	s+pkgOqg9EAT+VavYLv9TMr5QPRhNNM7VyPLRRw/uyX96DYiCJ/nXguNdTYdUDGMzqO3iS5wH1C
	sA6w==
X-Google-Smtp-Source: AGHT+IGA7XztOVyOIPvb4xLSiXHvQAev7YDG3YfYcgQpFwjP++W4a2HDWR+o1xYxe5fn/E4j4pB5pg==
X-Received: by 2002:a05:651c:40ce:b0:32b:9e00:1237 with SMTP id 38308e7fff4ca-3308f5f87d4mr29011591fa.32.1752852554263;
        Fri, 18 Jul 2025 08:29:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9d6dsm2268601fa.83.2025.07.18.08.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:29:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Jul 2025 15:29:12 +0000
Subject: [PATCH v5 3/5] media: uvcvideo: Introduce
 UVC_QUIRK_PRIVACY_DURING_STREAM
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-uvc-subdev-v5-3-a5869b071b0d@chromium.org>
References: <20250718-uvc-subdev-v5-0-a5869b071b0d@chromium.org>
In-Reply-To: <20250718-uvc-subdev-v5-0-a5869b071b0d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, linux-gpio@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

Some devices power the GPIO pull-up with the same power-supply as the
camera. Avoid reading the GPIO if the device is not streaming.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_gpio.c  | 58 ++++++++++++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_video.c |  4 +++
 drivers/media/usb/uvc/uvcvideo.h  |  4 +++
 3 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
index 93727185b9125d5a0ebf7fcede5ed8983ecddd5f..f575b848058f48e3b73a6793e59d25a3eed1c61a 100644
--- a/drivers/media/usb/uvc/uvc_gpio.c
+++ b/drivers/media/usb/uvc/uvc_gpio.c
@@ -5,6 +5,7 @@
  *      Copyright 2024 Google LLC
  */
 
+#include <linux/dmi.h>
 #include <linux/kernel.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
@@ -16,6 +17,9 @@ static irqreturn_t uvc_gpio_irq(int irq, void *data)
 	struct uvc_gpio *uvc_gpio = &dev->gpio_unit->gpio;
 	int new_val;
 
+	if (!uvc_gpio->gpio_ready)
+		return IRQ_HANDLED;
+
 	new_val = gpiod_get_value_cansleep(uvc_gpio->gpio_privacy);
 	if (new_val < 0)
 		return IRQ_HANDLED;
@@ -26,6 +30,24 @@ static irqreturn_t uvc_gpio_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const struct dmi_system_id privacy_valid_during_streamon[] = {
+	{
+		.ident = "HP Elite c1030 Chromebook",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Jinlon"),
+		},
+	},
+	{
+		.ident = "HP Pro c640 Chromebook",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dratini"),
+		},
+	},
+	{ } /* terminate list */
+};
+
 int uvc_gpio_parse(struct uvc_device *dev)
 {
 	struct gpio_desc *gpio_privacy;
@@ -51,6 +73,15 @@ int uvc_gpio_parse(struct uvc_device *dev)
 	if (!unit)
 		return -ENOMEM;
 
+	/*
+	 * Note: This quirk will not match external UVC cameras,
+	 * as they will not have the corresponding ACPI GPIO entity.
+	 */
+	if (dmi_check_system(privacy_valid_during_streamon))
+		dev->quirks |= UVC_QUIRK_PRIVACY_DURING_STREAM;
+	else
+		unit->gpio.gpio_ready = true;
+
 	unit->gpio.gpio_privacy = gpio_privacy;
 	unit->gpio.irq = irq;
 	strscpy(unit->name, "GPIO", sizeof(unit->name));
@@ -61,6 +92,16 @@ int uvc_gpio_parse(struct uvc_device *dev)
 	return 0;
 }
 
+void uvc_gpio_quirk(struct uvc_device *dev, bool stream_on)
+{
+	if (!dev->gpio_unit || !(dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM))
+		return;
+
+	dev->gpio_unit->gpio.gpio_ready = stream_on;
+	if (stream_on)
+		uvc_gpio_irq(0, dev);
+}
+
 int uvc_gpio_init(struct uvc_device *dev)
 {
 	struct uvc_entity *unit = dev->gpio_unit;
@@ -70,10 +111,6 @@ int uvc_gpio_init(struct uvc_device *dev)
 	if (!unit || unit->gpio.irq < 0)
 		return 0;
 
-	init_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
-	if (init_val < 0)
-		return init_val;
-
 	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
 				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
 				   IRQF_TRIGGER_RISING,
@@ -81,6 +118,19 @@ int uvc_gpio_init(struct uvc_device *dev)
 	if (ret)
 		return ret;
 
+	if ((dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)) {
+		uvc_gpio_quirk(dev, false);
+		init_val = false;
+	} else {
+		unit->gpio.gpio_ready = true;
+
+		init_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
+		if (init_val < 0) {
+			free_irq(unit->gpio.irq, dev);
+			return init_val;
+		}
+	}
+
 	input_report_switch(dev->input, SW_CAMERA_LENS_COVER, init_val);
 	input_sync(dev->input);
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2e377e7b9e81599aca19b800a171cc16a09c1e8a..516cf9bccc25ce2b7c82a3f97826e77287bdd1af 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -2356,6 +2356,8 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
 	if (ret < 0)
 		goto error_video;
 
+	uvc_gpio_quirk(stream->dev, true);
+
 	return 0;
 
 error_video:
@@ -2368,6 +2370,8 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
 
 void uvc_video_stop_streaming(struct uvc_streaming *stream)
 {
+	uvc_gpio_quirk(stream->dev, false);
+
 	uvc_video_stop_transfer(stream, 1);
 
 	if (stream->intf->num_altsetting > 1) {
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index aca857d3f5608550faa5241f3b515bb9837f70ab..827ea2eb676c81cabb8051485b6e6813e9c6dca8 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -79,6 +79,7 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_PRIVACY_DURING_STREAM	0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -242,6 +243,7 @@ struct uvc_entity {
 		struct uvc_gpio {
 			int irq;
 			bool initialized;
+			bool gpio_ready;
 			struct gpio_desc *gpio_privacy;
 		} gpio;
 	};
@@ -820,10 +822,12 @@ size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 int uvc_gpio_parse(struct uvc_device *dev);
 int uvc_gpio_init(struct uvc_device *dev);
 void uvc_gpio_deinit(struct uvc_device *dev);
+void uvc_gpio_quirk(struct uvc_device *dev, bool stream_on);
 #else
 static inline int uvc_gpio_parse(struct uvc_device *dev) {return 0; }
 static inline int uvc_gpio_init(struct uvc_device *dev) {return 0; }
 static inline void uvc_gpio_deinit(struct uvc_device *dev) {};
+static inline void uvc_gpio_quirk(struct uvc_device *dev, bool stream_on) {};
 #endif
 
 #endif

-- 
2.50.0.727.gbf7dc18ff4-goog


