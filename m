Return-Path: <linux-usb+bounces-16305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 659849A0478
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 10:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F380B21499
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 08:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA1C1FCC69;
	Wed, 16 Oct 2024 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="eYK3uUAD";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cbUb64k0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DF91FCC6D;
	Wed, 16 Oct 2024 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729067950; cv=none; b=i67uRyva4BVvAZl5cqsFwOEJsH1o21ca15rYThVTcYrKzWHaIDR9Zk2D1kXTdEFC47Wv2QNKyDJ6YtgCjG3ejoBgcCU5sgw+vWp5GYHulKOwb6NMTLHq+xm7ZgGQHWbLCxNkJGm9/COLmjXU1hhERoW5b5CQ3GkaYg/63PoQerc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729067950; c=relaxed/simple;
	bh=mehmMREzKVUPaEox8LznLADvon9wFJNdguwngVxldaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lPXPjIIhNswz6wEuCm/gV6gHFF5XuTvXCVvD5vrlNRvD047rU+cj4QlpmLtte/ROSjrD/VXLrSAxTPfWMR5KcBPDA/vtRIJpGdJkGhK+UUL4Y5trFkHRH3EsvpI6sxzZ2RnYzqB4ABFz22HkHhP90KldIajdS62RzU5CPsINzC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=eYK3uUAD; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cbUb64k0 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729067946; x=1760603946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Al16EzMBGhlTDMwmtBM4msdAumqBKH3tC5qZ61ZgNHo=;
  b=eYK3uUADXY8jdfK/OJ/OI7vcV3ZOcgpFWVfGdRNt8pOAgKC+dzHgbDIK
   YnDI1haZ/sVeRdH5hTJJkpDJQAFNBaXuR46TJuMK9sF6CYRH4HkiSFnue
   zygrDPq3KHx87Ug5cPidD/3kMF4zJiXzgbVw/29CKPcUn8RHfLgq244e2
   8x4+KvAOUwqyZ9m1+BVeENknCnkAzBJcPB/aihrMinrS2MIE+BjRTOZ6e
   5c1fMQw6fF6LF6Y+aiIHPsgq5HKTm5FYj8gENXIxWDG35EWELVsZN0T9C
   POWHedvlFECuBQlsc/Z6Py2KH9tDSkBOZXNfeKAonv4xHcN7dLFQBEYEg
   A==;
X-CSE-ConnectionGUID: Fi5IwMEnS1239q5Z2avZ4w==
X-CSE-MsgGUID: B2edffbpQDayc5i4k+NcIw==
X-IronPort-AV: E=Sophos;i="6.11,207,1725314400"; 
   d="scan'208";a="39487747"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Oct 2024 10:39:03 +0200
X-CheckPoint: {670F7BA7-24-8E59014-E6F31237}
X-MAIL-CPID: FEC6AC4042E72B571F7164006AB52AB5_1
X-Control-Analysis: str=0001.0A682F1E.670F7BA7.0111,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD23B169731;
	Wed, 16 Oct 2024 10:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729067939;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Al16EzMBGhlTDMwmtBM4msdAumqBKH3tC5qZ61ZgNHo=;
	b=cbUb64k0DGgAGUFfgmMKQ6F1/UnLGvEJdf3Iy/3oVwTiBiA84LPKazf5LEwLtuafRK48C/
	MGLHRyLNif3HfiJMcCY/oQ94zla/JcR4D58sjU4nnQGbfKmHOIz/Sq4EI8eBYgmEY5AfKr
	GM3SaGF5nwImNLYB7Uw51p3A6gylzmWdPWXCb/reUuO+NL5TeaMZu/wGGpPoi+E0ZeIWsS
	8Vw6drhx9vNylbhz2fjx40m3Y75Drt/SYpCnx5g6xMO2dCsigiKcHB4mI1HHR7GtivzI+a
	zAtV3FM3LknyPP0l6t5QHwnc7XeC7dbmI43HLBjR7I6ccsT8PVvv+m/Ah01hvQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org, peter.chen@kernel.org, herve.codina@bootlin.com, Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v8 2/3] arm64: dts: imx95: add usb3 related nodes
Date: Wed, 16 Oct 2024 10:38:52 +0200
Message-ID: <3321333.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241015111018.2388913-2-xu.yang_2@nxp.com>
References: <20241015111018.2388913-1-xu.yang_2@nxp.com> <20241015111018.2388913-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hello,

Am Dienstag, 15. Oktober 2024, 13:10:17 CEST schrieb Xu Yang:
> Add usb3 phy and controller nodes for imx95.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>=20
> ---
> Changes in v2:
>  - no changes
> Changes in v3:
>  - no changes
> Changes in v4:
>  - reorder nodes
> Changes in v5:
>  - no changes
> Changes in v6:
>  - rebase to latest
> Changes in v7:
>  - no changes
> Changes in v8:
>  - no changes
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 03661e76550f..e3faa8462759 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1473,6 +1473,49 @@ smmu: iommu@490d0000 {
>  			};
>  		};
> =20
> +		usb3: usb@4c010010 {
> +			compatible =3D "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
> +			reg =3D <0x0 0x4c010010 0x0 0x04>,
> +			      <0x0 0x4c1f0000 0x0 0x20>;
> +			clocks =3D <&scmi_clk IMX95_CLK_HSIO>,
> +				 <&scmi_clk IMX95_CLK_32K>;
> +			clock-names =3D "hsio", "suspend";
> +			interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +			power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +			dma-ranges =3D <0x0 0x0 0x0 0x0 0x10 0x0>;
> +			status =3D "disabled";
> +
> +			usb3_dwc3: usb@4c100000 {
> +				compatible =3D "snps,dwc3";
> +				reg =3D <0x0 0x4c100000 0x0 0x10000>;
> +				clocks =3D <&scmi_clk IMX95_CLK_HSIO>,
> +					 <&scmi_clk IMX95_CLK_24M>,
> +					 <&scmi_clk IMX95_CLK_32K>;
> +				clock-names =3D "bus_early", "ref", "suspend";
> +				interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> +				phys =3D <&usb3_phy>, <&usb3_phy>;
> +				phy-names =3D "usb2-phy", "usb3-phy";
> +				snps,gfladj-refclk-lpm-sel-quirk;
> +				snps,parkmode-disable-ss-quirk;

Downstream kernel also configures
> snps,tx-max-burst =3D /bits/ 8 <4>;
> snps,tx-thr-num-pkt =3D /bits/ 8 <1>;

is this not needed and omitted on purpose?

Best regards,
Alexander

> +				iommus =3D <&smmu 0xe>;
> +			};
> +		};
> +
> +		usb3_phy: phy@4c1f0040 {
> +			compatible =3D "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> +			reg =3D <0x0 0x4c1f0040 0x0 0x40>,
> +			      <0x0 0x4c1fc000 0x0 0x100>;
> +			clocks =3D <&scmi_clk IMX95_CLK_HSIO>;
> +			clock-names =3D "phy";
> +			#phy-cells =3D <0>;
> +			power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +			orientation-switch;
> +			status =3D "disabled";
> +		};
> +
>  		pcie0: pcie@4c300000 {
>  			compatible =3D "fsl,imx95-pcie";
>  			reg =3D <0 0x4c300000 0 0x10000>,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



