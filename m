Return-Path: <linux-usb+bounces-25572-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F0DAFC2B5
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 08:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06D4516DC35
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 06:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A52220F22;
	Tue,  8 Jul 2025 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XMjuwgUB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980591DE8B5
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751956119; cv=none; b=k40D+cf3zrwjdQCqGdUlELIeh8YCn8JuyUbOIaE/6ykq/DMRY4/DJZtj7jWRURFyVC12gjrX4E362HQ+OZdRk49J1zteXvRQUfz0EKo3xa88cJJr+PtZGuelyAY5c/46L0cXGWglThLBQSlAic31KMSCGtAG5cKtReLutA4Izr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751956119; c=relaxed/simple;
	bh=I0rAk6mb7yKobFsz49sdDHTtScf9ylS26QbCpacwhZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/4MLnCVVKGTVfEsJxMukNNgIuMm3vAxfn02g46/Y/03Ef/U0hbjGpY4GiCAYvwNMt66cWaXryuG/QIAhsB2r1BY/OkQ+KWQ0tuiedmzbNZ1maNFClK1UFk8SlEnSSJoyVMeBHmOZKPD2K39mNptuQQruHwsXoJ6fftG9banRNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XMjuwgUB; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso46247131fa.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 23:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751956115; x=1752560915; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=epMO4JAtFgFxLvmQB+DGKVfgOj+pDHGWO9fLU9qAUo4=;
        b=XMjuwgUBQcmhe9QAxCtbjipNmaLNn3s4R6fCSFid261yeTZ9uQ/WFR4SMZbGu+4aQ7
         DIlwmKe0VKYJsbGFX2UUUFGMJGpgNndNR6kJzByGVTI5vYpQSx8QvrQeiA0syns8ua85
         JiM97OwxFoqpkMSL5LermenGFWF7Ncl2ZolRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956115; x=1752560915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epMO4JAtFgFxLvmQB+DGKVfgOj+pDHGWO9fLU9qAUo4=;
        b=HMb7DwdEuelZPMHGFoko/hoBNgKxkXcKvygxoBpXiZJyCNE0xSKS+qmUVRGiKdUVqI
         fGLbVGVQ/XgBbKkMJELfRxbAuBrMi3em4gZzK5asBJl8E8LerAVYx2evEDAq+X8B9snU
         XcoSicOktQwVH594YaikXXexI8s1NjfiIPhk5X4ghLN8PySMGfrQLMWryrgcBC3xenhY
         J0Ze7ubsBrwFoJ7yLP6cIHghyTH1R1hb5brbrUaIRfnb5cC2XzPb3a6b/RBCT+J7Y5w1
         Yx1FEHOloUTcuhwAkJm2JbCDhkKTNvSlBxzudcxBvYcGtD6Ib5EEoDFSLK1kb1LqM4k5
         /G5A==
X-Forwarded-Encrypted: i=1; AJvYcCW2D92P5F4up8s2TUdmeL/Bn1KmDEx5fMzhJw1l4I3fwyo0yqVfkAEoG4kyAjkMnL5rFZ0Pw6NPGsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgeQs8nFl4QVSi0g0pe5Ai6PbmXFCfIqZ7VRGdtirIRvYxRxWB
	LrYe/N71wxnlzCTqJfWYpw4oC9xvocVBYEWzgU40jNW/zG8zjD+WqUOLnoLWoqED6mRwd82vd/4
	+pj0=
X-Gm-Gg: ASbGnctvA/XzexZtKa3L2amXCfdZSg37Tuu1ta8wlPKIY5U4v9ddIw1Dn5mL20y3LQj
	G7tt61yOu0NJTkOuiFvr60Jr/Us1WowJ6TIGp7HR1zrLKmdY5OZsVQu9hmG9V1qjUAP+PlS4SSI
	w6bZm4DUHtc/2G56r5OmQEakkUIyu5kn10m/LNqHaYyQcDj2OKHfvvBKED9PKehf5G82bM49GRV
	jXfHqnO4iIHSZDoYl3wUMNrC4BhoKRq7vWbhH0CvM/nddtUhk/e5Nfoh0+R01qXDwu6uXtzFmyK
	Ysrhgvs2IGoOVgXi/y99OA0zElQizmXGIooUuy7oMyJ6ohIFdiHsO3iOULPJ7gpbWjO3d2qAFxx
	mAf5g93ZVFvrVcsyHaz4nZh4DyxpB
X-Google-Smtp-Source: AGHT+IFsi4u75YsxadlLOsf5gQ3gkk6HHMev2wJ56c4MHRwxTypPewH9ULdfulatKqhVfzgGYtl0UQ==
X-Received: by 2002:a2e:ae18:0:20b0:32b:7123:ec4c with SMTP id 38308e7fff4ca-32f39b61509mr2764761fa.38.1751956115419;
        Mon, 07 Jul 2025 23:28:35 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1afc1da9sm13647201fa.29.2025.07.07.23.28.34
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 23:28:34 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32cd499007aso29649271fa.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 23:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCMirNCOiBpE3AYGbo8zLNy5gDa6iUARw+VzzQGkQkKSi0hIXNANR11XUwZU4y9DVO8UAd88gSC9M=@vger.kernel.org
X-Received: by 2002:a05:651c:3254:20b0:32b:78ce:be8e with SMTP id
 38308e7fff4ca-32f39b48b77mr3774321fa.32.1751956114000; Mon, 07 Jul 2025
 23:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-12-5710f9d030aa@chromium.org>
 <20250629180534.GN24912@pendragon.ideasonboard.com> <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
In-Reply-To: <CANiDSCvcQ9MA+WBMQTpUzSxDLNiKpvaHsb-pDHTuiUQekgXvQA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Jul 2025 08:28:21 +0200
X-Gmail-Original-Message-ID: <CANiDSCtq0cr1LgFCgvdBtWcE3z1MWZEjc0e1wTH_BYPETC+s4Q@mail.gmail.com>
X-Gm-Features: Ac12FXyYQKv3E7HlyxyFaWCzaarpcfNGMVTbadH4TCiFfkv-rgAm8ijV2sCYmI0
Message-ID: <CANiDSCtq0cr1LgFCgvdBtWcE3z1MWZEjc0e1wTH_BYPETC+s4Q@mail.gmail.com>
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

Hi Laurent

On Tue, 1 Jul 2025 at 13:20, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Laurent and Hans
>
>
> On Sun, 29 Jun 2025 at 20:06, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > I would use "software entities" and not "virtual entities" in the
> > subject line and everywhere else, as those entities are not virtual.
> >
> > On Thu, Jun 05, 2025 at 05:53:05PM +0000, Ricardo Ribalda wrote:
> > > Neither the GPIO nor the SWENTITY entities form part of the device
> > > pipeline. We just create them to hold emulated uvc controls.
> > >
> > > When the device initializes, a warning is thrown by the v4l2 core:
> > > uvcvideo 1-1:1.0: Entity type for entity SWENTITY was not initialized!
> > >
> > > There are no entity function that matches what we are doing here, and
> > > it does not make to much sense to create a function for entities that
> > > do not really exist.
> >
> > I don't agree with this. The purpose of reporting entities to userspace
> > through the MC API is to let application enumerate what entities a
> > device contains. Being able to enumerate software entities seems as
> > useful as being able to enumerate hardware entities.
>
> What function shall we use in this case? Nothing here seems to match a
> software entity
> https://www.kernel.org/doc/html/latest/userspace-api/media/mediactl/media-types.html
>
> Any suggestion for name?
> Shall we just live with the warning in dmesg?

 I just realised that if/when we move to the control framework, the
software entity will be gone.... So to avoid introducing a uAPI change
that will be reverted later I think that we should keep this patch.

Regards
>
> >
> > > Do not create MC entities for them and pretend nothing happened here.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > > index d1a652ef35ec34801bd39a5124b834edf838a79e..2dbeb4ab0c4c8cc763ff2dcd2d836a50f3c6a040 100644
> > > --- a/drivers/media/usb/uvc/uvc_entity.c
> > > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > > @@ -72,6 +72,16 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
> > >  {
> > >       int ret;
> > >
> > > +     /*
> > > +      * Do not initialize virtual entities, they do not really exist
> > > +      * and are not connected to any other entities.
> > > +      */
> > > +     switch (UVC_ENTITY_TYPE(entity)) {
> > > +     case UVC_EXT_GPIO_UNIT:
> > > +     case UVC_SWENTITY_UNIT:
> > > +             return 0;
> > > +     }
> > > +
> > >       if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
> > >               u32 function;
> > >
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

