Return-Path: <linux-usb+bounces-25747-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CFFB0383C
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 09:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 036C41893D8A
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 07:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A15B2356C6;
	Mon, 14 Jul 2025 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OIMLQLon"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9260819D88F
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479067; cv=none; b=f63/hPS0AP1Jl970tZBG9C7J4628lTz/7MGfoGGLtgVxcbgpCqV6arV0YKfKcaFWkiwQwbNxbhm4RX53U70VD+j++fb2yLHn6AhAOsyseBUeT2ckVlYmD/NG/c7wCrATYExqAnmQr2j7ZBUhxQ75CBwceV+28wA3pUZFgi8nVLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479067; c=relaxed/simple;
	bh=meIXVFuhwo0U7DlXFwTqTWPNohJSUxEpilpiwQSBqfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHS0jHcfmuVzttopP8HeXmo81jZ4AriIcv7ESwLV/BAnrrbI/QL/0RtJhX5bEhVPdZs7g1IwP3DYkC5SSo/lzKHDI+1Dx2AyA8UjjdCg0Wwuw5W4XphRel/L+YD4mglK9KchMHfFJ0oGsHQjzf7c+aP+paEgn8NLhuCdi9WfySc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OIMLQLon; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-558fa0b2cc8so3104559e87.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752479063; x=1753083863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fiHcBWKp9YgqBe1/PxkbmZBsucMVnC9XKVlBV7M2C8g=;
        b=OIMLQLon/U6TRxmm2ecEm9BCxgThptR4VPHp8kyttAhMfPAPc3igr1emzrXtDeUuh7
         Puc5mBsC6bjJCf7mqUihc10Jp0o97dxVLAYTqfKFd7mXRoDnL5ktLPuMIW9iRPVSVHAf
         aOjqcgc8bg6tEwTzzetsR1y+NzbAGFY/uRr3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752479063; x=1753083863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiHcBWKp9YgqBe1/PxkbmZBsucMVnC9XKVlBV7M2C8g=;
        b=JTHlbMuAQyeoIbFy6E2BxUpudMJ0eQ0z2AHa4/5o97UUOjOIqpjPmJAWYEW/HWDIPa
         Lrcf+4ct65mnzevjQT92SgZyCxVaw8I9LDIOpWddANjNvGshG3lNMwDjSKKASPl/UO8q
         PzohEplI32Foh7dtVPwRuonPbEbYVFlRCqtl8PDFLRt9B2NT4YrNkQ3BDH4mtLcZ+tQ2
         ZR7QXd9CutbmNi9JkmphhRfW5JIw3ntWkGxt0IT/a38SmcheRxMQ4iJTY19tfjg8S35u
         /+y1Eqx6nP2e2ve9yXBkSbzt3GDox8tPG0YAulQ03uwdi4R5YWTNC0mGXBWAG/9b/c2H
         Td5A==
X-Forwarded-Encrypted: i=1; AJvYcCX15YX9bmr7MvSfQRYnieXmINJS3bzuVw6TJox+OzlG7zGmaGF7RzC0Wrh9Mrq8uttEcqLYY+5jiF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF2x5visFt/uphPyFE6+K30b+UJ0HqUFe/ehvrt1b93c0QB0Ry
	z685E3mdGJ8wc16sZ+ln47zWYOB7Ob1wMzdmnvHNKNHasD2LDE+xE6amiD9Rhf0hiSnn9ceMtzN
	jLss=
X-Gm-Gg: ASbGncsh/hlUTWcDGTWki4Rv/mZsjDp1ys1rO9LVAEpg4nF2YuC8hcHoZ7CVJwMmzW2
	nxWJBR4B+r6WyJXEQzP/d0Xjf3HLA2YFd1nJLthYfWT6Odp0exS03xvB22VOeU+H0qhSz5QYoOV
	RBxuM6SbUm3vsC+snccS7qfR15E4scMxwMyG2DRKVR03tSnqx+EvUE94ADUEJsw8WcBM0pjRgVO
	XzJuHGgmcH9JFaOZ3fuvMFJXL0pyGa8le/tFnU1gqiiIcwQH23eInXfd6QwOndC5xD9qUiC5HYD
	Zn+jp6IG04IROKc4V4toAnEQEZrpS37HJcBXxUBTYu+ex/v46AyF5O2pQluAerboiXJZ593fZ+a
	IYPc1cquCwn8Ys3VK+8fe3Bp0dYVersMxd+Qcp98vRfjKXjfc0Ze5SWm7LQ5Vnf0d
X-Google-Smtp-Source: AGHT+IHqJ/00x7sqk+fpRN4fOSwC3g/sSTnZ4Wi9CCSxlkGxonzRN5PhF5iWLNv1wlnkVpWlqR2BBg==
X-Received: by 2002:ac2:4bce:0:b0:553:518d:8494 with SMTP id 2adb3069b0e04-55a04634ca5mr3679437e87.54.1752479063278;
        Mon, 14 Jul 2025 00:44:23 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bd725sm1865769e87.14.2025.07.14.00.44.22
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 00:44:22 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32f1df58f21so39807681fa.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 00:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFfhYM45+wARE0TcIBWok6vtzwzkIANytgA8P0m9n6AHQJl9v+AinZW8fhaHbs24VGM+jN61BcDMo=@vger.kernel.org
X-Received: by 2002:a2e:be9e:0:b0:32b:95ca:8103 with SMTP id
 38308e7fff4ca-330532d1539mr34334811fa.14.1752479062312; Mon, 14 Jul 2025
 00:44:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
 <20250707-uvc-meta-v8-4-ed17f8b1218b@chromium.org> <20250711201308.GI27674@pendragon.ideasonboard.com>
In-Reply-To: <20250711201308.GI27674@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 09:44:09 +0200
X-Gmail-Original-Message-ID: <CANiDSCsfMaOTb90yJ6gbN6NOPqMAZSiLVcfq6YnpVkdabrW6xw@mail.gmail.com>
X-Gm-Features: Ac12FXyBJ3g138qqv6DvaCM4IcR-em_Kp08H9lGf8-r7VoyYMA1D6l_p7Q8nePY
Message-ID: <CANiDSCsfMaOTb90yJ6gbN6NOPqMAZSiLVcfq6YnpVkdabrW6xw@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 11 Jul 2025 at 22:13, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jul 07, 2025 at 06:34:04PM +0000, Ricardo Ribalda wrote:
> > The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> > V4L2_META_FMT_D4XX. The only difference between the two of them is that
> > V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> > V4L2_META_FMT_D4XX copies the whole metadata section.
> >
> > Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> > devices, but it is useful to have the whole metadata payload for any
> > device where vendors include other metadata, such as the one described by
> > Microsoft:
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> >
> > This patch introduces a new format V4L2_META_FMT_UVC_MSXU_1_5, that is
> > identical to V4L2_META_FMT_D4XX.
> >
> > Let the user enable this format with a quirk for now. This way they can
> > test if their devices provide useful metadata without rebuilding the
> > kernel. They can later contribute patches to auto-quirk their devices.
> > We will also work in methods to auto-detect devices compatible with this
> > new metadata format.
> >
> > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
> >  .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  drivers/media/usb/uvc/uvc_metadata.c               |  4 ++++
> >  drivers/media/usb/uvc/uvcvideo.h                   |  1 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
> >  include/uapi/linux/videodev2.h                     |  1 +
> >  7 files changed, 32 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > index bb6876cfc271e1a0543eee4209d6251e1a6a73cc..0de80328c36bf148051a19abe9e5241234ddfe5c 100644
> > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > @@ -20,6 +20,7 @@ These formats are used for the :ref:`metadata` interface only.
> >      metafmt-pisp-fe
> >      metafmt-rkisp1
> >      metafmt-uvc
> > +    metafmt-uvc-msxu-1-5
> >      metafmt-vivid
> >      metafmt-vsp1-hgo
> >      metafmt-vsp1-hgt
> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..dd1c3076df243d770a13e7f6d07c3296a269e16a
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> > @@ -0,0 +1,23 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _v4l2-meta-fmt-uvc-msxu-1-5:
> > +
> > +***********************************
> > +V4L2_META_FMT_UVC_MSXU_1_5 ('UVCM')
> > +***********************************
> > +
> > +Microsoft(R)'s UVC Payload Metadata.
> > +
> > +
> > +Description
> > +===========
> > +
> > +V4L2_META_FMT_UVC_MSXU_1_5 buffers follow the metadata buffer layout of
> > +V4L2_META_FMT_UVC with the only difference that it includes all the UVC
> > +metadata in the `buffer[]` field, not just the first 2-12 bytes.
> > +
> > +The metadata format follows the specification from Microsoft(R) [1].
> > +
> > +.. _1:
> > +
> > +[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 658543062bba3b7e600699d7271ffc89250ba7e5..fdde1d37ed2ef9058e3ea3417bec25afe454dfc0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25827,6 +25827,7 @@ S:    Maintained
> >  W:   http://www.ideasonboard.org/uvc/
> >  T:   git git://linuxtv.org/media.git
> >  F:   Documentation/userspace-api/media/drivers/uvcvideo.rst
> > +F:   Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> >  F:   Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> >  F:   drivers/media/common/uvc.c
> >  F:   drivers/media/usb/uvc/
> > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > index 4bcbc22f47e67c52baf6e133f240131ff3d32a03..77e03273d3cf6b00cac6ebb9b29b941f1cbfd9f7 100644
> > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > @@ -195,6 +195,10 @@ void uvc_meta_init(struct uvc_device *dev)
> >           !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC))
> >               dev->meta_formats[i++] = dev->info->meta_format;
> >
> > +     if (dev->quirks & UVC_QUIRK_MSXU_META &&
> > +         !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC_MSXU_1_5))
> > +             dev->meta_formats[i++] = V4L2_META_FMT_UVC_MSXU_1_5;
>
> Just to clarify, does this mean that your goal is to set
> dev->info->meta_format to V4L2_META_FMT_UVC_MSXU_1_5 as devices are
> reported to support the format ?

That is correct. Compatible devices shall either be autodetected via
the special control or manually added to the quirk list.

Quirking via module parameter should be just used for development purposes.


>
> > +
> >        /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
> >       dev->meta_formats[i++] = 0;
> >  }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index b3c094c6591e7a71fc00e1096bcf493a83f330ad..616adc417c62a58686beccbc440a5dfac0a2d588 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -77,6 +77,7 @@
> >  #define UVC_QUIRK_DISABLE_AUTOSUSPEND        0x00008000
> >  #define UVC_QUIRK_INVALID_DEVICE_SOF 0x00010000
> >  #define UVC_QUIRK_MJPEG_NO_EOF               0x00020000
> > +#define UVC_QUIRK_MSXU_META          0x00040000
> >
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index be94a79b976e3de4eb957f5d2584ec6d4230469e..993b36417b4655456ce545cb42a41b55b98e4d6c 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1463,6 +1463,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >       case V4L2_META_FMT_VSP1_HGO:    descr = "R-Car VSP1 1-D Histogram"; break;
> >       case V4L2_META_FMT_VSP1_HGT:    descr = "R-Car VSP1 2-D Histogram"; break;
> >       case V4L2_META_FMT_UVC:         descr = "UVC Payload Header Metadata"; break;
> > +     case V4L2_META_FMT_UVC_MSXU_1_5:        descr = "UVC MSXU Metadata"; break;
> >       case V4L2_META_FMT_D4XX:        descr = "Intel D4xx UVC Metadata"; break;
> >       case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> >       case V4L2_META_FMT_RK_ISP1_PARAMS:      descr = "Rockchip ISP1 3A Parameters"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 6f7bd38dd5aa4b1b2084685512512a380d76a5e4..863bc5b7dec32303e852d7e9c3891011ce5a3d71 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -867,6 +867,7 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
> >  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
> >  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> > +#define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
> >  #define V4L2_META_FMT_VIVID    v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
> >
> >  /* Vendor specific - used for RK_ISP1 camera sub-system */
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

