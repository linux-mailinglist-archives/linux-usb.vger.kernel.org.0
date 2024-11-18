Return-Path: <linux-usb+bounces-17693-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C4A9D0F76
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 12:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77CA0282841
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 11:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1FE198E80;
	Mon, 18 Nov 2024 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oSlv9byr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6C8197A92
	for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 11:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731928712; cv=none; b=JAcLkb/hi44YdA8uDGAnrFrz9JB8WPUTkuZbylW1wmIBZZWSqb4DpOpu5l8uTdcDaUWq9o3RKHXF+AIz6s3J555s2OWIQUE8gn38wJByOBo7L6coZpzKexENXuuIfiK2WZPTp2kB6U7l4jhL5A+Ah5Az4CC786Z6Zx2mtEjRXVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731928712; c=relaxed/simple;
	bh=ZGIhe8xusgzvwSFz+jUB1irbOzMJHGPp+onr5lsnVtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCrUnE0NTzlDh91vViKyMkhgv6kg5qedXqCRFz1Crmj+Y7XYZxWAQuSAK53wGGlSVtkmzf07pq2wSokEDuPE8besbp8RTwfims4qQNMLi0djvIZYnTMFMG2rtZ4JHScn0jVUuptlXLzETn2or33Gjhb6pyOGns+JhHH0qaCpkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oSlv9byr; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53da07b78dfso3331014e87.0
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 03:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731928709; x=1732533509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eZYuS229f+THP5IvlrHUv+ubqkbKYI8d08SCtRwUto=;
        b=oSlv9byrYFr+oGgRmlq3BsKPQqXCcbB+7A0QhEFNlnqariT5ZRDm2kQhRcIrqwG6Fq
         MWtzBxWMf9+HKDy616Kov9f/x7tzkz6u7tqO6vkqVHcs4cp/Qf6YYMXMEw5A4ahw3qnt
         eZUzWHrm8KLOer79COuixQVQt79QUSRb7QOl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731928709; x=1732533509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eZYuS229f+THP5IvlrHUv+ubqkbKYI8d08SCtRwUto=;
        b=lMyS15dZokw19tX2nDJcFyukblxaGLJVZ40PI+p8TETZcdLvgj9oD0vxIs8SxZyVi3
         EYpsrZEcDgomOKPDl9gGRyW7Uf+tMRc/N+i4RjN5tpts7tBHz0x4Bml353bKxJozA07E
         iyxBMFkKLruxiNjy3wbyk8lBTHFSlT/51kKPo4ghmbYkwXG/Lv0Esa23sdhrD8bdOU1c
         KIi64snpzTEYy2WdxtbcO8V2ZLymobx2pbDCDfWkmP8py94prI4yXq0TSzCqjV4LnD5o
         H3FPChdEt9qnUiDw4yGIY+iTqFEX9bL7t1FiPvjFAXTnrzZniNJeUNbd3XxxVVxS68pr
         Y5/g==
X-Forwarded-Encrypted: i=1; AJvYcCUDmQqGo9c7XQahW+SRoROHpw6uK3pkXO6AuIK/OH69+86+tOt8++jG6iJLxiqAJd9GUV4EkqfDjEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYdjAQTayFJ/5rYvzJsgYln2670yvRiiLAD5R2bAjdqGc6v5UM
	Ea1SYjrIK/QIwwgY58u6/CAvKNdLxYpzkGNMB9zLq6r1xRuyZ0NeUwJsL563NL16abj5XVYFNXE
	RdHs9h1JYvke36UgKYQa04W6jIK5x+DY4y2s=
X-Google-Smtp-Source: AGHT+IFkJ85OQjVPqi3f79lpLk46OcG59EwbnaVLX/swNpcI9CwUfyzApyQSNqW5vYoIkuInnT8brnszIe1gc3mKgxQ=
X-Received: by 2002:a19:5f03:0:b0:53d:abc8:b6d7 with SMTP id
 2adb3069b0e04-53dabc8b729mr3828087e87.7.1731928709128; Mon, 18 Nov 2024
 03:18:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115155234.1587589-1-ukaszb@chromium.org> <20241115155234.1587589-3-ukaszb@chromium.org>
 <jatq645z65hthaud4up6h6mxbggqpm73djtd6t3fxxkwccsifu@bb7bn24b7dak>
 <CALwA+NZ16WigkZuTwsRzDNC96OOR=+ZA-_UxtMq=fTWJ23a_Ag@mail.gmail.com>
 <CAA8EJprRQuXtGwiDeOiS56Nq=RW3p82-LTWGt8RervqGwP-=Vw@mail.gmail.com>
 <CALwA+NbUCstuayfm3ag-mBBRus1y-RM53auVFfffE_1OcW2zzA@mail.gmail.com> <CAA8EJppJ6FKDRvZg0WHk7+uygFTUDKqBnx0swQ=A_E7WiUQUdA@mail.gmail.com>
In-Reply-To: <CAA8EJppJ6FKDRvZg0WHk7+uygFTUDKqBnx0swQ=A_E7WiUQUdA@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Mon, 18 Nov 2024 12:18:17 +0100
Message-ID: <CALwA+Nbdah1SML92GPtsYmVKmPzTLTGSu1kuphp+PDGuERT27A@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 12:08=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 18 Nov 2024 at 12:38, =C5=81ukasz Bartosik <ukaszb@chromium.org> =
wrote:
> >
> > On Mon, Nov 18, 2024 at 11:21=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Mon, 18 Nov 2024 at 12:10, =C5=81ukasz Bartosik <ukaszb@chromium.o=
rg> wrote:
> > > >
> > > > On Fri, Nov 15, 2024 at 6:00=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Fri, Nov 15, 2024 at 03:52:33PM +0000, =C5=81ukasz Bartosik wr=
ote:
> > > > > > From: Pavan Holla <pholla@chromium.org>
> > > > > >
> > > > > > Implementation of a UCSI transport driver for ChromeOS.
> > > > > > This driver will be loaded if the ChromeOS EC implements a PPM.
> > > > > >
> > > > > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > > > > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromiu=
m.org>
> > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.=
org>
> > > > > > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > > > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > > > ---
> > > > > >  MAINTAINERS                           |   7 +
> > > > > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > > > > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > > > > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++++++=
++++++++
> > > > > >  4 files changed, 269 insertions(+)
> > > > > >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > > > >
> > > > > > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > > > > > +{
> > > > > > +     return ucsi_sync_control_common(ucsi, cmd);
> > > > > > +}
> > > > > > +
> > > > > > +struct ucsi_operations cros_ucsi_ops =3D {
> > > > > > +     .read_version =3D cros_ucsi_read_version,
> > > > > > +     .read_cci =3D cros_ucsi_read_cci,
> > > > > > +     .read_message_in =3D cros_ucsi_read_message_in,
> > > > > > +     .async_control =3D cros_ucsi_async_control,
> > > > > > +     .sync_control =3D cros_ucsi_sync_control,
> > > > >
> > > > > .sync_control =3D ucsi_sync_control_common,
> > > > >
> > > >
> > > > I will change.
> > > >
> > > > > > +};
> > > > > > +
> > > > >
> > > > > [...]
> > > > >
> > > > > > +
> > > > > > +static int __maybe_unused cros_ucsi_suspend(struct device *dev=
)
> > > > > > +{
> > > > > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > > > > > +
> > > > > > +     cancel_work_sync(&udata->work);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static void __maybe_unused cros_ucsi_complete(struct device *d=
ev)
> > > > > > +{
> > > > > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > > > > > +
> > > > > > +     ucsi_resume(udata->ucsi);
> > > > > > +}
> > > > > > +
> > > > > > +static const struct dev_pm_ops cros_ucsi_pm_ops =3D {
> > > > > > +#ifdef CONFIG_PM_SLEEP
> > > > > > +     .suspend =3D cros_ucsi_suspend,
> > > > > > +     .complete =3D cros_ucsi_complete,
> > > > > > +#endif
> > > > >
> > > > > SET_SYSTEM_SLEEP_PM_OPS ? Or even better, DEFINE_SIMPLE_DEV_PM_OP=
S() ?
> > > > >
> > > > > What is the reason for using complete() instead of resume()?
> > > > >
> > > >
> > > > Due to change in
> > > > https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@ch=
romium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > > > we moved from using macro SIMPLE_DEV_PM_OPS and resume() to complet=
e().
> > > > Per Heikki's suggestion I also squashed this change into "usb: type=
c:
> > > > ucsi: Implement ChromeOS UCSI driver".
> > >
> > > Neither original patch, nor this one document, why this is necessary
> > >
> >
> > The https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@ch=
romium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > commit messages says:
> > "On platforms using cros_ec_lpc, resume is split into .resume_early
> > and .complete.
> > To avoid missing EC events, use .complete to schedule work when resumin=
g."
> >
> > I will add this as a comment on top of cros_ucsi_pm_ops struct.
> > Do you find it sufficient ?
>
> IMHO, no
>

Ok. If you please tell me what is not clear or missing in this
explanation in your opinion
then I will update it.

Thanks,
Lukasz

> >
> > Thanks,
> > Lukasz
> >
> > > >
> > > > Thank you,
> > > > Lukasz
> > > >
> > > > > > +};
> > > > > > +
> > > > > > +static const struct platform_device_id cros_ucsi_id[] =3D {
> > > > > > +     { KBUILD_MODNAME, 0 },
> > > > > > +     {}
> > > > > > +};
> > > > > > +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> > > > > > +
> > > > > > +static struct platform_driver cros_ucsi_driver =3D {
> > > > > > +     .driver =3D {
> > > > > > +             .name =3D KBUILD_MODNAME,
> > > > > > +             .pm =3D &cros_ucsi_pm_ops,
> > > > > > +     },
> > > > > > +     .id_table =3D cros_ucsi_id,
> > > > > > +     .probe =3D cros_ucsi_probe,
> > > > > > +     .remove =3D cros_ucsi_remove,
> > > > > > +};
> > > > > > +
> > > > > > +module_platform_driver(cros_ucsi_driver);
> > > > > > +
> > > > > > +MODULE_LICENSE("GPL");
> > > > > > +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> > > > > > --
> > > > > > 2.47.0.338.g60cca15819-goog
> > > > > >
> > > > >
> > > > > --
> > > > > With best wishes
> > > > > Dmitry
> > >
> > >
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

