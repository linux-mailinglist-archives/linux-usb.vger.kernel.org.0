Return-Path: <linux-usb+bounces-25554-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 058A4AFBAD7
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 20:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B0451AA8366
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 18:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6B1279346;
	Mon,  7 Jul 2025 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZBFLNEG3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFD3271A9A
	for <linux-usb@vger.kernel.org>; Mon,  7 Jul 2025 18:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751913250; cv=none; b=JfrKEBp8rYDZ4u1DWY1R70vFulQer55Qxk3qV29+lfTg03ZNzy0+GIK7xK5UOqanvMLWZgYRqtxJ+0AGc6WFJNvwBapamMvwdrzAgdH8jPC94aVI+eJsk5LoZx+1Bne6ph2kPzgtNDYFRYLBDZRXLNE0fH1QUikQRSJKz1538wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751913250; c=relaxed/simple;
	bh=sVG3jXB7G5g5VkbTuzz7YugXFtGc7x/LVOgePX3jelA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uAgJvx31Q+7jD7heFbW3i1/KFGSYP6d3noy9dVgt//3vPlH4Obho7h2ELLEF10bM3sQ+OvamMjhtDfQXRlXcqTVm5mFbSzKaWyaZu43Kpf5VkHPexYHFmMYZPhscObSMaRbXuqtP/ukmkfik39hdlDOacevJTrn72tIhq1/G784=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZBFLNEG3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b10594812so4285983e87.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 11:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751913245; x=1752518045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPIaOyTFadqUjMfdacN75cl1wBFQWTU+JWrkSX4D/W4=;
        b=ZBFLNEG35hnvby1Y3HSJ8IKqvtDwfp5sbN7xUI8nCARUgOZmGNXy+kBaMV0w6N6cXG
         gKeSxnBSvYh/n/we88HN4VUsh2ZLqo9tX1NVsFKjSEpyi9duCnb/Mn8pVzK1M1fSEFxP
         MSUKkEXvCosXWNJHVTY1Q+dWas6Ez7vMJO6ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751913245; x=1752518045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPIaOyTFadqUjMfdacN75cl1wBFQWTU+JWrkSX4D/W4=;
        b=mQSRxBh3fKldvBL0ZwJiMkIg6la/CAIK1E7PMMyTLUE/YAho07WpFkv4B6bbOC4yjo
         zYEN5KOWGj/K0VXDqK2060XhNWj6Iv27g1h1wey1yzXAciatv1HcegsaYkSGDSwom01R
         5EkV5FgL0pK3TEuz1j/Blk29vz+qdM1L7CuLNgB6E8evLbAry8WYZ60YVA9HeFQmDY/h
         qe8HZgLJwa60ep4hOhSq6HgT9fEmsvL0peOk+I2dQ3DFnvMGhBXJYhETuqW95kz8hMg0
         zm8OMV6dmspk6QL5OJ7NfxVrsmKqpYLaQ1Xkd2+kMC/5yUlSnG3GvwOSfrmL0SuUA5sQ
         Zd/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLR4o3unTPHjuY3v838cvXuV7W8Idsq1dK6o4iVCyUx2rTzJyMUsAnfwj6Shzjfk0znR6NraeCD3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE8r9tavpQs8sZCLEIZpLP9GJlPzz4kccK6tHSw58pXRU1VDK7
	t3dRd8DFpVJRsbIsilacGzMEf6L2sKAFO1unvgw3YVRh24z0oqumerSbuuD+pp7p/w==
X-Gm-Gg: ASbGncsXG0gD1yveHsnAAT1cthra0RMCKrsKiGGjYgzCeNJdFJdlewc9Hk40l3ozJ10
	utzKg4Q3V7o5JTQ0rzWqboyAROrhLNc3Tsh5Eox1bRF8+Osf0/82GmjZx8HPe+kWfNBzU4GOzxd
	jFJGdbks1ZzscS2xR1Ct5l8I6s0OO2rEY2RQriWC1fmKpQoad3+5Iy6ikwQuNEJcrUY+VGkjMFV
	F+g8Ij4iHW0++LP/UVe+09lMJzqA44vDVCecRpJUbHRhHycEeFncmyXSLJ3d51x8V8GvFxmIBmB
	IhqkEBH81KXqdr1ENV9XC8iQ3JLvtq6zTsnIteia1xELJdHWd4isLRrAYnzjxvKnt8PjGXNTHdk
	yH9HwqAvyxqNElNkSUtas+xxegrZhYWIxGOtAu7qtlw==
X-Google-Smtp-Source: AGHT+IE4uyqyZpucH4y+ZvlBsX58kvvph8A860fajfAiOIZDRFqwIHkUsRPLwiIFiVEjP0cClON7YQ==
X-Received: by 2002:a05:6512:3e25:b0:553:2698:99c5 with SMTP id 2adb3069b0e04-557aa86aae9mr3669267e87.39.1751913244975;
        Mon, 07 Jul 2025 11:34:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d31a6sm1417630e87.61.2025.07.07.11.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 11:34:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 07 Jul 2025 18:34:05 +0000
Subject: [PATCH v8 5/5] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-uvc-meta-v8-5-ed17f8b1218b@chromium.org>
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
In-Reply-To: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

If the camera supports the MSXU_CONTROL_METADATA control, auto set the
MSXU_META quirk.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c   |  7 +++-
 drivers/media/usb/uvc/uvc_metadata.c | 75 +++++++++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h     |  2 +-
 include/linux/usb/uvc.h              |  3 ++
 4 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 56ea20eeb7b9d5d92f3d837c15bdf11d536e9f2d..9de5abb43e19d9e876cddc5d7124592953db89ac 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2315,7 +2315,12 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 	}
 
-	uvc_meta_init(dev);
+	ret = uvc_meta_init(dev);
+	if (ret < 0) {
+		dev_err(&dev->udev->dev,
+			"Error initializing the metadata formats (%d)\n", ret);
+		goto error;
+	}
 
 	if (dev->quirks & UVC_QUIRK_NO_RESET_RESUME)
 		udev->quirks &= ~USB_QUIRK_RESET_RESUME;
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 77e03273d3cf6b00cac6ebb9b29b941f1cbfd9f7..59bb133baf9a73ef6a30fa8ead85aa90653d60f4 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/usb.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 
 #include <media/v4l2-ioctl.h>
@@ -166,6 +167,71 @@ static const struct v4l2_file_operations uvc_meta_fops = {
 	.mmap = vb2_fop_mmap,
 };
 
+static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
+{
+	static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
+	struct uvc_entity *entity;
+
+	list_for_each_entry(entity, &dev->entities, list) {
+		if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
+			return entity;
+	}
+
+	return NULL;
+}
+
+#define MSXU_CONTROL_METADATA 0x9
+static int uvc_meta_detect_msxu(struct uvc_device *dev)
+{
+	u32 *data __free(kfree) = NULL;
+	struct uvc_entity *entity;
+	int ret;
+
+	entity = uvc_meta_find_msxu(dev);
+	if (!entity)
+		return 0;
+
+	/*
+	 * USB requires buffers aligned in a special way, simplest way is to
+	 * make sure that query_ctrl will work is to kmalloc() them.
+	 */
+	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	/* Check if the metadata is already enabled. */
+	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
+			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+	if (ret)
+		return 0;
+
+	if (*data) {
+		dev->quirks |= UVC_QUIRK_MSXU_META;
+		return 0;
+	}
+
+	/*
+	 * We have seen devices that require 1 to enable the metadata, others
+	 * requiring a value != 1 and others requiring a value >1. Luckily for
+	 * us, the value from GET_MAX seems to work all the time.
+	 */
+	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
+			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+	if (ret || !*data)
+		return 0;
+
+	/*
+	 * If we can set MSXU_CONTROL_METADATA, the device will report
+	 * metadata.
+	 */
+	ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
+			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+	if (!ret)
+		dev->quirks |= UVC_QUIRK_MSXU_META;
+
+	return 0;
+}
+
 int uvc_meta_register(struct uvc_streaming *stream)
 {
 	struct uvc_device *dev = stream->dev;
@@ -185,9 +251,14 @@ int uvc_meta_register(struct uvc_streaming *stream)
 					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
 }
 
-void uvc_meta_init(struct uvc_device *dev)
+int uvc_meta_init(struct uvc_device *dev)
 {
 	unsigned int i = 0;
+	int ret;
+
+	ret = uvc_meta_detect_msxu(dev);
+	if (ret)
+		return ret;
 
 	dev->meta_formats[i++] = V4L2_META_FMT_UVC;
 
@@ -201,4 +272,6 @@ void uvc_meta_init(struct uvc_device *dev)
 
 	 /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
 	dev->meta_formats[i++] = 0;
+
+	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 616adc417c62a58686beccbc440a5dfac0a2d588..a4c064c5e046f2a4adba742c8777a10619569606 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -757,7 +757,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 void uvc_video_clock_update(struct uvc_streaming *stream,
 			    struct vb2_v4l2_buffer *vbuf,
 			    struct uvc_buffer *buf);
-void uvc_meta_init(struct uvc_device *dev);
+int uvc_meta_init(struct uvc_device *dev);
 int uvc_meta_register(struct uvc_streaming *stream);
 
 int uvc_register_video_device(struct uvc_device *dev,
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -29,6 +29,9 @@
 #define UVC_GUID_EXT_GPIO_CONTROLLER \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
+#define UVC_GUID_MSXU_1_5 \
+	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
+	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
 
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \

-- 
2.50.0.727.gbf7dc18ff4-goog


