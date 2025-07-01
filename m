Return-Path: <linux-usb+bounces-25353-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E05AEF688
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 13:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6DB43B14FE
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 11:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B052272E56;
	Tue,  1 Jul 2025 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cmSggy6j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5583120B80B
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 11:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369305; cv=none; b=PhKJnYb682uq6jvgHJhr7QkK67NjTyUgzBa6TiwaNTxwWBQSqrcS9XlwJcMWsyfXIqPUFWJXvCC0s9b42PSgupR05549K6flmz5+cPjnnUgslgat1W+h4i1UGiHBZIpxFWVzLVkHlsEzzZ0DeRY/WKLc27Y76CgRC+YwiJbbAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369305; c=relaxed/simple;
	bh=9ksikN0iTD/GCWHlwVzlhstVFQF+DnzhexLRXUKHtb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWypOJNvXnaHtJUS+D2QeCOxLL4yyhlc0KgnrB0FSvdqTq/XuRybwfRclKcC5KKm8VOb+E7nsYPvdRjorECavqQvH5vXCe/Vfvms7uNn9bs6D6LB5mnC7jkK18Aj7xjh/HY9f3QZ4gdd8EPI1yloBeG9hRgP3LM94nNtp1IAw4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cmSggy6j; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so7210966e87.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 04:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751369301; x=1751974101; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZwGCtkc+w6FZ7pTS+qyfMjlhro6+usoRehWf2lDots=;
        b=cmSggy6jM2GLfj+dSkywNxzfzxJby1nXz/L2fIE3uArgA/yukVWyMhPm8qWE3nuK5y
         YbpXZwsNgcwModqT1kZCE3COzmzsQbwtjFqSc3TnxtrgWwvtufAGm8Bl6R6w3WC8uBR+
         MkVBWQSkS/Rq1S74FjOXB94FqtmUpcz36HZso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369301; x=1751974101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZwGCtkc+w6FZ7pTS+qyfMjlhro6+usoRehWf2lDots=;
        b=s/Fvej8KndpWVurq1m/rUlS+Ux60EhXuwXerZlyiDJnv4Wk+vg7BgosaXOKohLcsuy
         kvQVvJZvflAD5qPUhn3kxY89DHGBUDoZd4UAV92Wj+MCiN7CWw1Rs2zr43oBYBnY/NXE
         QF2KsW/KJgFl/K+fgLu5yYH72jUulv8eQM/cpfjOhlmQjEiQaeaRyL52a4ZLcCAIEDs9
         QhFEIZHyOTeqiXp2SbOmZU4+TyZvi08UiyD/mqFs5ce5eNcLAUP0Ak/0f/NKLvjmZfZQ
         DKZdRurSbe3BXjuF0cacygGErI/9UvkTNAjLVjfCvJhq5/Sg5edpJuFcrsBM25kTy90I
         yXxg==
X-Forwarded-Encrypted: i=1; AJvYcCV3XQLP73uPf0cJrnROknOc+QjMGTKZeM1FHYHG0eWYyHnA+6wHzdQZPCsH4L05ScD7Nuiml7/Xxkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OfN5qD85H402G6i1p95yVXuwjlS4mnPtEIWGrYv6ngf8Kgsp
	MW6NzK0jwi3i1+1rgyGkfm7px9BVSsg+q+m9vAL2gMNMXmTkoWS3BP0lgmQEZ4zaVIpA0zBeJ/P
	X0kaHGA==
X-Gm-Gg: ASbGncvHfIK7q7olZdcwendU0nOA8B/Xi2cXA3qmDgz5AyjGejDN859vPCiid+ZXAGn
	F/RPVuI2WyVUidxYOP7YdDASgf0nsu9YgZk4qgcl/G+MeJMqYNVGGs0bAjaabpAyDQ3j/BmXxa5
	GNq7BMCO5mHrr737BTEfl9txKQGL7IEkci+DUOKD+WutXTqrBDiJ1XsLCno+WlRPIR/6uKR6Nuz
	gSfWfw48ROLHdyzrZbG8lqJzchufNx3N5GgGi1upGLXnE19KBI0f4j0cJYKMAmgUAeAAO41Qu1F
	2qDfTsbGw/TBUCrixKRgRloocPiQPNJwaQorP6UUPljcXYUMBFkUneMRmzkGFn3FWRzc+2+P9Cm
	QKgF4UZ0sGi6GQBT15C5zbQjkIAc5
X-Google-Smtp-Source: AGHT+IFR87yYWseuaZyCI7xwmjiV5Ds15kelPN7neCZNhnJUAJ5U3tOTN+3ANbN+O6BTW0p+N5jvpg==
X-Received: by 2002:a05:6512:3996:b0:553:2a16:2503 with SMTP id 2adb3069b0e04-5562351cd2bmr645284e87.22.1751369301259;
        Tue, 01 Jul 2025 04:28:21 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b1ee164sm1792839e87.0.2025.07.01.04.28.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:28:21 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso64590121fa.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 04:28:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgMz5v9xqIF86UssuP56Yfcc/QQogJpa1q28PFKVhyCvm6Syq/sR6Ezez1H0HYmtIrtIm4ot7jaH8=@vger.kernel.org
X-Received: by 2002:a05:6512:3f24:b0:553:2159:8716 with SMTP id
 2adb3069b0e04-556235309fdmr606439e87.26.1751368826374; Tue, 01 Jul 2025
 04:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-12-5710f9d030aa@chromium.org> <20250629180534.GN24912@pendragon.ideasonboard.com>
In-Reply-To: <20250629180534.GN24912@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 13:20:13 +0200
X-Gmail-Original-Message-ID: <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
X-Gm-Features: Ac12FXzZWFSV19mV0XJRYxH4cTBUxCR__A0Z2BgypZ23AIk9o_remHKEgYijnOg
Message-ID: <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] media: uvcvideo: Do not create MC entities for
 virtual entities
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent and Hans


On Sun, 29 Jun 2025 at 20:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> I would use "software entities" and not "virtual entities" in the
> subject line and everywhere else, as those entities are not virtual.
>
> On Thu, Jun 05, 2025 at 05:53:05PM +0000, Ricardo Ribalda wrote:
> > Neither the GPIO nor the SWENTITY entities form part of the device
> > pipeline. We just create them to hold emulated uvc controls.
> >
> > When the device initializes, a warning is thrown by the v4l2 core:
> > uvcvideo 1-1:1.0: Entity type for entity SWENTITY was not initialized!
> >
> > There are no entity function that matches what we are doing here, and
> > it does not make to much sense to create a function for entities that
> > do not really exist.
>
> I don't agree with this. The purpose of reporting entities to userspace
> through the MC API is to let application enumerate what entities a
> device contains. Being able to enumerate software entities seems as
> useful as being able to enumerate hardware entities.

What function shall we use in this case? Nothing here seems to match a
software entity
https://www.kernel.org/doc/html/latest/userspace-api/media/mediactl/media-types.html

Any suggestion for name?
Shall we just live with the warning in dmesg?

>
> > Do not create MC entities for them and pretend nothing happened here.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > index d1a652ef35ec34801bd39a5124b834edf838a79e..2dbeb4ab0c4c8cc763ff2dcd2d836a50f3c6a040 100644
> > --- a/drivers/media/usb/uvc/uvc_entity.c
> > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > @@ -72,6 +72,16 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> >  {
> >       int ret;
> >
> > +     /*
> > +      * Do not initialize virtual entities, they do not really exist
> > +      * and are not connected to any other entities.
> > +      */
> > +     switch (UVC_ENTITY_TYPE(entity)) {
> > +     case UVC_EXT_GPIO_UNIT:
> > +     case UVC_SWENTITY_UNIT:
> > +             return 0;
> > +     }
> > +
> >       if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
> >               u32 function;
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

