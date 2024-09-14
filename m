Return-Path: <linux-usb+bounces-15115-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA860979366
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 23:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23B88B2200A
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 21:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7485813A250;
	Sat, 14 Sep 2024 21:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dm6aB36d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ABF129A78
	for <linux-usb@vger.kernel.org>; Sat, 14 Sep 2024 21:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726350668; cv=none; b=e15qjJtLlWQCjhG27+qTWwxaztzdUAP1VIXhGTdZxG/v2/hBPPTqRLy49N2Bfz+EBoMPTF/wabQaYFwVn3e77Gk5V5++JSZaS/c4BPKC17RB5vkPM3js8jP89dfdp6S2ggh2OaOFRiovywtBCnbuqA5bg1Enuy98OaN72+7fstc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726350668; c=relaxed/simple;
	bh=oECQKR+o7oR4aWVTxUqVAlb9CGCNswo07bNaGltmOmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFFoyke37Hz0e3lPAx1GadXTLwSKrOSzFryacSIT1we25OkuaEgksxXkttqLP0BTbNAOnoyOm5AcdmIUC5rwJssepaqpEpW5Y43gQNeTDvQaj5P91uqgZd3b5z4qe+8DH+BzXRiHuaeFludXHxefhvCa34k3WP7QkkZeAWlZJMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dm6aB36d; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5365cc68efaso3385000e87.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Sep 2024 14:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726350664; x=1726955464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfmpYUKiZBoYJxaXCZNOzoEowtv+ye5+GIly97iMOVc=;
        b=Dm6aB36dCe8oz4jtuMZc/FkqDl+7kwqYin7lB2B7HGYOaS9EXKUTh5iNe1Iz0zbEJO
         eiQuC7dJtRh1zubvOVB7hRbm0ysLo4Hci9/wF8/O9+7tkqiVh2Wn+nODcPbSlsYjankh
         qH7hZjKr8G5LCmE4RUdXzlzye8l1Lu/glfHBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726350664; x=1726955464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfmpYUKiZBoYJxaXCZNOzoEowtv+ye5+GIly97iMOVc=;
        b=M5iWvHyWfhi9jVD6VOXngHdMer4TgvB1PJG9vrplQmT8kjw8D3MyWg0n0y6Zj2cdw2
         vDU+jWDhEWJXiruRnsyB27owhr5dYqYgiVzAIZAngaeAOnUjXVlgMvf3CMPDz9y8oVlm
         jo61iw0J/C7c6QAh6gLkYoMVzYGRyteNqvU1hS/raCtkUnqQU3DME5Tru4fN4lVM2mr8
         /IjB7Di1nwa5u+Z9AfCTYDkfvwFH8rAYiKoMyCMR/6BXeKGzA7DSyxgdlpoToWuz3cGT
         c53iJdHH5u7/tGhKGGhNPlVr74ffUJhtwzGYikiGSyC6MEtcBefv6bp4csngjT6ob0Az
         gerQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmadK/Fz560PdEqDfRlpP0a+i8WetlN1qooyEJ9/Uh1A/d4S0eTdmBcRTbW8ZYZxxhz3eEfdw/iB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhxaS+z9DlU1Qqbjqp2KrYky4fFTShYcYad9Ch1G3SVn1Pe2nf
	xW5Gt59cWPqZ+PkoOFDpPmXTJTRwcG/9TsBRjxIAW3TwE8trZruT1M4k4aGLg28lroPTC6PlaCi
	YuIcRbsSLp10MlOAWPK9ujGlwRG1ZhoeIHyI=
X-Google-Smtp-Source: AGHT+IFgSycBRnWfO8N5uMnakNDOmBrL2NCJapreoOOW7tcXkT2z4Ms9//OPjSdwxF5awDRUkJU7rCo715tyOjYkGZI=
X-Received: by 2002:a05:6512:3f0d:b0:52c:88d7:ae31 with SMTP id
 2adb3069b0e04-53678feb54cmr6326788e87.48.1726350663255; Sat, 14 Sep 2024
 14:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-5-ukaszb@chromium.org>
 <ZuGZNyJkIreUhoc0@kuha.fi.intel.com>
In-Reply-To: <ZuGZNyJkIreUhoc0@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sat, 14 Sep 2024 23:50:52 +0200
Message-ID: <CALwA+NZuR3M=rMACWJLch8OMPUQ9W1MBcbjNtOjSrqb-oXBMmw@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] usb: typec: cros_ec_ucsi: Use complete instead of resume
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 3:21=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi =C5=81ukasz,
>
> On Tue, Sep 10, 2024 at 10:15:23AM +0000, =C5=81ukasz Bartosik wrote:
> > From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> >
> > On platforms using cros_ec_lpc, resume is split into .resume_early and
> > .complete. To avoid missing EC events, use .complete to schedule work
> > when resuming.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/=
ucsi/cros_ec_ucsi.c
> > index 20e608097fc6..422b3b14028c 100644
> > --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > @@ -241,15 +241,18 @@ static int __maybe_unused cros_ucsi_suspend(struc=
t device *dev)
> >       return 0;
> >  }
> >
> > -static int __maybe_unused cros_ucsi_resume(struct device *dev)
> > +static void __maybe_unused cros_ucsi_complete(struct device *dev)
> >  {
> >       struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > -
> > -     return ucsi_resume(udata->ucsi);
> > +     ucsi_resume(udata->ucsi);
> >  }
> >
> > -static SIMPLE_DEV_PM_OPS(cros_ucsi_pm_ops, cros_ucsi_suspend,
> > -                      cros_ucsi_resume);
> > +static const struct dev_pm_ops cros_ucsi_pm_ops =3D {
> > +#ifdef CONFIG_PM_SLEEP
> > +     .suspend =3D cros_ucsi_suspend,
> > +     .complete =3D cros_ucsi_complete,
> > +#endif
> > +};
> >
> >  static const struct platform_device_id cros_ucsi_id[] =3D {
> >       { KBUILD_MODNAME, 0 },
>
> Please merge this into the previous patch.
>

I will merge it.

Thanks,
Lukasz

> thanks,

>
> --
> heikki

