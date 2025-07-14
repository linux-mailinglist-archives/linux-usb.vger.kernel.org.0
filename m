Return-Path: <linux-usb+bounces-25779-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D8B0450B
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 18:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8105E3BB209
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 16:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6657425F98B;
	Mon, 14 Jul 2025 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WH6gFbaJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2393C25E469
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752509109; cv=none; b=lkIETfrN/+0Antu8C43ail4LzYBMFZmc16t77JyS5FnSl94WXyUMCL0ICFWsQYQhqbMdd/lkMQKM2iS0O0gKYHEMYBsn2HOolR2GFpHS7I8o36Gtk8Pqhc3nNso17QdoX2wBDJmISohE0LB0qyq+nmi3trdqfUXp5YbHCDXKqYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752509109; c=relaxed/simple;
	bh=JxBVcWXOzrC+pQuiz7DoBffwFHlGca0wC939BUa4mlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXwt2jOiJyWImcc5dAsiccWXVHS/8gU697IRB6z6Q7BCAdiyo6jHDfYgwEe8Jc3XGf6OCZpZvyK39QFkXZhgoo6JKRgunkGtObN7ctMxu618XNp753OVWRBBxy0MJdXWH3ce2D9nMP6H7Rc0yNfH+0+wluxDFa6RpkmAm+okolE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WH6gFbaJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553d52cb80dso4085036e87.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 09:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752509105; x=1753113905; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CDahj8/rNyyq5vqGI+SiuXe8oo3E19xokCP/r0ki8Vk=;
        b=WH6gFbaJvIoQTtthRH12ic6ENiZAFohuQZJaV3HJoQ9wh4nR0HxYS7bTzCTZDPiKn0
         REjMwghjboXL4QSmyJc3VgeARbwc81NtelJMkxIkHNQ/hNXEYc3al61oyqCC1uaHLBT/
         Pro5kbJPdS4Ql7S7xWhZs/RlC5Pg3geymgKEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509105; x=1753113905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDahj8/rNyyq5vqGI+SiuXe8oo3E19xokCP/r0ki8Vk=;
        b=NoxdJVFspkob2aHDvysmyptrxJ+NtGl5YU/c3mgZjvRRyew1b6pHdS8kTCY4fCoViN
         6AlqtgvW3i3ZZV7ta7j1DiN2l+0+YG/DS/jphFaWw8aGayUy/iDJR63bh1xctyb53jfW
         ClicE+RTcwD4rrfVAl0S50HUBAYloTD371e13jZCc2Lq71q2dyi8QsAKGcSr+2Q6uwx8
         EHMMgWprScMeKa4NhO3sO21JlbhKeuvbtYCl1MgK1J9E1pMJekrmENO8w1PD+lpN6tNe
         EESspLFCK74C528ZAx96hUcxprMxrP807pLdLjp+em1AkcOKwQUqNpL62b85lGD3g5a8
         mDsg==
X-Forwarded-Encrypted: i=1; AJvYcCWAumYMDli8ET/3iby6jW+tR1WxyYyeB73lAqPqOA9N0tz2NLBwIVCPfc2+siPZnjwWyEgcC/nubMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2MgRIAAitpQbLO3hay1fWrkwfBXxwrx7HlqyISX+0EE9kZ0Gt
	DEsvvIulb5FJcd16pJrWsooDTJBugr4EMp6rQlNV8+3oScDgk1u6B2yGL3IYRK7YA2VOEKERy75
	gP8jApQ==
X-Gm-Gg: ASbGnctW+LGo1+dYr9AFbE8nibOie/n25lEw8rfVCQuU09lpq/8OJD2kAkCyYCew7Lc
	cd6N9XJqIbvySpoUgPvvUKGg1e3AuctHsjoXdxBrbmH4z2Tg7iqxsvMJFzTtuvME8n/dosccYiu
	IbuL7C5ncyGB4iWUX1gncRaub+nCn7etc4sDXzvG0GYynwhZV4kwb8/UtDycMiLQGZz7uaAEMX2
	sceIi8nvWQmulZ3edBLi+vh2EqpYVZSZxD3yPA1XzFxt/aVNzqX2mzY9l50xStWEqH12zVDcNLd
	mttCMKjJ5J7pvGjCN0h2alb2iB4xO6Z7yEVaCHuHhvp7rx8KRmlva4rkeRw+3Zq7UZrsQWtYBJL
	VblQVxforpckkyu5sEEI4KDoMDzD55hngDyRZmQPzLD+aQNZlW5sciybvr7WM
X-Google-Smtp-Source: AGHT+IGa5EaS8LRGuaDI32Bi+mCsWe6pTUcwdwHydS51aELAAA0oM0TNWnLk8z5JXOXIuarIW4Z70A==
X-Received: by 2002:a05:6512:23a3:b0:54f:c1cc:1241 with SMTP id 2adb3069b0e04-55a1c47ac9dmr62923e87.25.1752509104755;
        Mon, 14 Jul 2025 09:05:04 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b7139dsm1986502e87.196.2025.07.14.09.05.03
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 09:05:04 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so6031190e87.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 09:05:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhkbO9bY5VdYsR+u+zdJGXjOALe8h4c+C24Ptmn7PWCe4oDrds3URcsWBA3CkMEzPGioSwDnmgsrw=@vger.kernel.org
X-Received: by 2002:a05:6512:3b9e:b0:553:2884:5fb3 with SMTP id
 2adb3069b0e04-55a1c467663mr45477e87.12.1752509103021; Mon, 14 Jul 2025
 09:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-12-5710f9d030aa@chromium.org>
 <20250629180534.GN24912@pendragon.ideasonboard.com> <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
 <CANiDSCtq0cr1LgFCgvdBtWcE3z1MWZEjc0e1wTH_BYPETC+s4Q@mail.gmail.com> <20250714143617.GK8243@pendragon.ideasonboard.com>
In-Reply-To: <20250714143617.GK8243@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 18:04:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCud66tcaODuVA1TreEQ3k8u4k-6ghzRQedTPFcT3j+9VQ@mail.gmail.com>
X-Gm-Features: Ac12FXxJPvBJAM528bNZN02Nhk1iZCMcKXmyshIGKqYKQPEJihw9v-tpgzFvPcg
Message-ID: <CANiDSCud66tcaODuVA1TreEQ3k8u4k-6ghzRQedTPFcT3j+9VQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] media: uvcvideo: Do not create MC entities for
 virtual entities
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jul 2025 at 16:36, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jul 08, 2025 at 08:28:21AM +0200, Ricardo Ribalda wrote:
> > On Tue, 1 Jul 2025 at 13:20, Ricardo Ribalda wrote:
> > > On Sun, 29 Jun 2025 at 20:06, Laurent Pinchart wrote:
> > > > Hi Ricardo,
> > > >
> > > > Thank you for the patch.
> > > >
> > > > I would use "software entities" and not "virtual entities" in the
> > > > subject line and everywhere else, as those entities are not virtual.
> > > >
> > > > On Thu, Jun 05, 2025 at 05:53:05PM +0000, Ricardo Ribalda wrote:
> > > > > Neither the GPIO nor the SWENTITY entities form part of the device
> > > > > pipeline. We just create them to hold emulated uvc controls.
> > > > >
> > > > > When the device initializes, a warning is thrown by the v4l2 core:
> > > > > uvcvideo 1-1:1.0: Entity type for entity SWENTITY was not initialized!
> > > > >
> > > > > There are no entity function that matches what we are doing here, and
> > > > > it does not make to much sense to create a function for entities that
> > > > > do not really exist.
> > > >
> > > > I don't agree with this. The purpose of reporting entities to userspace
> > > > through the MC API is to let application enumerate what entities a
> > > > device contains. Being able to enumerate software entities seems as
> > > > useful as being able to enumerate hardware entities.
> > >
> > > What function shall we use in this case? Nothing here seems to match a
> > > software entity
> > > https://www.kernel.org/doc/html/latest/userspace-api/media/mediactl/media-types.html
> > >
> > > Any suggestion for name?
> > > Shall we just live with the warning in dmesg?
> >
> >  I just realised that if/when we move to the control framework, the
> > software entity will be gone.... So to avoid introducing a uAPI change
> > that will be reverted later I think that we should keep this patch.
>
> You know my opinion about moving to the control framework, so that's not
> a very compelling argument :-)

Correct me if I am wrong, your opinion is that it will take too much
work, not that it can't be done or that it is a bad idea.

Will send a patch using MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER, but
when/if we use the control framework, please let me drop the swentity.

Thanks!


>
> We could use MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER, as that's the
> function already used by XUs, and the SWENTITY fulfills the same role as
> XUs in some devices.
>
> > > > > Do not create MC entities for them and pretend nothing happened here.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > >  drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
> > > > >  1 file changed, 10 insertions(+)
> > > > >
> > > > > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > > > > index d1a652ef35ec34801bd39a5124b834edf838a79e..2dbeb4ab0c4c8cc763ff2dcd2d836a50f3c6a040 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_entity.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > > > > @@ -72,6 +72,16 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> > > > >  {
> > > > >       int ret;
> > > > >
> > > > > +     /*
> > > > > +      * Do not initialize virtual entities, they do not really exist
> > > > > +      * and are not connected to any other entities.
> > > > > +      */
> > > > > +     switch (UVC_ENTITY_TYPE(entity)) {
> > > > > +     case UVC_EXT_GPIO_UNIT:
> > > > > +     case UVC_SWENTITY_UNIT:
> > > > > +             return 0;
> > > > > +     }
> > > > > +
> > > > >       if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
> > > > >               u32 function;
> > > > >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

