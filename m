Return-Path: <linux-usb+bounces-24837-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A51AADD04C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 16:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D72B1189EB45
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 14:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7E92E54CA;
	Tue, 17 Jun 2025 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nMkrDL9b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D4720C028
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171359; cv=none; b=q+SMIFWciFAv9+3lVbg/fkER81VkZr4yUl91FPoHm6xDiSQmpIwIHvUHwOf9yH/eoc9j9N05VbLhxIdz1hhOCWulbr1h3QJRAaQa6EKY7OGNaeZIlUxJ5bwiXW/nprrc5OXFKHMobIxKNi8GyUlutHumFCNvJHOV0XsfvEZH+uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171359; c=relaxed/simple;
	bh=VUOlaRTP4eV8iVL8FnrRm8GJrgvq6sOIU/fSE8Vhe4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfxq2kSqs9JvX+BwKOOoKTYZCu7j4h8sDV1Zv6/0R5SKYwBJRli5jKSGBT1dPW8JPPrHpFB8+ECnCCyhoxqtxFzA7BsmFEcf9Iwv4U7WMAd4upWx+2WhJtuEiPwvY9c8CrYvqHgn7LyUX8/eJqrPA9Jzqz5nZutr77vgzuRrWmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nMkrDL9b; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553543ddfc7so6233881e87.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171354; x=1750776154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XZ3dPW1w4QCfr6i2hU3GgbqSe/1fko3hczMWWZK2cI=;
        b=nMkrDL9b9Aj7W8cXp2+ZfjIEl5ySuRlEw4JPa/03Y/hMzsdGfFCB/w8B8LbzxOM950
         7qs9YofkJX+euJXtcvSirPTjpQMa03Qd5cXJA9zP+XvJ4htR27F7lsSHiwxcxD6JGu0Y
         MDdQYZgjeIsINT/VlnShBn/WM6YfJbzYMtiaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171354; x=1750776154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XZ3dPW1w4QCfr6i2hU3GgbqSe/1fko3hczMWWZK2cI=;
        b=Q+7WDZR2Tvbc4KCYy4NzZCu3q9ksFKJy4A15Qqurz3aB8oQyMCwJHn5+c2sW0hehGN
         HTHxLDdH/gbTtHgGeOZi7qR5Eh9HGttVP63OGbBSZWKrM9KMhuX6lEz2ZRV0bxbBeR2d
         tzVaMtG8M/G6CG3nMtqMtjxrXe75joe3bG0Ry9M6HPKi3msLr+F/h/tdFfmu2Ir5Aemd
         pBPtrQWOF+zQNAVYZP2vawMRNh2k3uPk3Jxvt0Xf5revqtgP08xc+k/2G9B6SMr2sWZp
         OlayZiqyB8YM82Jz+Qh4NrTROP5Mk6slX8NmvxAk4+8ra1nOs2YOweTKZMgzAqMJgXnm
         OG4g==
X-Forwarded-Encrypted: i=1; AJvYcCXCiCLT9DiPSXnkTRtxOwkL5V3LHpGv3/9R4NNpo9/sRbOyD/OqeZ7WW+nw7uH9JUvjb5uRRdi4K8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpJwT1+w1c2MgNPy4We3TZfBSu+YUozgJAodoLTXeGWqcpY2Zv
	HcG/Dyx1tvxJR7TONGHjypV6fCg6FM4FMZtPtjA3zz/IhIFpDh79v7sCp28wY8Jk8w==
X-Gm-Gg: ASbGnctg5EDkAnHUoZY+0z5lbAloy+BIujhinaYy7a8SLnj001q4eYANgLZjTe5PnhF
	0Wncrw46XP4sgEFbiGRK/1Yc7rDzLFI0TrqMeMvS5zwogG6LHby7dFwGrQzosoq1M8OxxFTK8kH
	OG6NDcbrTzDIXuWVtph7YHraxngP8ftOQ8Azc1w9jpA9gA4Tks3e5AH1qeL5W9RYWxXhd8riJ+m
	NceSw4iq9KZC/Y74L4Ym8c6W4+hcLf66jwn42cLFZiHezi2WhY2CoPv8rj5+m6XrGBfSchxsNZ5
	fu9VgYlwtmCLcleybVgdZUZTnzxTgXXpB6psBNMFfEtHD6j2xZg1qsTbALz/ClCBBJLtBYMl5o4
	09RAvt72PAjtVBV0qgTImHdnAG39Ax+ullrldpOx7Og==
X-Google-Smtp-Source: AGHT+IG1sZuE/Nfhe9B34FOf/eWJmAMXL0Jv1BzWgBFgKFKiF4bV662uimtyRZWQUXOB9gPR6hlDog==
X-Received: by 2002:a05:6512:3b9d:b0:553:37e7:867a with SMTP id 2adb3069b0e04-553b6f4d01bmr3097555e87.49.1750171354119;
        Tue, 17 Jun 2025 07:42:34 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 14:42:24 +0000
Subject: [PATCH v7 3/5] media: uvcvideo: Introduce dev->meta_formats
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-uvc-meta-v7-3-9c50623e2286@chromium.org>
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

Right now, there driver supports devices with one or two metadata
formats. Prepare it to support more than two metadata formats.

This is achieved with the introduction of a new field `meta_formats`,
that contains the array of metadata formats supported by the device, in
the order expected by userspace.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c   |  7 ++++++
 drivers/media/usb/uvc/uvc_metadata.c | 46 ++++++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h     |  2 ++
 3 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 62eb45435d8bec5c955720ecb46fb8936871e6cc..9de5abb43e19d9e876cddc5d7124592953db89ac 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2315,6 +2315,13 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 	}
 
+	ret = uvc_meta_init(dev);
+	if (ret < 0) {
+		dev_err(&dev->udev->dev,
+			"Error initializing the metadata formats (%d)\n", ret);
+		goto error;
+	}
+
 	if (dev->quirks & UVC_QUIRK_NO_RESET_RESUME)
 		udev->quirks &= ~USB_QUIRK_RESET_RESUME;
 
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 82de7781f5b6b70c5ba16bcba9e0741231231904..bc84e849174397f41d1e20bf890a876eeb5a9c67 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -64,14 +64,20 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 	struct uvc_device *dev = stream->dev;
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
 	u32 fmeta = fmt->dataformat;
+	u32 i;
 
 	if (format->type != vfh->vdev->queue->type)
 		return -EINVAL;
 
+	for (i = 0; (fmeta != dev->meta_formats[i]) && dev->meta_formats[i];
+	     i++)
+		;
+	if (!dev->meta_formats[i])
+		fmeta = V4L2_META_FMT_UVC;
+
 	memset(fmt, 0, sizeof(*fmt));
 
-	fmt->dataformat = fmeta == dev->info->meta_format
-			? fmeta : V4L2_META_FMT_UVC;
+	fmt->dataformat = fmeta;
 	fmt->buffersize = UVC_METADATA_BUF_SIZE;
 
 	return 0;
@@ -112,17 +118,21 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 	struct v4l2_fh *vfh = file->private_data;
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
-	u32 index = fdesc->index;
+	u32 i;
+
+	if (fdesc->type != vfh->vdev->queue->type)
+		return -EINVAL;
 
-	if (fdesc->type != vfh->vdev->queue->type ||
-	    index > 1U || (index && !dev->info->meta_format))
+	for (i = 0; (i < fdesc->index) && dev->meta_formats[i]; i++)
+		;
+	if (!dev->meta_formats[i])
 		return -EINVAL;
 
 	memset(fdesc, 0, sizeof(*fdesc));
 
 	fdesc->type = vfh->vdev->queue->type;
-	fdesc->index = index;
-	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
+	fdesc->index = i;
+	fdesc->pixelformat = dev->meta_formats[i];
 
 	return 0;
 }
@@ -174,3 +184,25 @@ int uvc_meta_register(struct uvc_streaming *stream)
 					 V4L2_BUF_TYPE_META_CAPTURE,
 					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
 }
+
+int uvc_meta_init(struct uvc_device *dev)
+{
+	static const u32 uvch_only[] = {V4L2_META_FMT_UVC, 0};
+	static const u32 d4xx_format[] = {V4L2_META_FMT_UVC, V4L2_META_FMT_D4XX,
+					  0};
+
+	switch (dev->info->meta_format) {
+	case V4L2_META_FMT_D4XX:
+		dev->meta_formats = d4xx_format;
+		break;
+	case 0:
+		dev->meta_formats = uvch_only;
+		break;
+	default:
+		dev_err(&dev->udev->dev, "Unknown metadata format 0x%x\n",
+			dev->info->meta_format);
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 11d6e3c2ebdfbabd7bbe5722f88ff85f406d9bb6..502f1d5608637cd28ce6f01aee31c4f5df160081 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -581,6 +581,7 @@ struct uvc_device {
 	char name[32];
 
 	const struct uvc_device_info *info;
+	const u32 *meta_formats; /* Zero-ended list of meta formats */
 
 	atomic_t nmappings;
 
@@ -751,6 +752,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 void uvc_video_clock_update(struct uvc_streaming *stream,
 			    struct vb2_v4l2_buffer *vbuf,
 			    struct uvc_buffer *buf);
+int uvc_meta_init(struct uvc_device *dev);
 int uvc_meta_register(struct uvc_streaming *stream);
 
 int uvc_register_video_device(struct uvc_device *dev,

-- 
2.50.0.rc2.692.g299adb8693-goog


