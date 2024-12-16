Return-Path: <linux-usb+bounces-18539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 084A79F3A32
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 20:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 467927A14C8
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 19:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C4E20C48D;
	Mon, 16 Dec 2024 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G0uSI67V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F3206F2B
	for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 19:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378584; cv=none; b=Xd7tHFI8L4D04vzib1cCa/IV43g/J3C9hqeRMLKCt4gY36b2nm2opV3E7hSOUrmZ2C6dHMEFk8UGRKiPPoZhqnSg023iO3yya/tSsLTVZ3m2oGMPIWj4GJeR5cz8E/S1KA+HV8F1a9wLzv1HYGt4cld6WzoTziMOeqIGaQ7Xm6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378584; c=relaxed/simple;
	bh=yiOfUbb5jpBoALuu9emFj0aPP8HuZJFUHwQAFjsas1o=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSX7dGxlcqwxj5aH51TpmlS5I1hzQHU/usvoYyz662eJDhVZI4hhFUpEZkLsgKA9P4sZmByT68aQsPAReS30eiKLy26n8TjMSzY9OuHyh2KcZn2XpDXTR5Mdnij1wMO0t6kiAL+/Cc3RIt8dn7sjwsqh1bL9nH6vs/IbX/+YhHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G0uSI67V; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b7041273ddso207173485a.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 11:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734378578; x=1734983378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LNy2uYAQLvX7Yum35lwl6aWibHIIBXzf8t75pVbhXI=;
        b=G0uSI67Vbf4lTWeotWefQXMYjNmrRlp8VH4GJ1Mrr4dS/tz81QNga5lSk+zTG3HKbD
         +QKk6Ga2Ak0yakh3Z/8FZjwdKlHbY+63cBS6WtW/dk7fZj+QvSDVJxNmtI/WPrl0Rm8M
         uMhCuBGnXOAMeT6Wp9BlI7BNXyvJMjGB6Mn7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734378578; x=1734983378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/LNy2uYAQLvX7Yum35lwl6aWibHIIBXzf8t75pVbhXI=;
        b=jWzp+jM6SUxveEjA/Kw6Q3qqNOeN3WLR8ZWsH4o3PWeJ12ITwBm44o4B44SajUPo84
         1i/AezGof8woP8VSSBSxudM60VX9cZl4CuDr2XmqDs+Uyxo4uA7+8XTpXfA1MvmfgkCQ
         WnTslNyDiaaoXBASIfimeI/MWWtplvCKDKziH8osSio8u6QIcuQOlBKWtruA10zHsvCq
         ZkQyMRGtQWapYkGyZZgswu4PLR5J5Ad+I79KPi1TbBpl+apSFxRKvGN0wGLrm3pidtft
         K59MS09Bp6Uuenip9vL2mLGsMiqOHX03RGrrHS7NHibi3xg8b6joUphujHhAOWo43Wmc
         4kfg==
X-Forwarded-Encrypted: i=1; AJvYcCVxWQbv4FfZw6b0sUdvmxLNBEMUwVnjPQWgJrNRTXQLmrIHpI44WrGuvLyPjDDRt/FVbAmXpNwV3tE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUG6H9avx0QKQpUT3uEzHM53uEidQ0eDVYnI4MyQ+5T5pl4yTb
	k1mA+xfjrqtBTBtxFAnAyQ98FghUtahFQ3cI382IlDu40Y39R2bDL1mmER0IY+nB+1i2c0u44QW
	7jJlq2yv/SRwOI3kzCR20Lgr+menUsZ1c5oPN
X-Gm-Gg: ASbGncsj3BHeV2K1D/NEeIMsyq57Ix1U0e7v7RkOoXs9mhBmVuAW+kQvU3EgqRcIxdd
	xt5IYEyRaXaN5/rsJ//gwF0jIBYdgvYCseqmZ9dGubHgWQMl+2TwA4s8p9XVqNf1n+A==
X-Google-Smtp-Source: AGHT+IGohp0hGmz6f/D7NUUpgkTIS1kh1HZGfm7WOqi0KOo6p1jF3/g/6k7Mgcwm72Mk1bPLFZ1ljnrq+DyXufRmGLw=
X-Received: by 2002:a05:620a:370c:b0:7b6:7863:cbc4 with SMTP id
 af79cd13be357-7b6fbee76e4mr1530415685a.18.1734378578189; Mon, 16 Dec 2024
 11:49:38 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 14:49:37 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANFp7mV75SpTAyh=A4kZA2=NWi7+ry0+W+a5kpcjLrPwyhJ8UQ@mail.gmail.com>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
 <20241206153813.v4.5.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
 <2bfe74d6a29ca13a7f89f116a2f0c6be.sboyd@kernel.org> <CANFp7mV75SpTAyh=A4kZA2=NWi7+ry0+W+a5kpcjLrPwyhJ8UQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 14:49:37 -0500
Message-ID: <CAE-0n50jvejyc1HO62mDBCCoV8eT3uL9sgu2B=ZeSHKxv=w+SA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] platform/chrome: cros_ec_typec: Displayport support
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: chrome-platform@lists.linux.dev, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, tzungbi@kernel.org, akuchynski@google.com, 
	pmalani@chromium.org, jthies@google.com, dmitry.baryshkov@linaro.org, 
	badhri@google.com, rdbabiera@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Quoting Abhishek Pandit-Subedi (2024-12-13 10:33:19)
> On Wed, Dec 11, 2024 at 1:58=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> w=
rote:
> >
> > Quoting Abhishek Pandit-Subedi (2024-12-06 15:38:16)
> > > diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/p=
latform/chrome/cros_typec_altmode.c
> > > new file mode 100644
> > > index 000000000000..bb7c7ad2ff6e
> > > --- /dev/null
> > > +++ b/drivers/platform/chrome/cros_typec_altmode.c
> > > @@ -0,0 +1,281 @@
[...]
> > > +struct typec_altmode *
> > > +cros_typec_register_displayport(struct cros_typec_port *port,
> > > +                               struct typec_altmode_desc *desc,
> > > +                               bool ap_mode_entry)
> > > +{
> > > +       struct typec_altmode *alt;
> > > +       struct cros_typec_altmode_data *data;
> > > +
> > > +       alt =3D typec_port_register_altmode(port->port, desc);
> > > +       if (IS_ERR(alt))
> > > +               return alt;
> > > +
> > > +       data =3D devm_kzalloc(&alt->dev, sizeof(*data), GFP_KERNEL);
> > > +       if (!data) {
> > > +               typec_unregister_altmode(alt);
> > > +               return ERR_PTR(-ENOMEM);
> > > +       }
> > > +
> > > +       INIT_WORK(&data->work, cros_typec_altmode_work);
> > > +       mutex_init(&data->lock);
> > > +       data->alt =3D alt;
> > > +       data->port =3D port;
> > > +       data->ap_mode_entry =3D ap_mode_entry;
> > > +       data->sid =3D desc->svid;
> > > +       data->mode =3D desc->mode;
> > > +
> > > +       typec_altmode_set_ops(alt, &cros_typec_altmode_ops);
> > > +       typec_altmode_set_drvdata(alt, data);
> >
> > 'data' is of type struct cros_typec_altmode_data here
> This should have been allocated as cros_typec_dp_data. Missed during a
> previous refactor that changed the type from a union to this format.

It would be good to have the cros_typec_altmode_data member be somewhere
besides the first member of cros_typec_dp_data so that this fails faster
when stashing the pointer into the drvdata and treating it as the wrong
type on the other side.

