Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73461D25FB
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 11:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387730AbfJJJLr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 05:11:47 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40743 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733254AbfJJJLq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Oct 2019 05:11:46 -0400
Received: by mail-ed1-f66.google.com with SMTP id v38so4764930edm.7
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VBMkhodqn4U5kuTJg5v2ifZwnktnXDoyfQB0T+lz2I8=;
        b=ZlN666g+jTCNpilG4QHCpeYoynta7EDdUBxYR6G+XNbiu6uKvC9S4XCYHA8gAWceuk
         j5Me0Yw6RKR9InXvCEPvVeR1f10m2TcGnldLpxmuqVniAE1hwd5Zv1aWCv5zdTolBLqH
         PyhbGks7ZbGwZ5UXPcm4nRFRvLyI+KapSIRV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VBMkhodqn4U5kuTJg5v2ifZwnktnXDoyfQB0T+lz2I8=;
        b=auCBmHeAmU4XrpBLdv2wkmBvMP6yXueFHpl0pYbhohjaZNbZucdBqT3S0WfhRPWezz
         GXhLEtLtwmAGQYNi9eebgrhezQmFDzQFuDmjS5yRt9KYciGvwueA3hrqwcui/rNyDbGk
         Jo4ICW77m0+/9jZbijK9mwztftxK5OQZ0y4Zc88YWVSnpM3ssqNlQR1DcQPpilEZTuso
         6lK0gviz2+3sVKDz6fal9FjQv9JuaSrhqsalDSn3wkkygEZBARHhKZ8Xt7jQ2eoC/xTf
         msAf7ExouqPJit5/HJwmU11KQTlbbADKTwgOwfJxSCgBljRM04qvaP5JOkhz2YvGPHFC
         d1nw==
X-Gm-Message-State: APjAAAWube6qbywFROoiTblabhA0/a6an9+qbfNPRkG5wkcZ/wqNZKAu
        JaTo32QExgHRwbSWW5Zfa3P3yGEbyk7mVQ==
X-Google-Smtp-Source: APXvYqyQFOwV3LUs69l8pd21v50XGh2GnCEkfKWwJMLBUwED2Quc1jQlZfI0hUI4gG+/pNncKGsDwA==
X-Received: by 2002:a17:906:90c2:: with SMTP id v2mr7014698ejw.98.1570698703682;
        Thu, 10 Oct 2019 02:11:43 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id a26sm822486edm.45.2019.10.10.02.11.41
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2019 02:11:42 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id i16so6065681wmd.3
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 02:11:41 -0700 (PDT)
X-Received: by 2002:a1c:e404:: with SMTP id b4mr7233084wmh.90.1570698701061;
 Thu, 10 Oct 2019 02:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191010075004.192818-1-tfiga@chromium.org> <CANMq1KAA+nqcOqiE_g=vA8DC=_t=FqSRtR5kk=1XqSsgZGj+_A@mail.gmail.com>
In-Reply-To: <CANMq1KAA+nqcOqiE_g=vA8DC=_t=FqSRtR5kk=1XqSsgZGj+_A@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 10 Oct 2019 18:11:27 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DazVnFGmNENnxT_FHed2Jx30hLT29HyEjxY7xeqLnGCg@mail.gmail.com>
Message-ID: <CAAFQd5DazVnFGmNENnxT_FHed2Jx30hLT29HyEjxY7xeqLnGCg@mail.gmail.com>
Subject: Re: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Changqi Hu <Changqi.Hu@mediatek.com>,
        Shik Chen <shik@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 10, 2019 at 6:08 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Thu, Oct 10, 2019 at 3:50 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > MediaTek XHCI host controller does not support 64-bit addressing despite
> > the AC64 bit of HCCPARAMS1 register being set. The platform-specific
> > glue sets the DMA mask to 32 bits on its own, but it has no effect,
> > because xhci_gen_setup() overrides it according to hardware
> > capabilities.
> >
> > Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
> > 32-bit DMA mask instead.
> >
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
>
> Can we add a Fixes: tag for stable backports?
> (after addressing the other comments of course)
>

The problem with Fixes: is that this patch depends on the quirk being
there, but the offending code was merged earlier. Do you know how to
handle such cases?

>
> > ---
> >  drivers/usb/host/xhci-mtk.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > index b18a6baef204a..4d101d52cc11b 100644
> > --- a/drivers/usb/host/xhci-mtk.c
> > +++ b/drivers/usb/host/xhci-mtk.c
> > @@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> >         xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> >         if (mtk->lpm_support)
> >                 xhci->quirks |= XHCI_LPM_SUPPORT;
> > +       /*
> > +        * MTK host controller does not support 64-bit addressing, despite
> > +        * having the AC64 bit of the HCCPARAMS1 register set.
> > +        */
> > +       xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> >  }
> >
> >  /* called during probe() after chip reset completes */
> > @@ -488,11 +493,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> >                 goto disable_clk;
> >         }
> >
> > -       /* Initialize dma_mask and coherent_dma_mask to 32-bits */
> > -       ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > -       if (ret)
> > -               goto disable_clk;
> > -
> >         hcd = usb_create_hcd(driver, dev, dev_name(dev));
> >         if (!hcd) {
> >                 ret = -ENOMEM;
> > --
> > 2.23.0.581.g78d2f28ef7-goog
> >
