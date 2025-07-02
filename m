Return-Path: <linux-usb+bounces-25406-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827D0AF15AD
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 14:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5B7816ABE7
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 12:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9A0274674;
	Wed,  2 Jul 2025 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HP9ZUZfB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34187272E6D
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 12:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459465; cv=none; b=mQVe0meYCjO+0m8LRA56G0VhPrrc23GggvvBxg0N7p7+R8q7XD5j04xiw1w6QRdpmVazlMy9fgffxYIgW0sK8u+hhMMnZ+PLdq8zp0xpuZ6bZqOdnPj4UyhQjYkhoS5O79pUf4CyxlXVn/3dVtokYEMs18LoCnpoO/XPwCM7qyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459465; c=relaxed/simple;
	bh=3jVBuetEQaE9y3rWF5YWJVyzPa0BCvXjKpAA4Ev7OUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjggU8ebivhK8yH3Eec0tERtFa+cE9jyUAVneoBMhP5sMxlTk8cvtqpjcmazjTUG6DMdbYGgM4e0oMR9fTUl9ba9CkYwciyNiFEZciF5ZgRbBIuvCS9Yc1tQAWyKZzu24nVWz7W6CygU5awLZbymuTyd4hP9IOgPiItSzc4FMIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HP9ZUZfB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b10594812so5123328e87.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Jul 2025 05:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751459461; x=1752064261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5PT9is2pvFA0KpCrDjVS0+5mGqE0uBCeYvu5bKfsZsk=;
        b=HP9ZUZfBYsBI4J7UEO+1C06fgPGDYKFD4mrgNci3SWyuTrNH4g5gEyo6D+VJCn9+Ml
         IPvJP0j7rw+qT7/hdCLFzi3+gI5mnh/SgGb/ukTY/IA7LSNzLT/VWe/js51nFtfyY2Jr
         y86q+rtpNmlVctmQe/rmcpzQHQJsXiBwP1Z98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459461; x=1752064261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PT9is2pvFA0KpCrDjVS0+5mGqE0uBCeYvu5bKfsZsk=;
        b=vnDXRUe12AFNqOoBh/PobolOAs+cSEw3qb7rY7fmdk4G7Lkja4Zu2gvqj+TLizFy7R
         1JHSjAqQs1rqF7oFxrBXbQ1XEx4LR7I5ETJFP6tY9c8XViuessEMoU2DKUXzwHfVopwU
         uQU+iHU7kKTkQxgyBk1uh0agKJVDFrCFq6GUF4Pz4/BX+WDRoT11Ba+xavbOJD6w6G6N
         DH2WXaWnV0h00k6RluKiqJdaXCUEA/J2E44NnNCO3JxTV/m44k2mGMV8yVsaTpvrbrcs
         Vlg84XARPjKVAoF6hhlMORSfwuOwJMqKdxVJyaXW6RLteI8reLtlubu44Y48LUwY+CJ5
         SeOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLmAK9j4WNkOItmduzOJQvJq3xC+K8/frLs70vQQSaKydrdyxJXC78zAiTvo8O3CYYPbh1Mrfb1vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdXOkC1+1x//5b1q0ayva2NcgsIq7ZxW2/1slhuR2ttW3nNG5z
	KQqIqCW6eiCujsSFEFFm57WZzWXYrDzR9qTEMCbSLwhf4cRhaCXCJg7Inhk+wd/LsiHcbhyaSHl
	IM2c=
X-Gm-Gg: ASbGncsKVdc5/5Ot0/ymVAJ+zk6ADhIbhssRAu3oTTpYb/yrtlfhQU+AsIFKceypTHk
	mELULNBcnJmSczASicMgN5NGIfsz/fGnFFSW48s3XWoUwUzoM8LilXXcXbnoP884REdtKlG7dqj
	u6InZMzsaIjIrbjFZbyy/L7F3db80bbxIMm1vpx6Fk1KYrBfZ0+Q8aeaKqJ5b7quOjWhAfdZHXr
	5rdT05r5V2+/A2ebnA3YacZxDwC6akxOiSbJJJu16wMeUNnRMU7Tc3P0G8hOZ3+LWm4BbLsfwFm
	sY8NpBtHgi3Jy/QZ9Ksbl+8gXaWMVjALB+tnWW8dStMnWtSzyzcQkcNe0V55xdAsEUcokKSmVj6
	zGO+T991DDfZ92N/nT24TzzrLO0v9
X-Google-Smtp-Source: AGHT+IE2woJM1FJbjiw1oMR8ZnoPs8rT+tDk7RMvs9jk5JeMI3dqIQCnZENn0rk5echFZUk5eph0yg==
X-Received: by 2002:a05:6512:31ce:b0:553:1f90:cca4 with SMTP id 2adb3069b0e04-556282f5163mr842087e87.13.1751459461128;
        Wed, 02 Jul 2025 05:31:01 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2eec3dsm2112302e87.242.2025.07.02.05.30.59
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:30:59 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so42498631fa.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Jul 2025 05:30:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuCg7JTm6OdGRTUlyd14k8nDCAPitxxdzsxW0dZH6L0A5h/dU1obuSE3uSQMw6k5YdUxeRAldoEtk=@vger.kernel.org
X-Received: by 2002:a05:6512:3990:b0:553:2ff8:5e0b with SMTP id
 2adb3069b0e04-556283700e9mr1016619e87.42.1751459458668; Wed, 02 Jul 2025
 05:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702110222.3926355-1-xu.yang_2@nxp.com> <20250702110222.3926355-3-xu.yang_2@nxp.com>
In-Reply-To: <20250702110222.3926355-3-xu.yang_2@nxp.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 2 Jul 2025 14:30:45 +0200
X-Gmail-Original-Message-ID: <CANiDSCum3xkgr1QgdvsuZ3ySNJyoLUe_RWyeSDiM0S87YJ-uTw@mail.gmail.com>
X-Gm-Features: Ac12FXwZ_BR0qOSlJcIB1oB_o-14xQ1JZQnu8mI8P7iUMcywnlv20QQJ74Gt2Y0
Message-ID: <CANiDSCum3xkgr1QgdvsuZ3ySNJyoLUe_RWyeSDiM0S87YJ-uTw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, 
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de, 
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, dafna.hirschfeld@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

Hi Xu

The code looks much cleaner :)

It seems that the hcd.c uses the urb transfer_flags to know the
direction of the transfer.
But the uvc driver is not setting it, you probably want to set it.

On Wed, 2 Jul 2025 at 13:01, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> This will use USB noncoherent API to alloc/free urb buffers, then
> uvc driver needn't to do dma sync operations by itself.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v3:
>  - no changes
> ---
>  drivers/media/usb/uvc/uvc_video.c | 56 ++++++++-----------------------
>  1 file changed, 14 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..614cf4781221 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1280,15 +1280,6 @@ static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
>         return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
>  }

The uvc_stream_to_dmadev() function is not used anymore, please drop it.



>
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
> @@ -1310,7 +1301,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>                 uvc_queue_buffer_release(op->buf);
>         }
>
> -       ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
> +       ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
>         if (ret < 0)
>                 dev_err(&uvc_urb->stream->intf->dev,
>                         "Failed to resubmit video URB (%d).\n", ret);
> @@ -1736,12 +1727,6 @@ static void uvc_video_complete(struct urb *urb)
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
> @@ -1750,7 +1735,7 @@ static void uvc_video_complete(struct urb *urb)
>
>         /* If no async work is needed, resubmit the URB immediately. */
>         if (!uvc_urb->async_operations) {
> -               ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
> +               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
>                 if (ret < 0)
>                         dev_err(&stream->intf->dev,
>                                 "Failed to resubmit video URB (%d).\n", ret);
> @@ -1765,17 +1750,15 @@ static void uvc_video_complete(struct urb *urb)
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
> @@ -1786,26 +1769,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
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
> @@ -1953,6 +1923,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
>                 urb->complete = uvc_video_complete;
>                 urb->number_of_packets = npackets;
>                 urb->transfer_buffer_length = size;
> +               urb->sgt = uvc_urb->sgt;
>
>                 for (i = 0; i < npackets; ++i) {
>                         urb->iso_frame_desc[i].offset = i * psize;
> @@ -2009,6 +1980,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
>                                   size, uvc_video_complete, uvc_urb);
>                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
>                 urb->transfer_dma = uvc_urb->dma;
> +               urb->sgt = uvc_urb->sgt;
>
>                 uvc_urb->urb = urb;
>         }
> @@ -2120,7 +2092,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
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

