Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED6EED26EE
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 12:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733268AbfJJKJX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 06:09:23 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40374 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbfJJKJX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Oct 2019 06:09:23 -0400
Received: by mail-ed1-f66.google.com with SMTP id v38so4914068edm.7
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vBN/g7icYkS/AmLkTr95uIthk9ZmG2qQFolljRp0WMk=;
        b=Qzjl5XP3gY1S8P95T06xre3Rfh0XgcTj0Hb5LBLMatyyGelv6QhZqxTNAwYwagYrM0
         PDIgesmF0xt/RYeXsachoBoIxdRO/Vzs0AeoZQen9rM9IJZwjBY5UAG/3FN4W9dFqMxa
         y7RW8ty64z8J96LC/ZWehDgzeKJROAjwMFe1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vBN/g7icYkS/AmLkTr95uIthk9ZmG2qQFolljRp0WMk=;
        b=pzbPG0yCfarT9k8MhZFN5pN3A45XR+zFk90ZKBZxhq47f0/1KmpEzMxSpd+ZUEyOVt
         qe3g7tfDnQPz3wYLUilpmqw5NIzukQoGuaMtENhlJCrd1nskftW4FBK4mgrOmMq/PXwi
         ivXaonYzpYI2XMHoe2vh3aEiUsRUGrUk43xx6C4nQ4+duAe/h5jxwTN17g1qrG6MHxih
         Rvc5iehVS6+rEXZgOj83gB1nHbzQAs9ChFLDqQiEZb0sLGMtS0pPDL9iLL5C3t/1/fdv
         2jqXGc9d+yVOeSEAzINAIZ4G8Au9wwqoIvnfAwk+cnuxG2aPnb/Z3E2h8LRoNH4vsNDR
         LDTw==
X-Gm-Message-State: APjAAAVkLTO/Kolp/ZYG/f2Jo3tyM3Sceb49uNzD4SaF6oCk2bKUwXKY
        2RQWL2uVtpfU5FQAGlmudaROYL293trvzw==
X-Google-Smtp-Source: APXvYqzWaCd4NjUZIqU9iKDn0WFTkwHClYs/gHU2+8R0amd34JjiTSZp4Ev1apX++Mj1lb/A8R0dNw==
X-Received: by 2002:a05:6402:1359:: with SMTP id y25mr7239696edw.183.1570702161251;
        Thu, 10 Oct 2019 03:09:21 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id fx25sm613838ejb.19.2019.10.10.03.09.19
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2019 03:09:20 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id r3so7128345wrj.6
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 03:09:19 -0700 (PDT)
X-Received: by 2002:adf:fc42:: with SMTP id e2mr8275718wrs.100.1570702158960;
 Thu, 10 Oct 2019 03:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191010075004.192818-1-tfiga@chromium.org> <CANMq1KAA+nqcOqiE_g=vA8DC=_t=FqSRtR5kk=1XqSsgZGj+_A@mail.gmail.com>
 <CAAFQd5DazVnFGmNENnxT_FHed2Jx30hLT29HyEjxY7xeqLnGCg@mail.gmail.com> <CANMq1KA7pKqJDhFvkuBfEWtr81NUhyRpUE9ZZeTNCCc5Fphoyw@mail.gmail.com>
In-Reply-To: <CANMq1KA7pKqJDhFvkuBfEWtr81NUhyRpUE9ZZeTNCCc5Fphoyw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 10 Oct 2019 19:09:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AZjiMuwaMTjy_1ftop+=E6_G7OGAs0+tD5SdJeW0AOLA@mail.gmail.com>
Message-ID: <CAAFQd5AZjiMuwaMTjy_1ftop+=E6_G7OGAs0+tD5SdJeW0AOLA@mail.gmail.com>
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

On Thu, Oct 10, 2019 at 6:37 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Thu, Oct 10, 2019 at 5:11 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Thu, Oct 10, 2019 at 6:08 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > >
> > > On Thu, Oct 10, 2019 at 3:50 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > >
> > > > MediaTek XHCI host controller does not support 64-bit addressing despite
> > > > the AC64 bit of HCCPARAMS1 register being set. The platform-specific
> > > > glue sets the DMA mask to 32 bits on its own, but it has no effect,
> > > > because xhci_gen_setup() overrides it according to hardware
> > > > capabilities.
> > > >
> > > > Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
> > > > 32-bit DMA mask instead.
> > > >
> > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > >
> > > Can we add a Fixes: tag for stable backports?
> > > (after addressing the other comments of course)
> > >
> >
> > The problem with Fixes: is that this patch depends on the quirk being
> > there, but the offending code was merged earlier. Do you know how to
> > handle such cases?
>
> Oh, interesting. I think this is documented here:
> https://github.com/torvalds/linux/blob/master/Documentation/process/stable-kernel-rules.rst
>
> Something like this:
> Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
> Cc: <stable@vger.kernel.org> # 3.3.x
>
> (Where 3.3.x is the first release that contains the commit indicated
> in the Fixes tag)
>
> Try that, worst case you'll get automated emails from stable
> maintainers asking you how to fix the issue.
>

Oh, great, thanks a lot!

Best regards,
Tomasz

> >
> > >
> > > > ---
> > > >  drivers/usb/host/xhci-mtk.c | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > > > index b18a6baef204a..4d101d52cc11b 100644
> > > > --- a/drivers/usb/host/xhci-mtk.c
> > > > +++ b/drivers/usb/host/xhci-mtk.c
> > > > @@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> > > >         xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> > > >         if (mtk->lpm_support)
> > > >                 xhci->quirks |= XHCI_LPM_SUPPORT;
> > > > +       /*
> > > > +        * MTK host controller does not support 64-bit addressing, despite
> > > > +        * having the AC64 bit of the HCCPARAMS1 register set.
> > > > +        */
> > > > +       xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> > > >  }
> > > >
> > > >  /* called during probe() after chip reset completes */
> > > > @@ -488,11 +493,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> > > >                 goto disable_clk;
> > > >         }
> > > >
> > > > -       /* Initialize dma_mask and coherent_dma_mask to 32-bits */
> > > > -       ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > > > -       if (ret)
> > > > -               goto disable_clk;
> > > > -
> > > >         hcd = usb_create_hcd(driver, dev, dev_name(dev));
> > > >         if (!hcd) {
> > > >                 ret = -ENOMEM;
> > > > --
> > > > 2.23.0.581.g78d2f28ef7-goog
> > > >
