Return-Path: <linux-usb+bounces-25748-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F59EB03842
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 09:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9189816F4B1
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 07:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBF82356B9;
	Mon, 14 Jul 2025 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ihxA/nC9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507EE1D6DB6
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479223; cv=none; b=nBWmE9hzVNqDtzy8PHK2tkJsLQyzQYd1AeqCmQ9Uuf0xKjqvPZ4/3p/NfSC7zUIhez1iuALh7je0v2dVdC+QhIZnKXtIsovC7Y2HEPakyKg3P7/Di8boUfGqRyN/Ll8J73XYrzooULBEPslicSCwehYJZU69+fTZ/1FN6ZXiR+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479223; c=relaxed/simple;
	bh=7elxMeEXvp1wM2XutufFBptshq5583mChiL6IFD3cdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWZvpYw/5vJ2h9fFDvcaD0DnmsCb4zQqxyQGDlXrLapr9wwl1wI26P6ZBG8qwxgu25dVwz6uU3oL0T8CcHbDflj8/elTrkZ2fwJq4R3RO7a8iTPjzvW45vzibmQLDXS4Q0S4wx/626KjRJzna2Ww4LYWdI++YHz/OIFea4peuCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ihxA/nC9; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso4262358e87.2
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752479219; x=1753084019; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pSf9aMoYQyLirUqC8HpaRTr+wUf/smTXCC/AwdguD5c=;
        b=ihxA/nC9kfbv6LWGvD0YIHYEgbpWQvqVsXEXXn7cvtOw+hsav42OeeHeZI6cKp3iv9
         h3RgEKY4Q7FDGBnExMl/qgF+t4/TrIJU+PfXYri3g+hPrmskoI8/0Sn50hZK3gSyhuq+
         bDAADlc+tRJNdIotRWS4vvGFWPLyH5kwiQBLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752479219; x=1753084019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSf9aMoYQyLirUqC8HpaRTr+wUf/smTXCC/AwdguD5c=;
        b=ijnP00+8hStgrHETueOMZGxWS/RPaYlMVCY6lqpFSryDHJfWuB4q127X+wKQp/pyyM
         l+tDduX9Jwx6orMfUEHbSxieafG/IVTYT6oNj14BlkJpt8EJN/nauFTH010X8H7lCRqz
         hlftT3SV7tb/6x5+e3j141/2tP84/fvWCjGqrqD+xnSjiQYUmrOVQmUXbqN0zCMh2Hz7
         uMjoOHGB65nTJQqGa2rFS6HT6oo8QAw6HdvTT0xaHuFj661G6LgYZK2pEBKi+HDISSw3
         hGrhdC8CnDqAb5s8skIqXIJHGx+OI15gZeQWTdqZGdouGaxA7+4hTiIdz+syY+CAvbzp
         GwSA==
X-Forwarded-Encrypted: i=1; AJvYcCV16WrzVcjSDirqQb+QW4dx1Z6sxeykXm5Tl6tr/Kf67ZM2+dXZNaVIO2tYomjwjIW3mRLB9Uk/Sns=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLUiO3qkf6rulO/wkC4Ep3cLZRALd192mlgvT4DUnIE8JnYEgj
	c28Umw1c5n9B8RhzXh6aBeIgyBhMl8pkp19hobl5ryQbpAXs1wA3J0Zu851ur9p5nU9YQQ8WtXN
	5oqk=
X-Gm-Gg: ASbGnctuUPHQ0+oGeTb0fGfoh/VTO9NrPuXzMhtIQKq+Ktsyb36ENvCRTz0+gefd9Du
	e/SJlgak9yKrIT9Yj0rFtfFe6sLYUSfTlLRY8B6RcCznArNIdvzkFMGXYjsIj0qTqCdcfq8D12d
	loTifmPBzecFruuy+KY1c+VNqkH078PcsabX1uWSkaqQkm+rsSSs/nLH7Q7INxW+aq+2Y9Xrmx/
	SvMqLDt9azmpLQX6qVZeiqxYNk0dnnuXSRXo1thT0TGeYS/uDMVx3wG9y4y/yOc87uWjwMoBZqh
	tVxw8NZjaXNIdyFOhn16nnm72jaojHTYv+ttox56Xo8uGQpQraYG+1thBptngLBJIKolXiutqsE
	mZnBUD+VbR0oJvI813Cfq/CUhpspnS3VMRg3GIrjslrP/zAzo+8XSiiZDtCol
X-Google-Smtp-Source: AGHT+IG8bxholMo7qxP+erklqFuFn5SNx9c6HvlMo1Q/VGexMghqIC2NUO0RxJPTEJyZYxutJx2zbw==
X-Received: by 2002:a05:6512:e86:b0:553:33d5:8463 with SMTP id 2adb3069b0e04-55a045fd76cmr3769642e87.24.1752479219159;
        Mon, 14 Jul 2025 00:46:59 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6bb33sm1852324e87.174.2025.07.14.00.46.58
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 00:46:58 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b16a0e38so4231803e87.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 00:46:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDyXUhpf4V+Sf+XkfRNziIwau3UGvuQ3UMEQdQTragFVaOU31lKLsNWyTUq/PHuRUsVG2+uhM98To=@vger.kernel.org
X-Received: by 2002:a05:6512:3094:b0:553:6570:1999 with SMTP id
 2adb3069b0e04-55a044e372bmr2619792e87.13.1752479218064; Mon, 14 Jul 2025
 00:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
 <20250707-uvc-meta-v8-5-ed17f8b1218b@chromium.org> <20250711195815.GH27674@pendragon.ideasonboard.com>
In-Reply-To: <20250711195815.GH27674@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 09:46:45 +0200
X-Gmail-Original-Message-ID: <CANiDSCsWE-5smL-H7CD_mi6AhJL2LAwf07bFpxJyN+0CnsLPfQ@mail.gmail.com>
X-Gm-Features: Ac12FXwqC1VN5_k1_HzlZaqYI-D_PHxB5Qi8X976aLSdl3Pe4ujQoB6CY0yAqTo
Message-ID: <CANiDSCsWE-5smL-H7CD_mi6AhJL2LAwf07bFpxJyN+0CnsLPfQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 11 Jul 2025 at 21:58, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jul 07, 2025 at 06:34:05PM +0000, Ricardo Ribalda wrote:
> > If the camera supports the MSXU_CONTROL_METADATA control, auto set the
> > MSXU_META quirk.
> >
> > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c   |  7 +++-
> >  drivers/media/usb/uvc/uvc_metadata.c | 75 +++++++++++++++++++++++++++++++++++-
> >  drivers/media/usb/uvc/uvcvideo.h     |  2 +-
> >  include/linux/usb/uvc.h              |  3 ++
> >  4 files changed, 84 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 56ea20eeb7b9d5d92f3d837c15bdf11d536e9f2d..9de5abb43e19d9e876cddc5d7124592953db89ac 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2315,7 +2315,12 @@ static int uvc_probe(struct usb_interface *intf,
> >               goto error;
> >       }
> >
> > -     uvc_meta_init(dev);
> > +     ret = uvc_meta_init(dev);
> > +     if (ret < 0) {
> > +             dev_err(&dev->udev->dev,
> > +                     "Error initializing the metadata formats (%d)\n", ret);
> > +             goto error;
> > +     }
> >
> >       if (dev->quirks & UVC_QUIRK_NO_RESET_RESUME)
> >               udev->quirks &= ~USB_QUIRK_RESET_RESUME;
> > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > index 77e03273d3cf6b00cac6ebb9b29b941f1cbfd9f7..59bb133baf9a73ef6a30fa8ead85aa90653d60f4 100644
> > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/list.h>
> >  #include <linux/module.h>
> >  #include <linux/usb.h>
> > +#include <linux/usb/uvc.h>
> >  #include <linux/videodev2.h>
> >
> >  #include <media/v4l2-ioctl.h>
> > @@ -166,6 +167,71 @@ static const struct v4l2_file_operations uvc_meta_fops = {
> >       .mmap = vb2_fop_mmap,
> >  };
> >
> > +static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
> > +{
> > +     static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
> > +     struct uvc_entity *entity;
> > +
> > +     list_for_each_entry(entity, &dev->entities, list) {
> > +             if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
> > +                     return entity;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +#define MSXU_CONTROL_METADATA 0x9
> > +static int uvc_meta_detect_msxu(struct uvc_device *dev)
> > +{
> > +     u32 *data __free(kfree) = NULL;
> > +     struct uvc_entity *entity;
> > +     int ret;
> > +
> > +     entity = uvc_meta_find_msxu(dev);
> > +     if (!entity)
> > +             return 0;
> > +
> > +     /*
> > +      * USB requires buffers aligned in a special way, simplest way is to
> > +      * make sure that query_ctrl will work is to kmalloc() them.
> > +      */
> > +     data = kmalloc(sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     /* Check if the metadata is already enabled. */
> > +     ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
> > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > +     if (ret)
> > +             return 0;
> > +
> > +     if (*data) {
> > +             dev->quirks |= UVC_QUIRK_MSXU_META;
> > +             return 0;
> > +     }
> > +
> > +     /*
> > +      * We have seen devices that require 1 to enable the metadata, others
> > +      * requiring a value != 1 and others requiring a value >1. Luckily for
>
> I'm confused here. If those are three different behaviours, then value
> != 1 would be value == 0 (as the third behaviour is value > 1). You test
> for !*data below, so 0 is not accepted as a valid value for this
> purpose. What am I missing ?

There is a typo in the comment.

Some devices require 1, some devices any value !=0, and other value=MAX.
I will fix it in a follow-up patch.


>
> > +      * us, the value from GET_MAX seems to work all the time.
> > +      */
> > +     ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
> > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > +     if (ret || !*data)
> > +             return 0;
> > +
> > +     /*
> > +      * If we can set MSXU_CONTROL_METADATA, the device will report
> > +      * metadata.
> > +      */
> > +     ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> > +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
> > +     if (!ret)
> > +             dev->quirks |= UVC_QUIRK_MSXU_META;
> > +
> > +     return 0;
> > +}
> > +
> >  int uvc_meta_register(struct uvc_streaming *stream)
> >  {
> >       struct uvc_device *dev = stream->dev;
> > @@ -185,9 +251,14 @@ int uvc_meta_register(struct uvc_streaming *stream)
> >                                        &uvc_meta_fops, &uvc_meta_ioctl_ops);
> >  }
> >
> > -void uvc_meta_init(struct uvc_device *dev)
> > +int uvc_meta_init(struct uvc_device *dev)
> >  {
> >       unsigned int i = 0;
> > +     int ret;
> > +
> > +     ret = uvc_meta_detect_msxu(dev);
> > +     if (ret)
> > +             return ret;
> >
> >       dev->meta_formats[i++] = V4L2_META_FMT_UVC;
> >
> > @@ -201,4 +272,6 @@ void uvc_meta_init(struct uvc_device *dev)
> >
> >        /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
> >       dev->meta_formats[i++] = 0;
> > +
> > +     return 0;
> >  }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 616adc417c62a58686beccbc440a5dfac0a2d588..a4c064c5e046f2a4adba742c8777a10619569606 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -757,7 +757,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >  void uvc_video_clock_update(struct uvc_streaming *stream,
> >                           struct vb2_v4l2_buffer *vbuf,
> >                           struct uvc_buffer *buf);
> > -void uvc_meta_init(struct uvc_device *dev);
> > +int uvc_meta_init(struct uvc_device *dev);
> >  int uvc_meta_register(struct uvc_streaming *stream);
> >
> >  int uvc_register_video_device(struct uvc_device *dev,
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -29,6 +29,9 @@
> >  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > +#define UVC_GUID_MSXU_1_5 \
> > +     {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> > +      0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> >
> >  #define UVC_GUID_FORMAT_MJPEG \
> >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

