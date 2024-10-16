Return-Path: <linux-usb+bounces-16298-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BED9A034F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 09:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC191F21579
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 07:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D211CB53F;
	Wed, 16 Oct 2024 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="EzdNoxqu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672F01C878E;
	Wed, 16 Oct 2024 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065403; cv=none; b=VFHi2NngGZG8lcp40MNxz95B7xE8XIqLO938H3M/JCOvnpk2lL2KNr7wReTCWchbD35MzRdbGwiDDMxNFy4lqSO4gftxSh33C6SSC7ewFoOewZtr7uqTp84VxbaXD2XOkoHL0AuP2Bi9CZzGQoWabl72QMSxWFmHW9Emx1l59iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065403; c=relaxed/simple;
	bh=7ZGza0D4+DJc0I3mcLDXZs6PWKHYl9GrfKvQnjQrUDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu5EGABa2N+nubdb9J5jfjJgDL8Jw6gE/ILvo0gz4dmkTt70HL78F2WG1VYnbwdgLnesY+/jme+pqSy9rHkElpXm311x0Ux2FdWh6RzQ2YH+2qZm+u2twdcMmuOfzGeTFCuOsOCAaKfVgaJ9XQWRuoHRIgN8YoxlmngH03OC5mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=EzdNoxqu; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RhxSP9FPCj+a+dDaeGpQ2xdy8rq7kJ/iFQi/d8ef/w4=;
	b=EzdNoxquQIQB6Ji5DiKy7MAGDo+H96tb6sRR6BJ9gQ/J8c5Nd1vQmlt7hMomTx
	q9cTYnYhUOfCHUHzOBSCrjc+dAUAyc0vjJqfxQ6IEfGPTCqULslY6zpH+Avbt2PE
	HJQTs9grCWhk+o3IlRXQ45nj7aWYAA6+manTBve6xaak8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDH7uyPcQ9nYMAZAA--.432S3;
	Wed, 16 Oct 2024 15:56:01 +0800 (CST)
Date: Wed, 16 Oct 2024 15:55:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 4/5] arm64: dts: imx95: add usb3 related nodes
Message-ID: <Zw9xj4JWHssfOtQP@dragon>
References: <20240911061720.495606-1-xu.yang_2@nxp.com>
 <20240911061720.495606-4-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911061720.495606-4-xu.yang_2@nxp.com>
X-CM-TRANSID:Ms8vCgDH7uyPcQ9nYMAZAA--.432S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJry7Jry3ZFW8Kw43Kr17KFg_yoW8tFy8pr
	yDGay5Zrs2gr1xCFWaqF48KF95J3y0kFZ5Wr1Sgryjkr9xZ347KFWIkF1S9r18XrsrXw4j
	qFnaqr1xKrnxtw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4mhrUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQZ6ZWcPLG3NiQAAs9

On Wed, Sep 11, 2024 at 02:17:19PM +0800, Xu Yang wrote:
> Add usb3 phy and controller nodes for imx95.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - no changes
> Changes in v3:
>  - no changes
> Changes in v4:
>  - reorder nodes
> Changes in v5:
>  - no changes
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 425272aa5a81..2377b3ade95a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1188,5 +1188,48 @@ pcie1_ep: pcie-ep@4c380000 {
>  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
>  			status = "disabled";
>  		};
> +
> +		usb3: usb@4c010010 {

Could this be added in order of unit-address?

Shawn

> +			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
> +			reg = <0x0 0x4c010010 0x0 0x04>,
> +			      <0x0 0x4c1f0000 0x0 0x20>;
> +			clocks = <&scmi_clk IMX95_CLK_HSIO>,
> +				 <&scmi_clk IMX95_CLK_32K>;
> +			clock-names = "hsio", "suspend";
> +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
> +			status = "disabled";
> +
> +			usb3_dwc3: usb@4c100000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x0 0x4c100000 0x0 0x10000>;
> +				clocks = <&scmi_clk IMX95_CLK_HSIO>,
> +					 <&scmi_clk IMX95_CLK_24M>,
> +					 <&scmi_clk IMX95_CLK_32K>;
> +				clock-names = "bus_early", "ref", "suspend";
> +				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb3_phy>, <&usb3_phy>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				snps,gfladj-refclk-lpm-sel-quirk;
> +				snps,parkmode-disable-ss-quirk;
> +				iommus = <&smmu 0xe>;
> +			};
> +		};
> +
> +		usb3_phy: phy@4c1f0040 {
> +			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> +			reg = <0x0 0x4c1f0040 0x0 0x40>,
> +			      <0x0 0x4c1fc000 0x0 0x100>;
> +			clocks = <&scmi_clk IMX95_CLK_HSIO>;
> +			clock-names = "phy";
> +			#phy-cells = <0>;
> +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +			orientation-switch;
> +			status = "disabled";
> +		};
>  	};
>  };
> -- 
> 2.34.1
> 


