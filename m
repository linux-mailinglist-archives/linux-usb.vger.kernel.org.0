Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8EDB2B4AF8
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 17:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732054AbgKPQZY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 11:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732051AbgKPQZY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 11:25:24 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A34C0613D2
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 08:25:24 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id t11so19292870edj.13
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 08:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=36kI422mx2qfLcPg3+nHskQP6VdwizY0Ulfa8KTJnr0=;
        b=O1Qjd+36JGEvo6pZ30mwIxjGKl8BzRv9Z9ZrFgBmynNuqT2zdA0znCFqKRL9G+5Fcv
         ehaNLlkJ+qZcFQXkjFsxuaH8np3UuMufIj7YjXcUIgynj9LUoghdrn9L6QjxOo84a2uu
         +xxZYIB0oN/SNd3DK+mGOoxv2HVvTZW7YY07BH1yJcxyQu0RzqFXv3GfaCkpSy6DzXP/
         MXLTLXQ7Hk++kxORW12sr+JUTQdBCsPfKIUGGvxvhuxJFVn60RtgAcs9FFmza1SxD/IU
         Gu80B0PySPDo7A3ESBpHeOtX/lwq7U/ZRQLjA+ryedlpnvkhxsx84TZvrxw82haDmA3r
         J3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=36kI422mx2qfLcPg3+nHskQP6VdwizY0Ulfa8KTJnr0=;
        b=b1lLajjV6sxX9DL1x+byf2i6aCrmXHyTqE+mpoVDhEPki9VhLl1Ect8SxVCYVKLn5m
         PvhdSyXkd6B0NgaeiMuWZuhGwJb8WNxu+2kNnlWCqxsN46IY6obWtDj8E6MNwL3khQGR
         d7pUXbozeWIcAx4t0mHOTKuYWXYzr3BnoAl3Kq7wgMTlhM11uzUW2wh+LxLT1pUuZfjV
         VltoLFJus4K5bojIPpVPi8bkAGXyooswy1g9JlZFILo4giTr+5a77kM/M+BfYgCXChuj
         5xieQyzhTEcre2rUU7287W6PmviHqdZiTnR2dF6MVVBw+cjRBHiZAji4qBhPp0zo4Ehv
         c4lw==
X-Gm-Message-State: AOAM532X3k7ixS4qa31T1kDD0aX53owDenTsGiUTv4ax7rbtP8eAHR26
        AOa7WW3d6iFHr/88LQhNEwCjQUHd1mDXVH3qlMI=
X-Google-Smtp-Source: ABdhPJwvsO8BY0A2SJ3pMJ9k/E9Uzy41HquFwR8+/Fdb9eiUpcLtm8P91iDhsjw0QZ3t7I6pu28tNlVpgLp/2F3paMQ=
X-Received: by 2002:a05:6402:22af:: with SMTP id cx15mr15950673edb.207.1605543922570;
 Mon, 16 Nov 2020 08:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20201116151735.178737-1-pgwipeout@gmail.com> <20201116151735.178737-4-pgwipeout@gmail.com>
 <ce2217b9-3627-df09-04d9-e47bef6c3572@gmail.com>
In-Reply-To: <ce2217b9-3627-df09-04d9-e47bef6c3572@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 16 Nov 2020 11:25:10 -0500
Message-ID: <CAMdYzYpFYEp_H-NX0+CWdUK_d8mqVjQD1w8SuQXwANTEbg7CvQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: add rk3328 usb3 and usb3phy nodes
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?B?546L5piO5oiQ?= <frank.wang@rock-chips.com>,
        zyw <zyw@rock-chips.com>, linux-usb@vger.kernel.org,
        Kever Yang <kever.yang@rock-chips.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        =?UTF-8?B?5ZC06Imv5bOw?= <william.wu@rock-chips.com>,
        wulf <wulf@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 16, 2020 at 11:07 AM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Hi Peter,
>
> Just some comments...
>
> The compatible "rockchip,rk3328-dwc3" is currently under test in:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/
>
> I think we should let it go in mainline first
> (if the maintainers agree?) and then you can base your serie on that.
>
> The compatible "rockchip,rk3328-usb3phy" needs to be added to a document
> as well.

I will address documentation in the complete patch set.
This set to get feedback on the method of implementation and if
possible make the glue layer unnecessary.

>
> Add increase version number after previous series.
>
> Is there any change in code or on how you detect?

It would seem that the patches you just linked simply enable the usb3
controller.
It does not address the original issues as to why this method was
rejected previously.
Without the phy driver, there is no hotplug detection, meaning that
only devices which are plugged in at boot are enumerated.

If you look at patch 2, you will see my glue driver is based off of-simple.
This is no accident, as I had originally plugged in my code into that driver.
At >40% rewrite of of-simple, it didn't feel "simple" anymore, so I
broke it out separately.

The patches you linked will work if the usb2 hub issue can be resolved
purely in the phy driver.

>
> On 11/16/20 4:17 PM, Peter Geis wrote:
> > Add the usb3 controller and usb3 phy nodes to the rk3328.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 65 ++++++++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > index bbdb19a3e85d..9fea9203d114 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > @@ -853,6 +853,40 @@ u2phy_host: host-port {
> >               };
> >       };
> >
> > +     usb3phy: usb3-phy@ff470000 {
> > +             compatible = "rockchip,rk3328-usb3phy";
> > +             reg = <0x0 0xff460000 0x0 0x10000>;
> > +             clocks = <&cru PCLK_USB3PHY_OTG>, <&cru PCLK_USB3PHY_PIPE>;
> > +             clock-names = "usb3phy-otg", "usb3phy-pipe";
> > +             resets = <&cru SRST_USB3PHY_U2>,
> > +                      <&cru SRST_USB3PHY_U3>,
> > +                      <&cru SRST_USB3PHY_PIPE>,
> > +                      <&cru SRST_USB3OTG_UTMI>,
> > +                      <&cru SRST_USB3PHY_OTG_P>,
> > +                      <&cru SRST_USB3PHY_PIPE_P>;
> > +             reset-names = "usb3phy-u2-por", "usb3phy-u3-por",
> > +                           "usb3phy-pipe-mac", "usb3phy-utmi-mac",
> > +                           "usb3phy-utmi-apb", "usb3phy-pipe-apb";
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +             status = "disabled";
> > +
> > +             usb3phy_utmi: utmi@ff470000 {
> > +                     compatible = "rockchip,rk3328-usb3phy-utmi";
> > +                     reg = <0x0 0xff470000 0x0 0x8000>;
> > +                     #phy-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             usb3phy_pipe: pipe@ff478000 {
> > +                     compatible = "rockchip,rk3328-usb3phy-pipe";
> > +                     reg = <0x0 0xff478000 0x0 0x8000>;
> > +                     #phy-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +     };
> > +
> >       sdmmc: mmc@ff500000 {
> >               compatible = "rockchip,rk3328-dw-mshc", "rockchip,rk3288-dw-mshc";
> >               reg = <0x0 0xff500000 0x0 0x4000>;
> > @@ -983,6 +1017,37 @@ usb_host0_ohci: usb@ff5d0000 {
> >               status = "disabled";
> >       };
> >
> > +       usbdrd3: usb@ff600000 {
> > +             compatible = "rockchip,rk3328-dwc3";
> > +             clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
> > +                      <&cru SCLK_USB3OTG_SUSPEND>;
> > +             clock-names = "ref", "bus_early", "suspend";
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +             status = "disabled";
> > +
> > +             usbdrd_dwc3: dwc3@ff600000 {
> > +                     compatible = "snps,dwc3";
> > +                     reg = <0x0 0xff600000 0x0 0x100000>;
> > +                     interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
> > +                              <&cru SCLK_USB3OTG_SUSPEND>;
> > +                     clock-names = "ref", "bus_early", "suspend";
> > +                     dr_mode = "host";
> > +                     usb-phy = <&usb3phy_utmi>, <&usb3phy_pipe>;
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
> >
>
