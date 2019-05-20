Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F18E022D22
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 09:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfETHcu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 03:32:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbfETHcu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 May 2019 03:32:50 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66FE520859;
        Mon, 20 May 2019 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558337570;
        bh=6QOCM2O+jWvHVBPgbiBamyy5qsUSAwzS4Pgp+OQcfCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CdouxzEdd8cyXWd3DiYv4x5o/lA8dl5aA+asetl1A2C2qVuPFrggQf7RYSIQlAlcK
         t2UjMyKptbE/yoO77zVHymC1Mo5H4cbc+PjVKHMQJgSvKPGj+QGwLlgREFBYtWt9Sm
         edlBGboFsWfDZXEmZBiftYZishId+M8xEmFnRzWM=
Date:   Mon, 20 May 2019 15:31:59 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v2 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Message-ID: <20190520073157.GW15856@dragon>
References: <20190514073529.29505-1-peter.chen@nxp.com>
 <20190514073529.29505-7-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514073529.29505-7-peter.chen@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 14, 2019 at 07:38:21AM +0000, Peter Chen wrote:
> Add imx7ulp USBOTG1 support.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  arch/arm/boot/dts/imx7ulp.dtsi | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
> index fca6e50f37c8..60c9ea116d0a 100644
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
> +			#index-cells = <1>;

Nit: we usually start with 'compatible', so can we move it behind?

Shawn

> +			compatible = "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc",
> +				"fsl,imx6q-usbmisc";
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
