Return-Path: <linux-usb+bounces-24839-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C91ADD05E
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 16:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 753EE188690D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 14:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEBA2E92AE;
	Tue, 17 Jun 2025 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a4jBjP9f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C0320CCC8
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171361; cv=none; b=NapKuRf3tvhoIicS+Fh1k/6CfMdCEOkm5PaGCa+Kn+MhtPSlfUo+urEY/NO13Vw+XZkf30z5nYH6As6n5QeJr8QFB54hRe3rH9Oq6IH5yJoxTeX0SRQhPRXv3/hzj3/pAoZC/YHceLgEK/Juf2WCZDxhF1m48ig2BFr+pGOKrzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171361; c=relaxed/simple;
	bh=J3RMIWij4olJIZvhHBis/MZpmxz342SGDI+rntvCR3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2HSuXUHLrMzf8Bm3mOs79rE/h8jeuAfI92leWFvv8tLQjB63Orgr7GGUYAODi41c8ukPoM4Sj8Y6kdF6tVj/4V5hKQ3WRm70o36//Nn7gr/fFOPuRVplMSFgtEIHGMKYdgR65vZspeFXVcFexRPm4Q1dIC9sj6KjJ2aREFIvGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a4jBjP9f; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b51f5218so4126178e87.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 07:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171355; x=1750776155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwBKWLCDONZ1Mqgm0XmcqesVTqC7UAS+k/XRYW3pzKs=;
        b=a4jBjP9fsRF6nntaJwVgxMNYnAEKt2tgnqf+Y9opzaYtMNqL3Fd73zMctIdkzoae05
         GUfrm6hER7ybG3bH2RfaCkAyr4j48tMHpKXcwSDJxlCK2acH7NNXMxAK0Zg/QGYB9DK+
         y5hwHAof0BMgHD3AV/LxcXfX5V9vGfbChLXxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171355; x=1750776155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwBKWLCDONZ1Mqgm0XmcqesVTqC7UAS+k/XRYW3pzKs=;
        b=O5YU4SR9Jt7/K8qJt3xUENEsTAs+9h2nMF8xf7r7qgLiLjcuLct2L70EgTIoscJYsy
         3dsy4+1K+wn6wmGgS/LshEFeMAn+FNcheKBQ1WybaddQUDgzJDIuMtt3kVAo8NjCcY12
         dk1+rMUtMVtcAd9vy7kVSXsJ4fPuHMo+TY055uihxnD/74zzCQOAJMzdlN2dXVgPNcmq
         LtK4amX8MBhIegvewTViplZk/iRLsZI7+ZrDfvPx82LDFTSDPh35uBfu3S0ACMZAFnoJ
         C+ChXquXm/IxhkCbI+BbaHzeB+2RSJQm0yhSiwJiKjs2a2P47EITqY1mY6t5rW7pOOsW
         q9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy0M7QkEXs3IR0QctFSco50hXJfazXwl3BGaohTlvEk6vHJCvZqQ57DErP/anx/R7MPtePbWhL53Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAu4qqd6C3D7BM2WwxokQCN2mh78dnxnwrCvu3867y9W0JZ2u6
	adq1UNr1nzgKyEWI7gVdlj3KuCzG6EQLfa8Mszt5Yqwe/Ri4ZLuLPOH0AbwRb6dd3g==
X-Gm-Gg: ASbGncsmYy7a/pbPEp/VEfQRwLbcwNHVI21eH5qlh/VeqFkaeMgcvRXdkkWjgSbL/UG
	DnCWILffMls44q4JCL0JvRjxv1Iw182vIXuQdHWnPX2BVcrG5RbVIB/WrGIDQQ0VxW621Ra4831
	zyQOlMgUw6+qDalM4aPjt2eVw7QCK7RB6dw+AmMfPvtshsFKuBSlBOoYotBoeJEWRIOIxTigkbd
	tJ6M54hKrQ9NbJYgH5dXf/bS3mwun5L+uBxSiEGkQUsFhQzHPZBvv1jemMZTQFGkO0VrTLn9F+M
	gaXNGzNjkEhsgQ8htl3HHNAR6pMyqk4032Pg5WxZ5ToQ6hdlgEia2Q5Y3Ul3OwBHKaGnsckl0EX
	7gQmBuLfN6QbSYdBxjL7cd9iP5t3i3tCNAuNwUZfqBA==
X-Google-Smtp-Source: AGHT+IHTAtFnky+kYSniVlDKGuaCPlXNADAnSZ6a7R69ZvRqK5HmhgT/JD2sTazuhQ0dI0Lbnlp1+w==
X-Received: by 2002:a05:6512:39c3:b0:553:23f9:bb3b with SMTP id 2adb3069b0e04-553b6f43089mr3171505e87.49.1750171354955;
        Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 14:42:26 +0000
Subject: [PATCH v7 5/5] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-uvc-meta-v7-5-9c50623e2286@chromium.org>
References: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
In-Reply-To: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
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
 drivers/media/usb/uvc/uvc_metadata.c | 71 ++++++++++++++++++++++++++++++++++++
 include/linux/usb/uvc.h              |  3 ++
 2 files changed, 74 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index b09f81d907d64f7d7a3b0dc52de319879b7e68be..5c3e0f8c5b720a2b962ae82470b836f870dc64b6 100644
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
@@ -195,6 +261,11 @@ int uvc_meta_init(struct uvc_device *dev)
 	static const u32 ms_format[] = {V4L2_META_FMT_UVC,
 					V4L2_META_FMT_UVC_MSXU_1_5, 0};
 	bool support_msxu;
+	int ret;
+
+	ret = uvc_meta_detect_msxu(dev);
+	if (ret)
+		return ret;
 
 	support_msxu = dev->quirks & UVC_QUIRK_MSXU_META;
 
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
2.50.0.rc2.692.g299adb8693-goog


