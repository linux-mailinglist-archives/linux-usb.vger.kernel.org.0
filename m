Return-Path: <linux-usb+bounces-16307-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 194E89A04C7
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 10:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 341B61C22A41
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 08:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B4A204F8A;
	Wed, 16 Oct 2024 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kUjPRdnp";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="PQnu6w7s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E58202F63;
	Wed, 16 Oct 2024 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729068842; cv=none; b=TCZd6UT9Db0dumAkc77vqQj7IB6TAxI8kISuUERnnlWTdpXd7H71svQgpjnApdN8NJEpNZqGC6zO1/tphuKcQ7ZPjsAUCIEkI4WvcXFLNwrzm6aVj/Xqt9veOcR1osr3L4ATizXdYwqn95LWpanLXM80ChBNnCPpdjtwulrjqkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729068842; c=relaxed/simple;
	bh=i2z02FL4pjLB0rywCi6lZK8ThWhEK5LBaU6fWItUqq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOgY9XyPMVlsjP25+KWV71lZdsCxClfL3exShboipQJL1yCbCbEBhMslNDKlrK0Zi7Z0Die+xY3OgMo8EUYp6BM0pMt388tXVSveF+cny92B681dRhf18+ir0Ha5DRc0AFSIFTHDDoXPfs+iqN3IWkReFpHEEneg+n73BnEHG9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=kUjPRdnp; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=PQnu6w7s reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729068839; x=1760604839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k6T+vMrh8+eViQD0mNH7DcuKMC8arv9x+jXY+RWhEHY=;
  b=kUjPRdnptEreX8hdcwj4QWjHfhodlkj7lb4MV6JEoIsaijQdqRwMkXZC
   +olHIp+Bot4z80ag7TNb51urbnEdlGFTVzkowqTrizDD9GJ5I7CB52ENo
   oBo5RXfERbsUHtamXixP0GJ295oKFgpDJ3MftDyF2zqX6rhlRLW0+9ny0
   5MO8Ku8Isa6l3vzfSifGYWUvlQ/GYRDU8Rn3Egt7I1arvv5WBsVJpoArk
   FW5YRpHZzQRAS+nKy5J6RRdwsK9jgOBaRsW0hdSA9U7V427Z7HpBr/sE+
   pBZJgva/3PzlD+2e/1HukdKgLml5SyxfBqa3XnmNSRaJ7YKLHv5qbNME1
   g==;
X-CSE-ConnectionGUID: uiMi2LlbS4yrX1ZxLP23XA==
X-CSE-MsgGUID: whIy4NY3Rh+x/VF+gai7Fw==
X-IronPort-AV: E=Sophos;i="6.11,207,1725314400"; 
   d="scan'208";a="39488222"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Oct 2024 10:53:56 +0200
X-CheckPoint: {670F7F24-4F-65F98A6A-FADAF7F3}
X-MAIL-CPID: BD98F773564CB09642D99A66B771562A_5
X-Control-Analysis: str=0001.0A682F16.670F7F25.0060,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA47C169194;
	Wed, 16 Oct 2024 10:53:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729068832;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k6T+vMrh8+eViQD0mNH7DcuKMC8arv9x+jXY+RWhEHY=;
	b=PQnu6w7snCIkADUXXcOfldKtAbC76TFuSiboRpcrqI5evPvutmXjR34KE5MOgcLdjtmE1w
	tNDY/I9G5YD+Woe9TPbH/Kf5ED3siUbVs807u0thA2fWCdgj8yCJcVqr9XFc1ye/tM9/fl
	0wb+Cy8U6/Q5l21w9cxP2uuXY7Gc8DJvFQkjTs880vt5Dd3IJvFIf4F5I1MmS4cZ5bAxkm
	EDehLB4cktHPbIlf+B3gBIfWTibGz8D4hK14EzY8GuyMXVdtLxAb+uuWsRkshN424TRzyz
	6lbtNUcGNnkKugv4sgsIWdDwuzQa4XIF9+V8i/MJWcMNVeLzgNIBCpy10s41xg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org, peter.chen@kernel.org, herve.codina@bootlin.com, Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v8 2/3] arm64: dts: imx95: add usb3 related nodes
Date: Wed, 16 Oct 2024 10:53:50 +0200
Message-ID: <22464382.EfDdHjke4D@steina-w>
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

Hi,

another thing I just noticed.

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

I got these dtbs check warnings:

arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
 phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
        'port' is a required property
        'ports' is a required property
        from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-p=
hy.yaml#
arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:=20
 phy@4c1f0040: Unevaluated properties are not allowed ('orientation-switch'=
 was unexpected)
        from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-p=
hy.yaml#


How am I supposed to specify a port when the usb3 is used in host mode, thus
no USB Type-C connector and no 'port' OF-graph accordingly?

Best regards,
Alexander

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



