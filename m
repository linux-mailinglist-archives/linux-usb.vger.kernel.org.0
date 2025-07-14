Return-Path: <linux-usb+bounces-25776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B64B044AA
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 17:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C67803AA50B
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 15:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C50B23B628;
	Mon, 14 Jul 2025 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TO3Iq7Qe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87811FF1A0
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 15:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752508019; cv=none; b=aUDRayqVK4revn7EaBSf63mjnQA89Kpe5DwQUI304TFVlLRUR6Xg8vHe3kFE5v8f0aMEnEcYVxMOswoFUmNpkvyXJN1fRkYC+xXO4cEbcKimSs7cBJ81rFVep+ew1T+KmrogXswfrY1eXtAkunvJDiHvFPkIM7bqdzQFYpfPJ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752508019; c=relaxed/simple;
	bh=5LlMEN4J3o3aD6YDXjwZ5zCkBWXWLqScnxci+wtPW0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5eofiT8XydqHlE/cZGJt9eyAdtPOdT0LHgXOrulRJ+HAuzaO6WEHuiP2zi+dW4BBDRifMVZXVX9TMVNWft9TpIwIjZdNBZa99gK/a4Ke6Gwqjxk0t+1RqNBw3GPDlQBlvgvhksRG3jVbu9HYdtRxaQUg2owu7HJgACznse5NSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TO3Iq7Qe; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-558fa0b2cc8so3515049e87.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752508016; x=1753112816; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9h6RiMEbdSPWHXVsj9OLxwFBmTJFmqoquTZg92Kpnmk=;
        b=TO3Iq7QeVk002ueq3Qx/vgiIdEEyI7LQfxkhURcouoXe4MOrNKo+tGUbHirZ++TWyf
         Phcwg3ctQpb9YeTAzrIjYk3WOhf1KeiN0NaOkkg24Jkqq/MLe1ni1bxlRj8OJzwb2ESX
         SMoThRskLQ3+cO1SdpObAgNnPg+xxrCUx5zhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752508016; x=1753112816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9h6RiMEbdSPWHXVsj9OLxwFBmTJFmqoquTZg92Kpnmk=;
        b=qTZBmL9J0RB9+IbjGTMTJBiIzVVxeq9LzcM67EKZFi4IvXwHolLLTV1knta01uFFep
         dEOiXob1OjyDVpCPweDe0efn9eUqufs26aC3qyRsX9lh+R1/u6jJh9N/fbQxOa+6jpgl
         pqYI7wc6QjN2LhTZ0EzJ9efbwcK1iHPavRCtUpFSANlmK8hMUR9JcbfJBRgMiW+CAVvl
         un0wfSRprDUB6Qk0nA8/fxkE1ZErVxO5sE13pUUes4+++ARjpgLdSjUq6tSajk8suiuj
         Ywh7lF48GQ3C/Hw5+GqC2BUB9lkNXNb0BKFD1cQqxzukRm14xydostvfzGAKZTtZoK1T
         ZOVg==
X-Forwarded-Encrypted: i=1; AJvYcCX49T4UzhTFT/3NpF3xLubMm1Qh1r4vUsyW7hp95qlexzZzJ49+3Dd6sKAtoz48j47dsPvi6SmUzXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxrqKhQ62+X8YYkZF3eUPTyjT5hkYnM8CwYZ94Ij/F5PhpKwsQ
	hgekyQDdYb7+XN1zAG5y7fRdhXG8HkDdvfmPsiuv4yOOanuACWD3BSf2KaCgvUevaryE0zFYo4z
	VQ9t+qA==
X-Gm-Gg: ASbGncvqVvHHVdBzmH+JW+6Q2mBsGU2DEZzPjOrS8NgLFwDfmLClM2FkKoVCu1Y4mNC
	8QjznwXFAStW7zaJ/cqU7eOw6p9TWS4qtOVrtkTtIWaGL+FricyI+xNysTJx1j79pAdJ87QRFuO
	q6kS6vOr6zaaCEDRzMg53nglkCIhcVBK0KpLHMK5O2FcfZmquHLoxbL9Uc4HlqPavpFKukP94b/
	E/BNRthAG7Lp1dlXG1dHFt6keU/ED6AAAnw/mDDYlcgB1s8g4bnkq1xIuCCvJG/RAiOW7oz4V+N
	2GQ/nNkjV+qYw2Nq0uiSybma7EoX/W9A3VD+bREdW00vyMZL94lOy2g/61ObMWU6Yh0ziy4wt8K
	fDhmgwxjc1rhO8IdvFMh9yGeCWLMvgsrP1KAOeJwWGH13X73i/+25tN0HAeXf
X-Google-Smtp-Source: AGHT+IEcSq2Tbye/Yyde4qCIh536DYejwwx2xjYsU9Y8VZQ20+D+vTbPPG+NkV1G9oCODUPObSoG/A==
X-Received: by 2002:a05:6512:3f18:b0:553:297b:3d4e with SMTP id 2adb3069b0e04-55a04633fd1mr4059894e87.52.1752508015832;
        Mon, 14 Jul 2025 08:46:55 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b808efsm1985429e87.245.2025.07.14.08.46.53
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:46:53 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55511c3e203so4218198e87.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 08:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpFDjRE48gt7ARNgnovd0P/BQsszRc8DnwfBpJE1z+wnAf1l96ZWZkKiAG7CiQOppVrtpW5xJmb9U=@vger.kernel.org
X-Received: by 2002:a05:6512:b10:b0:553:3492:b708 with SMTP id
 2adb3069b0e04-55a046250abmr3344250e87.49.1752508013248; Mon, 14 Jul 2025
 08:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-10-5710f9d030aa@chromium.org>
 <20250629181246.GE6260@pendragon.ideasonboard.com> <CANiDSCsu0RT4dcGyBJRutP=9HTe+niUoohxTZE=qJ8O_9ez=+A@mail.gmail.com>
 <20250714142926.GI8243@pendragon.ideasonboard.com>
In-Reply-To: <20250714142926.GI8243@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 17:46:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCvFe23xmrJ0-qbWWa6+vKGb+QdDFV8VSLkmWdAnfsFtzw@mail.gmail.com>
X-Gm-Features: Ac12FXzUtyaVLj7tKhzc2QjlgMNdUTCkm86hTg8iZ2lfMiulh_fOCFYDlXtaIQQ
Message-ID: <CANiDSCvFe23xmrJ0-qbWWa6+vKGb+QdDFV8VSLkmWdAnfsFtzw@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] media: uvcvideo: Add get_* functions to uvc_entity
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 14 Jul 2025 at 16:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jul 01, 2025 at 01:13:10PM +0200, Ricardo Ribalda wrote:
> > On Sun, 29 Jun 2025 at 20:13, Laurent Pinchart wrote:
> > > On Thu, Jun 05, 2025 at 05:53:03PM +0000, Ricardo Ribalda wrote:
> > > > Virtual entities need to provide more values than get_cur and get_cur
> > >
> > > I think you meant "get_info and get_cur".
> > >
> > > > for their controls. Add support for get_def, get_min, get_max and
> > > > get_res.
> > >
> > > Do they ? The UVC specification defines controls that don't list
> > > GET_DEF, GET_MIN, GET_MAX and GET_RES as mandatory requests. Can't we do
> > > the same for the software controls ? This patch is meant to support the
> > > UVC_SWENTITY_ORIENTATION and UVC_SWENTITY_ROTATION control in the next
> > > patch, and those are read-only controls. Aren't GET_INFO and GET_CUR
> > > enough ?
> >
> > V4L2_CID_CAMERA_ROTATION has the type UVC_CTRL_DATA_TYPE_UNSIGNED,
> > that time requires get_min and get_max.
>
> Where does that requirement come from ? Is it because how the
> corresponding V4L2 type (V4L2_CTRL_TYPE_INTEGER) is handled in
> uvc_ctrl_clamp() ? uvc_ctrl_clamp() is only called when setting a
> control, from uvc_ctrl_set(), and V4L2_CID_CAMERA_ROTATION should be
> read-only.

It its for VIDIOC_QUERY_EXT_CTRL

uvc_query_v4l2_ctrl -> __uvc_query_v4l2_ctrl -> __uvc_queryctrl_boundaries

We need to list the min, max, def and step for every control. They are
fetched with uvc_ctrl_populate_cache()



>
> > We can create a new type UVC_CTRL_DATA_TYPE_UNSIGNED_READ_ONLY that
> > fakes min, max and res, but I think that it is cleaner this approach.
> >
> > > > This is a preparation patch.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
> > > >  drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
> > > >  2 files changed, 20 insertions(+)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 21ec7b978bc7aca21db7cb8fd5d135d876f3330c..59be62ae24a4219fa9d7aacf2ae7382c95362178 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -596,6 +596,18 @@ static int uvc_ctrl_query_entity(struct uvc_device *dev,
> > > >       if (query == UVC_GET_CUR && ctrl->entity->get_cur)
> > > >               return ctrl->entity->get_cur(dev, ctrl->entity,
> > > >                                            ctrl->info.selector, data, len);
> > > > +     if (query == UVC_GET_DEF && ctrl->entity->get_def)
> > > > +             return ctrl->entity->get_def(dev, ctrl->entity,
> > > > +                                          ctrl->info.selector, data, len);
> > > > +     if (query == UVC_GET_MIN && ctrl->entity->get_min)
> > > > +             return ctrl->entity->get_min(dev, ctrl->entity,
> > > > +                                          ctrl->info.selector, data, len);
> > > > +     if (query == UVC_GET_MAX && ctrl->entity->get_max)
> > > > +             return ctrl->entity->get_max(dev, ctrl->entity,
> > > > +                                          ctrl->info.selector, data, len);
> > > > +     if (query == UVC_GET_RES && ctrl->entity->get_res)
> > > > +             return ctrl->entity->get_res(dev, ctrl->entity,
> > > > +                                          ctrl->info.selector, data, len);
> > > >       if (query == UVC_GET_INFO && ctrl->entity->get_info)
> > > >               return ctrl->entity->get_info(dev, ctrl->entity,
> > > >                                             ctrl->info.selector, data);
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index a931750bdea25b9062dcc7644bf5f2ed89c1cb4c..d6da8ed3ad4cf3377df49923e051fe04d83d2e38 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -261,6 +261,14 @@ struct uvc_entity {
> > > >                       u8 cs, u8 *caps);
> > > >       int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
> > > >                      u8 cs, void *data, u16 size);
> > > > +     int (*get_def)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                    u8 cs, void *data, u16 size);
> > > > +     int (*get_min)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                    u8 cs, void *data, u16 size);
> > > > +     int (*get_max)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                    u8 cs, void *data, u16 size);
> > > > +     int (*get_res)(struct uvc_device *dev, struct uvc_entity *entity,
> > > > +                    u8 cs, void *data, u16 size);
> > > >
> > > >       unsigned int ncontrols;
> > > >       struct uvc_control *controls;
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

