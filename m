Return-Path: <linux-usb+bounces-17789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A96669D5603
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 00:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 396D71F219CE
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 23:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA94B1DDC1E;
	Thu, 21 Nov 2024 23:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RzvFDedb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4321C877E
	for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 23:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732230364; cv=none; b=VjoAvWQBthX3yO4efnoW4bAkXrQhDBGF1ko8/jmbyLFHuGWC7VB04Wl2ptkKaD3z1i3Z4t/qKAKr9FQergxHMDQ3qw7ZRqIFtM891izGc1BZHYTfDsx1RMj6JY1ZjRdmLsoeEG1p3Wi6fb8M1B7OST3fCosFjE+KWCBco+Xot4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732230364; c=relaxed/simple;
	bh=7vVsWJAlaxSvMOvtdje6yXGcypqw9no47hXoQMLek34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QF4Bs9Dxm7+HZT6yc7S6IDzKC7uXGVk8tujaR8P7N9YHdX06SqmI+xHHmbnIPBRLgP/s7C0wFHiBnFGHED/Vs1pI4NJChr414U+bIlZNCMWPSTBKoiJjcIxCigXgl+c7+gy0TR/2KS58sn0yvtytGOwzhifvnG/hqf1hQQ2IpsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RzvFDedb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53da209492cso1949829e87.3
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 15:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732230359; x=1732835159; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=skGr7TzxYrDaJmlRy1zO1szKe6aQTSkC3fXLyAmXUUw=;
        b=RzvFDedbCMYbPrXxb+z4zcjrkTXoRDBSqTheEKHaJyfQpIobOohxaJ7qdafmOuONOA
         3+tiXD2nj3UrJZj/GWq5SShFgV59xyKwbCSPjZPAF/z3fZWcpKtwzQHM2PLbJUkWnXRc
         YimUVKb1l1Oxoqe28GsGc9jrWWkSc7nLiBOxn0+bCcAPeMCUDO8YWoEEcSFbJFCvpuZz
         d3fNbo1otOPzGezAebnV3seirLMUZQ0TZUCbp4FVYT3rQgl+xHEQo03q4Ef3r4lntqkV
         F/J3D4VVwAkR6dqaGTTg6LmdpVGae8c+VhDOjBKozYTtwm7j2XX8vLXoCfas+oydc+Iw
         OWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732230359; x=1732835159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skGr7TzxYrDaJmlRy1zO1szKe6aQTSkC3fXLyAmXUUw=;
        b=n4bj0Gyxgp3wED+4kK3kFJmgySU0Tv5mG/x+IzMnI2m7yBKeY26vTs+HHbsrrBxRmr
         dPz5dzBiSWcR9tq0elI7FfJ773ttemTU5fEZn7Fof5UiE5zOyaDvs99WYx2IYSND+xMy
         sDy9YJGV8N7Jc7VTQjMLZEgmLGmt+/S59rDttbSay0mgRSC1YNehIa1OaK+fgUp46tee
         6SMxZFQSWVdyry5tlT2ojQWHI4B0JxRk3ZzZFPdFycVsMzeSoX31jHSsR+AHv3tOVf5W
         racpbBeVKiFdr8YpSok5n7OTEdBlHVv41g9rMhgmd7kk0CXFN2JD6k8oA8KhNz5uDI+9
         mTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVXfU27JP/CLepUvA18Li+vcx8omUaTL3ge1IiBcHTO2HLcHA6jOpp8auq49gja0c71QmPXzSs77o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS4GWX37k/wG4UfXCoUFb6f1/ObidAdkbGrl43zafGbi7dTJPE
	lOZhQa71vAO8bvMEBOHfI3TyUMgjCb8uVdcIk1C+TuN/NcJJHIfKPFi1VbjCUXY=
X-Gm-Gg: ASbGncs9G2AHqbroCZHkL+bwqfueW7G/QPjprYmNU1iCxoZY7sI0093O15Y/qkgaFw3
	65HKO8iIl/orAR/C4C6KBMC1O3Cp1mKCmDruaKpkV+cCS8oUsGDIRdBfqJz7i28jWpK/XzqJqqT
	WZL5d2d73v3wLjdvZNYXGBwng98Z3SdR879NmoTZhd4H7sT23HTKjXGShZ5TZb04Sxoyz1t8Uvb
	y4cdmu8haMm9szllEsm/HPoseHKHHkSfjKQ7H2SYsqohCU9WsQt5x3s+ARCGE7CzfTrhNU14f9K
	v5NpXmDsW21zT9M9Eox7FNM9rPeOHw==
X-Google-Smtp-Source: AGHT+IFsFiPswuTvKRAMZXTwEOWckEDYLeJUZ4aXoe/XaGXinnkHcCPuSeYBh8t3kFTwrpf2UNrmrA==
X-Received: by 2002:a05:6512:b81:b0:539:ddf1:ac6f with SMTP id 2adb3069b0e04-53dd39a4c7dmr232459e87.46.1732230359158;
        Thu, 21 Nov 2024 15:05:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd4253c64sm11188e87.107.2024.11.21.15.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 15:05:58 -0800 (PST)
Date: Fri, 22 Nov 2024 01:05:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <wyz6rxgimqsas4giychio227mpivoqfihyvxmpqfh2it4vfqlq@3o4urzbow2c2>
References: <20241115155234.1587589-1-ukaszb@chromium.org>
 <20241115155234.1587589-3-ukaszb@chromium.org>
 <jatq645z65hthaud4up6h6mxbggqpm73djtd6t3fxxkwccsifu@bb7bn24b7dak>
 <CALwA+NZ16WigkZuTwsRzDNC96OOR=+ZA-_UxtMq=fTWJ23a_Ag@mail.gmail.com>
 <CAA8EJprRQuXtGwiDeOiS56Nq=RW3p82-LTWGt8RervqGwP-=Vw@mail.gmail.com>
 <CALwA+NbUCstuayfm3ag-mBBRus1y-RM53auVFfffE_1OcW2zzA@mail.gmail.com>
 <CAA8EJppJ6FKDRvZg0WHk7+uygFTUDKqBnx0swQ=A_E7WiUQUdA@mail.gmail.com>
 <CALwA+Nbdah1SML92GPtsYmVKmPzTLTGSu1kuphp+PDGuERT27A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALwA+Nbdah1SML92GPtsYmVKmPzTLTGSu1kuphp+PDGuERT27A@mail.gmail.com>

On Mon, Nov 18, 2024 at 12:18:17PM +0100, Łukasz Bartosik wrote:
> On Mon, Nov 18, 2024 at 12:08 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 18 Nov 2024 at 12:38, Łukasz Bartosik <ukaszb@chromium.org> wrote:
> > >
> > > On Mon, Nov 18, 2024 at 11:21 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Mon, 18 Nov 2024 at 12:10, Łukasz Bartosik <ukaszb@chromium.org> wrote:
> > > > >
> > > > > On Fri, Nov 15, 2024 at 6:00 PM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > >
> > > > > > On Fri, Nov 15, 2024 at 03:52:33PM +0000, Łukasz Bartosik wrote:
> > > > > > > From: Pavan Holla <pholla@chromium.org>
> > > > > > >
> > > > > > > Implementation of a UCSI transport driver for ChromeOS.
> > > > > > > This driver will be loaded if the ChromeOS EC implements a PPM.
> > > > > > >
> > > > > > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > > > > > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > > > > Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> > > > > > > Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> > > > > > > ---
> > > > > > >  MAINTAINERS                           |   7 +
> > > > > > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > > > > > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > > > > > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++++++++++++++
> > > > > > >  4 files changed, 269 insertions(+)
> > > > > > >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > > > > >
> > > > > > > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > > > > > > +{
> > > > > > > +     return ucsi_sync_control_common(ucsi, cmd);
> > > > > > > +}
> > > > > > > +
> > > > > > > +struct ucsi_operations cros_ucsi_ops = {
> > > > > > > +     .read_version = cros_ucsi_read_version,
> > > > > > > +     .read_cci = cros_ucsi_read_cci,
> > > > > > > +     .read_message_in = cros_ucsi_read_message_in,
> > > > > > > +     .async_control = cros_ucsi_async_control,
> > > > > > > +     .sync_control = cros_ucsi_sync_control,
> > > > > >
> > > > > > .sync_control = ucsi_sync_control_common,
> > > > > >
> > > > >
> > > > > I will change.
> > > > >
> > > > > > > +};
> > > > > > > +
> > > > > >
> > > > > > [...]
> > > > > >
> > > > > > > +
> > > > > > > +static int __maybe_unused cros_ucsi_suspend(struct device *dev)
> > > > > > > +{
> > > > > > > +     struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> > > > > > > +
> > > > > > > +     cancel_work_sync(&udata->work);
> > > > > > > +
> > > > > > > +     return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void __maybe_unused cros_ucsi_complete(struct device *dev)
> > > > > > > +{
> > > > > > > +     struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> > > > > > > +
> > > > > > > +     ucsi_resume(udata->ucsi);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static const struct dev_pm_ops cros_ucsi_pm_ops = {
> > > > > > > +#ifdef CONFIG_PM_SLEEP
> > > > > > > +     .suspend = cros_ucsi_suspend,
> > > > > > > +     .complete = cros_ucsi_complete,
> > > > > > > +#endif
> > > > > >
> > > > > > SET_SYSTEM_SLEEP_PM_OPS ? Or even better, DEFINE_SIMPLE_DEV_PM_OPS() ?
> > > > > >
> > > > > > What is the reason for using complete() instead of resume()?
> > > > > >
> > > > >
> > > > > Due to change in
> > > > > https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chromium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > > > > we moved from using macro SIMPLE_DEV_PM_OPS and resume() to complete().
> > > > > Per Heikki's suggestion I also squashed this change into "usb: typec:
> > > > > ucsi: Implement ChromeOS UCSI driver".
> > > >
> > > > Neither original patch, nor this one document, why this is necessary
> > > >
> > >
> > > The https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chromium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > > commit messages says:
> > > "On platforms using cros_ec_lpc, resume is split into .resume_early
> > > and .complete.
> > > To avoid missing EC events, use .complete to schedule work when resuming."
> > >
> > > I will add this as a comment on top of cros_ucsi_pm_ops struct.
> > > Do you find it sufficient ?
> >
> > IMHO, no
> >
> 
> Ok. If you please tell me what is not clear or missing in this
> explanation in your opinion
> then I will update it.

For me it is a question of imbalance. The .complete() should be paired
with .prepare(), .suspend() with .resume(), etc. Also by using just
.suspend and .complete you are missing all other suspend/resume cases
which are covered by SET_SYSTEM_SLEEP_PM_OPS() or
SET_LATE_SYSTEM_SLEEP_PM_OPS().

So, back to your question. I'm reviewing the UCSI part. I don't know
anything about the cros_ec_lpc.c or any other CrOS EC drivers. You are
doing some non-standard thing in your driver. As such you should provide
a sensible explanation for it. If I understand correctly, it might be
something in line with "UCSI is used with the systems using
cros_ec_lpc.c. On such systems ... is not available until the
.complete() callback of the cros_ec_lpc is executed. For this reason,
delay ucsi_resume() until the .complete() stage."

> 
> Thanks,
> Lukasz
> 
> > >
> > > Thanks,
> > > Lukasz
> > >
> > > > >
> > > > > Thank you,
> > > > > Lukasz
> > > > >
> > > > > > > +};
> > > > > > > +
> > > > > > > +static const struct platform_device_id cros_ucsi_id[] = {
> > > > > > > +     { KBUILD_MODNAME, 0 },
> > > > > > > +     {}
> > > > > > > +};
> > > > > > > +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> > > > > > > +
> > > > > > > +static struct platform_driver cros_ucsi_driver = {
> > > > > > > +     .driver = {
> > > > > > > +             .name = KBUILD_MODNAME,
> > > > > > > +             .pm = &cros_ucsi_pm_ops,
> > > > > > > +     },
> > > > > > > +     .id_table = cros_ucsi_id,
> > > > > > > +     .probe = cros_ucsi_probe,
> > > > > > > +     .remove = cros_ucsi_remove,
> > > > > > > +};
> > > > > > > +
> > > > > > > +module_platform_driver(cros_ucsi_driver);
> > > > > > > +
> > > > > > > +MODULE_LICENSE("GPL");
> > > > > > > +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> > > > > > > --
> > > > > > > 2.47.0.338.g60cca15819-goog
> > > > > > >
> > > > > >
> > > > > > --
> > > > > > With best wishes
> > > > > > Dmitry
> > > >
> > > >
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

