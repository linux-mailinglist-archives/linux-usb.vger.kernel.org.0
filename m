Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903A348A203
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 22:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244420AbiAJVhi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 16:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244307AbiAJVhi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 16:37:38 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCEDC06173F
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 13:37:37 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id t24so11303360edi.8
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 13:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=upcP9rsse8OqtR73l6P4ZWFIF5fd7LlxmM1BaMcZ4JM=;
        b=GVI16JJVEQveaYuxM2KesENO07DjBtoIq2K7Qh1RCEfz0zyucDDf/K9BmwUW6oT8fe
         FdgT3PEpopZntBzFGnTqultFulZEL+EEk4N3aY4tz2Dn2Z+yfNdy7hG+b8c94Kucpt4m
         KK3c9EXrANlfa9YZYdSuFEijWSkJzPELO1/vhia2xQynn1Iq30aKLPq0jOBhoRv0ov/R
         LgIFdN9PcPqoF50kPjga/qi/OpM6b6BNntMFFtPaBdseRVH+Sdb3wo5I45rQPdqvedYi
         BR2aIMfs0wLal5vKENDkCZWLOPOinjTRoW5u8vvTrqyO3B1WjGrvHk9ghkG4Z2Nz85aM
         knmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=upcP9rsse8OqtR73l6P4ZWFIF5fd7LlxmM1BaMcZ4JM=;
        b=ZMiPCDQbNpiyP8UJOcpqmzf68BqG78NUq4v6Aa16z0YHhajONGCw4AVVOtm0Im69Cu
         iC6MoeB/4m9Ml1dFw5Kcl2an4nB/20nEEx1BYSPsWU5Sjff7dfl8DpXeTBz/+vW+iyNe
         4zFK57cBLE313l2TZdwOlQJectv/KOPMZ58D7j48hSULhc3LKDyW0qUwIsQX9QOaZWv4
         WInjVHRmD7z/50xrkJ+9Z5U+dPlKG3B3s/mHwRZw8vQLW510FFW4MAH31JMRBTuAKCRl
         ewJfRrESIYUg8lEdEzeNawxLKLAgOJgUM6MPEJuOEE9W8A/ywUP0WYqMjXwN+cjY4DTT
         pz/Q==
X-Gm-Message-State: AOAM532c8L+uYyNrCcPkxjE5J2qWy3U9I+lEc1iuyFd35lfGWR2UbPe4
        1ez5V/JvkuYDZitYPTRrTQstX/3GxAjV5IDuQTnIoKOQ
X-Google-Smtp-Source: ABdhPJxcGKzTtb8/Ou45TIDAwxpIsmjc43onLgnw6ic5Z81LB78/19KY6VPE6nd+iJcrJDkq2DNd5cZ+XdsRBB8lZI4=
X-Received: by 2002:a17:907:1c8c:: with SMTP id nb12mr1201651ejc.433.1641850656217;
 Mon, 10 Jan 2022 13:37:36 -0800 (PST)
MIME-Version: 1.0
References: <PAXPR04MB91861A98BE9D240FFEC1D560884D9@PAXPR04MB9186.eurprd04.prod.outlook.com>
 <20220110123350.GA4302@Peter> <3588ae48-e40e-1c9c-c841-cf54f59ad70b@linux.intel.com>
In-Reply-To: <3588ae48-e40e-1c9c-c841-cf54f59ad70b@linux.intel.com>
From:   Zhi Li <lznuaa@gmail.com>
Date:   Mon, 10 Jan 2022 15:37:24 -0600
Message-ID: <CAHrpEqT2VrggaGOGPv8sGbDTc+syNPtwcLnz4OZsiAG4pWfHjg@mail.gmail.com>
Subject: Re: xhci crash at xhci_disable_hub_port_wake when system suspend.
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Peter Chen <peter.chen@kernel.org>, Frank Li <frank.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 10, 2022 at 3:06 PM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 10.1.2022 14.33, Peter Chen wrote:
> > On 22-01-07 15:58:26, Frank Li wrote:
> >> Mathias Nyman
> >>
> >>      Recently we found a crash at xhci_disable_hub_port_wake when system suspend if enable remote wake up.
> >>
> >>      Basial flow is.
> >>
> >>      1. run time suspend call xhci_suspend, xhci parent devices gate the clock.
> >>      2. echo mem >/sys/power/state, system _device_suspend call xhci_suspend
> >>      3. xhci_suspend call xhci_disable_hub_port_wake, which access register, but clock already gated by run time pm.
> >>
> >>      Why find this issue now, that is because previous power domain driver will call run time resume before it. But the below commit remove it.
> >>
> >> c1df456d0f06eb9275c1cd4c66548fc5738ea428
> >> Author: Ulf Hansson ulf.hansson@linaro.org
> >> Date:   Thu Mar 4 20:28:43 2021 +0100
> >>
> >>     PM: domains: Don't runtime resume devices at genpd_prepare()
> >>
> >>
> >>
> >> According to HCD_FLAG_HW_ACCESSIBLE logic, xhci should not access hardware when second time call xhci_suspend without call xhci_resume.
> >>
> >>         xhci_disable_hub_port_wake(xhci, &xhci->usb3_rhub, do_wakeup);
> >>         xhci_disable_hub_port_wake(xhci, &xhci->usb2_rhub, do_wakeup);
> >>
> >>         if (!HCD_HW_ACCESSIBLE(hcd))
> >>                 return 0;
> >>
> >>         .....
> >>         clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
> >>         clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
> >>
> >> I am not sure if it is safe to move xhci_disable_hub_port_wake after HCD_HW_ACCESSIBLE check, Or need add additional run_time_resume before it.
>
> We probably need to runtime resume first in case we need to adjust the wakeup settings
>
> >
> > Frank, I prefer adding runtime resume at xhci-plat.c like below, let's see what
> > Mathias says.
> >
> >
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > index c1edcc9b13ce..47a5a10381a7 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -440,6 +440,9 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
> >       ret = xhci_priv_suspend_quirk(hcd);
> >       if (ret)
> >               return ret;
> > +
> > +     if (pm_runtime_suspended(dev))
> > +             pm_runtime_resume(dev);
> >       /*
> >        * xhci_suspend() needs `do_wakeup` to know whether host is allowed
> >        * to do wakeup during suspend.
> >
>
> Yes, looks like a solution to me.
> Just checked that driver-api/pm/devices.rst also suggest calling
> pm_runtime_resume() in ->suspend callback if device needs to adjust wakeup
> capabilities.
>
> Frank Li, does this work for you?

Yes, patch already sent.

>
> Peter, if we now make sure xhci host is not runtime suspended at system suspend,
> does it mean that the !HCD_HW_ACCESSIBLE(hcd) check you added to xhci_suspend()
> is no longer needed?
>
> 18a367e8947d usb: xhci: omit duplicate actions when suspending a runtime suspended host
>
> Thanks
> -Mathias
