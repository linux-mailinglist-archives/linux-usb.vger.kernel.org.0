Return-Path: <linux-usb+bounces-24524-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D456AACF5F0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 19:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B3EE17AAD7
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 17:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E535E27FD49;
	Thu,  5 Jun 2025 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V+0C9v+d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38FF27C877
	for <linux-usb@vger.kernel.org>; Thu,  5 Jun 2025 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145996; cv=none; b=Rm6DuHHAvM9mtg0rFPuHneYTyqH0r1KSPs+HJyAQGFsSvcpIR3nezMTv9Z08jNWlhZcYPqMhxA5iwniOaamWpnD8yQ0c3P2K62w2pmkq4A8EBi1rU/IN6KwTQjfXrhqhF1SEFWy3QFukpJCrKuGWMowhwHn3ig7f4sAZXSu7mys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145996; c=relaxed/simple;
	bh=R4NuKjk4LUn+NcJI1dWp1KbkF6gjPs2+DtnjDwx4z/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VrNN9L7QP4vXtzcy+1CvcBAcWxSpKhmIPKPHCtRtjt5KJgU6DsZz8xaeZ9dgXcxWTtPSJssXHpomoG5gOhFqP0oJ9JRetCE6E3CZOoe4WKXOXu0Dey1a9k5v92uBamejDEWYH8FYNoUe06g+eQ1CEtU9BaTg2R7YMtDIK33qa0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V+0C9v+d; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55324587a53so2349341e87.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Jun 2025 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145988; x=1749750788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKykJ86GJEjKAZ51EtUiBvhJS0VRnpbfEH3e5dzBR4w=;
        b=V+0C9v+d+sPzo+NIIu+xX4SgvhbNXZT1rIU/lO+otk7ArMDYMkCKVfP/HyVr7Gv7g2
         XgyTjdgtyNzyK8o98HyCCx7QsCFysvih4WgTvrcoVgdg2gXBC6HxPmrIL7x35V4oByyB
         Zw5erXMKN13T3/kcFHyctTALxIvFQWaJtsGdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145988; x=1749750788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKykJ86GJEjKAZ51EtUiBvhJS0VRnpbfEH3e5dzBR4w=;
        b=Wu1fQQw7NI4EE0Fyw6XUzx63YqnqczDjIDUKXtFPywb76knNMvso6kJQb2dSSWjoIu
         w9RSr6DHNE7YrYiT8ALlpKU/E/zhXHIW7pD4YeJVfStqXp9L+IyqI7+LabTB0trL0t4h
         FgkTpmep//AlTsUNAC3R5OYIPwaj4+4PmZalh0hISI3S3HvdGe1Tl/3JpT9O6Lcemcie
         asqYg7GyTPSAhEkv7ukPmCKOw8acFJbK96zdfza1Fb/EIL4dRCf2Lb/evuHbA2H2GBvW
         DyT2oXJlsjnnunnzeC2PJL8FyFCf68/S3UWcxbDL/Pdsup60L2YE3SbP37kTQ88N84r7
         dfPg==
X-Forwarded-Encrypted: i=1; AJvYcCWjzPgF8LzQlzBCiYM2CvENNOy63KvnZqfWxM1QevCqfSljLIiUqT7MRbc/qjv2qrQZPW/HQTycr5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP+e549oTQyzYSuu99ayw5k2nWpfhYaOF0Z7yQv+SCv+W+p60/
	sm2tAu2xxQv70di+py04rcoah4JVKAWlTuGnDr7DT/9DxUhmTHpd0LPDuUqOJmVyQQ==
X-Gm-Gg: ASbGnct9UtgCs314l0MgoV6PtGX6pRwoV5ay/G1l7MoNvL1F+OTOOUaSinSXgfEMAUd
	yhICeycJVS7uqP+VwIfO97O8asZ7kJCnO/VbsdKvqdoQ9zE9RaTFfS3Du2atMPn9FB7kRrJ2H66
	bwUgOW2AgsFdxJlbQbQ7v94WLdO5JQ8As8k+VHi5Z268LNvN7UfDnA90GKriuVYtGHqoOc+zvSb
	Zrs0HZVXoNwQCSaxkD99+cV9jl5EYkeZehWcbAHcvY5s2rAgQrIO7BBRRDcsytq405jNFQ0RxUE
	5rtpY3d86Eyjjn3h+1qPdrjKKmM7U/+JPA+AeZ3Xed939IHeApVVIEv7huuYg2fHn0JaNTvCxrl
	gOStbzCGcNAtNWF4/FqfDleKU9g==
X-Google-Smtp-Source: AGHT+IHp+xpg2FO63nkT7Lh5wy4seP/EyKn6xsYU+/2Jg59TJvy9YvZlmgC6AlIASMeTxBqC41J75A==
X-Received: by 2002:a05:6512:239d:b0:553:35bb:f7ba with SMTP id 2adb3069b0e04-55366bf08b7mr21355e87.11.1749145988208;
        Thu, 05 Jun 2025 10:53:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:53:03 +0000
Subject: [PATCH v2 10/12] media: uvcvideo: Add get_* functions to
 uvc_entity
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-10-5710f9d030aa@chromium.org>
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

Virtual entities need to provide more values than get_cur and get_cur
for their controls. Add support for get_def, get_min, get_max and
get_res.

This is a preparation patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
 drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 21ec7b978bc7aca21db7cb8fd5d135d876f3330c..59be62ae24a4219fa9d7aacf2ae7382c95362178 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -596,6 +596,18 @@ static int uvc_ctrl_query_entity(struct uvc_device *dev,
 	if (query == UVC_GET_CUR && ctrl->entity->get_cur)
 		return ctrl->entity->get_cur(dev, ctrl->entity,
 					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_DEF && ctrl->entity->get_def)
+		return ctrl->entity->get_def(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_MIN && ctrl->entity->get_min)
+		return ctrl->entity->get_min(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_MAX && ctrl->entity->get_max)
+		return ctrl->entity->get_max(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
+	if (query == UVC_GET_RES && ctrl->entity->get_res)
+		return ctrl->entity->get_res(dev, ctrl->entity,
+					     ctrl->info.selector, data, len);
 	if (query == UVC_GET_INFO && ctrl->entity->get_info)
 		return ctrl->entity->get_info(dev, ctrl->entity,
 					      ctrl->info.selector, data);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a931750bdea25b9062dcc7644bf5f2ed89c1cb4c..d6da8ed3ad4cf3377df49923e051fe04d83d2e38 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -261,6 +261,14 @@ struct uvc_entity {
 			u8 cs, u8 *caps);
 	int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
 		       u8 cs, void *data, u16 size);
+	int (*get_def)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
+	int (*get_min)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
+	int (*get_max)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
+	int (*get_res)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
 
 	unsigned int ncontrols;
 	struct uvc_control *controls;

-- 
2.50.0.rc0.642.g800a2b2222-goog


