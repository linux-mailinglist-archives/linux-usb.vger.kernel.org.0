Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB045275277
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 09:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgIWHvB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 03:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWHvA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 03:51:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE16C061755
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2020 00:51:00 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kKzY2-0001VP-LH; Wed, 23 Sep 2020 09:50:42 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kKzY0-00068p-6f; Wed, 23 Sep 2020 09:50:40 +0200
Date:   Wed, 23 Sep 2020 09:50:40 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        fugang.duan@nxp.com, qiangqing.zhang@nxp.com, horia.geanta@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/6] arm64: dtsi: imx8mp: add usb nodes
Message-ID: <20200923075040.GD25328@pengutronix.de>
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
 <1600771612-30727-6-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600771612-30727-6-git-send-email-jun.li@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:44:39 up 216 days, 15:15, 146 users,  load average: 0.01, 0.10,
 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 06:46:51PM +0800, Li Jun wrote:
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
> +		usb3_1: usb@32f10108 {
> +			compatible = "fsl,imx8mp-dwc3";
> +			reg = <0x32f10108 0x8>;
> +			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
> +				 <&clk IMX8MP_CLK_USB_ROOT>;
> +			clock-names = "hsio", "suspend";
> +			assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI_SRC>;

In Linux-5.9-rc6 this clock doesn't exist anymore. Should be
IMX8MP_CLK_HSIO_AXI

> +			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
> +			assigned-clock-rates = <500000000>;
> +			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			status = "disabled";
> +
> +			usb_dwc3_1: dwc3@38200000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x38200000 0x10000>;
> +				clocks = <&clk IMX8MP_CLK_HSIO_AXI>,
> +					 <&clk IMX8MP_CLK_USB_CORE_REF>,
> +					 <&clk IMX8MP_CLK_USB_ROOT>;
> +				clock-names = "bus_early", "ref", "suspend";
> +				assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI>;
> +				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
> +				assigned-clock-rates = <500000000>;
> +				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb3_phy1>, <&usb3_phy1>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				snps,dis-u2-freeclk-exists-quirk;
> +				xhci-64bit-support-disable;
> +				status = "disabled";

Does it make sense for a board to enable the parent node and leave this
one disabled? If not you can drop this status = "disabled" here.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
