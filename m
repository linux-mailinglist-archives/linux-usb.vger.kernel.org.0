Return-Path: <linux-usb+bounces-22533-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEC2A7AE42
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 22:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 557B13A7E74
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 20:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DA1204583;
	Thu,  3 Apr 2025 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hsA8ykcF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5ED1FFC68
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 19:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707790; cv=none; b=joC3drEb3cr+p8gdzsAljQjC8HlqeBqSDILtHh/n6BxY+c+5BmWdN2ZtjlnoUYtZLfJAFYuCJSAtih1/QNZ5NhTb0qMyvKblcv2QKY7kt0RJsgoXHQD9Qw1FTH2hO6hF76E+S7LUWb9cuhb3hCUmaAp8qtnVYZt5T89+se3zEzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707790; c=relaxed/simple;
	bh=uYdW8UWkO7Lkj0/PLTSMCHmI2BhYM1Fy016gz/jcaNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aOKVav3tSvLEIXe+P0ooMF0Is1axnZtq+cXVrVIMe+Dk6aLzkzBbpR00DY/2AKJY1XbSmDUrsk4Ly5svrg5BSlk5YVnbc3cUoU4fgzKBLcXoJfZtuy8mpGMMwGAV8Wf1B3KvVf89rYgLAjUl6vRu1RSnuqJOpwj4ic+pBH6KiKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hsA8ykcF; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-549946c5346so1464041e87.2
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 12:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707785; x=1744312585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFGb4OSmEELjX3L+UUTsl617UgttQGz/GrFW7lOnFds=;
        b=hsA8ykcFMc2t6vy9DIiQOxfpKQ+jowvmwUZKpp9Wx/5Nh/ejujC792sJeY/bUgMZRb
         ydQ/8xMVBA1Wpa49DoIJ+3RNSYbny+tjii1aklXIq2qDg+IKSBHYfTfTxG0IZYEv5D/K
         Cbjbw+Q9xFOLDRO0/Nrfm9IgaIaDgrZ7p9rRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707785; x=1744312585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFGb4OSmEELjX3L+UUTsl617UgttQGz/GrFW7lOnFds=;
        b=QzLCjsmXQFQuIkZQjAQidTFE3LAf+SNTwxvuErkGFzenUVJbyjYtz4agqpqJahGS/q
         oXz231AgbwGxlJDChz0kL0g+HgitE22tLvibE6N4XPyeNJieSHWZFfbEmxLNV/mhyG2f
         56OUU6fsZwJUkM5HRU0ZQyUtv2rbTDwx4zmsw/VVfLhBMeNrRhONjpHQPfs41bwiPbx3
         Di2WEiBn1hA0tmlq1n8lWZVks6/5sRX9G0hYOMvQcoCeZkdHuoUYyKPFnDtDycroS1wH
         HaPsGC/gc9zXS2vaTpCBNUbOXRL51M4jBwAIPadd51Jkei/QC2Nc4K5Rx1BbAC22fRxV
         ZRMA==
X-Forwarded-Encrypted: i=1; AJvYcCUFnocgMs/bXh9RNrSUPk6VkpvyU7EDu7m2qZjqbwjehEsCbWHeMsmhBFZoiHcj78OMxEcZKhj0iSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI37akd7+Fdf5ZeKxgN2cu+FRtvOhfXOMxc8nYqbhAl6mHzxjI
	5DPJhFedkEzxj02XmQr/p7gRoHMoS6t36uevxbtSnExvni9rZVgJhuOm1ejP1A==
X-Gm-Gg: ASbGnctoresjA0NivJ89/xLLrZfdMWkoxhTpf3UEVfPmJl2nNnyAgvu6ZfrEw+drqLL
	1pX3O3CpU6eyFn2fNX8w9BEmV08ZXkRBmCMMWkJ1AArpYOxmmwqY94vAxqQVDNOOkRU6cTzgmrJ
	kRyQBaDA3iTt1R8cQnCwZvDQz4XpVif6hHgButI8rGhJMaQ+VLmuo7AlZcKoA+i9sIboozn85GX
	gkOjDqLA8CwHcTgoV1QgP8utD+OqkgL+Zqni83T9U81is0gxTdBW8IT+jexjRams826ezvZnThl
	MSkYBDDU/GrEtBt0MiS12gv3ExXiqEq1t4XUA/DUa7IbHs857BlofV9DZpESu49SDIsboc8qGqB
	N+DdZWhXfLDW+gTnKxj0EU/Rs
X-Google-Smtp-Source: AGHT+IHlTjBkC/TNKA88/1+phuhgnK0El1kOI/FDaapJX6tSIZfWFhb6k+73fZ8xYXGiKrRLbFD6xg==
X-Received: by 2002:a05:6512:15a8:b0:54b:117c:8ef3 with SMTP id 2adb3069b0e04-54c22800e8dmr78511e87.54.1743707784704;
        Thu, 03 Apr 2025 12:16:24 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:12 +0000
Subject: [PATCH 1/8] media: uvcvideo: Fix deferred probing error
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-1-1a0cc595a62d@chromium.org>
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
In-Reply-To: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2

uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
have not yet been probed. This return code should be propagated to the
caller of uvc_probe() to ensure that probing is retried when the required
GPIOs become available.

Currently, this error code is incorrectly converted to -ENODEV,
causing some internal cameras to be ignored.

This commit fixes this issue by propagating the -EPROBE_DEFER error.

Cc: stable@vger.kernel.org
Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 107e0fafd80f54ec98c9657e5d58d17a6ed8c02f..25e9aea81196e0eddba6de74951a46a97ae0bdb8 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2232,13 +2232,16 @@ static int uvc_probe(struct usb_interface *intf,
 #endif
 
 	/* Parse the Video Class control descriptor. */
-	if (uvc_parse_control(dev) < 0) {
+	ret = uvc_parse_control(dev);
+	if (ret < 0) {
+		ret = -ENODEV;
 		uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
 		goto error;
 	}
 
 	/* Parse the associated GPIOs. */
-	if (uvc_gpio_parse(dev) < 0) {
+	ret = uvc_gpio_parse(dev);
+	if (ret < 0) {
 		uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
 		goto error;
 	}
@@ -2264,24 +2267,32 @@ static int uvc_probe(struct usb_interface *intf,
 	}
 
 	/* Register the V4L2 device. */
-	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
+	ret = v4l2_device_register(&intf->dev, &dev->vdev);
+	if (ret < 0)
 		goto error;
 
 	/* Scan the device for video chains. */
-	if (uvc_scan_device(dev) < 0)
+	if (uvc_scan_device(dev) < 0) {
+		ret = -ENODEV;
 		goto error;
+	}
 
 	/* Initialize controls. */
-	if (uvc_ctrl_init_device(dev) < 0)
+	if (uvc_ctrl_init_device(dev) < 0) {
+		ret = -ENODEV;
 		goto error;
+	}
 
 	/* Register video device nodes. */
-	if (uvc_register_chains(dev) < 0)
+	if (uvc_register_chains(dev) < 0) {
+		ret = -ENODEV;
 		goto error;
+	}
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 	/* Register the media device node */
-	if (media_device_register(&dev->mdev) < 0)
+	ret = media_device_register(&dev->mdev);
+	if (ret < 0)
 		goto error;
 #endif
 	/* Save our data pointer in the interface data. */
@@ -2315,7 +2326,7 @@ static int uvc_probe(struct usb_interface *intf,
 error:
 	uvc_unregister_video(dev);
 	kref_put(&dev->ref, uvc_delete);
-	return -ENODEV;
+	return ret;
 }
 
 static void uvc_disconnect(struct usb_interface *intf)

-- 
2.49.0.504.g3bcea36a83-goog


