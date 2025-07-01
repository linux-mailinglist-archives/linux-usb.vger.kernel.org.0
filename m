Return-Path: <linux-usb+bounces-25352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E526CAEF656
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 13:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33B554A2166
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 11:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095DE26FDBF;
	Tue,  1 Jul 2025 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g7/XOHKJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ECD1FBCAF
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 11:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368787; cv=none; b=fwhxXQAOnCAEftjxIqbZ518XbXAJnE7jONebklGKcOBlF0WCC3lVej9ZTdRDxO8rHx3nwIZC8zFAR1Koat9HABNhwN4fbbaxiCM+LAkMvVG+mu6nEFU/TDBFlgcmaAj7ebIdXgjcgSihKwvNu1yMGhWqkzv48UNpTyJV+G44+84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368787; c=relaxed/simple;
	bh=FeqVp2yCUZ3ij1peE3WeZz1cWGh+QgySUCT2N/2Xbjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGtUlg2/OkYNaGKlDXV93iihxLgXAqFf5YnYO4L2L0mWciSsPQ6WpiCwx4j5wBznf5EedG08zqpjWFw5STpbpIECxSFaKZunG76iOC97m/8F1v0RqF2m79yzDIKT8JewXdL3JR8LN1kw01SpdTWNU2jgj+wS+AswrIo7RG968vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g7/XOHKJ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso686219266b.2
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751368784; x=1751973584; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bGjQ61S1++mVkf3/jYVKvuXkIa1IOFszhbgMmRDC9tQ=;
        b=g7/XOHKJzG1jTM1qn1sP2Lhkr+duDH/4QnopMxSu1qaGeYZSCCK+IWhJ3JXE21fCeW
         F4gBAHQk+utAGXfTcA0Fr+K5d9ziktlAneyiW5+Ev+uYGf3pSJfZrut2RFuEY6uD7uan
         NnN0KPvZSF0GrtNy0vSrH0m6YBpD2FlRktq44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368784; x=1751973584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGjQ61S1++mVkf3/jYVKvuXkIa1IOFszhbgMmRDC9tQ=;
        b=aNQJagzu8sUFKZr64ckG8HIZIvvD2O4hv8nlfqIq3FBZJFkxtTL6foe+FIMCCHyAIu
         uvK0OSCtblehEtUaf0Wcoysavleg12R7bxU0wIuuM2MhYMuES2IX0yX8EMzsK2wv7xRx
         A1G5elAomjDZWX+a0ndm6gwgJSst70uERrF/vPDlBLIO5+4Ngl13u+Ia7Oc9WD1gYb5C
         huY//uy4h3Nd78EQrMAGjxwnek1zfB+rxOKM+yeXMaAjbKQvhQAorTv+SuM4IAPTYHro
         sIi4eNmL2BtkZ6bfkbzpjWGDIHFqPh9BBZHJf3C2Sx6jLm5n2UKQZIL60Qyssub/ATZT
         2mFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRigz8CQvU/3mSy5h/WepE6UrHTKD0VoCVarO9jhqEE8/bYOGW6MyySa8hpycPPKGS68LwPA1Inec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Fuskv+z8OQBtqZ8H2q1G/4auq4IP2hHY7VMkVXJzP919LTsm
	lLmifr1eZbqJTUKLrFULGQ/pgLDToLCva2qIEIut6UcJOOJWDuHbcHnKDAm+V4jvPjHCx8SMn7K
	Df1PoXA==
X-Gm-Gg: ASbGncv2dzCMd1IqwhzdIM6T+LkU0tTix+lvBXqzEZVF/dJvUpZ45IcuHnmN0i2vxv+
	tcaUQWAMaAi2dGJpoUJMwqPRb3N7hsRRCqYicGMgkqTyjX6NPtBfvQakxEEzz5EMwl6y3WsSY5i
	ppUy2ZT8IlvUCH0NrqI5AaMny0JsEf9Ujzvk+hOUqwgCy5ebHhyDN1Km38Bg28OOBPcWsZQsEqR
	gIIDNsiLh9imUFFX5sN4p5qVVWpYt5dSEUIyur8CixGVF7I/9iyS4EzVhrhz/3vzN7pua5Ul78C
	XD1Krk454zglT7oh9KGfPdL2NHsddIAAmC2xB1LUXOmXzhm8SIvuEiRNZBfuKEPqGoq9KKX+/gC
	gzc7mTIW1vu9cSqXxtx1d0sez
X-Google-Smtp-Source: AGHT+IGAhLrR+CXj8rpiWc0S5B8HDt0NUwfY6n6onp0+ymVKRuY2R9wHjf1ER5OcRxd94N474csqjg==
X-Received: by 2002:a17:907:7251:b0:ae3:b94b:36f5 with SMTP id a640c23a62f3a-ae3b94b3b3dmr27221766b.34.1751368783748;
        Tue, 01 Jul 2025 04:19:43 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a95esm858726766b.59.2025.07.01.04.19.43
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:19:43 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade5b8aab41so651019966b.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 04:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyzqsqOCQFvTYJ4EE3cKhAhpbgHMAWliephPEdAPVtqcDvxidvPkJA1fsPe6ZhJTg4QI4AfXBoUK0=@vger.kernel.org
X-Received: by 2002:a05:6512:224b:b0:553:cf38:5ea1 with SMTP id
 2adb3069b0e04-5550b87b62cmr5806214e87.15.1751368403239; Tue, 01 Jul 2025
 04:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-10-5710f9d030aa@chromium.org> <20250629181246.GE6260@pendragon.ideasonboard.com>
In-Reply-To: <20250629181246.GE6260@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 13:13:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCsu0RT4dcGyBJRutP=9HTe+niUoohxTZE=qJ8O_9ez=+A@mail.gmail.com>
X-Gm-Features: Ac12FXyUB7J2CzeHXupatytT-Rncr6S6tZS3kWRK4b67_iOG9R3ef-6_Er_0YxQ
Message-ID: <CANiDSCsu0RT4dcGyBJRutP=9HTe+niUoohxTZE=qJ8O_9ez=+A@mail.gmail.com>
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

On Sun, 29 Jun 2025 at 20:13, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Jun 05, 2025 at 05:53:03PM +0000, Ricardo Ribalda wrote:
> > Virtual entities need to provide more values than get_cur and get_cur
>
> I think you meant "get_info and get_cur".
>
> > for their controls. Add support for get_def, get_min, get_max and
> > get_res.
>
> Do they ? The UVC specification defines controls that don't list
> GET_DEF, GET_MIN, GET_MAX and GET_RES as mandatory requests. Can't we do
> the same for the software controls ? This patch is meant to support the
> UVC_SWENTITY_ORIENTATION and UVC_SWENTITY_ROTATION control in the next
> patch, and those are read-only controls. Aren't GET_INFO and GET_CUR
> enough ?

V4L2_CID_CAMERA_ROTATION has the type UVC_CTRL_DATA_TYPE_UNSIGNED,
that time requires get_min and get_max.
We can create a new type UVC_CTRL_DATA_TYPE_UNSIGNED_READ_ONLY that
fakes min, max and res, but I think that it is cleaner this approach.

>
> >
> > This is a preparation patch.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h |  8 ++++++++
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 21ec7b978bc7aca21db7cb8fd5d135d876f3330c..59be62ae24a4219fa9d7aacf2ae7382c95362178 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -596,6 +596,18 @@ static int uvc_ctrl_query_entity(struct uvc_device *dev,
> >       if (query == UVC_GET_CUR && ctrl->entity->get_cur)
> >               return ctrl->entity->get_cur(dev, ctrl->entity,
> >                                            ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_DEF && ctrl->entity->get_def)
> > +             return ctrl->entity->get_def(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_MIN && ctrl->entity->get_min)
> > +             return ctrl->entity->get_min(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_MAX && ctrl->entity->get_max)
> > +             return ctrl->entity->get_max(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> > +     if (query == UVC_GET_RES && ctrl->entity->get_res)
> > +             return ctrl->entity->get_res(dev, ctrl->entity,
> > +                                          ctrl->info.selector, data, len);
> >       if (query == UVC_GET_INFO && ctrl->entity->get_info)
> >               return ctrl->entity->get_info(dev, ctrl->entity,
> >                                             ctrl->info.selector, data);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index a931750bdea25b9062dcc7644bf5f2ed89c1cb4c..d6da8ed3ad4cf3377df49923e051fe04d83d2e38 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -261,6 +261,14 @@ struct uvc_entity {
> >                       u8 cs, u8 *caps);
> >       int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
> >                      u8 cs, void *data, u16 size);
> > +     int (*get_def)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> > +     int (*get_min)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> > +     int (*get_max)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> > +     int (*get_res)(struct uvc_device *dev, struct uvc_entity *entity,
> > +                    u8 cs, void *data, u16 size);
> >
> >       unsigned int ncontrols;
> >       struct uvc_control *controls;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

