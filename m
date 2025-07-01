Return-Path: <linux-usb+bounces-25355-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA4AEF6A7
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 13:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A538F1C01D18
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 11:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89037272E4E;
	Tue,  1 Jul 2025 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a4d9xDzQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDEC27147E
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 11:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369697; cv=none; b=et93NmltXL2FK+Q/EAovfAMd/nXQ1MXMTy2uIdjkGecFKumBzHZNNSJnTeosgGKGReNm4J76sSo041FLV/mGemlKWAY5u55RDc8ndPMGKe4vHpFfvaJR7zYbOxQMelv2Tx9eXjxJ89vaoydYfJWHiAtI8ATkD9Ly8iOV2idDf/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369697; c=relaxed/simple;
	bh=ESXaDOI0ClJQb3/rnUaSslnZdyZvIXDxHVvhpQGw5jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nfc76HtRvPGbWU0fvx4vSuH6BJvBwld5wCbHTpO3UOOXusZr9yqOgPS9x7Q9W2rhf2hxTco96rEAmcO7zK0os9PTjGw305f/mZge2Hx4n9kIfuPyTMd3wflxbtVIHOKPS84iACI5AHrV3Z4Wt3ol3tnKZSoaE/mIpaD+BKIwVvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a4d9xDzQ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae35c447234so829819966b.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 04:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751369693; x=1751974493; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AOpbhHFXTgJjd1mQ2k57iBzGNrGLgGW/xPskwW5clgI=;
        b=a4d9xDzQ+nMRD4+WNvix2bOFwt35jMczSYSgwS72c5inMvp8WBcZ9+apo+yOjAg3pw
         2j8vpDYAuKXr6z3jLPWMb2KItTgF2I8FnJQ/u0a6BU6gBzn9XPVPj1qMUfuC+utQbyNO
         bSKZA9ixyYjH2Kv1ESIT4rCJR7W1L7TmNA20M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369693; x=1751974493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOpbhHFXTgJjd1mQ2k57iBzGNrGLgGW/xPskwW5clgI=;
        b=Xfz8h2zfgDxw9dcXYWtlFMCqv28zany/yY9OPEJpEwGfqVrc7BaNGLi3diipjogXXV
         xL9L3U0fmxJmE4nutvTfthg7rncRhHNbLJzZghQ2IQh9MdPDrZmlna4rd6tZ7sthrCnr
         rReOvc21b2OpjthccYJ8oBNKdJQuWgMjtcq0CMn/WA3FsF+PW6jI4tQLZLlxHcYjotkl
         m6xO72ZupH/rTAVNHBCYzDhwJAgXx7SOI4QMfY28bjgxwXcRtWlgS+sAk0YXb5QNazrO
         MJ4SYNk3eC/xKyhaHRbLF91i/urZFYVYEvl2RgEEdd3lQy7Mrmv+YaBg6vJjBYhuHaik
         LUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzsDSL8THkJkEo712UAUAcbkUIQzM8rFDaOpVzQmp1qC25VbE20KTtfTjQEYurLDOq51WhClqHerI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz+R4UaOpKzQDiaCRIXXDJj/glVYJvDkEuU/eoDgLaXaLsSZNg
	beASkwKhxrZ6aGPn5NjhlGQ+Gp4dXsfwNGPWg0wISkQdivSqUDyzVwba/8Yw0ek3H2SbVKPt/h4
	GreFPIQ==
X-Gm-Gg: ASbGncul2+CueOrTvmGUGhvLANmLTVdKmEy3dl80epahfGUsRNDPzqryMWL4KcAKsw3
	j2exkFWIbOt6J7LYd1sERhkUCISQTWct1mwFqfx5plvwyO/jide/OYCTje+DYVUtdNuBDW46lQ7
	7Djoj/4PKgJD7w21BVDvagYuYscwZiSI5VAGGqkxJHdlbuJilE+URSBXv5RjhfhvKSkcT7jfqA9
	iHUF/JYn7HZqItirUm5SmeqJ2FrDboOW8FaDDcOsCBuA4WyAvyNUFVFP9KUrEjacUkyEyF5/FE/
	R3Du0+zsre1QO4h1IquvMoywEELuzXSqqcZSD28JGJ6M4vXlwcBQynPmbJm3SV2jlrVG/T+oTw5
	yFqtUrPJ64+Ct0fdNRwGozkD4
X-Google-Smtp-Source: AGHT+IHi18Ekck7THqQwKPL2srHL6JmubHfXbyOBDxscH6k4U922DfFm7cf7ckA5aH07hFwiT9G5tw==
X-Received: by 2002:a17:907:7ea6:b0:ae0:b7f6:9d76 with SMTP id a640c23a62f3a-ae3aa343839mr367419866b.28.1751369693362;
        Tue, 01 Jul 2025 04:34:53 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bcd7sm830312266b.121.2025.07.01.04.34.53
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:34:53 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so3923619a12.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 04:34:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIP8mnwaiiuzvkWhhfUP/JoEbXwJZfK9KMRRPfzOPnGpb+BP2eWHIx0tpCk7jW3n+rG8r9Ak9Uv6Q=@vger.kernel.org
X-Received: by 2002:a05:6512:3996:b0:553:2a16:2503 with SMTP id
 2adb3069b0e04-5562351cd2bmr643670e87.22.1751369224941; Tue, 01 Jul 2025
 04:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-11-5710f9d030aa@chromium.org> <20250629181440.GO24912@pendragon.ideasonboard.com>
In-Reply-To: <20250629181440.GO24912@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 13:26:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCvSP-NXpefOiKnGf53eUWKVf7iJqtXPEPN9e-Gaxt0k7A@mail.gmail.com>
X-Gm-Features: Ac12FXzX2o2y2l8S2fLY5YNiZDeM3lsThn02nyBQ6azDUzOojOVrPSfT9VAdjyY
Message-ID: <CANiDSCvSP-NXpefOiKnGf53eUWKVf7iJqtXPEPN9e-Gaxt0k7A@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] media: uvcvideo: Add support for V4L2_CID_CAMERA_ROTATION
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

On Sun, 29 Jun 2025 at 20:15, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jun 05, 2025 at 05:53:04PM +0000, Ricardo Ribalda wrote:
> > Fetch the rotation from the fwnode and map it into a control.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c     | 22 +++++++++++++--
> >  drivers/media/usb/uvc/uvc_swentity.c | 55 ++++++++++++++++++++++++++++++++----
> >  drivers/media/usb/uvc/uvcvideo.h     |  5 ++++
> >  3 files changed, 74 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 59be62ae24a4219fa9d7aacf2ae7382c95362178..5788f0c0f6604da06a7bca1b9999d0957817e75e 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -378,11 +378,18 @@ static const struct uvc_control_info uvc_ctrls[] = {
> >       },
> >       {
> >               .entity         = UVC_GUID_SWENTITY,
> > -             .selector       = 0,
> > -             .index          = 0,
> > +             .selector       = UVC_SWENTITY_ORIENTATION,
> > +             .index          = UVC_SWENTITY_ORIENTATION,
> >               .size           = 1,
> >               .flags          = UVC_CTRL_FLAG_GET_CUR,
> >       },
> > +     {
> > +             .entity         = UVC_GUID_SWENTITY,
> > +             .selector       = UVC_SWENTITY_ROTATION,
> > +             .index          = UVC_SWENTITY_ROTATION,
> > +             .size           = 2,
> > +             .flags          = UVC_CTRL_FLAG_GET_RANGE,
> > +     },
> >  };
> >
> >  static const u32 uvc_control_classes[] = {
> > @@ -1025,7 +1032,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> >       {
> >               .id             = V4L2_CID_CAMERA_ORIENTATION,
> >               .entity         = UVC_GUID_SWENTITY,
> > -             .selector       = 0,
> > +             .selector       = UVC_SWENTITY_ORIENTATION,
> >               .size           = 8,
> >               .offset         = 0,
> >               .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > @@ -1033,6 +1040,15 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> >               .menu_mask      = GENMASK(V4L2_CAMERA_ORIENTATION_EXTERNAL,
> >                                         V4L2_CAMERA_ORIENTATION_FRONT),
> >       },
> > +     {
> > +             .id             = V4L2_CID_CAMERA_SENSOR_ROTATION,
> > +             .entity         = UVC_GUID_SWENTITY,
> > +             .selector       = UVC_SWENTITY_ROTATION,
> > +             .size           = 16,
> > +             .offset         = 0,
> > +             .v4l2_type      = V4L2_CTRL_TYPE_INTEGER,
> > +             .data_type      = UVC_CTRL_DATA_TYPE_UNSIGNED,
> > +     },
> >  };
> >
> >  /* ------------------------------------------------------------------------
> > diff --git a/drivers/media/usb/uvc/uvc_swentity.c b/drivers/media/usb/uvc/uvc_swentity.c
> > index 702a2c26e029a0655dade177ed2a9b88d7a4136d..60f3166addbeb7d2e431d107b23034d2d11a1812 100644
> > --- a/drivers/media/usb/uvc/uvc_swentity.c
> > +++ b/drivers/media/usb/uvc/uvc_swentity.c
> > @@ -10,10 +10,11 @@
> >  #include <media/v4l2-fwnode.h>
> >  #include "uvcvideo.h"
> >
> > -static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > -                             u8 cs, void *data, u16 size)
> > +static int uvc_swentity_get_orientation(struct uvc_device *dev,
> > +                                     struct uvc_entity *entity, u8 cs,
> > +                                     void *data, u16 size)
> >  {
> > -     if (size < 1)
> > +     if (cs != UVC_SWENTITY_ORIENTATION || size != 1)
> >               return -EINVAL;
> >
> >       switch (entity->swentity.props.orientation) {
> > @@ -30,6 +31,31 @@ static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entit
> >       return 0;
> >  }
> >
> > +static int uvc_swentity_get_rotation(struct uvc_device *dev,
> > +                                  struct uvc_entity *entity, u8 cs, void *data,
> > +                                  u16 size)
> > +{
> > +     if (cs != UVC_SWENTITY_ROTATION || size != 2)
> > +             return -EINVAL;
> > +
> > +     ((u8 *)data)[0] = entity->swentity.props.rotation;
> > +     ((u8 *)data)[1] = entity->swentity.props.rotation >> 8;
> > +
> > +     return 0;
> > +}
> > +
> > +static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
> > +                             u8 cs, void *data, u16 size)
> > +{
> > +     switch (cs) {
> > +     case UVC_SWENTITY_ORIENTATION:
> > +             return uvc_swentity_get_orientation(dev, entity, cs, data, size);
> > +     case UVC_SWENTITY_ROTATION:
> > +             return uvc_swentity_get_rotation(dev, entity, cs, data, size);
> > +     }
> > +     return -EINVAL;
> > +}
> > +
> >  static int uvc_swentity_get_info(struct uvc_device *dev,
> >                                struct uvc_entity *entity, u8 cs, u8 *caps)
> >  {
> > @@ -37,11 +63,22 @@ static int uvc_swentity_get_info(struct uvc_device *dev,
> >       return 0;
> >  }
> >
> > +static int uvc_swentity_get_res(struct uvc_device *dev, struct uvc_entity *entity,
> > +                             u8 cs, void *res, u16 size)
> > +{
> > +     if (size == 0)
> > +             return -EINVAL;
>
> The get_cur functions return an error if the size doesn't match the
> expected size. I think you can return -EINVAL if size != 1.
>
> > +     ((u8 *)res)[0] = 1;
> > +     memset(res + 1, 0, size - 1);
>
> And drop the memset.
>
> > +     return 0;
> > +}
> > +
> >  int uvc_swentity_init(struct uvc_device *dev)
> >  {
> >       static const u8 uvc_swentity_guid[] = UVC_GUID_SWENTITY;
> >       struct v4l2_fwnode_device_properties props;
> >       struct uvc_entity *unit;
> > +     u8 controls = 0;
> >       int ret;
> >
> >       ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
> > @@ -49,7 +86,11 @@ int uvc_swentity_init(struct uvc_device *dev)
> >               return dev_err_probe(&dev->intf->dev, ret,
> >                                    "Can't parse fwnode\n");
> >
> > -     if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
> > +     if (props.orientation != V4L2_FWNODE_PROPERTY_UNSET)
> > +             controls |= BIT(UVC_SWENTITY_ORIENTATION);
> > +     if (props.rotation != V4L2_FWNODE_PROPERTY_UNSET)
> > +             controls |= BIT(UVC_SWENTITY_ROTATION);
> > +     if (!controls)
> >               return 0;
> >
> >       unit = uvc_alloc_entity(UVC_SWENTITY_UNIT, UVC_SWENTITY_UNIT_ID, 0, 1);
> > @@ -60,9 +101,13 @@ int uvc_swentity_init(struct uvc_device *dev)
> >       unit->swentity.props = props;
> >       unit->swentity.bControlSize = 1;
> >       unit->swentity.bmControls = (u8 *)unit + sizeof(*unit);
> > -     unit->swentity.bmControls[0] = 1;
> > +     unit->swentity.bmControls[0] = controls;
> >       unit->get_cur = uvc_swentity_get_cur;
> >       unit->get_info = uvc_swentity_get_info;
> > +     unit->get_res = uvc_swentity_get_res;
> > +     unit->get_def = uvc_swentity_get_rotation;
> > +     unit->get_min = uvc_swentity_get_rotation;
> > +     unit->get_max = uvc_swentity_get_rotation;
>
> Why do you support GET_DEF, GET_MIN and GET_MAX for rotation only ?

Orientation has enum type. It does not require min or max.

For get_def I could use get_cur, but 0 is as good as any other value
within range.

>
> >       strscpy(unit->name, "SWENTITY", sizeof(unit->name));
> >
> >       list_add_tail(&unit->list, &dev->entities);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index d6da8ed3ad4cf3377df49923e051fe04d83d2e38..7cca0dc75d11f6a13bc4f09676a5a00e80cb38f7 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -45,6 +45,11 @@
> >  #define UVC_SWENTITY_UNIT            0x7ffd
> >  #define UVC_SWENTITY_UNIT_ID         0x101
> >
> > +enum {
> > +     UVC_SWENTITY_ORIENTATION,
> > +     UVC_SWENTITY_ROTATION
> > +};
> > +
> >  /* ------------------------------------------------------------------------
> >   * Driver specific constants.
> >   */
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

