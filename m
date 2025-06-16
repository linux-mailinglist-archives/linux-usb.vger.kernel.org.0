Return-Path: <linux-usb+bounces-24811-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62129ADBBA5
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 23:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C53E3B4693
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 21:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3B0214A6A;
	Mon, 16 Jun 2025 21:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PNOY+2+5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5158E1E89C
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107771; cv=none; b=kPCUMHShlQ2yafeR0Qux2+f8bMLbZVZIO0ssm2ja9HDvctVFs0a5hVND6H1G8Ek5pQ9bIU4SwuuwjSVQBdafsirL5rBKjDkReqw2cHwOT6Z+261jE8ikqp5VZ3C4VFg9gFr1EppKq2K6TuBS6wGdW5ejlTDwvnQDzr/TShB8rns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107771; c=relaxed/simple;
	bh=VUGbQSlpv2U8R1jdbUJn51uIyoYhGn8dY810LqSWYtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZQmLHzjWfAU6tqlpUCzIJaQjp3zwp3WGx2uR/biWpBmBs2aUEV1Z1dnW2wK0oJmqBlV2Dgr4IyNEthpgfVe67vNri9TdtsVwLx1e2A7dd9OX3NGEgRJi1kSxK2sbNoXaXze5cTKcmBSzXtF8542UZEknAANv1Hj9s1tnacF0gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PNOY+2+5; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5534edc6493so5439590e87.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 14:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750107767; x=1750712567; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9tJfw+k7xufHIN5ReiQx5xacfGPuiC+xpWuZiEqJRlI=;
        b=PNOY+2+5Wn9izafm48GcTNVhXt/m3KEOmw1BFJLTAkm6ONy8DzUW4CtFfzvuI/Aueh
         /P91xhECBlrVtPaU++UyBqsEp4xCqQrWxiGbnE5BPagEAha1E881+/TMD0Nv6FJ8Q5cq
         SY3npzuKWGE8JEQOqPGcGMm4GpyoE1hC9fU60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107767; x=1750712567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tJfw+k7xufHIN5ReiQx5xacfGPuiC+xpWuZiEqJRlI=;
        b=Lw4P7T0zCN1dZYWQMepea0W4RMrE661ZE3hllw4XIsQnP33nkjhMJssqRLiYhkNqNF
         SxHyYHdXRMzmOuzWj87X14caeo918lM0c2Tj9El+gOoTJsOch+tJzQNTOyUEVwpbDUzc
         84R1ljM6IZoI1E/FkYl+NXXY55xElkZseVDwbpXABhxkDtzzXjnhmD+LREVEgz6LUihO
         q0olQIR4LNI6OdPYuDpwGGhxoKD22ykd7oc/grIewwGPvsRbO7FyiSp9lnDP0rMtuB39
         lsjbzUxWrecUl0xX8js6D6artGXDD832/0CQJNmmY+dtVD9jAQmK9yCbk8oVoL9Vt4aF
         3XTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8PO1wXdsyCV3I/0+EXtWrCfEuV2Db3cbHA90xbqao5ra2iVICmMB3MLKuAZDcX3lcgngh8RmR44I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXoZcrurQ9zjYABhZMUVVb/vtx4cDh53NksOpRF0jznNZJ3h8C
	uHvwFaUp3AgD0s04RsUiyRQlANpbP+bgDptqDXrp/Wd9IIdOqK1psQI5ezlq3sReH4LIbpANZpv
	8YxA=
X-Gm-Gg: ASbGncuxEiK7VJpd5sbZL5A4wVswSVksAnI0cGBfTNDpvrMupD+Glx3Y+4/MYhvFcYl
	SGoXDarLoTeUGY5/yv2+Kp+jiriXFtInFQAnDe9jnZi94CEwIynUXJST1q80sethf95t5hIYHtM
	6L2lexzPI1vZQ77CNnIkN3zOvHxAJGiLKOaqVo099/pntZEHFtPhbxnf8WvmdeqdzrmuLe4bxAr
	dV/HtiqyU+OlCdtkEnKnr0AGs3AycpmXrikYUQZOK/7sjn6Yp7H9/e3XmX5WJMvMyLnXkkbllEj
	zimbECVUQui5oIuCItUxE3b/DT05KdjJ1+1cV9sXndrNQovOcuBFsL/kZoExMcq7+YoABBJPW11
	V6PW8qeKGF37WMaLcA/D2NV2l
X-Google-Smtp-Source: AGHT+IEC38px5b3hDytOjdonTrwhaljXuAg0SrEq2LzAfzL1DeN3cErKdBg7g+YD91GgJhppm5pvnQ==
X-Received: by 2002:a05:6512:3d89:b0:553:349c:646c with SMTP id 2adb3069b0e04-553b6f21061mr2688328e87.27.1750107767176;
        Mon, 16 Jun 2025 14:02:47 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11680fsm1641847e87.5.2025.06.16.14.02.46
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 14:02:46 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so1962932e87.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 14:02:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKIifAJd2wwpQNl/ZzRpGh4V0yMCFCwT1x3xJLpd9ONtxWHB+9bAxSbOeZRlCG2E6ONAc6w2SRSgo=@vger.kernel.org
X-Received: by 2002:a05:6512:138c:b0:553:66b3:c385 with SMTP id
 2adb3069b0e04-553b6ee3e9cmr2720265e87.24.1750107765537; Mon, 16 Jun 2025
 14:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
 <20250604-uvc-meta-v6-4-7141d48c322c@chromium.org> <d1e5942b-f8e5-42c6-98ae-d346927df3cb@kernel.org>
 <CANiDSCtXmXYkv3b_62iegTFOxBVrGUv9+mbioxvQvPsadwBpqg@mail.gmail.com> <ec722aa6-17d4-4264-b99f-bdae1d908713@kernel.org>
In-Reply-To: <ec722aa6-17d4-4264-b99f-bdae1d908713@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 23:02:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCu1b2n9c7WH2ZHysOY2xV1RbV9Z6AHBuXXfF8fV8OwYgg@mail.gmail.com>
X-Gm-Features: AX0GCFsNdtkP8JB6ltTsdc-cqZ6Op2oMgeY2ihm_dh0JlNkr6ExVMQMQ5z0q73M
Message-ID: <CANiDSCu1b2n9c7WH2ZHysOY2xV1RbV9Z6AHBuXXfF8fV8OwYgg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 16 Jun 2025 at 22:47, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 16-Jun-25 5:04 PM, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > On Mon, 16 Jun 2025 at 16:38, Hans de Goede <hansg@kernel.org> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> On 4-Jun-25 14:16, Ricardo Ribalda wrote:
> >>> If the camera supports the MSXU_CONTROL_METADATA control, auto set the
> >>> MSXU_META quirk.
> >>>
> >>> Reviewed-by: Hans de Goede <hansg@kernel.org>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  drivers/media/usb/uvc/uvc_metadata.c | 72 ++++++++++++++++++++++++++++++++++++
> >>>  include/linux/usb/uvc.h              |  3 ++
> >>>  2 files changed, 75 insertions(+)
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> >>> index df3f259271c675feb590c4534dad95b3b786f082..cd58427578ff413591b60abe0a210b90802dddc7 100644
> >>> --- a/drivers/media/usb/uvc/uvc_metadata.c
> >>> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> >>> @@ -10,6 +10,7 @@
> >>>  #include <linux/list.h>
> >>>  #include <linux/module.h>
> >>>  #include <linux/usb.h>
> >>> +#include <linux/usb/uvc.h>
> >>>  #include <linux/videodev2.h>
> >>>
> >>>  #include <media/v4l2-ioctl.h>
> >>> @@ -188,11 +189,82 @@ static const struct v4l2_file_operations uvc_meta_fops = {
> >>>       .mmap = vb2_fop_mmap,
> >>>  };
> >>>
> >>> +static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
> >>> +
> >>> +static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
> >>> +{
> >>> +     struct uvc_entity *entity;
> >>> +
> >>> +     list_for_each_entry(entity, &dev->entities, list) {
> >>> +             if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
> >>> +                     return entity;
> >>> +     }
> >>> +
> >>> +     return NULL;
> >>> +}
> >>> +
> >>> +#define MSXU_CONTROL_METADATA 0x9
> >>> +static int uvc_meta_detect_msxu(struct uvc_device *dev)
> >>> +{
> >>> +     u32 *data __free(kfree) = NULL;
> >>> +     struct uvc_entity *entity;
> >>> +     int ret;
> >>> +
> >>> +     entity = uvc_meta_find_msxu(dev);
> >>> +     if (!entity)
> >>> +             return 0;
> >>> +
> >>> +     /*
> >>> +      * USB requires buffers aligned in a special way, simplest way is to
> >>> +      * make sure that query_ctrl will work is to kmalloc() them.
> >>> +      */
> >>> +     data = kmalloc(sizeof(*data), GFP_KERNEL);
> >>> +     if (!data)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     /* Check if the metadata is already enabled. */
> >>> +     ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
> >>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> >>> +     if (ret)
> >>> +             return 0;
> >>> +
> >>> +     if (*data) {
> >>> +             dev->quirks |= UVC_QUIRK_MSXU_META;
> >>> +             return 0;
> >>> +     }
> >>> +
> >>> +     /*
> >>> +      * We have seen devices that require 1 to enable the metadata, others
> >>> +      * requiring a value != 1 and others requiring a value >1. Luckily for
> >>> +      * us, the value from GET_MAX seems to work all the time.
> >>> +      */
> >>> +     ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
> >>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> >>> +     if (ret || !*data)
> >>> +             return 0;
> >>> +
> >>> +     /*
> >>> +      * If we can set MSXU_CONTROL_METADATA, the device will report
> >>> +      * metadata.
> >>> +      */
> >>> +     ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> >>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> >>> +     if (!ret)
> >>> +             dev->quirks |= UVC_QUIRK_MSXU_META;
> >>
> >> Since we set the ctrl to enable MSXU fmt metadata here, this means that
> >> cameras which also support V4L2_META_FMT_D4XX will be switched to MSXU
> >> metadata mode at probe() time.
> >
> > Not sure that I completely follow you. D4XX cameras will not be
> > switched to MSXU, they will support MSXU and D4XX with the current
> > patchset.
>
> Is MSXU an extension on top of D4XX ? If not then we need to tell
> the camera which metadata we want in uvc_meta_v4l2_set_format()

I think I know where the miss-comunication happened :)

MSXU is indeed a superset of D4xx. D4xx metadata is formatted in MSXU.

If an app fetches D4XX and MSXU from an Intel D4xx device, they are identical.

Or in other words, if D4XX devices have MSXU_CONTROL_METADATA, they
are probably today initialized with a value != 0.


Thanks!
>
> Currently your patch 4/4 does:
>
> +       ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> +                            MSXU_CONTROL_METADATA, data, sizeof(*data));
>
> in uvc_meta_detect_msxu() which runs at probe time.
>
> So patch 4/4 breaks V4L2_META_FMT_D4XX support as it switched the
> camera to MSXU metadata mode (I'm assuming the 2 metadata formats
> are different and that MSXU metadata is not just a superset of D4xx).
>
> This is why I suggest supporting only one metadata format. If we
> want to support both on cameras which support both and can switch
> formats with the msxu control, then this patch needs to modify
> uvc_meta_v4l2_set_format() to do something like this:
>
> +       ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> +                            MSXU_CONTROL_METADATA, data, sizeof(*data));
>
> When switching formats, that or only support 1 metadata fmt.
>
> I hope this explains my thinking here, if not keep asking questions ...
>
> Regards,
>
> Hans
>
>
>
>
> >
> >>
> >> So even if cameras exist which support both metadata formats, since we
> >> switch to MSXU at probe() time, disabling V4L2_META_FMT_D4XX support,
> >> the uvcvideo driver will only support 1 metadata fmt per camera.
> >> Which is fine supporting more then 1 metadata fmt is not worth
> >> the trouble IMHO.
> >
> > If we only support one metadata, we have two options for D4XX cameras:
> >
> > A) Switch to MSXU: apps that expect D4XX will not work. I think this
> > will mean breaking uAPI.
> > B) Keep D4XX and ignore MSXU: apps that work with MSXU will not work
> > with D4XX cameras. I do not love this but it will not affect my
> > usecase.
> >
> >
> > If you are ok with B) I can start the implementation. But I still
> > believe that the current option is more generic and the extra
> > complexity is not too excessive.
> >
> >
> >>
> >> This means that Laurent's remark on [PATCH v5 4/4]:
> >>
> >> "I would prefer if you could instead add a metadata format field in the
> >> uvc_device structure (I'd put it right after the info field, and while
> >> at it you could move the quirks field to that section too). The metadata
> >> format would be initialized from dev->info (when available) or set to
> >> the UVC format, and overridden when the MSXU is detected."
> >>
> >> is still relevant, which will also make patch 3/4 cleaner.
> >>
> >> The idea is to (in patch 3/4):
> >>
> >> 1. Introduce a dev->meta_format which gets initialized from dev->info->meta_format
> >> 2. Keep the quirk and if the quirk is set override dev->meta_format to
> >>    V4L2_META_FMT_UVC_MSXU_1_5 thus still allowing testing for MSXU metadata on
> >>    cameras which lack the MSXU_CONTROL_METADATA control.
> >>
> >> Doing things this way avoids the need for the complexity added to
> >> uvc_meta_v4l2_try_format() / uvc_meta_v4l2_set_format() /
> >> uvc_meta_v4l2_enum_format(). Instead the only changes necessary there now will
> >> be replacing dev->info->meta_format with dev->meta_format.
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>
> >>
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>>  int uvc_meta_register(struct uvc_streaming *stream)
> >>>  {
> >>>       struct uvc_device *dev = stream->dev;
> >>>       struct video_device *vdev = &stream->meta.vdev;
> >>>       struct uvc_video_queue *queue = &stream->meta.queue;
> >>> +     int ret;
> >>> +
> >>> +     ret = uvc_meta_detect_msxu(dev);
> >>> +     if (ret)
> >>> +             return ret;
> >>>
> >>>       stream->meta.format = V4L2_META_FMT_UVC;
> >>>
> >>> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> >>> index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
> >>> --- a/include/linux/usb/uvc.h
> >>> +++ b/include/linux/usb/uvc.h
> >>> @@ -29,6 +29,9 @@
> >>>  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> >>>       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >>>        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> >>> +#define UVC_GUID_MSXU_1_5 \
> >>> +     {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> >>> +      0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> >>>
> >>>  #define UVC_GUID_FORMAT_MJPEG \
> >>>       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> >>>
> >>
> >
> >
>


--
Ricardo Ribalda

