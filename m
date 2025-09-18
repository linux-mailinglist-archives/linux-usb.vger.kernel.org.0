Return-Path: <linux-usb+bounces-27096-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42356B2FD5F
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 16:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4397C1D222DE
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 14:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88512857EC;
	Thu, 21 Aug 2025 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g7vMAhXN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0F4225A59
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787501; cv=none; b=Ro7NRTa7yq7xD3fWbEPLIWOy5Qx12Atzm/vtOo7MwMQPc5DLI4Iwd3sli+amlbtPCK+ogfOug+Q1OJ9/MfBlRhsVESkIlM/WkpktzgfUCaY8UI9OQ9KXgtYKW1vVAhaeZo8INynKyDJGUssf18uv19sSEPLn0COV1L4AKdvFcLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787501; c=relaxed/simple;
	bh=B6IU72EL2hHWaSuLNQtE0wgSiba/GI0RK8DJ5KCF+FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWp66QojtUhphW43ku4EdWgflMLFtVuFYM8SK5vQfAtX2SzbywJSRPwJTjmdyubTNxSR65i4L8TFbdqtoH86U+nJuqHuHQuMDyPD6/dnh4oM+BhaFwgWq62p2FgZhIFDcE524zSFK9CVoZa1Jqmxe0oaDQzoOTyYXKmMUOni894=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g7vMAhXN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2445824dc27so10728195ad.3
        for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755787499; x=1756392299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3ZBzNW2iTlfEoA9OPDFh9ySUGnRcfIGtdtT6mqdubA=;
        b=g7vMAhXN2UcCslqwCwc6jvrl0krJaxMuOI8C6lftBW2FHYaSXEMf6/lit6lH2tpzho
         zUfoYno5MuGNGl4U7LCYW/Cl2yCK1uh/BbROCah2FExEcl5Iro8bBrq0c7+2KXHT2rzj
         cvExcaI0YdaQ+rWVXmYZllzn8OEtxDLVMgUfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755787499; x=1756392299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3ZBzNW2iTlfEoA9OPDFh9ySUGnRcfIGtdtT6mqdubA=;
        b=cAqCH9IvenXxbbpz/PEWggjMHZWkHqj+mEndQDCRgTM31URxyaZBCi6zGFY2R8liFE
         Bifcsg/up9jTRMfrpyeWWQ9up1rHIi5AyUJZYisKJIRZtw3aAyubZPvHJFhoOhJY11lP
         4fsldYC8qXQ/9g25xDsw3eo389m4NhNzL7wmkwTUgUC1YuxCokaZ+7IBbrMtqNUxTW28
         ippNNJgorVRdA0i2364FMCQrUmFIZmGrfi4wdK6QrLjFYl/VnoP1NU3ZQQ30Sj0kiNNJ
         5wiv+M9UNO8SOoGNPNbsR4Mrfe0PoULagSM1LnZrXDF7Fbml2nNIIbvLz8xxlSe/A5BU
         UCdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDD2+XOrepFtk8w06ZBdKsKIT+h7QgRsE+lec4/mUVj2UyfIxNocQHdjBfh/NR+Te/SZMSogk6Xyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys6Nh3q8gpXIIR42GFNQRnUFW1RxzBRAMyZr1LlZA89S3GE1sU
	JIupmJOFzwarifsrTQIjpv5rr6WsJwtyZON+UdwwmTk8L02w34viXmZnosDSVGgFbx+O1UTtKgL
	SW8HKMGpMD/DSNnnvEy5uWkGjzgy9+1IoQVjdqbYA
X-Gm-Gg: ASbGncs7/oSW61ighZwjmdCrXskVzb2cdmIg0pH66f21pKBef04HbdwQPwsrUgLgnsV
	tCf6VKqsGUQudPGdnJ1un4NnRTPm9a8VPRCPYEFU0PJhMLIO/FQPYw1VgsDa2O8Ogoubct+/LKX
	dzjaBY/+CaMawrEklLKJzfC+rrmUBu/jAHWF6+M+VII03lHUnYgML3miarCHi9jmjlsjl8YicVc
	QF/sWZ0G3zSCRorQjOmxqEOeHnoj+HY
X-Google-Smtp-Source: AGHT+IG6la090boFC0adFQ5R5iuoZ3O2i10q0RcjDij42X5nvHVjdaGi0WKBdDiWmyhYk3G4cOpQhrpyGK1XbyMp1IY=
X-Received: by 2002:a17:902:c946:b0:246:61e:b562 with SMTP id
 d9443c01a7336-246061ebb49mr31764835ad.59.1755787498861; Thu, 21 Aug 2025
 07:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814184455.723170-1-akuchynski@chromium.org>
 <20250814184455.723170-6-akuchynski@chromium.org> <aKbMeSCHf-ZhbcvT@kuha.fi.intel.com>
In-Reply-To: <aKbMeSCHf-ZhbcvT@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 21 Aug 2025 16:44:45 +0200
X-Gm-Features: Ac12FXz6CpwUI9KCMT5e9L3vISv4bbNnmCuQHgIVlGc9lVaESXs2xstG0gJQrRA
Message-ID: <CAMMMRMd4Gw+yC+4wB=_ZRChuE1=TEZXePYZa5PoqmLSiGDJCRQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] usb: typec: Expose alternate mode priority via sysfs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 9:36=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei,
>
> On Thu, Aug 14, 2025 at 06:44:55PM +0000, Andrei Kuchynski wrote:
> > This patch introduces a priority sysfs attribute to the USB Type-C
> > alternate mode port interface. This new attribute allows user-space to
> > configure the numeric priority of alternate modes managing their prefer=
red
> > order of operation.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 12 ++++++
> >  drivers/usb/typec/class.c                   | 47 ++++++++++++++++++++-
> >  2 files changed, 58 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentatio=
n/ABI/testing/sysfs-class-typec
> > index 38e101c17a00..001202d651fa 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -162,6 +162,18 @@ Description:     Lists the supported USB Modes. Th=
e default USB mode that is used
> >               - usb3 (USB 3.2)
> >               - usb4 (USB4)
> >
> > +             What:           /sys/class/typec/<port>/<alt-mode>/priori=
ty
> > +Date:                July 2025
> > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > +Description:
> > +             Displays and allows setting the priority for a specific a=
lt-mode.
> > +             When read, it shows the current integer priority value. L=
ower numerical
> > +             values indicate higher priority (0 is the highest priorit=
y).
> > +             If the new value is already in use by another mode, the p=
riority of the
> > +             conflicting mode and any subsequent modes will be increme=
nted until they
> > +             are all unique.
> > +             This attribute is visible only if the kernel supports mod=
e selection.
>
> I was expecting this to be already used in this series.
>
> IMO this file should be the only thing the user space needs to use by
> default at least.
>

No more entries for mode priorities.
What about the trigger of the process?
I'm going to introduce a mode_selection binary sysfs attribute in
the next series. Writing 1 to this attribute will activate the
mode selection process. Writing 0 will cancel the process and
exit the currently active mode.

> > @@ -469,6 +500,15 @@ static umode_t typec_altmode_attr_is_visible(struc=
t kobject *kobj,
> >                               !adev->ops->activate)
> >                               return 0444;
> >               }
> > +     } else if (attr =3D=3D &dev_attr_priority.attr) {
> > +             if (is_typec_port(adev->dev.parent))  {
> > +                     struct typec_port *port =3D to_typec_port(adev->d=
ev.parent);
> > +
> > +                     if (!port->alt_mode_override)
> > +                             return 0;
> > +             } else
> > +                     return 0;
> > +     }
>
> If we have the local port variable, this should be enough:
>
>                 if (!is_typec_port(adev->dev.parent) || !port->alt_mode_o=
verride)
>                         return 0;
>

typec_altmode2port is really powerful. Thank you again for this hint!

> >       return attr->mode;
> >  }
> > @@ -2029,6 +2069,7 @@ static void typec_release(struct device *dev)
> >       typec_mux_put(port->mux);
> >       typec_retimer_put(port->retimer);
> >       kfree(port->cap);
> > +     typec_mode_selection_destroy(port);
> >       kfree(port);
> >  }
> >
> > @@ -2496,6 +2537,8 @@ typec_port_register_altmode(struct typec_port *po=
rt,
> >               to_altmode(adev)->retimer =3D retimer;
> >       }
> >
> > +     typec_mode_set_priority(adev, -1);
>
> This really should not be necessary. Why can't we set the priority
> based on the order the drives registers the altmodes for the port?
>

Setting priorities based on the order of registration is a good
idea. This simplifies the logic by making the default_priorities
unnecessary.
I will modify the initialization to call

          typec_mode_set_priority(adev, 0);

With this change, the later a mode is registered, the higher its
priority will be. For the cros_ec_typec driver, this produces the
same default sequence: USB4 TBT DP.

Thanks,

Andrei



> >       return adev;
> >  }
> >  EXPORT_SYMBOL_GPL(typec_port_register_altmode);
> > @@ -2645,6 +2688,8 @@ struct typec_port *typec_register_port(struct dev=
ice *parent,
> >       port->con.attach =3D typec_partner_attach;
> >       port->con.deattach =3D typec_partner_deattach;
> >
> > +     INIT_LIST_HEAD(&port->mode_list);
> > +
> >       if (cap->usb_capability & USB_CAPABILITY_USB4)
> >               port->usb_mode =3D USB_MODE_USB4;
> >       else if (cap->usb_capability & USB_CAPABILITY_USB3)
>
> thanks,
>
> --
> heikki

