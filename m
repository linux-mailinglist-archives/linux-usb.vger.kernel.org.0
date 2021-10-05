Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22CC0422111
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 10:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233312AbhJEIsJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 04:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbhJEIsH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 04:48:07 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16C2C061749
        for <linux-usb@vger.kernel.org>; Tue,  5 Oct 2021 01:46:16 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b20so83633226lfv.3
        for <linux-usb@vger.kernel.org>; Tue, 05 Oct 2021 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2XcUpJPfTy5QEwAH/Xm2eJXv/Zjhn/CbqgwcIVdR3Ko=;
        b=StXvAQCBgcoX52kszMxZz5N8R1x7Jgws/vzvdghPVQAxrXcGRe2RV40TtiBs01cHvb
         4a5hw6zBLLU11txa6ewFuW9GpUN94HGnLOEV6ABOkN/9NWcwu7jcjaojZzLlNklwrgPD
         dpIvqQ39l/x1H3aGnXsOZUFdHRyasRBY5NQd8N8R3/OV70vtN1crrVBsGUPIpB2iOyv0
         UZx+tqDe1nAs0yHDAToyTIIFcp9uipa16SSJ3+3DlZT3pK7Ak8o+tJ1Rnlf5JuyuntNb
         XAyihgpLL6GB1mGseG20od2eroj4LTOulwyKeLzypAzWsA4UW3y49HvFCk9klXyRwvmI
         pPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2XcUpJPfTy5QEwAH/Xm2eJXv/Zjhn/CbqgwcIVdR3Ko=;
        b=le1rb9izQPR475fXlD7isj//bFOJa2DqTDhYPnFBMzzPUmOjtG6xX1/PASQCOQyePf
         ejlX7AzRm7FocFuGZVHppambQKJ/x5Zq4th7zm/9UVwUwa6fnMv4TOHekA2fK/51f+81
         HcbE3XcdzrkPBMv4tJp4nS+iSrkgekyKNbZNgfRgrpKyTmiuUPNzUXdZYnSkMbTf29pm
         NvohLlaGrUDh8sQSdoobXUM5oonzF6SYUmvQ8NSwHMhiVC+k7ncTd/jM7pX30z7GMJ5g
         QQrJlhIWogK4Yl4+l3ZqisGdkpJU7FErt1PGk/9uhT6k4LKSfxxk+kqEtICv5XF1P1+l
         feIg==
X-Gm-Message-State: AOAM533rua77HAJ579qerfd+nVQgq/QEA01YGf/CCQHqwTZHjVi8dQK/
        xTbPGrcwtjrerWQev177iZWt1nxnR86U1v8Dtq0SDQ==
X-Google-Smtp-Source: ABdhPJykqgW510fRv0PXxhEsYvLSC1wn3+yBs/rj2+Acwz1tRjhApok8H3vRKI1vEzEqYcUMDwpiGAqI/4xOyfOJSWs=
X-Received: by 2002:a19:e307:: with SMTP id a7mr1560996lfh.358.1633423575163;
 Tue, 05 Oct 2021 01:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com> <20210926224058.1252-14-digetx@gmail.com>
 <CAPDyKFpzhv1UxjM0q5AWHVxTWC_cCO_Kg_6exO0o_=EoVvjo+w@mail.gmail.com>
 <aad7a508-7fb5-3418-f902-def80c365094@gmail.com> <CAPDyKFppSuP6FfaBaGn3o+8WvTT=vJ8XMzZ47WPQ1JKiUYyEpw@mail.gmail.com>
 <8d75436d-864a-7ce0-ba53-daa8b663035a@gmail.com> <CAPDyKFpqs5gUcym4q+GuiJy13eXqjEnx-eFdUT4bQpcfPAOEYw@mail.gmail.com>
 <f5b5e06a-71ed-1250-f0ad-692062e00e01@gmail.com>
In-Reply-To: <f5b5e06a-71ed-1250-f0ad-692062e00e01@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 5 Oct 2021 10:45:38 +0200
Message-ID: <CAPDyKFpWzLdKr0bYX4VYwNpPuJNEs=weEpNpDH6zfv9e8SaxJQ@mail.gmail.com>
Subject: Re: [PATCH v13 13/35] drm/tegra: gr2d: Support generic power domain
 and runtime PM
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 4 Oct 2021 at 17:57, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 04.10.2021 14:01, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, 1 Oct 2021 at 21:00, Dmitry Osipenko <digetx@gmail.com> wrote:
> >>
> >> 01.10.2021 17:55, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Fri, 1 Oct 2021 at 16:29, Dmitry Osipenko <digetx@gmail.com> wrote=
:
> >>>>
> >>>> 01.10.2021 16:39, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> w=
rote:
> >>>>>>
> >>>>>> Add runtime power management and support generic power domains.
> >>>>>>
> >>>>>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> >>>>>> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> >>>>>> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1=
 T124
> >>>>>> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> >>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/tegra/gr2d.c | 155 ++++++++++++++++++++++++++++++=
+++--
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>>  static int gr2d_remove(struct platform_device *pdev)
> >>>>>> @@ -259,15 +312,101 @@ static int gr2d_remove(struct platform_devi=
ce *pdev)
> >>>>>>                 return err;
> >>>>>>         }
> >>>>>>
> >>>>>> +       pm_runtime_dont_use_autosuspend(&pdev->dev);
> >>>>>> +       pm_runtime_disable(&pdev->dev);
> >>>>>
> >>>>> There is no guarantee that the ->runtime_suspend() has been invoked
> >>>>> here, which means that clock may be left prepared/enabled beyond th=
is
> >>>>> point.
> >>>>>
> >>>>> I suggest you call pm_runtime_force_suspend(), instead of
> >>>>> pm_runtime_disable(), to make sure that gets done.
> >>>>
> >>>> The pm_runtime_disable() performs the final synchronization, please =
see [1].
> >>>>
> >>>> [1]
> >>>> https://elixir.bootlin.com/linux/v5.15-rc3/source/drivers/base/power=
/runtime.c#L1412
> >>>
> >>> pm_runtime_disable() end up calling _pm_runtime_barrier(), which call=
s
> >>> cancel_work_sync() if dev->power.request_pending has been set.
> >>>
> >>> If the work that was punted to the pm_wq in rpm_idle() has not been
> >>> started yet, we end up just canceling it. In other words, there are n=
o
> >>> guarantees it runs to completion.
> >>
> >> You're right. Although, in a case of this particular patch, the syncin=
g
> >> is actually implicitly done by pm_runtime_dont_use_autosuspend().
> >>
> >> But for drivers which don't use auto-suspend, there is no sync. This
> >> looks like a disaster, it's a very common pattern for drivers to
> >> 'put+disable'.
> >>
> >>> Moreover, use space may have bumped the usage count via sysfs for the
> >>> device (pm_runtime_forbid()) to keep the device runtime resumed.
> >>
> >> Right, this is also a disaster in a case of driver removal.
> >>
> >>>> Calling pm_runtime_force_suspend() isn't correct because each 'enabl=
e'
> >>>> must have the corresponding 'disable'. Hence there is no problem her=
e.
> >>>
> >>> pm_runtime_force_suspend() calls pm_runtime_disable(), so I think tha=
t
> >>> should be fine. No?
> >>
> >> [adding Rafael]
> >>
> >> Rafael, could you please explain how drivers are supposed to properly
> >> suspend and disable RPM to cut off power and reset state that was
> >> altered by the driver's resume callback? What we're missing? Is Ulf's
> >> suggestion acceptable?
> >>
> >> The RPM state of a device is getting reset on driver's removal, hence
> >> all refcounts that were bumped by the rpm-resume callback of the devic=
e
> >> driver will be screwed up if device is kept resumed after removal. I
> >> just verified that it's true in practice.
> >
> > Note that, what makes the Tegra drivers a bit special is that they are
> > always built with CONFIG_PM being set (selected from the "SoC"
> > Kconfig).
> >
> > Therefore, pm_runtime_force_suspend() can work for some of these
> > cases. Using this, would potentially avoid the driver from having to
> > runtime resume the device in ->remove(), according to the below
> > generic sequence, which is used in many drivers.
> >
> > pm_runtime_get_sync()
> > clk_disable_unprepare() (+ additional things to turn off the device)
> > pm_runtime_disable()
> > pm_runtime_put_noidle()
>
> It's not a problem to change this patchset. The problem is that if
> you'll grep mainline for 'pm_runtime_disable', you will find that there
> are a lot of drivers in a potential trouble.

Let's start by fixing this patchset, please - then we can consider
what to do with the other cases separately.

>
> I'm proposing that we should change pm_runtime_disable() to perform the
> syncing with this oneliner:
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index ec94049442b9..5c9f28165824 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1380,6 +1380,8 @@ EXPORT_SYMBOL_GPL(pm_runtime_barrier);
>   */
>  void __pm_runtime_disable(struct device *dev, bool check_resume)
>  {
> +       flush_work(&dev->power.work);
> +

What about the latency this may introduce? I am not sure that is
acceptable here!?

>         spin_lock_irq(&dev->power.lock);
>
>         if (dev->power.disable_depth > 0) {
>
> Objections?
>
> The sysfs rpm-forbid is a separate problem and it's less troublesome
> since it requires root privileges. It's also not something that
> userspace touches casually. For now I don't know what could be done
> about it.

As I said, the common method to address this problem is to run the
following sequence:

pm_runtime_get_sync()
"power off the device"
pm_runtime_disable()
pm_runtime_put_noidle()

This works even if user space, via sysfs, has triggered a call to
pm_runtime_forbid(). Or doesn't it?

If you don't like it, pm_runtime_force_suspend() should work too, at
least for your cases, I believe.

Kind regards
Uffe
