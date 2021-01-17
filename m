Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5D862F901C
	for <lists+linux-usb@lfdr.de>; Sun, 17 Jan 2021 03:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbhAQB7n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Jan 2021 20:59:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbhAQB7l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 Jan 2021 20:59:41 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92291C061575
        for <linux-usb@vger.kernel.org>; Sat, 16 Jan 2021 17:59:01 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id e20so7251332vsr.12
        for <linux-usb@vger.kernel.org>; Sat, 16 Jan 2021 17:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2uAbgzuqmaaFgsco0W8wfFh6+uslGxzhS9k3Gwh6YFI=;
        b=FaYfKVQeStbG1gqWxtrRCWvSxrbDmCYERAiLUhM5XJP6pD4zbxUn3qSMfxYKLMVjz0
         kmsuhIXsqwGaS8U0MCOMPh6ThjcoSOE+0xe6x3hHLPEPFlOVZqVT0kW+gtBFZvHPOuP7
         2eDneJ00EhW6A7YBL7Zp9mPlMcBnKQmolzojs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2uAbgzuqmaaFgsco0W8wfFh6+uslGxzhS9k3Gwh6YFI=;
        b=I7JwjBwDAcAitJhLirWyFOtjLeRZIN3vOrb6D2sg3ObPZpe3XdPSljw9aVccsMzIe2
         kVExYemh7BGeZssECcvqH7OMuEHnuaKn2eqCpoMF1ilTy9cxwwQ2GiqtVR1UZ3lcUKod
         yXbi7f9QDBNxTTw3awJGK9qMzvpAWaoABuccEZ115aH6unYw6lmbTyr4OkY8EcTDEKMm
         QG5CBrJCxjYdTcxaJilzhMbF3EqnD1sgGrGij0RTdRerN5S5cxeOnwl1j4y0hUDQIS/b
         N0y1TXfgcS09W9Jv6/b3CFVSv3d/OUrFN5DYckP3EjqeHcdaJqIqOBM2XwVQZ0vuZhXk
         oLnA==
X-Gm-Message-State: AOAM531gCiAMzYovmCZ5p0pXH2NAV5HI2VCEWfmv/7ElJTaC4DOqqDRW
        iIwTH7O/dsOk7kJ3st0JF3typup9YBt2HOzni9I7sA==
X-Google-Smtp-Source: ABdhPJy5/LYHoUfJYfigPp7aEf81RaJx2lXHqgcnMUkYl6viFx+oN9nDTEB9raOjMFYrAG23L3VvR25Vn7ilnouI3bk=
X-Received: by 2002:a67:73c2:: with SMTP id o185mr15071090vsc.16.1610848740123;
 Sat, 16 Jan 2021 17:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com> <20210116090656.11752-12-chunfeng.yun@mediatek.com>
In-Reply-To: <20210116090656.11752-12-chunfeng.yun@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Sun, 17 Jan 2021 09:58:49 +0800
Message-ID: <CANMq1KA63Lcifv0G80AyF9-JAdojtsnR18QtfytTMuKw7pTkPA@mail.gmail.com>
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

On Sat, Jan 16, 2021 at 5:07 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Harmonize node names, compatibles and properties.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7..a69a033a68ac 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -865,7 +865,7 @@
>                         ranges;
>                         status = "disabled";
>
> -                       usb_host: xhci@11200000 {
> +                       usb_host: usb@11200000 {
>                                 compatible = "mediatek,mt8183-xhci",
>                                              "mediatek,mtk-xhci";
>                                 reg = <0 0x11200000 0 0x1000>;
> @@ -908,11 +908,11 @@
>                         status = "disabled";
>                 };
>
> -               mipi_tx0: mipi-dphy@11e50000 {
> +               mipi_tx0: dsi-phy@11e50000 {
>                         compatible = "mediatek,mt8183-mipi-tx";
>                         reg = <0 0x11e50000 0 0x1000>;
>                         clocks = <&apmixedsys CLK_APMIXED_MIPID0_26M>;
> -                       clock-names = "ref_clk";
> +                       clock-names = "ref";
>                         #clock-cells = <0>;
>                         #phy-cells = <0>;
>                         clock-output-names = "mipi_tx0_pll";

This is unrelated to USB, so this should probably be a separate patch.

> @@ -931,11 +931,10 @@
>                         };
>                 };
>
> -               u3phy: usb-phy@11f40000 {
> +               u3phy: t-phy@11f40000 {
>                         compatible = "mediatek,mt8183-tphy",
>                                      "mediatek,generic-tphy-v2";
>                         #address-cells = <1>;
> -                       #phy-cells = <1>;
>                         #size-cells = <1>;
>                         ranges = <0 0 0x11f40000 0x1000>;
>                         status = "okay";
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
