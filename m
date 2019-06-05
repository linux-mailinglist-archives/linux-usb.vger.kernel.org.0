Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 840CA356F5
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 08:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfFEGZf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 02:25:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:37694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbfFEGZf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 02:25:35 -0400
Received: from dragon (li1264-180.members.linode.com [45.79.165.180])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A21732083E;
        Wed,  5 Jun 2019 06:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559715934;
        bh=sXUHgF1z8TzGkYsEUiDO6sDaWpXPWXdjWzvzn3hQ2qI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kL8r8GM8QfNAl1BX7BSr1V7aJZhO6ApUJ+Y/oBBZSAZxChSSqhXJS8D4/IGrymOUt
         tsrR6hNVVJn/Ymoaf5sQMZ625+dahTh5gavuzpqLGGDGBDn48G/Jqa/mLDV2GKn/d+
         Jl2ybuMcQs3HQXAWZmPY6dZOUQ2J4HryIN1bZrpQ=
Date:   Wed, 5 Jun 2019 14:25:18 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, robh+dt@kernel.org, fabio.estevam@nxp.com,
        kernel@pengutronix.de, devicetree@vger.kernel.org,
        aisheng.dong@nxp.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        chunfeng.yun@mediatek.com
Subject: Re: [PATCH v3 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Message-ID: <20190605062517.GF29853@dragon>
References: <20190527030616.44397-1-peter.chen@nxp.com>
 <20190527030616.44397-7-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527030616.44397-7-peter.chen@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 27, 2019 at 11:06:14AM +0800, Peter Chen wrote:
> Add imx7ulp USBOTG1 support.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  arch/arm/boot/dts/imx7ulp.dtsi | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
> index fca6e50f37c8..37b058119505 100644
> --- a/arch/arm/boot/dts/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/imx7ulp.dtsi
> @@ -30,6 +30,7 @@
>  		serial1 = &lpuart5;
>  		serial2 = &lpuart6;
>  		serial3 = &lpuart7;
> +		usbphy0 = &usbphy1;
>  	};
>  
>  	cpus {
> @@ -133,6 +134,36 @@
>  			clock-names = "ipg", "per";
>  		};
>  
> +		usbotg1: usb@40330000 {
> +			compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb",
> +				"fsl,imx27-usb";

If "fsl,imx6ul-usb" is the one that imx7ulp device is compatible with
and will match in driver, "fsl,imx27-usb" can just be dropped.  Same
comment on usbmisc and usbphy below.

Shawn

> +			reg = <0x40330000 0x200>;
> +			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pcc2 IMX7ULP_CLK_USB0>;
> +			phys = <&usbphy1>;
> +			fsl,usbmisc = <&usbmisc1 0>;
> +			ahb-burst-config = <0x0>;
> +			tx-burst-size-dword = <0x8>;
> +			rx-burst-size-dword = <0x8>;
> +			status = "disabled";
> +		};
> +
> +		usbmisc1: usbmisc@40330200 {
> +			compatible = "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc",
> +				"fsl,imx6q-usbmisc";
> +			#index-cells = <1>;
> +			reg = <0x40330200 0x200>;
> +		};
> +
> +		usbphy1: usbphy@0x40350000 {
> +			compatible = "fsl,imx7ulp-usbphy",
> +				"fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
> +			reg = <0x40350000 0x1000>;
> +			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
> +			#phy-cells = <0>;
> +		};
> +
>  		usdhc0: mmc@40370000 {
>  			compatible = "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
>  			reg = <0x40370000 0x10000>;
> -- 
> 2.14.1
> 
