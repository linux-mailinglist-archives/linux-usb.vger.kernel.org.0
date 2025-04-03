Return-Path: <linux-usb+bounces-22535-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B506A7AE61
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 22:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D757716B1FE
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 20:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A372040A7;
	Thu,  3 Apr 2025 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DUVN8BoL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25066200B9F
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 19:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707791; cv=none; b=i5Qb9ejL5zwI5+S5hgb5YlprIRmcK/4Jh6/AMjnU8Q1rQIa/caQZhLasJvwvgBcdy7I7Vu/0EUkxvGmLN8CS8uMutx9Pi2rzn4+cTuFHpqgWPBneP2wKeMPc22RjV0NdjkkvHHPl3RAhl6XGxhwlJ7IBquEYvATf5DIEahnXkXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707791; c=relaxed/simple;
	bh=FkbqQupMpzx0wszT8hmcVx+KkNGgx/ddD0tHr201vd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQJ0H628V98Owiavd8w4Y2ktHYCUkJYvsBoYRGlSrd3pumk+PreQn2MVOdbeHJ43owjo6Lxgh+Le5sHBq80NHLK2b5f0UjMDb5+JTR2ZiAzaqSLZ7QPgDK8YY54SRtmfZ6SPeccFUVb4EO3TMG54hyx7DCadA73f3b/tZgnQWe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DUVN8BoL; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549967c72bcso1445912e87.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707787; x=1744312587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ka+lvT2WWas4h5SU2dyS9iOFUZ7NSTxVoiGdeZqTAM=;
        b=DUVN8BoLDufoqp6l9PgZ5nVu3y253dfDUXL3m5TFpnDjZ3dSFN7nP4iUbleHFalBTX
         w80OnXcSo1FFVsDLrQyDbl3Y6f4h0474jHBY6XzRh0KXF6j0X5k8ZJFiX3qeTgf3IxeK
         +IrnGEhZH2B3yyG51KNx2kjMbPi8IodSCNHto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707787; x=1744312587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ka+lvT2WWas4h5SU2dyS9iOFUZ7NSTxVoiGdeZqTAM=;
        b=gnGT/blggpAWmpLJk5h8mAyjX5RppHjAdyJfsQuAnKJMY9Wyx+U2mBYyvqrgt1zSgR
         vC3jDvyB0WyZnGJDwsR2KLQNOM2G6sRun7+7pPrz6YiSHm7e8l9xoMRsG7BVvCZHqpZr
         s1HjIbginUoqzFqUqOlPWmExECY09oq6ndptTctZ8ORkcuvhPG7rS+VvIDWJ/b2t2uo1
         Ol8pgC9y0QMxA/BShL4hZHV2L9aSWrQrcbvIh7ckRpbBeTHr9H6RUaSdVbyXSKHlGuZV
         sExj5HwyqHG2UigylbwtW+QlTkOmTGuvI6w08HLTyyVqgAXqJkNXzWQ7lo/MtPeoXwtz
         1/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJTuckAZQvebOrhcLbQZE6XaqQfmXPNNhSB7MWO+rZSAlzmJ2NfnBa8je8AlT9AwtHeRype3Oom3A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Fs52jOWxirjrsrG7fjADQY8xEIZ8Vv4WllLVCET6Sv3OHjdE
	E3ZDegG+HaZdf9CscJfbYvsuN/IxSeOwCIJSZgpkqt4fiLNkMcj371VrIT2VOw==
X-Gm-Gg: ASbGnct4OQ8CA2SMZu6hKnR8muHFjVeaaoRYH4nWKeEJyIPrIft+LYIWAYg14ndY/6K
	LyBJrKsElANOWHdwpF7QuCOq3oci3z0wFh6gVyNf8v7+xD8NSYOJNvpQyG7P9Ske1E//j/+w54h
	8ai8IajeNcIjVDFzH4Nh4sysvQOhNP04ehbuY6oZyFEciH+53a/hn0IidOybUMKwqBc9FrMMCs0
	b3b6+sIfqEobHjStinpLFjaWoxya+xqr4GFAJP6HTZwHvEdfUh3KVyqSZ7TrMR1DmTnA0LOP5U4
	sUQHV+BP6wPIu49CV9zEEMEAWbt7Z98UEGa9TrNlYcrq2uYGQQMRinBKVFI32Yv9aEHHtiDvFKf
	JN/LyLnpW80Uqd5x5Qmg63w32
X-Google-Smtp-Source: AGHT+IEoqeMaCo7VWkarYWDP+GRzyBsI/lGXquNjw+btFYnKJTWgwFNKTpnH5nMpaFghhD3kro9NkQ==
X-Received: by 2002:a05:6512:3a87:b0:549:31e4:9ea with SMTP id 2adb3069b0e04-54c2282454fmr77746e87.52.1743707786957;
        Thu, 03 Apr 2025 12:16:26 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:15 +0000
Subject: [PATCH 4/8] media: ipu-bridge: Use v4l2_fwnode_device_parse helper
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-4-1a0cc595a62d@chromium.org>
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
 linux-gpio@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

v4l2_fwnode_device_parse now supports acpi devices as well. Use the
helper instead of re-implement the logic.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1cb7458556004d2073688bb0d11defd01f2f61b7..79e6998d37dfde50bd4b44584c8864178527d951 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -251,36 +251,16 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 
 static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_device *adev)
 {
-	enum v4l2_fwnode_orientation orientation;
-	struct acpi_pld_info *pld = NULL;
+	struct v4l2_fwnode_device_properties props;
+	int ret;
 
-	if (!acpi_get_physical_device_location(ACPI_PTR(adev->handle), &pld)) {
-		dev_warn(ADEV_DEV(adev), "_PLD call failed, using default orientation\n");
+	ret = v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
+	if (!ret || props.rotation == V4L2_FWNODE_PROPERTY_UNSET) {
+		dev_warn(ADEV_DEV(adev), "Using default orientation\n");
 		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
 	}
 
-	switch (pld->panel) {
-	case ACPI_PLD_PANEL_FRONT:
-		orientation = V4L2_FWNODE_ORIENTATION_FRONT;
-		break;
-	case ACPI_PLD_PANEL_BACK:
-		orientation = V4L2_FWNODE_ORIENTATION_BACK;
-		break;
-	case ACPI_PLD_PANEL_TOP:
-	case ACPI_PLD_PANEL_LEFT:
-	case ACPI_PLD_PANEL_RIGHT:
-	case ACPI_PLD_PANEL_UNKNOWN:
-		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
-		break;
-	default:
-		dev_warn(ADEV_DEV(adev), "Unknown _PLD panel val %d\n",
-			 pld->panel);
-		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
-		break;
-	}
-
-	ACPI_FREE(pld);
-	return orientation;
+	return props.rotation;
 }
 
 int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)

-- 
2.49.0.504.g3bcea36a83-goog


