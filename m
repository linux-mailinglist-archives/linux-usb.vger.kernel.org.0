Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3918D257C
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 11:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389308AbfJJJA1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 05:00:27 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34384 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388681AbfJJJA1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Oct 2019 05:00:27 -0400
Received: by mail-ed1-f68.google.com with SMTP id p10so4768523edq.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 02:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M/M543PbwhblZM8pHPCeGHKu1Y2HTPBlq7aWQrvh6aI=;
        b=R0EjnTiI2Cah1wjjJ4cd/+TWE9eya83185lC66F9wz7ceGrmKKis6duKyG0Hrul8kJ
         9jAYQQNAIoxSwQWHHNeir20gkJwMzmf91DIEJZnS08eRM4k/ZQe2qKWcBw4Pi9Ei7YGB
         0bNl3QHzl6Zj9qtiJ+ItLqSFATwYx+uI0a88A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M/M543PbwhblZM8pHPCeGHKu1Y2HTPBlq7aWQrvh6aI=;
        b=CCTqGmgCJ9tHJ3lWOQ9bUSS3A6G3HEadgmRZjdMbZ8DyBWToAsVprPX3qwT87Zmplr
         WHYoUlZ8wgBGqZ5AatQwWM2pZzEbf9BXlay5+7NakL+6auu7buCgr+/flCKctSPxRICG
         2iLDIg4y/9dS+quka6RsqvK+Br3HdPjyCJ9iS6AfmH8HpgSv6Zosm0CauWNhlBt0zw7p
         0Q9pcP6nmWN1L8yr1MiB/DJXshliGk8/EJsiMI8fLla+oBdbnbSW1nq+cEAmqK2Dw8Hl
         BtAgVf7e0MGP4hFjrLxEJ0wNA6ysztFeILHbvD0SscndmN+ULHnYZJXVx87gIyTU5Bkf
         WXpA==
X-Gm-Message-State: APjAAAUaLpVfv2K2octOdurLk8EfvjDlg7KIyP0zicDp99Q21+8onaOk
        C+tYpgGTEa1vh0UWh+sc7Nm09nH+gz6s0A==
X-Google-Smtp-Source: APXvYqxPUE1tIZewt6b5YuMnPZmO4xjbrmGIWFDHub0+4nQdbUq6KwP8Ww3nmJnQhnupYNORSVMvFA==
X-Received: by 2002:a17:906:7097:: with SMTP id b23mr7132109ejk.252.1570698025005;
        Thu, 10 Oct 2019 02:00:25 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id 30sm824650edr.78.2019.10.10.02.00.23
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2019 02:00:23 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id j11so6854752wrp.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 02:00:23 -0700 (PDT)
X-Received: by 2002:a5d:540e:: with SMTP id g14mr7746971wrv.177.1570698023302;
 Thu, 10 Oct 2019 02:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191010075004.192818-1-tfiga@chromium.org> <1570697118.32135.20.camel@mhfsdcap03>
In-Reply-To: <1570697118.32135.20.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 10 Oct 2019 18:00:09 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AU53=BRUrK_i-0dRYueVoSd3Bg3AtvZUMHgFv3hLuNug@mail.gmail.com>
Message-ID: <CAAFQd5AU53=BRUrK_i-0dRYueVoSd3Bg3AtvZUMHgFv3hLuNug@mail.gmail.com>
Subject: Re: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Changqi Hu <Changqi.Hu@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Shik Chen <shik@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Chunfeng,

On Thu, Oct 10, 2019 at 5:45 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Hi, Tomasz,
>
> On Thu, 2019-10-10 at 16:50 +0900, Tomasz Figa wrote:
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
> > ---
> >  drivers/usb/host/xhci-mtk.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > index b18a6baef204a..4d101d52cc11b 100644
> > --- a/drivers/usb/host/xhci-mtk.c
> > +++ b/drivers/usb/host/xhci-mtk.c
> > @@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> >       xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> >       if (mtk->lpm_support)
> >               xhci->quirks |= XHCI_LPM_SUPPORT;
> > +     /*
> > +      * MTK host controller does not support 64-bit addressing, despite
> > +      * having the AC64 bit of the HCCPARAMS1 register set.
> > +      */
> > +     xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> Somes SoCs support 64bits in fact, so can't support this quirk, do you
> encounter any issues without this quirk?
>

Thanks for taking a look at this patch.

Yes, on MT8183 the DMA mask ended up being set to 64 bits, but
according to the information I received from MediaTek, the controller
on that SoC only supports 32 bits.

If some SoCs support only 32 bits and some support 64 bits, we may
either need to use different DT compatible string for them or add a DT
property and set the quirk based on that. Right now in upstream we
have:

1) "mediatek,mt8173-xhci", used by:
MT8173

2)"mediatek,mtk-xhci", used by:
MT2712
MT7622
MT8183 (not yet upstream, but I suppose it's on the mailing lists)

Would you be able to check which of the SoCs above report 64 bits but
support only 32? (and so would need this quirk)

Best regards,
Tomasz

> >  }
>
> >
> >  /* called during probe() after chip reset completes */
> > @@ -488,11 +493,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> >               goto disable_clk;
> >       }
> >
> > -     /* Initialize dma_mask and coherent_dma_mask to 32-bits */
> > -     ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > -     if (ret)
> > -             goto disable_clk;
> > -
> >       hcd = usb_create_hcd(driver, dev, dev_name(dev));
> >       if (!hcd) {
> >               ret = -ENOMEM;
>
>
