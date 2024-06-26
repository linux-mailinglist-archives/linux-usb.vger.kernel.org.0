Return-Path: <linux-usb+bounces-11710-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3B918E8A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 20:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78785285952
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 18:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84AF190050;
	Wed, 26 Jun 2024 18:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pMFYgJU8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08CA6E611
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 18:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719426665; cv=none; b=G9ByB5Ya0xTpznC6APl2micznyDwofDqlXGs8pPQaFrOsh2WFgluUSTQ5ZMniGYZiEVaFMS4elQS2f0vD3AwVgeKQ0Z3pSbzGx+lPDkNKJXzT4imP1GdJ9JCia2LSaMYPeqdsAonaYKSR+dByX/0z6QtvXbddThQbAD3kS6Rx1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719426665; c=relaxed/simple;
	bh=JUR6teOJs+IucW5bNmHiZVArZPQaCuNjJRVHWhCnD6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbDqtB83srnfmXxWYqgFY7IYK0pf7+EdTkTU9MDngKkxKJO1GbyM6zRtRH1It06Glagt6XzO8GYlCrT330NMC47rAyyL6k/vfQc7EBhRGTadf++jPTAqSA/OaJhWmrJaoljWXWlsD3EF7m1RVCiG9aQsDhBCQ4Pr9eWGPDT9L3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pMFYgJU8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f9fb3ca81bso32899915ad.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719426663; x=1720031463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8tjwCo83OkE5X0OUj3R4LyScfuwYa/Fo6fzQgx/LpY=;
        b=pMFYgJU8cMj6id6zyBWNLyKqovPfEIqjrOsyTJ6qaPTbAugjlNFu0vmP5/jF+5u8CO
         45QTYp0+zrP36ItcAmyK6dmvXP1rmrHHVa4M2VYA6RJ+syIuI72gRi6cl2FVytnRm27B
         8mvlNgIN1SfG9MGZh4zHYHBrTHAM0I52j8aLt7UzwkyEAXUfEywqH1j7j/juhILyeFYX
         VL+y9b/NpQmHGY4k6i5zcG6v1q++qqxDG3xc05kImrxfvz3x8mzr5szoHb8WxbcMD2hd
         tpZFxP9sNyP+WwBGb0CCFaAx+b1GFop3pC1RmAaalcSh6P0x4dE5nCWXqRngn9Ujj4ru
         uiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719426663; x=1720031463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8tjwCo83OkE5X0OUj3R4LyScfuwYa/Fo6fzQgx/LpY=;
        b=KBf4qhtyh5+DDnRi2uHXcbcKzaccigLF/l27MYZUKy0WVR8x16X9dJVbjkq1I+Q8xM
         i7ZOqnenXnelogPVJb+QhH21a0RbN0q+6cEBTmsMoMflJO8FPFL6cy6VRi0NVSzKkOAU
         kUFsV+efSOvB9zawYXu2NsHs/y7Eg88yoBdRwIkNqVsKMymbDJffBB2P4CEsyX4GkXQi
         HpLirFs++Cs7aknN0gxENlcvK426J14w9zRE7tlgk8oS1zznor2sSa2tQQIbLZCmXkdI
         4uG1XnvnWLKrBj9cawLjuHUAK+0vDEcJvjunoIlTd/bJljzNrwYvh58Qn82d+InGEZSD
         peSw==
X-Gm-Message-State: AOJu0YwRAPzR16JDmtGfRU/PDiYoHPOQoxxvq451WkTx1aaKKgYZBjr0
	hcVryrmV2RzcHC0Pq631bdHpe1t2azha1/nV49FwDabJ0g52O+f5LlLimSkqR2qCT20V3Cpahol
	xTw==
X-Google-Smtp-Source: AGHT+IGXr85kKEYZ2eIkQ5/jXxfawOefBL0aGVyFXPDnhD+bi3JdampznB8HX03cARM6F2LgKNtexw==
X-Received: by 2002:a17:902:ce82:b0:1f9:9c40:edff with SMTP id d9443c01a7336-1fa2413d3b1mr124282245ad.61.1719426662710;
        Wed, 26 Jun 2024 11:31:02 -0700 (PDT)
Received: from [192.168.60.239] (213.126.145.34.bc.googleusercontent.com. [34.145.126.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c5feesm103440425ad.161.2024.06.26.11.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 11:31:02 -0700 (PDT)
Message-ID: <9ad8b7fc-2c5e-4b2e-ba8c-e956171c2893@google.com>
Date: Wed, 26 Jun 2024 11:30:58 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] usb: gadget: uvc: add g_parm and s_parm for frame
 interval
To: Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240403-uvc_request_length_by_interval-v2-0-12690f7a2eff@pengutronix.de>
 <20240403-uvc_request_length_by_interval-v2-2-12690f7a2eff@pengutronix.de>
Content-Language: en-US
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <20240403-uvc_request_length_by_interval-v2-2-12690f7a2eff@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/22/24 4:48 PM, Michael Grzeschik wrote:
> The uvc gadget driver is lacking the information which frame interval
> was set by the host. We add this information by implementing the g_parm
> and s_parm callbacks.

This change requires the userspace application (uvc-gagdet equivalent) 
to call s/g_parm when the FPS negotiations are finished. This is fine, 
but we should document that in the commit message here so implementers 
know that something needs to be done to take advantage of the change.

On a similar note, the reference uvc-gadget should also be updated to 
call the added functions (and apologies if you've already put up a 
patch for it, I was unable find one).

> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
> v1 -> v2: -
> ---
>  drivers/usb/gadget/function/uvc.h      |  1 +
>  drivers/usb/gadget/function/uvc_v4l2.c | 52 ++++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index cb35687b11e7e..d153bd9e35e31 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -97,6 +97,7 @@ struct uvc_video {
>  	unsigned int width;
>  	unsigned int height;
>  	unsigned int imagesize;
> +	unsigned int interval;
>  	struct mutex mutex;	/* protects frame parameters */
>  
>  	unsigned int uvc_num_requests;
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index a024aecb76dc3..5b579ec1f5040 100644
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
> 

