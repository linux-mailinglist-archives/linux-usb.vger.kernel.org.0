Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2535D39AE
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 08:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfJKGxp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 02:53:45 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:27294 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726481AbfJKGxp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 02:53:45 -0400
X-UUID: d44492f4a72c4af0bfa1ea30b44120eb-20191011
X-UUID: d44492f4a72c4af0bfa1ea30b44120eb-20191011
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 386402573; Fri, 11 Oct 2019 14:53:36 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 11 Oct
 2019 14:53:34 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 11 Oct 2019 14:53:34 +0800
Message-ID: <1570776816.31576.5.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Changqi Hu <Changqi.Hu@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Shik Chen <shik@chromium.org>
Date:   Fri, 11 Oct 2019 14:53:36 +0800
In-Reply-To: <CAAFQd5AszvSow2vgRq+CbtBzdNO7ysymXp=xerR6dtmi8OxMZw@mail.gmail.com>
References: <20191010075004.192818-1-tfiga@chromium.org>
         <1570697118.32135.20.camel@mhfsdcap03>
         <CAAFQd5AU53=BRUrK_i-0dRYueVoSd3Bg3AtvZUMHgFv3hLuNug@mail.gmail.com>
         <1570705147.22261.13.camel@mhfsdcap03>
         <CAAFQd5AszvSow2vgRq+CbtBzdNO7ysymXp=xerR6dtmi8OxMZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: D8EE885003961319CABE961ECF4458C14AC152F23B5B99A43253D19FAF83B5E22000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-10-11 at 13:35 +0900, Tomasz Figa wrote:
> On Thu, Oct 10, 2019 at 7:59 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > On Thu, 2019-10-10 at 18:00 +0900, Tomasz Figa wrote:
> > > Hi Chunfeng,
> > >
> > > On Thu, Oct 10, 2019 at 5:45 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > >
> > > > Hi, Tomasz,
> > > >
> > > > On Thu, 2019-10-10 at 16:50 +0900, Tomasz Figa wrote:
> > > > > MediaTek XHCI host controller does not support 64-bit addressing despite
> > > > > the AC64 bit of HCCPARAMS1 register being set. The platform-specific
> > > > > glue sets the DMA mask to 32 bits on its own, but it has no effect,
> > > > > because xhci_gen_setup() overrides it according to hardware
> > > > > capabilities.
> > Yes, this is what I want to do, maybe need remove DMA mask setting in
> > platform-specific.
> >
> > > > >
> > > > > Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
> > > > > 32-bit DMA mask instead.
> > > > >
> > > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > > > ---
> > > > >  drivers/usb/host/xhci-mtk.c | 10 +++++-----
> > > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > > > > index b18a6baef204a..4d101d52cc11b 100644
> > > > > --- a/drivers/usb/host/xhci-mtk.c
> > > > > +++ b/drivers/usb/host/xhci-mtk.c
> > > > > @@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> > > > >       xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> > > > >       if (mtk->lpm_support)
> > > > >               xhci->quirks |= XHCI_LPM_SUPPORT;
> > > > > +     /*
> > > > > +      * MTK host controller does not support 64-bit addressing, despite
> > > > > +      * having the AC64 bit of the HCCPARAMS1 register set.
> > > > > +      */
> > > > > +     xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> > > > Somes SoCs support 64bits in fact, so can't support this quirk, do you
> > > > encounter any issues without this quirk?
> > > >
> > >
> > > Thanks for taking a look at this patch.
> > >
> > > Yes, on MT8183 the DMA mask ended up being set to 64 bits, but
> > > according to the information I received from MediaTek, the controller
> > > on that SoC only supports 32 bits.
> > As I know, mt8183 doesn't support memory greater than 4G mode.
> >
> 
> We have 4GB of DRAM at 0x40000000-0x140000000 on our board with
> MT8183. What happens if you attempt to use the memory from
> 0x100000000-0x140000000 with the XHCI controller on this SoC?
Ok, I'll contact USB SA of MT8183, and discuss this problem.
I guess MT8183 don't plan to support 4G mode when kick off.

> 
> > >
> > > If some SoCs support only 32 bits and some support 64 bits, we may
> > > either need to use different DT compatible string for them or add a DT
> > > property and set the quirk based on that. Right now in upstream we
> > > have:
> > >
> > > 1) "mediatek,mt8173-xhci", used by:
> > > MT8173
> > >
> > > 2)"mediatek,mtk-xhci", used by:
> > > MT2712
> > > MT7622
> > > MT8183 (not yet upstream, but I suppose it's on the mailing lists)
> > >
> > > Would you be able to check which of the SoCs above report 64 bits but
> > > support only 32? (and so would need this quirk)
> > I'm afraid I can't, almost all MTK SoCs supporting xHCI are using this
> > driver, AC64 should be set rightly according to addressing capability.
> >
> 
> Does it mean that only MT8183 may be the only SoC with a problem with
> this capability bit?
Maybe, I'll check it with USB DE.

Thanks

> 
> Matthias, do you have access to MT2712 and MT7622 devices? I have
> MT8173 and MT8183, so I can check them, but would be good to check
> this on the other ones too.
> 
> Best regards,
> Tomasz


