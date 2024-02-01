Return-Path: <linux-usb+bounces-5742-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA538463DF
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 23:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4568C1F258F7
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 22:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765BB45BF3;
	Thu,  1 Feb 2024 22:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEbqzFI9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF2146424;
	Thu,  1 Feb 2024 22:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706827902; cv=none; b=cTjLVamGd+Ip41qNnPa+UctAkNao6Xy1PFtJT/4eWQlTlcAR3xYbVLhhDOR7CnjI07IG/JRAucr0CtVaIR/oKsFw0j+9fSctuyFch4zTLyE6sBClUYCLMCy0RLihuX7a9agzp6jBQqCJgkf/sQ4A8adDVbir96M748LCi2Y1tgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706827902; c=relaxed/simple;
	bh=nlCIs5peveVtyYMe0pgMO0aQaNnq18QcNDKmOeUnmtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YA7Cl9M4+SawLjUuC07BzgP5/vdx5JJFXzOgJlh4h190cKK/x+XndqX+BXrjbfhfisE310oHPkShrDgeleRx+3u/jhFjGBcQPGb+RfvFi3kT7/m/OXhtgWgYLCI0YDf0K7ANermFxYNnSTql4te7ZTYjcRMh2nxNUa/Yxbve8PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEbqzFI9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443A9C433C7;
	Thu,  1 Feb 2024 22:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706827901;
	bh=nlCIs5peveVtyYMe0pgMO0aQaNnq18QcNDKmOeUnmtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YEbqzFI93qNjx1inNmMUIkN/n6LnIQ+mB9k0yhkVPLkuUHrCKq9CE7zWxt1kkUu2w
	 N8GfS/N83JiYdOY1sL/ZKF5q5FZ0vi8xaB1aoP4O7niccHq2MIJliHBiNwd3ueq2y3
	 EyigoMtYZkFE1ScFUC6pF3HVVYQuz525RNNEUbpuBG+QCJkmHi2JErPiT//nfirpru
	 WtU3LGeacOVYPktdtSVABLlWSoYoJKOSrno9CGayRMo3V8T4f6q73g0G4scwzWr1CZ
	 kE1IVrl3QaWxO0WDrXxH85DxniFIGikfWLBEFjCsshuu7e5lVdIL9YFGBs2aEyqXm3
	 UOPnPkHTd8oZg==
Date: Thu, 1 Feb 2024 16:51:39 -0600
From: Rob Herring <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-imx@nxp.com, jun.li@nxp.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/8] arm64: dts: imx8ulp: add usb nodes
Message-ID: <20240201225139.GA1885965-robh@kernel.org>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
 <20240131114324.3722428-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131114324.3722428-2-xu.yang_2@nxp.com>

On Wed, Jan 31, 2024 at 07:43:18PM +0800, Xu Yang wrote:
> Add USB nodes on i.MX8ULP platform which has 2 USB controllers.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - no changes
> Changes in v3:
>  - no changes
> Changes in v4:
>  - no changes
> Changes in v5:
>  - no changes
> ---
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index c4a0082f30d3..ead1f57e08ef 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -28,6 +28,8 @@ aliases {
>  		serial1 = &lpuart5;
>  		serial2 = &lpuart6;
>  		serial3 = &lpuart7;
> +		usbphy0 = &usbphy1;
> +		usbphy1 = &usbphy2;

Drop these. We have no use for aliases to phys.

>  	};
>  
>  	cpus {
> @@ -472,6 +474,68 @@ usdhc2: mmc@298f0000 {
>  				status = "disabled";
>  			};
>  
> +			usbotg1: usb@29900000 {
> +				compatible = "fsl,imx8ulp-usb", "fsl,imx7ulp-usb", "fsl,imx6ul-usb";
> +				reg = <0x29900000 0x200>;
> +				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc4 IMX8ULP_CLK_USB0>;
> +				power-domains = <&scmi_devpd IMX8ULP_PD_USB0>;
> +				phys = <&usbphy1>;
> +				fsl,usbmisc = <&usbmisc1 0>;
> +				ahb-burst-config = <0x0>;
> +				tx-burst-size-dword = <0x8>;
> +				rx-burst-size-dword = <0x8>;
> +				status = "disabled";
> +			};
> +
> +			usbmisc1: usbmisc@29900200 {
> +				compatible = "fsl,imx8ulp-usbmisc", "fsl,imx7d-usbmisc",
> +						"fsl,imx6q-usbmisc";
> +				#index-cells = <1>;

Deprecated. Why are you using this?

Rob

