Return-Path: <linux-usb+bounces-2677-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC4E7E5215
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 09:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EE5B1C20D5A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 08:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EA46ADB;
	Wed,  8 Nov 2023 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R8QooS0v"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B463457C
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 08:44:38 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7EB1717
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 00:44:37 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54357417e81so10108a12.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Nov 2023 00:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699433076; x=1700037876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qu6xuDhGJ5JPWC5oSGyyY7P53x8jjCQYiy8YEQLeeo=;
        b=R8QooS0vDNoKoV3XJANVjelsz9aaQFjE/CtumDCIubPSnH27LQd+D7oCwCNc1wbCxn
         fpyO/eIINl6muOmwwfmuv/yxtkTsBpf0ssKOX8Ceabhnr0Lh4qeWw914gNco4azDtiu9
         oA3tZeLm1s5UVBfdbcz+Z3OpXsOsTZDxCErgnydcH2AI3iYhmH7163uMiQHV8JDlH8BW
         R3Uwpi2hm1K3IVCl1Lm1Gnz+v19c0/PzurB9oPBfxDIAnf0PzmronhrJtlW+DPUK4DIn
         v0xyTXaiVsAoh1WVDeGrtrQ5zUBupX4MW+vM3D2ZvH/AFHp96EWGhFTS7VKJ8F/gQJCs
         v8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699433076; x=1700037876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qu6xuDhGJ5JPWC5oSGyyY7P53x8jjCQYiy8YEQLeeo=;
        b=wfQA1Pz7LkUs54ZBMrtWZpwjYJ0XL6LVW1kJ16Iq1TL+/aDpQXoetEHz4FvyHMJlyS
         Qvuh+RH/o+eLXkLU+tU0jFrPTwM8qLYs6IktdpRlZt8RXu4k0QS+raNIlVAJEZJLFkNo
         ISQtJQswks1nui+XohzOJvxX9Aa5aWYx1PcifKE2cSSWaogWVRbqQbBl0LM8aeC1oB5K
         jycMz8XGayCw8t0KBjptZlENP11PMHOFHETF02xO1JU6kWtlyDB8bB4K3lWpC0rvIxH+
         kYBtnMSjX8dycelu7uLOXkPqMbtEZRSvMm0PfUDsFf+UFe8qUyEFxkA15kbveY7KoQFp
         6YuA==
X-Gm-Message-State: AOJu0YwHbU5uytV8kZNB/zepTf6qZWnUGGDIztFPL1LNZOiVJ/soF4gz
	3cwPrr497OchS2iRGFfgH41trFj6KskLKzTO1XHA1Q==
X-Google-Smtp-Source: AGHT+IGyWNKdsQPn0juqLKFUlvmF17TwBL6KgBg6m2mliS9T29mVwbiqFgwdC+K06dLDG1APWCHyg0Dmv5+/5eV19Dg=
X-Received: by 2002:a50:9eeb:0:b0:544:4762:608 with SMTP id
 a98-20020a509eeb000000b0054447620608mr246797edf.2.1699433075593; Wed, 08 Nov
 2023 00:44:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031093921.755204-1-guanyulin@google.com> <2023103133-kelp-copartner-8e9c@gregkh>
In-Reply-To: <2023103133-kelp-copartner-8e9c@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 8 Nov 2023 16:44:24 +0800
Message-ID: <CAOuDEK3x95u6+68e=fkejnjWhRrA5Yt1qTaAG3Prje8C-+6dmw@mail.gmail.com>
Subject: Re: [PATCH] rpm: pm: enable PM_RPM_EXCEPTION config flag
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz, 
	stern@rowland.harvard.edu, heikki.krogerus@linux.intel.com, 
	mkl@pengutronix.de, hadess@hadess.net, mailhol.vincent@wanadoo.fr, 
	ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, pumahsu@google.com, 
	raychi@google.com, albertccwang@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 5:48=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Oct 31, 2023 at 05:38:55PM +0800, Guan-Yu Lin wrote:
> > Introducing PM_RPM_EXCEPTION config flag, which may alter the priority
> > between system power management and runtime power management. In
> > suspend-to-idle flow, PM core will suspend all devices to avoid device
> > interact with the system. However, chances are devices might be used by
> > other systems rather than a single system. In this case, PM core should=
n't
> > suspend the devices. One may use PM_RPM_EXCEPTION config flag to mark
> > such exception, and determine the power state of a device with runtime
> > power management rather than system power management.
> >
> > Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> > ---
> >  drivers/usb/core/generic.c |  6 ++++++
> >  drivers/usb/core/usb.h     | 16 ++++++++++++++++
> >  kernel/power/Kconfig       |  8 ++++++++
> >  3 files changed, 30 insertions(+)
> >
> > diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> > index 740342a2812a..bb0dfcfc9764 100644
> > --- a/drivers/usb/core/generic.c
> > +++ b/drivers/usb/core/generic.c
> > @@ -266,6 +266,9 @@ int usb_generic_driver_suspend(struct usb_device *u=
dev, pm_message_t msg)
> >  {
> >       int rc;
> >
> > +     if (usb_runtime_pm_exception(udev))
> > +             return 0;
> > +
> >       /* Normal USB devices suspend through their upstream port.
> >        * Root hubs don't have upstream ports to suspend,
> >        * so we have to shut down their downstream HC-to-USB
> > @@ -294,6 +297,9 @@ int usb_generic_driver_resume(struct usb_device *ud=
ev, pm_message_t msg)
> >  {
> >       int rc;
> >
> > +     if (usb_runtime_pm_exception(udev))
> > +             return 0;
> > +
> >       /* Normal USB devices resume/reset through their upstream port.
> >        * Root hubs don't have upstream ports to resume or reset,
> >        * so we have to start up their downstream HC-to-USB
> > diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
> > index 60363153fc3f..14a054f814a2 100644
> > --- a/drivers/usb/core/usb.h
> > +++ b/drivers/usb/core/usb.h
> > @@ -90,6 +90,22 @@ extern void usb_major_cleanup(void);
> >  extern int usb_device_supports_lpm(struct usb_device *udev);
> >  extern int usb_port_disable(struct usb_device *udev);
> >
> > +#ifdef       CONFIG_PM_RPM_EXCEPTION
> > +
> > +static inline int usb_runtime_pm_exception(struct usb_device *udev)
> > +{
> > +     return atomic_read(&udev->dev.power.usage_count);
> > +}
> > +
> > +#else
> > +
> > +static inline int usb_runtime_pm_exception(struct usb_device *udev)
> > +{
> > +     return 0;
> > +}
> > +
> > +#endif
> > +
> >  #ifdef       CONFIG_PM
> >
> >  extern int usb_suspend(struct device *dev, pm_message_t msg);
> > diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> > index 4b31629c5be4..beba7a0f3947 100644
> > --- a/kernel/power/Kconfig
> > +++ b/kernel/power/Kconfig
> > @@ -193,6 +193,14 @@ config PM
> >         responsible for the actual handling of device suspend requests =
and
> >         wake-up events.
> >
> > +config PM_RPM_EXCEPTION
> > +     bool "Prioritize Runtime Power Management more than Power Managem=
ent"
> > +     default n
>
> The default is always 'n' so no need to specify it.
>

Thanks, I will include this in the next version.

> > +     help
> > +     Provides a way to prioritize Runtime Power Management more than P=
ower
> > +     Management. This way system can suspnd with maintaining specific
> > +     components in operation.
>
> This really doesn't give me a good description of why someone would ever
> want to enable this at all.
>
> And why does this have to be a build option?  That feels very heavy, why
> not make it changable at runtime?
>
> If this is a build option, how are you going to get all the distros and
> all of the Android/ChromeOS systems in the world to enable it?
>
> thanks,
>
> greg k-h

Let's reach a consensus on what this patch should do first. I'll then
change the description and implementation accordingly if needed. Please
see the next reply for an explanation of my idea.

Thanks,
Guan-Yu

