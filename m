Return-Path: <linux-usb+bounces-24516-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A35C4ACF5C2
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 19:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 352F37A175E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 17:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2562427AC36;
	Thu,  5 Jun 2025 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZVkCRHEm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F71927978D
	for <linux-usb@vger.kernel.org>; Thu,  5 Jun 2025 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145987; cv=none; b=a132Rgf5GE1eZeHqR4wz02CIvVycn+8ZHubiGXCv73D2suLE0h2cCSLaJW2O5qioNLgHLY1edN94jW+xyhgOe+EQA6m+DhX7efEh+H2MLT5HAPMd1mOzHFz2Ew5dwC0oRyguKlK9GhepKFYNpTpPUq8v+cYEn1MrOzVaVYkl2P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145987; c=relaxed/simple;
	bh=tewb45+dzAe3tLBQsQaB+O4zKZphuKqtE9IM4Y6OX9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukBX1//XAVUy3Y6fgUdHtAyJ2HCYtgAd/mgpvXhvCiAvzU9ijfYr92E1A/jJ3NIfK0sujwcpnPCO45u8dtIrOPtXPLD5O4BpcYZsNg4g0ehhKLTLCJ0xiBBkc9KZqTMDjoCGq7rbYv74dn8cXiPdYaswBiR7Vrp4SuWUf6JTxu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZVkCRHEm; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551ed563740so1575896e87.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Jun 2025 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145983; x=1749750783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2bzjHeaOe4XJQH7wCz0q9lsz5fFHI+NR6J/UEFEZdQ=;
        b=ZVkCRHEmBSMwAVs2r4H6mCqw7kB5h/HMviCkeWJwBrW4ZC8SnUK2Ug2FJB9zOV/PRa
         3yprm3m92Yf3jKNQHX2hv+vxVW36LQN/Qx2gkIo6Xf8evy9FIF6EVPgBXSp+IZObtOSz
         OWYhDVEBzWScLF1rid461YU5MTRNttPiSBucI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145983; x=1749750783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2bzjHeaOe4XJQH7wCz0q9lsz5fFHI+NR6J/UEFEZdQ=;
        b=IjztlSoqPwe2b+DbKClzWWXt9K9ndqUCPuG3vruJrqdC/au5sGIrlyJeHmT0T7044j
         YL2jE2KKx1hB2/biMibiSrzhooJxcCF34YZZMKtL9hGf0QVQY/uCrb1/sUVV9xP7oxg0
         v+2CisSI01YjtdhlKF3MrUV28R911UHglIcC6+N60V/KTfUr5zvVjrkN+kOiA66DIenz
         r3jC7FhdIVxZSN9uUYI3mgjGct1UE3ieNLqKVQtz6BCe69/RKXFn6PW9FkbzF3yGlcZy
         KaVJr5GZjzWngcmSXf9i/7KCuQrQk4Bo8F41FY3sN95zUIDewSAzMFuAP8waO1HEi4YF
         ZWuw==
X-Forwarded-Encrypted: i=1; AJvYcCURSv4P7IbbI/e7UzLo6Osaj+r9tRUAmKV1w8J+3C/VJSZPWZgOj8eeuHTJ8mq9Oi4IimI4bGBNX9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YweKGVuzNRHHvOIJagx8cf5wwoGFLN76PDiG9s7YEMmDF7mrvot
	zkQGEYy9EIZ+ESwyLq4MbtjJT+d2skZGYh5aqtu/1aXaWBX5yKSIPn1ggUI18Dgz7w==
X-Gm-Gg: ASbGncvIJtVbzy8GR6qEF7fCDsroCD3wK8wQyo8qla44LusKkS/Mp6B5PSpXWKCD2UK
	esTD4WPpfIMQxrA1J70zr8FuYq8W425ZvMWSBXXdz/oLfql+pe8A3SVGy1iDZ5uch0pqTSGhw9T
	9cmz+jfKVzuwi05SZzAwRc3TuhtEKpQyzEYIM3P/pPppVWjr0z0AcPOoGwnQwb+NNUVGL85qizw
	UJEFfFwHRrkYGy387n/y17EOzgWc2AoYP0cUghpdd5JmYk1QTXk0Lvr18eYdRrMFz1HoY279PQZ
	0cwXItVMk1vCBEHPCGsEQbmrhc/1BC6lhv/czSWEVr9SCQYpMOtfAB/xsTlELvvE4Vivo9AtGh3
	e22xEsi4TmpazNAtxos+pZUL2Tg==
X-Google-Smtp-Source: AGHT+IGl548xQa/vsHY27xBCLqMA/WtFSSEsFfeQt2Dzb0VNl43ck1yHu+ccC0nfMKcjxfgnvusB5Q==
X-Received: by 2002:a05:6512:1248:b0:553:2cc1:2bb4 with SMTP id 2adb3069b0e04-55366bd49dcmr18752e87.12.1749145983043;
        Thu, 05 Jun 2025 10:53:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:52:54 +0000
Subject: [PATCH v2 01/12] media: uvcvideo: Always set default_value
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-1-5710f9d030aa@chromium.org>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
In-Reply-To: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

If the control does not support GET_DEF, the field default_value will be
left uninitialized during queryctrl.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44b6513c526421943bb9841fb53dc5f8e9f93f02..47e8ccc39234d1769384b55539a21df07f3d57c7 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1497,6 +1497,8 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
 		v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
 				UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
+	} else {
+		v4l2_ctrl->default_value = 0;
 	}
 
 	switch (mapping->v4l2_type) {

-- 
2.50.0.rc0.642.g800a2b2222-goog


