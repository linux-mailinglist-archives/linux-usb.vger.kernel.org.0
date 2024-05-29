Return-Path: <linux-usb+bounces-10677-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D98D3AB7
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 17:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B7C6289CF5
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 15:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880B1181B91;
	Wed, 29 May 2024 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qB6Y8QYc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A5C180A61
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996146; cv=none; b=cFBO8R2nd6MzJVXWBl5S4usXJdefwO0VTIi1RZ+WSKUt8uvwBGeQ7/Rx3eqtHx4kDuPWPHGB/YdKiq1IsjnD0MfwKIlYp4WM3iv71QJd+8c6zbByq1r2O5XpBYUSE90CZGDWH93GEPCVuTqx7X1q81hI3iP/dlVtUDhVgeMrRxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996146; c=relaxed/simple;
	bh=ftdb1zmL/72PvtsH9vB/i7unc05q/XJ1MbfMwbPqDoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwYRm3X1CNJFHPvCH/4JC+acwGnsVuk52ERXXKQK/+zpnVp5A6tZfx6pUMFCKhrtvo47uAEYw0O/ZOQYF3miQJibKUQtHoC9Y3QK4zGiTLjjgwCFntgB0IZwnksrSueDC0nVLwOtgJGFrSEKqCtYyYt00ZFs68QIL9LatJjcAds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qB6Y8QYc; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-df4d5d0b8d0so1986910276.2
        for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 08:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716996142; x=1717600942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVNOgelONT07b9FQMGSY/r/Dp2asYo6hWXODwZeg4Kk=;
        b=qB6Y8QYcYH1arSgMPD8SGZMN5e0gw8pdxETMGC78SOhWbMbyFXglp6tybyyXWSVRIN
         DMKVk1rsTk4tBN8IeJdt8G0SSGaKN8IwwzNUx+KWsBQf783gyYTfHWDk009q6AsdyD2z
         +1drkaV7AgSGPVJ+q6XZG3VzBwvLY2DTSt+DptRUoqC+SYoIArlrEDbGMvzcGrFdmfDH
         rEYoK7H6H3o031d+ELHj0+Epx3f28GHUtOxCdsms+ij/NjNl7sGET6fl2YlXRgk1c6Pa
         UtAZ/0kWRHU744TTCGR7iUnrbUVvxxYsWFb/fFWBwnf12ctyYOQuNxA1rGojc9OjUKOn
         1+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996142; x=1717600942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVNOgelONT07b9FQMGSY/r/Dp2asYo6hWXODwZeg4Kk=;
        b=TCHTuCuzyC27a0opslmPLgRCOG1fwcJ53fYSIVyGYWOOcMM3zHZon3SKHTehGA8eIx
         bkkC4xYg0+OswgD5gSO3vPnjcbXeKFewoxcx9bWN/+sF8HwTpltNfE2njZZpP7bKonZ8
         g8R0FRfV+uDoPDAtiLp/VFCkEy0aLKwUZHuRIH1WbNzJvAc890MxZLZiwt16sscDw+GR
         l/a9p/0X9AsLqpJ9rkbepyNJ9OXNSdahubLZWCz7V5HWRc7LpCTl1+x1qE9B1N9CHuWP
         Dgs+V4hcKKWIyxdK4CZyI6SDxvddocNCyBmIPa40DSJwP2mwpkVOKiRpGYwwysz5qgiW
         XQBA==
X-Forwarded-Encrypted: i=1; AJvYcCWnYkJrC6pD2BPjXevy6RDNBHUR0CUC+/yXM0HboMGP/ENtRuJ5Pq46yzsGolLRWuIFTO04JKkDWvAcjQOXatrKEJ/hKl22GG39
X-Gm-Message-State: AOJu0YyAY9DP9nbbILvaaD9saPfsU+7LuNxEcsLf5Rc4RplROAHHedgc
	j7IhR1kD9rUtupaXm/oNDkoSp50+0aFiVIsvO7FNwIPBjEfx69z4iAQc6WC+QKbK83FGES8GNjP
	0Agbdru8wvc/GCVV5YShiHsH2RhsNEyII6FvCJQ==
X-Google-Smtp-Source: AGHT+IFEEwc2BzA0rX78s94Zqs2JUVOvx29Z00Sv0+XpxHmRvPtJIPPoRxajiH7TOZW3YzoQpbeJXN26G/E57oUUVgs=
X-Received: by 2002:a5b:b49:0:b0:dfa:4ff5:d55d with SMTP id
 3f1490d57ef6-dfa4ff5d6f4mr1490315276.49.1716996141911; Wed, 29 May 2024
 08:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org>
 <20240528-yoga-ec-driver-v4-3-4fa8dfaae7b6@linaro.org> <ce6cbe69-f1de-1224-2a6e-3c7b07203d84@linux.intel.com>
In-Reply-To: <ce6cbe69-f1de-1224-2a6e-3c7b07203d84@linux.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:22:10 +0200
Message-ID: <CAA8EJproC_mW4pZ_C-BUUm73xfqja0EKVLvCZ+C_1dhW3xoEnw@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] usb: typec: ucsi: add Lenovo Yoga C630 glue driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 29 May 2024 at 17:20, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 28 May 2024, Dmitry Baryshkov wrote:
>
> > The Lenovo Yoga C630 WOS laptop provides implements UCSI interface in
> > the onboard EC. Add glue driver to interface the platform's UCSI
> > implementation.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/usb/typec/ucsi/Kconfig          |   9 ++
> >  drivers/usb/typec/ucsi/Makefile         |   1 +
> >  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 189 ++++++++++++++++++++++++=
++++++++
> >  3 files changed, 199 insertions(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kc=
onfig
> > index bdcb1764cfae..680e1b87b152 100644
> > --- a/drivers/usb/typec/ucsi/Kconfig
> > +++ b/drivers/usb/typec/ucsi/Kconfig
> > @@ -69,4 +69,13 @@ config UCSI_PMIC_GLINK
> >         To compile the driver as a module, choose M here: the module wi=
ll be
> >         called ucsi_glink.
> >
> > +config UCSI_LENOVO_YOGA_C630
> > +     tristate "UCSI Interface Driver for Lenovo Yoga C630"
> > +     depends on EC_LENOVO_YOGA_C630
> > +     help
> > +       This driver enables UCSI support on the Lenovo Yoga C630 laptop=
.
> > +
> > +       To compile the driver as a module, choose M here: the module wi=
ll be
> > +       called ucsi_yoga_c630.
> > +
> >  endif
> > diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/M=
akefile
> > index b4679f94696b..aed41d23887b 100644
> > --- a/drivers/usb/typec/ucsi/Makefile
> > +++ b/drivers/usb/typec/ucsi/Makefile
> > @@ -21,3 +21,4 @@ obj-$(CONFIG_UCSI_ACPI)                     +=3D ucsi=
_acpi.o
> >  obj-$(CONFIG_UCSI_CCG)                       +=3D ucsi_ccg.o
> >  obj-$(CONFIG_UCSI_STM32G0)           +=3D ucsi_stm32g0.o
> >  obj-$(CONFIG_UCSI_PMIC_GLINK)                +=3D ucsi_glink.o
> > +obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)  +=3D ucsi_yoga_c630.o
> > diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/type=
c/ucsi/ucsi_yoga_c630.c
> > new file mode 100644
> > index 000000000000..ca1ab5c81b87
> > --- /dev/null
> > +++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> > @@ -0,0 +1,189 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2022-2024, Linaro Ltd
> > + * Authors:
> > + *    Bjorn Andersson
> > + *    Dmitry Baryshkov
> > + */
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_data/lenovo-yoga-c630.h>
> > +
> > +#include "ucsi.h"
> > +
> > +struct yoga_c630_ucsi {
> > +     struct yoga_c630_ec *ec;
> > +     struct ucsi *ucsi;
> > +     struct notifier_block nb;
> > +     struct completion complete;
>
> Add includes for what you used here.
>
> > +     unsigned long flags;
> > +#define UCSI_C630_COMMAND_PENDING    0
> > +#define UCSI_C630_ACK_PENDING                1
> > +     u16 version;
> > +};
> > +
> > +static  int yoga_c630_ucsi_read(struct ucsi *ucsi, unsigned int offset=
,
>
> extra space
>
> > +                             void *val, size_t val_len)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D ucsi_get_drvdata(ucsi);
>
> Missing include for ucsi_get_drvdata

I'll review my includes, but this comment and the comment for
ucsi_operations are clearly wrong. There is a corresponding include.

>
> > +     u8 buf[YOGA_C630_UCSI_READ_SIZE];
> > +     int ret;
> > +
> > +     ret =3D yoga_c630_ec_ucsi_read(uec->ec, buf);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (offset =3D=3D UCSI_VERSION) {
> > +             memcpy(val, &uec->version, min(val_len, sizeof(uec->versi=
on)));
> > +             return 0;
> > +     }
> > +
> > +     if (offset =3D=3D UCSI_CCI)
> > +             memcpy(val, buf,
> > +                    min(val_len, YOGA_C630_UCSI_CCI_SIZE));
>
> Fits to one line.
>
> > +     else if (offset =3D=3D UCSI_MESSAGE_IN)
> > +             memcpy(val, buf + YOGA_C630_UCSI_CCI_SIZE,
> > +                    min(val_len, YOGA_C630_UCSI_DATA_SIZE));
> > +     else
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +
> > +static  int yoga_c630_ucsi_async_write(struct ucsi *ucsi, unsigned int=
 offset,
>
> extra space, there seems to be more of them below but I won't mark them.
>
> > +                                    const void *val, size_t val_len)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D ucsi_get_drvdata(ucsi);
> > +
> > +     if (offset !=3D UCSI_CONTROL ||
> > +         val_len !=3D YOGA_C630_UCSI_WRITE_SIZE)
> > +             return -EINVAL;
> > +
> > +     return yoga_c630_ec_ucsi_write(uec->ec, val);
> > +}
> > +
> > +static  int yoga_c630_ucsi_sync_write(struct ucsi *ucsi, unsigned int =
offset,
> > +                                   const void *val, size_t val_len)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D ucsi_get_drvdata(ucsi);
> > +     bool ack =3D UCSI_COMMAND(*(u64 *)val) =3D=3D UCSI_ACK_CC_CI;
> > +     int ret;
> > +
> > +     if (ack)
> > +             set_bit(UCSI_C630_ACK_PENDING, &uec->flags);
> > +     else
> > +             set_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
>
> Include for set_bit()
>
> > +     reinit_completion(&uec->complete);
> > +
> > +     ret =3D yoga_c630_ucsi_async_write(ucsi, offset, val, val_len);
> > +     if (ret)
> > +             goto out_clear_bit;
> > +
> > +     if (!wait_for_completion_timeout(&uec->complete, 5 * HZ))
> > +             ret =3D -ETIMEDOUT;
> > +
> > +out_clear_bit:
> > +     if (ack)
> > +             clear_bit(UCSI_C630_ACK_PENDING, &uec->flags);
> > +     else
> > +             clear_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
> > +
> > +     return ret;
> > +}
> > +
> > +const struct ucsi_operations yoga_c630_ucsi_ops =3D {
>
> Include for ucsi_operations.
>
> > +     .read =3D yoga_c630_ucsi_read,
> > +     .sync_write =3D yoga_c630_ucsi_sync_write,
> > +     .async_write =3D yoga_c630_ucsi_async_write,
> > +};
> > +
> > +static int yoga_c630_ucsi_notify(struct notifier_block *nb,
> > +                              unsigned long action, void *data)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D container_of(nb, struct yoga_c630_=
ucsi, nb);
>
> Include for container_of
>
> --
>  i.
>


--=20
With best wishes
Dmitry

