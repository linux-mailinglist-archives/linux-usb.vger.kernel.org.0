Return-Path: <linux-usb+bounces-6201-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F48485060B
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 20:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C996283A3C
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 19:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A065F562;
	Sat, 10 Feb 2024 19:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZlRYqC36"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3826D1E484
	for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 19:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707591842; cv=none; b=dim4yr+Yd3ooI93o15zmw00zseXftRaZwTHEdTK1pZV/TTZ9cNqpMXQ5wmoVr32U3WqK1ROzOm/eFIP8mzdKZMWDLL7WcmDAQPyWUa87NEn6sZ6ooM8Dtt4JmaW96xbaB1uSr63Jkiw/89neIalhFEU0r36Uhh/sUpYvaP3EQLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707591842; c=relaxed/simple;
	bh=g812jRGii4cWwH6XD6nCrGWZSQ+YDUHLcIUACbfxTUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkTeXtOIWJcRo51cHt0Bquzvce4df9iALgRnqCannjB13xdMvbrjgZCJeSJHJMyBGUFx77R3oknfLJZOSQMKJMtZdHfuFPe5BSc2FEJYVj5nOgdtYyMVo/Yhzdc/ZHZHmTehAAt/kWDdnybISKjDNg9QcYm1AtuppHssJUBjAL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZlRYqC36; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d93b982761so668085ad.0
        for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 11:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707591840; x=1708196640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDddWMAmYpcBDRLjzqZDMnY/iG2GzmBQVXleP9AJMuA=;
        b=ZlRYqC365neCviYtBmxQjdq/myF5HQPMqbIFTclyGu+qnH2xgdAQo92Yd6DQ8uNNf7
         pAEEbqG+ArNpTobylr+tpX33o0DS4hQbaoHAGHuUIL1BhV2EFwrs1fl4RAPDTEn8US5l
         JsIudSQr+B89XI14rR+aI1mdZKG5DVfZgq+HcWzTKEkbq/4wsc8cSFeADlWpwpOS3TmT
         /w5FKzwFP4xOpYBpduP3xrneJ+/2e6NEFExjdgy7eGX4EnNjH8FXb8U3/AsQ0UfGF+bD
         QiwLVeS5I0tKouRKgDkrJvIzy0Ca9L69xx2VscU5ZHV5Vca3+3Izj9xfDY/0YbuXRybZ
         UidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707591840; x=1708196640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDddWMAmYpcBDRLjzqZDMnY/iG2GzmBQVXleP9AJMuA=;
        b=JMtSIs3kttCbeMos+rQSqXEljH11QCiVqxfYT5tk0jtI3m86akLJMNqgHm53vPQikB
         PIRdorx6tCIcp3UWyddM9UMdUtn6ZrR+4fpp5k9HM7fNIsTdc5x8W0RMYkJdj157DVFy
         lhvuSEJiYw9UV4tZ5z0Tj1517A93OqFIu+KcDOazwCO7KLucbom4Hqua/8virsDT+W8Y
         OGueF2fy5EvA8RfUJVQG+keFEn3LwFP26Bxxw9ybmOAvIg+aljMJoulo7CN7ltedFEmo
         a6aRTv8QT1OkbCpKkHGOtdPsL835JtYPwhSwlweLKwq576kBmdsQGtpb+Y5cbq2AWA+L
         bVVg==
X-Gm-Message-State: AOJu0Yxm1q8kFAJR29h6WSZBL3fUeWmIq8iJ/utcwyWCCeiNt8W2HSpP
	Q2CkcCMzZDYhJvpgxTriPz4IZgxzX/mFF95EJmYNom7grt5QEDdoRvwoKZQHANFShLhpQ86BTqx
	G43MUmNYn3zytd2T0DqC7b5rUArOhCnMboixg
X-Google-Smtp-Source: AGHT+IEo8m6diSEIFCeEwbhXQ3bZRw4alPC/AQhPjkCrR0SS8Tn//gu7jRwtOpNbvqr52FGKGyHdNp3H5cjP9Z49zFw=
X-Received: by 2002:a17:903:40c4:b0:1d7:7e3c:59ce with SMTP id
 t4-20020a17090340c400b001d77e3c59cemr65450pld.29.1707591840236; Sat, 10 Feb
 2024 11:04:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205104049.48900-1-christianshewitt@gmail.com> <CANEJEGuVPfdteBfY_LyQ+D=t4HGHLvDut-Vj2xFjRM4e8kgh=Q@mail.gmail.com>
In-Reply-To: <CANEJEGuVPfdteBfY_LyQ+D=t4HGHLvDut-Vj2xFjRM4e8kgh=Q@mail.gmail.com>
From: Grant Grundler <grundler@google.com>
Date: Sat, 10 Feb 2024 11:03:46 -0800
Message-ID: <CANEJEGsdz6nCrWahBS13dAa9Q-urmb8Ap5Uaz8S7ExcTrfX6JQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: asix: add 0b95:1790 to AX88179A device list
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Grant Grundler <grundler@chromium.org>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 10:20=E2=80=AFAM Grant Grundler <grundler@google.co=
m> wrote:
>
> On Mon, Feb 5, 2024 at 2:40=E2=80=AFAM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
> >
> > Add a generic AX88179A entry for the 0b95:1790 device id:
> >
> > kernel: usb 2-1: New USB device found, idVendor=3D0b95, idProduct=3D179=
0, bcdDevice=3D 2.00
> > kernel: usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNu=
mber=3D3
> > kernel: usb 2-1: Product: AX88179A
> > kernel: usb 2-1: Manufacturer: ASIX
> > kernel: usb 2-1: SerialNumber: 00D24DC0
> > kernel: asix 2-1:1.0 (unnamed net_device) (uninitialized): Failed to re=
ad reg index 0x0000: -32
> > kernel: asix: probe of 2-1:1.0 failed with error -32
> > kernel: ax88179_178a 2-1:1.0 (unnamed net_device) (uninitialized): Fail=
ed to read reg index 0x0040: -32
> > kernel: ax88179_178a 2-1:1.0 eth1: register 'ax88179_178a' at usb-0000:=
01:00.0-1, ASIX AX88179 USB 3.0 Gigabit Ethernet, 20:7b:d2:d2:4d:c0
> >
> > Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> > ---
> > The change is tested by a LibreELEC (distro) user who reports the NIC t=
o be working
> > fine (and logs support this) but the "Failed to read reg index 0x0000: =
-32" errors
> > suggest ax88178_info might not be the correct choice. I'm not a serious=
 coder so I
> > need to "ask the audience" for suggestions on what more might be needed=
?
> >
> >  drivers/net/usb/asix_devices.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_devi=
ces.c
> > index f7cff58fe044..9a7b1136cd98 100644
> > --- a/drivers/net/usb/asix_devices.c
> > +++ b/drivers/net/usb/asix_devices.c
> > @@ -1506,6 +1506,10 @@ static const struct usb_device_id        product=
s [] =3D {
> >         // ASIX AX88178 10/100/1000
> >         USB_DEVICE (0x0b95, 0x1780),
> >         .driver_info =3D (unsigned long) &ax88178_info,
> > +}, {
> > +       // ASIX AX88179A 10/100/1000
> > +       USB_DEVICE(0x0b95, 0x1790),
> > +       .driver_info =3D (unsigned long)&ax88178_info,
> >  }, {
>
> Hi Christian!
> Seems like there are two problems here:
> 1) The USB output is telling you this device is a AX88179A : the
> changes most likely should be in ax88179_178a.c using the
> ax881798_info:
>    https://elixir.bootlin.com/linux/latest/source/drivers/net/usb/ax88179=
_178a.c#L1690

Christian,
Let me restate this more clearly: ax88179_178a is already claiming
this device. No need to add anything to asix_devices.c

> 2) What Andrew Lunn said. I'll add the asix driver should not be
> probing (or claiming) this device - or at least be quiet about it when
> it does.

That's why Andrew was asking about where 0x40 index is used.... and
it's not obvious to me either right now since I don't see a definition
for register index 0x40 in ax88179_178a.c file.

Since this is happening with both drivers (asix and ax88179_178a) and
it looks like this is happening before SET_NETDEV_DEV() is called, I'm
going to assume this has something to do with usbnet_probe() calling
pm_runtime_enable().

Andrew's advice to add a WARN_ON call to the function printing "Failed
to read reg index" on failure, is really good as it will tell us the
exact call path through "a maze of twisty little passages, all the
same" (to quote "colossal cave adventure" game from 1977 :D).

cheers,
grant

> Thanks for looking into this!
>
> cheers,
> grant
>
> >         // Logitec LAN-GTJ/U2A
> >         USB_DEVICE (0x0789, 0x0160),
> > --
> > 2.34.1
> >

