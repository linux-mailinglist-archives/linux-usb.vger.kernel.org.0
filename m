Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C345644DD8
	for <lists+linux-usb@lfdr.de>; Tue,  6 Dec 2022 22:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiLFVSZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Dec 2022 16:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiLFVSX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Dec 2022 16:18:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C37C47331
        for <linux-usb@vger.kernel.org>; Tue,  6 Dec 2022 13:18:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DE8E3D7;
        Tue,  6 Dec 2022 22:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670361500;
        bh=4a0F7+O8MPj5cMraRBVpGFL9G4kVSKPSASSfByUKs+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r3IQaedS6bvyu0Cbk0FSv1eg+1xHQ4Lph9ykzumoiwxUp60rO0sBwcHJDSf+Z676w
         fkY7bPifXPjNsEF0u/E19nTUkw+lNs/6vMDVgOwwMuUHhDDlZoPrev6RmhO3gyKRs3
         a4pLM6OLcCNKXl4BbPQB4JMpgnaqwH5iHpZwYZ7k=
Date:   Tue, 6 Dec 2022 23:18:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2] usb: gadget: uvc: Rename bmInterfaceFlags ->
 bmInterlaceFlags
Message-ID: <Y4+xmpzrFjSNC/Ip@pendragon.ideasonboard.com>
References: <20221206161203.1562827-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221206161203.1562827-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Tue, Dec 06, 2022 at 04:12:03PM +0000, Daniel Scally wrote:
> In the specification documents for the Uncompressed and MJPEG USB
> Video Payloads, the field name is bmInterlaceFlags - it has been
> misnamed within the kernel.
> 
> Although renaming the field does break the kernel's interface to
> userspace it should be low-risk in this instance. The field is read
> only and hardcoded to 0, so there was never any value in anyone
> reading it. A search of the uvc-gadget application and all the
> forks that I could find for it did not reveal any users either.
> 
> Fixes: cdda479f15cd ("USB gadget: video class function driver")
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> 
> 	- Updated the legacy driver too
> 	- Updated the ABI docs...which I also forgot last time (my bad)
> 
>  Documentation/ABI/testing/configfs-usb-gadget-uvc |  4 ++--
>  drivers/usb/gadget/function/uvc_configfs.c        | 12 ++++++------
>  drivers/usb/gadget/legacy/webcam.c                |  4 ++--
>  include/uapi/linux/usb/video.h                    |  4 ++--
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> index 611b23e6488d..f00cff6d8c5c 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
> @@ -197,7 +197,7 @@ Description:	Specific MJPEG format descriptors
>  					read-only
>  		bmaControls		this format's data for bmaControls in
>  					the streaming header
> -		bmInterfaceFlags	specifies interlace information,
> +		bmInterlaceFlags	specifies interlace information,
>  					read-only
>  		bAspectRatioY		the X dimension of the picture aspect
>  					ratio, read-only
> @@ -253,7 +253,7 @@ Description:	Specific uncompressed format descriptors
>  					read-only
>  		bmaControls		this format's data for bmaControls in
>  					the streaming header
> -		bmInterfaceFlags	specifies interlace information,
> +		bmInterlaceFlags	specifies interlace information,
>  					read-only
>  		bAspectRatioY		the X dimension of the picture aspect
>  					ratio, read-only
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 4303a3283ba0..76cb60d13049 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -1512,7 +1512,7 @@ UVCG_UNCOMPRESSED_ATTR(b_bits_per_pixel, bBitsPerPixel, 8);
>  UVCG_UNCOMPRESSED_ATTR(b_default_frame_index, bDefaultFrameIndex, 8);
>  UVCG_UNCOMPRESSED_ATTR_RO(b_aspect_ratio_x, bAspectRatioX, 8);
>  UVCG_UNCOMPRESSED_ATTR_RO(b_aspect_ratio_y, bAspectRatioY, 8);
> -UVCG_UNCOMPRESSED_ATTR_RO(bm_interface_flags, bmInterfaceFlags, 8);
> +UVCG_UNCOMPRESSED_ATTR_RO(bm_interlace_flags, bmInterlaceFlags, 8);
>  
>  #undef UVCG_UNCOMPRESSED_ATTR
>  #undef UVCG_UNCOMPRESSED_ATTR_RO
> @@ -1541,7 +1541,7 @@ static struct configfs_attribute *uvcg_uncompressed_attrs[] = {
>  	&uvcg_uncompressed_attr_b_default_frame_index,
>  	&uvcg_uncompressed_attr_b_aspect_ratio_x,
>  	&uvcg_uncompressed_attr_b_aspect_ratio_y,
> -	&uvcg_uncompressed_attr_bm_interface_flags,
> +	&uvcg_uncompressed_attr_bm_interlace_flags,
>  	&uvcg_uncompressed_attr_bma_controls,
>  	NULL,
>  };
> @@ -1574,7 +1574,7 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
>  	h->desc.bDefaultFrameIndex	= 1;
>  	h->desc.bAspectRatioX		= 0;
>  	h->desc.bAspectRatioY		= 0;
> -	h->desc.bmInterfaceFlags	= 0;
> +	h->desc.bmInterlaceFlags	= 0;
>  	h->desc.bCopyProtect		= 0;
>  
>  	INIT_LIST_HEAD(&h->fmt.frames);
> @@ -1700,7 +1700,7 @@ UVCG_MJPEG_ATTR(b_default_frame_index, bDefaultFrameIndex, 8);
>  UVCG_MJPEG_ATTR_RO(bm_flags, bmFlags, 8);
>  UVCG_MJPEG_ATTR_RO(b_aspect_ratio_x, bAspectRatioX, 8);
>  UVCG_MJPEG_ATTR_RO(b_aspect_ratio_y, bAspectRatioY, 8);
> -UVCG_MJPEG_ATTR_RO(bm_interface_flags, bmInterfaceFlags, 8);
> +UVCG_MJPEG_ATTR_RO(bm_interlace_flags, bmInterlaceFlags, 8);
>  
>  #undef UVCG_MJPEG_ATTR
>  #undef UVCG_MJPEG_ATTR_RO
> @@ -1728,7 +1728,7 @@ static struct configfs_attribute *uvcg_mjpeg_attrs[] = {
>  	&uvcg_mjpeg_attr_bm_flags,
>  	&uvcg_mjpeg_attr_b_aspect_ratio_x,
>  	&uvcg_mjpeg_attr_b_aspect_ratio_y,
> -	&uvcg_mjpeg_attr_bm_interface_flags,
> +	&uvcg_mjpeg_attr_bm_interlace_flags,
>  	&uvcg_mjpeg_attr_bma_controls,
>  	NULL,
>  };
> @@ -1755,7 +1755,7 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
>  	h->desc.bDefaultFrameIndex	= 1;
>  	h->desc.bAspectRatioX		= 0;
>  	h->desc.bAspectRatioY		= 0;
> -	h->desc.bmInterfaceFlags	= 0;
> +	h->desc.bmInterlaceFlags	= 0;
>  	h->desc.bCopyProtect		= 0;
>  
>  	INIT_LIST_HEAD(&h->fmt.frames);
> diff --git a/drivers/usb/gadget/legacy/webcam.c b/drivers/usb/gadget/legacy/webcam.c
> index 94e22867da1d..53e38f87472b 100644
> --- a/drivers/usb/gadget/legacy/webcam.c
> +++ b/drivers/usb/gadget/legacy/webcam.c
> @@ -171,7 +171,7 @@ static const struct uvc_format_uncompressed uvc_format_yuv = {
>  	.bDefaultFrameIndex	= 1,
>  	.bAspectRatioX		= 0,
>  	.bAspectRatioY		= 0,
> -	.bmInterfaceFlags	= 0,
> +	.bmInterlaceFlags	= 0,
>  	.bCopyProtect		= 0,
>  };
>  
> @@ -222,7 +222,7 @@ static const struct uvc_format_mjpeg uvc_format_mjpg = {
>  	.bDefaultFrameIndex	= 1,
>  	.bAspectRatioX		= 0,
>  	.bAspectRatioY		= 0,
> -	.bmInterfaceFlags	= 0,
> +	.bmInterlaceFlags	= 0,
>  	.bCopyProtect		= 0,
>  };
>  
> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> index bfdae12cdacf..6e8e572c2980 100644
> --- a/include/uapi/linux/usb/video.h
> +++ b/include/uapi/linux/usb/video.h
> @@ -466,7 +466,7 @@ struct uvc_format_uncompressed {
>  	__u8  bDefaultFrameIndex;
>  	__u8  bAspectRatioX;
>  	__u8  bAspectRatioY;
> -	__u8  bmInterfaceFlags;
> +	__u8  bmInterlaceFlags;
>  	__u8  bCopyProtect;
>  } __attribute__((__packed__));
>  
> @@ -522,7 +522,7 @@ struct uvc_format_mjpeg {
>  	__u8  bDefaultFrameIndex;
>  	__u8  bAspectRatioX;
>  	__u8  bAspectRatioY;
> -	__u8  bmInterfaceFlags;
> +	__u8  bmInterlaceFlags;
>  	__u8  bCopyProtect;
>  } __attribute__((__packed__));
>  

-- 
Regards,

Laurent Pinchart
