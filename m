Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE5A274472
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 16:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgIVOje (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 10:39:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:36396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbgIVOje (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 10:39:34 -0400
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3D5C23A1B;
        Tue, 22 Sep 2020 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600785573;
        bh=QKG2tziZ1CH6LbmKRnL15/kqe5HEQWJM9XiL9GC6EGU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=US7v4tXvzH5E5RcEmEjXOgPzhwK/mHKxZidFPNvqj6WkVUZKIdObiseq1f3WpH2Yo
         aidu1x6M+qVUOW2cI+1io7j9TB+7IgXpYt9hE6gIDQ8NnI/kwZjR6WwvfiwKw/FBCH
         dUbG+wE9lEZS8igvubGKhkeua/AM290Q9Z9wmv8k=
Received: by mail-ed1-f46.google.com with SMTP id t16so16418740edw.7;
        Tue, 22 Sep 2020 07:39:32 -0700 (PDT)
X-Gm-Message-State: AOAM530fewolPNvj40a+rBk4BS4oWQ1afhtsSPzhdi52Toc3y1eAYZuA
        hWkmmtVKwd0sDYJGI9jJMa0BXaN+aGsranH7mQY=
X-Google-Smtp-Source: ABdhPJxZf2ZAXPghgEtaXHGvgbnerAjzDXax3vuylPKt7zWG4WKlAcuvZranqON20EG/druAkSSUTbfMud9uF0jvZH0=
X-Received: by 2002:a05:6402:180a:: with SMTP id g10mr4207133edy.18.1600785571397;
 Tue, 22 Sep 2020 07:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com> <1600771612-30727-6-git-send-email-jun.li@nxp.com>
In-Reply-To: <1600771612-30727-6-git-send-email-jun.li@nxp.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 22 Sep 2020 16:39:19 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc2AWHEQmxBT2tRgYcRSwrm0ZpWYiG1ifkh5at+F7-sQw@mail.gmail.com>
Message-ID: <CAJKOXPc2AWHEQmxBT2tRgYcRSwrm0ZpWYiG1ifkh5at+F7-sQw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dtsi: imx8mp: add usb nodes
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, Anson.Huang@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, qiangqing.zhang@nxp.com,
        horia.geanta@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 22 Sep 2020 at 12:56, Li Jun <jun.li@nxp.com> wrote:
>
> imx8mp integrates 2 identical dwc3 based USB3 controllers and
> Synopsys phys, each instance has additional wakeup logic to
> support low power mode, so the glue layer need a node with dwc3
> core sub node.
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 88 +++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 9de2aa1..1b7ed4c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -750,5 +750,93 @@
>                         reg = <0x3d800000 0x400000>;
>                         interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
>                 };
> +
> +               usb3_phy0: usb-phy@381f0040 {
> +                       compatible = "fsl,imx8mp-usb-phy";
> +                       reg = <0x381f0040 0x40>;
> +                       clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
> +                       clock-names = "phy";
> +                       assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
> +                       assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
> +                       #phy-cells = <0>;
> +                       status = "disabled";
> +               };
> +
> +               usb3_0: usb@32f10100 {
> +                       compatible = "fsl,imx8mp-dwc3";
> +                       reg = <0x32f10100 0x8>;
> +                       clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
> +                                <&clk IMX8MP_CLK_USB_ROOT>;
> +                       clock-names = "hsio", "suspend";
> +                       interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges;
> +                       status = "disabled";
> +
> +                       usb_dwc3_0: dwc3@38100000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0x38100000 0x10000>;
> +                               clocks = <&clk IMX8MP_CLK_HSIO_AXI>,
> +                                        <&clk IMX8MP_CLK_USB_CORE_REF>,
> +                                        <&clk IMX8MP_CLK_USB_ROOT>;
> +                               clock-names = "bus_early", "ref", "suspend";
> +                               assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI>;
> +                               assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
> +                               assigned-clock-rates = <500000000>;
> +                               interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +                               phys = <&usb3_phy0>, <&usb3_phy0>;
> +                               phy-names = "usb2-phy", "usb3-phy";
> +                               snps,dis-u2-freeclk-exists-quirk;
> +                               xhci-64bit-support-disable;
> +                               status = "disabled";
> +                       };
> +
> +               };
> +
> +               usb3_phy1: usb-phy@382f0040 {
> +                       compatible = "fsl,imx8mp-usb-phy";
> +                       reg = <0x382f0040 0x40>;
> +                       clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
> +                       clock-names = "phy";
> +                       assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
> +                       assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
> +                       #phy-cells = <0>;
> +                       status = "disabled";
> +               };
> +
> +               usb3_1: usb@32f10108 {
> +                       compatible = "fsl,imx8mp-dwc3";
> +                       reg = <0x32f10108 0x8>;
> +                       clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
> +                                <&clk IMX8MP_CLK_USB_ROOT>;
> +                       clock-names = "hsio", "suspend";
> +                       assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI_SRC>;

This does not validate against your own schema:
arch/arm64/boot/dts/freescale/imx8mp-evk.dt.yaml: usb@32f10108:
'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do
not match any of the regexes: '^dwc3@[0-9a-f]+$', 'pinctrl-[0-9]+'

Please, stop adding new schema and DTS which from day one have
warnings/violations.

It's really a lot of effort (and commits) to clean this up later.

Best regards,
Krzysztof
