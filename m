Return-Path: <linux-usb+bounces-27839-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A36BB509F7
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 02:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D37BF4E72B5
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 00:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E08B6A33B;
	Wed, 10 Sep 2025 00:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cBBZLpyn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D782033A
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 00:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757465170; cv=none; b=CY105WLpe9aAcrZ8KoHLPybtQ9Cxa0wPba7WnQh5cct+HqzDStwCVLHr2X75vSlHZPB9R53HEK9+rOiytqUt38V/T+01CpJ3tDzVNh2ov3aPPAv2TUFnoEaoTypXGeIOedf5ybfnO/AruNdtvmIjmbmZsNc2CY1UXHNxpY17AeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757465170; c=relaxed/simple;
	bh=0xeNo3BIaFmDervAKBZFHy5VNEvD7UpMyijC8RILg2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyEPSJ0amTIxNGfxYAPW+mfWiQ2Ftw4eooW/w/6KtVaEy843YMGW9stBz0h6nfOllkFbyixERwjDvHq9n80qVzvl9hHD43nx5PEr7KceEQpq3HepWOaC9X4GNUca+AWkgmU7PBWA5RsFxowyvz3NjHgoyg8yBDJWxkeNPyu90m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cBBZLpyn; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-74595f3852cso3910864a34.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 17:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757465168; x=1758069968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxHnVOKMxdbHCeN1exbpC/acYFmora29Q0FWi85N+KU=;
        b=cBBZLpynzA3f72o9QezqXhngZbSmsEWK2SqtwuOJQKHoR0OY4XSdsi58xgjEnEkG4d
         78j/cmSffTkDSP2lTmN0LRsytVccoq+YW8nQgxX0IjYU8+EIcgfkzgCKB79zHyp+gsOa
         sftxLTjZWKl5gB/uoh/V8XHeuzQugS1i+g/SG0XUMZUB1P4I2Sn24Pda3UwSQTwlMkoY
         G+Rby/5X2WUfRBsr4esHR0N+LIbYZJ8wlgJeI2em8BraCjEHruXsAk5Edg/QdZi9+xGr
         djhQvym6KQXU9UWS0W4y+hRUSI7rKBt2i6ORBC7AdDPdXqI5Du7DQIWXIMLMTriOgHAj
         ZN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757465168; x=1758069968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxHnVOKMxdbHCeN1exbpC/acYFmora29Q0FWi85N+KU=;
        b=Q8jam1JbSoaJgy8q4PZw8UUwlvwWxH8U4PUkQovlBcSkEIkP7L8RsUYt2uXqJ1/Fza
         rwJIOl0KLsLLVEXDGD2YMI1AePuve8hYnEQjw0Ztoy+N/CeO1kpYIMP2U0EBeH6chKye
         2GDIizSFtmvRipyvC+iTCGIuSEeVJ3KVS/Nw8sWMgWEqFrxt97U8gw/KNWk9vTlucs0e
         duHGpR3Q4GPbbZeJivMqs4BIDYr+u3pxw8q37hjwHNx/QJEy9RbdDz+Y9rRRCsYb/ifK
         jDYyIQ0yTczQY8aEBCSNqY6jHESA0Y2n+DIVEiIPmTH4vfCpenSpMUBK0DdW2uzz6ahS
         LJmw==
X-Forwarded-Encrypted: i=1; AJvYcCWfRYCfA/2o8hdxigvlLg/3dZFDSI9R2bgSubFNobIlnLCUYprZNWvUin9vN0v7V7riBbPl6j5cxA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4SIg66KVHcY8CrU/z5R2cvlHMeNAwGi2/LP+lhu+0PI/XbKBp
	kJ7W9gApIlRqu9LuOyouMjc8fcBy96mKQtJkzAwj+cIiaar3L3G0PMZZshmRMhYolma4lLyZEpP
	SOtxAEYVRmWcW25j7HZn9ys7U/fJvuZ0Lu/xySlki
X-Gm-Gg: ASbGncssDFp0y8eXXi31+T4yIz5dbfXVnprE+jkOJnt86N8jL0+7J3W2d0gd0Kenf9h
	NFL8snVfbcmL7D8WjoSGhvONbrw4aaxmZUwgDhg7sM07DwSgJ3WVdo6DNuYfyMbxH3gb9k9mPOj
	rFNoF/KFzIOX6ZpgIIHWVMYkucH9aGEgAhT1vD7bLOG/XTmC+E8RejV+hL+RQAgzjut+DOlS27V
	BYaJ+b8qc4IDvHEd9wqD6X3Zcv5QKqvU3FGmknOYCEe
X-Google-Smtp-Source: AGHT+IHen2BYd8vMpeqeYFzDF2cbgdfdpw1ttr7Y2zzPp2DUPEaVr7tMF+cZhwars9gYnqRJU3aWs9RAdaz2FqpWS5Y=
X-Received: by 2002:a05:6830:64c7:b0:741:b500:a412 with SMTP id
 46e09a7af769-74c74fbc057mr6945712a34.19.1757465167899; Tue, 09 Sep 2025
 17:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909080733.567796-1-xu.yang_2@nxp.com> <aMBSUFib937/hY/u@lizhi-Precision-Tower-5810>
In-Reply-To: <aMBSUFib937/hY/u@lizhi-Precision-Tower-5810>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 9 Sep 2025 17:45:30 -0700
X-Gm-Features: Ac12FXy1hVTyTGZcztjic6tSU2NxeIqp_c8I5wETuPszbEVCsqIADfcWNrbs8ns
Message-ID: <CAPTae5JfwpqpNm+9WVrhQ1X0ex7ohh6j1Dfj-rk7GhGHKVhKJQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpci: add wakeup support
To: Frank Li <Frank.li@nxp.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 9:14=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Sep 09, 2025 at 04:07:33PM +0800, Xu Yang wrote:
> > Add wakeup support for tcpci, so if the user has enabled wakeup file,
> > it will call enable_irq_wake() when do system suspend and call
> > disable_irq_wake() when do system resume. Due to this driver supports
> > shared interrupt, if the wakeup is disabled, it will mask the chip
> > interrupt by default to avoid affecting other IRQ users.
>
> Is below look better?
>
> Add wakeup support for tcpci. If the user enables the wakeup file, call
> enable_irq_wake() during system suspend and disable_irq_wake() during
> system resume. Since this driver supports shared interrupts, mask the
> chip interrupt by default when wakeup is disabled to avoid affecting
> other IRQ users.

+1, The above description looks more cleaner to me, otherwise LGTM

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tc=
pci.c
> > index a56e31b20c21..2a951c585e92 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -949,6 +949,8 @@ static int tcpci_probe(struct i2c_client *client)
> >       if (err < 0)
> >               goto unregister_port;
> >
> > +     device_set_wakeup_capable(chip->tcpci->dev, true);
> > +
> >       return 0;
> >
> >  unregister_port:
> > @@ -969,6 +971,36 @@ static void tcpci_remove(struct i2c_client *client=
)
> >       tcpci_unregister_port(chip->tcpci);
> >  }
> >
> > +static int tcpci_suspend(struct device *dev)
> > +{
> > +     struct i2c_client *i2c =3D to_i2c_client(dev);
> > +     struct tcpci_chip *chip =3D i2c_get_clientdata(i2c);
> > +     int ret;
> > +
> > +     if (device_may_wakeup(dev))
> > +             ret =3D enable_irq_wake(i2c->irq);
> > +     else
> > +             ret =3D tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
> > +
> > +     return ret;
> > +}
> > +
> > +static int tcpci_resume(struct device *dev)
> > +{
> > +     struct i2c_client *i2c =3D to_i2c_client(dev);
> > +     struct tcpci_chip *chip =3D i2c_get_clientdata(i2c);
> > +     int ret;
> > +
> > +     if (device_may_wakeup(dev))
> > +             ret =3D disable_irq_wake(i2c->irq);
> > +     else
> > +             ret =3D tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip-=
>tcpci->alert_mask);
> > +
> > +     return ret;
> > +}
> > +
> > +DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
> > +
> >  static const struct i2c_device_id tcpci_id[] =3D {
> >       { "tcpci" },
> >       { }
> > @@ -987,6 +1019,7 @@ MODULE_DEVICE_TABLE(of, tcpci_of_match);
> >  static struct i2c_driver tcpci_i2c_driver =3D {
> >       .driver =3D {
> >               .name =3D "tcpci",
> > +             .pm =3D pm_sleep_ptr(&tcpci_pm_ops),
> >               .of_match_table =3D of_match_ptr(tcpci_of_match),
> >       },
> >       .probe =3D tcpci_probe,
> > --
> > 2.34.1
> >

