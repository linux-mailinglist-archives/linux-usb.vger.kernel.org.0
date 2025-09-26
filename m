Return-Path: <linux-usb+bounces-28697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB1BA3C84
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 15:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7D351C04BBE
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 13:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B93D2FB0BD;
	Fri, 26 Sep 2025 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fbfy3VJj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C3D2F60B3
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892295; cv=none; b=GWLDYZrVBeJH9DbpGXe85u8vefr3763PzQZopEt38yXNdkrfJFUfuJQXqxiUBw/rc8D9lr+R8On8CahH1Q8XCicQfqs35rsOTEGfOvCSxmKBC4O1TbVCbSGJZizyIbuX/uXLfx78KnGUONSztTPiCACZIqXEjSGG29VLRL0KWKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892295; c=relaxed/simple;
	bh=fN1yQSZa9dGNYApiBN9DJ0yzGqYY3io2zaEeifTv+AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsLt8+1qVmptgBUhQDUYKlPNjplwAvgYdui+N9Suvy4P6PI7VanYpkPkAgpcSVSKLU56M1KsAR7iaRU3ZrOUPaBzvhaJry0DcA5DR3JWCsDCd6HDSr/eKfsxq4cD+ruk/2mL/CQ9aX9GgGNx4IcrWFk9e88QQiR0KLU464/vLmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fbfy3VJj; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5821dec0408so3097985e87.1
        for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892290; x=1759497090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuHd6eGYommvO3UskpqEqtJdP8+N3udV7UPBSp5lsjc=;
        b=fbfy3VJjC1yaYytPKZzTYRVoy+OCnUkOEtEIUZ3x3cYqigUyyXha5Va4UzDiOILmAI
         z/9bf24ITk1PxUsoK1WCTsDg7wY0GXAeUPCKIViGPcEP9BCiaDJ+LwEYvb6cDV8LIwkb
         D5w2rHp5jiXapkSCe1hEBuefH3fRV5/UiEHiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892290; x=1759497090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuHd6eGYommvO3UskpqEqtJdP8+N3udV7UPBSp5lsjc=;
        b=Cu0x1+/MC/6BaB+Ytnixfx8WjBruv2JtYh6huaHPXJx3bOtwOeGOFWfJPeQoXBouRr
         +uTzrT4Xiy0ekRkOBK2BrIe0jusLCsKQ3KVI+fPMDefsQHKu4a4XBHFWx/uxHAK+V89c
         rcd/uRUEaVqqDWkXzmQ4ydCUJl/r8ncUZVct3Gd5msKryIfmq7YE34o0WBxK50JIcZKv
         oCrN4bg9D5mTrH31a4ttjuRuZiJCLI229387cjSRKOaGV8/YQOpRUX4n69n3kHoR80bN
         HfZrBrnMJegMGdGqhqJahpab8kKfYCbPMOP/7CXN/DZV/3NAPnqkVEa63TMcUwejHV/L
         cCOA==
X-Forwarded-Encrypted: i=1; AJvYcCXO01N6gttk2YTjzcG8UiL4bRJLfuICnwme+GND4HowS3ceN397pXt1mypCWzukdEiQ6lMt1m/vPME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Bfz4vd9JJgqA3ezmKhMnmI4b/dtPs2/mntYZM4z7Rpacmr7h
	m2DZwfEeMRTYncsAvHvghD3pD2wguu2mCx1Srcc/1QycpCZxlHbpOYJkKZDji3u0vw==
X-Gm-Gg: ASbGncu+7r/9N34p/L+TABSSuh8KEXoV7QVarVfX4aJh5TvdyP59Hf8QiyO7IZcH/oC
	0s6Fk/kHYSaoW8LgpR3QLNje/OxWTtiAWPB8ylXR+X8Il5q+KpWt03W1lBRzGR2aBQ6XHiiTJ1Q
	dh8eSxuqvu3XDxlvdfKI52t7vWvj7pe8ZzwZg8PVhFdlxWFTRN/Yw0qMvRLNGdZGyiKZg0J2nsM
	LaaGn8uAFU1YUxWO8zveLlFn8WUBa+OmrMrdM8kReVwioWzBavLjNT3xRmHy8sgms+bywAVsRaX
	kDOB6hBwPNkEU833l0U+/Hda31VchHHtoYcZQxV4YGfhsCMGdRVWBw297pmUz5QL1bFNoruWB1R
	nzcvkx60KFUKVuWtEjZmdIP/JEa4Sy5EHZvY4dFr7I7156orbCtoVmhy2DSAcy2xzKEOFdQhM9t
	+kN/d3H9JuROiNTPSQn2hhUYM=
X-Google-Smtp-Source: AGHT+IGBibbMbWnp4wsYYpcAZc4iOvKmHvOhd0/KxBOtu8sk83ypjF+oQ0w3P1LE9KQVYZ/8hnbPDg==
X-Received: by 2002:a05:6512:61b1:b0:57c:2474:3743 with SMTP id 2adb3069b0e04-582d2f24dbfmr2344139e87.32.1758892290146;
        Fri, 26 Sep 2025 06:11:30 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:25 +0000
Subject: [PATCH v3 01/12] media: uvcvideo: Always set default_value
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-1-6dc2fa5b4220@chromium.org>
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
In-Reply-To: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
To: Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

If the control does not support GET_DEF, the field default_value will be
left uninitialized during queryctrl.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Cc: stable@vger.kernel.org
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 2905505c240c060e5034ea12d33b59d5702f2e1f..a869257e9b7c07eaa7d725d107bd1cb57d3c7377 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1542,10 +1542,11 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 			return ret;
 	}
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
+	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF)
 		v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
 				UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
-	}
+	else
+		v4l2_ctrl->default_value = 0;
 
 	switch (mapping->v4l2_type) {
 	case V4L2_CTRL_TYPE_MENU:

-- 
2.51.0.536.g15c5d4f767-goog


