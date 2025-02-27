Return-Path: <linux-usb+bounces-21154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A19A8A482AB
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 16:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 912683AE17C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 15:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FEA26A1A6;
	Thu, 27 Feb 2025 15:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="EdFpOnEt";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pgg8SPeV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761CC26A1B1;
	Thu, 27 Feb 2025 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740669348; cv=none; b=VIApNTOQqxf5as5j/PYdkzSoYNYB9Ohf8+Gu9CQpmyy8DNz3uMF+LO61kQ52wxlp2EekEmWWCSfrzAnbCVw9wtJa2W1KXI6jIvv578CuS6C41rJMQmW67WKT/XXaCOlkkvuGpz4iAcHmaJvCUcVlNRCwi/zrcIIPAecjAmrLgDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740669348; c=relaxed/simple;
	bh=tWEYH5DhcW8wPHn/36So/X4MKsYlfoSfJu8aOJ9Zrog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFVrVwcus3kTUOz0qAZv/eVxlHRCKlBWa12hDC3KmxrjWvmvdvfIhfnMu/NnsE0g6lE5J3gyjQigZOnMZOzNk8awfi/0UfdwWLFYUAkBxYfcV2jyNz8FyI+eFHa54YpAm3EGz3UqH3q3/UJHwcrZ0T2tTOpAT2crU+/DdTI6ijk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=EdFpOnEt; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=pgg8SPeV reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740669345; x=1772205345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+4UqngNE81Sb4jH/Vq1/vSVSgD67P/DwD9g29lotbI4=;
  b=EdFpOnEtJ6utzHMvbAL83YjendCCzMqzvvkKH5jp6wjLUIBsAbs+OZQF
   UJGt3QE0bz/JlmTyzR0S1WiN3ryJOzO268iqZTTA81Zt7MG3wQ236Zt30
   2jFMHVq6dEIU2/kBBbAevf3PrKUrLfx9/0XF6555yaQt71NsFl87Tbo9E
   /hdDxS1baNM2hTbGWvpyJuyJCzxaEg+qO0bJmpeYxUQPSnhp98Md7xpIC
   v45F3ZHZXaGSOMVqaDcGYdVghzx96GM0j7gzLP2nhtDIk3+nu24NTf6p0
   +bYOWEq4ou6O9Ho6S3ddvqBvzJYcLhTgE/XKUbuUM0QeDcB6gavy+rSwD
   g==;
X-CSE-ConnectionGUID: N+/T+6LpQI2afImbcpN3Lw==
X-CSE-MsgGUID: Z7Fu9hvaTnKG9IiYXPTy8Q==
X-IronPort-AV: E=Sophos;i="6.13,320,1732575600"; 
   d="scan'208";a="42152573"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Feb 2025 16:15:42 +0100
X-CheckPoint: {67C0819E-19-F75C4246-F0BD6D90}
X-MAIL-CPID: AE38CBB1BE7BBE62E7CFA2D1B70579E4_3
X-Control-Analysis: str=0001.0A002106.67C0819E.0049,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA5C6164E72;
	Thu, 27 Feb 2025 16:15:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740669338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4UqngNE81Sb4jH/Vq1/vSVSgD67P/DwD9g29lotbI4=;
	b=pgg8SPeV4haYl6uvA8pBnvB9DKg5vh/iDIMnuc8KEn0l4Sqff+Wlsmq+UUHIu5bsY/tKK2
	HJH3ziS1uxYgnN9MuMuxef1vGc8JKZjjn1p2357K4ikjFWRXojIGnyQwYX7Wuy4Dzpaga8
	ZsqLt1Sd76uevaLSxpoSI/Fxkl82Im5evTpoBtPrETJz1G7YUYg3Pl1QFIxJ2oeqZhVq9e
	9q61lBorUeAu/p4MDN8lhA5pg/cPxYkQsjqP4ySDlrIWmNxgE8Ckwkts8hJlnXRDA8UtkW
	ZluzLIBh9JWkvKewkI9trlE5AMzbANytc0bhd3AwuYU/fmcr6IaYcDaOnkEebw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 5/6] arm64: dts: imx95: add USB2.0 nodes
Date: Thu, 27 Feb 2025 16:15:37 +0100
Message-ID: <23849030.6Emhk5qWAg@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250227095348.837223-6-xu.yang_2@nxp.com>
References:
 <20250227095348.837223-1-xu.yang_2@nxp.com>
 <20250227095348.837223-6-xu.yang_2@nxp.com>
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

Am Donnerstag, 27. Februar 2025, 10:53:47 CET schrieb Xu Yang:
> Add USB2.0 controller and phy nodes.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

I was able to test this in peripheral mode on TQMa95xxSA + MB-SMARC-2.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa95xxSA

> ---
> Changes in v3:
>  - no changes
> Changes in v2:
>  - add Rb tag
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 3af13173de4b..48c2033971bf 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -463,6 +463,13 @@ its: msi-controller@48040000 {
>  		};
>  	};
> =20
> +	usbphynop: usbphynop {
> +		compatible =3D "usb-nop-xceiv";
> +		clocks =3D <&scmi_clk IMX95_CLK_HSIO>;
> +		clock-names =3D "main_clk";
> +		#phy-cells =3D <0>;
> +	};
> +
>  	soc {
>  		compatible =3D "simple-bus";
>  		#address-cells =3D <2>;
> @@ -1579,6 +1586,29 @@ usb3_phy: phy@4c1f0040 {
>  			status =3D "disabled";
>  		};
> =20
> +		usb2: usb@4c200000 {
> +			compatible =3D "fsl,imx95-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
> +			reg =3D <0x0 0x4c200000 0x0 0x200>;
> +			interrupts =3D <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&scmi_clk IMX95_CLK_HSIO>,
> +				 <&scmi_clk IMX95_CLK_32K>;
> +			clock-names =3D "usb_ctrl_root", "usb_wakeup";
> +			iommus =3D <&smmu 0xf>;
> +			phys =3D <&usbphynop>;
> +			power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +			fsl,usbmisc =3D <&usbmisc 0>;
> +			status =3D "disabled";
> +		};
> +
> +		usbmisc: usbmisc@4c200200 {
> +			compatible =3D "fsl,imx95-usbmisc", "fsl,imx7d-usbmisc",
> +				     "fsl,imx6q-usbmisc";
> +			reg =3D <0x0 0x4c200200 0x0 0x200>,
> +			      <0x0 0x4c010014 0x0 0x04>;
> +			#index-cells =3D <1>;
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



