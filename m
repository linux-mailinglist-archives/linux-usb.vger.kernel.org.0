Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26D75D3886
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 06:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbfJKEgH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 00:36:07 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43306 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbfJKEgH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 00:36:07 -0400
Received: by mail-ed1-f66.google.com with SMTP id r9so7441297edl.10
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 21:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rEUfphYgsPDsPF9Rx6VcR3QfxEgWOStdjPum/wk4KcI=;
        b=gEQ+fgGOIKBfW9V5FQ9sV5KdOdkGa1dsRLEj6pWenVSSurwPL6PVXti0w79F/LoGXE
         fRX92sJQbU7d8ptA/uk2X9exHL0yLbDgsQxJCfbdpwVPjiiFkWDjcy9z/5R+TvJxxEUR
         OJA158rP+mEzzpR+/dTLAb5wFtlh89OvWKG8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rEUfphYgsPDsPF9Rx6VcR3QfxEgWOStdjPum/wk4KcI=;
        b=dHwLda76L9782R41Fl+B7HXXBQ036iArwg6yj1AKBr9C6hXHg2zGXkbKjXx8GrjcyG
         EX8queU4y4kZK89jkKLh6fBjKmKn6ySx8ZO5VKXUQgjH2VHB1prozfMXRYezM1ZESFWk
         Ouk+Hv/q7T80zpMiExSni6PabwV915x2xXKzS8Exi3si6GGFWfX3tmOpK6QKz9YE3kKH
         SeVe1Md9ngPgAEbpRiX9gOaltT3gWSDwYMMNoTBx3hX2YytiFrPzIiZEns+SAnj8/M6b
         /olrDfocUqBCFN8G40/CJy/ta4PYpzS9dLKBJCLdenltDdQNkiU3NMtmwOtFK8IUivB/
         7Zpg==
X-Gm-Message-State: APjAAAWWA09LVx/ysOfZ1adHdQvzerwkeltFbenjQiAdQrg3qJAgfOf3
        L7qOcQh3eNsEZno/xt4swzvB0hX4oQzhhg==
X-Google-Smtp-Source: APXvYqzzHKI495BJTR7SeEh329WzlGNTEsH3lU4XOeEvoq3I4jdLHArpz6oTPZovP/SEWrpVS3hQMg==
X-Received: by 2002:a05:6402:17f1:: with SMTP id t17mr11303722edy.11.1570768563118;
        Thu, 10 Oct 2019 21:36:03 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a50sm1249678eda.25.2019.10.10.21.36.01
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2019 21:36:01 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id v8so10252499wrt.2
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 21:36:01 -0700 (PDT)
X-Received: by 2002:adf:f3c9:: with SMTP id g9mr1230397wrp.7.1570768560872;
 Thu, 10 Oct 2019 21:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191010075004.192818-1-tfiga@chromium.org> <1570697118.32135.20.camel@mhfsdcap03>
 <CAAFQd5AU53=BRUrK_i-0dRYueVoSd3Bg3AtvZUMHgFv3hLuNug@mail.gmail.com> <1570705147.22261.13.camel@mhfsdcap03>
In-Reply-To: <1570705147.22261.13.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 11 Oct 2019 13:35:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AszvSow2vgRq+CbtBzdNO7ysymXp=xerR6dtmi8OxMZw@mail.gmail.com>
Message-ID: <CAAFQd5AszvSow2vgRq+CbtBzdNO7ysymXp=xerR6dtmi8OxMZw@mail.gmail.com>
Subject: Re: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
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

On Thu, Oct 10, 2019 at 7:59 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Thu, 2019-10-10 at 18:00 +0900, Tomasz Figa wrote:
> > Hi Chunfeng,
> >
> > On Thu, Oct 10, 2019 at 5:45 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > >
> > > Hi, Tomasz,
> > >
> > > On Thu, 2019-10-10 at 16:50 +0900, Tomasz Figa wrote:
> > > > MediaTek XHCI host controller does not support 64-bit addressing despite
> > > > the AC64 bit of HCCPARAMS1 register being set. The platform-specific
> > > > glue sets the DMA mask to 32 bits on its own, but it has no effect,
> > > > because xhci_gen_setup() overrides it according to hardware
> > > > capabilities.
> Yes, this is what I want to do, maybe need remove DMA mask setting in
> platform-specific.
>
> > > >
> > > > Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
> > > > 32-bit DMA mask instead.
> > > >
> > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > > ---
> > > >  drivers/usb/host/xhci-mtk.c | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > > > index b18a6baef204a..4d101d52cc11b 100644
> > > > --- a/drivers/usb/host/xhci-mtk.c
> > > > +++ b/drivers/usb/host/xhci-mtk.c
> > > > @@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> > > >       xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> > > >       if (mtk->lpm_support)
> > > >               xhci->quirks |= XHCI_LPM_SUPPORT;
> > > > +     /*
> > > > +      * MTK host controller does not support 64-bit addressing, despite
> > > > +      * having the AC64 bit of the HCCPARAMS1 register set.
> > > > +      */
> > > > +     xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> > > Somes SoCs support 64bits in fact, so can't support this quirk, do you
> > > encounter any issues without this quirk?
> > >
> >
> > Thanks for taking a look at this patch.
> >
> > Yes, on MT8183 the DMA mask ended up being set to 64 bits, but
> > according to the information I received from MediaTek, the controller
> > on that SoC only supports 32 bits.
> As I know, mt8183 doesn't support memory greater than 4G mode.
>

We have 4GB of DRAM at 0x40000000-0x140000000 on our board with
MT8183. What happens if you attempt to use the memory from
0x100000000-0x140000000 with the XHCI controller on this SoC?

> >
> > If some SoCs support only 32 bits and some support 64 bits, we may
> > either need to use different DT compatible string for them or add a DT
> > property and set the quirk based on that. Right now in upstream we
> > have:
> >
> > 1) "mediatek,mt8173-xhci", used by:
> > MT8173
> >
> > 2)"mediatek,mtk-xhci", used by:
> > MT2712
> > MT7622
> > MT8183 (not yet upstream, but I suppose it's on the mailing lists)
> >
> > Would you be able to check which of the SoCs above report 64 bits but
> > support only 32? (and so would need this quirk)
> I'm afraid I can't, almost all MTK SoCs supporting xHCI are using this
> driver, AC64 should be set rightly according to addressing capability.
>

Does it mean that only MT8183 may be the only SoC with a problem with
this capability bit?

Matthias, do you have access to MT2712 and MT7622 devices? I have
MT8173 and MT8183, so I can check them, but would be good to check
this on the other ones too.

Best regards,
Tomasz
