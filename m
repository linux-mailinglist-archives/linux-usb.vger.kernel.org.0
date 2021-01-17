Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE432F90C7
	for <lists+linux-usb@lfdr.de>; Sun, 17 Jan 2021 06:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbhAQFnt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 Jan 2021 00:43:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbhAQFne (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 17 Jan 2021 00:43:34 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D485FC061574
        for <linux-usb@vger.kernel.org>; Sat, 16 Jan 2021 21:42:52 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id t43so4398035uad.7
        for <linux-usb@vger.kernel.org>; Sat, 16 Jan 2021 21:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Olt2YOxfNlY0a+PB/Ct3vvAUbttTgv/DLZUtCACcw8A=;
        b=EQI2syrqKXMoRfyWu1KSfQ7T474G8zDMmq/hd9N2q/GIm5i59uLyxltnLhA4QudIcD
         QnuQn+XWFa+E/LL5fsm9LIPowQjdwgtihyIm6O17SPOQIbOaJOLNhY/aWn1AYZf557Ow
         JEFQGLCjLgLFQUQvIikIs7LkZJX7lKNAqDI3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Olt2YOxfNlY0a+PB/Ct3vvAUbttTgv/DLZUtCACcw8A=;
        b=WEOochuctdE1GqDwBUKW4qqG1VDQJTuqJMxv/x5eU5eeb8jZyVZj7VZL5SBjwnNDJr
         qFIzilazuuBtd30QX/4BHFppuzjLYnFANnqHdD+YexEeoDplLbvassJXGWgGdsllCecK
         BMXjHJVylvzlNiTVLENfjBJbuFx+GYKa7mrIVOM4JPvmlexqMjYV9HTT/Cy4atV9h5a0
         Vdy3FApSt/WU9y0NDMwVqSonJ/VizetfSYqJbdyFECIc4s8lzi/uRPHj+LZ0yEm/VxX3
         o2mbhd7vKC2ADf4E8Tb4zNfF4RrgbbY5PP+Tm7UggEhLHgUMnE9hZqeXxoH3f6+IsbTA
         NRDw==
X-Gm-Message-State: AOAM531nEqiknnSJoFHBJd6Qosrw15LTYzpgrAkQ4isJrNV9fOvZGSie
        1WuuBFXmVyD0B1jdXoUEtnpn1fhfe5C4KnBo1swzeg==
X-Google-Smtp-Source: ABdhPJwXwI0RYPLjRggAllyTjh/EEvwkgVxdYKDanZi5mBCStwwyCakvkuOuYkJ0GyG4FSWpv7KhZ7m0RG1NXRl+P+w=
X-Received: by 2002:ab0:3894:: with SMTP id z20mr13880263uav.82.1610862171854;
 Sat, 16 Jan 2021 21:42:51 -0800 (PST)
MIME-Version: 1.0
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-12-chunfeng.yun@mediatek.com> <CANMq1KA63Lcifv0G80AyF9-JAdojtsnR18QtfytTMuKw7pTkPA@mail.gmail.com>
In-Reply-To: <CANMq1KA63Lcifv0G80AyF9-JAdojtsnR18QtfytTMuKw7pTkPA@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Sun, 17 Jan 2021 13:42:40 +0800
Message-ID: <CANMq1KDkEL1Uh3yCG_-D=Kcm2Nob+mLNiA87syoaiuBFrrsnvg@mail.gmail.com>
Subject: Re: [PATCH next 12/15] arm64: dts: mediatek: mt8183: fix dtbs_check warning
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Devicetree List <devicetree@vger.kernel.org>,
        linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Min Guo <min.guo@mediatek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 17, 2021 at 9:58 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Sat, Jan 16, 2021 at 5:07 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > Harmonize node names, compatibles and properties.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 5b782a4769e7..a69a033a68ac 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -865,7 +865,7 @@
> >                         ranges;
> >                         status = "disabled";
> >
> > -                       usb_host: xhci@11200000 {
> > +                       usb_host: usb@11200000 {
> >                                 compatible = "mediatek,mt8183-xhci",
> >                                              "mediatek,mtk-xhci";
> >                                 reg = <0 0x11200000 0 0x1000>;
> > @@ -908,11 +908,11 @@
> >                         status = "disabled";
> >                 };
> >
> > -               mipi_tx0: mipi-dphy@11e50000 {
> > +               mipi_tx0: dsi-phy@11e50000 {
> >                         compatible = "mediatek,mt8183-mipi-tx";
> >                         reg = <0 0x11e50000 0 0x1000>;
> >                         clocks = <&apmixedsys CLK_APMIXED_MIPID0_26M>;
> > -                       clock-names = "ref_clk";
> > +                       clock-names = "ref";
> >                         #clock-cells = <0>;
> >                         #phy-cells = <0>;
> >                         clock-output-names = "mipi_tx0_pll";
>
> This is unrelated to USB, so this should probably be a separate patch.

Actually, after looking again at the complete stack of patches, I
think this might be ok as part of this overall cleanup (I'll let the
maintainer speak up).

>
> > @@ -931,11 +931,10 @@
> >                         };
> >                 };
> >
> > -               u3phy: usb-phy@11f40000 {
> > +               u3phy: t-phy@11f40000 {
> >                         compatible = "mediatek,mt8183-tphy",
> >                                      "mediatek,generic-tphy-v2";
> >                         #address-cells = <1>;
> > -                       #phy-cells = <1>;
> >                         #size-cells = <1>;
> >                         ranges = <0 0 0x11f40000 0x1000>;
> >                         status = "okay";
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
