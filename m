Return-Path: <linux-usb+bounces-17689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1729D0E67
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 11:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3226FB2DF40
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 10:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ECC199239;
	Mon, 18 Nov 2024 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SF171gfb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D2B14EC46
	for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731925289; cv=none; b=E5N98FPMjAcTT5spmfneb3V+DhwbF8HeWHqeZ0x14cOUWuHHd0cS8oLiNGWiKidvjh77q83NSH8kldDiuht32XUQzzbz7ZpsiTsUqhZSh1pAAS71MuhSxvbQgwwacj+Y0hZ3JjJSgdyDNS3bfwI0ewdmSeEFNYHRXLRRwnDqwE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731925289; c=relaxed/simple;
	bh=sd016sCBJfb88am3DbzcElkEwO9V0P/s5+WQGfeBA4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPHsTrHMvhDzPhlxU3Ge69wffKGL7SLVZSv9l10lMXxU1VCBGpGqrC+pOCgbk1t1dYRxiVMNLxFhVZTIQZ1m/Ag2j2xuJHwlvjedkAbWW76yjUz3dqQoL822aTgLQwC5aDlkmgAqbUt/QwKlZCBaMesHtd6GxcW8AI+A5oiBPTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SF171gfb; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e387e50d98eso1439200276.2
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 02:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731925285; x=1732530085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGAmloFJZwqEfGCBDB/SiGy4L4CBzw6A2P/0V8ZEqWg=;
        b=SF171gfbbbvThG03m8NkL3j7Yx9UF95W0R3gACbrst5CAJbSUXWMOC7rWdyPWoCe+2
         wV6JjnPFTz14AXPqLTDcxAJcNx9bRObCCi79Zzx5fjhQHJWPR0RaSlSwB93AW+eOuts3
         j6TpUlp6v2N6n/qbZPWrtJt/fZRuHSZzevYnxbODm8gPM4P0zbhJ1zrzlVk0V0q5RMv+
         CmMYbzosn2B1vif7b9zSFFvlFDdT2aY32sWgzmkLKMAWD9KX15Fk8AZ5KFMvP5glu6jj
         JOdDIYGMnApVc8502A/RDC8wxB8QqobiK8v12EMThBNGrkDDXmmPPlsA8OaJlcQcPnJu
         O5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731925285; x=1732530085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGAmloFJZwqEfGCBDB/SiGy4L4CBzw6A2P/0V8ZEqWg=;
        b=PqxT5ToI+uKocn2t/AsVFFFjRnwTwp9aVFX37CtDlVoIcUdnag2x9UYG0N2A2QEt0M
         +Qu28t+VQ406hAqiZitd3AuRNaw67GCxgqtkhVef1z5OsOtLiSavrILIaBQUeoGGzUsp
         50CcNiCZGiRLmtGqRoMDp2azSa/Ra7fcG/S6tEeN36g8+/qUIAEi49UiBJ/tz8hGhvJ5
         VVs3CjM6Siter+vC0J8pg6dNwCeLzJRxi9yoa5d59fxrTC9gZ96jK3H3LsUv3A34tCy+
         eDeoAq7CkVe7jU6YAcLtAHxuoMg+v4VceruzXD1BzldBJd5EnCg7RevewXeo2enFZoFk
         H6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUuzRB++TwBsImTJOBsMtSflQ7Md1I0I3BdfckqN23ALOUtmRxLBClNJvOBSaeIQm5IkkE/K1Zbjhg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1UZzYQmXhxh7uadkraDq4F0X1K3wl9RWc/vNobHLGDKtQZXm7
	YSDv3BQ4qkGyQDdNstb1d64wwUTfn48TLD6m9woUPdCCCvgqLnZdQeg2v/BeHOuvMzHhVwa8ZDS
	8et0cMWJoua57lrG7UFjchDOSAsNFBXiyOB1L6Q==
X-Google-Smtp-Source: AGHT+IHUV7nxErC61X8JgrHdT/UZbzGvKp+upG0P4PiTofkB0/x45MaJPVaMPamahCvmqsHpvRA8CPGFuKMbHEg9YvU=
X-Received: by 2002:a05:6902:a87:b0:e38:b1d2:e79f with SMTP id
 3f1490d57ef6-e38b1d2f0c1mr206319276.28.1731925283825; Mon, 18 Nov 2024
 02:21:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115155234.1587589-1-ukaszb@chromium.org> <20241115155234.1587589-3-ukaszb@chromium.org>
 <jatq645z65hthaud4up6h6mxbggqpm73djtd6t3fxxkwccsifu@bb7bn24b7dak> <CALwA+NZ16WigkZuTwsRzDNC96OOR=+ZA-_UxtMq=fTWJ23a_Ag@mail.gmail.com>
In-Reply-To: <CALwA+NZ16WigkZuTwsRzDNC96OOR=+ZA-_UxtMq=fTWJ23a_Ag@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Nov 2024 12:21:13 +0200
Message-ID: <CAA8EJprRQuXtGwiDeOiS56Nq=RW3p82-LTWGt8RervqGwP-=Vw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Nov 2024 at 12:10, =C5=81ukasz Bartosik <ukaszb@chromium.org> wr=
ote:
>
> On Fri, Nov 15, 2024 at 6:00=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Fri, Nov 15, 2024 at 03:52:33PM +0000, =C5=81ukasz Bartosik wrote:
> > > From: Pavan Holla <pholla@chromium.org>
> > >
> > > Implementation of a UCSI transport driver for ChromeOS.
> > > This driver will be loaded if the ChromeOS EC implements a PPM.
> > >
> > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > ---
> > >  MAINTAINERS                           |   7 +
> > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++++++++++++=
++
> > >  4 files changed, 269 insertions(+)
> > >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> >
> > > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > > +{
> > > +     return ucsi_sync_control_common(ucsi, cmd);
> > > +}
> > > +
> > > +struct ucsi_operations cros_ucsi_ops =3D {
> > > +     .read_version =3D cros_ucsi_read_version,
> > > +     .read_cci =3D cros_ucsi_read_cci,
> > > +     .read_message_in =3D cros_ucsi_read_message_in,
> > > +     .async_control =3D cros_ucsi_async_control,
> > > +     .sync_control =3D cros_ucsi_sync_control,
> >
> > .sync_control =3D ucsi_sync_control_common,
> >
>
> I will change.
>
> > > +};
> > > +
> >
> > [...]
> >
> > > +
> > > +static int __maybe_unused cros_ucsi_suspend(struct device *dev)
> > > +{
> > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > > +
> > > +     cancel_work_sync(&udata->work);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void __maybe_unused cros_ucsi_complete(struct device *dev)
> > > +{
> > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > > +
> > > +     ucsi_resume(udata->ucsi);
> > > +}
> > > +
> > > +static const struct dev_pm_ops cros_ucsi_pm_ops =3D {
> > > +#ifdef CONFIG_PM_SLEEP
> > > +     .suspend =3D cros_ucsi_suspend,
> > > +     .complete =3D cros_ucsi_complete,
> > > +#endif
> >
> > SET_SYSTEM_SLEEP_PM_OPS ? Or even better, DEFINE_SIMPLE_DEV_PM_OPS() ?
> >
> > What is the reason for using complete() instead of resume()?
> >
>
> Due to change in
> https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chromium=
.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> we moved from using macro SIMPLE_DEV_PM_OPS and resume() to complete().
> Per Heikki's suggestion I also squashed this change into "usb: typec:
> ucsi: Implement ChromeOS UCSI driver".

Neither original patch, nor this one document, why this is necessary

>
> Thank you,
> Lukasz
>
> > > +};
> > > +
> > > +static const struct platform_device_id cros_ucsi_id[] =3D {
> > > +     { KBUILD_MODNAME, 0 },
> > > +     {}
> > > +};
> > > +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> > > +
> > > +static struct platform_driver cros_ucsi_driver =3D {
> > > +     .driver =3D {
> > > +             .name =3D KBUILD_MODNAME,
> > > +             .pm =3D &cros_ucsi_pm_ops,
> > > +     },
> > > +     .id_table =3D cros_ucsi_id,
> > > +     .probe =3D cros_ucsi_probe,
> > > +     .remove =3D cros_ucsi_remove,
> > > +};
> > > +
> > > +module_platform_driver(cros_ucsi_driver);
> > > +
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> > > --
> > > 2.47.0.338.g60cca15819-goog
> > >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

