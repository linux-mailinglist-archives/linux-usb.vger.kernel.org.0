Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56BD1E8BD4
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 16:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389855AbfJ2PcK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 11:32:10 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:42089 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389319AbfJ2PcK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 11:32:10 -0400
Received: by mail-qk1-f194.google.com with SMTP id m4so12617759qke.9
        for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2019 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zei+gdYRByPVoXVqWA0fH/rGL1BnVeufNXCkqNemMUs=;
        b=sV7zqkJZKjV5eb5kALYUjE+k1L17g2D2WVguEMsMLCdbLVYeSOnCktuTAbhQSnfB5S
         obZDvJqhBCuoGDYfUUErkECG99lNnQUSgdUCnoHMsAHNg9dXwWWNgOrJier9jLKW3mW9
         XAZG82zIuUP/zTzgtJT1vCTkEwkSfE/8FyE6KJIBF/7kUcAETrjQqyTbw4qZneJ/HX4i
         RiTbz5slTc927iC8E5G/7ELpKft+77KXyj1ll6oAw6fAfkRRYz3EXsGY/UczoDw6uCqZ
         b741/wofF/9/m7vxZ6P/aO6dCUvJngaAxyDqWcITo2StVZSS/b5wDdVcH1OFjakdF0wq
         r5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zei+gdYRByPVoXVqWA0fH/rGL1BnVeufNXCkqNemMUs=;
        b=kwiOQrviitBXXyW3wvQZPVJajsvmlwNwqswbuHjO415F/YfIBWpSzmGX8PnxflQxQv
         fK57GlSInxhYfKpxZaBSz10o48hmN8qHjPsDiQu6DbkxbuRZVtDYHU94IkMSRRyWeETU
         0ftGuwZbPTCwq8/4Uslz81P54U67DwEmISjWFQZfl6XPu6FCnDiC7DuYtm3yUx/dqVpK
         MuekJpf3kzC0McIdie61e5lsPfqVXzT+jYLum6bz1FSuLoc8LVCIFTZIUeVqs0MGtSuU
         RM9wxOAf7JepLIMvOpcia+3JJLFQbYRyp/lkDG3Sb45chY65bR48aGqUTAN4Xer2agbB
         Qbvg==
X-Gm-Message-State: APjAAAUsKh2WByN+p6hwqgd90554HhOGHFTphimtCHkXhDD0D5PXcDfu
        +K0XIYWX3hZejsmxU6YiI0xrd9ALa3f8VRq57Vc=
X-Google-Smtp-Source: APXvYqxiA5S3RTcPgrzrCp7afxa8iBRK/X0WIfk6HCI0mRqO5qooMuQYu3gg3rnZ8Xhw3tVlpAy0CB3ZKu06ctJ5lRE=
X-Received: by 2002:ae9:ef0a:: with SMTP id d10mr20095737qkg.262.1572363128692;
 Tue, 29 Oct 2019 08:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191028182254.30739-1-pgwipeout@gmail.com> <20191028182254.30739-5-pgwipeout@gmail.com>
 <1572314332.18464.9.camel@mhfsdcap03>
In-Reply-To: <1572314332.18464.9.camel@mhfsdcap03>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Tue, 29 Oct 2019 11:31:51 -0400
Message-ID: <CAMdYzYrn+KGH3LSrRXxfessQyzv_319RO+skotTkS7H0VDFC0A@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: add usb3 to rk3328 devicetree
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     katsuhiro@katsuster.net, linux-rockchip@lists.infradead.org,
        linux-usb@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 28, 2019 at 9:59 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Mon, 2019-10-28 at 18:22 +0000, Peter Geis wrote:
> > Now that we have a proper phy driver, we can add the requisite bits to the
> > rk3328 device tree.
> > Added the u3drd and u3phy nodes.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 72 ++++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > index 31cc1541f1f5..072e988ad655 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > @@ -805,6 +805,47 @@
> >               };
> >       };
> >
> > +     usb3phy_grf: syscon@ff460000 {
> > +             compatible = "rockchip,usb3phy-grf", "syscon";
> > +             reg = <0x0 0xff460000 0x0 0x1000>;
> > +     };
> > +
> > +     u3phy: usb3-phy@ff470000 {
> usb-phy?

This change does not seem wise, as there are also various usb2-phys
that are controlled via other drivers, while the usb3phy also has to
support usb2 as a fallback.

> > +             compatible = "rockchip,rk3328-u3phy";
> > +             reg = <0x0 0xff470000 0x0 0x0>;
> It's zero length, may be not necessary, how about use ranges with
> parameter ?

I'll look into this.

>
> > +             rockchip,u3phygrf = <&usb3phy_grf>;
> > +             rockchip,grf = <&grf>;
> > +             interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-names = "linestate";
> > +             clocks = <&cru PCLK_USB3PHY_OTG>, <&cru PCLK_USB3PHY_PIPE>;
> > +             clock-names = "u3phy-otg", "u3phy-pipe";
> To me, no need u3phy prefix

Same as above, since this could cause confusion with the usb2 phy devices.

> > +             resets = <&cru SRST_USB3PHY_U2>,
> > +                      <&cru SRST_USB3PHY_U3>,
> > +                      <&cru SRST_USB3PHY_PIPE>,
> > +                      <&cru SRST_USB3OTG_UTMI>,
> > +                      <&cru SRST_USB3PHY_OTG_P>,
> > +                      <&cru SRST_USB3PHY_PIPE_P>;
> > +             reset-names = "u3phy-u2-por", "u3phy-u3-por",
> > +                           "u3phy-pipe-mac", "u3phy-utmi-mac",
> > +                           "u3phy-utmi-apb", "u3phy-pipe-apb";
> ditto
>
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +             status = "disabled";
> > +
> > +             u3phy_utmi: utmi@ff470000 {
> usb-phy instead of utmi?

The stock driver looks for these by name, and they are both different functions.
This change would break the driver.

>
> > +                     reg = <0x0 0xff470000 0x0 0x8000>;
> > +                     #phy-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             u3phy_pipe: pipe@ff478000 {
> usb-phy

Same as above.

> > +                     reg = <0x0 0xff478000 0x0 0x8000>;
> > +                     #phy-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +     };
> > +
> >       sdmmc: dwmmc@ff500000 {
> >               compatible = "rockchip,rk3328-dw-mshc", "rockchip,rk3288-dw-mshc";
> >               reg = <0x0 0xff500000 0x0 0x4000>;
> > @@ -936,6 +977,37 @@
> >               status = "disabled";
> >       };
> >
> > +     usbdrd3: usb@ff600000 {
> > +             compatible = "rockchip,rk3328-dwc3", "rockchip,rk3399-dwc3";
> > +             clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
> > +                      <&cru SCLK_USB3OTG_SUSPEND>;
> > +             clock-names = "ref", "bus_early",
> > +                           "suspend";
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +             clock-ranges;
> > +             status = "disabled";
> > +
> > +             usbdrd_dwc3: dwc3@ff600000 {
> > +                     compatible = "snps,dwc3";
> > +                     reg = <0x0 0xff600000 0x0 0x100000>;
> > +                     interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> > +                     dr_mode = "otg";
> > +                     phys = <&u3phy_utmi>, <&u3phy_pipe>;
> > +                     phy-names = "usb2-phy", "usb3-phy";
> > +                     phy_type = "utmi_wide";
> > +                     snps,dis_enblslpm_quirk;
> > +                     snps,dis-u2-freeclk-exists-quirk;
> > +                     snps,dis_u2_susphy_quirk;
> > +                     snps,dis_u3_susphy_quirk;
> > +                     snps,dis-del-phy-power-chg-quirk;
> > +                     snps,dis-tx-ipgap-linecheck-quirk;
> > +                     snps,xhci-trb-ent-quirk;
> > +                     status = "disabled";
> > +             };
> > +     };
> > +
> >       gic: interrupt-controller@ff811000 {
> >               compatible = "arm,gic-400";
> >               #interrupt-cells = <3>;
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
