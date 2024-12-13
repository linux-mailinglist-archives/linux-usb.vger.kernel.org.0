Return-Path: <linux-usb+bounces-18455-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEC99F146D
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2024 18:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0214E16A2D7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2024 17:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7781E4106;
	Fri, 13 Dec 2024 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gI/DUdxO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F601187FFA
	for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112520; cv=none; b=tz8DUH/zHh7ZwcDmtXZz7uLIYa+jsWaYoFbIGXVzfwgH6KoX177707t84paxz/gNFRfyJCJeM5Zq5Q1+PUHztpuVQUC6TR4ssfNa592uDk/Ega3JJ8xKX3cZnEd8NLHcIAHHZ789mcy2lNPSpIN5FcnL+IjyOHfrR2hJnz/a+BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112520; c=relaxed/simple;
	bh=EXMl1VjQUQGEWOFRwkpxn2GPtLeQmxpmZUabvDA8kC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmdKQTnZEY+l6i/IqJNi/9XwHIb4zQjid5tB5P7X65tS61Dr04dYfdcwD7z0RMeQoxSjLLZn5qJZEM85O0Ghaerg47eqEWdRiaQ3quWWrfQOVvFJXqNsugEX30wsN9YKxBqAeCPfpjwbIArWHRZ87KGUtYliZTwr0k2QSHZAWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gI/DUdxO; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e387ad7abdaso1522784276.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 09:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734112518; x=1734717318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNAl3pYsAdok6wmTwstpNCbMSVKtC0nPPGJ5z8X86Jk=;
        b=gI/DUdxOMIL/6Ku0VqQC8a9zaKQzhHPFSBOBbizp4T4zO++nXv0wj2ifLKRvgHBnvs
         VM0eA7A1tOqod19jlPv+IpdPR+5YUuBhVi0Mhzop2T8P3BJ7YCOIymv6Y9ACrkUxOok1
         Hf14XTqZ2NsG7nJV70K/ahPzqfQZ8JwDSbeX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112518; x=1734717318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNAl3pYsAdok6wmTwstpNCbMSVKtC0nPPGJ5z8X86Jk=;
        b=nkg7SgS4/HoKv+wPTQm6ZzJXM6q6vnYURFjMY5emU4n0PsrWawkOXqHWhxl6iWVX4n
         78U2pPfIkACir0Cn47AtYHIccC4hWLL/bZ0JtlRn3kYrKpzdsvw8WkllbRENIWEy2GZ7
         vzvwOSRZzbcx6X7Z99tOUN1/FXflBHMxxDNe5PxWpPy2WpRoiupCdH7lskeheMVou7+a
         0RujXQRS3OY/E/0TydXr7EjFfJgwKFzGHNeSlFq6YwLGGYWFDuiZNr8YJ/WccVaZ6O7F
         18/JSVXOQd6e4Dfy13Jv3ZY6Kd9uJMqXmw6G1XAICx33mQZZwpWHv0LqYuZrpuXpkqlJ
         xYNA==
X-Forwarded-Encrypted: i=1; AJvYcCUFHR/rQhHreMfYludsb3tsSo9+2ZxM7X00bm/pC67VOC6FPt2FhwKTDZDsmk3W+k93GUpu9/gtZIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8+s4UAxYUeQ1PiKomQr5X/4xmkla8FT9MEEs4K9MKvQ1QlZ1p
	y2DJJeWmfGWy/YoGVPJ7ygrEGgnx5MZqAtI5vMrMB6NIhvOCCID1gEOZWQTuURucUIRcCVTOVTS
	ytTajegnAqC5QZYf8vIWpkmt5xn7XNM45tQKv
X-Gm-Gg: ASbGncv9d45tDUf+t3hd9y+y0woFDpP8GVL87UrUMiUS7qYjYjwf/zbc+tgGE/9GFpp
	sQIO/5/e6QNmlBBn+dUIF2vSPWT1mgqlx6vjKOg==
X-Google-Smtp-Source: AGHT+IHKj2DJBifjxgnaueO2xSRR3Bbz5xWR0O8owRadJHa6UFQcidPK/tlY3CyGB4z7uua1HkTtXclZdEar54N9Twg=
X-Received: by 2002:a05:6902:248f:b0:e39:9291:7bd9 with SMTP id
 3f1490d57ef6-e434ac01361mr2519259276.31.1734112518070; Fri, 13 Dec 2024
 09:55:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
 <20241206153813.v4.2.I3080b036e8de0b9957c57c1c3059db7149c5e549@changeid> <CAE-0n52KWd5twmXk5fHf=kfdNm27QTJMPLrU3CRb9SnrtAF_UA@mail.gmail.com>
In-Reply-To: <CAE-0n52KWd5twmXk5fHf=kfdNm27QTJMPLrU3CRb9SnrtAF_UA@mail.gmail.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Fri, 13 Dec 2024 09:55:06 -0800
Message-ID: <CANFp7mUOxyYfkr6Ce93aLzJXRopbvfEjq52tsa+DhKi-Y90Uvw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] usb: typec: Add driver for Thunderbolt 3 Alternate Mode
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, tzungbi@kernel.org, akuchynski@google.com, 
	pmalani@chromium.org, jthies@google.com, dmitry.baryshkov@linaro.org, 
	badhri@google.com, rdbabiera@google.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 4:21=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Abhishek Pandit-Subedi (2024-12-06 15:38:13)
> > diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typ=
ec/altmodes/thunderbolt.c
> > new file mode 100644
> > index 000000000000..14e89e9a7691
> > --- /dev/null
> > +++ b/drivers/usb/typec/altmodes/thunderbolt.c
> > @@ -0,0 +1,387 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/**
>
> Remove extra *, this isn't kerneldoc.
Done

>
> > + * USB Typec-C Thuderbolt3 Alternate Mode driver
> > + *
> > + * Copyright (C) 2019 Intel Corporation
> > + * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > + */
> > +
> > +#include <linux/delay.h>
>
> Is this include used?

Compiles without it so I'm guessing no.

>
> > +#include <linux/mutex.h>
> > +#include <linux/module.h>
> > +#include <linux/usb/pd_vdo.h>
> > +#include <linux/usb/typec_altmode.h>
> > +#include <linux/usb/typec_tbt.h>
>
> Please include workqueue.h
Done

>
> > +
> > +enum tbt_state {
> > +       TBT_STATE_IDLE,
> > +       TBT_STATE_SOP_P_ENTER,
> > +       TBT_STATE_SOP_PP_ENTER,
> > +       TBT_STATE_ENTER,
> > +       TBT_STATE_EXIT,
> > +       TBT_STATE_SOP_PP_EXIT,
> > +       TBT_STATE_SOP_P_EXIT
> > +};
> > +
> > +struct tbt_altmode {
> > +       enum tbt_state state;
> > +       struct typec_cable *cable;
> > +       struct typec_altmode *alt;
> > +       struct typec_altmode *plug[2];
> > +       u32 enter_vdo;
> > +
> > +       struct work_struct work;
> > +       struct mutex lock; /* device lock */
>
> What does it protect? The whole struct tbt_altmode?

This looks like it's protecting control flow (enter/exit/vdm can all
be triggered on probe, via .activate or potentially autonomously via
port driver triggering the alt-mode).

>
> > +};
> [...]
> > +
> > +/* MUST HOLD tbt->lock.
>
> Use lockdep_assert_held(tbt->lock) and remove the comment?
Done.

>
> > + *
> > + * If SOP' is available, enter that first (which will trigger a VDM re=
sponse
> > + * that will enter SOP" if available and then the port). If entering S=
OP' fails,
> > + * stop attempting to enter either cable altmode (probably not support=
ed) and
> > + * directly enter the port altmode.
> > + */
> > +static int tbt_enter_modes_ordered(struct typec_altmode *alt)
> > +{
> > +       struct tbt_altmode *tbt =3D typec_altmode_get_drvdata(alt);
> > +       int ret =3D 0;
> > +
> > +       if (!tbt_ready(tbt->alt))
> > +               return -ENODEV;
> > +
> > +       if (tbt->plug[TYPEC_PLUG_SOP_P]) {
> > +               ret =3D typec_cable_altmode_enter(alt, TYPEC_PLUG_SOP_P=
, NULL);
> > +               if (ret < 0) {
> > +                       for (int i =3D TYPEC_PLUG_SOP_PP; i > 0; --i) {
> > +                               if (tbt->plug[i])
> > +                                       typec_altmode_put_plug(tbt->plu=
g[i]);
> > +
> > +                               tbt->plug[i] =3D NULL;
> > +                       }
> > +               } else {
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       return tbt_enter_mode(tbt);
> > +}
> > +
> > +static int tbt_cable_altmode_vdm(struct typec_altmode *alt,
> > +                                enum typec_plug_index sop, const u32 h=
dr,
> > +                                const u32 *vdo, int count)
> > +{
> [...]
> > +               case CMD_EXIT_MODE:
> > +                       /* Exit in opposite order: Port, SOP", then SOP=
'. */
> > +                       if (sop =3D=3D TYPEC_PLUG_SOP_PP)
> > +                               tbt->state =3D TBT_STATE_SOP_P_EXIT;
> > +                       break;
> > +               }
> > +               break;
> > +       default:
> > +               break;
> > +       }
> > +
> > +       if (tbt->state !=3D TBT_STATE_IDLE)
> > +               schedule_work(&tbt->work);
> > +
> > +
>
> Nitpick: Why two newlines?
Clang format missed it :(

>
> > +       mutex_unlock(&tbt->lock);
> > +       return 0;
> > +}
> > +
> [...]
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index febe453b96be..b5e67a57762c 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -458,7 +458,8 @@ static umode_t typec_altmode_attr_is_visible(struct=
 kobject *kobj,
> >         struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kob=
j));
> >
> >         if (attr =3D=3D &dev_attr_active.attr)
> > -               if (!adev->ops || !adev->ops->activate)
> > +               if (!is_typec_port(adev->dev.parent) &&
> > +                   (!adev->ops || !adev->ops->activate))
> >                         return 0444;
> >
> >         return attr->mode;
> > @@ -563,7 +564,7 @@ typec_register_altmode(struct device *parent,
> >
> >         if (is_port) {
> >                 alt->attrs[3] =3D &dev_attr_supported_roles.attr;
> > -               alt->adev.active =3D true; /* Enabled by default */
> > +               alt->adev.active =3D !desc->inactive; /* Enabled by def=
ault */
> >         }
> >
> >         sprintf(alt->group_name, "mode%d", desc->mode);
> > diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> > index d616b8807000..252af3f77039 100644
> > --- a/include/linux/usb/typec.h
> > +++ b/include/linux/usb/typec.h
> > @@ -140,6 +140,7 @@ int typec_cable_set_identity(struct typec_cable *ca=
ble);
> >   * @mode: Index of the Mode
> >   * @vdo: VDO returned by Discover Modes USB PD command
> >   * @roles: Only for ports. DRP if the mode is available in both roles
> > + * @inactive: Only for ports. Make this port inactive (default is acti=
ve).
> >   *
> >   * Description of an Alternate Mode which a connector, cable plug or p=
artner
> >   * supports.
> > @@ -150,6 +151,7 @@ struct typec_altmode_desc {
> >         u32                     vdo;
> >         /* Only used with ports */
> >         enum typec_port_data    roles;
> > +       bool                    inactive;
> >  };
> >
> >  void typec_partner_set_pd_revision(struct typec_partner *partner, u16 =
pd_revision);
>
> These two files look like they can be a different patch? Or the commit
> text can describe these changes.

I think earlier in the series, they were its own patch -- got merged
down into this over several refactors. I'll pull it out into its own
patch.

