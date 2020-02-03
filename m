Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF92150E94
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2020 18:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgBCRWv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Feb 2020 12:22:51 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:44503 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727256AbgBCRWv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Feb 2020 12:22:51 -0500
Received: by mail-qk1-f195.google.com with SMTP id v195so14916563qkb.11;
        Mon, 03 Feb 2020 09:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6/cBxnD7mpJD+mX2iJGDyMh53uCYt06BHk7pKKKLPUM=;
        b=srjlLXGkGyAMswc1iIACvcV/rmXobKrnNVpuQuYAHDcyDDK4XYwYtGGB9XIGT33j89
         uJQLhK+nb/dlaeoi8TlQ+VRnS6+a1MFH0NY44bFfLdDXoUWklFw5Eq5jVKYIhknxbnzo
         x4F3Vq7ua+JFkzFNEAMnnupgVHv68KpbgaGSRNkn41e9e94XjoJYSZxVE5R360mkwfML
         e2sqaOU36yQ1oBZLO8suFNDq2TkkQUgHwGgUkRH3q9oiw+q++uMGAMwFOv5jv85oXGaH
         oAJnp2HrWV+1FwIA82xiEKXKkIkSmyTHHgCHAbeYI4hreXv7F3wFMFnFcQ1fXSfEngGB
         +U2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6/cBxnD7mpJD+mX2iJGDyMh53uCYt06BHk7pKKKLPUM=;
        b=klKTVptgeP5IVzXLR2PhUSqedHzw0EXGhxqw/59yL5TSTIapSJ16fUlK4cBpVyo14P
         AtqduR4BDm+sdPOqT42wKzu24QU6zWwiEdmjcurOBB3e2UJJtyqofquEiKl575bSIAb1
         kkmyXErEBDbGt0D6jvN7p8ZqYAIAm/OpuQocRB3f7h3wvjloI+/3Jmlk3F+9wCeZVTkC
         fyIAqK9p8TnRCB3ZEDYL/fZBNTsAJ+YoGcO9EBeyjwZnaR4PsYoIrIQE4K0J/AhQVUvX
         CDI62Srn6E76r+O26VSv2gn4x0RRIdONdNhRtblGrJTO6HhDtVIsLg9buAa4JOSfZUSA
         tQeQ==
X-Gm-Message-State: APjAAAVcBicvmhZ6Wlh3N8Les2kYsqiYm3MRuQMwcMzQI20wKabj10vK
        Fexu8o0QJCEFNkxkkjO9vK85QjRdfmkJVutMdkI=
X-Google-Smtp-Source: APXvYqw5oaLV+8OT73l7AcBMObl4B6UNsDYVtYvoOkyxdi1DDYfUIxfef8R9VNE9i5TZt1Rd9fyEqEzN2r1174px+M8=
X-Received: by 2002:a05:620a:999:: with SMTP id x25mr23963087qkx.87.1580750569265;
 Mon, 03 Feb 2020 09:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20200127023548.27107-1-pgwipeout@gmail.com> <20200131052716.GA30672@b29397-desktop>
 <CAMdYzYqwz9HLsjvc1hDmovzWqiV_Vswe57d_gWhwBnvb2aNPyQ@mail.gmail.com> <20200201061330.GA9178@b29397-desktop>
In-Reply-To: <20200201061330.GA9178@b29397-desktop>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 3 Feb 2020 12:22:37 -0500
Message-ID: <CAMdYzYrbvsTunwxJLcC_-ZhczsQfyDLOjTnZ+eorb325qO-QhA@mail.gmail.com>
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Resending due to html screwup, apologies.

On Sat, Feb 1, 2020 at 1:13 AM Peter Chen <peter.chen@nxp.com> wrote:
>
> On 20-01-31 15:43:24, Peter Geis wrote:
> > On Fri, Jan 31, 2020 at 12:27 AM Peter Chen <peter.chen@nxp.com> wrote:
> > >
> > > On 20-01-26 21:35:48, Peter Geis wrote:
> > > > The ci_hdrc_tegra driver does not currently support dual role mode, but
> > > > it does not explicitly prevent its use.
> > > > Certain devices support dual role mode, but not automatic role switch.
> > > > This can cause the device to lock up during initialization of the
> > > > driver.
> > >
> > > If the driver only supports peripheral mode, you could set dr_mode as
> > > peripheral-only at glue layer, it would not be override by core.c.
> > > See ci_get_platdata.
> >
> > The mode is set via the device tree dr_mode property.
> > Even though the current tegra_udc driver does not currently support
> > mode switching, board device tree files such as the apalis-eval and
> > colibri-eval-v3 have dr_mode set to otg.
> >
>
> If you would like fixing wrong dts setting issue, you could do below:
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> index 0c9911d44ee5..5d85363ad0f4 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -95,6 +95,7 @@ static int tegra_udc_probe(struct platform_device *pdev)
>         udc->data.flags = soc->flags;
>         udc->data.usb_phy = udc->phy;
>         udc->data.capoffset = DEF_CAPOFFSET;
> +       udc->data.dr_mode = USB_DR_MODE_PERIPHERAL;
>
>         udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
>                                       pdev->num_resources, &udc->data);

I do not wish to set the dr_mode manually, since this could break
things on devices I do not own.
Future work is needed to address the tegra_udc capabilities, as well
as fully correct the hang issue.
This patch merely aims to fix a corner case.

>
> > They also seem to be missing the extcon phandle, which means automatic
> > mode switching is not possible?
> >
> > >
> > > But one thing I could not understand, if the driver doesn't support
> > > dual-role, how could you do manual role switch?
> >
> > Manual role switching is conducted via debugfs,
> > /sys/kernel/debug/usb/ci_hdrc.0/role
> >
> > >
> > > >
> > > > Detect this state by checking for the extcon phandle when dual role mode
> > > > is set to otg.
> > > > If it doesn't exist request the driver to only enable manual role
> > > > switching.
> > > >
> > > > Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
> > > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > > ---
> > > >  drivers/usb/chipidea/ci_hdrc_tegra.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > index 7455df0ede49..2f6f6ce3e8f5 100644
> > > > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > @@ -89,6 +89,13 @@ static int tegra_udc_probe(struct platform_device *pdev)
> > > >       udc->data.usb_phy = udc->phy;
> > > >       udc->data.capoffset = DEF_CAPOFFSET;
> > > >
> > > > +     /* check the dual mode and warn about bad configurations */
> > > > +     if (usb_get_dr_mode(&pdev->dev) == USB_DR_MODE_OTG &&
> > > > +        !of_property_read_bool(pdev->dev.of_node, "extcon")) {
> > > > +             dev_warn(&pdev->dev, "no extcon registered, otg unavailable");
> > > > +             udc->data.flags |= CI_HDRC_DUAL_ROLE_NOT_OTG;
> > > > +     }
> > > > +
> > >
> > > The CI_HDRC_DUAL_ROLE_NOT_OTG flag may not be suitable here, please see
> > > comments for it.
> >
> > I've dug around the various mailing lists and I fail to find any
> > reference to why this is not a valid use case.
> > The commit message specifically references dual role capable devices
> > without proper otg implementations, such as missing the otgsc
> > register.
> >
> > My current use case is the Ouya, which deadlocks the kernel durning
> > probe if the otg capable usb controller is set to dr_mode=otg.
> > It works with this flag set.
> > Unfortunately there isn't a property for dr_mode set to non_otg_dr_mode.
> >
> > I found a post stating that the driver blindly touches registers in
> > otg mode, which leads to the deadlock if those registers are read only
> > or non-existent,
> > Eventually someone should look into why this deadlock occurs and make
> > a proper fix that applies to all users.
> > Unfortunately I do not have the knowledge yet to accomplish this task.
> >
> > With some simple modifications to the tegra_udc driver it is possible
> > to get host mode working, vice using the tegra-ehci driver.
> > At this point role switch works
> >
> > I also managed to move all of the functionality of the tegra-ehci
> > driver into the tegra-udc driver.
> > Unfortunately it doesn't behave correctly under some cases, so I never
> > submitted it.
> >
> > Do you have a recommendation for handling this?
>
> If you would like adding host function in chipidea driver for tegra, and
> want dual-role switch to work, first, you may need to know which
> dual-role switch you need:
> - Through controller's id and vbus pins
> - Through extcon, eg,GPIO.
> - Through usb-role-switch class, eg, Type-C controller
> - Through sysfs, /sys/bus/platform/devices/ci_hdrc.0/role
>
> The first three are automatically switch, the last one is manually.
> Current chipidea core should support all above switches, maybe there are
> some limitations for them, the fixes are welcome.

AFAIK reading through the comments, the chipidea driver intended to
exclusively use extcon for automatic role switching, please correct me
if I'm wrong here.
USB-C support is not a likely scenario, as currently the chipidea
driver only supports usb 2.0.

>
> Second, you may check if touch otgsc will hang or deadlock the system.
> If you can't touch otgsc when portsc.phcd = 0, you may need the flag
> CI_HDRC_DUAL_ROLE_NOT_OTG, afaik, few SoCs can't touch otgsc if it
> supports dual-role.

I added some traces to the driver, and it doesn't actually appear to
be a register read/write that is breaking things. (Not directly
anyways).
The hang occurs after it enumerates the usb gadgets and hub.
Still trying to track down exactly where the hang occurs.

>
> When you add host function, you may set dr_mode as host-only first, it
> could make thing easier.
>
> --
>
> Thanks,
> Peter Chen
