Return-Path: <linux-usb+bounces-25447-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DDEAF727D
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 13:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 025371887185
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 11:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC132E613E;
	Thu,  3 Jul 2025 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="niWYQq6L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FA0275103
	for <linux-usb@vger.kernel.org>; Thu,  3 Jul 2025 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542473; cv=none; b=HhvIHE07i5nznubnGrc2UtIbKcI9vnZlUXP5FlkfcRnykWWPUertBQegVFA2VjUld5ePAV1ef5HgnHQ1rmiwlkE2Uc82IJFvj3sDWDnBZQE5wmO9DVSi6LVaOwvnn/B4am5lsGgy2lewIlRCpzONJK4pdoXCRmCeIbNpLpblc74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542473; c=relaxed/simple;
	bh=c2tsJjFJ9vSavOpZnhYvTr4JJmozuk1MtWh1Imcs78Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYxCu6v9vV0/fQ+lMoGx/UVNo32mIdiFKsX0KV1f+WbJ63Vg85/HJk1HX9AY/bAMapTKOUNM64+OzQYzbY+V1trxF0gJNaWSWDs//XSIaeXIU268vgkeoaIMVQl51KQnUDb8L8lpXa5yMCi0s4P0jIGtV9CtBVSNFjp5z+76aos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=niWYQq6L; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b49ac6431so68093591fa.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 04:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751542469; x=1752147269; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VKu/zfJ+vFov6qPGzjqcOdspoBv6skBDRoDtXZ5kxPY=;
        b=niWYQq6LFobPdpk6CNPbLK3duyBs8jrGn6L74PXQ7a/14YQ6ECGQYOpXfswYds3mEE
         NVX20NUkz84sKQboxVgsBH8kAt0W/FBQY1Lsy6UsTmvQ9kqyHvCGmTAN4P9QElQXhb/7
         3UGHyNmYV9tPMZSS7pf2PjOLhDdsbR6u0D7E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542469; x=1752147269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKu/zfJ+vFov6qPGzjqcOdspoBv6skBDRoDtXZ5kxPY=;
        b=GV+ECHaLo3NVPxWDvkIJEsJVB9bnEL1D1xqWZi5anfn55O5LLBfTznRGjyR2jbwUiL
         hWo8l25u9rT6hRj8lw+1HWLqPzW8ZhTNJwJTkTsPsbiZxD6nBFc1CPjN2ecgVUPln7+2
         17QF4UO6WnaDfYX2WUwfHteVZIKpaKYzg170Hzl7j6U3GAtNdLT7acozJzrM1DiHSreq
         hJKsdMy4Y8nu2io7EVkdfhAkMNrsSuAyi8642ujCOQhjAnUj55HL/ZrCcm9v9CsmxRoV
         YkpHkIerFiKI504Rg20GVwNoxpOxjyatQ8QrgSn8RTWf7Yku43azTojHbxjqpgt+UdDY
         Yhtw==
X-Forwarded-Encrypted: i=1; AJvYcCVtpAZrdvlaXqAvjnHThVC1LbxiSboZv5WC7OPkmbE6xDJKnoKVPzvCpcQ2cgUO+B1yWvPPjT4o8sg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX6F7OkJAx7vVqOHOv5zzFPa/zBdonr21mJX2RJFQ0uUfBYB4t
	HR2RHWUEmBe4kILo56Azu+m0mR2x8FbjWRHO7WCezQerz77brLVxlUTubjJb6onB6DisRr+Twvq
	l6rRijQ==
X-Gm-Gg: ASbGncuw8TD0oRxbCFrv0PJeLtGdmeWFEZbdDTQIVYcA5Suxvbi1I+CR08IkePzc6iK
	nxnHgFsTiELGywDsuviFrTwNmSkMLiD6f042SaAFkK2/EewGrPVdMwTy2SoNAXuE+NYwO4b2MPO
	ThkhxgILdSwAVsA8cReOEFkjuQz0fsU5HV6B5ewFYCjLShIeM5Fokd0ttsIbEx9Cn9qkfz/j19B
	dfRPUXjnOw4AMc1U9DJzz7p93C2bGASO/pzkecTnlwsFZ1hJ6/sOtUyFOVpVj8PEgKeXFm5eNyb
	9tnxfWmsoNxBlXDImdidRJlDHZTeWWgKmySeh+Cxvn480j8K579m6decI+dO8DL0EYpZCMFib/A
	Zp3868f2cU2gANUq0TM6eSOYH
X-Google-Smtp-Source: AGHT+IEL+h7wDgw870lle1ZsH7T7vijQSGswM1zKQcLes8NtiCBOHbjAlz9VPnjSVusxKlYRcTBZag==
X-Received: by 2002:a05:651c:f02:b0:32b:7389:582 with SMTP id 38308e7fff4ca-32e0d05106amr11544611fa.19.1751542469284;
        Thu, 03 Jul 2025 04:34:29 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f00e44sm20251921fa.100.2025.07.03.04.34.28
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 04:34:28 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553b16a0e38so8762769e87.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 04:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVG4IOR9Eyn3hWXENNnML+KQmu2fK4yBLGi2ECeD+Fkl4nTikMpkl6JgIjpuhCsrMeJQclww6G4Ngo=@vger.kernel.org
X-Received: by 2002:a05:6512:3b89:b0:553:252f:adf8 with SMTP id
 2adb3069b0e04-5562ee21626mr930140e87.9.1751542468121; Thu, 03 Jul 2025
 04:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703103811.4048542-1-xu.yang_2@nxp.com> <20250703103811.4048542-3-xu.yang_2@nxp.com>
In-Reply-To: <20250703103811.4048542-3-xu.yang_2@nxp.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Jul 2025 13:34:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCvYwSb9mrc63=0ioJdSkEik4H19r2c+j7yv7V-43RBxFA@mail.gmail.com>
X-Gm-Features: Ac12FXyVqorehuUK0wzBq5BWngmbjwNbNsjrYe5IAIc3GAyeQui3lCJ45PdgYOQ
Message-ID: <CANiDSCvYwSb9mrc63=0ioJdSkEik4H19r2c+j7yv7V-43RBxFA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, 
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de, 
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 13:02, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> This will use USB noncoherent API to alloc/free urb buffers, then
> uvc driver needn't to do dma sync operations by itself.
>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v4:
>  - remove uvc_stream_to_dmadev()
> Changes in v3:
>  - no changes
> ---
>  drivers/media/usb/uvc/uvc_video.c | 61 +++++++------------------------
>  1 file changed, 14 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..a75af314e46b 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1275,20 +1275,6 @@ static inline enum dma_data_direction uvc_stream_dir(
>                 return DMA_TO_DEVICE;
>  }
>
> -static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
> -{
> -       return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
> -}
> -
> -static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
> -{
> -       /* Sync DMA. */
> -       dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
> -                                   uvc_urb->sgt,
> -                                   uvc_stream_dir(uvc_urb->stream));
> -       return usb_submit_urb(uvc_urb->urb, mem_flags);
> -}
> -
>  /*
>   * uvc_video_decode_data_work: Asynchronous memcpy processing
>   *
> @@ -1310,7 +1296,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>                 uvc_queue_buffer_release(op->buf);
>         }
>
> -       ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
> +       ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
>         if (ret < 0)
>                 dev_err(&uvc_urb->stream->intf->dev,
>                         "Failed to resubmit video URB (%d).\n", ret);
> @@ -1736,12 +1722,6 @@ static void uvc_video_complete(struct urb *urb)
>         /* Re-initialise the URB async work. */
>         uvc_urb->async_operations = 0;
>
> -       /* Sync DMA and invalidate vmap range. */
> -       dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> -                                uvc_urb->sgt, uvc_stream_dir(stream));
> -       invalidate_kernel_vmap_range(uvc_urb->buffer,
> -                                    uvc_urb->stream->urb_size);
> -
>         /*
>          * Process the URB headers, and optionally queue expensive memcpy tasks
>          * to be deferred to a work queue.
> @@ -1750,7 +1730,7 @@ static void uvc_video_complete(struct urb *urb)
>
>         /* If no async work is needed, resubmit the URB immediately. */
>         if (!uvc_urb->async_operations) {
> -               ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
> +               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
>                 if (ret < 0)
>                         dev_err(&stream->intf->dev,
>                                 "Failed to resubmit video URB (%d).\n", ret);
> @@ -1765,17 +1745,15 @@ static void uvc_video_complete(struct urb *urb)
>   */
>  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  {
> -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> +       struct usb_device *udev = stream->dev->udev;
>         struct uvc_urb *uvc_urb;
>
>         for_each_uvc_urb(uvc_urb, stream) {
>                 if (!uvc_urb->buffer)
>                         continue;
>
> -               dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
> -               dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
> -                                      uvc_stream_dir(stream));
> -
> +               usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
> +                                    uvc_stream_dir(stream), uvc_urb->sgt);
>                 uvc_urb->buffer = NULL;
>                 uvc_urb->sgt = NULL;
>         }
> @@ -1786,26 +1764,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
>                                  struct uvc_urb *uvc_urb, gfp_t gfp_flags)
>  {
> -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> -
> -       uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> -                                              uvc_stream_dir(stream),
> -                                              gfp_flags, 0);
> -       if (!uvc_urb->sgt)
> -               return false;
> -       uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
> -
> -       uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> -                                                uvc_urb->sgt);
> -       if (!uvc_urb->buffer) {
> -               dma_free_noncontiguous(dma_dev, stream->urb_size,
> -                                      uvc_urb->sgt,
> -                                      uvc_stream_dir(stream));
> -               uvc_urb->sgt = NULL;
> -               return false;
> -       }
> +       struct usb_device *udev = stream->dev->udev;
>
> -       return true;
> +       uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
> +                                               gfp_flags, &uvc_urb->dma,
> +                                               uvc_stream_dir(stream),
> +                                               &uvc_urb->sgt);
> +       return !!uvc_urb->buffer;
>  }
>
>  /*
> @@ -1953,6 +1918,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
>                 urb->complete = uvc_video_complete;
>                 urb->number_of_packets = npackets;
>                 urb->transfer_buffer_length = size;
> +               urb->sgt = uvc_urb->sgt;
>
>                 for (i = 0; i < npackets; ++i) {
>                         urb->iso_frame_desc[i].offset = i * psize;
> @@ -2009,6 +1975,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
>                                   size, uvc_video_complete, uvc_urb);
>                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
>                 urb->transfer_dma = uvc_urb->dma;
> +               urb->sgt = uvc_urb->sgt;
>
>                 uvc_urb->urb = urb;
>         }
> @@ -2120,7 +2087,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>
>         /* Submit the URBs. */
>         for_each_uvc_urb(uvc_urb, stream) {
> -               ret = uvc_submit_urb(uvc_urb, gfp_flags);
> +               ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
>                 if (ret < 0) {
>                         dev_err(&stream->intf->dev,
>                                 "Failed to submit URB %u (%d).\n",
> --
> 2.34.1
>
>


-- 
Ricardo Ribalda

