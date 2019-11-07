Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55614F268E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 05:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733079AbfKGE1C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 23:27:02 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40455 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfKGE1C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 23:27:02 -0500
Received: by mail-ed1-f65.google.com with SMTP id p59so739877edp.7
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2019 20:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NTuqbBhbQp3ygPAHQ/95mErmiV21/dbwEM5cnatuYgo=;
        b=OBaBm0xpvCSYxK1MAXtaS1QtSia6M7jk/+XEyXOMV6AMB2BZ556TUBNw66KOGKf4x5
         5caki3RhmulXn4bzNACgONX83+XtQI/ckKr3KRSdsf19yJvsbLmBQkRQdymNxenRUoey
         ZiyCs5JnOXqqnXoLrk8bFydcdb5AChyA5cLAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NTuqbBhbQp3ygPAHQ/95mErmiV21/dbwEM5cnatuYgo=;
        b=tsN8mW5gdy4Tx2d7WjqX8x6vWwhlJg/TQwhqCdp2COpfu7HOVrHejSeqLcTJbI4mAy
         gOcNUhz/P5RtgX2IqxOG18dQQKqFb2bZ7vmC3/0VbXnCSWDuu/06nYZbf96JVMvhOQM7
         dNxUVLqIoJe+x3oXIo0Z8p5yXXGvEX53zIUMwmxAc4191+Dd8aOjK6KBypkuwSV3UdDy
         tLwLt5gOQMNTfghdoerfYonM6yIbw0wrTdqtlF988J2+6dnh5EW444lYHlTsAq8Uc8Wz
         EyBMUgD9/jOurNLdVjw15wgcT7HBNzUXfFCcqwZ6Oy5k/He73P7ZplG/kdsNRfH+yc0l
         MV7w==
X-Gm-Message-State: APjAAAX78wchy6HEyypPTO3h2FOY/sAMm1dvuzJWaRvqr7K7VHy0PluF
        dECCrpUUmJeOFL1enHiaYzeULi5qEjAUZA==
X-Google-Smtp-Source: APXvYqwKdKu58Jh1STXh9eoxmigSzM70O4yTmQZwYkMuPZNHIgtgfOuFKEDchbrViNJTbFTkro39RA==
X-Received: by 2002:a17:906:351b:: with SMTP id r27mr1164223eja.120.1573100819582;
        Wed, 06 Nov 2019 20:26:59 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id q4sm21158edr.58.2019.11.06.20.26.58
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 20:26:58 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id q70so931448wme.1
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2019 20:26:58 -0800 (PST)
X-Received: by 2002:a1c:3c42:: with SMTP id j63mr966022wma.90.1573100817773;
 Wed, 06 Nov 2019 20:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20191010075004.192818-1-tfiga@chromium.org> <1570697118.32135.20.camel@mhfsdcap03>
 <CAAFQd5AU53=BRUrK_i-0dRYueVoSd3Bg3AtvZUMHgFv3hLuNug@mail.gmail.com>
 <1570705147.22261.13.camel@mhfsdcap03> <CAAFQd5AszvSow2vgRq+CbtBzdNO7ysymXp=xerR6dtmi8OxMZw@mail.gmail.com>
 <1572423288.18464.38.camel@mhfsdcap03>
In-Reply-To: <1572423288.18464.38.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 7 Nov 2019 13:26:46 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AiFZGZkND++umeTg5SoQK_VES5JEXdJ8hCGL-izs3NkQ@mail.gmail.com>
Message-ID: <CAAFQd5AiFZGZkND++umeTg5SoQK_VES5JEXdJ8hCGL-izs3NkQ@mail.gmail.com>
Subject: Re: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Wed, Oct 30, 2019 at 5:15 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2019-10-11 at 13:35 +0900, Tomasz Figa wrote:
> > On Thu, Oct 10, 2019 at 7:59 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > >
> > > On Thu, 2019-10-10 at 18:00 +0900, Tomasz Figa wrote:
> > > > Hi Chunfeng,
> > > >
> > > > On Thu, Oct 10, 2019 at 5:45 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > > >
> > > > > Hi, Tomasz,
> > > > >
> > > > > On Thu, 2019-10-10 at 16:50 +0900, Tomasz Figa wrote:
> > > > > > MediaTek XHCI host controller does not support 64-bit addressing despite
> > > > > > the AC64 bit of HCCPARAMS1 register being set. The platform-specific
> > > > > > glue sets the DMA mask to 32 bits on its own, but it has no effect,
> > > > > > because xhci_gen_setup() overrides it according to hardware
> > > > > > capabilities.
> > > Yes, this is what I want to do, maybe need remove DMA mask setting in
> > > platform-specific.
> > >
> > > > > >
> > > > > > Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
> > > > > > 32-bit DMA mask instead.
> > > > > >
> > > > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > > > > ---
> > > > > >  drivers/usb/host/xhci-mtk.c | 10 +++++-----
> > > > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > > > > > index b18a6baef204a..4d101d52cc11b 100644
> > > > > > --- a/drivers/usb/host/xhci-mtk.c
> > > > > > +++ b/drivers/usb/host/xhci-mtk.c
> > > > > > @@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> > > > > >       xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> > > > > >       if (mtk->lpm_support)
> > > > > >               xhci->quirks |= XHCI_LPM_SUPPORT;
> > > > > > +     /*
> > > > > > +      * MTK host controller does not support 64-bit addressing, despite
> > > > > > +      * having the AC64 bit of the HCCPARAMS1 register set.
> > > > > > +      */
> > > > > > +     xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> > > > > Somes SoCs support 64bits in fact, so can't support this quirk, do you
> > > > > encounter any issues without this quirk?
> > > > >
> > > >
> > > > Thanks for taking a look at this patch.
> > > >
> > > > Yes, on MT8183 the DMA mask ended up being set to 64 bits, but
> > > > according to the information I received from MediaTek, the controller
> > > > on that SoC only supports 32 bits.
> > > As I know, mt8183 doesn't support memory greater than 4G mode.
> > >
> >
> > We have 4GB of DRAM at 0x40000000-0x140000000 on our board with
> > MT8183. What happens if you attempt to use the memory from
> > 0x100000000-0x140000000 with the XHCI controller on this SoC?
>
> Sorry for the late reply.
>
> I've checked it with USB DE, USB IP supports 64bit on MT8183, so no need
> set XHCI_NO_64BIT_SUPPORT.
> Would you please help to send a new patch to remove local dma mask
> setting, no need set it.
>
> Thanks a lot
>

Thanks Chunfeng. Sounds good then. I'll send a follow-up clean-up
patch once I catch up after a conference and vacation. :)

Best regards,
Tomasz

>
> >
> > > >
> > > > If some SoCs support only 32 bits and some support 64 bits, we may
> > > > either need to use different DT compatible string for them or add a DT
> > > > property and set the quirk based on that. Right now in upstream we
> > > > have:
> > > >
> > > > 1) "mediatek,mt8173-xhci", used by:
> > > > MT8173
> > > >
> > > > 2)"mediatek,mtk-xhci", used by:
> > > > MT2712
> > > > MT7622
> > > > MT8183 (not yet upstream, but I suppose it's on the mailing lists)
> > > >
> > > > Would you be able to check which of the SoCs above report 64 bits but
> > > > support only 32? (and so would need this quirk)
> > > I'm afraid I can't, almost all MTK SoCs supporting xHCI are using this
> > > driver, AC64 should be set rightly according to addressing capability.
> > >
> >
> > Does it mean that only MT8183 may be the only SoC with a problem with
> > this capability bit?
> >
> > Matthias, do you have access to MT2712 and MT7622 devices? I have
> > MT8173 and MT8183, so I can check them, but would be good to check
> > this on the other ones too.
>
>
> >
> > Best regards,
> > Tomasz
>
>
