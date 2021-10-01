Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EDC41F042
	for <lists+linux-usb@lfdr.de>; Fri,  1 Oct 2021 17:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354764AbhJAPDp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Oct 2021 11:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354770AbhJAPDk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Oct 2021 11:03:40 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FA7C06177E
        for <linux-usb@vger.kernel.org>; Fri,  1 Oct 2021 08:01:54 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u18so40181535lfd.12
        for <linux-usb@vger.kernel.org>; Fri, 01 Oct 2021 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wl3ZMyIoq68XUN9ZysEDdbNyOTOcWVKDq09iuCEsZmc=;
        b=nc/wRiOyNThsvZAoZqrqxfcMp5xM4+z3v5LBnRr7cDxfQB3CuDz+w9I+DrmCVjWOKl
         np27NqLQZ/GN1BOsQnTqAa2UnIwF19eGxu64prAseFDGzGs8fstw8HcPfShlYRQ0qE1c
         WBjvqHBepPh7/S1osWRA5oJkTk2LMoL8V+Rr/1CAVQRt+OOzX2VJn6rhiBggeGf0jaLd
         I5s3lo9wgue1e92EUCmCI977jDYPuMA5YYpLfqE1ZPhrxcH8sAmJV+ED8ef6hVn8S0D5
         bD46sji6e0iHnnK6F4WHN2ijZ4ehxPr5Lmm8HNBreW4wKt5dklt3O1Dh0kW0EnVCwAx4
         w7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wl3ZMyIoq68XUN9ZysEDdbNyOTOcWVKDq09iuCEsZmc=;
        b=EqxMxt7Z1V+Wkdg6ePscNsSQ5pWO9AOi9KrMqFKHk5JrdNZ5UzbtSxWRuhicALxxLL
         o0f74Wxlmx3+LPQFdNTjQtYORYpT7gI4+OLvn7wZW/SdxWXBtqOYUFtAqVXvvk7k0aja
         /PpKmrYv/G2PFO4xMtxaMhAtcD4sA1fJr6w2WJY8k7VPaDL2JcWisXbUUYGCsUZ9dJRY
         Zj5+Pvuw/z4lxp1iu5mDs5VIgKY4IXct1C12PJaoBE3lHpnBf9GRlFBr0+t3ct+jsQ3C
         WjDJ1E1HBJRP4BZdt9ahNt4rQdzzmh+b+pYlGN0/0h+qCa49ZwpchJdq6lXvFrQiz8Lr
         /qfQ==
X-Gm-Message-State: AOAM530IsrGWHBIydhQHOvZFaRbWeWzL5NqfUflT1Bn2loIj3W4g/gos
        0lEOj8yU9Sw2FlcT4v4X72Vf/sI0LUESXtd4w4HuQx+e/qVQiw==
X-Google-Smtp-Source: ABdhPJzMALxdSFVvKbncpXSAkoeLVU4WvZ1aDrH/nsBIXY0lecURQDTr7J6h8lUkTNpeSwp11syRcpWCl/bNnJtDs94=
X-Received: by 2002:a05:6512:2397:: with SMTP id c23mr5737854lfv.358.1633100509099;
 Fri, 01 Oct 2021 08:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com> <20210926224058.1252-21-digetx@gmail.com>
 <CAPDyKFoF2QxZss_h9B1NFqOqgeF=TQ6LajCedGiJ9_P8X5M0NA@mail.gmail.com> <0bcbcd3d-2154-03d2-f572-dc9032125c26@gmail.com>
In-Reply-To: <0bcbcd3d-2154-03d2-f572-dc9032125c26@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 1 Oct 2021 17:01:12 +0200
Message-ID: <CAPDyKFohA9iu2UQfwoc0pCrCGupdwnUTWjKOtP09_C2KaFSo8w@mail.gmail.com>
Subject: Re: [PATCH v13 20/35] mtd: rawnand: tegra: Add runtime PM and OPP support
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
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

On Fri, 1 Oct 2021 at 16:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 01.10.2021 17:24, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote=
:
> >>
> >> The NAND on Tegra belongs to the core power domain and we're going to
> >> enable GENPD support for the core domain. Now NAND must be resumed usi=
ng
> >> runtime PM API in order to initialize the NAND power state. Add runtim=
e PM
> >> and OPP support to the NAND driver.
> >>
> >> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/mtd/nand/raw/tegra_nand.c | 55 ++++++++++++++++++++++++++----=
-
> >>  1 file changed, 47 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/=
tegra_nand.c
> >> index 32431bbe69b8..098fcc9cb9df 100644
> >> --- a/drivers/mtd/nand/raw/tegra_nand.c
> >> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> >> @@ -17,8 +17,11 @@
> >>  #include <linux/mtd/rawnand.h>
> >>  #include <linux/of.h>
> >>  #include <linux/platform_device.h>
> >> +#include <linux/pm_runtime.h>
> >>  #include <linux/reset.h>
> >>
> >> +#include <soc/tegra/common.h>
> >> +
> >>  #define COMMAND                                        0x00
> >>  #define   COMMAND_GO                           BIT(31)
> >>  #define   COMMAND_CLE                          BIT(30)
> >> @@ -1151,6 +1154,7 @@ static int tegra_nand_probe(struct platform_devi=
ce *pdev)
> >>                 return -ENOMEM;
> >>
> >>         ctrl->dev =3D &pdev->dev;
> >> +       platform_set_drvdata(pdev, ctrl);
> >>         nand_controller_init(&ctrl->controller);
> >>         ctrl->controller.ops =3D &tegra_nand_controller_ops;
> >>
> >> @@ -1166,14 +1170,22 @@ static int tegra_nand_probe(struct platform_de=
vice *pdev)
> >>         if (IS_ERR(ctrl->clk))
> >>                 return PTR_ERR(ctrl->clk);
> >>
> >> -       err =3D clk_prepare_enable(ctrl->clk);
> >> +       err =3D devm_pm_runtime_enable(&pdev->dev);
> >> +       if (err)
> >> +               return err;
> >> +
> >> +       err =3D devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> >> +       if (err)
> >> +               return err;
> >> +
> >> +       err =3D pm_runtime_resume_and_get(&pdev->dev);
> >>         if (err)
> >>                 return err;
> >>
> >>         err =3D reset_control_reset(rst);
> >>         if (err) {
> >>                 dev_err(ctrl->dev, "Failed to reset HW: %d\n", err);
> >> -               goto err_disable_clk;
> >> +               goto err_put_pm;
> >>         }
> >>
> >>         writel_relaxed(HWSTATUS_CMD_DEFAULT, ctrl->regs + HWSTATUS_CMD=
);
> >> @@ -1188,21 +1200,19 @@ static int tegra_nand_probe(struct platform_de=
vice *pdev)
> >>                                dev_name(&pdev->dev), ctrl);
> >>         if (err) {
> >>                 dev_err(ctrl->dev, "Failed to get IRQ: %d\n", err);
> >> -               goto err_disable_clk;
> >> +               goto err_put_pm;
> >>         }
> >>
> >>         writel_relaxed(DMA_MST_CTRL_IS_DONE, ctrl->regs + DMA_MST_CTRL=
);
> >>
> >>         err =3D tegra_nand_chips_init(ctrl->dev, ctrl);
> >>         if (err)
> >> -               goto err_disable_clk;
> >> -
> >> -       platform_set_drvdata(pdev, ctrl);
> >> +               goto err_put_pm;
> >>
> >
> > There is no corresponding call pm_runtime_put() here. Is it
> > intentional to always leave the device runtime resumed after ->probe()
> > has succeeded?
> >
> > I noticed you included some comments about this for some other
> > drivers, as those needed more tweaks. Is that also the case for this
> > driver?
>
> Could you please clarify? There is pm_runtime_put() in both probe-error
> and remove() code paths here.

I was not considering the error path of ->probe() (or ->remove()), but
was rather thinking about when ->probe() completes successfully. Then
you keep the device runtime resumed, because you have called
pm_runtime_resume_and_get() for it.

Shouldn't you have a corresponding pm_runtime_put() in ->probe(),
allowing it to be runtime suspended, until the device is really needed
later on. No?

>
> I assume you're meaning pm_runtime_disable(), but this patch uses
> resource-managed devm_pm_runtime_enable(), and thus, explicit disable
> isn't needed.
>
> >>         return 0;
> >>
> >> -err_disable_clk:
> >> -       clk_disable_unprepare(ctrl->clk);
> >> +err_put_pm:
> >> +       pm_runtime_put(ctrl->dev);
> >>         return err;
> >>  }
> >>

[...]

Kind regards
Uffe
