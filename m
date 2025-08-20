Return-Path: <linux-usb+bounces-27062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D679B2E12A
	for <lists+linux-usb@lfdr.de>; Wed, 20 Aug 2025 17:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4977B188D793
	for <lists+linux-usb@lfdr.de>; Wed, 20 Aug 2025 15:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC90D222582;
	Wed, 20 Aug 2025 15:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R+KzIEs8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B67536CDFE
	for <linux-usb@vger.kernel.org>; Wed, 20 Aug 2025 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755703329; cv=none; b=hDVxtGRx6dHgYAqdmR8NUIN3boNYKiLtcIBnE3fJnqjZlatd9qBZrFOe2OpaI8feshfINql1EAr/OQFeoovdJXniuipmE2bH7MmCFBnVTtcqQAJOIrrysQvIBgqJUCRhAk9aeaUny4/nbvrsf6DgUKeVnRSvi917xrdre+LmOYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755703329; c=relaxed/simple;
	bh=ve8TblAuMSCb6tU4athNRxufJKZ6IUExRK3RK/OuyCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBKZxoXXJean6FwlyiJW0UZgelBr1Geks7vFylc2JKS86D+ftAKZzmlHumf1bqKORQ74ei6i8uyxlEjPH0d+AMkxE9H9qjmZXAq0sIv/nq9vfH09URzGn6r7jTblpTg2w4tFKumxaJEyCDzf7qApdEumeORZXHK2k1sX71QnwHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R+KzIEs8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce526627dso6693781e87.3
        for <linux-usb@vger.kernel.org>; Wed, 20 Aug 2025 08:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755703325; x=1756308125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1FpvzU4/OcZ3HFncGYXGBLrDfBsRLvX6s4xeHQww4w=;
        b=R+KzIEs8Z3wL1glXtKY0JZrqpx0hTtWxI94DII3D5C0nClmEL62qb5RNSxV+/EMcXO
         KNHcImf8pV7QDQ4GDbWsHRokU9eg8phSJcB8DMVtk/o8Gm7+dzbeVwvKCx2HxEV9nT7c
         U3IIhWoKLZRlFkYJ3A8A52PzP+92wYIIs1aFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703325; x=1756308125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1FpvzU4/OcZ3HFncGYXGBLrDfBsRLvX6s4xeHQww4w=;
        b=kFeB9D2sfyDIJWu2EBcTXeOiETPteryGSYMYlJu+RBNmsisIvwZdxqyZzLcut0m+Um
         jxq2Osjd/OkRrDplVAk+pNfBdpY9nDDI3HaWw732ihWdCyVuSeaWbhK8ydd7y8iyBRL5
         9+jPCmZgSu9VaUc/Ls/fdyOYlLftl1ZAy/h+3HZhTSilg7bN4GwpioWAaqNCT4niEz6Q
         95rHsp+9Neh7CzE7UCkYl1HVwXBdktVKRdcht1BaUCp9uG6KixYamFnlKka1miAZgiMF
         wPTWyKEB6MtlqN2LXM+Rgt/ltsfQTpO4DeuDm8gd17VzDALSHWHFJEkMpFmmXas+8C62
         9Tdw==
X-Gm-Message-State: AOJu0YwuD203QxAYDQCOfKoT/kpGKLiO49uA4MmntH6g11IMpBpjUcNK
	IjOPah+x0WKEMzu3OfTJwY+t5aqzgKzcqO96wDDgRSs5pLLlaEIaEGsVNiJWVxMsbRbxROrr+Me
	jQJQ=
X-Gm-Gg: ASbGncuttEIQJ6EqGZ/z+h6de6AdLDafc/ZPGaoceH92lUBtk85LrO8wpC6c9DHHf4z
	esjuTQiRwr6YtyZNPVThZCMG/AstL/5D9T9om0hYEUhl93tasChJRgZcaMonsoJSdA18VMouBPK
	UL84XmJtDzmZu2VTu3MJhxfxYC4u5FLGLnfFK3Q/dp2YafOoPShdKpmN7P5mtDmH+a13B85HOSA
	nd26oVrfMpLSVb7Z4YyO4G5J03XlisblkON4nMFZqoEPXcI5F0XuEfFXDiSWSly7bzdXA9cDswn
	W0humpEAnuQM6MSeSsAEDyUa/+gpPAAC5YyhEGu5lbqCGqQ/6nGptARSEd7rIktYXbX+j7rzm0L
	yJ6DyX3UUmzDtryhx0sl36acNQinl7fbe9iDoEyr+QlpPN8EDsegvBVQy8XqcA0Sk
X-Google-Smtp-Source: AGHT+IFME7XEZs8vB5HQBkcrPKOdqMJGGN0pAzbEs7kn9mwLvuNc4XoVo21yYfGutPTPqAYKF2ajlA==
X-Received: by 2002:ac2:4eda:0:b0:553:202e:a41c with SMTP id 2adb3069b0e04-55e06bad114mr719138e87.28.1755703325183;
        Wed, 20 Aug 2025 08:22:05 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55e033fc2e8sm706675e87.59.2025.08.20.08.22.04
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 08:22:04 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-333f9160c21so48466881fa.2
        for <linux-usb@vger.kernel.org>; Wed, 20 Aug 2025 08:22:04 -0700 (PDT)
X-Received: by 2002:a05:651c:1118:20b0:335:16a4:cfe1 with SMTP id
 38308e7fff4ca-3353bcd5c50mr7339211fa.6.1755703323895; Wed, 20 Aug 2025
 08:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820143824.551777-1-sakari.ailus@linux.intel.com> <20250820143824.551777-10-sakari.ailus@linux.intel.com>
In-Reply-To: <20250820143824.551777-10-sakari.ailus@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 20 Aug 2025 17:21:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCuBNsRq45J6RZibD=fWxWuUKBWJfW=7addXK8g7J8R8mw@mail.gmail.com>
X-Gm-Features: Ac12FXwwGHcJ2y9cwGTilVIHefPWT6Ic00MsCu97CZsAIXOY28DZX-cIYltqB3s
Message-ID: <CANiDSCuBNsRq45J6RZibD=fWxWuUKBWJfW=7addXK8g7J8R8mw@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] media: uvcvideo: eUSB2 double isochronous
 bandwidth support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org, 
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com, 
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com, 
	Amardeep Rai <amardeep.rai@intel.com>, Kannappan R <r.kannappan@intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	=?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari

I believe you have missed my previous email.

https://lore.kernel.org/linux-media/CANiDSCsocBBQRPRFAbAovkzauThgN8Qd1u8kjJ=
_af-83Nd4wvw@mail.gmail.com/

re-posting here

On Wed, 20 Aug 2025 at 16:39, Sakari Ailus <sakari.ailus@linux.intel.com> w=
rote:
>
> From: Tao Q Tao <tao.q.tao@intel.com>
>
> Use usb_endpoint_max_esit_payload() from the USB framework to find the
> maximum bytes per interval for the endpoint. Consequently this adds eUSB2
> isochronous mode and SuperSpeedPlus Isochronous Endpoint Companion suppor=
t
> where larger payloads within a service interval are possible.
>
>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
> Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
> Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

nit: I believe the last tag should be: Signed-off-by:


> ---
>  drivers/media/usb/uvc/uvc_driver.c |  4 ++--
>  drivers/media/usb/uvc/uvc_video.c  | 24 +++---------------------
>  drivers/media/usb/uvc/uvcvideo.h   |  4 +---
>  3 files changed, 6 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index 775bede0d93d..d06ca79ae2d9 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -539,7 +539,7 @@ static int uvc_parse_streaming(struct uvc_device *dev=
,
>         unsigned int nformats =3D 0, nframes =3D 0, nintervals =3D 0;
>         unsigned int size, i, n, p;
>         u32 *interval;
> -       u16 psize;
> +       u32 psize;
>         int ret =3D -EINVAL;
>
>         if (intf->cur_altsetting->desc.bInterfaceSubClass
> @@ -775,7 +775,7 @@ static int uvc_parse_streaming(struct uvc_device *dev=
,
>                                 streaming->header.bEndpointAddress);
>                 if (ep =3D=3D NULL)
>                         continue;
> -               psize =3D uvc_endpoint_max_bpi(dev->udev, ep);
> +               psize =3D usb_endpoint_max_periodic_payload(dev->udev, ep=
);
>                 if (psize > streaming->maxpsize)
>                         streaming->maxpsize =3D psize;
>         }
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uv=
c_video.c
> index a5013a7fbca4..1a0cc937de9b 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1869,24 +1869,6 @@ static void uvc_video_stop_transfer(struct uvc_str=
eaming *stream,
>                 uvc_free_urb_buffers(stream);
>  }
>
> -/*
> - * Compute the maximum number of bytes per interval for an endpoint.
> - */
> -u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoin=
t *ep)
> -{
> -       u16 psize;
> -
> -       switch (dev->speed) {
> -       case USB_SPEED_SUPER:
> -       case USB_SPEED_SUPER_PLUS:
> -               return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> -       default:
> -               psize =3D usb_endpoint_maxp(&ep->desc);
> -               psize *=3D usb_endpoint_maxp_mult(&ep->desc);
> -               return psize;
> -       }
> -}
> -
>  /*
>   * Initialize isochronous URBs and allocate transfer buffers. The packet=
 size
>   * is given by the endpoint.
> @@ -1897,10 +1879,10 @@ static int uvc_init_video_isoc(struct uvc_streami=
ng *stream,
>         struct urb *urb;
>         struct uvc_urb *uvc_urb;
>         unsigned int npackets, i;
> -       u16 psize;
> +       u32 psize;
>         u32 size;
>
> -       psize =3D uvc_endpoint_max_bpi(stream->dev->udev, ep);
> +       psize =3D usb_endpoint_max_periodic_payload(stream->dev->udev, ep=
);
>         size =3D stream->ctrl.dwMaxVideoFrameSize;
>
>         npackets =3D uvc_alloc_urb_buffers(stream, size, psize, gfp_flags=
);
> @@ -2043,7 +2025,7 @@ static int uvc_video_start_transfer(struct uvc_stre=
aming *stream,
>                                 continue;
>
>                         /* Check if the bandwidth is high enough. */
> -                       psize =3D uvc_endpoint_max_bpi(stream->dev->udev,=
 ep);
> +                       psize =3D usb_endpoint_max_periodic_payload(strea=
m->dev->udev, ep);
>                         if (psize >=3D bandwidth && psize < best_psize) {
>                                 altsetting =3D alts->desc.bAlternateSetti=
ng;
>                                 best_psize =3D psize;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index 757254fc4fe9..ac19ca721f29 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -456,7 +456,7 @@ struct uvc_streaming {
>
>         struct usb_interface *intf;
>         int intfnum;
> -       u16 maxpsize;
> +       u32 maxpsize;
>
>         struct uvc_streaming_header header;
>         enum v4l2_buf_type type;
> @@ -798,8 +798,6 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
>  /* Utility functions */
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *a=
lts,
>                                             u8 epaddr);
> -u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoin=
t *ep);
> -
>  /* Quirks support */
>  void uvc_video_decode_isight(struct uvc_urb *uvc_urb,
>                              struct uvc_buffer *buf,
> --
> 2.47.2
>
>


--=20
Ricardo Ribalda

