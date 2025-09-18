Return-Path: <linux-usb+bounces-26995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA736B2B22D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 22:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D52B1607D4
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 20:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0672749C8;
	Mon, 18 Aug 2025 20:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fYX/YZUX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5E5214210
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755548143; cv=none; b=k5OJb2NEHq9SEqMcIDRcaQhh1rnjb9R1pTsdJdid2mu/tAOF3Ri//JFSgvGJrucT2NjNh5xG106ub0L90OAt4xM55OhzqztFgP27N/K8kWCL6WV9oX9ULV0wS0t2YN1ml7EHLh8kpYBHLgCMJX2eE9AGX8jkLjZWPNiKO0HzycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755548143; c=relaxed/simple;
	bh=BG4bOUpG8gLPwpQbJcFoqWGcn1/tpQAAUR2UbxXlbNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PmroIlmwQDtz3B0Hz++KdMQIoiS/rqmBwdDbvQr1Fr0p2Ah85UkJLja17KRZ/+vWs7ZtTMitZ/Sni9AI2nQW/LBsXuaBD6PwyDujrQ2qbmlB1lUZZ5q6+3FSBEj17o7Zz37sV6MopCD9EhU82cJDe16BkH7VppqxgmLWqSGvN+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fYX/YZUX; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55ce526a25eso4602504e87.3
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755548140; x=1756152940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdEqVKxcLF8F+IFb9/yiQOVN8uHAV1kAAEVi6ehVyak=;
        b=fYX/YZUXOLVxmjFj4ViRFHWkwSUcVPV4CMQdUfxcnQtPnDjGLePzb4HIE5b62P2wFQ
         LwxtQguhK6XGKYuK9MNqEmf55IA1nFToLSZDobweFhEYfOlUWdcu/QXYRQ5VWTM2YmSD
         YAn3gA7G56lcSoCfLegKvr/6VmgPwexrJfUks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755548140; x=1756152940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdEqVKxcLF8F+IFb9/yiQOVN8uHAV1kAAEVi6ehVyak=;
        b=f5pv82Pt1GnUHKwqpv6guDT+xAjurwjk+uCZmEzMaJGIVoBLiWDKGf7V6jcB/eNtFy
         lsyFeTZqPiCJEv1tFuWdje4msCg+DSDNdod6jXLq8bkNm7qnF5X7zx5LteYpg9vKGeX7
         CnQk0JQGWB5GduUoAQP1ajysI16i/xDTwgl72gfibB9NZfj/CMTmXWmxCsJIa0ZmEH4g
         djzLBuvWTztVKD9j6iwFsopzl6tBYN8goEewu0fTnufP3+OV/anU98plSByw7T6cfyGc
         fsJmCpNfUFGPH1mNZnn3yUuvDgk9rbZyRPJ9m52MelcVGjS0XOhR2lHw8KjB9pcM/hDG
         Dz1w==
X-Forwarded-Encrypted: i=1; AJvYcCW8C8lZe3jJSDPI9jwLSvwUJzeAW5dv+EF/EKZdSMiJiMZ7DEsjEHdNb5b9uctpKGEhQo76cDAJ7m4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC3SfwowuzlE7siPn9PtGowHnXonmDMYrHp4RpAgaViEXlETc/
	K7ycYK/398ptqiSTuegnv4n6PgdjumXxsnEo42ocoVtX65N2YBUfYYF4vn7gMlH1nQ==
X-Gm-Gg: ASbGnctEkCJSttzafYvQoazH7GAL8yl+E/xau++ar78YmkKU2sBm+9fPwqylkVx5Uz3
	3tCv9hn52IBbua6arzWEZlGyEXh+ruNiRFz9HpYJJJqchhTztf9DcVVKprfpy1NaL4jRxqnNRNw
	ZICFXSr5oFU2rmmkPkxCa/gIvovtmJS2HccK9SGs3SqZ+QfLpacqCPx6xE7NmjFojOAcj+NcKRp
	3AEKFi1irUOheESmts279ErRcvNd6vPWpKW8j5CWHcFdQJL/34WYi7quBUASZASSYfwH09tUzBG
	wlPI/fWwHWkuT2bbEwQRUXufcJC0mzeahkMZnTZdVULgbky+YpJaZ0eues5Gu1oBXFcGU2bavaX
	kra+aadohF5IStnaBDQAsE82WU+2MD70EaMtGwz/YGnwXZjxSXSWnQi/jEg7tbOo22N6bnTr7Ls
	U=
X-Google-Smtp-Source: AGHT+IHy8+Y7Ap5ZzFAyk0R8uEtaSIJbXsSxVSKDxBIrzcILSsx9hn4pIhtvwy63QftL0DTLIuFMBg==
X-Received: by 2002:a05:6512:304d:b0:55b:5863:6297 with SMTP id 2adb3069b0e04-55e007a4de2mr40728e87.28.1755548140179;
        Mon, 18 Aug 2025 13:15:40 -0700 (PDT)
Received: from ribalda.c.googlers.com (237.65.88.34.bc.googleusercontent.com. [34.88.65.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3476sm1789268e87.107.2025.08.18.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:15:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Aug 2025 20:15:37 +0000
Subject: [PATCH 2/4] media: uvcvideo: Move MSXU_CONTROL_METADATA definition
 to header
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-uvc-iq-switch-v1-2-f7ea5e740ddd@chromium.org>
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
In-Reply-To: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Move the MSXU_CONTROL_METADATA control definitino to the
include/linux/usb/uvc.h header, alongside the corresponding XU GUID. Add
a UVC_ prefix to avoid namespace clashes.

While at it, add the definition for the other controls for that
extension unit, as defined in
https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/r/20250715185254.6592-4-laurent.pinchart@ideasonboard.com
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/usb/uvc/uvc_metadata.c | 11 +++++------
 include/linux/usb/uvc.h              | 17 +++++++++++++++++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index b0960f0553cfcb30b0036d2ad8877fafa225c6a4..2d4998bd098f3ac7f51421535ccaa9e20a71f8e9 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -177,7 +177,6 @@ static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
 	return NULL;
 }
 
-#define MSXU_CONTROL_METADATA 0x9
 static int uvc_meta_detect_msxu(struct uvc_device *dev)
 {
 	u32 *data __free(kfree) = NULL;
@@ -201,7 +200,7 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 	 * returns metadata.
 	 */
 	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
-			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+			     UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
 	if (ret)
 		return 0;
 
@@ -211,23 +210,23 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 	}
 
 	/*
-	 * Set the value of MSXU_CONTROL_METADATA to the value reported by
+	 * Set the value of UVC_MSXU_CONTROL_METADATA to the value reported by
 	 * GET_MAX to enable production of MSXU metadata. The GET_MAX request
 	 * reports the maximum size of the metadata, if its value is 0 then MSXU
 	 * metadata is not supported. For more information, see
 	 * https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#2229-metadata-control
 	 */
 	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
-			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+			     UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
 	if (ret || !*data)
 		return 0;
 
 	/*
-	 * If we can set MSXU_CONTROL_METADATA, the device will report
+	 * If we can set UVC_MSXU_CONTROL_METADATA, the device will report
 	 * metadata.
 	 */
 	ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
-			     MSXU_CONTROL_METADATA, data, sizeof(*data));
+			     UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
 	if (!ret)
 		dev->quirks |= UVC_QUIRK_MSXU_META;
 
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index ee19e9f915b8370c333c426dc1ee4202c7b75c5b..12a57e1d34674a3a264ed7f88bed43926661fcd4 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -33,6 +33,23 @@
 	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
 	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
 
+/* https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls */
+#define UVC_MSXU_CONTROL_FOCUS			0x01
+#define UVC_MSXU_CONTROL_EXPOSURE		0x02
+#define UVC_MSXU_CONTROL_EVCOMPENSATION		0x03
+#define UVC_MSXU_CONTROL_WHITEBALANCE		0x04
+#define UVC_MSXU_CONTROL_FACE_AUTHENTICATION	0x06
+#define UVC_MSXU_CONTROL_CAMERA_EXTRINSICS	0x07
+#define UVC_MSXU_CONTROL_CAMERA_INTRINSICS	0x08
+#define UVC_MSXU_CONTROL_METADATA		0x09
+#define UVC_MSXU_CONTROL_IR_TORCH		0x0a
+#define UVC_MSXU_CONTROL_DIGITALWINDOW		0x0b
+#define UVC_MSXU_CONTROL_DIGITALWINDOW_CONFIG	0x0c
+#define UVC_MSXU_CONTROL_VIDEO_HDR		0x0d
+#define UVC_MSXU_CONTROL_FRAMERATE_THROTTLE	0x0e
+#define UVC_MSXU_CONTROL_FIELDOFVIEW2_CONFIG	0x0f
+#define UVC_MSXU_CONTROL_FIELDOFVIEW2		0x10
+
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}

-- 
2.51.0.rc1.167.g924127e9c0-goog


