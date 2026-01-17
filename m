Return-Path: <linux-usb+bounces-32459-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE24CD39096
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 20:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B3AC301E174
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 19:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1C32DF128;
	Sat, 17 Jan 2026 19:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uqb9loSo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B712D7810
	for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768678508; cv=pass; b=Op12YsR21x1O4FPSyWSGP+y38dyS5CQf1gJpKYIKGy3/QLIWECk+zHeTbVet3drhnsr7PQhQugRQGE1MEU+zCA1ZnOY+hzQ87VX6CdSz4xCOY2TOGv3kiEACSf9In8i9Qlof350T4kR73C/ssipJjyxnTpah9lthdwaeHF0T2a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768678508; c=relaxed/simple;
	bh=TqFVyyk6gTWcdPPR/kpD6NILCI0ocp7uuvScmO5LREY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srpjqu12A8YFKOYHAQC+tYnSY67h2b3IqTIr/AB02EVnSYpjFv7k1gNDvhRdiC2ttkO5zrvwTBmnAIJ811m9+HennE+Lr0TOPQecasMa1Cgk0OJGV39ErStbOaNie6MoQqLrpPZWSkiWUhCdzlmQcRR1K5ykmp9e6fzeQJUjtWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uqb9loSo; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0a95200e8so20207615ad.0
        for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 11:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768678507; cv=none;
        d=google.com; s=arc-20240605;
        b=hx2y/MxZkNvkPaLNK9ICo3hzi7+0PMSnlykzIicFmoW8AyN+cat4H2K53+tMOctG+f
         KbxnRoMYlGQd2TavEETTHMK3W/d8NPSDfGblL2p8JE4ESRMWZC8/j7T6vj5389VIN71q
         zZQosD79EGxHlMFcKBzxv9xN9WVrvni1jKNrt/rNyVLXJTy9MluMjE9hQDgWYzU+G+u3
         DP2TH4HQnOfniKZRS2TUM93YXZKIYdZzQrz21KPejFmdcofkO82vowxtev2YG2dwYMKD
         I6NjBf+xH4HeynGFyGhJdLUzwhxLRlPLWLX8OhEJqvPq27hfAZ6O2v2mpSfGbwbsahW2
         BEiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sBJUYern0gP4g1kXsrl0YD7ywgpzAWw+KQJMDqXrH9M=;
        fh=LYnWFNFs/1SQeJoyOQmsUhFGfK8BqO1rotlUzPj9NMQ=;
        b=d7+GBMNEjm20cNQRFu4t8FdZGeGMaOKem74P1PDdK5BdJy0sH4SnE+s5y2OLsN1S+z
         PdVaMJhZhQpP4i1fbdrLc1l8G85//ZtcZseKjOczl4FzlZV30L0kDLTMI2jAcexNojQB
         97hErWaZxQYo/Bp8XbD6pr3pUA5ZFWOrFp/HM+Lue2wwpvrRG5+mJYxczOdi+doa3m2t
         pRRv0UojE4Ypf2QiorlrIQXxCHX92V3p8VEIzC0B66UIhgwg+UgfYQstLICSKb0wsbni
         MjEwDS2bpG+02Y471l+A9wOuBWbgjNss77q9+UqI5gz1I+A+eO6Qs8bmwUeRe3SutHvj
         8s+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768678507; x=1769283307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBJUYern0gP4g1kXsrl0YD7ywgpzAWw+KQJMDqXrH9M=;
        b=Uqb9loSoGcRlIxgXTYNx8baTO18TqEMtsHosqgYfwS5iPXGrNQR/lsmV0E62Fnq7rb
         EvEKG2xmIkUFEqlJV8CsSrq52n6R2/hx6PCoSazsc0KUL46tHDZtjY78f1Vtiio+Rlek
         4ckCIxTLoZw6rIJsa0Jw47nWhWish87ubRv4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768678507; x=1769283307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sBJUYern0gP4g1kXsrl0YD7ywgpzAWw+KQJMDqXrH9M=;
        b=vfMK76Gcy4eUfX1vRQEwqEce0UaR8NgO24g+Iyk92d0vuVGprLL7yvY5HY930qFxQm
         0TjnxU+MA2K9KfnlKoBfLGaGzraztx87ImA5M3EHi3MO2E3nfVCyRJcjOmgVSFDmA6vM
         pb0awOBJWncZGl+elydm4XJ3fGpDcOsUpYMNRVyJR3146EZAqi5UUe0A422bIXar4Tzn
         ddRtZyZ1dUe7YhZ6w2BfTBfMVFz3Y5gZB2rxL4K1WFw77FMHdqp7k2GMnyIxdL0WRwY/
         lncKspa5Z7bmzT86BY7lhVcTE8SZ4F/GSz9lmFf5Qy10rKilnhR4zMLcEOuxH7y1fBVS
         2CFA==
X-Forwarded-Encrypted: i=1; AJvYcCX8lQyVkbJJvdaNMNj5yaNqMNdUhdkKDsuPR101a7flGEpDdTGTryTLAHDNvuQnIN2Y0AQ+xd5qNZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRvt05GHR3yyP4G1+5tFYA7/MhoXoRZKhSYS/UZh+MphQYM/Am
	dldy2RhiNIrUEJ5j4sh/p/MT6q4WU1ByTTF5pnGMchE4YG5jxOfDCvbq7rJfHAcoRk1FtVTiwKV
	JTb4ydLgjcbgQ2O7m4AfbIKrDJHV+z3QsHa8RO30/
X-Gm-Gg: AY/fxX6uRW626xtqgl6D+80loC2WV2c1XH15VaqcqUmrX5DeX8VwXpTuTCa5h/TXHAy
	g90jiavorX2VyFRgKpKmnLEgT+Z76oQ30AIEUbPCsqe5HWWE8D107fjhTLE67gOCQ/Ak497TZV0
	K4ac7n5Pbk7N+BzB2Wuy6mA/ES5zQSgdLvHZ8BYNUaYJmZltTLEItltEfi0Po+IIW7LD/9GNkcS
	hxmMd3BxShMyZwxtWdYzKGlcEyHUhPu4DK/eqrv1ch5qeKcJYXQ6rkr6W/xH+FOkIrlFQ==
X-Received: by 2002:a17:903:11c7:b0:2a5:8e98:1b44 with SMTP id
 d9443c01a7336-2a7175a637emr63427135ad.31.1768678506782; Sat, 17 Jan 2026
 11:35:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113130536.3068311-1-akuchynski@chromium.org>
 <20260113130536.3068311-8-akuchynski@chromium.org> <aWkAx-QjfwQGJ6Eb@kuha>
In-Reply-To: <aWkAx-QjfwQGJ6Eb@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Sat, 17 Jan 2026 20:34:54 +0100
X-Gm-Features: AZwV_Qix8YRb3f7h2HG8Ncj6wtivEszSjSskjFE8VN2Lt4Np26OhSDfbOXSzbOM
Message-ID: <CAMMMRMcpuaTpJ3=zO0SafaeRPxTkAEEQrS-mDRKFBTc3yESM6A@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] usb: typec: ucsi: Support mode selection to
 activate altmodes
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Johan Hovold <johan@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 3:59=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Tue, Jan 13, 2026 at 01:05:35PM +0000, Andrei Kuchynski kirjoitti:
> > If the ucsi port driver supports modes selection, it should implement
> > `add_partner_altmodes` and `remove_partner_altmodes` ucsi operations. W=
ith
> > these operations the driver can manage the mode selection process.
> > Once partner altmodes are registered, `add_partner_altmodes` is called =
to
> > start the mode selection. When the partner is unregistered,
> > `remove_partner_altmodes` is supposed to stop any ongoing processes and
> > clean up the resources.
> >
> > `typec_altmode_state_update` informes mode selection about the current =
mode
> > of the Type-C connector.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 11 +++++++++++
> >  drivers/usb/typec/ucsi/ucsi.h |  4 ++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index deb210c066cb5..4a6e23b55b10c 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -314,6 +314,7 @@ void ucsi_altmode_update_active(struct ucsi_connect=
or *con)
> >  {
> >       const struct typec_altmode *altmode =3D NULL;
> >       u64 command;
> > +     u16 svid =3D 0;
> >       int ret;
> >       u8 cur;
> >       int i;
> > @@ -335,6 +336,10 @@ void ucsi_altmode_update_active(struct ucsi_connec=
tor *con)
> >       for (i =3D 0; con->partner_altmode[i]; i++)
> >               typec_altmode_update_active(con->partner_altmode[i],
> >                                           con->partner_altmode[i] =3D=
=3D altmode);
> > +
> > +     if (altmode)
> > +             svid =3D altmode->svid;
> > +     typec_altmode_state_update(con->partner, svid, 0);
> >  }
> >
> >  static int ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid=
)
> > @@ -609,6 +614,8 @@ static int ucsi_register_altmodes(struct ucsi_conne=
ctor *con, u8 recipient)
> >                       desc.vdo =3D alt[j].mid;
> >                       desc.svid =3D alt[j].svid;
> >                       desc.roles =3D TYPEC_PORT_DRD;
> > +                     desc.mode_selection =3D con->ucsi->ops->add_partn=
er_altmodes &&
> > +                                     con->ucsi->cap.features & UCSI_CA=
P_ALT_MODE_OVERRIDE;
>
> Can't you just use that con->typec_cap.no_mode_control flag here?
>

Thanks. It looks much better.

> Maybe also consider squashing that patch 3/8 into this one while at it.
>

I agree. Patch 3/8 was part of a mode priority series. Now there's no
point in leaving a single line of code in a separate patch.

Thank you for your review of the series!
I will send the subsequent series with all the changes.

Andrei

