Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C414F9F5F
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 23:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239675AbiDHVzS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Apr 2022 17:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234866AbiDHVzQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Apr 2022 17:55:16 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBA7C749A
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 14:53:12 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id i23-20020a9d6117000000b005cb58c354e6so6981345otj.10
        for <linux-usb@vger.kernel.org>; Fri, 08 Apr 2022 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=upGOKPkrJMozhsjjqNUMXi66ogcvnwrXlDX4ym1TGLA=;
        b=hrZaQmBCUyJZW6wffXoSSRs0CAPMsB0ifSU5q6ky2L2OtPFtUNq9YvbA/F3r5HyNPE
         qHOd6SajnjFuxXm9fqxu2RtYzk62GOH2NZXHRfg0BEDtVIGl+Ol2EIpBfvsPZ7DhnCpX
         ba5bzjISfbn9MqjFO20sDWWikbuRyc2w+cTzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=upGOKPkrJMozhsjjqNUMXi66ogcvnwrXlDX4ym1TGLA=;
        b=Sa1AMe9mT+NX1enacQ1osYaC9fw+FxRJiz0wqstpwm5hWcTs62lX5ANqzpsNWlyOqJ
         ctWHgSdd+eaEN9YOU9n3uaNaimJHMT2wlUjtzvG41nfflut/44GRoM7PdKCLr17S+qge
         0bXsqUCleBdVv01ql2wvpvaKXR+5NtM4U+Hyo4Qydtlf6B62qXLMsmyQyzQcZxEM5IRo
         TtzOu7dT5IYlKj9/h5JWzFkNRlvQvFAar9MD5clG0CE6YfQfayna5llnTS5qDSKK6WTr
         Ar55M01mLhiYGsSeDqBM9/cfm5Gh7FitE+zS+Ki/NRHvULqetHMPwGMgmZ2AzwfUO19j
         bP9A==
X-Gm-Message-State: AOAM533AvhGnnhtYVjeZwfkXU2aBXgkXMMQtp9vbjPvP0w7xTjOnth4n
        7OW3HxNe6fxMSe/1Qb+K9S8CBYmRqN5MXw==
X-Google-Smtp-Source: ABdhPJy7VZjOCTvLmTxHQv00OR/HT0gYim2gufo6O+mZ7ZpF9WlbRELy1RHYvk/40VdsL+9qcAYA+w==
X-Received: by 2002:a9d:6b18:0:b0:5e6:926c:7412 with SMTP id g24-20020a9d6b18000000b005e6926c7412mr7493132otp.43.1649454789730;
        Fri, 08 Apr 2022 14:53:09 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id h59-20020a9d2f41000000b005e6bbde77a8sm1591717otb.76.2022.04.08.14.53.07
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 14:53:07 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-df22f50e0cso11139852fac.3
        for <linux-usb@vger.kernel.org>; Fri, 08 Apr 2022 14:53:07 -0700 (PDT)
X-Received: by 2002:a05:6870:f295:b0:e1:ea02:2001 with SMTP id
 u21-20020a056870f29500b000e1ea022001mr1923445oap.241.1649454786825; Fri, 08
 Apr 2022 14:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220407115918.1.I8226c7fdae88329ef70957b96a39b346c69a914e@changeid>
 <YlBGvFFSp/R2CBmh@rowland.harvard.edu>
In-Reply-To: <YlBGvFFSp/R2CBmh@rowland.harvard.edu>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 8 Apr 2022 14:52:30 -0700
X-Gmail-Original-Message-ID: <CAE=gft7Zi9tpJ74Tf2iqPRbwJkmSLiKJt-WhwD+h-DxQh75D6g@mail.gmail.com>
Message-ID: <CAE=gft7Zi9tpJ74Tf2iqPRbwJkmSLiKJt-WhwD+h-DxQh75D6g@mail.gmail.com>
Subject: Re: [PATCH] USB: hcd-pci: Fully suspend across freeze/thaw cycle
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajat Jain <rajatja@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Youngjin Jang <yj84.jang@samsung.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On Fri, Apr 8, 2022 at 7:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, Apr 07, 2022 at 11:59:55AM -0700, Evan Green wrote:
> > The documentation for the freeze() method says that it "should quiesce
> > the device so that it doesn't generate IRQs or DMA". The unspoken
> > consequence of not doing this is that MSIs aimed at non-boot CPUs may
> > get fully lost if they're sent during the period where the target CPU is
> > offline.
> >
> > The current callbacks for USB HCD do not fully quiesce interrupts,
> > specifically on XHCI. Change to use the full suspend/resume flow for
> > freeze/thaw to ensure interrupts are fully quiesced. This fixes issues
> > where USB devices fail to thaw during hibernation because XHCI misses
> > its interrupt and fails to recover.
>
> I don't think your interpretation is quite right.  The problem doesn't lie
> in the HCD callbacks but rather in the root-hub callbacks.
>
> Correct me if I'm wrong about xHCI, but AFAIK the host controller doesn't
> issue any interrupt requests on its own behalf; it issues IRQs only on
> behalf of its root hubs.  Given that the root hubs should be suspended
> (i.e., frozen) at this point, and hence not running, the only IRQs they
> might make would be for wakeup requests.
>
> So during freeze, wakeups should be disabled on root hubs.  Currently I
> believe we don't do this; if a root hub was already runtime suspended when
> asked to go into freeze, its wakeup setting will remain unchanged.  _That_

For my issue at least, it's the opposite. Enabling runtime pm on the
controller significantly reduces the repro rate of the lost interrupt.
I think having the controller runtime suspended reduces the overall
number of interrupts that flow in, which is why my chances to hit an
interrupt in this window drop, but aren't fully eliminated.

I think xhci may still find reasons to generate interrupts even if all
of its root hub ports are suspended without wake events. For example,
won't Port Status Change Events still come in if a device is unplugged
or overcurrents in between freeze() and thaw()? The spec does mention
that generation of this event is gated by the HCHalted flag, but at
least in my digging around I couldn't find a place where we halt the
controller through this path. With how fragile xhci (and maybe
others?) are towards lost interrupts, even if it does happen to be
perfect now, it seems like it would be more resilient to just fully
suspend the controller across this transition.

I'd also put forward the hypothesis (feel free to shoot it down!) that
unless there's a human-scale time penalty with this change, the
downsides of being more heavy handed like this across freeze/thaw are
minimal. There's always a thaw() right on the heels of freeze(), and
hibernation is such a rare and jarring transition that being able to
recover after the transition is more important than accomplishing the
transition quickly.

-Evan

> is the bug which needs to be fixed.  (Consider what would happen if a root
> hub wakes up after it is frozen but before the host controller is frozen:
> The attempt to freeze the host controller would fail, causing the entire
> hibernation transition to fail.)
>
> The whole issue of how wakeup requests should be handled during hibernation
> is a difficult one.  I don't think we have any good protection against cases
> where a wakeup request races with the system entering hibernation.  For
> instance, if a wakeup event occurs after we go into the thaw state, it won't
> even be recognized as such because the system will be running normally and
> will handle it as an ordinary event.  But then it will be consumed, so the
> wakeup signal won't remain on to reactivate the system once it has shut
> down, and when the stored kernel image is eventually restored it won't
> remember that the event ever happened.
>
> Alan Stern
>
> > Signed-off-by: Evan Green <evgreen@chromium.org> ---
> >
> > You may be able to reproduce this issue on your own machine via the
> > following:
> > 1. Disable runtime PM on your XHCI controller
> > 2. Aim your XHCI IRQ at a non-boot CPU (replace 174): echo 2 >
> >    /proc/irq/174/smp_affinity
> > 3. Attempt to hibernate (no need to actually go all the way down).
> >
> > I run 2 and 3 in a loop, and can usually hit a hang or dead XHCI
> > controller within 1-2 iterations. I happened to notice this on an
> > Alderlake system where runtime PM is accidentally disabled for one of
> > the XHCI controllers. Some more discussion and debugging can be found at
> > [1].
> >
> > [1] https://lore.kernel.org/linux-pci/CAE=gft4a-QL82iFJE_xRQ3JrMmz-KZKWREtz=MghhjFbJeK=8A@mail.gmail.com/T/#u
> >
> > ---
> >  drivers/usb/core/hcd-pci.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> > index 8176bc81a635d6..e02506807ffc6c 100644
> > --- a/drivers/usb/core/hcd-pci.c
> > +++ b/drivers/usb/core/hcd-pci.c
> > @@ -616,10 +616,10 @@ const struct dev_pm_ops usb_hcd_pci_pm_ops = {
> >       .suspend_noirq  = hcd_pci_suspend_noirq,
> >       .resume_noirq   = hcd_pci_resume_noirq,
> >       .resume         = hcd_pci_resume,
> > -     .freeze         = check_root_hub_suspended,
> > -     .freeze_noirq   = check_root_hub_suspended,
> > -     .thaw_noirq     = NULL,
> > -     .thaw           = NULL,
> > +     .freeze         = hcd_pci_suspend,
> > +     .freeze_noirq   = hcd_pci_suspend_noirq,
> > +     .thaw_noirq     = hcd_pci_resume_noirq,
> > +     .thaw           = hcd_pci_resume,
> >       .poweroff       = hcd_pci_suspend,
> >       .poweroff_noirq = hcd_pci_suspend_noirq,
> >       .restore_noirq  = hcd_pci_resume_noirq,
> > --
> > 2.31.0
> >
