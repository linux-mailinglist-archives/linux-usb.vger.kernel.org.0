Return-Path: <linux-usb+bounces-11712-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D434291920C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 20:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D0D11F232C3
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 18:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B98D191474;
	Wed, 26 Jun 2024 18:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MllkvLki"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1E514EC59
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 18:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719428266; cv=none; b=XM3Q2Wuy12y4TAhzI9Yj4ioH81uPrkI+lA+kHNK6FPFDWL4D88X9wMTEl92A9NOjTfsyHM9L1BzB31Up9+8/WT93F6vdDO8oo+WaB9EbvmZY8sGQC533CB1mPWn+xxQs6910UsRMySsIlfoaAEW1JJaHgfS5l5u7LYHPytslJXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719428266; c=relaxed/simple;
	bh=QTDLu//IplIkLjmy3VXvcJmk5V9aDEeZPN4AnCO/JyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c6ser2DQvO4Fdl4Ex4SXs/IWFIJ7qh4/bpYSpLUeeGp0msbcOiLIpxNN9xecA8kyAQXxRBN2vsPMXieezZgA0p7pcOWffx/e/WP2ibT4D5XGKa3NLoWAl3GFS/M0eua1D6Ys+JAD3IQY8Y9zdjcUivmkvQHjd3JQrSxE2Jvnd8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MllkvLki; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-706680d3a25so3425314b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 11:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719428264; x=1720033064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftp8HDldrZntCvEid+an2xQP/3FTMvqkZRHgTJKfHZc=;
        b=MllkvLkiQ5Js9ZxJTCtheEql/VX1DnlcrQyY1OoTdryypWl9NaR/Z8IRHzj90c6V45
         JBbERforLceLxoIW1r8OYqNkKuMpBzRnUEQypUDhcimeFlnjydynyk9u5yF06KOiwteT
         y0S3TaKbjtTMZ8j6jOY+Rn5tEHzE/j8nJMDDbEI4NAJjA8Esu3L+okHqnBDy9Ie1vyAP
         zKkI/VIkYlWOGWUay/q8YtgGsUIq6IsmUs1SKqfNuhJjwwkiF1Uaxcmrzzg6wi+xh6wJ
         iMFVejoqNxOzAUbXYNG+Oic3R6wRjSdvhYwkGlpYpUH+LEINxL1ncqfTIkrbKtudoNVP
         oD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719428264; x=1720033064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftp8HDldrZntCvEid+an2xQP/3FTMvqkZRHgTJKfHZc=;
        b=nO2Diqln8iRISyNbRJhBzqjdDbka3tk4LY4zu7mYCD+6PstCql/je8H860xftDDrDw
         kOEf8lj1ehyDs1dbxh2IgX2lT5EjJZkMXVFmNmgi1zoy3uEoYgrGtyYzsV6WVPMyeTk+
         TnK2yWA5y3S5reUJJEiSHExcg2XQoCvvb2uKWFNx7XKJGJIBIlF3tXEuvtHRAfapIEz2
         KTGGs0isMuKBa12iuMgAtFPqnvPNKqV1iUbnCFDp1r5Y4arzLVo/hjUvdBT+6Pg/UN2G
         dv/MBcn04D8x3/uJzwpnjEfU+eoCaAcC4+kdzMu2q1tLwfdhZdJow3KBJfzlqupvZRQN
         RSxw==
X-Gm-Message-State: AOJu0YwAlCnnituy815pRwjMlsV4j1txKngryZZO0M5+bhG6fHIhLyRR
	NnKjqzEJL9yRgO1EJMO+0xXOGxAvr4Ue4LR3tNCx4AVjWUofub8pIo1q7S5dNw==
X-Google-Smtp-Source: AGHT+IGh5EGByE6wy9dTMrgGFe6kUzBUw3h2tBZC5lin6CQdi/6BflbdPFpe2ts76KTQoKwCA2WmZA==
X-Received: by 2002:a05:6a20:85a9:b0:1bd:1ab1:e90c with SMTP id adf61e73a8af0-1bd1ab1ea37mr5882677637.15.1719428264108;
        Wed, 26 Jun 2024 11:57:44 -0700 (PDT)
Received: from [192.168.60.239] (213.126.145.34.bc.googleusercontent.com. [34.145.126.213])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716ba79eb75sm9138425a12.70.2024.06.26.11.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 11:57:43 -0700 (PDT)
Message-ID: <80f15515-9050-480c-bbeb-f2b8369326eb@google.com>
Date: Wed, 26 Jun 2024 11:57:42 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] usb: gadget: uvc: set req_size and n_requests
 based on the frame interval
To: Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240403-uvc_request_length_by_interval-v2-0-12690f7a2eff@pengutronix.de>
 <20240403-uvc_request_length_by_interval-v2-3-12690f7a2eff@pengutronix.de>
Content-Language: en-US
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <20240403-uvc_request_length_by_interval-v2-3-12690f7a2eff@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/22/24 4:48 PM, Michael Grzeschik wrote:
> With the information of the interval frame length it is now possible to
> calculate the number of usb requests by the frame duration. Based on the
> request size and the imagesize we calculate the actual size per request.
> This has calculation has the benefit that the frame data is equally
> distributed over all allocated requests.
> 
> We keep the current req_size calculation as a fallback, if the interval
> callbacks did not set the interval property.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
> v1 -> v2: - add headersize per request into calculation
> ---
>  drivers/usb/gadget/function/uvc_queue.c | 30 +++++++++++++++++++++++-------
>  drivers/usb/gadget/function/uvc_video.c |  2 +-
>  2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> index ce51643fc4639..141e52e34c610 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -44,7 +44,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>  	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
> -	unsigned int req_size;
> +	unsigned int req_size, max_req_size, header_size;
>  	unsigned int nreq;
>  
>  	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
> @@ -54,15 +54,31 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  
>  	sizes[0] = video->imagesize;
>  
> -	req_size = video->ep->maxpacket
> +	nreq = DIV_ROUND_UP(video->interval, video->ep->desc->bInterval * 1250);

This seems problematic? I am not very well versed in the different USB speeds,
but IIRC fullspeed and highspeed enpoints have different bus intervals, and 
treat bInterval in different units (in frames for fs and in microframes for hs).

We likely need some speed specific logic when calculating nreq.

Assuming this logic is for >= hs, this allocates the exact number of 
usb_requests needed to stream a frame over to the host in one video 
frame interval. With the zero length backpressure still in place, this 
would mean that the actual video frame is sent over a period longer than
on video frame interval. I will try these patches locally, but if you
haven't already, please do check if you run into the problem you
brought up in https://lore.kernel.org/all/ZiWga5Kqno1ICv97@pengutronix.de/.
My guess is that the problem will show up here as well.

> +
> +	header_size = nreq * UVCG_REQUEST_HEADER_LEN;
> +
> +	req_size = DIV_ROUND_UP(video->imagesize + header_size, nreq);
> +
> +	max_req_size = video->ep->maxpacket
>  		 * max_t(unsigned int, video->ep->maxburst, 1)
>  		 * (video->ep->mult);
>  
> -	/* We divide by two, to increase the chance to run
> -	 * into fewer requests for smaller framesizes.
> -	 */
> -	nreq = DIV_ROUND_UP(DIV_ROUND_UP(sizes[0], 2), req_size);
> -	nreq = clamp(nreq, 4U, 64U);
> +	if (!req_size) {
> +		req_size = max_req_size;
> +
> +		/* We divide by two, to increase the chance to run
> +		 * into fewer requests for smaller framesizes.
> +		 */
> +		nreq = DIV_ROUND_UP(DIV_ROUND_UP(sizes[0], 2), req_size);
> +		nreq = clamp(nreq, 4U, 64U);
> +	} else if (req_size > max_req_size) {
> +		/* The prepared interval length and expected buffer size
> +		 * is not possible to stream with the currently configured
> +		 * isoc bandwidth
> +		 */
> +		return -EINVAL;
> +	}
>  
>  	video->req_size = req_size;
>  	video->uvc_num_requests = nreq;
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 95bb64e16f3da..d197c46e93fb4 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -304,7 +304,7 @@ static int uvcg_video_usb_req_queue(struct uvc_video *video,
>  		 */
>  		if (list_empty(&video->req_free) || ureq->last_buf ||
>  			!(video->req_int_count %
> -			DIV_ROUND_UP(video->uvc_num_requests, 4))) {
> +			clamp(DIV_ROUND_UP(video->uvc_num_requests, 4), 4U, 16U))) {
>  			video->req_int_count = 0;
>  			req->no_interrupt = 0;
>  		} else {
> 

