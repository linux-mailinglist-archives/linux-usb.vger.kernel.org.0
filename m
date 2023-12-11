Return-Path: <linux-usb+bounces-3966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4497E80CA0E
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 13:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA2621F216E7
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 12:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F853BB2B;
	Mon, 11 Dec 2023 12:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oMJfm+9M"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 305 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 11 Dec 2023 04:43:32 PST
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8158E
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 04:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702298305;
	bh=TZS3iF0VomuTK2Hc1beEcKrgAVZdDgdQkq9dvq9uv2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oMJfm+9MqT6ybBzExXt1H4ELn/m1qrT7btvA3k6qdTbWK/jc4hBXi5Wer0dtBXiC1
	 eNsZ330y6XRgTX+6HcyAq0ghPGSSi9+BN15JC9XQNUcIYPoquGfoYSsyNcyFVMdmrT
	 ViHNGX7cfM+Q6+vfHIOq6QodZ/Sx8bDmNHNzrIQaBs0yY+gjfqZqZJQU4e2eXwax7F
	 0zZ/MYqLA+Lajp2PQ1+CUcPyunJuGx3KSmI1HShHCKU2blWyomEpoMGCwwNQ88As5E
	 gZq0sv1c7IKYqlxxzvWJXXzN9i0JOtUezLyQiFq7oEVaaQNlyHtef3dGDtQQUUajql
	 cKEwizYzmaBWA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6AB9937804B2;
	Mon, 11 Dec 2023 12:38:25 +0000 (UTC)
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-usb@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v3] usb: gadget: webcam: Make g_webcam loadable again
Date: Mon, 11 Dec 2023 13:38:19 +0100
Message-Id: <20231211123819.76648-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208131342.65671-1-andrzej.p@collabora.com>
References: <20231208131342.65671-1-andrzej.p@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")

has rendered the precomposed (aka legacy) webcam gadget unloadable.

uvc_alloc() since then has depended on certain config groups being
available in configfs tree related to the UVC function. However, legacy
gadgets do not create anything in configfs, so uvc_alloc() must fail
with -ENOENT no matter what.

This patch mimics the required configfs hierarchy to satisfy the code which
inspects formats and frames found in uvcg_streaming_header.

This has been tested with guvcview on the host side, using vivid as a
source of video stream on the device side and using the userspace program
found at https://gitlab.freedesktop.org/camera/uvc-gadget.git.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Fixes: 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
---
v2..v3:
- fixed another typo (actually use uvcg_frame_mjpeg_720p where it should
  be used instead of its 360p counterpart)
- eliminated sparse warnings by reverting the effect of cpu_to_le[16|32]
  while assigning to uvcg_frame members

v1..v2:
- fixed a typo (missing character) in one of uvcg_frame_mjpeg_720p's members

 drivers/usb/gadget/function/f_uvc.c |  45 ++---
 drivers/usb/gadget/function/u_uvc.h |   6 +
 drivers/usb/gadget/legacy/webcam.c  | 251 ++++++++++++++++++++++------
 3 files changed, 234 insertions(+), 68 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 786379f1b7b7..3b46de85ca01 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -960,7 +960,8 @@ static void uvc_free(struct usb_function *f)
 	struct uvc_device *uvc = to_uvc(f);
 	struct f_uvc_opts *opts = container_of(f->fi, struct f_uvc_opts,
 					       func_inst);
-	config_item_put(&uvc->header->item);
+	if (!opts->header)
+		config_item_put(&uvc->header->item);
 	--opts->refcnt;
 	kfree(uvc);
 }
@@ -1052,25 +1053,29 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 	uvc->desc.hs_streaming = opts->hs_streaming;
 	uvc->desc.ss_streaming = opts->ss_streaming;
 
-	streaming = config_group_find_item(&opts->func_inst.group, "streaming");
-	if (!streaming)
-		goto err_config;
-
-	header = config_group_find_item(to_config_group(streaming), "header");
-	config_item_put(streaming);
-	if (!header)
-		goto err_config;
-
-	h = config_group_find_item(to_config_group(header), "h");
-	config_item_put(header);
-	if (!h)
-		goto err_config;
-
-	uvc->header = to_uvcg_streaming_header(h);
-	if (!uvc->header->linked) {
-		mutex_unlock(&opts->lock);
-		kfree(uvc);
-		return ERR_PTR(-EBUSY);
+	if (opts->header) {
+		uvc->header = opts->header;
+	} else {
+		streaming = config_group_find_item(&opts->func_inst.group, "streaming");
+		if (!streaming)
+			goto err_config;
+
+		header = config_group_find_item(to_config_group(streaming), "header");
+		config_item_put(streaming);
+		if (!header)
+			goto err_config;
+
+		h = config_group_find_item(to_config_group(header), "h");
+		config_item_put(header);
+		if (!h)
+			goto err_config;
+
+		uvc->header = to_uvcg_streaming_header(h);
+		if (!uvc->header->linked) {
+			mutex_unlock(&opts->lock);
+			kfree(uvc);
+			return ERR_PTR(-EBUSY);
+		}
 	}
 
 	uvc->desc.extension_units = &opts->extension_units;
diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
index 1ce58f61253c..3ac392cbb779 100644
--- a/drivers/usb/gadget/function/u_uvc.h
+++ b/drivers/usb/gadget/function/u_uvc.h
@@ -98,6 +98,12 @@ struct f_uvc_opts {
 	 */
 	struct mutex			lock;
 	int				refcnt;
+
+	/*
+	 * Only for legacy gadget. Shall be NULL for configfs-composed gadgets,
+	 * which is guaranteed by alloc_inst implementation of f_uvc doing kzalloc.
+	 */
+	struct uvcg_streaming_header	*header;
 };
 
 #endif /* U_UVC_H */
diff --git a/drivers/usb/gadget/legacy/webcam.c b/drivers/usb/gadget/legacy/webcam.c
index c06dd1af7a0c..11cfc62e2056 100644
--- a/drivers/usb/gadget/legacy/webcam.c
+++ b/drivers/usb/gadget/legacy/webcam.c
@@ -12,6 +12,7 @@
 #include <linux/usb/video.h>
 
 #include "u_uvc.h"
+#include "uvc_configfs.h"
 
 USB_GADGET_COMPOSITE_OPTIONS();
 
@@ -84,8 +85,6 @@ static struct usb_device_descriptor webcam_device_descriptor = {
 	.bNumConfigurations	= 0, /* dynamic */
 };
 
-DECLARE_UVC_HEADER_DESCRIPTOR(1);
-
 static const struct UVC_HEADER_DESCRIPTOR(1) uvc_control_header = {
 	.bLength		= UVC_DT_HEADER_SIZE(1),
 	.bDescriptorType	= USB_DT_CS_INTERFACE,
@@ -158,21 +157,44 @@ static const struct UVC_INPUT_HEADER_DESCRIPTOR(1, 2) uvc_input_header = {
 	.bmaControls[1][0]	= 4,
 };
 
-static const struct uvc_format_uncompressed uvc_format_yuv = {
-	.bLength		= UVC_DT_FORMAT_UNCOMPRESSED_SIZE,
-	.bDescriptorType	= USB_DT_CS_INTERFACE,
-	.bDescriptorSubType	= UVC_VS_FORMAT_UNCOMPRESSED,
-	.bFormatIndex		= 1,
-	.bNumFrameDescriptors	= 2,
-	.guidFormat		=
-		{ 'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00,
-		 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71},
-	.bBitsPerPixel		= 16,
-	.bDefaultFrameIndex	= 1,
-	.bAspectRatioX		= 0,
-	.bAspectRatioY		= 0,
-	.bmInterlaceFlags	= 0,
-	.bCopyProtect		= 0,
+static const struct uvcg_color_matching uvcg_color_matching = {
+	.desc = {
+		.bLength		= UVC_DT_COLOR_MATCHING_SIZE,
+		.bDescriptorType	= USB_DT_CS_INTERFACE,
+		.bDescriptorSubType	= UVC_VS_COLORFORMAT,
+		.bColorPrimaries	= 1,
+		.bTransferCharacteristics	= 1,
+		.bMatrixCoefficients	= 4,
+	},
+};
+
+static struct uvcg_uncompressed uvcg_format_yuv = {
+	.fmt = {
+		.type			= UVCG_UNCOMPRESSED,
+		/* add to .frames and fill .num_frames at runtime */
+		.color_matching		= (struct uvcg_color_matching *)&uvcg_color_matching,
+	},
+	.desc = {
+		.bLength		= UVC_DT_FORMAT_UNCOMPRESSED_SIZE,
+		.bDescriptorType	= USB_DT_CS_INTERFACE,
+		.bDescriptorSubType	= UVC_VS_FORMAT_UNCOMPRESSED,
+		.bFormatIndex		= 1,
+		.bNumFrameDescriptors	= 2,
+		.guidFormat		= {
+			'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00,
+			 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
+		},
+		.bBitsPerPixel		= 16,
+		.bDefaultFrameIndex	= 1,
+		.bAspectRatioX		= 0,
+		.bAspectRatioY		= 0,
+		.bmInterlaceFlags	= 0,
+		.bCopyProtect		= 0,
+	},
+};
+
+static struct uvcg_format_ptr uvcg_format_ptr_yuv = {
+	.fmt = &uvcg_format_yuv.fmt,
 };
 
 DECLARE_UVC_FRAME_UNCOMPRESSED(1);
@@ -196,6 +218,35 @@ static const struct UVC_FRAME_UNCOMPRESSED(3) uvc_frame_yuv_360p = {
 	.dwFrameInterval[2]	= cpu_to_le32(5000000),
 };
 
+static u32 uvcg_frame_yuv_360p_dw_frame_interval[] = {
+	[0] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[0]),
+	[1] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[1]),
+	[2] = le32_to_cpu(uvc_frame_yuv_360p.dwFrameInterval[2]),
+};
+
+static const struct uvcg_frame uvcg_frame_yuv_360p = {
+	.fmt_type		= UVCG_UNCOMPRESSED,
+	.frame = {
+		.b_length			= uvc_frame_yuv_360p.bLength,
+		.b_descriptor_type		= uvc_frame_yuv_360p.bDescriptorType,
+		.b_descriptor_subtype		= uvc_frame_yuv_360p.bDescriptorSubType,
+		.b_frame_index			= uvc_frame_yuv_360p.bFrameIndex,
+		.bm_capabilities		= uvc_frame_yuv_360p.bmCapabilities,
+		.w_width			= le16_to_cpu(uvc_frame_yuv_360p.wWidth),
+		.w_height			= le16_to_cpu(uvc_frame_yuv_360p.wHeight),
+		.dw_min_bit_rate		= le32_to_cpu(uvc_frame_yuv_360p.dwMinBitRate),
+		.dw_max_bit_rate		= le32_to_cpu(uvc_frame_yuv_360p.dwMaxBitRate),
+		.dw_max_video_frame_buffer_size	= le32_to_cpu(uvc_frame_yuv_360p.dwMaxVideoFrameBufferSize),
+		.dw_default_frame_interval	= le32_to_cpu(uvc_frame_yuv_360p.dwDefaultFrameInterval),
+		.b_frame_interval_type		= uvc_frame_yuv_360p.bFrameIntervalType,
+	},
+	.dw_frame_interval	= uvcg_frame_yuv_360p_dw_frame_interval,
+};
+
+static struct uvcg_frame_ptr uvcg_frame_ptr_yuv_360p = {
+	.frm = (struct uvcg_frame *)&uvcg_frame_yuv_360p,
+};
+
 static const struct UVC_FRAME_UNCOMPRESSED(1) uvc_frame_yuv_720p = {
 	.bLength		= UVC_DT_FRAME_UNCOMPRESSED_SIZE(1),
 	.bDescriptorType	= USB_DT_CS_INTERFACE,
@@ -212,18 +263,56 @@ static const struct UVC_FRAME_UNCOMPRESSED(1) uvc_frame_yuv_720p = {
 	.dwFrameInterval[0]	= cpu_to_le32(5000000),
 };
 
-static const struct uvc_format_mjpeg uvc_format_mjpg = {
-	.bLength		= UVC_DT_FORMAT_MJPEG_SIZE,
-	.bDescriptorType	= USB_DT_CS_INTERFACE,
-	.bDescriptorSubType	= UVC_VS_FORMAT_MJPEG,
-	.bFormatIndex		= 2,
-	.bNumFrameDescriptors	= 2,
-	.bmFlags		= 0,
-	.bDefaultFrameIndex	= 1,
-	.bAspectRatioX		= 0,
-	.bAspectRatioY		= 0,
-	.bmInterlaceFlags	= 0,
-	.bCopyProtect		= 0,
+static u32 uvcg_frame_yuv_720p_dw_frame_interval[] = {
+	[0] = le32_to_cpu(uvc_frame_yuv_720p.dwFrameInterval[0]),
+};
+
+static const struct uvcg_frame uvcg_frame_yuv_720p = {
+	.fmt_type		= UVCG_UNCOMPRESSED,
+	.frame = {
+		.b_length			= uvc_frame_yuv_720p.bLength,
+		.b_descriptor_type		= uvc_frame_yuv_720p.bDescriptorType,
+		.b_descriptor_subtype		= uvc_frame_yuv_720p.bDescriptorSubType,
+		.b_frame_index			= uvc_frame_yuv_720p.bFrameIndex,
+		.bm_capabilities		= uvc_frame_yuv_720p.bmCapabilities,
+		.w_width			= le16_to_cpu(uvc_frame_yuv_720p.wWidth),
+		.w_height			= le16_to_cpu(uvc_frame_yuv_720p.wHeight),
+		.dw_min_bit_rate		= le32_to_cpu(uvc_frame_yuv_720p.dwMinBitRate),
+		.dw_max_bit_rate		= le32_to_cpu(uvc_frame_yuv_720p.dwMaxBitRate),
+		.dw_max_video_frame_buffer_size	= le32_to_cpu(uvc_frame_yuv_720p.dwMaxVideoFrameBufferSize),
+		.dw_default_frame_interval	= le32_to_cpu(uvc_frame_yuv_720p.dwDefaultFrameInterval),
+		.b_frame_interval_type		= uvc_frame_yuv_720p.bFrameIntervalType,
+	},
+	.dw_frame_interval	= uvcg_frame_yuv_720p_dw_frame_interval,
+};
+
+static struct uvcg_frame_ptr uvcg_frame_ptr_yuv_720p = {
+	.frm = (struct uvcg_frame *)&uvcg_frame_yuv_720p,
+};
+
+static struct uvcg_mjpeg uvcg_format_mjpeg = {
+	.fmt = {
+		.type			= UVCG_MJPEG,
+		/* add to .frames and fill .num_frames at runtime */
+		.color_matching		= (struct uvcg_color_matching *)&uvcg_color_matching,
+	},
+	.desc = {
+		.bLength		= UVC_DT_FORMAT_MJPEG_SIZE,
+		.bDescriptorType	= USB_DT_CS_INTERFACE,
+		.bDescriptorSubType	= UVC_VS_FORMAT_MJPEG,
+		.bFormatIndex		= 2,
+		.bNumFrameDescriptors	= 2,
+		.bmFlags		= 0,
+		.bDefaultFrameIndex	= 1,
+		.bAspectRatioX		= 0,
+		.bAspectRatioY		= 0,
+		.bmInterlaceFlags	= 0,
+		.bCopyProtect		= 0,
+	},
+};
+
+static struct uvcg_format_ptr uvcg_format_ptr_mjpeg = {
+	.fmt = &uvcg_format_mjpeg.fmt,
 };
 
 DECLARE_UVC_FRAME_MJPEG(1);
@@ -247,6 +336,35 @@ static const struct UVC_FRAME_MJPEG(3) uvc_frame_mjpg_360p = {
 	.dwFrameInterval[2]	= cpu_to_le32(5000000),
 };
 
+static u32 uvcg_frame_mjpeg_360p_dw_frame_interval[] = {
+	[0] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[0]),
+	[1] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[1]),
+	[2] = le32_to_cpu(uvc_frame_mjpg_360p.dwFrameInterval[2]),
+};
+
+static const struct uvcg_frame uvcg_frame_mjpeg_360p = {
+	.fmt_type		= UVCG_MJPEG,
+	.frame = {
+		.b_length			= uvc_frame_mjpg_360p.bLength,
+		.b_descriptor_type		= uvc_frame_mjpg_360p.bDescriptorType,
+		.b_descriptor_subtype		= uvc_frame_mjpg_360p.bDescriptorSubType,
+		.b_frame_index			= uvc_frame_mjpg_360p.bFrameIndex,
+		.bm_capabilities		= uvc_frame_mjpg_360p.bmCapabilities,
+		.w_width			= le16_to_cpu(uvc_frame_mjpg_360p.wWidth),
+		.w_height			= le16_to_cpu(uvc_frame_mjpg_360p.wHeight),
+		.dw_min_bit_rate		= le32_to_cpu(uvc_frame_mjpg_360p.dwMinBitRate),
+		.dw_max_bit_rate		= le32_to_cpu(uvc_frame_mjpg_360p.dwMaxBitRate),
+		.dw_max_video_frame_buffer_size	= le32_to_cpu(uvc_frame_mjpg_360p.dwMaxVideoFrameBufferSize),
+		.dw_default_frame_interval	= le32_to_cpu(uvc_frame_mjpg_360p.dwDefaultFrameInterval),
+		.b_frame_interval_type		= uvc_frame_mjpg_360p.bFrameIntervalType,
+	},
+	.dw_frame_interval	= uvcg_frame_mjpeg_360p_dw_frame_interval,
+};
+
+static struct uvcg_frame_ptr uvcg_frame_ptr_mjpeg_360p = {
+	.frm = (struct uvcg_frame *)&uvcg_frame_mjpeg_360p,
+};
+
 static const struct UVC_FRAME_MJPEG(1) uvc_frame_mjpg_720p = {
 	.bLength		= UVC_DT_FRAME_MJPEG_SIZE(1),
 	.bDescriptorType	= USB_DT_CS_INTERFACE,
@@ -263,13 +381,33 @@ static const struct UVC_FRAME_MJPEG(1) uvc_frame_mjpg_720p = {
 	.dwFrameInterval[0]	= cpu_to_le32(5000000),
 };
 
-static const struct uvc_color_matching_descriptor uvc_color_matching = {
-	.bLength		= UVC_DT_COLOR_MATCHING_SIZE,
-	.bDescriptorType	= USB_DT_CS_INTERFACE,
-	.bDescriptorSubType	= UVC_VS_COLORFORMAT,
-	.bColorPrimaries	= 1,
-	.bTransferCharacteristics	= 1,
-	.bMatrixCoefficients	= 4,
+static u32 uvcg_frame_mjpeg_720p_dw_frame_interval[] = {
+	[0] = le32_to_cpu(uvc_frame_mjpg_720p.dwFrameInterval[0]),
+};
+
+static const struct uvcg_frame uvcg_frame_mjpeg_720p = {
+	.fmt_type		= UVCG_MJPEG,
+	.frame = {
+		.b_length			= uvc_frame_mjpg_720p.bLength,
+		.b_descriptor_type		= uvc_frame_mjpg_720p.bDescriptorType,
+		.b_descriptor_subtype		= uvc_frame_mjpg_720p.bDescriptorSubType,
+		.b_frame_index			= uvc_frame_mjpg_720p.bFrameIndex,
+		.bm_capabilities		= uvc_frame_mjpg_720p.bmCapabilities,
+		.w_width			= le16_to_cpu(uvc_frame_mjpg_720p.wWidth),
+		.w_height			= le16_to_cpu(uvc_frame_mjpg_720p.wHeight),
+		.dw_min_bit_rate		= le32_to_cpu(uvc_frame_mjpg_720p.dwMinBitRate),
+		.dw_max_bit_rate		= le32_to_cpu(uvc_frame_mjpg_720p.dwMaxBitRate),
+		.dw_max_video_frame_buffer_size	= le32_to_cpu(uvc_frame_mjpg_720p.dwMaxVideoFrameBufferSize),
+		.dw_default_frame_interval	= le32_to_cpu(uvc_frame_mjpg_720p.dwDefaultFrameInterval),
+	},
+	.dw_frame_interval	= uvcg_frame_mjpeg_720p_dw_frame_interval,
+};
+
+static struct uvcg_frame_ptr uvcg_frame_ptr_mjpeg_720p = {
+	.frm = (struct uvcg_frame *)&uvcg_frame_mjpeg_720p,
+};
+
+static struct uvcg_streaming_header uvcg_streaming_header = {
 };
 
 static const struct uvc_descriptor_header * const uvc_fs_control_cls[] = {
@@ -290,40 +428,40 @@ static const struct uvc_descriptor_header * const uvc_ss_control_cls[] = {
 
 static const struct uvc_descriptor_header * const uvc_fs_streaming_cls[] = {
 	(const struct uvc_descriptor_header *) &uvc_input_header,
-	(const struct uvc_descriptor_header *) &uvc_format_yuv,
+	(const struct uvc_descriptor_header *) &uvcg_format_yuv.desc,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
-	(const struct uvc_descriptor_header *) &uvc_color_matching,
-	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
+	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
+	(const struct uvc_descriptor_header *) &uvcg_format_mjpeg.desc,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
-	(const struct uvc_descriptor_header *) &uvc_color_matching,
+	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
 	NULL,
 };
 
 static const struct uvc_descriptor_header * const uvc_hs_streaming_cls[] = {
 	(const struct uvc_descriptor_header *) &uvc_input_header,
-	(const struct uvc_descriptor_header *) &uvc_format_yuv,
+	(const struct uvc_descriptor_header *) &uvcg_format_yuv.desc,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
-	(const struct uvc_descriptor_header *) &uvc_color_matching,
-	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
+	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
+	(const struct uvc_descriptor_header *) &uvcg_format_mjpeg.desc,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
-	(const struct uvc_descriptor_header *) &uvc_color_matching,
+	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
 	NULL,
 };
 
 static const struct uvc_descriptor_header * const uvc_ss_streaming_cls[] = {
 	(const struct uvc_descriptor_header *) &uvc_input_header,
-	(const struct uvc_descriptor_header *) &uvc_format_yuv,
+	(const struct uvc_descriptor_header *) &uvcg_format_yuv.desc,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
-	(const struct uvc_descriptor_header *) &uvc_color_matching,
-	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
+	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
+	(const struct uvc_descriptor_header *) &uvcg_format_mjpeg.desc,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
 	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
-	(const struct uvc_descriptor_header *) &uvc_color_matching,
+	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
 	NULL,
 };
 
@@ -387,6 +525,23 @@ webcam_bind(struct usb_composite_dev *cdev)
 	uvc_opts->hs_streaming = uvc_hs_streaming_cls;
 	uvc_opts->ss_streaming = uvc_ss_streaming_cls;
 
+	INIT_LIST_HEAD(&uvcg_format_yuv.fmt.frames);
+	list_add_tail(&uvcg_frame_ptr_yuv_360p.entry, &uvcg_format_yuv.fmt.frames);
+	list_add_tail(&uvcg_frame_ptr_yuv_720p.entry, &uvcg_format_yuv.fmt.frames);
+	uvcg_format_yuv.fmt.num_frames = 2;
+
+	INIT_LIST_HEAD(&uvcg_format_mjpeg.fmt.frames);
+	list_add_tail(&uvcg_frame_ptr_mjpeg_360p.entry, &uvcg_format_mjpeg.fmt.frames);
+	list_add_tail(&uvcg_frame_ptr_mjpeg_720p.entry, &uvcg_format_mjpeg.fmt.frames);
+	uvcg_format_mjpeg.fmt.num_frames = 2;
+
+	INIT_LIST_HEAD(&uvcg_streaming_header.formats);
+	list_add_tail(&uvcg_format_ptr_yuv.entry, &uvcg_streaming_header.formats);
+	list_add_tail(&uvcg_format_ptr_mjpeg.entry, &uvcg_streaming_header.formats);
+	uvcg_streaming_header.num_fmt = 2;
+
+	uvc_opts->header = &uvcg_streaming_header;
+
 	/* Allocate string descriptor numbers ... note that string contents
 	 * can be overridden by the composite_dev glue.
 	 */

base-commit: 33cc938e65a98f1d29d0a18403dbbee050dcad9a
-- 
2.25.1


