Return-Path: <linux-usb+bounces-4208-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B328148E7
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 14:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C18A62864DF
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 13:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96C62D7A2;
	Fri, 15 Dec 2023 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pP6txVxc"
X-Original-To: linux-usb@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D350A2DB6D
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702646183;
	bh=k9CgUCJ0IZ36VGqHdeFvNikDIUpCvgiCdc3/pwWqqg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pP6txVxca0rQ60sIJFtYriFecAt7FoBnppWrmg+wJEBHmwyRJftAPY6i0bUOwD0aB
	 Wrtuy6Wy4jK7H+JweRp1legGQ9LWiw/EIQ5GAh6MqI4Upl7DvKpRwA9IWHJTBDJxsF
	 ATu/ff/AcyfLZbyMczs/mtWxNaC185dWGtCtr/I1OIxI0sl25y3CSwJJkjUXMouIdP
	 cIrRyYyIa/635MFVL1xDJYpu+ta47WK0HCiq9DJDuzLdK+5i/4BJzW2A3A4UC/qemk
	 TU4BO7n3AXyOQ4mXP8l01VDX0AF65RzrnsFO/1t4jXv+H2jxprzmhTffphw5y8sdrb
	 TdOxQ9dosJNCw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A76FE3781FD5;
	Fri, 15 Dec 2023 13:16:22 +0000 (UTC)
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-usb@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v5] usb: gadget: webcam: Make g_webcam loadable again
Date: Fri, 15 Dec 2023 14:16:14 +0100
Message-Id: <20231215131614.29132-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212190517.202002-1-andrzej.p@collabora.com>
References: <20231212190517.202002-1-andrzej.p@collabora.com>
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
v4..v5:
- removed an unnecessary blank line in the commit message body
- used a correct --base while generating the patch

v3..v4:
- silenced "initializer element is not constant" warnings on old
  compiles (created and used a bunch of #defines instead of referring
  to a static constr struct /members/, which in the C language is not
  considered const)

v2..v3:
- fixed another typo (actually use uvcg_frame_mjpeg_720p where it should
  be used instead of its 360p counterpart)
- eliminated sparse warnings by reverting the effect of cpu_to_le[16|32]
  while assigning to uvcg_frame members

v1..v2:
- fixed a typo (missing character) in one of uvcg_frame_mjpeg_720p's members

 drivers/usb/gadget/function/f_uvc.c |  45 ++--
 drivers/usb/gadget/function/u_uvc.h |   6 +
 drivers/usb/gadget/legacy/webcam.c  | 333 +++++++++++++++++++++-------
 3 files changed, 284 insertions(+), 100 deletions(-)

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
index c06dd1af7a0c..c395438d3978 100644
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
@@ -158,43 +157,112 @@ static const struct UVC_INPUT_HEADER_DESCRIPTOR(1, 2) uvc_input_header = {
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
 DECLARE_UVC_FRAME_UNCOMPRESSED(3);
 
+#define UVCG_WIDTH_360P			640
+#define UVCG_HEIGHT_360P		360
+#define UVCG_MIN_BITRATE_360P		18432000
+#define UVCG_MAX_BITRATE_360P		55296000
+#define UVCG_MAX_VIDEO_FB_SZ_360P	460800
+#define UVCG_FRM_INTERV_0_360P		666666
+#define UVCG_FRM_INTERV_1_360P		1000000
+#define UVCG_FRM_INTERV_2_360P		5000000
+#define UVCG_DEFAULT_FRM_INTERV_360P	UVCG_FRM_INTERV_0_360P
+
 static const struct UVC_FRAME_UNCOMPRESSED(3) uvc_frame_yuv_360p = {
 	.bLength		= UVC_DT_FRAME_UNCOMPRESSED_SIZE(3),
 	.bDescriptorType	= USB_DT_CS_INTERFACE,
 	.bDescriptorSubType	= UVC_VS_FRAME_UNCOMPRESSED,
 	.bFrameIndex		= 1,
 	.bmCapabilities		= 0,
-	.wWidth			= cpu_to_le16(640),
-	.wHeight		= cpu_to_le16(360),
-	.dwMinBitRate		= cpu_to_le32(18432000),
-	.dwMaxBitRate		= cpu_to_le32(55296000),
-	.dwMaxVideoFrameBufferSize	= cpu_to_le32(460800),
-	.dwDefaultFrameInterval	= cpu_to_le32(666666),
+	.wWidth			= cpu_to_le16(UVCG_WIDTH_360P),
+	.wHeight		= cpu_to_le16(UVCG_HEIGHT_360P),
+	.dwMinBitRate		= cpu_to_le32(UVCG_MIN_BITRATE_360P),
+	.dwMaxBitRate		= cpu_to_le32(UVCG_MAX_BITRATE_360P),
+	.dwMaxVideoFrameBufferSize	= cpu_to_le32(UVCG_MAX_VIDEO_FB_SZ_360P),
+	.dwDefaultFrameInterval	= cpu_to_le32(UVCG_DEFAULT_FRM_INTERV_360P),
 	.bFrameIntervalType	= 3,
-	.dwFrameInterval[0]	= cpu_to_le32(666666),
-	.dwFrameInterval[1]	= cpu_to_le32(1000000),
-	.dwFrameInterval[2]	= cpu_to_le32(5000000),
+	.dwFrameInterval[0]	= cpu_to_le32(UVCG_FRM_INTERV_0_360P),
+	.dwFrameInterval[1]	= cpu_to_le32(UVCG_FRM_INTERV_1_360P),
+	.dwFrameInterval[2]	= cpu_to_le32(UVCG_FRM_INTERV_2_360P),
+};
+
+static u32 uvcg_frame_yuv_360p_dw_frame_interval[] = {
+	[0] = UVCG_FRM_INTERV_0_360P,
+	[1] = UVCG_FRM_INTERV_1_360P,
+	[2] = UVCG_FRM_INTERV_2_360P,
+};
+
+static const struct uvcg_frame uvcg_frame_yuv_360p = {
+	.fmt_type		= UVCG_UNCOMPRESSED,
+	.frame = {
+		.b_length			= UVC_DT_FRAME_UNCOMPRESSED_SIZE(3),
+		.b_descriptor_type		= USB_DT_CS_INTERFACE,
+		.b_descriptor_subtype		= UVC_VS_FRAME_UNCOMPRESSED,
+		.b_frame_index			= 1,
+		.bm_capabilities		= 0,
+		.w_width			= UVCG_WIDTH_360P,
+		.w_height			= UVCG_HEIGHT_360P,
+		.dw_min_bit_rate		= UVCG_MIN_BITRATE_360P,
+		.dw_max_bit_rate		= UVCG_MAX_BITRATE_360P,
+		.dw_max_video_frame_buffer_size	= UVCG_MAX_VIDEO_FB_SZ_360P,
+		.dw_default_frame_interval	= UVCG_DEFAULT_FRM_INTERV_360P,
+		.b_frame_interval_type		= 3,
+	},
+	.dw_frame_interval	= uvcg_frame_yuv_360p_dw_frame_interval,
+};
+
+static struct uvcg_frame_ptr uvcg_frame_ptr_yuv_360p = {
+	.frm = (struct uvcg_frame *)&uvcg_frame_yuv_360p,
 };
+#define UVCG_WIDTH_720P			1280
+#define UVCG_HEIGHT_720P		720
+#define UVCG_MIN_BITRATE_720P		29491200
+#define UVCG_MAX_BITRATE_720P		29491200
+#define UVCG_MAX_VIDEO_FB_SZ_720P	1843200
+#define UVCG_FRM_INTERV_0_720P		5000000
+#define UVCG_DEFAULT_FRM_INTERV_720P	UVCG_FRM_INTERV_0_720P
 
 static const struct UVC_FRAME_UNCOMPRESSED(1) uvc_frame_yuv_720p = {
 	.bLength		= UVC_DT_FRAME_UNCOMPRESSED_SIZE(1),
@@ -202,28 +270,66 @@ static const struct UVC_FRAME_UNCOMPRESSED(1) uvc_frame_yuv_720p = {
 	.bDescriptorSubType	= UVC_VS_FRAME_UNCOMPRESSED,
 	.bFrameIndex		= 2,
 	.bmCapabilities		= 0,
-	.wWidth			= cpu_to_le16(1280),
-	.wHeight		= cpu_to_le16(720),
-	.dwMinBitRate		= cpu_to_le32(29491200),
-	.dwMaxBitRate		= cpu_to_le32(29491200),
-	.dwMaxVideoFrameBufferSize	= cpu_to_le32(1843200),
-	.dwDefaultFrameInterval	= cpu_to_le32(5000000),
+	.wWidth			= cpu_to_le16(UVCG_WIDTH_720P),
+	.wHeight		= cpu_to_le16(UVCG_HEIGHT_720P),
+	.dwMinBitRate		= cpu_to_le32(UVCG_MIN_BITRATE_720P),
+	.dwMaxBitRate		= cpu_to_le32(UVCG_MAX_BITRATE_720P),
+	.dwMaxVideoFrameBufferSize	= cpu_to_le32(UVCG_MAX_VIDEO_FB_SZ_720P),
+	.dwDefaultFrameInterval	= cpu_to_le32(UVCG_DEFAULT_FRM_INTERV_720P),
 	.bFrameIntervalType	= 1,
-	.dwFrameInterval[0]	= cpu_to_le32(5000000),
+	.dwFrameInterval[0]	= cpu_to_le32(UVCG_FRM_INTERV_0_720P),
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
+	[0] = UVCG_FRM_INTERV_0_720P,
+};
+
+static const struct uvcg_frame uvcg_frame_yuv_720p = {
+	.fmt_type		= UVCG_UNCOMPRESSED,
+	.frame = {
+		.b_length			= UVC_DT_FRAME_UNCOMPRESSED_SIZE(1),
+		.b_descriptor_type		= USB_DT_CS_INTERFACE,
+		.b_descriptor_subtype		= UVC_VS_FRAME_UNCOMPRESSED,
+		.b_frame_index			= 2,
+		.bm_capabilities		= 0,
+		.w_width			= UVCG_WIDTH_720P,
+		.w_height			= UVCG_HEIGHT_720P,
+		.dw_min_bit_rate		= UVCG_MIN_BITRATE_720P,
+		.dw_max_bit_rate		= UVCG_MAX_BITRATE_720P,
+		.dw_max_video_frame_buffer_size	= UVCG_MAX_VIDEO_FB_SZ_720P,
+		.dw_default_frame_interval	= UVCG_DEFAULT_FRM_INTERV_720P,
+		.b_frame_interval_type		= 1,
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
@@ -235,16 +341,45 @@ static const struct UVC_FRAME_MJPEG(3) uvc_frame_mjpg_360p = {
 	.bDescriptorSubType	= UVC_VS_FRAME_MJPEG,
 	.bFrameIndex		= 1,
 	.bmCapabilities		= 0,
-	.wWidth			= cpu_to_le16(640),
-	.wHeight		= cpu_to_le16(360),
-	.dwMinBitRate		= cpu_to_le32(18432000),
-	.dwMaxBitRate		= cpu_to_le32(55296000),
-	.dwMaxVideoFrameBufferSize	= cpu_to_le32(460800),
-	.dwDefaultFrameInterval	= cpu_to_le32(666666),
+	.wWidth			= cpu_to_le16(UVCG_WIDTH_360P),
+	.wHeight		= cpu_to_le16(UVCG_HEIGHT_360P),
+	.dwMinBitRate		= cpu_to_le32(UVCG_MIN_BITRATE_360P),
+	.dwMaxBitRate		= cpu_to_le32(UVCG_MAX_BITRATE_360P),
+	.dwMaxVideoFrameBufferSize	= cpu_to_le32(UVCG_MAX_VIDEO_FB_SZ_360P),
+	.dwDefaultFrameInterval	= cpu_to_le32(UVCG_DEFAULT_FRM_INTERV_360P),
 	.bFrameIntervalType	= 3,
-	.dwFrameInterval[0]	= cpu_to_le32(666666),
-	.dwFrameInterval[1]	= cpu_to_le32(1000000),
-	.dwFrameInterval[2]	= cpu_to_le32(5000000),
+	.dwFrameInterval[0]	= cpu_to_le32(UVCG_FRM_INTERV_0_360P),
+	.dwFrameInterval[1]	= cpu_to_le32(UVCG_FRM_INTERV_1_360P),
+	.dwFrameInterval[2]	= cpu_to_le32(UVCG_FRM_INTERV_2_360P),
+};
+
+static u32 uvcg_frame_mjpeg_360p_dw_frame_interval[] = {
+	[0] = UVCG_FRM_INTERV_0_360P,
+	[1] = UVCG_FRM_INTERV_1_360P,
+	[2] = UVCG_FRM_INTERV_2_360P,
+};
+
+static const struct uvcg_frame uvcg_frame_mjpeg_360p = {
+	.fmt_type		= UVCG_MJPEG,
+	.frame = {
+		.b_length			= UVC_DT_FRAME_MJPEG_SIZE(3),
+		.b_descriptor_type		= USB_DT_CS_INTERFACE,
+		.b_descriptor_subtype		= UVC_VS_FRAME_MJPEG,
+		.b_frame_index			= 1,
+		.bm_capabilities		= 0,
+		.w_width			= UVCG_WIDTH_360P,
+		.w_height			= UVCG_HEIGHT_360P,
+		.dw_min_bit_rate		= UVCG_MIN_BITRATE_360P,
+		.dw_max_bit_rate		= UVCG_MAX_BITRATE_360P,
+		.dw_max_video_frame_buffer_size	= UVCG_MAX_VIDEO_FB_SZ_360P,
+		.dw_default_frame_interval	= UVCG_DEFAULT_FRM_INTERV_360P,
+		.b_frame_interval_type		= 3,
+	},
+	.dw_frame_interval	= uvcg_frame_mjpeg_360p_dw_frame_interval,
+};
+
+static struct uvcg_frame_ptr uvcg_frame_ptr_mjpeg_360p = {
+	.frm = (struct uvcg_frame *)&uvcg_frame_mjpeg_360p,
 };
 
 static const struct UVC_FRAME_MJPEG(1) uvc_frame_mjpg_720p = {
@@ -253,23 +388,44 @@ static const struct UVC_FRAME_MJPEG(1) uvc_frame_mjpg_720p = {
 	.bDescriptorSubType	= UVC_VS_FRAME_MJPEG,
 	.bFrameIndex		= 2,
 	.bmCapabilities		= 0,
-	.wWidth			= cpu_to_le16(1280),
-	.wHeight		= cpu_to_le16(720),
-	.dwMinBitRate		= cpu_to_le32(29491200),
-	.dwMaxBitRate		= cpu_to_le32(29491200),
-	.dwMaxVideoFrameBufferSize	= cpu_to_le32(1843200),
-	.dwDefaultFrameInterval	= cpu_to_le32(5000000),
+	.wWidth			= cpu_to_le16(UVCG_WIDTH_720P),
+	.wHeight		= cpu_to_le16(UVCG_HEIGHT_720P),
+	.dwMinBitRate		= cpu_to_le32(UVCG_MIN_BITRATE_720P),
+	.dwMaxBitRate		= cpu_to_le32(UVCG_MAX_BITRATE_720P),
+	.dwMaxVideoFrameBufferSize	= cpu_to_le32(UVCG_MAX_VIDEO_FB_SZ_720P),
+	.dwDefaultFrameInterval	= cpu_to_le32(UVCG_DEFAULT_FRM_INTERV_720P),
 	.bFrameIntervalType	= 1,
-	.dwFrameInterval[0]	= cpu_to_le32(5000000),
+	.dwFrameInterval[0]	= cpu_to_le32(UVCG_FRM_INTERV_0_720P),
 };
 
-static const struct uvc_color_matching_descriptor uvc_color_matching = {
-	.bLength		= UVC_DT_COLOR_MATCHING_SIZE,
-	.bDescriptorType	= USB_DT_CS_INTERFACE,
-	.bDescriptorSubType	= UVC_VS_COLORFORMAT,
-	.bColorPrimaries	= 1,
-	.bTransferCharacteristics	= 1,
-	.bMatrixCoefficients	= 4,
+static u32 uvcg_frame_mjpeg_720p_dw_frame_interval[] = {
+	[0] = UVCG_FRM_INTERV_0_720P,
+};
+
+static const struct uvcg_frame uvcg_frame_mjpeg_720p = {
+	.fmt_type		= UVCG_MJPEG,
+	.frame = {
+		.b_length			= UVC_DT_FRAME_MJPEG_SIZE(1),
+		.b_descriptor_type		= USB_DT_CS_INTERFACE,
+		.b_descriptor_subtype		= UVC_VS_FRAME_MJPEG,
+		.b_frame_index			= 2,
+		.bm_capabilities		= 0,
+		.w_width			= UVCG_WIDTH_720P,
+		.w_height			= UVCG_HEIGHT_720P,
+		.dw_min_bit_rate		= UVCG_MIN_BITRATE_720P,
+		.dw_max_bit_rate		= UVCG_MAX_BITRATE_720P,
+		.dw_max_video_frame_buffer_size	= UVCG_MAX_VIDEO_FB_SZ_720P,
+		.dw_default_frame_interval	= UVCG_DEFAULT_FRM_INTERV_720P,
+		.b_frame_interval_type		= 1,
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
@@ -290,40 +446,40 @@ static const struct uvc_descriptor_header * const uvc_ss_control_cls[] = {
 
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
 
@@ -387,6 +543,23 @@ webcam_bind(struct usb_composite_dev *cdev)
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

base-commit: a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
-- 
2.25.1


