Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E31ACD2685
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 11:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387552AbfJJJhq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 05:37:46 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34717 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733268AbfJJJhq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Oct 2019 05:37:46 -0400
Received: by mail-qk1-f193.google.com with SMTP id q203so4995577qke.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 02:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iUv/jKfs8Rt7LwQGuq/GRhqieGvZNRkwMu6pNwIodkk=;
        b=bhpLcCfYPyvX52+BUSSL7Yzj8Et2GDMmcum+9PP4vVeDEy1RxLq7mlfVJHrpQs/nmF
         HOudTuYY/jkMU9E1AxwCRYLr+GWnGHiNVIzjxkwJ8cWvxVnAHNGdpcCMyDIO+S93hPRq
         ys4nlW+3Gvhq+0lkrLZpM8YlHGVH0iTLqn/7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iUv/jKfs8Rt7LwQGuq/GRhqieGvZNRkwMu6pNwIodkk=;
        b=gOU/o23AQf7UAil3bom3y80hOGL9eLrtjSbwsHnrRBJSoLRU5m23AbwEOLaCPCX6p6
         8hmGv6ib3uqmgY34zDSU2Md1kDL3PQ+U181d7nmRRSWq81WWfbxlkhbkRcEBuJPDQfgU
         kIzLd+cM0eL9A+oU29/GWvWpsLti/It9d3Ixsaa/ZVCgvsLyqJSdrGSmYTRG9XLT3pbD
         n+5MixL7dE7/WcNUREisgQkFTxSnRqcrXEPGqGU9DFsEv8dx9WakZBWBYw2zXBj5lgeb
         vgOSHitkr7XPwvlmIFWSRbFJTvIm6/QgottsfPwxprQWGPP+6bNDuJwrdu+qMhjPYUVy
         /u0Q==
X-Gm-Message-State: APjAAAV/v6/+KsCyO+fTUGhzEhkTC9BLYWvwpieG60gJUJt06tdD5Xmh
        lLK8G9jDBL2gKiOMJY2+LZAol1lVameYGLTqpY4Ufw==
X-Google-Smtp-Source: APXvYqz1ByFsQhFtmGcxPoAP+STAxSloJOQ2YgPIk3bIqO0LpHl3D7BNY8rPw6h+2MKJfwf36tyi5ff7jmIJfUURLg0=
X-Received: by 2002:a37:2fc1:: with SMTP id v184mr8788836qkh.18.1570700265436;
 Thu, 10 Oct 2019 02:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191010075004.192818-1-tfiga@chromium.org> <CANMq1KAA+nqcOqiE_g=vA8DC=_t=FqSRtR5kk=1XqSsgZGj+_A@mail.gmail.com>
 <CAAFQd5DazVnFGmNENnxT_FHed2Jx30hLT29HyEjxY7xeqLnGCg@mail.gmail.com>
In-Reply-To: <CAAFQd5DazVnFGmNENnxT_FHed2Jx30hLT29HyEjxY7xeqLnGCg@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Thu, 10 Oct 2019 17:37:34 +0800
Message-ID: <CANMq1KA7pKqJDhFvkuBfEWtr81NUhyRpUE9ZZeTNCCc5Fphoyw@mail.gmail.com>
Subject: Re: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
To:     Tomasz Figa <tfiga@chromium.org>
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

On Thu, Oct 10, 2019 at 5:11 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Thu, Oct 10, 2019 at 6:08 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > On Thu, Oct 10, 2019 at 3:50 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > >
> > > MediaTek XHCI host controller does not support 64-bit addressing despite
> > > the AC64 bit of HCCPARAMS1 register being set. The platform-specific
> > > glue sets the DMA mask to 32 bits on its own, but it has no effect,
> > > because xhci_gen_setup() overrides it according to hardware
> > > capabilities.
> > >
> > > Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
> > > 32-bit DMA mask instead.
> > >
> > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> >
> > Can we add a Fixes: tag for stable backports?
> > (after addressing the other comments of course)
> >
>
> The problem with Fixes: is that this patch depends on the quirk being
> there, but the offending code was merged earlier. Do you know how to
> handle such cases?

Oh, interesting. I think this is documented here:
https://github.com/torvalds/linux/blob/master/Documentation/process/stable-kernel-rules.rst

Something like this:
Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
Cc: <stable@vger.kernel.org> # 3.3.x

(Where 3.3.x is the first release that contains the commit indicated
in the Fixes tag)

Try that, worst case you'll get automated emails from stable
maintainers asking you how to fix the issue.

>
> >
> > > ---
> > >  drivers/usb/host/xhci-mtk.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > > index b18a6baef204a..4d101d52cc11b 100644
> > > --- a/drivers/usb/host/xhci-mtk.c
> > > +++ b/drivers/usb/host/xhci-mtk.c
> > > @@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> > >         xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> > >         if (mtk->lpm_support)
> > >                 xhci->quirks |= XHCI_LPM_SUPPORT;
> > > +       /*
> > > +        * MTK host controller does not support 64-bit addressing, despite
> > > +        * having the AC64 bit of the HCCPARAMS1 register set.
> > > +        */
> > > +       xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> > >  }
> > >
> > >  /* called during probe() after chip reset completes */
> > > @@ -488,11 +493,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> > >                 goto disable_clk;
> > >         }
> > >
> > > -       /* Initialize dma_mask and coherent_dma_mask to 32-bits */
> > > -       ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > > -       if (ret)
> > > -               goto disable_clk;
> > > -
> > >         hcd = usb_create_hcd(driver, dev, dev_name(dev));
> > >         if (!hcd) {
> > >                 ret = -ENOMEM;
> > > --
> > > 2.23.0.581.g78d2f28ef7-goog
> > >
