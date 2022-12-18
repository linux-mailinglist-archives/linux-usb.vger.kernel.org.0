Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1D8A64FF5A
	for <lists+linux-usb@lfdr.de>; Sun, 18 Dec 2022 16:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiLRPzw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Dec 2022 10:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbiLRPzv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Dec 2022 10:55:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3998A1AB
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 07:55:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61332825;
        Sun, 18 Dec 2022 16:55:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671378948;
        bh=F/Mm25pdlAnW1mGKsYPsmm2l8cNUKQ2PYwXRtCBt9aI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nwNSna2m+AZdxVANeeIhgjyegA6ah0SZUbCPjSEBIIW8qVx4dFqC0gD87L8volY9c
         eu29i2wvysW5zxixXqAWefkWj5/dW1EjFPTCnlcdAK86XeqJD5dxt80SxW+V0Yv915
         DreywhmhGavehOBZmTSJU09DLkRhf+S1ZVsPqj5A=
Date:   Sun, 18 Dec 2022 17:55:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] usb: gadget: g_webcam: Send color matching descriptor
 per frame
Message-ID: <Y584AMESSdNzEDgk@pendragon.ideasonboard.com>
References: <20221216160528.479094-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221216160528.479094-1-dan.scally@ideasonboard.com>
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

On Fri, Dec 16, 2022 at 04:05:28PM +0000, Daniel Scally wrote:
> Currently the color matching descriptor is only sent across the wire
> a single time, following the descriptors for each format and frame.
> According to the UVC 1.5 Specification 3.9.2.6 ("Color Matching
> Descriptors"):
> 
> "Only one instance is allowed for a given format and if present,
> the Color Matching descriptor shall be placed following the Video
> and Still Image Frame descriptors for that format".
> 
> Add another reference to the color matching descriptor after the
> yuyv frames so that it's correctly transmitted for that format
> too.
> 
> Fixes: a9914127e834 ("USB gadget: Webcam device")
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/usb/gadget/legacy/webcam.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/gadget/legacy/webcam.c b/drivers/usb/gadget/legacy/webcam.c
> index 53e38f87472b..c06dd1af7a0c 100644
> --- a/drivers/usb/gadget/legacy/webcam.c
> +++ b/drivers/usb/gadget/legacy/webcam.c
> @@ -293,6 +293,7 @@ static const struct uvc_descriptor_header * const uvc_fs_streaming_cls[] = {
>  	(const struct uvc_descriptor_header *) &uvc_format_yuv,
>  	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
>  	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
> +	(const struct uvc_descriptor_header *) &uvc_color_matching,
>  	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
>  	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
>  	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
> @@ -305,6 +306,7 @@ static const struct uvc_descriptor_header * const uvc_hs_streaming_cls[] = {
>  	(const struct uvc_descriptor_header *) &uvc_format_yuv,
>  	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
>  	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
> +	(const struct uvc_descriptor_header *) &uvc_color_matching,
>  	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
>  	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
>  	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,
> @@ -317,6 +319,7 @@ static const struct uvc_descriptor_header * const uvc_ss_streaming_cls[] = {
>  	(const struct uvc_descriptor_header *) &uvc_format_yuv,
>  	(const struct uvc_descriptor_header *) &uvc_frame_yuv_360p,
>  	(const struct uvc_descriptor_header *) &uvc_frame_yuv_720p,
> +	(const struct uvc_descriptor_header *) &uvc_color_matching,
>  	(const struct uvc_descriptor_header *) &uvc_format_mjpg,
>  	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_360p,
>  	(const struct uvc_descriptor_header *) &uvc_frame_mjpg_720p,

-- 
Regards,

Laurent Pinchart
