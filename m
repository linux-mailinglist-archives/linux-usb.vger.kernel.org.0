Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7052E94FD
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 03:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbfJ3C2V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 22:28:21 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:8375 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726037AbfJ3C2U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 22:28:20 -0400
X-UUID: 621dcd961c3d42a888a91ef1110c997d-20191030
X-UUID: 621dcd961c3d42a888a91ef1110c997d-20191030
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1686662087; Wed, 30 Oct 2019 10:28:06 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 30 Oct
 2019 10:28:04 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 30 Oct 2019 10:28:04 +0800
Message-ID: <1572402485.18464.22.camel@mhfsdcap03>
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: add usb3 to rk3328 devicetree
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Peter Geis <pgwipeout@gmail.com>
CC:     <katsuhiro@katsuster.net>, <linux-rockchip@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Heiko Stuebner" <heiko@sntech.de>
Date:   Wed, 30 Oct 2019 10:28:05 +0800
In-Reply-To: <CAMdYzYrn+KGH3LSrRXxfessQyzv_319RO+skotTkS7H0VDFC0A@mail.gmail.com>
References: <20191028182254.30739-1-pgwipeout@gmail.com>
         <20191028182254.30739-5-pgwipeout@gmail.com>
         <1572314332.18464.9.camel@mhfsdcap03>
         <CAMdYzYrn+KGH3LSrRXxfessQyzv_319RO+skotTkS7H0VDFC0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 3E11689C8F50847D714A26B028F55F51C318B03F5A9BF8232638F3B45F0F248E2000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-10-29 at 11:31 -0400, Peter Geis wrote:
> On Mon, Oct 28, 2019 at 9:59 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > On Mon, 2019-10-28 at 18:22 +0000, Peter Geis wrote:
> > > Now that we have a proper phy driver, we can add the requisite bits to the
> > > rk3328 device tree.
> > > Added the u3drd and u3phy nodes.
> > >
> > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 72 ++++++++++++++++++++++++
> > >  1 file changed, 72 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > > index 31cc1541f1f5..072e988ad655 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > > @@ -805,6 +805,47 @@
> > >               };
> > >       };
> > >
> > > +     usb3phy_grf: syscon@ff460000 {
> > > +             compatible = "rockchip,usb3phy-grf", "syscon";
> > > +             reg = <0x0 0xff460000 0x0 0x1000>;
> > > +     };
> > > +
> > > +     u3phy: usb3-phy@ff470000 {
> > usb-phy?
> 
> This change does not seem wise, as there are also various usb2-phys
> that are controlled via other drivers, while the usb3phy also has to
> support usb2 as a fallback.
We can use u3phy label, or phy-cells = <1>, to provide phys type to
distighuish u3/u2phy if need.

> 
> > > +             compatible = "rockchip,rk3328-u3phy";
> > > +             reg = <0x0 0xff470000 0x0 0x0>;
> > It's zero length, may be not necessary, how about use ranges with
> > parameter ?
> 
> I'll look into this.
> 
> >
> > > +             rockchip,u3phygrf = <&usb3phy_grf>;
> > > +             rockchip,grf = <&grf>;
> > > +             interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> > > +             interrupt-names = "linestate";
> > > +             clocks = <&cru PCLK_USB3PHY_OTG>, <&cru PCLK_USB3PHY_PIPE>;
> > > +             clock-names = "u3phy-otg", "u3phy-pipe";
> > To me, no need u3phy prefix
> 
> Same as above, since this could cause confusion with the usb2 phy devices.
Other info can be used, e.g. compatible;


> 
> > > +             resets = <&cru SRST_USB3PHY_U2>,
> > > +                      <&cru SRST_USB3PHY_U3>,
> > > +                      <&cru SRST_USB3PHY_PIPE>,
> > > +                      <&cru SRST_USB3OTG_UTMI>,
> > > +                      <&cru SRST_USB3PHY_OTG_P>,
> > > +                      <&cru SRST_USB3PHY_PIPE_P>;
> > > +             reset-names = "u3phy-u2-por", "u3phy-u3-por",
> > > +                           "u3phy-pipe-mac", "u3phy-utmi-mac",
> > > +                           "u3phy-utmi-apb", "u3phy-pipe-apb";
> > ditto
> >
> > > +             #address-cells = <2>;
> > > +             #size-cells = <2>;
> > > +             ranges;
> > > +             status = "disabled";
> > > +
> > > +             u3phy_utmi: utmi@ff470000 {
> > usb-phy instead of utmi?
> 
> The stock driver looks for these by name, and they are both different functions.
> This change would break the driver.
Use phy_type? refer to bindings/usb/generic.txt

> 
> >
> > > +                     reg = <0x0 0xff470000 0x0 0x8000>;
> > > +                     #phy-cells = <0>;
> > > +                     status = "disabled";
> > > +             };
> > > +
> > > +             u3phy_pipe: pipe@ff478000 {
> > usb-phy
> 
> Same as above.
> 
> > > +                     reg = <0x0 0xff478000 0x0 0x8000>;
> > > +                     #phy-cells = <0>;
> > > +                     status = "disabled";
> > > +             };
> > > +     };
> > > +
> > >       sdmmc: dwmmc@ff500000 {
> > >               compatible = "rockchip,rk3328-dw-mshc", "rockchip,rk3288-dw-mshc";
> > >               reg = <0x0 0xff500000 0x0 0x4000>;
> > > @@ -936,6 +977,37 @@
> > >               status = "disabled";
> > >       };
> > >
> > > +     usbdrd3: usb@ff600000 {
> > > +             compatible = "rockchip,rk3328-dwc3", "rockchip,rk3399-dwc3";
> > > +             clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
> > > +                      <&cru SCLK_USB3OTG_SUSPEND>;
> > > +             clock-names = "ref", "bus_early",
> > > +                           "suspend";
> > > +             #address-cells = <2>;
> > > +             #size-cells = <2>;
> > > +             ranges;
> > > +             clock-ranges;
> > > +             status = "disabled";
> > > +
> > > +             usbdrd_dwc3: dwc3@ff600000 {
> > > +                     compatible = "snps,dwc3";
> > > +                     reg = <0x0 0xff600000 0x0 0x100000>;
> > > +                     interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> > > +                     dr_mode = "otg";
> > > +                     phys = <&u3phy_utmi>, <&u3phy_pipe>;
> > > +                     phy-names = "usb2-phy", "usb3-phy";
> > > +                     phy_type = "utmi_wide";
> > > +                     snps,dis_enblslpm_quirk;
> > > +                     snps,dis-u2-freeclk-exists-quirk;
> > > +                     snps,dis_u2_susphy_quirk;
> > > +                     snps,dis_u3_susphy_quirk;
> > > +                     snps,dis-del-phy-power-chg-quirk;
> > > +                     snps,dis-tx-ipgap-linecheck-quirk;
> > > +                     snps,xhci-trb-ent-quirk;
> > > +                     status = "disabled";
> > > +             };
> > > +     };
> > > +
> > >       gic: interrupt-controller@ff811000 {
> > >               compatible = "arm,gic-400";
> > >               #interrupt-cells = <3>;
> >
> >
> >
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip


