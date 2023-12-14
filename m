Return-Path: <linux-usb+bounces-4144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B85F812855
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 07:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74E341F21ABB
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 06:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FF3D28E;
	Thu, 14 Dec 2023 06:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KVLAvO3J"
X-Original-To: linux-usb@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6911B7
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 22:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702536019;
	bh=mwp3+Buj+OKPTEv+MOZmdf8EO7DIYUGb3mPsb4jGnzc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KVLAvO3JSmQZ8M5dlMPJ6oeEj3vhtJTfp2diYfaUxIAaTZ+3rpnt5iYaV1iNN7NR1
	 2aTwMW2Abdm2sHEiVYCSKNlQs3N70z85Y1NnT+MnJNul+dBK+it4jx9GnveLxvD8yR
	 MY9MOpfr8sJFFifFZlUetsIpOUhPTPilJER/MnBML3AM/cw9NHaJqhazqUdAtFWD0i
	 Fxk/aeqS3+tQIPBMIemzLq6ToHKZC0U7uEep8sZTSgvBpd2C9n62IDg26kjhlRcBd1
	 hAX1DxH3Ay02jUdCLShzyxgrz2PghQep1YQS56iWNce4K0r8ebKQVwFn7QUA+54gth
	 H2a5Ma9PWu61w==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B9C0437811D4;
	Thu, 14 Dec 2023 06:40:18 +0000 (UTC)
Message-ID: <42cb09e1-e480-4802-bd57-66478a5ebd6e@collabora.com>
Date: Thu, 14 Dec 2023 07:40:18 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: gadget: webcam: Make g_webcam loadable again
Content-Language: en-US
To: linux-usb@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, kernel@collabora.com
References: <20231211123819.76648-1-andrzej.p@collabora.com>
 <20231212190517.202002-1-andrzej.p@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231212190517.202002-1-andrzej.p@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

W dniu 12.12.2023 o 20:05, Andrzej Pietrasiewicz pisze:
> commit 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
> 
> has rendered the precomposed (aka legacy) webcam gadget unloadable.
> 
> uvc_alloc() since then has depended on certain config groups being
> available in configfs tree related to the UVC function. However, legacy
> gadgets do not create anything in configfs, so uvc_alloc() must fail
> with -ENOENT no matter what.
> 
> This patch mimics the required configfs hierarchy to satisfy the code which
> inspects formats and frames found in uvcg_streaming_header.
> 
> This has been tested with guvcview on the host side, using vivid as a
> source of video stream on the device side and using the userspace program
> found at https://gitlab.freedesktop.org/camera/uvc-gadget.git.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Fixes: 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
> ---
> v3..v4:
> - silenced "initializer element is not constant" warnings on old
>    compiles (created and used a bunch of #defines instead of referring
>    to a static constr struct /members/, which in the C language is not
>    considered const)
> 
> v2..v3:
> - fixed another typo (actually use uvcg_frame_mjpeg_720p where it should
>    be used instead of its 360p counterpart)
> - eliminated sparse warnings by reverting the effect of cpu_to_le[16|32]
>    while assigning to uvcg_frame members
> 
> v1..v2:
> - fixed a typo (missing character) in one of uvcg_frame_mjpeg_720p's members
> 
>   drivers/usb/gadget/function/f_uvc.c |  45 ++--
>   drivers/usb/gadget/function/u_uvc.h |   6 +
>   drivers/usb/gadget/legacy/webcam.c  | 333 +++++++++++++++++++++-------
>   3 files changed, 284 insertions(+), 100 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 786379f1b7b7..3b46de85ca01 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -960,7 +960,8 @@ static void uvc_free(struct usb_function *f)
>   	struct uvc_device *uvc = to_uvc(f);
>   	struct f_uvc_opts *opts = container_of(f->fi, struct f_uvc_opts,
>   					       func_inst);
> -	config_item_put(&uvc->header->item);
> +	if (!opts->header)
> +		config_item_put(&uvc->header->item);
>   	--opts->refcnt;
>   	kfree(uvc);
>   }
> @@ -1052,25 +1053,29 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
>   	uvc->desc.hs_streaming = opts->hs_streaming;
>   	uvc->desc.ss_streaming = opts->ss_streaming;
>   
> -	streaming = config_group_find_item(&opts->func_inst.group, "streaming");
> -	if (!streaming)
> -		goto err_config;
> -
> -	header = config_group_find_item(to_config_group(streaming), "header");
> -	config_item_put(streaming);
> -	if (!header)
> -		goto err_config;
> -
> -	h = config_group_find_item(to_config_group(header), "h");
> -	config_item_put(header);
> -	if (!h)
> -		goto err_config;
> -
> -	uvc->header = to_uvcg_streaming_header(h);
> -	if (!uvc->header->linked) {
> -		mutex_unlock(&opts->lock);
> -		kfree(uvc);
> -		return ERR_PTR(-EBUSY);
> +	if (opts->header) {
> +		uvc->header = opts->header;
> +	} else {
> +		streaming = config_group_find_item(&opts->func_inst.group, "streaming");
> +		if (!streaming)
> +			goto err_config;
> +
> +		header = config_group_find_item(to_config_group(streaming), "header");
> +		config_item_put(streaming);
> +		if (!header)
> +			goto err_config;
> +
> +		h = config_group_find_item(to_config_group(header), "h");
> +		config_item_put(header);
> +		if (!h)
> +			goto err_config;
> +
> +		uvc->header = to_uvcg_streaming_header(h);
> +		if (!uvc->header->linked) {
> +			mutex_unlock(&opts->lock);
> +			kfree(uvc);
> +			return ERR_PTR(-EBUSY);
> +		}
>   	}
>   
>   	uvc->desc.extension_units = &opts->extension_units;
> diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
> index 1ce58f61253c..3ac392cbb779 100644
> --- a/drivers/usb/gadget/function/u_uvc.h
> +++ b/drivers/usb/gadget/function/u_uvc.h
> @@ -98,6 +98,12 @@ struct f_uvc_opts {
>   	 */
>   	struct mutex			lock;
>   	int				refcnt;
> +
> +	/*
> +	 * Only for legacy gadget. Shall be NULL for configfs-composed gadgets,
> +	 * which is guaranteed by alloc_inst implementation of f_uvc doing kzalloc.
> +	 */
> +	struct uvcg_streaming_header	*header;
>   };
>   
>   #endif /* U_UVC_H */
> diff --git a/drivers/usb/gadget/legacy/webcam.c b/drivers/usb/gadget/legacy/webcam.c
> index c06dd1af7a0c..c395438d3978 100644
> --- a/drivers/usb/gadget/legacy/webcam.c
> +++ b/drivers/usb/gadget/legacy/webcam.c
> @@ -12,6 +12,7 @@
>   #include <linux/usb/video.h>
>   
>   #include "u_uvc.h"
> +#include "uvc_configfs.h"
>   
>   USB_GADGET_COMPOSITE_OPTIONS();
>   
> @@ -84,8 +85,6 @@ static struct usb_device_descriptor webcam_device_descriptor = {
>   	.bNumConfigurations	= 0, /* dynamic */
>   };
>   
> -DECLARE_UVC_HEADER_DESCRIPTOR(1);
> -
>   static const struct UVC_HEADER_DESCRIPTOR(1) uvc_control_header = {
>   	.bLength		= UVC_DT_HEADER_SIZE(1),
>   	.bDescriptorType	= USB_DT_CS_INTERFACE,
> @@ -158,43 +157,112 @@ static const struct UVC_INPUT_HEADER_DESCRIPTOR(1, 2) uvc_input_header = {
>   	.bmaControls[1][0]	= 4,
>   };
>   
> -static const struct uvc_format_uncompressed uvc_format_yuv = {
> -	.bLength		= UVC_DT_FORMAT_UNCOMPRESSED_SIZE,
> -	.bDescriptorType	= USB_DT_CS_INTERFACE,
> -	.bDescriptorSubType	= UVC_VS_FORMAT_UNCOMPRESSED,
> -	.bFormatIndex		= 1,
> -	.bNumFrameDescriptors	= 2,
> -	.guidFormat		=
> -		{ 'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00,
> -		 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71},
> -	.bBitsPerPixel		= 16,
> -	.bDefaultFrameIndex	= 1,
> -	.bAspectRatioX		= 0,
> -	.bAspectRatioY		= 0,
> -	.bmInterlaceFlags	= 0,
> -	.bCopyProtect		= 0,
> +static const struct uvcg_color_matching uvcg_color_matching = {
> +	.desc = {
> +		.bLength		= UVC_DT_COLOR_MATCHING_SIZE,
> +		.bDescriptorType	= USB_DT_CS_INTERFACE,
> +		.bDescriptorSubType	= UVC_VS_COLORFORMAT,
> +		.bColorPrimaries	= 1,
> +		.bTransferCharacteristics	= 1,
> +		.bMatrixCoefficients	= 4,
> +	},
> +};
> +
> +static struct uvcg_uncompressed uvcg_format_yuv = {
> +	.fmt = {
> +		.type			= UVCG_UNCOMPRESSED,
> +		/* add to .frames and fill .num_frames at runtime */
> +		.color_matching		= (struct uvcg_color_matching *)&uvcg_color_matching,
> +	},
> +	.desc = {
> +		.bLength		= UVC_DT_FORMAT_UNCOMPRESSED_SIZE,
> +		.bDescriptorType	= USB_DT_CS_INTERFACE,
> +		.bDescriptorSubType	= UVC_VS_FORMAT_UNCOMPRESSED,
> +		.bFormatIndex		= 1,
> +		.bNumFrameDescriptors	= 2,
> +		.guidFormat		= {
> +			'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00,
> +			 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
> +		},
> +		.bBitsPerPixel		= 16,
> +		.bDefaultFrameIndex	= 1,
> +		.bAspectRatioX		= 0,
> +		.bAspectRatioY		= 0,
> +		.bmInterlaceFlags	= 0,
> +		.bCopyProtect		= 0,
> +	},
> +};
> +
> +static struct uvcg_format_ptr uvcg_format_ptr_yuv = {
> +	.fmt = &uvcg_format_yuv.fmt,
>   };
>   
>   DECLARE_UVC_FRAME_UNCOMPRESSED(1);
>   DECLARE_UVC_FRAME_UNCOMPRESSED(3);
>   
> +#define UVCG_WIDTH_360P			640
> +#define UVCG_HEIGHT_360P		360
> +#define UVCG_MIN_BITRATE_360P		18432000
> +#define UVCG_MAX_BITRATE_360P		55296000
> +#define UVCG_MAX_VIDEO_FB_SZ_360P	460800
> +#define UVCG_FRM_INTERV_0_360P		666666
> +#define UVCG_FRM_INTERV_1_360P		1000000
> +#define UVCG_FRM_INTERV_2_360P		5000000
> +#define UVCG_DEFAULT_FRM_INTERV_360P	UVCG_FRM_INTERV_0_360P
> +
>   static const struct UVC_FRAME_UNCOMPRESSED(3) uvc_frame_yuv_360p = {
>   	.bLength		= UVC_DT_FRAME_UNCOMPRESSED_SIZE(3),
>   	.bDescriptorType	= USB_DT_CS_INTERFACE,
>   	.bDescriptorSubType	= UVC_VS_FRAME_UNCOMPRESSED,
>   	.bFrameIndex		= 1,
>   	.bmCapabilities		= 0,
> -	.wWidth			= cpu_to_le16(640),
> -	.wHeight		= cpu_to_le16(360),
> -	.dwMinBitRate		= cpu_to_le32(18432000),
> -	.dwMaxBitRate		= cpu_to_le32(55296000),
> -	.dwMaxVideoFrameBufferSize	= cpu_to_le32(460800),
> -	.dwDefaultFrameInterval	= cpu_to_le32(666666),
> +	.wWidth			= cpu_to_le16(UVCG_WIDTH_360P),
> +	.wHeight		= cpu_to_le16(UVCG_HEIGHT_360P),
> +	.dwMinBitRate		= cpu_to_le32(UVCG_MIN_BITRATE_360P),
> +	.dwMaxBitRate		= cpu_to_le32(UVCG_MAX_BITRATE_360P),
> +	.dwMaxVideoFrameBufferSize	= cpu_to_le32(UVCG_MAX_VIDEO_FB_SZ_360P),
> +	.dwDefaultFrameInterval	= cpu_to_le32(UVCG_DEFAULT_FRM_INTERV_360P),
>   	.bFrameIntervalType	= 3,
> -	.dwFrameInterval[0]	= cpu_to_le32(666666),
> -	.dwFrameInterval[1]	= cpu_to_le32(1000000),
> -	.dwFrameInterval[2]	= cpu_to_le32(5000000),
> +	.dwFrameInterval[0]	= cpu_to_le32(UVCG_FRM_INTERV_0_360P),
> +	.dwFrameInterval[1]	= cpu_to_le32(UVCG_FRM_INTERV_1_360P),
> +	.dwFrameInterval[2]	= cpu_to_le32(UVCG_FRM_INTERV_2_360P),
> +};
> +
> +static u32 uvcg_frame_yuv_360p_dw_frame_interval[] = {
> +	[0] = UVCG_FRM_INTERV_0_360P,
> +	[1] = UVCG_FRM_INTERV_1_360P,
> +	[2] = UVCG_FRM_INTERV_2_360P,
> +};
> +
> +static const struct uvcg_frame uvcg_frame_yuv_360p = {
> +	.fmt_type		= UVCG_UNCOMPRESSED,
> +	.frame = {
> +		.b_length			= UVC_DT_FRAME_UNCOMPRESSED_SIZE(3),
> +		.b_descriptor_type		= USB_DT_CS_INTERFACE,
> +		.b_descriptor_subtype		= UVC_VS_FRAME_UNCOMPRESSED,
> +		.b_frame_index			= 1,
> +		.bm_capabilities		= 0,
> +		.w_width			= UVCG_WIDTH_360P,
> +		.w_height			= UVCG_HEIGHT_360P,
> +		.dw_min_bit_rate		= UVCG_MIN_BITRATE_360P,
> +		.dw_max_bit_rate		= UVCG_MAX_BITRATE_360P,
> +		.dw_max_video_frame_buffer_size	= UVCG_MAX_VIDEO_FB_SZ_360P,
> +		.dw_default_frame_interval	= UVCG_DEFAULT_FRM_INTERV_360P,
> +		.b_frame_interval_type		= 3,
> +	},
> +	.dw_frame_interval	= uvcg_frame_yuv_360p_dw_frame_interval,
> +};
> +
> +static struct uvcg_frame_ptr uvcg_frame_ptr_yuv_360p = {
> +	.frm = (struct uvcg_frame *)&uvcg_frame_yuv_360p,
>   };
> +#define UVCG_WIDTH_720P			1280
> +#define UVCG_HEIGHT_720P		720
> +#define UVCG_MIN_BITRATE_720P		29491200
> +#define UVCG_MAX_BITRATE_720P		29491200
> +#define UVCG_MAX_VIDEO_FB_SZ_720P	1843200
> +#define UVCG_FRM_INTERV_0_720P		5000000
> +#define UVCG_DEFAULT_FRM_INTERV_720P	UVCG_FRM_INTERV_0_720P
>   
>   static const struct UVC_FRAME_UNCOMPRESSED(1) uvc_frame_yuv_720p = {
>   	.bLength		= UVC_DT_FRAME_UNCOMPRESSED_SIZE(1),
> @@ -202,28 +270,66 @@ static const struct UVC_FRAME_UNCOMPRESSED(1) uvc_frame_yuv_720p = {
>   	.bDescriptorSubType	= UVC_VS_FRAME_UNCOMPRESSED,
>   	.bFrameIndex		= 2,
>   	.bmCapabilities		= 0,
> -	.wWidth			= cpu_to_le16(1280),
> -	.wHeight		= cpu_to_le16(720),
> -	.dwMinBitRate		= cpu_to_le32(29491200),
> -	.dwMaxBitRate		= cpu_to_le32(29491200),
> -	.dwMaxVideoFrameBufferSize	= cpu_to_le32(1843200),
> -	.dwDefaultFrameInterval	= cpu_to_le32(5000000),
> +	.wWidth			= cpu_to_le16(UVCG_WIDTH_720P),
> +	.wHeight		= cpu_to_le16(UVCG_HEIGHT_720P),
> +	.dwMinBitRate		= cpu_to_le32(UVCG_MIN_BITRATE_720P),
> +	.dwMaxBitRate		= cpu_to_le32(UVCG_MAX_BITRATE_720P),
> +	.dwMaxVideoFrameBufferSize	= cpu_to_le32(UVCG_MAX_VIDEO_FB_SZ_720P),
> +	.dwDefaultFrameInterval	= cpu_to_le32(UVCG_DEFAULT_FRM_INTERV_720P),
>   	.bFrameIntervalType	= 1,
> -	.dwFrameInterval[0]	= cpu_to_le32(5000000),
> +	.dwFrameInterval[0]	= cpu_to_le32(UVCG_FRM_INTERV_0_720P),
>   };
>   
> -static const struct uvc_format_mjpeg uvc_format_mjpg = {
> -	.bLength		= UVC_DT_FORMAT_MJPEG_SIZE,
> -	.bDescriptorType	= USB_DT_CS_INTERFACE,
> -	.bDescriptorSubType	= UVC_VS_FORMAT_MJPEG,
> -	.bFormatIndex		= 2,
> -	.bNumFrameDescriptors	= 2,
> -	.bmFlags		= 0,
> -	.bDefaultFrameIndex	= 1,
> -	.bAspectRatioX		= 0,
> -	.bAspectRatioY		= 0,
> -	.bmInterlaceFlags	= 0,
> -	.bCopyProtect		= 0,
> +static u32 uvcg_frame_yuv_720p_dw_frame_interval[] = {
> +	[0] = UVCG_FRM_INTERV_0_720P,
> +};
> +
> +static const struct uvcg_frame uvcg_frame_yuv_720p = {
> +	.fmt_type		= UVCG_UNCOMPRESSED,
> +	.frame = {
> +		.b_length			= UVC_DT_FRAME_UNCOMPRESSED_SIZE(1),
> +		.b_descriptor_type		= USB_DT_CS_INTERFACE,
> +		.b_descriptor_subtype		= UVC_VS_FRAME_UNCOMPRESSED,
> +		.b_frame_index			= 2,
> +		.bm_capabilities		= 0,
> +		.w_width			= UVCG_WIDTH_720P,
> +		.w_height			= UVCG_HEIGHT_720P,
> +		.dw_min_bit_rate		= UVCG_MIN_BITRATE_720P,
> +		.dw_max_bit_rate		= UVCG_MAX_BITRATE_720P,
> +		.dw_max_video_frame_buffer_size	= UVCG_MAX_VIDEO_FB_SZ_720P,
> +		.dw_default_frame_interval	= UVCG_DEFAULT_FRM_INTERV_720P,
> +		.b_frame_interval_type		= 1,
> +	},
> +	.dw_frame_interval	= uvcg_frame_yuv_720p_dw_frame_interval,
> +};
> +
> +static struct uvcg_frame_ptr uvcg_frame_ptr_yuv_720p = {
> +	.frm = (struct uvcg_frame *)&uvcg_frame_yuv_720p,
> +};
> +
> +static struct uvcg_mjpeg uvcg_format_mjpeg = {
> +	.fmt = {
> +		.type			= UVCG_MJPEG,
> +		/* add to .frames and fill .num_frames at runtime */
> +		.color_matching		= (struct uvcg_color_matching *)&uvcg_color_matching,
> +	},
> +	.desc = {
> +		.bLength		= UVC_DT_FORMAT_MJPEG_SIZE,
> +		.bDescriptorType	= USB_DT_CS_INTERFACE,
> +		.bDescriptorSubType	= UVC_VS_FORMAT_MJPEG,
> +		.bFormatIndex		= 2,
> +		.bNumFrameDescriptors	= 2,
> +		.bmFlags		= 0,
> +		.bDefaultFrameIndex	= 1,
> +		.bAspectRatioX		= 0,
> +		.bAspectRatioY		= 0,
> +		.bmInterlaceFlags	= 0,
> +		.bCopyProtect		= 0,
> +	},
> +};
> +
> +static struct uvcg_format_ptr uvcg_format_ptr_mjpeg = {
> +	.fmt = &uvcg_format_mjpeg.fmt,
>   };
>   
>   DECLARE_UVC_FRAME_MJPEG(1);
> @@ -235,16 +341,45 @@ static const struct UVC_FRAME_MJPEG(3) uvc_frame_mjpg_360p = {
>   	.bDescriptorSubType	= UVC_VS_FRAME_MJPEG,
>   	.bFrameIndex		= 1,
>   	.bmCapabilities		= 0,
> -	.wWidth			= cpu_to_le16(640),
> -	.wHeight		= cpu_to_le16(360),
> -	.dwMinBitRate		= cpu_to_le32(18432000),
> -	.dwMaxBitRate		= cpu_to_le32(55296000),
> -	.dwMaxVideoFrameBufferSize	= cpu_to_le32(460800),
> -	.dwDefaultFrameInterval	= cpu_to_le32(666666),
> +	.wWidth			= cpu_to_le16(UVCG_WIDTH_360P),
> +	.wHeight		= cpu_to_le16(UVCG_HEIGHT_360P),
> +	.dwMinBitRate		= cpu_to_le32(UVCG_MIN_BITRATE_360P),
> +	.dwMaxBitRate		= cpu_to_le32(UVCG_MAX_BITRATE_360P),
> +	.dwMaxVideoFrameBufferSize	= cpu_to_le32(UVCG_MAX_VIDEO_FB_SZ_360P),
> +	.dwDefaultFrameInterval	= cpu_to_le32(UVCG_DEFAULT_FRM_INTERV_360P),
>   	.bFrameIntervalType	= 3,
> -	.dwFrameInterval[0]	= cpu_to_le32(666666),
> -	.dwFrameInterval[1]	= cpu_to_le32(1000000),
> -	.dwFrameInterval[2]	= cpu_to_le32(5000000),
> +	.dwFrameInterval[0]	= cpu_to_le32(UVCG_FRM_INTERV_0_360P),
> +	.dwFrameInterval[1]	= cpu_to_le32(UVCG_FRM_INTERV_1_360P),
> +	.dwFrameInterval[2]	= cpu_to_le32(UVCG_FRM_INTERV_2_360P),
> +};
> +
> +static u32 uvcg_frame_mjpeg_360p_dw_frame_interval[] = {
> +	[0] = UVCG_FRM_INTERV_0_360P,
> +	[1] = UVCG_FRM_INTERV_1_360P,
> +	[2] = UVCG_FRM_INTERV_2_360P,
> +};
> +
> +static const struct uvcg_frame uvcg_frame_mjpeg_360p = {
> +	.fmt_type		= UVCG_MJPEG,
> +	.frame = {
> +		.b_length			= UVC_DT_FRAME_MJPEG_SIZE(3),
> +		.b_descriptor_type		= USB_DT_CS_INTERFACE,
> +		.b_descriptor_subtype		= UVC_VS_FRAME_MJPEG,
> +		.b_frame_index			= 1,
> +		.bm_capabilities		= 0,
> +		.w_width			= UVCG_WIDTH_360P,
> +		.w_height			= UVCG_HEIGHT_360P,
> +		.dw_min_bit_rate		= UVCG_MIN_BITRATE_360P,
> +		.dw_max_bit_rate		= UVCG_MAX_BITRATE_360P,
> +		.dw_max_video_frame_buffer_size	= UVCG_MAX_VIDEO_FB_SZ_360P,
> +		.dw_default_frame_interval	= UVCG_DEFAULT_FRM_INTERV_360P,
> +		.b_frame_interval_type		= 3,
> +	},
> +	.dw_frame_interval	= uvcg_frame_mjpeg_360p_dw_frame_interval,
> +};
> +
> +static struct uvcg_frame_ptr uvcg_frame_ptr_mjpeg_360p = {
> +	.frm = (struct uvcg_frame *)&uvcg_frame_mjpeg_360p,
>   };
>   
>   static const struct UVC_FRAME_MJPEG(1) uvc_frame_mjpg_720p = {
> @@ -253,23 +388,44 @@ static const struct UVC_FRAME_MJPEG(1) uvc_frame_mjpg_720p = {
>   	.bDescriptorSubType	= UVC_VS_FRAME_MJPEG,
>   	.bFrameIndex		= 2,
>   	.bmCapabilities		= 0,
> -	.wWidth			= cpu_to_le16(1280),
> -	.wHeight		= cpu_to_le16(720),
> -	.dwMinBitRate		= cpu_to_le32(29491200),
> -	.dwMaxBitRate		= cpu_to_le32(29491200),
> -	.dwMaxVideoFrameBufferSize	= cpu_to_le32(1843200),
> -	.dwDefaultFrameInterval	= cpu_to_le32(5000000),
> +	.wWidth			= cpu_to_le16(UVCG_WIDTH_720P),
> +	.wHeight		= cpu_to_le16(UVCG_HEIGHT_720P),
> +	.dwMinBitRate		= cpu_to_le32(UVCG_MIN_BITRATE_720P),
> +	.dwMaxBitRate		= cpu_to_le32(UVCG_MAX_BITRATE_720P),
> +	.dwMaxVideoFrameBufferSize	= cpu_to_le32(UVCG_MAX_VIDEO_FB_SZ_720P),
> +	.dwDefaultFrameInterval	= cpu_to_le32(UVCG_DEFAULT_FRM_INTERV_720P),
>   	.bFrameIntervalType	= 1,
> -	.dwFrameInterval[0]	= cpu_to_le32(5000000),
> +	.dwFrameInterval[0]	= cpu_to_le32(UVCG_FRM_INTERV_0_720P),
>   };
>   
> -static const struct uvc_color_matching_descriptor uvc_color_matching = {
> -	.bLength		= UVC_DT_COLOR_MATCHING_SIZE,
> -	.bDescriptorType	= USB_DT_CS_INTERFACE,
> -	.bDescriptorSubType	= UVC_VS_COLORFORMAT,
> -	.bColorPrimaries	= 1,
> -	.bTransferCharacteristics	= 1,
> -	.bMatrixCoefficients	= 4,
> +static u32 uvcg_frame_mjpeg_720p_dw_frame_interval[] = {
> +	[0] = UVCG_FRM_INTERV_0_720P,
> +};
> +
> +static const struct uvcg_frame uvcg_frame_mjpeg_720p = {
> +	.fmt_type		= UVCG_MJPEG,
> +	.frame = {
> +		.b_length			= UVC_DT_FRAME_MJPEG_SIZE(1),
> +		.b_descriptor_type		= USB_DT_CS_INTERFACE,
> +		.b_descriptor_subtype		= UVC_VS_FRAME_MJPEG,
> +		.b_frame_index			= 2,
> +		.bm_capabilities		= 0,
> +		.w_width			= UVCG_WIDTH_720P,
> +		.w_height			= UVCG_HEIGHT_720P,
> +		.dw_min_bit_rate		= UVCG_MIN_BITRATE_720P,
> +		.dw_max_bit_rate		= UVCG_MAX_BITRATE_720P,
> +		.dw_max_video_frame_buffer_size	= UVCG_MAX_VIDEO_FB_SZ_720P,
> +		.dw_default_frame_interval	= UVCG_DEFAULT_FRM_INTERV_720P,
> +		.b_frame_interval_type		= 1,
> +	},
> +	.dw_frame_interval	= uvcg_frame_mjpeg_720p_dw_frame_interval,
> +};
> +
> +static struct uvcg_frame_ptr uvcg_frame_ptr_mjpeg_720p = {
> +	.frm = (struct uvcg_frame *)&uvcg_frame_mjpeg_720p,
> +};
> +
> +static struct uvcg_streaming_header uvcg_streaming_header = {
>   };
>   
>   static const struct uvc_descriptor_header * const uvc_fs_control_cls[] = {
> @@ -290,40 +446,40 @@ static const struct uvc_descriptor_header * const uvc_ss_control_cls[] = {
>   
>   static const struct uvc_descriptor_header * const uvc_fs_streaming_cls[] = {
>   	(const struct uvc_descriptor_header *) &uvc_input_header,
> -	(const struct uvc_descriptor_header *) &uvc_format_yuv,
> +	(const struct uvc_descriptor_header *) &uvcg_format_yuv.desc,
>   	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
>   	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
> -	(const struct uvc_descriptor_header *) &uvc_color_matching,
> -	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
> +	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
> +	(const struct uvc_descriptor_header *) &uvcg_format_mjpeg.desc,
>   	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
>   	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
> -	(const struct uvc_descriptor_header *) &uvc_color_matching,
> +	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
>   	NULL,
>   };
>   
>   static const struct uvc_descriptor_header * const uvc_hs_streaming_cls[] = {
>   	(const struct uvc_descriptor_header *) &uvc_input_header,
> -	(const struct uvc_descriptor_header *) &uvc_format_yuv,
> +	(const struct uvc_descriptor_header *) &uvcg_format_yuv.desc,
>   	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
>   	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
> -	(const struct uvc_descriptor_header *) &uvc_color_matching,
> -	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
> +	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
> +	(const struct uvc_descriptor_header *) &uvcg_format_mjpeg.desc,
>   	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
>   	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
> -	(const struct uvc_descriptor_header *) &uvc_color_matching,
> +	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
>   	NULL,
>   };
>   
>   static const struct uvc_descriptor_header * const uvc_ss_streaming_cls[] = {
>   	(const struct uvc_descriptor_header *) &uvc_input_header,
> -	(const struct uvc_descriptor_header *) &uvc_format_yuv,
> +	(const struct uvc_descriptor_header *) &uvcg_format_yuv.desc,
>   	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
>   	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
> -	(const struct uvc_descriptor_header *) &uvc_color_matching,
> -	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
> +	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
> +	(const struct uvc_descriptor_header *) &uvcg_format_mjpeg.desc,
>   	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
>   	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
> -	(const struct uvc_descriptor_header *) &uvc_color_matching,
> +	(const struct uvc_descriptor_header *) &uvcg_color_matching.desc,
>   	NULL,
>   };
>   
> @@ -387,6 +543,23 @@ webcam_bind(struct usb_composite_dev *cdev)
>   	uvc_opts->hs_streaming = uvc_hs_streaming_cls;
>   	uvc_opts->ss_streaming = uvc_ss_streaming_cls;
>   
> +	INIT_LIST_HEAD(&uvcg_format_yuv.fmt.frames);
> +	list_add_tail(&uvcg_frame_ptr_yuv_360p.entry, &uvcg_format_yuv.fmt.frames);
> +	list_add_tail(&uvcg_frame_ptr_yuv_720p.entry, &uvcg_format_yuv.fmt.frames);
> +	uvcg_format_yuv.fmt.num_frames = 2;
> +
> +	INIT_LIST_HEAD(&uvcg_format_mjpeg.fmt.frames);
> +	list_add_tail(&uvcg_frame_ptr_mjpeg_360p.entry, &uvcg_format_mjpeg.fmt.frames);
> +	list_add_tail(&uvcg_frame_ptr_mjpeg_720p.entry, &uvcg_format_mjpeg.fmt.frames);
> +	uvcg_format_mjpeg.fmt.num_frames = 2;
> +
> +	INIT_LIST_HEAD(&uvcg_streaming_header.formats);
> +	list_add_tail(&uvcg_format_ptr_yuv.entry, &uvcg_streaming_header.formats);
> +	list_add_tail(&uvcg_format_ptr_mjpeg.entry, &uvcg_streaming_header.formats);
> +	uvcg_streaming_header.num_fmt = 2;
> +
> +	uvc_opts->header = &uvcg_streaming_header;
> +
>   	/* Allocate string descriptor numbers ... note that string contents
>   	 * can be overridden by the composite_dev glue.
>   	 */
> 
> base-commit: 33cc938e65a98f1d29d0a18403dbbee050dcad9a
> prerequisite-patch-id: 5ebe1b40adede82d8413ff25a9e69f3e6b9fdfa6
> prerequisite-patch-id: 0525706498a65e3ffe25cb6ee19462da9ae6f5b5
> prerequisite-patch-id: 087583ddbd1db16eb07a5ae74683d781c4392470
> prerequisite-patch-id: 8f587de5eda5b35253bd5a320344a0797fe5812f
> prerequisite-patch-id: 3a134c208a4115c8bec97b531b6a37a1d2d000b4
> prerequisite-patch-id: c5d30c7201e25a4b6871cb929a60f241cb05797f
> prerequisite-patch-id: 3285282277d41ea3b0e1cca7ca837b14885097f3
> prerequisite-patch-id: 22ca214aeaf6f04f0531e3455fef87184eccdde1
> prerequisite-patch-id: f31cc83a77a0d486d55d3e607d8178e41cf1b4ad
> prerequisite-patch-id: da38777c59634a9591d32ec5bee366aae97fe701
> prerequisite-patch-id: d017ca64e136cad7f4bb546145c76b3e82fe8b33
> prerequisite-patch-id: 1002dc7ce0ffcc8d26e04b5c6b05f8d42f26b18a
> prerequisite-patch-id: 16194f0144231ee5271f304dee3a2e46d2f96e09
> prerequisite-patch-id: 768e6a55c3fbdf56195651f44256f2ca767f05fc
> prerequisite-patch-id: 1b0d80ad510477bfd7cae665d0b2fdee2d7adcd9
> prerequisite-patch-id: 43ae7e718ce9ff48157ad345bf2458775ee02717
> prerequisite-patch-id: e0ed8dd4046367ebc1a6b3f1e9b9b3ee3e492438
> prerequisite-patch-id: dd0b10cc033047abc126a27c0243d9e26d3c90fc
> prerequisite-patch-id: e6c77a99be80409208e918324bd8b9eb024034c8
> prerequisite-patch-id: fc0130264f43d85a1fecb2b1305b0c8e5ebcd667
> prerequisite-patch-id: 8341d7d87c9378253185bc434e25a5352160400f
> prerequisite-patch-id: 218344fb2343d2e953c8a10078faba61f7392c53
> prerequisite-patch-id: f6bc3c18ff84c999be7261a7ad953bf305e6077b
> prerequisite-patch-id: a06c7bfa391bfe7edf0949a09aa59039830b01db
> prerequisite-patch-id: 4fe63dcc7296048a67c7bace6e91a5bf65e258cc
> prerequisite-patch-id: aa1b577aaff5746a909b0dcd2aaab32a2320ce28
> prerequisite-patch-id: ba3bf3a391568fe24f46c8a56557f01fa1158fb8
> prerequisite-patch-id: a65e382e873bda296e420417eeaea4514e6f6e30
> prerequisite-patch-id: b549869029b0ecfeaa4ac9cf9dbb95169adf40d0
> prerequisite-patch-id: 46f07ae39fa155cf7ee6ec2deacb8e9f27879c6d
> prerequisite-patch-id: 3566df1640815b8c714963145f8f115a76316cee
> prerequisite-patch-id: 59b788a64fdcfa17787bda128dab0be70cc8f679
> prerequisite-patch-id: b05bdee532130860518aa7a6d1925e65ff9a88fc
> prerequisite-patch-id: 656d949909e1c1551cc37786e317cc7488849ef4
> prerequisite-patch-id: db84418e8f8d46959ca7f6a8e99b0857bca749b5
> prerequisite-patch-id: 55f11b5d4652247d27c58c9c0ebc9156f0583e78
> prerequisite-patch-id: afcebd8daeb0b39070825414c57560870b6f97a6
> prerequisite-patch-id: 85c10ddc63c4529a4abc2b24c023ab1621f70fd1
> prerequisite-patch-id: 1d95969cdc8ed6a8954b9535ba2bf0da4d5e3ef1
> prerequisite-patch-id: 37db59c354a4a1afbf685c493683de8cd7748643
> prerequisite-patch-id: d26d91821b15d36f0be4639b56b0d5771b7440a0
> prerequisite-patch-id: 6a63c4c984aa8a80542b88c99042b18384003616
> prerequisite-patch-id: d47b4bf169d4f601203c392222d8563804369571
> prerequisite-patch-id: 0945d6082543ec592f7cf8d0dcc581632e926151
> prerequisite-patch-id: 760bd00596ed56f492c3e6429ceae6098ad8aee2
> prerequisite-patch-id: 16469ac127f0ecea0c9f2b9f1a605a389aeadb3e
> prerequisite-patch-id: 7185e089f312a2f437c605082fffbe21dbbff71b
> prerequisite-patch-id: 0ece40c6ba1f7c58f6d86ff3718af8464e48c427
> prerequisite-patch-id: 4ee3c906e49cd213e6f562aa5f47bb66eb8bbc55
> prerequisite-patch-id: da64a389dda13fcc5fd808eab8f7727c2106f300
> prerequisite-patch-id: 11bed9a851381377e1cdca036d087188d8969a52
> prerequisite-patch-id: e03ccbc770ece8b6ca19d326d8132c980ca7dc74
> prerequisite-patch-id: 8cc39b7304152031add2b9183a81bae9d1f536bc
> prerequisite-patch-id: a35812a89502d58aede4389d89fd8bdf31af300c
> prerequisite-patch-id: a72aafd6c0e850fc36e164a5b4ff0c38523d3a79
> prerequisite-patch-id: b29a32a0cf5806aeda206a8e70c4bd480ae9a181
> prerequisite-patch-id: ea780e231dc00b180cfd6627ffeaada67877b60c
> prerequisite-patch-id: c32ead665755fbb0acd8ee35427fb54987b493d6
> prerequisite-patch-id: f6af0b3240064cbe99b8af9f7cc253fc9927b2c5
> prerequisite-patch-id: 0244c21e77478d0feaa1dcfe19504e4601d04efd
> prerequisite-patch-id: 1a929cc7c6c7a1c1fef902eaaa76d0d514192503
> prerequisite-patch-id: 64a7754f8978f34d4b1ca56123b1cf558f4807ce
> prerequisite-patch-id: 2a836f28c8ff5d76e694231391633e9da39e2a7b
> prerequisite-patch-id: 0f0f9fb3c58152149358888610067a1cc314a18f
> prerequisite-patch-id: ee1f374aea0b8f033bedfb3a1ca3fec1906b5c50
> prerequisite-patch-id: 7643d3fbe3bb1a285a7a6b0489126ce078114e72
> prerequisite-patch-id: 80c4751ffacd0f26a2a46242729918a2f84eb443
> prerequisite-patch-id: 94cea2b73a3fc858bbdd8348054472b53117a934
> prerequisite-patch-id: 7c1aeef6f5bcf5eb968bb50bf83c678ad644e4e8
> prerequisite-patch-id: 2b47e9d65ad72abdcf75f7cdfadca029a2131001
> prerequisite-patch-id: 0a4049cbaa75f16f392604af40d2033af52bccab
> prerequisite-patch-id: 4ee78673a8c6385e330e14f5a4abe8b04e32762d
> prerequisite-patch-id: d36ab3205e29262f859cbecc76f6f52aa35dd1b5
> prerequisite-patch-id: c5618024ca01e256f37009a35886823f7afc24ff
> prerequisite-patch-id: 0dd8645413e87a8671e865b12dbae342d134d393
> prerequisite-patch-id: 579d3dff2a34df0ba8a5e5da9b3d631a74843825
> prerequisite-patch-id: 499db6580d8bd4694c9b5fe50a6d18c77404467b
> prerequisite-patch-id: 6d87d08265a9abd7badf29faa2b5dcf0105ce78c
> prerequisite-patch-id: 4dc04d4f2fda0a3d264829dfdb1e73300523b184
> prerequisite-patch-id: 1a061bf66aacf372a420f64b94be34a39432c4bd
> prerequisite-patch-id: c45dc69fd5ed079c8c2b09a0c95e2b23983e1ec4
> prerequisite-patch-id: eed6e08722f92d2ef99951b8388cf26cef7a4c58
> prerequisite-patch-id: afa837d1b04839aab82b94baaf74c85902b68b7e
> prerequisite-patch-id: a263fdc0b74632a6e730fd422aa23cfbac4cff63
> prerequisite-patch-id: 063670d2fc7a5b0e793319a95844a96d0a4fd9b1
> prerequisite-patch-id: 9a341eb3c71da54d7736fc9cc0387ca419a5c485
> prerequisite-patch-id: bac4519fa9366a2fa90819079a2f3942e81de4cb
> prerequisite-patch-id: 955e6817eea5e89e3b63eeac4f0517b6a2476822
> prerequisite-patch-id: e4a24afdbad196771d562ff6e8a08a4fd19941f2
> prerequisite-patch-id: 9e5a80cd530d2a5000ae6f3e7d0b288e2635c41e
> prerequisite-patch-id: 481c3789b8e0ef779a323093bc3e0a3f520078f9
> prerequisite-patch-id: fa0823ebb1e355ca27e554f9342e9297626b0cf0
> prerequisite-patch-id: e2a7ddc8dfb254e3369188ca3e857e676a7ea1f6
> prerequisite-patch-id: 5c225f4b9c5d286e4622f1f830cee67b9c24828a
> prerequisite-patch-id: 25d457958fd5c9788dcfc71a4e82bfe5a611eae7
> prerequisite-patch-id: e0b3cb8bf200146a1511b7ff52e8e870b36e9899
> prerequisite-patch-id: e471651c6c2f3d32d68bdea27a0eb5c00421fed3
> prerequisite-patch-id: 8528882a216fd26ee71dc1a90737324da20e190f
> prerequisite-patch-id: 8265ca5fe33619ba6a593d3d73b700b7fa6a0787
> prerequisite-patch-id: d128841f623519ebbf16d0b2013bd6d8d2a344a3
> prerequisite-patch-id: 97061ba81de0e3c43a659066bed2ac0848bd9d3a
> prerequisite-patch-id: 2a26242501bb0b738ddab5499fe644070e66b4af
> prerequisite-patch-id: ced30181df116d98701bc04d2e6901ec91d97542
> prerequisite-patch-id: 2935f5e473720f67030c37451ae80dac955c00d2
> prerequisite-patch-id: 06eab08587d8961281f9aaf70562d34abd336ef0
> prerequisite-patch-id: 13518fac8068becf7ab2c1bdcf49be63f100fa25
> prerequisite-patch-id: e3712c2bbef46c85b97a6d512dbf13c3abe9834e
> prerequisite-patch-id: d681ba94675eb50b050427b9a2bcb530ef990b45
> prerequisite-patch-id: 5daaeb2d5fd5297b2ba691f571c9ef3125023aff
> prerequisite-patch-id: f773f29e850899ee72bcb31f749ad72d452aaad2
> prerequisite-patch-id: 8ecf5f707fdc23f1ddf62df264edfb624b48a430
> prerequisite-patch-id: 4ca0ca3848305fbb518733e2dd8982d77671f535
> prerequisite-patch-id: 8b6d8c64ef09e66902f4d3617102d5ada39b20bb
> prerequisite-patch-id: fbbeca4b75cc092909112d237ea75c702978ece6
> prerequisite-patch-id: 0e416f0307692954d9ce2b5b80e4a36a003b129c
> prerequisite-patch-id: 8274429d05b09959b95ef3c19483c865da6e0cd5
> prerequisite-patch-id: db81d80faee78da77611dae55843b2f79a941681
> prerequisite-patch-id: 4febde7b63a8e03208bd1edfbf0100f4e9954939
> prerequisite-patch-id: 5b972f691be5501f19c79f2dfffaa1b3cb057b72
> prerequisite-patch-id: e8fdd8d87187e12e69681d6577906d622af00f5f
> prerequisite-patch-id: e1dbb6ce4e71467cd7f255d01cb55c94d79a3fd0
> prerequisite-patch-id: d018725a8d6689851337fbb8a2698cbfc2cfca69
> prerequisite-patch-id: 16da4f631fceb24761c84ba101b3ee2ffbdf044f
> prerequisite-patch-id: 3dca6c4f3bfaf63d7bc76bc11aa0e2b656994516
> prerequisite-patch-id: 6f420ca44b0cc53583a3b097c04b485324b43075
> prerequisite-patch-id: cd44e36e4ed2cacb4db55d4f11d6383051922ca9
> prerequisite-patch-id: e07a600f5248208959254334778bf0853c0cd717
> prerequisite-patch-id: 2527c4b1367b6227de5be06d78974379e1ab0fd0
> prerequisite-patch-id: fe4f27ffc8a76b0db714a2037c022841c472abe3
> prerequisite-patch-id: f7bf903eb8c51ece26153a43032dee1ef39b760a
> prerequisite-patch-id: fc9347a84eea16e4a17a5ff128fae389cb288220
> prerequisite-patch-id: c7f71ba4d07e8ceefbf7633ce08147015bf2a95d
> prerequisite-patch-id: ebff53e7a3d9eed40910e6fb6641bb1e979ac81f
> prerequisite-patch-id: 928523ca9924db1c551ab8cbd369750e98cafb4e
> prerequisite-patch-id: e2ca411820f972282a41a889a070567e09c79e8f
> prerequisite-patch-id: 3e541a9e06abd6eadd3ab8fe2245b877509a35a1
> prerequisite-patch-id: 056f1e30f65fdd7062aedf3865bdfe5d70e302a7
> prerequisite-patch-id: b4e458df5c7c09db5cef50f62bf9dfeb5301a171
> prerequisite-patch-id: 28f03e0f66affc43baa15423c512b48aa91ce0ea
> prerequisite-patch-id: 4d2727d976c6c17c57215f99627281b6e75bab43
> prerequisite-patch-id: 4627109b1cd56b735f480650d3d8b96ff93bd0b4
> prerequisite-patch-id: 53f8e5ee450b232a89b58044657d7c09999fb81e
> prerequisite-patch-id: c08fa1d4db39d27260e433bc4e9d270c41d1d366
> prerequisite-patch-id: 3e7ed439c7bc72fc87933c068a38058175fa634a
> prerequisite-patch-id: 53dfe9a168a5e5c0bd74ec855c7a470980601d46
> prerequisite-patch-id: 31003dd25042bf5b28ca98748aa24fd42100ef8a
> prerequisite-patch-id: 456cc1d197ad65c19f35e1bf8444ee01fdaca43a
> prerequisite-patch-id: 066bbb5e6ec708cdda966750427c76131dce86ed
> prerequisite-patch-id: 17aa7ead1033fed64f30e54d8802a3ba9c1cd6ba
> prerequisite-patch-id: 6dd97f9bc4bf0abac4ef243fe56279dc80410d54
> prerequisite-patch-id: c0d8ae21e4d89725d961d9726503d268436be8f0
> prerequisite-patch-id: 84d193c0fcc876039f0a42d7ba5d97a04fc349be
> prerequisite-patch-id: ac67cf4c14ba9ba5e512543da14f45ea80fbe427
> prerequisite-patch-id: 219d0a2f0d5c44fa7131dc4d2fff495bcd20991c
> prerequisite-patch-id: 976f2d30772c05eb6046d23c4d8bcc001a872c97
> prerequisite-patch-id: e3589d9c224a6b2d7cedc47325cfccffcb0a9fb0
> prerequisite-patch-id: 52a547b930fe93f92896ca77caa08bbae549e350
> prerequisite-patch-id: 7936b29c6c04fb333d8b8868a4f3169061e61fe8
> prerequisite-patch-id: 8bd9598dfe7ef599ff49307d98377feb7b0c3444
> prerequisite-patch-id: b6e21d774b4da07ab6c72b9d2ec51c89e9257073
> prerequisite-patch-id: b7050a41f05a2fbdd18d24af4af040570a5f3439
> prerequisite-patch-id: e7588860c5c1664b5d5e7bccb1edb35e7829009c
> prerequisite-patch-id: ce57950db84414be028283147d4b73d343e9e6bf
> prerequisite-patch-id: 518ca13f3560fc3f132b04c1bd44e2b48b694ee6
> prerequisite-patch-id: ebd2edfe1db2515d08295399c92506a5f29275ed
> prerequisite-patch-id: a7a701a4bf961a7bcaee4c22ba52d261afc3a260
> prerequisite-patch-id: f18ea97771a9d1e8ec68ee58a3321b358214ca87
> prerequisite-patch-id: cecccb908b9a2788474c0a862715eec3849fc4f2
> prerequisite-patch-id: 20ed711568d47ae277312d8f6d71347fd94775d6
> prerequisite-patch-id: ddf1ce229eeac844bd6cf2c06798b2ec2e4615cb
> prerequisite-patch-id: dde6bdf7b554844827d5f0d7fe4929e5dc5b6fdb
> prerequisite-patch-id: 0ef2b52dde653e733afa898001ccde4fd7c73a3d
> prerequisite-patch-id: e2e9438e1f4d46f5bbce5fcf6c7fcb72e5cf8a62
> prerequisite-patch-id: 16fdfa005ee0791d278ceff69926fa680af4fbb8
> prerequisite-patch-id: f7a59bf1a33d733c643fcf1a87a17519fc08683a
> prerequisite-patch-id: ccdd4a455a91375273c92c64af4d8f3c444aba63
> prerequisite-patch-id: 69e3d3e494b5369399cd3da3502b0581fc6c8396
> prerequisite-patch-id: 2b54ad55e5a19de610b95f9d2fd66731076e2b73
> prerequisite-patch-id: 5556b03cb3b79d2056cca8f026db8b42be2155e5
> prerequisite-patch-id: 5bb329960c9a2eff9ebedfdb35d9b28f9b82c82b
> prerequisite-patch-id: 69adac8a810cf032f98c7078b7e0667474f3ea7a
> prerequisite-patch-id: 8df09b22ce9839f5b457510f22449bec40265c72
> prerequisite-patch-id: 04a0db4e442eafc0b7c01baa49ddde14552edb27
> prerequisite-patch-id: 82563e0dcade24ba1b84943c111d1e64a5bab4e5
> prerequisite-patch-id: 4164c4508821ecd370237261f871028e002adc23
> prerequisite-patch-id: f1f48574cbb31242144da1754f59b681204e557b
> prerequisite-patch-id: c6c01da1eeeae3783e95cb7abcc7bdb71f499bcf
> prerequisite-patch-id: 8ccbb0d6c5b8f65e1838cd04eb9109f2c3d2402b
> prerequisite-patch-id: 654aacd0032bf78838b6b6e4b85921999b874476
> prerequisite-patch-id: 41680d6e65f8ff2a5852377b13f700f559dece42
> prerequisite-patch-id: 3ea65a35f5537a5489914209e342de7a9c3c9f54
> prerequisite-patch-id: e578f45e002097efc20a3b867e3a8b410ff4a75c
> prerequisite-patch-id: bf80b29664448c4bcc0bee0e7e0d23388d899d04
> prerequisite-patch-id: ac661509dd5ac20b68960900db611ec95785809e
> prerequisite-patch-id: 472fe4a75666bfca8f0e24abff9d53afe4d66f10
> prerequisite-patch-id: 776c09245281f5430c7d4c3aec62d19e944b7e4e
> prerequisite-patch-id: c8985de925ad5cb1cfb8e4192dd52f8672d77f95
> prerequisite-patch-id: 1da25d35bf6bffb6e95ee12e45dabf0a07a6c259
> prerequisite-patch-id: d2ec9beea48cad9da3bd4ea751a63bf8fa37ad16
> prerequisite-patch-id: ef3ba331c22d832c4c47addd6235bc68c1723449
> prerequisite-patch-id: 8e6dc1da0091f6e421af39ca8ffd81073f798086
> prerequisite-patch-id: cbde629cd2c2d3c0fb8856791240a7d306abb11b
> prerequisite-patch-id: 692dc54bcab5233d12fd13ebd64d34690dd4ca4f
> prerequisite-patch-id: 2e8f1efbd3dbec6ac469dbd8dd76fb514895e6df
> prerequisite-patch-id: d6ddf93c450c80ff8c51a3dfa0dc2f9d4c004351
> prerequisite-patch-id: f165cc2b43a90297b7e5f73c16db711d618c0a0d
> prerequisite-patch-id: d806b51be2e50e5e53dc2bbae271e24feefb8bfd
> prerequisite-patch-id: dbb5aad933a4914906878ce64e1f7f47b5e3e4e3
> prerequisite-patch-id: c89ace683de46835ef7025d1e8d547338b6820b0
> prerequisite-patch-id: 456af31afa1d65e82428e965c9c0fffac76351d8
> prerequisite-patch-id: 536e39837c517f3f7e0281f4eb110f3a91876f42
> prerequisite-patch-id: 7679385d798221056f90ced9b8d90474c765a709
> prerequisite-patch-id: 3a07219239f637cb938692be5d4df8f3a5ed1a99
> prerequisite-patch-id: 5dc2871c02a06f38f50813fee90340b3f64bd512
> prerequisite-patch-id: b6f446e435a87994880b1edf3b877176121daec5
> prerequisite-patch-id: a3176150ed5b11b1ebf65d6416c0936b6c9e1688
> prerequisite-patch-id: 60ecfd7e8e5fdaccc28a49fb6369599063cf6041
> prerequisite-patch-id: 92c3eebca6197f031b4309c2c5a79f59dcdc042d
> prerequisite-patch-id: 3b6994514df38c0eadd1b9e5c9454ec435ba7ddc
> prerequisite-patch-id: da50681df090055cc29111db1c4016f3425dce93
> prerequisite-patch-id: 31344ae9500cbb8ef80a28cf2081459225217cde
> prerequisite-patch-id: fac2736f530d5d3be9f44690d365537a875e45b2
> prerequisite-patch-id: c95dfefcbceec494d10393bba437570de6970754
> prerequisite-patch-id: fd42760815c26a4a518ece232716a90f7b03e6e3
> prerequisite-patch-id: 15f6b599909b2090e78988b2ea17ccf55dc9a163
> prerequisite-patch-id: 614e13cbccd0f62700eda43aef5b104e8e95ff03
> prerequisite-patch-id: ba9e8827204840685f535fe23f7d0565227a8a9a
> prerequisite-patch-id: 67e2b292d975b756242cb2ad727ea25d108e5f99
> prerequisite-patch-id: 937a3fd66340456d52bdc04fc3ec2e48e8cc5336
> prerequisite-patch-id: d56686ed7242695ceefb1492b2ff9081262827dd
> prerequisite-patch-id: 840d28846318720ac79f0dc1deaad344471f6f7e
> prerequisite-patch-id: 8c463c603e01f9efa770b8e360e88c34a0e194c0
> prerequisite-patch-id: b36622cbb14c9185e89f370d40034cb17a3096ce
> prerequisite-patch-id: 6bccb149dddd35a5eb4b2f93f6959f8ee84f379a
> prerequisite-patch-id: 5b537196ffadb7e4213cb4668495925a0c8f9051
> prerequisite-patch-id: 11207c92aab048b73d8df6ff17f05840fea5db94
> prerequisite-patch-id: 2af8ffeb4b096510c66a4dd702b81c700ab0f2cf
> prerequisite-patch-id: ba9bef9d973df799fd080b551681d834abe0704b
> prerequisite-patch-id: 7b6d3c77ae4df9c7e640d8fad1dee449128a347d
> prerequisite-patch-id: f89426f661bcfc829475df696def23bc97552b3e
> prerequisite-patch-id: b983c90c26e055622f32f445003fa88add3c29cf
> prerequisite-patch-id: c73da10a6bbe5d492ff62b3b47ae9a00a9812ab9
> prerequisite-patch-id: 15832333123ee7fa38eea3541d85be7188d6088d
> prerequisite-patch-id: f65926480dec14186812c7e45a0d44c3412a9426
> prerequisite-patch-id: 06244b82611cb8b602c7c751a1cc2e0f3c6d6c39
> prerequisite-patch-id: ee9eaa89b5957bd7b98a0af745192c8e27bc091f
> prerequisite-patch-id: 611b9c5c5269ddd10684879ae8de43e6e1d766b0
> prerequisite-patch-id: 1c795709fd57d227f56edc5316e403eb230babb5
> prerequisite-patch-id: d8acf8ca6d4ccdcaf22180371bd2ea57d73718e1
> prerequisite-patch-id: eab24819de1fc9dbb9c1a34d3807dc1839130232
> prerequisite-patch-id: 6c86169373560d5ed493b355648786ca9357f526
> prerequisite-patch-id: 84b4d6e5cfb121c5a8abc7d41d3ca6523ed5e339
> prerequisite-patch-id: ede3bb9f72733a74a425376234c2cf7d38c7d8bf
> prerequisite-patch-id: c7ff62d96db4d2cdffe6801b08762e415cd1ebdb
> prerequisite-patch-id: 9b4f37b9f9bc0b58fb3700c695dd04f5f6544e2e
> prerequisite-patch-id: 288cd71d639bfa4894287eb944f36ef6116ff742
> prerequisite-patch-id: 488f0ff662cf64e5d7f44b6b5b74193599af9ab8
> prerequisite-patch-id: 84f3b35f389e647977f306d682102839c35a8ab0
> prerequisite-patch-id: fa2e8b3324dea766e5f542e5bc1e5a79cf6ba049
> prerequisite-patch-id: 017dc872171d45afe1018fa793304dbc7782a820
> prerequisite-patch-id: 44ddd56aec008da909b8603bcb9ae0cf10743976
> prerequisite-patch-id: fdb5048667db3098ecc1626c974ae75cec629008
> prerequisite-patch-id: 96ab3acfc435e9d7530e7a9f8926ca5d729fe21a
> prerequisite-patch-id: 81664270365445ba652668f03d9e57479795c7df
> prerequisite-patch-id: eccacedc3fbbf9e9cc51610a157f51780f7ee607
> prerequisite-patch-id: e5ded3d1a9f370d65869ed0957e2fe3d3680ee4d
> prerequisite-patch-id: e84b89ea28e81a19f43984f21c006ce9132edbb9
> prerequisite-patch-id: 36735447019e5c9a8117fc3305558448b49493f5
> prerequisite-patch-id: 41740b15a5d3566aa3cea7e32c043af99ae9d647
> prerequisite-patch-id: c80422ce3398c007ace9e81dcad4e1230c146fa7
> prerequisite-patch-id: 24ec02bd3ebc763a4c21ea6799bd7987fe89a303
> prerequisite-patch-id: 8c662ecb03d7d33010bebcf231763e0b8dc12588
> prerequisite-patch-id: ce08cad5454058d51ca5b51cdfe6f6911f857455
> prerequisite-patch-id: 8eb9dceebf9da2f2ae441099ba4053545c8f6632
> prerequisite-patch-id: d075d95d9f67dddc84ece6008bfefbe474f20d2a
> prerequisite-patch-id: 4d806312ce0aed0f7aeafe04a9a04acad94a1cf8
> prerequisite-patch-id: eeef8c7112776c13004ab4ff11ff4a3ac91c2f28
> prerequisite-patch-id: ffcbdcb39f74b9f73fca84d2f69dea44ebc828a2
> prerequisite-patch-id: c2b5f3a99ff1af80036b17ea734e02960d035e2b
> prerequisite-patch-id: 20ab1ceb376577161a5927dbfba9f77d5456419d
> prerequisite-patch-id: 577d3be3e2d60483020af3c49368e6ab0214542b
> prerequisite-patch-id: 701e790694aa4193b9e79a721f1c9c850fd38404
> prerequisite-patch-id: 1892575a4a8de103accd4631cdc06579f3756a3f
> prerequisite-patch-id: f913fbe787ac152ffc85cab397ba1964bb453fbe
> prerequisite-patch-id: a1197fb938aeef4267e3c1431833d0a0bf5d05c5
> prerequisite-patch-id: ddbff3674c2d6d5bba6182e87e9f94bdb4aaa286
> prerequisite-patch-id: 93261fa0817e8783a88518bfc22b6a0e17eb0fad
> prerequisite-patch-id: d5643561620c8c22230dc98323af1f4981e57b2a
> prerequisite-patch-id: 9991333653680250c88a751d6f40e3c7d860fe00
> prerequisite-patch-id: 26771207dab3f5350b9ceafabeb6aab1c9067fb8
> prerequisite-patch-id: d8b0e3e82bc23cbefca6424357ddeb4ff5c56f71
> prerequisite-patch-id: 8598986ae890f6bb5ce40c6d0d6d492946c0556e
> prerequisite-patch-id: 229e06c5d4549b802b052d0ed3ef38ba4f884bda
> prerequisite-patch-id: e490406bffdda4a1ce087a35f297f9b09e1e09af
> prerequisite-patch-id: 31c64a958d6a72ede489a295b82b973fb5ae89aa
> prerequisite-patch-id: 1c14b1c1e0864ed209606f956bae444f323df23b
> prerequisite-patch-id: b17834e99e522665a8fe22c7c81ab157798a6acc
> prerequisite-patch-id: fed728a689b33dc67fcf66f0d68f7040075594b9
> prerequisite-patch-id: f40a435bb3b586ecd71c134ecb87cb89fdf6c0fc
> prerequisite-patch-id: 20c265682e66fb85d4dffd43213d7daec411003c
> prerequisite-patch-id: a451d1115e6c4bd4a89d15c66226209abbb66b78
> prerequisite-patch-id: d24dc6d9d82b1f4ceee3ee280ace4d4f70d1eea4
> prerequisite-patch-id: 922d294b46da5780cf547182c44e3d79bbc2b425
> prerequisite-patch-id: f56f6ac263fd2fc1d5544be3f8ea2d7b98b71fb5
> prerequisite-patch-id: 30996e0bb7b52c481b533148ccdb6cb0b8155a80
> prerequisite-patch-id: f02c49d98ff1c907ea0fe18810c31f170ede1bb5
> prerequisite-patch-id: c35bc41858fbcafcd7e1ea7ad9e3244728d0d206
> prerequisite-patch-id: 7ea803e30b70fdab3403f44042f28c4696a4eb31
> prerequisite-patch-id: 37187c54568da5d00272531a30dbfd384498dd79
> prerequisite-patch-id: fea02201f9f7da3f98fd1308770cf141736d7ed2
> prerequisite-patch-id: 2785d578dd02e6ea7a96c1bb1677bbabf723e5c3
> prerequisite-patch-id: 576f23a2ac4932a25e6a5cea5c20a119fa1d0e6a
> prerequisite-patch-id: e0b43a6b47f2f1ffa3b15a472212a4506914e6f9
> prerequisite-patch-id: 258df503125b04dd9993bf43cfc0677de5e89be3
> prerequisite-patch-id: 8b470ebf6fd3f246a1e49e50bae7a4afa59c913b
> prerequisite-patch-id: 0461b3073467a18df15a5ff640f44a989e9c2c0b
> prerequisite-patch-id: 21c6dcd72ee2a005352c498ed279bfe8e2930510
> prerequisite-patch-id: 2b9dcbaec981f509a7e96a739e3e32845d1fa24b
> prerequisite-patch-id: 7e3208a7f1759fd09dc33e8c9aaaf700a05efbf8
> prerequisite-patch-id: 81b8ac6bd8134c7afe5c9c5222f855827b3d7787
> prerequisite-patch-id: bea85ef0db7ff762e3b3a854a626525b64f0daa5
> prerequisite-patch-id: 4f8798e504933e039a09cdac778b4dc6b3661b27
> prerequisite-patch-id: c5279ce9c9dc0fe3cc21426c4cefa20fe788c42a
> prerequisite-patch-id: 575f47264cc4247d494d15dd00c06c3ded1766ea
> prerequisite-patch-id: bc6aebd34031d71c7be6f8355e4cb42c8f7b786e
> prerequisite-patch-id: cdc7bc4c06a416f4910f3c1675ee436ddfdbeb83
> prerequisite-patch-id: 7e7e1261a49533efbe5e852c6af5a02c5ca36bc9
> prerequisite-patch-id: b3b8b537a4bb868efbc5b947d7e01f9cada2b7ac
> prerequisite-patch-id: 32c7d7471e50b2bf8fdc3f9b1aa9e14db2bcbf37
> prerequisite-patch-id: c5bb81eaf7c7b17b63be7b744022daa1b92cd3b7
> prerequisite-patch-id: c56dd39e1788b99d3543c822918051a0bf887ba2
> prerequisite-patch-id: b42b73bcde32aafb7d9a6ef5ba7f26f17bd8db59
> prerequisite-patch-id: 42efac5083e94a1d42635e011d917c5d18e9be27
> prerequisite-patch-id: 683965db767419abfebebf55e9afe543a793e6d8
> prerequisite-patch-id: f1c4002fa9c3516a9c5b46b89e481f5d552636ea
> prerequisite-patch-id: a1961e7ed732ac5a2daa3224280ff23bbd8168fe
> prerequisite-patch-id: d657fc24bfcbf9a43866aee1f4cd729982382ec3
> prerequisite-patch-id: cc0515a3ab19699883fee4c83b13112660cbf239
> prerequisite-patch-id: 0ae4961bf8a9733e50b507e8aea57f6b5bf2344c
> prerequisite-patch-id: f837adcf95110f21134de04863fcc29bb4382b17
> prerequisite-patch-id: 4338b960395ae158ac74401be877ee69af53d076
> prerequisite-patch-id: e00a92f7ba700bb3124b2d307330c3a0db018328
> prerequisite-patch-id: 9985702bd7ababc66ec9df777efb151ad51a9ad3
> prerequisite-patch-id: cd2be8a751fe6b5d14448405efd7dc37b42cfadd
> prerequisite-patch-id: ce5b6e5f14f076a995c16471a07db8e5e0c00f97
> prerequisite-patch-id: d6a1672686ece56d69739def59602b8a0b98c942
> prerequisite-patch-id: da601b7472a1b1fa2bb8e7b4e637852cd73b2997
> prerequisite-patch-id: 51e520d6f14c3ac9995cf7a306df01b04a9ff70f
> prerequisite-patch-id: fa4321957bfd59bc4ad0b49daf795201d9092b6c
> prerequisite-patch-id: d8227b1eb3ecbcb6e9141ece6a0bc849bd0f3643
> prerequisite-patch-id: cb03a406fff6d8c41860cee892a2affa1efdb7e4
> prerequisite-patch-id: a3c8abcf1f03017ed5a35945f9a876929ab0893f
> prerequisite-patch-id: 449f73baf6f6222d3b4498ebc46f9284922594f6
> prerequisite-patch-id: 1159473e2aec02edddd624dfbd6b74ce58eac9fb
> prerequisite-patch-id: 124e5f0304a8d702eee4558f2d45caa08d3d9948
> prerequisite-patch-id: 84faa8bf25a31c1120b3982e9c8fa90552c9e7bc
> prerequisite-patch-id: 2b7cc6947b034902e3834b70202d75a1a7394e10
> prerequisite-patch-id: f2328625ae2193c3c8e336b154b62030940cece8
> prerequisite-patch-id: 5a00737b1f20b86865e5e99c3cbea27de9ae8438
> prerequisite-patch-id: c1723ec04df1fcfcdab13447ab574aa6423c567f
> prerequisite-patch-id: 857a8e829413a285adde8881468fd52f1e2019c1
> prerequisite-patch-id: a0e43d95e98b20be3cc6e260ef436da026c9b42f
> prerequisite-patch-id: 4c9d15f7b9d2732fec205ab0c3e18aa0904d9d63
> prerequisite-patch-id: 4cf8e4cb3d11fa7269b4781e9839500a22094c86
> prerequisite-patch-id: 143b73d94d7ba5130e229c269ea41ce192bb0bf0
> prerequisite-patch-id: bd3e6b52b02d5937eb9084da3bfd5014c801ab93
> prerequisite-patch-id: a63f7ac4e4e6eacfa5810bfb03b7369f7d010a23
> prerequisite-patch-id: a70eb8f4c1a57b1dd8928c70d694bcd7d51483c0
> prerequisite-patch-id: 555dd4f8f7da8ba8b7e7c10e96116c445e497c33
> prerequisite-patch-id: cf950631402b9f5d61f32f2a37b1b073719847d4
> prerequisite-patch-id: cd2377dfb0b4d63839101e674ebe3604ddb8a518
> prerequisite-patch-id: 84318df68e1bc99a62363f70f6f0e059855b9be7
> prerequisite-patch-id: 5c07ef2a50cecc614b6a61a0d8f6a4f951509428

I just noticed that I bumped the kernel to v6.7-rc5, but while formatting the
patch I re-used the old command with the old --base. So git dutifully
generated all the prerequisite-patch-id. So be informed that this is rebased on
top of v6.7-rc5.

Regards,

Andrzej

