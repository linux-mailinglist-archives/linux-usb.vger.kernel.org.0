Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A400EA2D4
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 18:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbfJ3Ryw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 13:54:52 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33472 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfJ3Ryw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 13:54:52 -0400
Received: by mail-qt1-f193.google.com with SMTP id y39so4471245qty.0
        for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2019 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wR0o751NsvYc2RPxkgOAeSwo7zHlG8SxjiG2jNEXdMA=;
        b=On5YoSWDqbsRSolR5ILyEkP7PTPKNKl3a6o4h2o2TIii9HCo1FrOxFEv0/Z8EdggBU
         2dz3Whqj7wJ4k+6gSCsPVkG8gc0GA8XnIfZScWOHDLz6wPS/lzd8Mcc0a/i1tToIiwRf
         iPYTqKlcxfy+XYE7BfqjKmwR/YIMI4E3ziKxVuYwdnbX/hF4qoSiP0vFxHr4v2w2Fas+
         9+uas7+UP4Hx8yPKGu7ir2Wd/1zHnkxIJWnTN5xQ0C+2Xn5mexCvhxRGHuiIKf+a4seE
         QaOH/EO0lAYttIjXLNEBHQtI9M/V3f/Ei23ESra/VtDWXwnmoIthAmF/Aiqa662QtJ1e
         ovKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wR0o751NsvYc2RPxkgOAeSwo7zHlG8SxjiG2jNEXdMA=;
        b=Vt9wkl2d8XK9Z7Qbo5iAYGBANKgd26utnx1rBYtOhhhJxPejj8verpLtQwFDwaY+5K
         l9oA4wwew3fyYvkB/i2zrp4+3Fdofu2WSzAM/l8EBuGA7vpb1wwY/P3q3iC5fQalSlet
         IvHoWBXTsKdQk5Ui3ZxC0KahUgpzkSPDDazrHnZxbbppiSUO15jpLKbwXFv/hZtlmtA2
         BLWvQm9iKe7oMxocYuwuqhz7TTc/fE1mU8BWR7PIxFfdmGtaqJNXnIZRJJdppBY7WT/n
         xlCTpXkXJiLdPjPxEQkqbAX/loB/xjiOoRuQy6jTdODCKxrB5dZsVxqIRt6zFmOFov57
         CBMQ==
X-Gm-Message-State: APjAAAUrdTofmTmd/Xsne1Yu4ovoyEkDC09ruehrYpTSp3tdzYLfan10
        s4z+NDXqfo2cqi5huhvxzOVHCx2UInwtkIjbyks=
X-Google-Smtp-Source: APXvYqzgumlTWuYIp/Oin9akcNHweWYqWWkBGR7S09L130WJt3F8KsoEUJaCeZNIyBLGmaqdCaDh2QgHvwwa8q9675A=
X-Received: by 2002:a05:6214:922:: with SMTP id dk2mr347646qvb.60.1572458091103;
 Wed, 30 Oct 2019 10:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191028182254.30739-1-pgwipeout@gmail.com> <20191028182254.30739-5-pgwipeout@gmail.com>
 <1572314332.18464.9.camel@mhfsdcap03> <CAMdYzYrn+KGH3LSrRXxfessQyzv_319RO+skotTkS7H0VDFC0A@mail.gmail.com>
 <1572402485.18464.22.camel@mhfsdcap03>
In-Reply-To: <1572402485.18464.22.camel@mhfsdcap03>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 30 Oct 2019 13:54:32 -0400
Message-ID: <CAMdYzYoKe5VSRb7Yf9C50YAkBSgvLB+5U15b_ndxaSFxUfGVQQ@mail.gmail.com>
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

On Tue, Oct 29, 2019 at 10:28 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Tue, 2019-10-29 at 11:31 -0400, Peter Geis wrote:
> > On Mon, Oct 28, 2019 at 9:59 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > >
> > > On Mon, 2019-10-28 at 18:22 +0000, Peter Geis wrote:
> > > > Now that we have a proper phy driver, we can add the requisite bits to the
> > > > rk3328 device tree.
> > > > Added the u3drd and u3phy nodes.
> > > >
> > > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 72 ++++++++++++++++++++++++
> > > >  1 file changed, 72 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > > > index 31cc1541f1f5..072e988ad655 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > > > @@ -805,6 +805,47 @@
> > > >               };
> > > >       };
> > > >
> > > > +     usb3phy_grf: syscon@ff460000 {
> > > > +             compatible = "rockchip,usb3phy-grf", "syscon";
> > > > +             reg = <0x0 0xff460000 0x0 0x1000>;
> > > > +     };
> > > > +
> > > > +     u3phy: usb3-phy@ff470000 {
> > > usb-phy?
> >
> > This change does not seem wise, as there are also various usb2-phys
> > that are controlled via other drivers, while the usb3phy also has to
> > support usb2 as a fallback.
> We can use u3phy label, or phy-cells = <1>, to provide phys type to
> distighuish u3/u2phy if need.
>
> >
> > > > +             compatible = "rockchip,rk3328-u3phy";
> > > > +             reg = <0x0 0xff470000 0x0 0x0>;
> > > It's zero length, may be not necessary, how about use ranges with
> > > parameter ?
> >
> > I'll look into this.
> >
> > >
> > > > +             rockchip,u3phygrf = <&usb3phy_grf>;
> > > > +             rockchip,grf = <&grf>;
> > > > +             interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> > > > +             interrupt-names = "linestate";
> > > > +             clocks = <&cru PCLK_USB3PHY_OTG>, <&cru PCLK_USB3PHY_PIPE>;
> > > > +             clock-names = "u3phy-otg", "u3phy-pipe";
> > > To me, no need u3phy prefix
> >
> > Same as above, since this could cause confusion with the usb2 phy devices.
> Other info can be used, e.g. compatible;
>
>
> >
> > > > +             resets = <&cru SRST_USB3PHY_U2>,
> > > > +                      <&cru SRST_USB3PHY_U3>,
> > > > +                      <&cru SRST_USB3PHY_PIPE>,
> > > > +                      <&cru SRST_USB3OTG_UTMI>,
> > > > +                      <&cru SRST_USB3PHY_OTG_P>,
> > > > +                      <&cru SRST_USB3PHY_PIPE_P>;
> > > > +             reset-names = "u3phy-u2-por", "u3phy-u3-por",
> > > > +                           "u3phy-pipe-mac", "u3phy-utmi-mac",
> > > > +                           "u3phy-utmi-apb", "u3phy-pipe-apb";
> > > ditto
> > >
> > > > +             #address-cells = <2>;
> > > > +             #size-cells = <2>;
> > > > +             ranges;
> > > > +             status = "disabled";
> > > > +
> > > > +             u3phy_utmi: utmi@ff470000 {
> > > usb-phy instead of utmi?
> >
> > The stock driver looks for these by name, and they are both different functions.
> > This change would break the driver.
> Use phy_type? refer to bindings/usb/generic.txt

Roger, thank you for your feedback.
I have a bit of work to do for v2, although I'm hoping for a few more
tests to come in.
So far all I have is my rk3328-roc-cc and Robin's test.

>
> >
> > >
> > > > +                     reg = <0x0 0xff470000 0x0 0x8000>;
> > > > +                     #phy-cells = <0>;
> > > > +                     status = "disabled";
> > > > +             };
> > > > +
> > > > +             u3phy_pipe: pipe@ff478000 {
> > > usb-phy
> >
> > Same as above.
> >
> > > > +                     reg = <0x0 0xff478000 0x0 0x8000>;
> > > > +                     #phy-cells = <0>;
> > > > +                     status = "disabled";
> > > > +             };
> > > > +     };
> > > > +
> > > >       sdmmc: dwmmc@ff500000 {
> > > >               compatible = "rockchip,rk3328-dw-mshc", "rockchip,rk3288-dw-mshc";
> > > >               reg = <0x0 0xff500000 0x0 0x4000>;
> > > > @@ -936,6 +977,37 @@
> > > >               status = "disabled";
> > > >       };
> > > >
> > > > +     usbdrd3: usb@ff600000 {
> > > > +             compatible = "rockchip,rk3328-dwc3", "rockchip,rk3399-dwc3";
> > > > +             clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
> > > > +                      <&cru SCLK_USB3OTG_SUSPEND>;
> > > > +             clock-names = "ref", "bus_early",
> > > > +                           "suspend";
> > > > +             #address-cells = <2>;
> > > > +             #size-cells = <2>;
> > > > +             ranges;
> > > > +             clock-ranges;
> > > > +             status = "disabled";
> > > > +
> > > > +             usbdrd_dwc3: dwc3@ff600000 {
> > > > +                     compatible = "snps,dwc3";
> > > > +                     reg = <0x0 0xff600000 0x0 0x100000>;
> > > > +                     interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> > > > +                     dr_mode = "otg";
> > > > +                     phys = <&u3phy_utmi>, <&u3phy_pipe>;
> > > > +                     phy-names = "usb2-phy", "usb3-phy";
> > > > +                     phy_type = "utmi_wide";
> > > > +                     snps,dis_enblslpm_quirk;
> > > > +                     snps,dis-u2-freeclk-exists-quirk;
> > > > +                     snps,dis_u2_susphy_quirk;
> > > > +                     snps,dis_u3_susphy_quirk;
> > > > +                     snps,dis-del-phy-power-chg-quirk;
> > > > +                     snps,dis-tx-ipgap-linecheck-quirk;
> > > > +                     snps,xhci-trb-ent-quirk;
> > > > +                     status = "disabled";
> > > > +             };
> > > > +     };
> > > > +
> > > >       gic: interrupt-controller@ff811000 {
> > > >               compatible = "arm,gic-400";
> > > >               #interrupt-cells = <3>;
> > >
> > >
> > >
> > > _______________________________________________
> > > Linux-rockchip mailing list
> > > Linux-rockchip@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>
