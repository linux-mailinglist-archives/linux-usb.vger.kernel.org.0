Return-Path: <linux-usb+bounces-13356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CE195011E
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 11:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 760D1B21DE2
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 09:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C80A16D33F;
	Tue, 13 Aug 2024 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cWuWTQBa"
X-Original-To: linux-usb@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085AB210E7;
	Tue, 13 Aug 2024 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723541000; cv=none; b=NdvbYOr+/Fi9tXmj7Dmeb3SORUih1xU4dKC1fXlisd4Thzny/NgAz1IIHwzU4zjT3fxl/FVLMkRlnMVh0R395w0BLp6g10ffZ3GPiC4KC90xs4PHq77UHt3yP9h3l+1pvPLIt9BEN1WpJbIHnUDZTi92VhWb5QtmqodYIZZGlK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723541000; c=relaxed/simple;
	bh=Er1PNrHbEmAGZbkBHeGc7fms8FTgxfpx2SHwLfQmpS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9By3VzWYdx2U0sLaVmcdSU5P6XHDiAXRRUZkzIrqAGwFCheaUpFohoQ0kSXIcDnbmeuSW1iOaw+Z9gktL6p3mRGWGn02lQBRO1CxL9IscknxvSBwy35Z8BI35BMoHPsaUaqDauD+QPsbGgReR6MS+LPUPKiduPjFqGn9Lk8t0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cWuWTQBa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FACFA1A;
	Tue, 13 Aug 2024 11:22:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723540940;
	bh=Er1PNrHbEmAGZbkBHeGc7fms8FTgxfpx2SHwLfQmpS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cWuWTQBa+2xdCXkam61KloVBiSBOs3VuFoK0mhXFAZg+1RsLXyaLNu7yRa4VP7HrQ
	 8p1zdlOVKT6Gh2R6iZN73Ohm4+zZpN7Q6GB10YeP+Vg1TwArwcWAiarcpzIfWz5n5j
	 7WAD/j/Sb8biKPDlTCSkSTxwBtZb/bO7cAUYiAIo=
Date: Tue, 13 Aug 2024 12:22:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Avichal Rakesh <arakesh@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/10] usb: gadget: uvc: add g_parm and s_parm for
 frame interval
Message-ID: <20240813092253.GB19716@pendragon.ideasonboard.com>
References: <20240403-uvc_request_length_by_interval-v4-0-ca22f334226e@pengutronix.de>
 <20240403-uvc_request_length_by_interval-v4-7-ca22f334226e@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240403-uvc_request_length_by_interval-v4-7-ca22f334226e@pengutronix.de>

On Tue, Aug 13, 2024 at 11:09:31AM +0200, Michael Grzeschik wrote:
> The uvc gadget driver is lacking the information which frame interval
> was set by the host. We add this information by implementing the g_parm
> and s_parm callbacks.

As I've said countless times, this kind of hack is not the right way to
pass information that the kernel has no use for between two userspace
components. Please stop butchering this driver.

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
> v3 -> v4: -
> v2 -> v3: -
> v1 -> v2: -
> ---
>  drivers/usb/gadget/function/uvc.h      |  1 +
>  drivers/usb/gadget/function/uvc_v4l2.c | 52 ++++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index b3a5165ac70ec..f6bc58fb02b84 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -100,6 +100,7 @@ struct uvc_video {
>  	unsigned int width;
>  	unsigned int height;
>  	unsigned int imagesize;
> +	unsigned int interval;
>  	struct mutex mutex;	/* protects frame parameters */
>  
>  	unsigned int uvc_num_requests;
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index de41519ce9aa0..392fb400aad14 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -307,6 +307,56 @@ uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
>  	return ret;
>  }
>  
> +static int uvc_v4l2_g_parm(struct file *file, void *fh,
> +			    struct v4l2_streamparm *parm)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +	struct uvc_device *uvc = video_get_drvdata(vdev);
> +	struct uvc_video *video = &uvc->video;
> +	struct v4l2_fract timeperframe;
> +
> +	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	/* Return the actual frame period. */
> +	timeperframe.numerator = video->interval;
> +	timeperframe.denominator = 10000000;
> +	v4l2_simplify_fraction(&timeperframe.numerator,
> +		&timeperframe.denominator, 8, 333);
> +
> +	uvcg_dbg(&uvc->func, "Getting frame interval of %u/%u (%u)\n",
> +		timeperframe.numerator, timeperframe.denominator,
> +		video->interval);
> +
> +	parm->parm.output.timeperframe = timeperframe;
> +	parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
> +
> +	return 0;
> +}
> +
> +static int uvc_v4l2_s_parm(struct file *file, void *fh,
> +			    struct v4l2_streamparm *parm)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +	struct uvc_device *uvc = video_get_drvdata(vdev);
> +	struct uvc_video *video = &uvc->video;
> +	struct v4l2_fract timeperframe;
> +
> +	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	timeperframe = parm->parm.output.timeperframe;
> +
> +	video->interval = v4l2_fraction_to_interval(timeperframe.numerator,
> +		timeperframe.denominator);
> +
> +	uvcg_dbg(&uvc->func, "Setting frame interval to %u/%u (%u)\n",
> +		timeperframe.numerator, timeperframe.denominator,
> +		video->interval);
> +
> +	return 0;
> +}
> +
>  static int
>  uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
>  		struct v4l2_frmivalenum *fival)
> @@ -577,6 +627,8 @@ const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
>  	.vidioc_dqbuf = uvc_v4l2_dqbuf,
>  	.vidioc_streamon = uvc_v4l2_streamon,
>  	.vidioc_streamoff = uvc_v4l2_streamoff,
> +	.vidioc_s_parm = uvc_v4l2_s_parm,
> +	.vidioc_g_parm = uvc_v4l2_g_parm,
>  	.vidioc_subscribe_event = uvc_v4l2_subscribe_event,
>  	.vidioc_unsubscribe_event = uvc_v4l2_unsubscribe_event,
>  	.vidioc_default = uvc_v4l2_ioctl_default,

-- 
Regards,

Laurent Pinchart

