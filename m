Return-Path: <linux-usb+bounces-15121-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 052909793D2
	for <lists+linux-usb@lfdr.de>; Sun, 15 Sep 2024 01:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 859521F21E81
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 23:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D52C145A09;
	Sat, 14 Sep 2024 23:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MAistcia"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13EE13EFF3
	for <linux-usb@vger.kernel.org>; Sat, 14 Sep 2024 23:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726357432; cv=none; b=QpAA8tEc5/Cd2eH0UtLLT0FEhI0JkQzpUOtqrWyP0EQIOGxqAXM39YMvVEd2cdkUhyBXHilT52S77GecpTmnTh+5JEm9ZVuVd4zxJlNAj/Mw6Wx9PkOIn4roRAa/6rZGBBVaC3kgJsDnqJFffGYzlBA9+dgdo3OPITSNk5YvjvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726357432; c=relaxed/simple;
	bh=t1aExyFjz98/zA5xARPP+uj1Od5zhESbswgoCwcbbZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2Vu+avy792WXeCoZGOAAkLCeQ6rSU1zkyVWcwDpvVLOk3wVUH1X3UKfeHGpUHGW47/oCVrTmAWjoc2u+MGOMtyXcm0bfa8vjGodl3MUnD1O28rsEXsj+RGdB7jO4ZaEcuu5tCSos3BMEYSh9xC/9vpmcosUgZV8WjhwDdMqkNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MAistcia; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5356bb5522bso2633579e87.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Sep 2024 16:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726357429; x=1726962229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGYWLlguSdnKQtisEXngNTszohi1t3W+x1ViuQ9Aq3c=;
        b=MAistciaomGjcaIkjjj+FgkXfBbNM2fIniXla2gQ4DQSun3r4hFv9FOn6qkOvHlVy8
         nm6DH3xTwgZ8N8bsi20BMDdLQpk7ffp1xlygYteMFe8zVgt0IyBxjU3TMrWxIuwBG18o
         +CQfOZz5ifqeeL8wv/unthXgQI7s2GIoXWZnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726357429; x=1726962229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGYWLlguSdnKQtisEXngNTszohi1t3W+x1ViuQ9Aq3c=;
        b=q75bg7kojmMWm/2V0BZRezHyJ7RYJPqEylXEw+84x2iPx8WVYqTlCZAqOfWpBCxLkK
         MOx49TkHgto5p5GynX2Lzhbc8rOI0Pmwr1A7zQlicU5Wjhp4qcJISAovIgG3eGdyEqIl
         iG8eLrEe5K4IZmmA1QSJLajy34kabcEyz55C4/s8rG55rzVUrmCItNoV8DdVfpN+Q5Yd
         pceeo/nc940zznm/S+hI5zFDVogmQ7RvP+Nfki9RRntt1pBXrOerp5DzCx0q8XpamR0X
         BQvwvZ9GnzXvsJXV9lshiXs8mWkrwAcI/lDy2DTf8vh86flAbvATKnEir9jXE6VSExAI
         x0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWF92pqmMm7HmUtCfYLl6E6zBPkT1YjlMpEJSAciJnPLoX9Odw4wUF7r4pxg4IG1QOUSeOUo6Ail2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8n6aYBLHm66VkfcOG/dOd1J1JHC4ZHoSYMPEnmFPYkFidNwDH
	s2CrX5rE6r7a5IPIrlWs+KiWAoRhjmeQZK/wIRK55v4NmSRWXS1sDLzzhyz6XehpTbAfSFWR/9P
	ctc4Grb/Ux5/QYRweo4RDF5tOF+2oqacU1Hs=
X-Google-Smtp-Source: AGHT+IE/h8etWleI1971X/m56jcmQZ1SGmNJF4Yoxv61MOhR7T+Z3qSUcd4rmrhLXNVUkw0nSqhkEbXct45s8k02zBQ=
X-Received: by 2002:a05:6512:138a:b0:533:4477:28a2 with SMTP id
 2adb3069b0e04-5367fecbf90mr3951036e87.16.1726357428129; Sat, 14 Sep 2024
 16:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-4-ukaszb@chromium.org>
 <lqs2y5gvsaij5rg4o4krruseuijinqgzky6kiorjegham4aumq@fx2doq5j7wkq>
 <CALwA+NYC82pJHGmZXnOsWJvg0yJb3aKjLi7V32Kgb9QPtZQTyg@mail.gmail.com> <CAA8EJppnpu86PzwrsLmjA-3gR-ybaaX49d9uZe4iCUeVnTuCfA@mail.gmail.com>
In-Reply-To: <CAA8EJppnpu86PzwrsLmjA-3gR-ybaaX49d9uZe4iCUeVnTuCfA@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sun, 15 Sep 2024 01:43:34 +0200
Message-ID: <CALwA+NbwMigbV+WQV=Jm4JVApWQO6XOh0Yx-QdVsnf8L9Qrh=g@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 1:03=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sun, 15 Sept 2024 at 01:50, =C5=81ukasz Bartosik <ukaszb@chromium.org>=
 wrote:
> >
> > On Thu, Sep 12, 2024 at 2:58=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Tue, Sep 10, 2024 at 10:15:22AM GMT, =C5=81ukasz Bartosik wrote:
> > > > From: Pavan Holla <pholla@chromium.org>
> > > >
> > > > Implementation of a UCSI transport driver for ChromeOS.
> > > > This driver will be loaded if the ChromeOS EC implements a PPM.
> > > >
> > > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > ---
> > > >  MAINTAINERS                           |   7 +
> > > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 273 ++++++++++++++++++++++=
++++
> > > >  4 files changed, 294 insertions(+)
> > > >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > > >
> > >
> > > [...]
> > >
> > > > +
> > > > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > > > +{
> > > > +     struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > > > +     bool ack =3D UCSI_COMMAND(cmd) =3D=3D UCSI_ACK_CC_CI;
> > > > +     int ret;
> > > > +
> > > > +     if (ack)
> > > > +             set_bit(ACK_PENDING, &udata->flags);
> > > > +     else
> > > > +             set_bit(COMMAND_PENDING, &udata->flags);
> > > > +
> > > > +     ret =3D cros_ucsi_async_control(ucsi, cmd);
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     if (!wait_for_completion_timeout(&udata->complete, WRITE_TMO_=
MS))
> > > > +             ret =3D -ETIMEDOUT;
> > > > +
> > > > +out:
> > > > +     if (ack)
> > > > +             clear_bit(ACK_PENDING, &udata->flags);
> > > > +     else
> > > > +             clear_bit(COMMAND_PENDING, &udata->flags);
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +struct ucsi_operations cros_ucsi_ops =3D {
> > > > +     .read_version =3D cros_ucsi_read_version,
> > > > +     .read_cci =3D cros_ucsi_read_cci,
> > > > +     .read_message_in =3D cros_ucsi_read_message_in,
> > > > +     .async_control =3D cros_ucsi_async_control,
> > > > +     .sync_control =3D cros_ucsi_sync_control,
> > >
> > > Please use ucsi_sync_control_common instead.
> > >
> >
> > I will use ucsi_sync_control_common. Thanks for pointing it out.
> >
> > > > +};
> > > > +
> > > > +static void cros_ucsi_work(struct work_struct *work)
> > > > +{
> > > > +     struct cros_ucsi_data *udata =3D container_of(work, struct cr=
os_ucsi_data, work);
> > > > +     u32 cci;
> > > > +
> > > > +     if (cros_ucsi_read_cci(udata->ucsi, &cci))
> > > > +             return;
> > > > +
> > > > +     if (UCSI_CCI_CONNECTOR(cci))
> > > > +             ucsi_connector_change(udata->ucsi, UCSI_CCI_CONNECTOR=
(cci));
> > > > +
> > > > +     if (cci & UCSI_CCI_ACK_COMPLETE &&
> > > > +         test_and_clear_bit(ACK_PENDING, &udata->flags))
> > > > +             complete(&udata->complete);
> > > > +     if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> > > > +         test_and_clear_bit(COMMAND_PENDING, &udata->flags))
> > > > +             complete(&udata->complete);
> > >
> > > ucsi_notify_common(). Why are you ignoring these functions?
> > >
> >
> > I have missed these common functions mainly because our baseline is on
> > the v6.6 kernel.
>
> Please, don't send patches based on the old kernels. The development
> should be done on the tip of the maintainer's tree.
>

I should have been more specific. I always rebase to the latest
upstream kernel and fix any
conflicts and compilation errors before sending patches to upstream
review. But living on a daily
basis on the v6.6 kernel caused me to miss the common function you pointed =
out.

Thanks,
Lukasz



> > I will use ucsi_notify_common() however I noticed one
> > major difference. The ucsi_notify_common() uses test_bit while above
> > we use test_and_clear_bit. I will send a separate commit to change
> > test_bit->test_and_clear_bit in the ucsi_notify_common() because usage
> > of test_and_clear_bit fixes possible race condition.
>
> Ack, thanks!
>
> --
> With best wishes
> Dmitry

