Return-Path: <linux-usb+bounces-25780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FE9B0454C
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 18:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98238166ECF
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 16:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFA7260565;
	Mon, 14 Jul 2025 16:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jGf3P/Z3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9F92E36F0
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752510084; cv=none; b=GPeCKIjRybjKrcjUR0c7mSmavgeioNrOkWtGdfrten32jQzL4bLoAGJ3VeIV/omtwum8dbh+x2MjRA6gRcs+IWZYxE73ivh0aLNhDeZ7PxklktHBV2oJ770xvqo3Bzaov+C6epj1dVVNe+bFBBwQBsJ664UcWZnbfuHN9cIKY/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752510084; c=relaxed/simple;
	bh=nBAyc0awaOuChBPZdTk3gawvOke/h+y8u0NZhGidKnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HV1wm15ZyS3rv+mH3w85o7rcYmc8rhkLoyJZjH8jm4czqIUz/cKhRYakdQIz+wX+bLRxq9VMYBCp+/Zo4ToZeMYzIDbE2/0Wf0hbS2r2GUr3QZNDyarJ6OPYr+Ii+AHG0oglO10Tt67fAn0z9S27TsjUkw1tEjgrmBQDabDlsdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jGf3P/Z3; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b6a349ccso5581245e87.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752510080; x=1753114880; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NcEGYcrl2lfFSVsCEwPAnhtxoGiZTwbntNurSuVQnuI=;
        b=jGf3P/Z31ctsPKn8OtpmIp+ae1a2gv/YOl6JOSfKWKowLhSkrt34fcPGvxp3ObhRrb
         Ib8Nyx1rktUI4IT2XWGc92gjw8/iWyrnxwubc6S/x6pNArm/p76xNJafhfY9ZrymZ4/A
         JSkns8GQVwMJQ05JJOkGM7uaGypHeW6+9XqFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510080; x=1753114880;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcEGYcrl2lfFSVsCEwPAnhtxoGiZTwbntNurSuVQnuI=;
        b=SK2XUxdXf+xD1ASzgC9VEPP8983gn68y4R8O+qOsLoAT12XzR1e2q7+qm8yECSDdzm
         efQy/ugmA3P667WHkF12QWwyGWcRvSk3e3Ce35MwR0buvHuv5IC6yAdvVE+N+S95NW+l
         M98QpvzcPhMA09tql3ovVAb0uNIwYPJHG7U5PFfPwKKW/Z917IknEMfMvoGI9pTG+KJz
         mpW0Cy80sogtqv5yuQHmkzMhCb+lwhgVS3UQJprWG2TxPxB15g7TNr1VLGgOlMhC3hmf
         AhzA6EVqe3jrmBK4dPdFlkrxQvgao6fQm3fjnfDMmESip6F32CkUqi6pH/GM3P4EHv4f
         SE7w==
X-Forwarded-Encrypted: i=1; AJvYcCVd+acp2SvIJ9YVjPVXUFmJpD8X08UmBRpyIRTsQJKf0SqgeEkod2u8QfOya9UUuPjjJ6HX6LJEsa8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8uSmSp4eOxY3cZj6AZd2qcgSCtvfDpF8VwX30dYVZwAjKonVA
	Om3j4UdyF3+1krFaeDLNtJ8LvSkNQskrygo8TOyz/2S3gufFY3K1I6dafQQlA1zo7t3iIWsVBKf
	y9RLOlA==
X-Gm-Gg: ASbGncs4ovqrpfuY0Bged9Haf9gKWdnOC/yhPcG9UXD2/g2wucE9dGcwQXZQSgtsYGt
	Kp18sGyVMeC070bqpi0SEVC64Rd41FPRq4MtoCG8dq8H92zWOtghpvCJ7K/cCoIwQnHIOHgTvxK
	8Vc+Fmi5Nq6BSKcxYiyMp8DNEQHL5juMkOMQdCpnaA2kfRSQWrQA26uEa5LSrJkAkyZWRBwDR8w
	Belkg66yrWW5v1eEzaQpHn2w3q2k39HQh+MXwI75wG//hfDm+L+FvrbJvSbGWDXkXgL96G8L5Mq
	NyvV+TJnsT46TsMC7FGCNIS+27qBWvovTJbXwd4+ImCMHs6vIX+H5IU1dVUeKvpXczNUb2E24tg
	cS/LpHCdk7ADRBHcb0jweahP5/uIczT3xkjaIFgDcmulTpDFvW3ElHq3MlRNZ
X-Google-Smtp-Source: AGHT+IF25oJvunjq4futYSSNa/VFXuyBw2jbHQ/clHw34eJripakiuXe1wXWW9M5asdDaNSFdFNqHA==
X-Received: by 2002:a05:6512:3b8a:b0:553:30fc:ceda with SMTP id 2adb3069b0e04-55a0448b89bmr3468418e87.7.1752510079625;
        Mon, 14 Jul 2025 09:21:19 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bbf82sm1980133e87.4.2025.07.14.09.21.19
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 09:21:19 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55511c3e203so4251869e87.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 09:21:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYBjBcgvbKZOxEIkVmQZjxuRyOih7CQ5RVu1SnY6fQWuyLFx1EQbs+8ep1PGbKEjwo1q8LCUn7V/M=@vger.kernel.org
X-Received: by 2002:a05:6512:108c:b0:553:2bb2:789c with SMTP id
 2adb3069b0e04-55a045f080cmr4377976e87.37.1752510078700; Mon, 14 Jul 2025
 09:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
 <20250707-uvc-meta-v8-4-ed17f8b1218b@chromium.org> <20250714145935.GL8243@pendragon.ideasonboard.com>
In-Reply-To: <20250714145935.GL8243@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 18:21:05 +0200
X-Gmail-Original-Message-ID: <CANiDSCt=cS9_BsEvo8fEpRDfud9nob2nzgDR6CvmcFczZurG2w@mail.gmail.com>
X-Gm-Features: Ac12FXxkGSW758gyDR9qWuf6ktscnvgEZRhw4k_sMicy2cDn1WBWNGNQmMXUwBY
Message-ID: <CANiDSCt=cS9_BsEvo8fEpRDfud9nob2nzgDR6CvmcFczZurG2w@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 14 Jul 2025 at 17:00, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> A bit of a stupid question, or rather a question that I wonder why I
> didn't think of before.

I believe we discussed this in the very beginning, when I just enabled
V4L2_META_FMT_D4XX for all the devices.

We thought that it could break applications. Imagine an APP that can
work with D4XX but not with other formats: if it tries to parse MSXU
format it might crash.

Regards

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
>
> Wouldn't it be simpler for everybody to just
>
> #define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('D', '4', 'X', 'X') /* UVC MSXU metadata */
> #define V4L2_META_FMT_D4XX      V4L2_META_FMT_UVC_MSXU_1_5 /* For backward compatibility */
>
> ? I'm a bit uncomfortable with committing to a UABI with two different
> 4CCs for the exact same format.
>
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

