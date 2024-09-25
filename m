Return-Path: <linux-usb+bounces-15468-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB0C98659B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 19:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BAB4282032
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 17:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3773D81AD2;
	Wed, 25 Sep 2024 17:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YLDjk6BW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7316F30E
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 17:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727285401; cv=none; b=W3mQtuUVzV7FR7E2pSO2t+g2FxgkRIowdEHcOMsfiW5ybHb2MPdOz1+Qa5txxLbCGf64uzUforePV1sKx29MhXfzvTVHlONQ9iVKtfepEcUCe4Sfot6Ja4vH7FsaC5O81NpEtpf8iJF8oz/KwvsNMLw60UOUEp1IxFLvwYT3Md8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727285401; c=relaxed/simple;
	bh=S3foybS1q/OA+MvBiFZY5r1m2O/kN5+WeazHlK5he04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BumiL/L61EV2EN798BS1QWqs52pYUhoMNBc1HGuTNrFeeQGTBEj86GbGPdS++FjyBNzpCpx69GM/WgR6PMBf9u0vLMQYZT5arcXLmfDYMUShGLfPXucfQByoc5eibdkxaMe7aIrybS93H4GGgeyPVP5iJsBbsTW+FYxIaWnz+20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YLDjk6BW; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6dbb24ee34dso1201547b3.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727285399; x=1727890199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/V7CxHWV1Tser1qk57X7xlPUJc/6s+EPJGxMPkOcP0=;
        b=YLDjk6BWLGpl11iCrSIqHzhcozlE7aH7Z/7MnD9zndIh1hiYFRiDj6wdJUpXOfci9u
         LwMHfh5Rt6hA4XK1y4v2gQuIm7SZA8USa61q94+gR1uP2xYTqo5LHAfPljlRaAZ6F81h
         k/FO2AFGoj1/OZebNUBAnjJteY9MX/HRorMwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727285399; x=1727890199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/V7CxHWV1Tser1qk57X7xlPUJc/6s+EPJGxMPkOcP0=;
        b=g8OHbYKl2+pKlcbUDnRqISBsVqRiKP3oN5ERHI3sNiErN0kOT9DIQrc9YO0La7Jtco
         C6/uthTmMFzir7CCKPtcNuaqSbTLUhd0dUCNEj8zGJiyUB5jLEc1x9BKFFdeM7r1UWWG
         8MiqkS6ivY6aN6oxi31MvoIscgfkgYJYVcOfV9YtTdg/+bUuntI+hdWTAndGQsmthJRx
         FlQT1TaP/kFZI7e/d4ZzT0R4P1+8cFAdw4susrFVtnUexbwQljATZPDzkBAgxgf0GUcc
         hS1due0pn5I4FBsvJs98BPWFYcX2v01AlX8Nfwdacf5OKF349ps5AFORtf+yeSvM+q6U
         8SJw==
X-Forwarded-Encrypted: i=1; AJvYcCUVBar3dQOXE40iOCa1YbXyPCr1bG1YqwXiDuUmweCHugV5TaSAP0NGEq4+C50kfJ7UOhklQhTbhB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfHzaMxdP9OlWOZPJFH6y+0APOB4Z7pWdNkNb3fh4D2TZUkzIc
	V3Nm7QnJtIbEl0r2gNTQ2jDRakgDoavKsKBLqGTEqR2JywE9u9umd0Yl2ZBmoPYIuZ8Uoikon7Y
	V8ncnnajWsCKf7nszYnYLklEHisVMe8bUlZ1k
X-Google-Smtp-Source: AGHT+IEEJk0hLmkYSqK37kVBafdY8v3m2TYyb4PkKS+wmM4CoQEd1qC9celbMVCKx7Czv9htT4lCXpG6HWI/tNvq/v0=
X-Received: by 2002:a05:690c:660e:b0:6e2:1336:55d8 with SMTP id
 00721157ae682-6e21d6ed513mr37998667b3.10.1727285399187; Wed, 25 Sep 2024
 10:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.3.Ib7a83adb069df1cb0a40dcddff29618bf3255700@changeid> <xzk3yjkf4zew4p3f4jo6an3cnp4qe2vcvdbu6eq4ths5q4aqmp@4d2qfvrdwym5>
In-Reply-To: <xzk3yjkf4zew4p3f4jo6an3cnp4qe2vcvdbu6eq4ths5q4aqmp@4d2qfvrdwym5>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 25 Sep 2024 10:29:45 -0700
Message-ID: <CANFp7mXwOXhkOSCwCME_ZbzvNP20OVZYX5sE-7+WtC5buSxTrw@mail.gmail.com>
Subject: Re: [PATCH 3/8] usb: typec: intel_pmc_mux: Null check before use
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 9:54=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Sep 25, 2024 at 09:25:04AM GMT, Abhishek Pandit-Subedi wrote:
> > Make sure the data pointer in typec_mux_state is not null before
> > accessing it.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>
> Is the a fix for an actual issue or just good-to-have thing? In the
> former case it lacks a description of how the issue can be triggered and
> a Fixes tag.

This fixes a segfault that occurs when the new Thunderbolt driver is
used because it calls `typec_altmode_notify` with null data. I'm not
sure if that needs a `Fixes` since what's currently running upstream
doesn't actually trigger this error.

I'll update the description with why this is needed. i.e.
---
Make sure the data pointer in typec_mux_state is not null before
accessing it. The new Thunderbolt driver calls typec_altmode_notify
with a NULL pointer for data which can cause this mux configuration
to crash.

>
> > ---
> >
> >  drivers/usb/typec/mux/intel_pmc_mux.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/=
mux/intel_pmc_mux.c
> > index 56989a0d0f43..4283fead9a69 100644
> > --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> > +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> > @@ -331,14 +331,19 @@ static int
> >  pmc_usb_mux_tbt(struct pmc_usb_port *port, struct typec_mux_state *sta=
te)
> >  {
> >       struct typec_thunderbolt_data *data =3D state->data;
> > -     u8 cable_rounded =3D TBT_CABLE_ROUNDED_SUPPORT(data->cable_mode);
> > -     u8 cable_speed =3D TBT_CABLE_SPEED(data->cable_mode);
> > +     u8 cable_rounded, cable_speed;
> >       struct altmode_req req =3D { };
> >
> > +     if (!data)
> > +             return 0;
> > +
> >       if (IOM_PORT_ACTIVITY_IS(port->iom_status, TBT) ||
> >           IOM_PORT_ACTIVITY_IS(port->iom_status, ALT_MODE_TBT_USB))
> >               return 0;
> >
> > +     cable_rounded =3D TBT_CABLE_ROUNDED_SUPPORT(data->cable_mode);
> > +     cable_speed =3D TBT_CABLE_SPEED(data->cable_mode);
> > +
> >       req.usage =3D PMC_USB_ALT_MODE;
> >       req.usage |=3D port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
> >       req.mode_type =3D PMC_USB_MODE_TYPE_TBT << PMC_USB_MODE_TYPE_SHIF=
T;
> > --
> > 2.46.0.792.g87dc391469-goog
> >
>
> --
> With best wishes
> Dmitry

