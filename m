Return-Path: <linux-usb+bounces-19650-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 725DCA19BC3
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 01:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A2667A22CF
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 00:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5656A8F5A;
	Thu, 23 Jan 2025 00:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RkXJeEuB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701FD849C
	for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2025 00:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737592013; cv=none; b=YhLsTM+RI8DKUsHVmgy8wXVoQfdgv5m41Baz0s6CqGNbJY0FNtvAwJaOYX5KnBokGu9PfPBNc+djyrYsaNltAMeM/d9Eom38qau6PNkHylybBqyBs79KwBUhu2aoLca1uw1LfT+h+7Rx/OZhGYu51rXrWTc42vk0DNrkgPvdjBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737592013; c=relaxed/simple;
	bh=k60k0t2o/SXfwdjitskoQQqW2t/OREldijYiCM+RBDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BboXZ6Wa16fRJDmDxOFwwwI7IhQj5wlrKwqobv0GJWxSSzTGH3WhzsL7ap3yhg7k2dwyfCwgHQcdLsm87ysmt+p++U9c8gp1d8g22m16svf/9LhyRNhKGUXe/IqhUrOf+l3JXdlrAfklm2upFxl8Z8dLetwoM3gHw2NvmVBPfv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RkXJeEuB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2166f1e589cso6777275ad.3
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 16:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737592012; x=1738196812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C8UQ8z/0aBXkaLgtIXqAt3iLBDoz00fkW/F0euausSo=;
        b=RkXJeEuB0R/S8z6J5aqhz1V92xyTikkBeL6WOLYXUqb35rrayzcQOCt6P/xp7LOwIq
         ZzLYEZmXE9yeN4G4O8/f0OJ1pkdmxmiDOD5xlJsS3Ici1VGPYkhRUWYnC+PkNu22EZv5
         ZP9naCuS/7ceZWYxzQZe7/GhUu5iMkcTQkquNO3MxhxgXzblZQ2/unZCw1NUGSNS9tkw
         OYbKxAwZbF08grIof8W4BX44g0h8n+dgx+4Ir6ozN5WxHdn16lVLaEEwucz5JsVmAhBn
         kiCaxjIN9XuG7ewt4TSFTZueXld1hjBprFp33zsUw2JObWNk47O4slQ3I2LG19scaYEk
         NHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737592012; x=1738196812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8UQ8z/0aBXkaLgtIXqAt3iLBDoz00fkW/F0euausSo=;
        b=MdPv44b1AbzQ2nXJozivhuOZxF1iJLqhP9kMATuOKGGgfcDm9iSRQKSn3R2wTjhA2w
         22Ox1dlBZ5SXLqDwQtlVqsqEtQ1Tl6uDVmoLKX9XED38eY3VsBFavB5NKVAbXg1zpWHa
         hpvIsXcH1qMQr8OG8FyCk7MQGeqTLTfinVdMjctSWhr1LdPvhQcj7tZ6ML8zAkqVOd3u
         wrBS+VUjYUvGP/N3relaQqkOfPr+nckROnkCrIUfe2UxQJPnQR7G2l0NJAP8joZgag1P
         yhjTN8SxCrmeo6aZ7oRt7ULufpl0N7A+cI5SYFBmTTqb+V1jP9RrIsBc4XRw6ETtYoH6
         2u1A==
X-Forwarded-Encrypted: i=1; AJvYcCUGuMZhU8TSQ/NbTwVq7f5vdg80KW6ZQjyhy0Gy1rGDUGz49iPvDnBVPjV4HdQbD/s5+hf1rFR5C8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYvWfn+rcADg16b2xrwipMBFmRkzU919G4aZx/0zqOAyUG271B
	yWA+agYaXhzSOTkoZEh06JVxmsboPhpvsx8pm2bnSQzc1lO03kYVamLQpstS0A==
X-Gm-Gg: ASbGncs8l8SCxeoDIhrDrpPRJNjgt2pw+XsFMtvtcc57LwiqtCQkQnf/CthdYg720X6
	o+4Gp6xrZXK+qvTga+G2dB3m9xVlHcoycWnUtvPkfdMviGiXqrOtzBMKTvjgrpaWM81wQSX8ODX
	nZWA73AZmlv7SgFMiTkrrwezpsF32KCFHcxHla1BXh79X5oXgZxhDLLGcef3egAoKbKEAdH59DQ
	zkLiBHRs5ZpWF/MEQoAkv4BlKIJ9ztuepZfoG1iHbe5oa7ZQhr/j/VjaAQtY+wRjPf/+z+VkeVw
	s0aFMoTmvCqCHNgSkEKsroo3zfA=
X-Google-Smtp-Source: AGHT+IGAs311/hW8S+KiFpOkgvvAl4DP7ijP6ellT6Jac0JOyqN8GDVxZvg1DmxTPh4+tpR/dpHj0A==
X-Received: by 2002:a17:902:d2cb:b0:215:b74c:d7ad with SMTP id d9443c01a7336-21c356307e6mr368619815ad.36.1737592011359;
        Wed, 22 Jan 2025 16:26:51 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb9de7sm102927995ad.96.2025.01.22.16.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 16:26:49 -0800 (PST)
Date: Thu, 23 Jan 2025 00:26:46 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, linux-usb@vger.kernel.org,
	akuchynski@google.com
Subject: Re: [bug report] usb: typec: Add driver for Thunderbolt 3 Alternate
 Mode
Message-ID: <Z5GMxkahjL6pqklj@google.com>
References: <48dbbbab-3d09-4162-9d76-74c9baca6603@stanley.mountain>
 <Z305AQk4awMzPycL@kuha.fi.intel.com>
 <CANFp7mXEkESZ9Z6waroa_8zVv1PtBTWqfEFSzpzBZ6WEjLDa9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FxQeENCibRoZbsmu"
Content-Disposition: inline
In-Reply-To: <CANFp7mXEkESZ9Z6waroa_8zVv1PtBTWqfEFSzpzBZ6WEjLDa9A@mail.gmail.com>


--FxQeENCibRoZbsmu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Abhishek,


On Wed, Jan 22, 2025 at 04:00:47PM -0800, Abhishek Pandit-Subedi wrote:
> On Tue, Jan 7, 2025 at 6:24=E2=80=AFAM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > +Abhishek
> >
> > On Tue, Jan 07, 2025 at 05:16:43PM +0300, Dan Carpenter wrote:
> > > Hello Heikki Krogerus,
> > >
> > > Commit 100e25738659 ("usb: typec: Add driver for Thunderbolt 3
> > > Alternate Mode") from Dec 13, 2024 (linux-next), leads to the
> > > following (unpublished) Smatch static checker warnings:
> > >
> > > drivers/usb/typec/altmodes/thunderbolt.c:116 tbt_altmode_work() warn:=
 why is zero skipped 'i'
> > > drivers/usb/typec/altmodes/thunderbolt.c:147 tbt_enter_modes_ordered(=
) warn: why is zero skipped 'i'
> > > drivers/usb/typec/altmodes/thunderbolt.c:153 tbt_enter_modes_ordered(=
) info: return a literal instead of 'ret'
> > > drivers/usb/typec/altmodes/thunderbolt.c:328 tbt_altmode_remove() war=
n: why is zero skipped 'i'
> > > drivers/usb/typec/altmodes/thunderbolt.c:354 tbt_ready() warn: 'plug'=
 is not an error pointer
> > >
> > > drivers/usb/typec/altmodes/thunderbolt.c
> > >     66 static void tbt_altmode_work(struct work_struct *work)
> > >     67 {
> > >     68         struct tbt_altmode *tbt =3D container_of(work, struct =
tbt_altmode, work);
> > >     69         int ret;
> > >     70
> > >     71         mutex_lock(&tbt->lock);
> > >     72
> > >     73         switch (tbt->state) {
> > >     74         case TBT_STATE_SOP_P_ENTER:
> > >     75                 ret =3D typec_cable_altmode_enter(tbt->alt, TY=
PEC_PLUG_SOP_P, NULL);
> > >     76                 if (ret) {
> > >     77                         dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_P]->=
dev,
> > >     78                                 "failed to enter mode (%d)\n",=
 ret);
> > >     79                         goto disable_plugs;
> > >     80                 }
> > >     81                 break;
> > >     82         case TBT_STATE_SOP_PP_ENTER:
> > >     83                 ret =3D typec_cable_altmode_enter(tbt->alt, TY=
PEC_PLUG_SOP_PP,  NULL);
> > >     84                 if (ret) {
> > >     85                         dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_PP]-=
>dev,
> > >     86                                 "failed to enter mode (%d)\n",=
 ret);
> > >     87                         goto disable_plugs;
> > >     88                 }
> > >     89                 break;
> > >     90         case TBT_STATE_ENTER:
> > >     91                 ret =3D tbt_enter_mode(tbt);
> > >     92                 if (ret)
> > >     93                         dev_dbg(&tbt->alt->dev, "failed to ent=
er mode (%d)\n",
> > >     94                                 ret);
> > >     95                 break;
> > >     96         case TBT_STATE_EXIT:
> > >     97                 typec_altmode_exit(tbt->alt);
> > >     98                 break;
> > >     99         case TBT_STATE_SOP_PP_EXIT:
> > >     100                 typec_cable_altmode_exit(tbt->alt, TYPEC_PLUG=
_SOP_PP);
> > >     101                 break;
> > >     102         case TBT_STATE_SOP_P_EXIT:
> > >     103                 typec_cable_altmode_exit(tbt->alt, TYPEC_PLUG=
_SOP_P);
> > >     104                 break;
> > >     105         default:
> > >     106                 break;
> > >     107         }
> > >     108
> > >     109         tbt->state =3D TBT_STATE_IDLE;
> > >     110
> > >     111         mutex_unlock(&tbt->lock);
> > >     112         return;
> > >     113
> > >     114 disable_plugs:
> > >     115         for (int i =3D TYPEC_PLUG_SOP_PP; i > 0; --i) {
> > >                                                 ^^^^^
> > > These should be >=3D 0.  Humans are bad at counting backwards.
> > >
> > > --> 116                 if (tbt->plug[i])
> > >     117                         typec_altmode_put_plug(tbt->plug[i]);
> > >     118
> > >     119                 tbt->plug[i] =3D NULL;
> > >     120         }
> > >     121
> > >     122         tbt->state =3D TBT_STATE_ENTER;
> > >     123         schedule_work(&tbt->work);
> > >     124         mutex_unlock(&tbt->lock);
> > >     125 }
> >
> > Abhishek, this looks straighforward, but just in case, can you take
> > look?
> >
> > thanks,
> >
> > --
> > heikki
>=20
> +Benson Leung +=C5=81ukasz Bartosik can help with a patch to address this
> while I'm out on baby bonding leave. As you noted, they look pretty
> straightforward.

Thanks Dan for the report on these. I agree, seems simple to fix this one.
I'll take a look at the others in this file too.

+Andrei Kuchynski as well.

Thanks,
Benson

--FxQeENCibRoZbsmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ5GMwgAKCRBzbaomhzOw
wlW6APwMQzHymR5zqJ/QCk0NdmqO/4SUCw0dIqXpEdX7NcyvkAD+JeIr36LP27dS
bxwbteTR16biwWMClGRn2l1UYnAxaw8=
=HPjo
-----END PGP SIGNATURE-----

--FxQeENCibRoZbsmu--

