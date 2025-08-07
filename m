Return-Path: <linux-usb+bounces-26571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C80C7B1D292
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 08:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D69E7AF05A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 06:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0529222538F;
	Thu,  7 Aug 2025 06:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OnceAt0L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021B1D63F7
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 06:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754548755; cv=none; b=NwRB22/lYEmm2gCoVCraD/WD7j7foBqndVgC6VnG3cJ1Kqfa734NLKXxS+t5uR9yLyoDjhdt0gCXU7FGiq80+wuDteki1ebtSmfuuN3AGkoNfgtJcJRjU3ohj497SPJBZ3f39+JMFSmMCuzBBOiF7khgkj4RhBdePh0uOAGuCbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754548755; c=relaxed/simple;
	bh=MXdjMRzs4/Yis1JOxgwQyQXVfB8C3Y+1VqYmkTyBzQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hf7FUrRg/x6LA7TzpMXaTs9xkNpZnvOJPEqQYF88N3+Nbn+zy1wAjGjoz5SkfEymFSebkE+92ntuVBqF+nuENWm4xYZYzxVnGQ7cm0y5HJNE+wq4A94/p2/X0A6bCaFtHz5iA1IR72FQtFGHIfOvfTrh9RIkOhd8KZAb10+02xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OnceAt0L; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55b978c61acso608987e87.2
        for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 23:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754548752; x=1755153552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZiIsxBEMLwOXjJq0NeBsN3GxwEnPTJQznjK+141SLRA=;
        b=OnceAt0LJ4zSBu9cw1uHf36tG6VgVXCnOChlC5YkC6/27MDG/3MFlHGMLznj4HXF4s
         lHro4RAMoI//AKHgdOwUD9AFM4yTqI1+9A2t8sUBQOvIY7LjTNTrA1pe4T2q0T8DOPsH
         e+xXscg5VVxYlaPpcQF+LSlVoD3OdZy7dBkeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754548752; x=1755153552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiIsxBEMLwOXjJq0NeBsN3GxwEnPTJQznjK+141SLRA=;
        b=mNDl1XeZ9ovrY04sOE1p1U0MmUpZYFbm+oRjr2PXAnsdH6K/ll66e5v0O0TAhjFy+1
         crLAJS6bKW2vyXLrZ9ALQcGF4fc0dOHIh+JquEONPWounctDmR4AxtD+RFBscK2y5OMj
         wLu9gSUsNQlJYLkicZI/I3HldrNMCpa86Wq8RNSY/4AtAeRJzNGFyB36cJ6P/i9D7aS5
         rr6nTBYIOBallwdrqZoq7wJ4eo+sAZmQxood85AV5hjwGA4PwiDmpOKGBGQYY++E3xmX
         rBcYhrTkP4nZSLWmwOodgRhzndBLMZHOoo9wqqJLQ/e721bW6+fuu62kEpH9bxchqx7Z
         r1OQ==
X-Gm-Message-State: AOJu0YwBmaoAZ2VvHdO2sYZI7b5myFpXK4doo/6FPEfcmAw3hwdlOPsj
	xsvEUftUPv8QtSeT1tUqyO5E088TeCcTvkQ5nsZEQDLAkYdgIn8lGF21OpH9OIzn6TD4UsiaMRM
	MP/s=
X-Gm-Gg: ASbGncvWBo00gqL7mJ2N3tbcmuF5lEBwvLPYMJglUtIMtom558coHfuZj8gviq+F2rA
	yFaSpGewYNaqnNQqE0ZuWjjuBmLIGpuorwZ+dNfSnJYgL8iitRj9WrV/EjWlsnickzY5R3YV7iH
	k9cnqdv7kQI5ldKPHQ2oSz9d9uWXiUQBMubXFq6PnE/LDhqWsrJ6iL1tVSVrS9iT6uSaElEkjkq
	hcxEwsL2B7bYVW47OOI2kDH92EzwlPfR4aqSA3+KgJB93A2iYGVS6P+KOdyHeG+hk3DVrmBcqXI
	+mnoQc4BiXuBeghLbIJA6aZAk+O0Y5LaDcthTuosxBAGzpmuZ32DiD9NWt30XrbyoNZx/ZiuaOd
	vTLsZkYDv7xHmDCnQ+gy75sdKUj2WcHDlJRhk20wI7qF16sNFVaGiZuRQF1gumu8ERPNFDQLiOf
	c=
X-Google-Smtp-Source: AGHT+IFo14oqFUbhroyajwV/m7jFZtRnBLbrRG5Pb28e/w1OoEJCBfVd+NZgW1qetWIXD9I/WMY0SQ==
X-Received: by 2002:a05:6512:1111:b0:55b:825f:f1e2 with SMTP id 2adb3069b0e04-55caf5d8341mr1478621e87.26.1754548751574;
        Wed, 06 Aug 2025 23:39:11 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca6274sm2520368e87.140.2025.08.06.23.39.10
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 23:39:10 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3325cb38a78so5824311fa.3
        for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 23:39:10 -0700 (PDT)
X-Received: by 2002:a05:651c:334a:b0:32c:bc69:e926 with SMTP id
 38308e7fff4ca-3338122fe44mr10081581fa.7.1754548748780; Wed, 06 Aug 2025
 23:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807055355.1257029-1-sakari.ailus@linux.intel.com> <20250807055355.1257029-5-sakari.ailus@linux.intel.com>
In-Reply-To: <20250807055355.1257029-5-sakari.ailus@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 7 Aug 2025 08:38:55 +0200
X-Gmail-Original-Message-ID: <CANiDSCsocBBQRPRFAbAovkzauThgN8Qd1u8kjJ_af-83Nd4wvw@mail.gmail.com>
X-Gm-Features: Ac12FXxYhHXMWpUQanb1KXmhOH6Gp8gXQfNOLFtPT7TKV2Pe1Uyva1tWR3Xqv_Q
Message-ID: <CANiDSCsocBBQRPRFAbAovkzauThgN8Qd1u8kjJ_af-83Nd4wvw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: uvcvideo: eUSB2 double isochronous
 bandwidth support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org, 
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com, 
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com, 
	Amardeep Rai <amardeep.rai@intel.com>, Kannappan R <r.kannappan@intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Aug 2025 at 07:54, Sakari Ailus <sakari.ailus@linux.intel.com> wr=
ote:
>
> From: Tao Q Tao <tao.q.tao@intel.com>
>
> Use usb_endpoint_max_isoc_bpi() from the USB framework to find the maximu=
m
> bytes per interval for the endpoint. Consequently this adds eUSB2
> isochronous mode and SuperSpeedPlus Isochronous Endpoint Compaion support
> where larger bpi values are possible.
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
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
> index da24a655ab68..fde0bc95622c 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -536,7 +536,7 @@ static int uvc_parse_streaming(struct uvc_device *dev=
,
>         unsigned int nformats =3D 0, nframes =3D 0, nintervals =3D 0;
>         unsigned int size, i, n, p;
>         u32 *interval;
> -       u16 psize;
> +       u32 psize;
>         int ret =3D -EINVAL;
>
>         if (intf->cur_altsetting->desc.bInterfaceSubClass
> @@ -772,7 +772,7 @@ static int uvc_parse_streaming(struct uvc_device *dev=
,
>                                 streaming->header.bEndpointAddress);
>                 if (ep =3D=3D NULL)
>                         continue;
> -               psize =3D uvc_endpoint_max_bpi(dev->udev, ep);
> +               psize =3D usb_endpoint_max_isoc_bpi(dev->udev, ep);
>                 if (psize > streaming->maxpsize)
>                         streaming->maxpsize =3D psize;
>         }
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uv=
c_video.c
> index a75af314e46b..335b1c4eff9b 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1860,24 +1860,6 @@ static void uvc_video_stop_transfer(struct uvc_str=
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
> @@ -1888,10 +1870,10 @@ static int uvc_init_video_isoc(struct uvc_streami=
ng *stream,
>         struct urb *urb;
>         struct uvc_urb *uvc_urb;
>         unsigned int npackets, i;
> -       u16 psize;
> +       u32 psize;
>         u32 size;
>
> -       psize =3D uvc_endpoint_max_bpi(stream->dev->udev, ep);
> +       psize =3D usb_endpoint_max_isoc_bpi(stream->dev->udev, ep);
>         size =3D stream->ctrl.dwMaxVideoFrameSize;
>
>         npackets =3D uvc_alloc_urb_buffers(stream, size, psize, gfp_flags=
);
> @@ -2034,7 +2016,7 @@ static int uvc_video_start_transfer(struct uvc_stre=
aming *stream,
>                                 continue;
>
>                         /* Check if the bandwidth is high enough. */
> -                       psize =3D uvc_endpoint_max_bpi(stream->dev->udev,=
 ep);
> +                       psize =3D usb_endpoint_max_isoc_bpi(stream->dev->=
udev, ep);
>                         if (psize >=3D bandwidth && psize < best_psize) {
>                                 altsetting =3D alts->desc.bAlternateSetti=
ng;
>                                 best_psize =3D psize;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index b9f8eb62ba1d..a77ba76e033a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -450,7 +450,7 @@ struct uvc_streaming {
>
>         struct usb_interface *intf;
>         int intfnum;
> -       u16 maxpsize;
> +       u32 maxpsize;
>
>         struct uvc_streaming_header header;
>         enum v4l2_buf_type type;
> @@ -818,8 +818,6 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
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
> 2.39.5
>
>


--=20
Ricardo Ribalda

