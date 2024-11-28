Return-Path: <linux-usb+bounces-17932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EFE9DB56B
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 11:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA353283886
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 10:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9388F197A7A;
	Thu, 28 Nov 2024 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E0fBwna0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0A19340E
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732788607; cv=none; b=kDeNyhFPRSde405WeH1htoKVSp0CNU7QkBAOamSizYYDKnQeD6BbIVImjM9AC4BvLvpk8fg9munu/WOtBnKpVv32l8cf+gRIcOflGRqiMh2uiT6j4YuMDPlIKlCf0hR6fCnAWJOBOZcZ3SfmH+UgqsRRlFSSTlkvrV75xrLEnUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732788607; c=relaxed/simple;
	bh=oUPL08+KGyl9x5r9zhl7NOVD1gn94+eqaCKJTyRQung=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=af6qnWkvv88oEQ4JU1ffws0glo6uGKmnWe/NCdTFb7ECSY6P3rBWv6ndoeXEiwaPcIDmBvlT3R1r3KFM8sipNz2JH2nILB4fIsXAi3fLMCxSOr+1/UHdRe/VUJyZzNn76qvvul3VAr5h3wdRmlrooZXLHuLwqIYDFMhpZOSXxAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E0fBwna0; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffced84ba8so5922901fa.2
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732788603; x=1733393403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBUMnMVIUDLWp0Wpco0Kq+nL3X5wwHnVFAPniWX7zWc=;
        b=E0fBwna0NQzN5WHOveaQHVTzApb9010hmjbRYjhe8MilNFq+3qEwFvLVVpIUjiZeN3
         mwf+KR4+MLz0mInFBy2Uq3F8yyPiw1hO7WHAFvWxuvSHt+oKbsZa7nNw/m5iGSrX7UMN
         jLuynRLtmrKtYNpllDKTF8EZ0NxAfY7XLnCRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732788603; x=1733393403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBUMnMVIUDLWp0Wpco0Kq+nL3X5wwHnVFAPniWX7zWc=;
        b=qyJlWhBU6AXElpYWOyYB/mCNvzoQ/mD+qTMmtmHJ/iEWS5z1JzJuaKBmEw24hc3PLS
         m9bjuCBBraLEcX0L8hwRW32a+piKMvoLehmcHq7LdFS0iECmAuvwPJtVj5F5G6KviWcP
         WmUKK/J4T5wnuPG/cRtjYnDlZA6pEiwryTHqiUP7KJ91Z2Dv1YSHOfzf/102UXzNM4gV
         a78JJXjugIllBDOFuu0qmhEF2UMxi+MeVhSoirpyBADBApfoLG6NN51xn02BvX+goaw+
         6Hl+O8pzFxWPHk9G3XWyuH4AuU5qTCiJY3PcTlcLYCONAyizSQn1BjhO3fV16e7iU4Ft
         7ALQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgH73H8TpJYVeSMfMKvb5s+SVhtn0IhKu1cJKMhnH0eZqRCclvHhKpFIZoPawqafr7PkvcSQb4Vlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPvLVI9j+XESqecMATkP+A6VGUvKNilW4VLF5OaXC62wjhxZr9
	n9X1OeoH68AHd1tD6oz5yhFxZOSlJ3WyLOxQ8hCQS23IPBv2Kp4BJyu354CR+u+k9aVM3syPWLe
	ZYD5nOIzs0MbJMDj4CM02M38XmJQBfCQ0ZuY=
X-Gm-Gg: ASbGncsP1YrhjkaHAtPiDTD5vxhY9s2jsp/VJR+8h5KxurddAzTAYWjwoW3GzvR7Pj1
	6lIbFhSO5RTg1fyruf4cIOWwCJCB+mWicyEbN+cbf4K1mI+JbDk3BjkOL
X-Google-Smtp-Source: AGHT+IEKmXq3Mgnpi99MCpWZnsLq9MZkWIubtPbc0UgbEhj/sPxRY2rxhCJenD+IkB9uw/XkEOTJGqop35NckNq6+Do=
X-Received: by 2002:a05:651c:1547:b0:2ff:8e69:77ef with SMTP id
 38308e7fff4ca-2ffd5fc8217mr37470371fa.1.1732788603270; Thu, 28 Nov 2024
 02:10:03 -0800 (PST)
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
 <CALwA+NbUCstuayfm3ag-mBBRus1y-RM53auVFfffE_1OcW2zzA@mail.gmail.com>
 <CAA8EJppJ6FKDRvZg0WHk7+uygFTUDKqBnx0swQ=A_E7WiUQUdA@mail.gmail.com>
 <CALwA+Nbdah1SML92GPtsYmVKmPzTLTGSu1kuphp+PDGuERT27A@mail.gmail.com> <wyz6rxgimqsas4giychio227mpivoqfihyvxmpqfh2it4vfqlq@3o4urzbow2c2>
In-Reply-To: <wyz6rxgimqsas4giychio227mpivoqfihyvxmpqfh2it4vfqlq@3o4urzbow2c2>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Thu, 28 Nov 2024 11:09:51 +0100
Message-ID: <CALwA+NbbwfeaU6hN8=6tz8gLQ0_41Zqn+B7FU+pAT35uMg+BmQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 12:05=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Nov 18, 2024 at 12:18:17PM +0100, =C5=81ukasz Bartosik wrote:
> > On Mon, Nov 18, 2024 at 12:08=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Mon, 18 Nov 2024 at 12:38, =C5=81ukasz Bartosik <ukaszb@chromium.o=
rg> wrote:
> > > >
> > > > On Mon, Nov 18, 2024 at 11:21=E2=80=AFAM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Mon, 18 Nov 2024 at 12:10, =C5=81ukasz Bartosik <ukaszb@chromi=
um.org> wrote:
> > > > > >
> > > > > > On Fri, Nov 15, 2024 at 6:00=E2=80=AFPM Dmitry Baryshkov
> > > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > > >
> > > > > > > On Fri, Nov 15, 2024 at 03:52:33PM +0000, =C5=81ukasz Bartosi=
k wrote:
> > > > > > > > From: Pavan Holla <pholla@chromium.org>
> > > > > > > >
> > > > > > > > Implementation of a UCSI transport driver for ChromeOS.
> > > > > > > > This driver will be loaded if the ChromeOS EC implements a =
PPM.
> > > > > > > >
> > > > > > > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > > > > > > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chr=
omium.org>
> > > > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chrom=
ium.org>
> > > > > > > > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > > > > > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > > > > > ---
> > > > > > > >  MAINTAINERS                           |   7 +
> > > > > > > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > > > > > > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > > > > > > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++=
++++++++++++
> > > > > > > >  4 files changed, 269 insertions(+)
> > > > > > > >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > > > > > >
> > > > > > > > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 c=
md)
> > > > > > > > +{
> > > > > > > > +     return ucsi_sync_control_common(ucsi, cmd);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +struct ucsi_operations cros_ucsi_ops =3D {
> > > > > > > > +     .read_version =3D cros_ucsi_read_version,
> > > > > > > > +     .read_cci =3D cros_ucsi_read_cci,
> > > > > > > > +     .read_message_in =3D cros_ucsi_read_message_in,
> > > > > > > > +     .async_control =3D cros_ucsi_async_control,
> > > > > > > > +     .sync_control =3D cros_ucsi_sync_control,
> > > > > > >
> > > > > > > .sync_control =3D ucsi_sync_control_common,
> > > > > > >
> > > > > >
> > > > > > I will change.
> > > > > >
> > > > > > > > +};
> > > > > > > > +
> > > > > > >
> > > > > > > [...]
> > > > > > >
> > > > > > > > +
> > > > > > > > +static int __maybe_unused cros_ucsi_suspend(struct device =
*dev)
> > > > > > > > +{
> > > > > > > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev)=
;
> > > > > > > > +
> > > > > > > > +     cancel_work_sync(&udata->work);
> > > > > > > > +
> > > > > > > > +     return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void __maybe_unused cros_ucsi_complete(struct devic=
e *dev)
> > > > > > > > +{
> > > > > > > > +     struct cros_ucsi_data *udata =3D dev_get_drvdata(dev)=
;
> > > > > > > > +
> > > > > > > > +     ucsi_resume(udata->ucsi);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static const struct dev_pm_ops cros_ucsi_pm_ops =3D {
> > > > > > > > +#ifdef CONFIG_PM_SLEEP
> > > > > > > > +     .suspend =3D cros_ucsi_suspend,
> > > > > > > > +     .complete =3D cros_ucsi_complete,
> > > > > > > > +#endif
> > > > > > >
> > > > > > > SET_SYSTEM_SLEEP_PM_OPS ? Or even better, DEFINE_SIMPLE_DEV_P=
M_OPS() ?
> > > > > > >
> > > > > > > What is the reason for using complete() instead of resume()?
> > > > > > >
> > > > > >
> > > > > > Due to change in
> > > > > > https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukasz=
b@chromium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > > > > > we moved from using macro SIMPLE_DEV_PM_OPS and resume() to com=
plete().
> > > > > > Per Heikki's suggestion I also squashed this change into "usb: =
typec:
> > > > > > ucsi: Implement ChromeOS UCSI driver".
> > > > >
> > > > > Neither original patch, nor this one document, why this is necess=
ary
> > > > >
> > > >
> > > > The https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukasz=
b@chromium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > > > commit messages says:
> > > > "On platforms using cros_ec_lpc, resume is split into .resume_early
> > > > and .complete.
> > > > To avoid missing EC events, use .complete to schedule work when res=
uming."
> > > >
> > > > I will add this as a comment on top of cros_ucsi_pm_ops struct.
> > > > Do you find it sufficient ?
> > >
> > > IMHO, no
> > >
> >
> > Ok. If you please tell me what is not clear or missing in this
> > explanation in your opinion
> > then I will update it.
>
> For me it is a question of imbalance. The .complete() should be paired
> with .prepare(), .suspend() with .resume(), etc. Also by using just
> .suspend and .complete you are missing all other suspend/resume cases
> which are covered by SET_SYSTEM_SLEEP_PM_OPS() or
> SET_LATE_SYSTEM_SLEEP_PM_OPS().
>
> So, back to your question. I'm reviewing the UCSI part. I don't know
> anything about the cros_ec_lpc.c or any other CrOS EC drivers. You are
> doing some non-standard thing in your driver. As such you should provide
> a sensible explanation for it. If I understand correctly, it might be
> something in line with "UCSI is used with the systems using
> cros_ec_lpc.c. On such systems ... is not available until the
> .complete() callback of the cros_ec_lpc is executed. For this reason,
> delay ucsi_resume() until the .complete() stage."
>

I will incorporate your comment.

Thanks,
Lukasz

> >
> > Thanks,
> > Lukasz
> >
> > > >
> > > > Thanks,
> > > > Lukasz
> > > >
> > > > > >
> > > > > > Thank you,
> > > > > > Lukasz
> > > > > >
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +static const struct platform_device_id cros_ucsi_id[] =3D =
{
> > > > > > > > +     { KBUILD_MODNAME, 0 },
> > > > > > > > +     {}
> > > > > > > > +};
> > > > > > > > +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> > > > > > > > +
> > > > > > > > +static struct platform_driver cros_ucsi_driver =3D {
> > > > > > > > +     .driver =3D {
> > > > > > > > +             .name =3D KBUILD_MODNAME,
> > > > > > > > +             .pm =3D &cros_ucsi_pm_ops,
> > > > > > > > +     },
> > > > > > > > +     .id_table =3D cros_ucsi_id,
> > > > > > > > +     .probe =3D cros_ucsi_probe,
> > > > > > > > +     .remove =3D cros_ucsi_remove,
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +module_platform_driver(cros_ucsi_driver);
> > > > > > > > +
> > > > > > > > +MODULE_LICENSE("GPL");
> > > > > > > > +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> > > > > > > > --
> > > > > > > > 2.47.0.338.g60cca15819-goog
> > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > With best wishes
> > > > > > > Dmitry
> > > > >
> > > > >
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
> --
> With best wishes
> Dmitry

