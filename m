Return-Path: <linux-usb+bounces-27094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D57B2FC7A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 16:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5877625341
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 14:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD192857C9;
	Thu, 21 Aug 2025 14:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C9ocq1lr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D8E283FDE
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786011; cv=none; b=I26ZGWyxUSpvHZiO2hzYqlY9X8R970bqT/UGEoNQK3HGbstvmNXO7kmfNdiJA4EPT3HtOvnORTVNAuiLM0uAFudwGGbfzsiV/R/kHBWdxWV5P9zddmF6ac+7QHd3u7GOf6jWdsAc1i/LD0fn6B1gEAlbOsso+GQgxpQAC+IW8iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786011; c=relaxed/simple;
	bh=1TGQbSNXcYAwYgKdfFoYVGYgfusyVauvVnseKMDM9gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ft8GQ2ADsGPSbqx0uuaGGUQ5VpBR+wXgCbGSr1D9F/2Fh58R1wfVpNONmJ3rz5AQUMKphVOW9p8Ky6ygeMS2UI/B1E2pxS6ke18tP6sWDpKB7Pw9PNTUaQY6bMmVZg+ZEYEtGP++bV66ocTfTfbT25DGm+OvCKNnu5NfwpL3taA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C9ocq1lr; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32326e5f058so802342a91.3
        for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755786009; x=1756390809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdSdCc6sEwtZ8z33Ieo6BIkuzQuw7IgeQtd7fNjTH7I=;
        b=C9ocq1lr87zJ4K9bWMxwG0NF5hEtMim6gZW5IX34z1Sl3bnx+7dzTDLeo5B/nHWsof
         W6RcsMdKstDkGkj6SgUjRg+GdyKRCnNfePDCcPB6smeS2zSQJVXKCycLynbkT/mBidtM
         uJT6eFKWIV1iwuMd1Hb3r1m2mo/udkw0jwe2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755786009; x=1756390809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdSdCc6sEwtZ8z33Ieo6BIkuzQuw7IgeQtd7fNjTH7I=;
        b=PDphpxDnKlZoowlkQ3VKyv1kL/X7/6jqotqdAx+bWiFRYd7R7pwPxe4KPXp05+NmbJ
         0eKA0S+OHdswnZtxhQa4Yh7kbe/VmTr4UpWjucgkTi22yH9p6BmZ1NAvW6uF7REr6ssU
         sNe3NEJceq54mz+2Du9PRQZV5mqKonh41vVjcj/mfxANduq3wDSGGRYUxsY4oew+wZc6
         A0H0TAOAz6F+0G74AirUWyahYbOiNtpBJ+MxDy5Z5osPiQ1A6z4Ypj+52M0vIvUaJaRp
         vNkeqH2Q8G6fSVDe3bGnrvxTBwbQGiIGU+1N4FPF78wD7Bdyd6jIgC/Xn9ElZro+wzCm
         +MWw==
X-Forwarded-Encrypted: i=1; AJvYcCWTs8UlkToaxphgumQUnDbp7NH+vA4rIgfO0uoylulH1K/P/45Jx3budBwAGtpC7UShEBuyQl8xrDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDAT6SwocMqBXHU4mCeEGYSh6RZZpK47exB6MaYsVWLr3ZX+Ij
	rb9PeOrq2myfcgw+bUht+MtxbfOK5y9WGW7g290oJT9Hf2EpVNn+OiGQcb1V2pHZ5lcuwJZhE4j
	zvzIgpKbalqRTiLL3lMo6/1kMqNYp4YQaGXD4KhXN
X-Gm-Gg: ASbGncuqscHSHNx3N9g2VnH8VY7VWNBNEzkx8RgDClyMhvI3hkfAZTuQfmFkNUEKV3a
	BijwY09uhvDsHw4jfQj2x33d/mN5mmn87myq4ZG7TR/NS/ImRePhrcEcF7viuEMHqw+uV8PKa4q
	7AvorFqk3jLsFl+ZWRumKhYIfkJDm0JXYvA0HkXGtCNKwr8ugJellHnYMwceW6ZzK5+sIXpUCQK
	AlawSA8a8JikXbvWUFL53UWiszl8QZDFwcVVoaRmpBoP1d9qEwXDA==
X-Google-Smtp-Source: AGHT+IEM3XPbTHByoiCZun4dj8efSaZNwLp3Hlum29XsE5UAtKvi/jloqwgDc44XSZWztVSVyI1iCjK2uhPpPIo+vP8=
X-Received: by 2002:a17:90b:3bc5:b0:321:4182:2b9e with SMTP id
 98e67ed59e1d1-324ed09612emr4228539a91.12.1755786008932; Thu, 21 Aug 2025
 07:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814184455.723170-1-akuchynski@chromium.org>
 <20250814184455.723170-2-akuchynski@chromium.org> <aKWpI0RhPR2mFlql@kuha.fi.intel.com>
In-Reply-To: <aKWpI0RhPR2mFlql@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 21 Aug 2025 16:19:56 +0200
X-Gm-Features: Ac12FXxNBZ21VY5QqnSzQ4sZ97eKb-66iED2WdLpg2CP9xg85i8cPERoB_qk5SE
Message-ID: <CAMMMRMeqAToQ=iAjLrT64q3g+e_K_3Mqp4uh3LNnULMTJeY-iw@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] usb: typec: Add alt_mode_override field to port property
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 12:53=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Aug 14, 2025 at 06:44:51PM +0000, Andrei Kuchynski wrote:
> > This new field in the port properties dictates whether the Platform Pol=
icy
> > Manager (PPM) allows the OS Policy Manager (OPM) to change the currentl=
y
> > active, negotiated alternate mode.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/class.c | 14 +++++++++++---
> >  drivers/usb/typec/class.h |  2 ++
> >  include/linux/usb/typec.h |  1 +
> >  3 files changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 67a533e35150..a72325ff099a 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -459,9 +459,16 @@ static umode_t typec_altmode_attr_is_visible(struc=
t kobject *kobj,
> >       struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj)=
);
> >
> >       if (attr =3D=3D &dev_attr_active.attr)
> > -             if (!is_typec_port(adev->dev.parent) &&
> > -                 (!adev->ops || !adev->ops->activate))
> > -                     return 0444;
> > +             if (!is_typec_port(adev->dev.parent)) {
> > +                     struct typec_partner *partner =3D
> > +                             to_typec_partner(adev->dev.parent);
>
> That looks a bit unnecessary. Also, can't the altmode be a plug alt mode?
>
> > +                     struct typec_port *port =3D
> > +                             to_typec_port(partner->dev.parent);
> > +
> > +                     if (!port->alt_mode_override || !adev->ops ||
> > +                             !adev->ops->activate)
> > +                             return 0444;
> > +             }
>
> How about:
>
>         struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj)=
);
>         struct typec_port *port =3D typec_altmode2port(adev);
>
>         if (attr =3D=3D &dev_attr_active.attr) {
>                if (!is_typec_port(adev->dev.parent)) {
>                         if (!port->alt_mode_override || !adev->ops || !ad=
ev->ops->activate)
>                                 return 0444;
>                 }
>         }
>

I completely missed typec_altmode2port function.
Thank you!

> >       return attr->mode;
> >  }
> > @@ -2681,6 +2688,7 @@ struct typec_port *typec_register_port(struct dev=
ice *parent,
> >       }
> >
> >       port->pd =3D cap->pd;
> > +     port->alt_mode_override =3D cap->alt_mode_override;
>
> This needs to be enabled by default:
>
>         port->alt_mode_override =3D !cap->no_mode_control;
>

Agreed.  I'll make it enabled by default.

> >       ret =3D device_add(&port->dev);
> >       if (ret) {
> > diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> > index db2fe96c48ff..f05d9201c233 100644
> > --- a/drivers/usb/typec/class.h
> > +++ b/drivers/usb/typec/class.h
> > @@ -80,6 +80,8 @@ struct typec_port {
> >        */
> >       struct device                   *usb2_dev;
> >       struct device                   *usb3_dev;
> > +
> > +     bool                            alt_mode_override;
>
> s/alt_mode_override/mode_control/ ?
>

Agreed. mode_control is a clearer name.

Thank you for your review!


Andrei

