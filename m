Return-Path: <linux-usb+bounces-28072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42847B5710D
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 09:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A053D1898F3C
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 07:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236E52D46BB;
	Mon, 15 Sep 2025 07:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FDQWzIpK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ABB285C88
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 07:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757920731; cv=none; b=E6zMyFh057XNDZuzWzjCzxdPIc3sYFLzBeLM8sdCxdheguTtnL1Bimz+A1CByIJS2OgtxvZooqQcNrZ0C0SE4Cmneew09OISqgOrY4gK7bfObjWYDZi3U/6YPv1uZF8jLdvbklp4yJrMJbFktXX2vV3Sld1HvbpVfA+wO9HlE9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757920731; c=relaxed/simple;
	bh=N+aPabF4Hwc+ssipHtzxdYT8V6ZYevI0V4qEa4nH6Xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUKyYTE5XKollakvpPczBduKC9G9H+b4j1jsSNGRpjXGLj2RuZ/uihtSauKUt/6C2GUFmrxOfKIfYzG3IEQnmJMvM9OQG8KYYseI2L4TNaoO0piOHgUfXwE+y27L3eClDKD3ZwWgneS5inZtPadoyEB3x1aXOOsrLirVDxsxY08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FDQWzIpK; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57263febd12so1185149e87.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 00:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757920728; x=1758525528; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O5YQjHTlBTsN+6yBGhPL1nppIP0vBI5RNEgHYignDxI=;
        b=FDQWzIpKeHq2hlfKjrbohSMD5AZuF1rTPiBOJkSYWO9bExlXb8FYMkfjB5jF9Qk4ef
         XuCZXzQEMIQw0ztBT+G5KcUeUO1OeCPfrDqBamZwKSlOv0fY+AboktNSYo6+v0zPWaxp
         6L2RlgV0Ae5J2tBHLE5PBd+MPzkN7SMHZwwJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757920728; x=1758525528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5YQjHTlBTsN+6yBGhPL1nppIP0vBI5RNEgHYignDxI=;
        b=quYrNd4WFx/WlGz1MbMs5RFxuzMga3mTk5casDf2fJMpJ2PnmHtMyfi8Nn6ADTkOF8
         MIUF/R6jhfDck/S78RIY8O7D+Y+HSXUjzquGNizGd82Or3wLOlEAVG+j2Ex14wY78GSE
         SIbowjLx66ozcAiJqN2SdaNEohl3+O4vYiqJXsC87BR9YTzWBBg+p5up8zP2oQB4cqRB
         8JCSdLQm12NMV9vI4izN5SkgiwhTD0+Rg8NuWjssLhEZ9l+jm5SrHbjvjca5MAej7x9f
         rVjWM5sxEqlQ9CKe4RNOWIWjMSWLKYdf72+/TQcseWxluXkdy7uEQsPwZxzF2EAjwxKp
         hU/g==
X-Forwarded-Encrypted: i=1; AJvYcCVDmb/MccsG/g2OCluL4eghW/6HZMfopHLS1UAvKZoJTchEVLLswEFd0Px12IgFFRJ90lc59bVGjbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS5w1qetaYDDkWoOBpvrV2yYzrqhgqdmgHCRq5sNKkIr3R0c/g
	E+haLhRWip1AGnOsL3IQp/mqhmgWdFA/HYi+XKnU5+pZdL7NIG57HMjOhFl+N1K6ew/RMpEj4ra
	HKzo=
X-Gm-Gg: ASbGncs7U52QUz2dP0bhhuGTCBTYydnvLUtLG2L+ex912hBxilr5vWAplPmicX7qIcp
	AKM6HK5FvYktnHLMv7T6aACI49GxkDm6/pG65C6KeXeIATQoD04CqcS2dByaxPyXYczCi1QbJet
	Gyb0u06YNIG2E/1njJB20A1FSg+xsjsc0B6tm0LLsdVfyvnQZZ/7+xiBxt8TpnsVKuIJI53GC6R
	J6enGGNOvIwW5GORh2SGFHRyHFQ1Gg0Y7PUpqYXA8YKqDQriUEMcooyGoxsOjxoJylmgyRa4b/M
	rg4/Z1dWwhhW9FRmXn/Mi9bIop4sSbzbWXT7LFvE2bJAg0pGUejmUtPFdV9DysIJrqG5AMpq37I
	OW0jcKICcnA+XSl3ohA+B/DPtYAok0PogcaCiNDEpmDm8KV0P6g8zGBKEdsqNFfzkzwJcjTk=
X-Google-Smtp-Source: AGHT+IEfF5EqF9g0j/+wvxh5IjH01VSasIhCzERWEaFnDxnXRJXC36D4oqOVKmYd3MLpnlvyx1mMDg==
X-Received: by 2002:a05:6512:15a6:b0:55c:df64:3769 with SMTP id 2adb3069b0e04-56d7691cf89mr3769410e87.9.1757920727583;
        Mon, 15 Sep 2025 00:18:47 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f15a582b3sm24830291fa.14.2025.09.15.00.18.46
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:18:46 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57263febd12so1185116e87.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 00:18:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2xVLhj/2D/5M4rhDtUfSuNypWCcoodyTOlcP+D4IziZSYUnoswd6gW676+XWm0H7MiD5w7CZ9a+8=@vger.kernel.org
X-Received: by 2002:a05:6512:10d4:b0:554:e7ce:97f8 with SMTP id
 2adb3069b0e04-570601d3f6fmr3574906e87.15.1757920726308; Mon, 15 Sep 2025
 00:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
 <20250818-uvc-iq-switch-v1-4-f7ea5e740ddd@chromium.org> <20250913140628.GB10328@pendragon.ideasonboard.com>
In-Reply-To: <20250913140628.GB10328@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Sep 2025 09:18:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCtsFYoDdQPakhX=mvkYCFpP-U82FBhDwdGJwOME-hFYQg@mail.gmail.com>
X-Gm-Features: Ac12FXzF2wjrlcTq-ZWxQ0b0FPhh0zsXbdbEJWeUXxxUiBB8xNFTd0o9yHoc-kY
Message-ID: <CANiDSCtsFYoDdQPakhX=mvkYCFpP-U82FBhDwdGJwOME-hFYQg@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Support UVC_CROSXU_CONTROL_IQ_PROFILE
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Sat, 13 Sept 2025 at 16:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Aug 18, 2025 at 08:15:39PM +0000, Ricardo Ribalda wrote:
> > The ChromeOS XU provides a control to change the IQ profile for a camera.
> > It can be switched from VIVID (a.k.a. standard) to NONE (a.k.a. natural).
> >
> > Wire it up to the standard v4l2 control.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++++++++++++
> >  include/linux/usb/uvc.h          |  5 +++++
> >  2 files changed, 37 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index ff975f96e1325532e2299047c07de5d1b9cf09db..8766a441ad1d8554c0daaed3f87758321684246b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -376,6 +376,15 @@ static const struct uvc_control_info uvc_ctrls[] = {
> >                               | UVC_CTRL_FLAG_GET_DEF
> >                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> >       },
> > +     {
> > +             .entity         = UVC_GUID_CHROMEOS_XU,
> > +             .selector       = UVC_CROSXU_CONTROL_IQ_PROFILE,
> > +             .index          = 3,
> > +             .size           = 1,
> > +             .flags          = UVC_CTRL_FLAG_SET_CUR
> > +                             | UVC_CTRL_FLAG_GET_RANGE
> > +                             | UVC_CTRL_FLAG_RESTORE,
> > +     },
> >  };
> >
> >  static const u32 uvc_control_classes[] = {
> > @@ -384,6 +393,17 @@ static const u32 uvc_control_classes[] = {
> >  };
> >
> >  static const int exposure_auto_mapping[] = { 2, 1, 4, 8 };
> > +static const int cros_colorfx_mapping[] = { 1, // V4L2_COLORFX_NONE
> > +                                         -1, // V4L2_COLORFX_BW
> > +                                         -1, // V4L2_COLORFX_SEPIA
> > +                                         -1, // V4L2_COLORFX_NEGATIVE
> > +                                         -1, // V4L2_COLORFX_EMBOSS
> > +                                         -1, // V4L2_COLORFX_SKETCH
> > +                                         -1, // V4L2_COLORFX_SKY_BLUE
> > +                                         -1, // V4L2_COLORFX_GRASS_GREEN
> > +                                         -1, // V4L2_COLORFX_SKIN_WHITEN
> > +                                         0}; // V4L2_COLORFX_VIVID};
>
> Extar '};' at the end of the line. The indentation also looks a bit
> weird. I'll replace it with
>
> static const int cros_colorfx_mapping[] = {
>         1,      /* V4L2_COLORFX_NONE */
>         -1,     /* V4L2_COLORFX_BW */
>         -1,     /* V4L2_COLORFX_SEPIA */
>         -1,     /* V4L2_COLORFX_NEGATIVE */
>         -1,     /* V4L2_COLORFX_EMBOSS */
>         -1,     /* V4L2_COLORFX_SKETCH */
>         -1,     /* V4L2_COLORFX_SKY_BLUE */
>         -1,     /* V4L2_COLORFX_GRASS_GREEN */
>         -1,     /* V4L2_COLORFX_SKIN_WHITEN */
>         0,      /* V4L2_COLORFX_VIVID */
> };
>
> > +
> >
> >  static bool uvc_ctrl_mapping_is_compound(struct uvc_control_mapping *mapping)
> >  {
> > @@ -975,6 +995,18 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> >               .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
> >               .name           = "Region of Interest Auto Ctrls",
> >       },
> > +     {
> > +             .id             = V4L2_CID_COLORFX,
> > +             .entity         = UVC_GUID_CHROMEOS_XU,
> > +             .selector       = UVC_CROSXU_CONTROL_IQ_PROFILE,
> > +             .size           = 8,
> > +             .offset         = 0,
> > +             .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > +             .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
> > +             .menu_mapping   = cros_colorfx_mapping,
> > +             .menu_mask      = BIT(V4L2_COLORFX_VIVID) |
> > +                               BIT(V4L2_COLORFX_NONE),
> > +     },
> >  };
> >
> >  /* ------------------------------------------------------------------------
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index 12a57e1d34674a3a264ed7f88bed43926661fcd4..22e0dab0809e296e089940620ae0e8838e109701 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -29,6 +29,9 @@
> >  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > +#define UVC_GUID_CHROMEOS_XU \
> > +     {0x24, 0xe9, 0xd7, 0x74, 0xc9, 0x49, 0x45, 0x4a, \
> > +      0x98, 0xa3, 0xc8, 0x07, 0x7e, 0x05, 0x1c, 0xa3}
>
> I'd like to add a link to the documentation, but searching for the GUID
> didn't turn up any meaningful result. Where can I find documentation for
> this XU ?

It is not public yet. Not because there is anything secret about it,
but because of the "making documentation process".

Once there is a public document I will add a link.

Regards!
>
> The link can be added later, so
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> >  #define UVC_GUID_MSXU_1_5 \
> >       {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> >        0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> > @@ -50,6 +53,8 @@
> >  #define UVC_MSXU_CONTROL_FIELDOFVIEW2_CONFIG 0x0f
> >  #define UVC_MSXU_CONTROL_FIELDOFVIEW2                0x10
> >
> > +#define UVC_CROSXU_CONTROL_IQ_PROFILE                0x04
> > +
> >  #define UVC_GUID_FORMAT_MJPEG \
> >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

