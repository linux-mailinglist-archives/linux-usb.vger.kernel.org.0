Return-Path: <linux-usb+bounces-24523-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EBCACF5EF
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 19:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD16418853F0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 17:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3EB27FD45;
	Thu,  5 Jun 2025 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aCh43tO+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF1527A92F
	for <linux-usb@vger.kernel.org>; Thu,  5 Jun 2025 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145996; cv=none; b=tfJvPXKArwByeWC367rsAcaqKHcI10qircaJimNlNEbxyHUBj9Ad+MQnJjGFY3ugp6alcL6a0VeHlCf0anpcm+fNVbipgbmp94zRi8r+zPn18T/XhCwp/31Tyh5z/Uye8rfvKUjkbIHg5wTPeQNgRu3wFBGDonxRrrrJQQjckKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145996; c=relaxed/simple;
	bh=1ZgSjQTaGaaFH/a8mMoBM5PvRpGKxv9Y52j0p6HXpHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACv5/TlEE8+iKvB4YKG/zUPH3S5gVQwuVyXFoPth+IAWsnK9t0r63EuGPyATb9nXFf5S+BE65ExoeUX5fGH8mSSho/gyth/ZyPC3Al25Jf2rcXSxyGKm/e9hUfEJ3hcP81H51X6wM3T+7t4yUO5xhQCgBFYRc/QvsePtMQ59Llc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aCh43tO+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so1344599e87.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Jun 2025 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145986; x=1749750786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITiETVL4DPlwiitJN8fQTR1CuO5aBFmT5UfjWJScKqs=;
        b=aCh43tO+ZuTamS1hd+2y1nDBrpy0Zw3gcRNZy0qbqIUkvLlXaM5nfyQiodfAYNqr22
         ALAg9iirpfeN+hRSB8RsY0joZc6hYDKzTp7kCqVEDJyAihjnnLhY0WJX/3v4VOPVdnfp
         gqoxtNoQqZ04fbfzYd5uWUCiyXGM1IQGS1n0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145986; x=1749750786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITiETVL4DPlwiitJN8fQTR1CuO5aBFmT5UfjWJScKqs=;
        b=XqawWsWQFpaLjnfsQp57wrbETabw/s9N6i4MOMEZKKx78m2ut/bc2Xouj9PSAave7/
         H6oNiTaDRCuskAq/5GDkWcoGLZyN/Y+FKH9ecy49qcHcZAQv7Zy1pCvPtmlltnBEefIY
         MukSH6qnvuXmuqK3QWr1ntHd2rLD8yuS64zQDyVzd8dXNn0fNKr0VryYo5pL0udV1qlx
         4zr1+1AGs7PVcCRuJ5/wOWmJNZ3LUErkX1agac2L/vx+YqD/NOFVb2WSjUAcOUPqt4Vx
         9SiS6f1e1BvTJ33mGXBSDAcuSar5hu3zhq0iYLXuBQYgORkESSzZtbQJTcTr2y6LeLgG
         u96g==
X-Forwarded-Encrypted: i=1; AJvYcCVpzS015mAMHlKpbwEn00kyI9JuOUeHNXpOyeJB5wSfdfNcWbqcwfpqghhsIxtc7Bsa5qWNkAgMY9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIKDr/yZYFtjSuakmW4F9moxvkq0+6beNWVxJgpPUiTKDI4mvB
	AeNix8TguW8xQTyO6kzoaWybnb/o8FfoTIWEx7BZWiOoIdOJAqpzVpmIkJDH/yFXOA==
X-Gm-Gg: ASbGncuqmVr9wZpc32zSTX765PEOddo00gGcKdkK84qUYewINPVc5REAxnBAk0FM42A
	wlZ6FJZ4ScYrvAexf58Ak4NsMAPN5gOJSQILd5Y7S4vIefdhnXhSqPLNEkPnSTwaS7IF3bOsWxh
	DvjdFO6F/ykJDZpJVy4a11+MUFXSrUDBBuGpCkhHH92/H4oHzFlocA8P5wt7Mb3SjoFc4RoDBUV
	WERZ8Nhwf2yEYCxhqI5Iai8vtm3HsQ5lPdLu4jcKmof267jIRumz1//SdBTOu6rt94bHAF8QFcu
	3Izoa6xCCRrfnToSe8zzRUSgKTMs9mjufwq72zAw2dtE6gyywhOlJaw4nQJBncEcSQoDXb1bN0I
	k6LH3Fp0pJqhpPfrx9pcBY5f3hg==
X-Google-Smtp-Source: AGHT+IF1UcMtPah0m8jT6Ln6JdgWvGYN1lsGuqlL6zma9QAAKsKScIhOqpWLrtFSd+pn1Q20FL2yNg==
X-Received: by 2002:a05:6512:10d4:b0:553:2e4a:bb58 with SMTP id 2adb3069b0e04-55366bdcb99mr25796e87.9.1749145986344;
        Thu, 05 Jun 2025 10:53:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:53:00 +0000
Subject: [PATCH v2 07/12] media: uvcvideo: Make uvc_alloc_entity non static
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-7-5710f9d030aa@chromium.org>
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

The function is useful for other compilation units.

This is just a refactor patch, no new functionality is added.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 4 ++--
 drivers/media/usb/uvc/uvcvideo.h   | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68cc0957762f2b67387677c22224d1..bcc97f71fa1703aea1119469fb32659c17d9409a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -792,8 +792,8 @@ static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
 
-static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
-		unsigned int num_pads, unsigned int extra_size)
+struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
+				    unsigned int extra_size)
 {
 	struct uvc_entity *entity;
 	unsigned int num_inputs;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b9f8eb62ba1d82ea7788cf6c10cc838a429dbc9e..dc23d8a97340dc4615d4182232d395106e6d9ed5 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -684,6 +684,8 @@ do {									\
  */
 
 struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
+struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
+				    unsigned int extra_size);
 
 /* Video buffers queue management. */
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);

-- 
2.50.0.rc0.642.g800a2b2222-goog


