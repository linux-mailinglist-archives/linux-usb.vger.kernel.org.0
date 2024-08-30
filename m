Return-Path: <linux-usb+bounces-14387-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1688F9663B6
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 16:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 861591F23899
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 14:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0ECB16D4E5;
	Fri, 30 Aug 2024 14:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="DQlwI4cX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60051B1D7D
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026862; cv=none; b=py9Ij8H2gNtS2g9hq9ECu7mElSyLXrn2sf6QQ5aIYVHS/qsBRHUWfBMjOIIPVWiUelsRAxbgePSNl4CHzvqwKAFjWkFjrpxIsGhVefJxt+mljeUW3RkmZTNs/hRFI4gbVOjBnNyqm/PEu+yR3dcjOFXAaSZ0SgO4QXAw/zZagGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026862; c=relaxed/simple;
	bh=byj41dw4jBtv6cDWr9CipdVFwlvj8n6BYeD6IQNngGU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=scbC9gtmO0YQVXYNO+FQKYyDK6XVSPy4qEOq+GTCBaQBODZvuwQaM0iI+Swxenj1lOWgrqhwTw7fK/NQYCU9k4I8aiAZGv/BOlDGSvoSHmLfNVZpq8JRKC04pOm1aNZY1xZxfQZc9ydPBs7wzpWOvXFTPlq1uHaD8ajk0spllME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=DQlwI4cX; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a7d7ec7395so110718585a.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1725026859; x=1725631659; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=flP0C2L+IG1n0eRzukYJyzc4Y2z3XGEJf7AiahcU/RM=;
        b=DQlwI4cXIu7vrObojGAs+S15JRHTErQjMiX/WaexhnFoAGMojZR81+30Qi6yLw5huM
         3xZqvKqS/IX0gqsfS9/XoHqciYI/2PFwnji8ucBULoKZvU2dotF8PwEEnh7HMObhLdv7
         vYanOICqzpSyYpTMWJ6UugGLZe362vgKWwVdZp+7Jz9R7oPF5HkSDujCiPQ4CmezuYxZ
         Fqo/4Z077wUziefJG2yvJhqzmPwgfwNdM2WzQgVE+k8A5iqVtcAJ5FfOWWNUs+MfTTnk
         hF0CKvdJiBSMtaUg3EQKJDOfaM8JeE7mr6qqD57ieiBgp37fBYjav71jFmhVS2ekxwwb
         avxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725026859; x=1725631659;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flP0C2L+IG1n0eRzukYJyzc4Y2z3XGEJf7AiahcU/RM=;
        b=juLMYmYwRLLw4hTqwU8FtwqslTE3tEgCULcMR8LCaNF1igcZ4tDjWWUPj99ZW0sz+n
         WnQceah9TIbXbFv3wzmcUoAD6DH0rcKqL/07HiSNCTBRkdIpS+g39fEll5hpnX6pss2y
         a/AKXQrn0OiRpVxm+dDsIWriOhzn85CsdwmZbdMTApf1c2jSlY3xrYmiq7dkRH1ASsYi
         3j5LZxo279Z7nglhpEoY2UAtRzrTr+1x9T3h5XldMX2lCyZnGXgn6OCbdmaCPSim8h+Y
         KKu6dBJ9RzuieJu6OzGXBbc4NYYlshUu89dOq0b/d6IMjFJyD0GByNw/Vl1oP+dI8NwQ
         rvlw==
X-Forwarded-Encrypted: i=1; AJvYcCU44ooc2rZQjOSpKO4VajPf0XKcyH+lFcoChMAi2+EqFo9uFlXGAl1lj0PutBGxLvgnbZ5d+XVlXnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM7GlT+e+QrbeTBSIn47wopbTtvjepSw/h10BJn2kvQpCnKKjw
	pFsOau1WP0Qh1WWc0T+dAd9I/YZR4C2vmydfIxDskduJJQk1qEIdbiaKugEQWiYY4W+vo6bWe3T
	e
X-Google-Smtp-Source: AGHT+IGSiwNtqtyoI+UUaK40yrlmt3FkODnHNThEdWsryxPip6CiHerYEAC8UWZ59gw49kr0x9zzEg==
X-Received: by 2002:a05:620a:4723:b0:7a1:d9a6:a9af with SMTP id af79cd13be357-7a80427c884mr642032785a.68.1725026859401;
        Fri, 30 Aug 2024 07:07:39 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:9cac::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d3d111sm145414085a.72.2024.08.30.07.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:07:39 -0700 (PDT)
Message-ID: <877f12cc2408e189a25108d8e4d0558cfd090234.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] v4l: Add luma 16-bit interlaced pixel format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dmitry Perchanov <dmitry.perchanov@intel.com>, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 sakari.ailus@iki.fi,  demisrael@gmail.com, gregkh@linuxfoundation.org
Date: Fri, 30 Aug 2024 10:07:37 -0400
In-Reply-To: <568efbd75290e286b8ad9e7347b5f43745121020.camel@intel.com>
References: <c7c24f3f6661e5a01aae4e7ef549801411f063cb.camel@intel.com>
	 <568efbd75290e286b8ad9e7347b5f43745121020.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

just cosmetic comment.

Le lundi 26 ao=C3=BBt 2024 =C3=A0 16:04 +0300, Dmitry Perchanov a =C3=A9cri=
t=C2=A0:
> The formats added by this patch are:
>=20
>         V4L2_PIX_FMT_Y16I
>=20
> Interlaced lumina format primary use in RealSense

Here we specify the format as interlaced ...

> Depth cameras with stereo stream for left and right
> image sensors.
>=20
> Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-y16i.rst   | 74 +++++++++++++++++++
>  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 77 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst b/Docu=
mentation/userspace-api/media/v4l/pixfmt-y16i.rst
> new file mode 100644
> index 000000000000..fe4f441cd63c
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
> @@ -0,0 +1,74 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _V4L2-PIX-FMT-Y16I:
> +
> +**************************
> +V4L2_PIX_FMT_Y16I ('Y16I')
> +**************************
> +
> +Interleaved grey-scale image, e.g. from a stereo-pair
> +
> +
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This is a grey-scale image with a depth of 16 bits per pixel, but with
> +pixels from 2 sources interleaved and unpacked. Each pixel is stored

... But document it as interleaved. Id unify the wording as interleaved
everywhere if you don't mind. My weak argument is that interlaced is largel=
y
used in the media subsystem to refer to the technique of passing half the i=
mage
data, alternating between top and bottom field. In that context, we then us=
e
interleave to describe on method of line/field storage (we also have sequen=
tial
and alternate method supported).

Nicolas

> +in a 16-bit word in the little-endian order.
> +The first pixel is from the left source.
> +
> +**Pixel unpacked representation.**
> +Left/Right pixels 16-bit unpacked - 16-bit for each interleaved pixel.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - Y'\ :sub:`0L[7:0]`
> +      - Y'\ :sub:`0L[15:8]`
> +      - Y'\ :sub:`0R[7:0]`
> +      - Y'\ :sub:`0R[15:8]`
> +
> +**Byte Order.**
> +Each cell is one byte.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - Y'\ :sub:`00Llow`
> +      - Y'\ :sub:`00Lhigh`
> +      - Y'\ :sub:`00Rlow`
> +      - Y'\ :sub:`00Rhigh`
> +      - Y'\ :sub:`01Llow`
> +      - Y'\ :sub:`01Lhigh`
> +      - Y'\ :sub:`01Rlow`
> +      - Y'\ :sub:`01Rhigh`
> +    * - start + 8:
> +      - Y'\ :sub:`10Llow`
> +      - Y'\ :sub:`10Lhigh`
> +      - Y'\ :sub:`10Rlow`
> +      - Y'\ :sub:`10Rhigh`
> +      - Y'\ :sub:`11Llow`
> +      - Y'\ :sub:`11Lhigh`
> +      - Y'\ :sub:`11Rlow`
> +      - Y'\ :sub:`11Rhigh`
> +    * - start + 16:
> +      - Y'\ :sub:`20Llow`
> +      - Y'\ :sub:`20Lhigh`
> +      - Y'\ :sub:`20Rlow`
> +      - Y'\ :sub:`20Rhigh`
> +      - Y'\ :sub:`21Llow`
> +      - Y'\ :sub:`21Lhigh`
> +      - Y'\ :sub:`21Rlow`
> +      - Y'\ :sub:`21Rhigh`
> +    * - start + 24:
> +      - Y'\ :sub:`30Llow`
> +      - Y'\ :sub:`30Lhigh`
> +      - Y'\ :sub:`30Rlow`
> +      - Y'\ :sub:`30Rhigh`
> +      - Y'\ :sub:`31Llow`
> +      - Y'\ :sub:`31Lhigh`
> +      - Y'\ :sub:`31Rlow`
> +      - Y'\ :sub:`31Rhigh`
> diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Docu=
mentation/userspace-api/media/v4l/yuv-formats.rst
> index 24b34cdfa6fe..78ee406d7647 100644
> --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> @@ -269,5 +269,6 @@ image.
>      pixfmt-yuv-luma
>      pixfmt-y8i
>      pixfmt-y12i
> +    pixfmt-y16i
>      pixfmt-uv8
>      pixfmt-m420
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 5eb4d797d259..4fffa5739895 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1327,6 +1327,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  	case V4L2_PIX_FMT_Y14P:		descr =3D "14-bit Greyscale (MIPI Packed)"; br=
eak;
>  	case V4L2_PIX_FMT_Y8I:		descr =3D "Interleaved 8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y12I:		descr =3D "Interleaved 12-bit Greyscale"; brea=
k;
> +	case V4L2_PIX_FMT_Y16I:		descr =3D "Interleaved 16-bit Greyscale"; brea=
k;
>  	case V4L2_PIX_FMT_Z16:		descr =3D "16-bit Depth"; break;
>  	case V4L2_PIX_FMT_INZI:		descr =3D "Planar 10:16 Greyscale Depth"; brea=
k;
>  	case V4L2_PIX_FMT_CNF4:		descr =3D "4-bit Depth Confidence (Packed)"; b=
reak;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 4e91362da6da..46f616e43ad6 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -797,6 +797,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_S5C_UYVY_JPG v4l2_fourcc('S', '5', 'C', 'I') /* S5C=
73M3 interleaved UYVY/JPEG */
>  #define V4L2_PIX_FMT_Y8I      v4l2_fourcc('Y', '8', 'I', ' ') /* Greysca=
le 8-bit L/R interleaved */
>  #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greysca=
le 12-bit L/R interleaved */
> +#define V4L2_PIX_FMT_Y16I     v4l2_fourcc('Y', '1', '6', 'I') /* Greysca=
le 16-bit L/R interleaved */
>  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth d=
ata 16-bit */
>  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediate=
k compressed block mode  */
>  #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediate=
k 8-bit block mode, two non-contiguous planes */


