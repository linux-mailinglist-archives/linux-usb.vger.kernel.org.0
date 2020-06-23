Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7FA20503C
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 13:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732422AbgFWLOb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jun 2020 07:14:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:55910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732274AbgFWLOa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jun 2020 07:14:30 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 122E520768;
        Tue, 23 Jun 2020 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592910870;
        bh=TxulYQXmn8JrWCSz5ZSyCW+tIBTMB5zx3tHtDSuaUh4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hQyw81BBy/u9PPog+ylMr6VwaeD+IxLs+bP3Po98C5NSrJ8KE0eXywMWRO1JhnLUe
         CwHsSzpB50fLcrwpOXEO5qUJ08meSoCRzihY+N4RXf0HbbdWRcozt/EnxNgU8BV7mK
         7t8+WpoZyGZH3RdOh/eCFXbqahwcANlmx+kvrEoo=
Date:   Tue, 23 Jun 2020 19:14:24 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, peter.chen@nxp.com
Subject: Re: [PATCH 5/6] arm64: dts: imx8mp-evk: enable usb1 as host mode
Message-ID: <20200623111423.GZ30139@dragon>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
 <1591701165-12872-6-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591701165-12872-6-git-send-email-jun.li@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 09, 2020 at 07:12:44PM +0800, Li Jun wrote:
> Enable usb host port with type-A connector on imx8mp-evk board.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 32 ++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 3da1fff..fbe056c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -43,6 +43,19 @@
>  		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
> +
> +	reg_usb1_host_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb1_host_vbus";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usb1_vbus>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;

Instead of having it regulator-always-on, it should be controlled by usb
device, right?

Shawn

> +	};
> +
>  };
>  
>  &fec {
> @@ -91,6 +104,19 @@
>  	status = "okay";
>  };
>  
> +&usb3_phy1 {
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
>  &usdhc2 {
>  	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
>  	assigned-clock-rates = <400000000>;
> @@ -172,6 +198,12 @@
>  		>;
>  	};
>  
> +	pinctrl_usb1_vbus: usb1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14	0x19
> +		>;
> +	};
> +
>  	pinctrl_usdhc2: usdhc2grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
> -- 
> 2.7.4
> 
