Return-Path: <linux-usb+bounces-17691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5193A9D0F2F
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 12:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBF06B2890F
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 10:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D44198E99;
	Mon, 18 Nov 2024 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dJAspt8P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052DC198A11
	for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731926310; cv=none; b=TNM6zAL9ERkht5WMYcj4BcImZxVzl6F/+IxvY0qRFMUiOZoVwCtnEbdOL02HUTxdGChFKaiZuWthBf3T0h0YzAaK8DDU0CEbFcUomUWaEB805Ty1mUsE657ynqG52x+HefJYOOqeMaYczv3nBqpxBEFE/qDX0ODSgttplm2kgfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731926310; c=relaxed/simple;
	bh=tkNwYjaxeaKn7yymvsQExmi3XBEBO5I0yXqf/lgtsEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJDH781kb2882GZyZMfZAHaWRE2cxasBy2tv9V01RCSVvWgsP4u4Ff8eVjrTdtgaSKEwFOm6vRxoJ0BkCDIGHuuSUU8L1J9EH3ASnkygWBwgO3Et75wbGUcdhXMX+7szyxvzMgaPUM1Sp8beh/O27/qncmIQWVQWo1QZwMT72T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dJAspt8P; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e4b7409fso4091625e87.0
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 02:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731926307; x=1732531107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+lrCFIcfX2QWmFad0ZnGniEXJWk02+ddjW1IgSpio4=;
        b=dJAspt8PE8y5pyTOakT/PCCqRpPW9J5+hJ/84mTLOV6B9Spx7N/lOjU5aVmakKfTxm
         GNGQWEgKDgj/kzZAwFJoZ+3MGnRjeaXEXuobPlMIo375yUpufcyi/ASJW9vNTlD03quU
         bUtvN2Nb8eFc7nRiim4sA7oS8SZBOv9o3AC6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731926307; x=1732531107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+lrCFIcfX2QWmFad0ZnGniEXJWk02+ddjW1IgSpio4=;
        b=TzTUOSW26Dzi/pt/mln06pv1Y9rYcpFAVpDau85okSNDBAKisniNXqyHBCB/VcoVVq
         wKgP4Q0GFTkLL7Iob6m058KR1h5Q60XqAKE2SkhDNXQuB9HLRnR+PmIP/Q3le/PH8wY/
         CyNWUc22yawtkmDtxrbkZxzpWbhS7Y5DMffjT8TMp4XWGj2rIh8HryqGaTd72SlXe+LX
         8h6unzanhUyCJ42kUbc9VD70UQhlXRsWBrSQeecukELqaT9ySwTvPHYe8ObomNRxjGMM
         vvHOX+1al3Ruercos2czXA7uOt/wW3XJi4R50pbQdId+jnEMxy4zgWPhZRKIv4LasNDg
         ltGA==
X-Forwarded-Encrypted: i=1; AJvYcCXd93FH4Bu+EIwB1IQLEpNnUUmpeR2grwUimA7vXAVn/OUfvvIy1ST/NGyEtpksPKZrUegNhluGo9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmH0pTKviqReNvujsz9bmuz1dUKMMoj6TgKIoUdfW2cWjIMcOw
	/N0GbyGDJIozT9WfgEHHpo9ILGxn1SX6lDNCy/IqLwAza1SYU9RP9znD6fYb3duF+rx3R6ZB2nL
	6D70K0W0DB2bfVNwFI6db9qb1ME7kyz+v4ZPcfu8o+yr9AVx5
X-Google-Smtp-Source: AGHT+IGJIz9fUVLP5gKhD2LKcJhGgCok86VfgULf2HRbXij9Juv93qh8U1fu8Jzqc7f893p5QHBwqNy0umLMavfBBuE=
X-Received: by 2002:a05:6512:3d8d:b0:53d:acac:7915 with SMTP id
 2adb3069b0e04-53dacac79bfmr3216682e87.24.1731926307133; Mon, 18 Nov 2024
 02:38:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115155234.1587589-1-ukaszb@chromium.org> <20241115155234.1587589-3-ukaszb@chromium.org>
 <jatq645z65hthaud4up6h6mxbggqpm73djtd6t3fxxkwccsifu@bb7bn24b7dak>
 <CALwA+NZ16WigkZuTwsRzDNC96OOR=+ZA-_UxtMq=fTWJ23a_Ag@mail.gmail.com> <CAA8EJprRQuXtGwiDeOiS56Nq=RW3p82-LTWGt8RervqGwP-=Vw@mail.gmail.com>
In-Reply-To: <CAA8EJprRQuXtGwiDeOiS56Nq=RW3p82-LTWGt8RervqGwP-=Vw@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Mon, 18 Nov 2024 11:38:16 +0100
Message-ID: <CALwA+NbUCstuayfm3ag-mBBRus1y-RM53auVFfffE_1OcW2zzA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 11:21=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 18 Nov 2024 at 12:10, =C5=81ukasz Bartosik <ukaszb@chromium.org> =
wrote:
> >
> > On Fri, Nov 15, 2024 at 6:00=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Fri, Nov 15, 2024 at 03:52:33PM +0000, =C5=81ukasz Bartosik wrote:
> > > > From: Pavan Holla <pholla@chromium.org>
> > > >
> > > > Implementation of a UCSI transport driver for ChromeOS.
> > > > This driver will be loaded if the ChromeOS EC implements a PPM.
> > > >
> > > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.or=
g>
> > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > ---
> > > >  MAINTAINERS                           |   7 +
> > > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++++++++++=
++++
> > > >  4 files changed, 269 insertions(+)
> > > >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > >
> > > > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > > > +{
> > > > +     return ucsi_sync_control_common(ucsi, cmd);
> > > > +}
> > > > +
> > > > +struct ucsi_operations cros_ucsi_ops =3D {
> > > > +     .read_version =3D cros_ucsi_read_version,
> > > > +     .read_cci =3D cros_ucsi_read_cci,
> > > > +     .read_message_in =3D cros_ucsi_read_message_in,
> > > > +     .async_control =3D cros_ucsi_async_control,
> > > > +     .sync_control =3D cros_ucsi_sync_control,
> > >
> > > .sync_control =3D ucsi_sync_control_common,
> > >
> >
> > I will change.
> >
> > > > +};
> > > > +
> > >
> > > [...]
> > >
> > > > +
> > > > +static int __maybe_unused cros_ucsi_suspend(struct device *dev)
> > > > +{
> > > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > > > +
> > > > +     cancel_work_sync(&udata->work);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void __maybe_unused cros_ucsi_complete(struct device *dev)
> > > > +{
> > > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > > > +
> > > > +     ucsi_resume(udata->ucsi);
> > > > +}
> > > > +
> > > > +static const struct dev_pm_ops cros_ucsi_pm_ops =3D {
> > > > +#ifdef CONFIG_PM_SLEEP
> > > > +     .suspend =3D cros_ucsi_suspend,
> > > > +     .complete =3D cros_ucsi_complete,
> > > > +#endif
> > >
> > > SET_SYSTEM_SLEEP_PM_OPS ? Or even better, DEFINE_SIMPLE_DEV_PM_OPS() =
?
> > >
> > > What is the reason for using complete() instead of resume()?
> > >
> >
> > Due to change in
> > https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chromi=
um.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > we moved from using macro SIMPLE_DEV_PM_OPS and resume() to complete().
> > Per Heikki's suggestion I also squashed this change into "usb: typec:
> > ucsi: Implement ChromeOS UCSI driver".
>
> Neither original patch, nor this one document, why this is necessary
>

The https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chromi=
um.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
commit messages says:
"On platforms using cros_ec_lpc, resume is split into .resume_early
and .complete.
To avoid missing EC events, use .complete to schedule work when resuming."

I will add this as a comment on top of cros_ucsi_pm_ops struct.
Do you find it sufficient ?

Thanks,
Lukasz

> >
> > Thank you,
> > Lukasz
> >
> > > > +};
> > > > +
> > > > +static const struct platform_device_id cros_ucsi_id[] =3D {
> > > > +     { KBUILD_MODNAME, 0 },
> > > > +     {}
> > > > +};
> > > > +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> > > > +
> > > > +static struct platform_driver cros_ucsi_driver =3D {
> > > > +     .driver =3D {
> > > > +             .name =3D KBUILD_MODNAME,
> > > > +             .pm =3D &cros_ucsi_pm_ops,
> > > > +     },
> > > > +     .id_table =3D cros_ucsi_id,
> > > > +     .probe =3D cros_ucsi_probe,
> > > > +     .remove =3D cros_ucsi_remove,
> > > > +};
> > > > +
> > > > +module_platform_driver(cros_ucsi_driver);
> > > > +
> > > > +MODULE_LICENSE("GPL");
> > > > +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> > > > --
> > > > 2.47.0.338.g60cca15819-goog
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
>
>
> --
> With best wishes
> Dmitry

