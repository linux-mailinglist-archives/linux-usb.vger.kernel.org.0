Return-Path: <linux-usb+bounces-22539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 095ECA7AE69
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 22:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34D64188F0EB
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 20:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AEF205E22;
	Thu,  3 Apr 2025 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KzcRrt6T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBDB204595
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707795; cv=none; b=uh6A0ByGTQgWfw8fKxsVY5w0p6rvsKOiZnCQZLojZ1X82qD2Ez/KSEEQ+O8x6QLcvz5Rtbrn2CTTUW+OTRMFNXtVD7P84b0fMMNNpMflTLWohIJ3ThxehorcECojHLz3gRauTguOQT9RMqyxJxQAad7BEh2b5YF6I793UixKM1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707795; c=relaxed/simple;
	bh=oIe/uWD/FQDzr1edh1CzgOk8NT19Av3Ax0Mu4QeYt0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhfXIpPx3Ve6EHRwyrAAZ9KHeUQJoj9FCzGpbMsssYFLzzJ5CAlWNXo/LETILnwSywXWaFKK29p3U+hDbwgufpMOZ6NzrT1Tq2SGABuPF+wcrFr9VDe5o/smPlD1fWasW5WaqiqurOvMR+FMW62EWZmGFFgGzmc5rZjDzaSQmeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KzcRrt6T; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499659e669so1342449e87.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 12:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707791; x=1744312591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dorrjSo0orF//5lS6H31AEnatOUG0VehlrElNg21OPo=;
        b=KzcRrt6Tn4J4roTiElDsx6nBuxoqkw131eiq8KEj5G9YyO2hMWnVUXimaETLD+go38
         8zmQjuyZ12i+Tow/1AKE/p/tPZLMpoTgwhacOV4EVTpyXKUGH/TLmrKD1uP866iZ9/xn
         nH+JVdVFOpZ849qslDl0pHcfyaASPW8VTQ7+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707791; x=1744312591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dorrjSo0orF//5lS6H31AEnatOUG0VehlrElNg21OPo=;
        b=lI0NVjCaNJgjIJXOm7j69Zqp+kvfYHPUZHIuRtv/aVwmOESZkcmfVDLW0+t7Z4H7B0
         ksnLekknRhECN/XFiAXn2f9LRcwCjOqoba4+bWzQxY0t5rBBU/35z1WVmdaKoxnY3OBi
         CpUNBwp0oUEdvRGLfgHIeKK6Po6lqFvAsXB3HtaChew+tSgzDKwJEl4toG3mfaqxHsYx
         8hvGPrCFNI+5DUtz9WH1lNEc5pIa05PPSCJJ0tm2OBSNOjcQdKzB+ZUhU9TbJIQSZaBV
         opcFzvi1T9GWW3WEZDvT8+j/JbJy200DM1UfZHs4aQiEQNSDj0/RLHciIbffB5ZrHb0W
         W7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV33oCpEJH7NxNCOclNQAezOWlpOyUPQvoJIpK0xvC1tu21GdJzqQua8oQHZHYsjm49XNofb4apW3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAQSRBDUYyXhRgqGKeB2D84Y29lbigspunD3WTd/0jT2KBVcg3
	GUemDX99chDEHokFzPpCYnWZHk2tj7e03r3z9an0kIYgjn6ZqqE6ENvamH5V2Q==
X-Gm-Gg: ASbGncvkXvr3Z3EOsFmrk5gQpkgh8OCgO7sFJiZNN3m6ako8qyjBKOVeI1rvlsCY/J9
	yN3xSGqJxgjFgQLFRtgIObgRtJeJfK7h/oMb/H6km0VszIFQrIIjI7r/qmja91clwGhjACAiW9J
	QbCTRCE28p6k7u5ptXAuMici8QZCtJnv0iYCYU1dbHKijH3oNikAPYtfL//pq5lAbi1hGKJzlju
	dAgH23jj2+AmJ9xsVwWfj7KZTQhT+grsxovZLkqz/fgnHxc7fJH2qvDhoTiREq4Zp0P5LAM4Cs7
	7k4RDQFJhtTnSHIc77GIqCnl8bAPmTBzvPMGDty9i8f/PwXM3lvzNXD6+tufHFTMDKQg5Jwf+MZ
	EcCrtDpuJIn6NrfoXOXgQ8jlq
X-Google-Smtp-Source: AGHT+IGVY3EFg5KnHKmHO2hTamBaTkRj2xwhuyk+NEFXhuefJ9O4PY6IbapG0I2fVQxVv80RmqRT3w==
X-Received: by 2002:a05:6512:a91:b0:545:cd5:84d9 with SMTP id 2adb3069b0e04-54c2276e9b2mr115584e87.12.1743707790862;
        Thu, 03 Apr 2025 12:16:30 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:19 +0000
Subject: [PATCH 8/8] media: uvcvideo: Do not create MC entities for virtual
 entities
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-8-1a0cc595a62d@chromium.org>
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

Neither the GPIO nor the FWNODE entities form part of the device
pipeline. We just create them to hold emulated uvc controls.

When the device initializes, a warning is thrown by the v4l2 core:
uvcvideo 1-1:1.0: Entity type for entity FWNODE was not initialized!

There are no entity function that matches what we are doing here, and
it does not make to much sense to create a function for entities that
do not really exist.

Do not create MC entities for them and pretend nothing happened here.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index 01eeba2f049e9ebb25e091340a133656acbf28ca..4a0a083b4f58f041023710207a73e8fede8526e0 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -72,6 +72,16 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 {
 	int ret;
 
+	/*
+	 * Do not initialize virtual entities, they do not really exist
+	 * and are not connected to any other entities.
+	 */
+	switch (UVC_ENTITY_TYPE(entity)) {
+	case UVC_EXT_GPIO_UNIT:
+	case UVC_FWNODE_UNIT:
+		return 0;
+	}
+
 	if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
 		u32 function;
 

-- 
2.49.0.504.g3bcea36a83-goog


