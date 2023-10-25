Return-Path: <linux-usb+bounces-2187-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 730067D75B6
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 22:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21DFB281D73
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 20:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C3230FA3;
	Wed, 25 Oct 2023 20:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M6ABzHWy"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46703418B
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 20:32:45 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BAC136
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 13:32:42 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9a6190af24aso31685466b.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 13:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698265961; x=1698870761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBhYd8KrptCnHhI12JEqE8NhWUYADTCkyVE3k5UBWiw=;
        b=M6ABzHWyA4IlyG6rPeZgUFsJmmX+UBCmJbni1Cjrl6TWvd/swKHb7dwKs5egT7UQlv
         wSZtR7U9yds1v7SJMSR4WOB0LTbkHuq9aIuVcaA1FLdCdZ/sLWV9cco2KFjnucRKi0zF
         d+Ub0eHM4dkP3kMMgnQDdg9C+hwD/rZZQq8ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265961; x=1698870761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBhYd8KrptCnHhI12JEqE8NhWUYADTCkyVE3k5UBWiw=;
        b=C5739WdgrVKTAbAhJBlU7Sj2a3YKNSRrawdaVdKfigUyxWbTN3b/dpN2d2kEgQP8AX
         gH2ch51q/m+qxHA/spdno7JDcTVU4rLe/TdYDVOvrNuwhAzfR6xW4Uz6W9bglOBz57pr
         MqhjI+yCiMShw+IpAU3dQXmvbiJ67vCYxLAmIgCQdW4jK66qULau2avXn1DHzKFGm8Uf
         wA130Z9iNmykLU0y90wswkn2jugV2NEhyVZcXhV+GR6KnzXCPfwNwAcjkNZoa14GuSru
         +E/rH3UNotvUGx503kNRTeXGGz2T54B435uiwwF3V9FwN7jVvE1mKISrFev8f9IhgItj
         B6Lg==
X-Gm-Message-State: AOJu0YwmNPYQ7pAzcSZa4WZAQ37mZ3/m93dRgjYP4BeSwog1BLjsQfAD
	8XeWhGJbqQuFeYUTjIgPAL1iY2sF1hgqDJTocAP1cw==
X-Google-Smtp-Source: AGHT+IGns4Y5enaPGgHcHbUZ2ot29zDda2yNW/dUjx3jtJTCBC4NmT2GXpe1ouLErzPHTqRHsqx8ZA==
X-Received: by 2002:a17:907:841:b0:9be:6395:6b0f with SMTP id ww1-20020a170907084100b009be63956b0fmr12758234ejb.29.1698265961013;
        Wed, 25 Oct 2023 13:32:41 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id ov5-20020a170906fc0500b009ad8acac02asm10602531ejb.172.2023.10.25.13.32.40
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 13:32:40 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40837124e1cso27895e9.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 13:32:40 -0700 (PDT)
X-Received: by 2002:a05:600c:4592:b0:3f6:f4b:d4a6 with SMTP id
 r18-20020a05600c459200b003f60f4bd4a6mr138900wmo.7.1698265511701; Wed, 25 Oct
 2023 13:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020210751.3415723-1-dianders@chromium.org>
 <20231020140655.v5.8.Ib2affdbfdc2527aaeef9b46d4f23f7c04147faeb@changeid> <20231025162824.GK57304@kernel.org>
In-Reply-To: <20231025162824.GK57304@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Oct 2023 13:24:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XVJVkyA09Ca_YGa5xRS4jGra4cw-6ArgwCekMzn7uWcA@mail.gmail.com>
Message-ID: <CAD=FV=XVJVkyA09Ca_YGa5xRS4jGra4cw-6ArgwCekMzn7uWcA@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] r8152: Block future register access if register
 access fails
To: Simon Horman <horms@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Hayes Wang <hayeswang@realtek.com>, 
	"David S . Miller" <davem@davemloft.net>, Edward Hill <ecgh@chromium.org>, 
	Laura Nao <laura.nao@collabora.com>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-usb@vger.kernel.org, Grant Grundler <grundler@chromium.org>, 
	=?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 25, 2023 at 9:28=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Fri, Oct 20, 2023 at 02:06:59PM -0700, Douglas Anderson wrote:
>
> ...
>
> > @@ -9603,25 +9713,14 @@ static bool rtl8152_supports_lenovo_macpassthru=
(struct usb_device *udev)
> >       return 0;
> >  }
> >
> > -static int rtl8152_probe(struct usb_interface *intf,
> > -                      const struct usb_device_id *id)
> > +static int rtl8152_probe_once(struct usb_interface *intf,
> > +                           const struct usb_device_id *id, u8 version)
> >  {
> >       struct usb_device *udev =3D interface_to_usbdev(intf);
> >       struct r8152 *tp;
> >       struct net_device *netdev;
> > -     u8 version;
> >       int ret;
> >
> > -     if (intf->cur_altsetting->desc.bInterfaceClass !=3D USB_CLASS_VEN=
DOR_SPEC)
> > -             return -ENODEV;
> > -
> > -     if (!rtl_check_vendor_ok(intf))
> > -             return -ENODEV;
> > -
> > -     version =3D rtl8152_get_version(intf);
> > -     if (version =3D=3D RTL_VER_UNKNOWN)
> > -             return -ENODEV;
> > -
> >       usb_reset_device(udev);
> >       netdev =3D alloc_etherdev(sizeof(struct r8152));
> >       if (!netdev) {
> > @@ -9784,10 +9883,20 @@ static int rtl8152_probe(struct usb_interface *=
intf,
> >       else
> >               device_set_wakeup_enable(&udev->dev, false);
> >
> > +     /* If we saw a control transfer error while probing then we may
> > +      * want to try probe() again. Consider this an error.
> > +      */
> > +     if (test_bit(PROBE_SHOULD_RETRY, &tp->flags))
> > +             goto out2;
>
> Sorry for being a bit slow here, but if this is an error condition,
> sould ret be set to an error value?
>
> As flagged by Smatch.

Thanks for the note. I think we're OK, though. If you look at the
"out:" label, which is right after "out1" it tests for the same bit.
That will set "ret =3D -EAGAIN" for us.

I'll admit it probably violates the principle of least astonishment,
but there's a method to my madness. Specifically:

a) We need a test here to make sure we don't return "success" if the
bit is set. The driver doesn't error check for success when it
modifies HW registers so it might _thnk_ it was successful but still
have this bit set. ...so we need this check right before we return
"success".

b) We also need to test for this bit if we're in the error handling
code. Even though the driver doesn't check for success in lots of
places, there still could be some places that notice an error. It may
return any kind of error here, so we need to override it to -EAGAIN.

...so I just set "ret =3D -EAGAIN" in one place.

Does that make sense? If you want to submit a patch adjusting the
comment to make this more obvious, I'm happy to review it.

-Doug

