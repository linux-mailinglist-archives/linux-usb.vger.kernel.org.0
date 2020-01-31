Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACB5B14F34E
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 21:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgAaUnj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 15:43:39 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:39054 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgAaUnj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 15:43:39 -0500
Received: by mail-qt1-f196.google.com with SMTP id c5so6472883qtj.6;
        Fri, 31 Jan 2020 12:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3yf1HBcmGp74avg3FEmlzcI0q9y8WZG9wLGEm4kfw0o=;
        b=aRPFXJET+/27gV3ghHOgxRdxeeg3oMuVgOD1aGcTdvKW8z5cYfiqrVB9P9XdtFVhz+
         6JH+JmJ9EmpLHeMbT1/3id8Nh2oHlDNVQaaWt2J/JeP9GS7swtIVgZgbdE7ZV1l/xLLS
         i4a8YchU1drjpab9N4uXb2m4TAGKrcqDU5fSz2IW+OjRbiiinqMn8stSn90HA1zhxP2n
         0oe9iZVUzQryJStUGK9cN5yYfSLpMqEA2Jr+HoWV+lKju0M3YMszqu/fhSNi0gZ0pBuR
         Kk7yO8gx8lSU1XvXhd0s+EOTHUCAU4p61Tp225ZJAqOYKZDKdRQjnadBMYIBlhZPEz1p
         Pqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3yf1HBcmGp74avg3FEmlzcI0q9y8WZG9wLGEm4kfw0o=;
        b=bw5V9K0iyv6FFiK2/ast6cF1/CBVLfN1qjp7fzt8i1n179LU/dC2dRKa+kZ8M37k9/
         t4my3tHvWWYYZAEbK/QvPs9/gOTr+1j7hKzzTfRqDSQ2MXfV7l55t9DoYxaDOl82Dbhm
         aynMrFaCLUdCr4mQqrb6MQMkfqDX4vbp1v5UTmaC7MjxeR42M0nyitDRWOToStw2qAzH
         n0gqFUrSGF8IBqSlV+LVupxGlAedv83c8GYvDt7o0AwsHiBPRntnZYWqMFuofq833P7W
         x5ctgeiPNnVLJjoBCLUPqGpZ+ggvxC4G4E4xnJZhjnRT2u6WU4pWU/jSV+J24ky7PJM7
         Qpdw==
X-Gm-Message-State: APjAAAWbuaFNR+Av1aaFCna8rs45bhxsEyJ0InF1Hc+at2zseNtbGKeo
        nBIchNpZ1sGDmT+zforybIBUJwqmIs6TYtg70Wbl7CQs
X-Google-Smtp-Source: APXvYqyzNpBU3RqLs9XJBT4QnlK08sbTR5l5DjqEsUBSFBDGHsRS6xGiLt/vUM20XXju6sjpsoaCHyuwTD6xrc+G6c4=
X-Received: by 2002:ac8:1385:: with SMTP id h5mr12302612qtj.59.1580503418369;
 Fri, 31 Jan 2020 12:43:38 -0800 (PST)
MIME-Version: 1.0
References: <20200127023548.27107-1-pgwipeout@gmail.com> <20200131052716.GA30672@b29397-desktop>
In-Reply-To: <20200131052716.GA30672@b29397-desktop>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Fri, 31 Jan 2020 15:43:24 -0500
Message-ID: <CAMdYzYqwz9HLsjvc1hDmovzWqiV_Vswe57d_gWhwBnvb2aNPyQ@mail.gmail.com>
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

On Fri, Jan 31, 2020 at 12:27 AM Peter Chen <peter.chen@nxp.com> wrote:
>
> On 20-01-26 21:35:48, Peter Geis wrote:
> > The ci_hdrc_tegra driver does not currently support dual role mode, but
> > it does not explicitly prevent its use.
> > Certain devices support dual role mode, but not automatic role switch.
> > This can cause the device to lock up during initialization of the
> > driver.
>
> If the driver only supports peripheral mode, you could set dr_mode as
> peripheral-only at glue layer, it would not be override by core.c.
> See ci_get_platdata.

The mode is set via the device tree dr_mode property.
Even though the current tegra_udc driver does not currently support
mode switching, board device tree files such as the apalis-eval and
colibri-eval-v3 have dr_mode set to otg.

They also seem to be missing the extcon phandle, which means automatic
mode switching is not possible?

>
> But one thing I could not understand, if the driver doesn't support
> dual-role, how could you do manual role switch?

Manual role switching is conducted via debugfs,
/sys/kernel/debug/usb/ci_hdrc.0/role

>
> >
> > Detect this state by checking for the extcon phandle when dual role mode
> > is set to otg.
> > If it doesn't exist request the driver to only enable manual role
> > switching.
> >
> > Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_tegra.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > index 7455df0ede49..2f6f6ce3e8f5 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > @@ -89,6 +89,13 @@ static int tegra_udc_probe(struct platform_device *pdev)
> >       udc->data.usb_phy = udc->phy;
> >       udc->data.capoffset = DEF_CAPOFFSET;
> >
> > +     /* check the dual mode and warn about bad configurations */
> > +     if (usb_get_dr_mode(&pdev->dev) == USB_DR_MODE_OTG &&
> > +        !of_property_read_bool(pdev->dev.of_node, "extcon")) {
> > +             dev_warn(&pdev->dev, "no extcon registered, otg unavailable");
> > +             udc->data.flags |= CI_HDRC_DUAL_ROLE_NOT_OTG;
> > +     }
> > +
>
> The CI_HDRC_DUAL_ROLE_NOT_OTG flag may not be suitable here, please see
> comments for it.

I've dug around the various mailing lists and I fail to find any
reference to why this is not a valid use case.
The commit message specifically references dual role capable devices
without proper otg implementations, such as missing the otgsc
register.

My current use case is the Ouya, which deadlocks the kernel durning
probe if the otg capable usb controller is set to dr_mode=otg.
It works with this flag set.
Unfortunately there isn't a property for dr_mode set to non_otg_dr_mode.

I found a post stating that the driver blindly touches registers in
otg mode, which leads to the deadlock if those registers are read only
or non-existent,
Eventually someone should look into why this deadlock occurs and make
a proper fix that applies to all users.
Unfortunately I do not have the knowledge yet to accomplish this task.

With some simple modifications to the tegra_udc driver it is possible
to get host mode working, vice using the tegra-ehci driver.
At this point role switch works

I also managed to move all of the functionality of the tegra-ehci
driver into the tegra-udc driver.
Unfortunately it doesn't behave correctly under some cases, so I never
submitted it.

Do you have a recommendation for handling this?

>
> >       udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
> >                                     pdev->num_resources, &udc->data);
> >       if (IS_ERR(udc->dev)) {
> > --
> > 2.17.1
> >
>
> --
>
> Thanks,
> Peter Chen
