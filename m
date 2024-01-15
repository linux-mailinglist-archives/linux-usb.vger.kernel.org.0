Return-Path: <linux-usb+bounces-5063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D3482D761
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 11:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0168C1C218C6
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 10:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7875A125A9;
	Mon, 15 Jan 2024 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="fVC/2+er"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A693101D0;
	Mon, 15 Jan 2024 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705314575; x=1736850575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mTLf24UT9N3GK97wqenb6TJPcf6jiGXc0pwA8LZBQ+I=;
  b=fVC/2+erL1kFwUwWHCu3T/+MV13uDWoq/ZUyaEjRKjbYgJgiC8CjyhA5
   wtiDN/fzYaQ5sUxzZr8xuY+2QPkrGik7sPP1MxNKz1VjjwOTZIoulnFKT
   /RZ2ZF/mESfs0um06OaFbWiHtjAlk7rlrb6Iv16jQJH3eCcVcmJEA0ax3
   s9bboBbP7Q2uyg+VrlLZvQS0WzczCRM9tb+OgtUsSfeqpo3I35jtG0Z72
   0uB8E6k9ee3MZ5z0DOV4+burkSsXS4sQGQhAaFO5uworJzNMHJHfxX1JR
   YWABx2P1PuGY4Rg/RzpyJGgy5P5jk3bSBXj1JC0MnT5M+Ec/XFNMTsbnk
   A==;
X-IronPort-AV: E=Sophos;i="6.04,196,1695679200"; 
   d="scan'208";a="34893446"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jan 2024 11:29:33 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6BFD5280075;
	Mon, 15 Jan 2024 11:29:33 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, Xu Yang <xu.yang_2@nxp.com>
Cc: linux-imx@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: imx93: add usb nodes
Date: Mon, 15 Jan 2024 11:29:33 +0100
Message-ID: <1876554.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240112111747.1250915-5-xu.yang_2@nxp.com>
References: <20240112111747.1250915-1-xu.yang_2@nxp.com> <20240112111747.1250915-5-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Freitag, 12. Januar 2024, 12:17:46 CET schrieb Xu Yang:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen,
> dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten Sie
> die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know that
> they are from a secure source and are safe. In doubt forward the email to
> the IT-Helpdesk to check it. ********************
>=20
> There are 2 USB controllers on i.MX93. Add them.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>=20
> ---
> Changes in v2:
>  - fix format as suggested by Alexander
>  - change compatible from fsl,imx8mm-usb to fsl,imx93-usb
> Changes in v3:
>  - replace deprecated fsl,usbphy with phys as suggested by Alexander
>  - reorder nodes
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 58 ++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi
> b/arch/arm64/boot/dts/freescale/imx93.dtsi index 34c0540276d1..10124758c5=
79
> 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -171,6 +171,20 @@ cm33: remoteproc-cm33 {
>  		status =3D "disabled";
>  	};
>=20
> +	usbphynop1: usbphynop1 {
> +		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
> +		clocks =3D <&clk IMX93_CLK_USB_PHY_BURUNIN>;
> +		clock-names =3D "main_clk";
> +	};
> +
> +	usbphynop2: usbphynop2 {
> +		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
> +		clocks =3D <&clk IMX93_CLK_USB_PHY_BURUNIN>;
> +		clock-names =3D "main_clk";
> +	};
> +
>  	soc@0 {
>  		compatible =3D "simple-bus";
>  		#address-cells =3D <1>;
> @@ -1054,6 +1068,50 @@ media_blk_ctrl: system-controller@4ac10000 {
>  			status =3D "disabled";
>  		};
>=20
> +		usbotg1: usb@4c100000 {
> +			compatible =3D "fsl,imx93-usb", "fsl,imx7d-usb",=20
"fsl,imx27-usb";
> +			reg =3D <0x4c100000 0x200>;
> +			interrupts =3D <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk IMX93_CLK_USB_CONTROLLER_GATE>,
> +				 <&clk IMX93_CLK_HSIO_32K_GATE>;
> +			clock-names =3D "usb_ctrl_root_clk",=20
"usb_wakeup_clk";
> +			assigned-clocks =3D <&clk IMX93_CLK_HSIO>;
> +			assigned-clock-parents =3D <&clk=20
IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> +			assigned-clock-rates =3D <133000000>;
> +			phys =3D <&usbphynop1>;
> +			fsl,usbmisc =3D <&usbmisc1 0>;
> +			status =3D "disabled";
> +		};
> +
> +		usbmisc1: usbmisc@4c100200 {
> +			compatible =3D "fsl,imx8mm-usbmisc", "fsl,imx7d-
usbmisc",
> +					"fsl,imx6q-usbmisc";

Please fix the alignment here.

> +			reg =3D <0x4c100200 0x200>;
> +			#index-cells =3D <1>;
> +		};
> +
> +		usbotg2: usb@4c200000 {
> +			compatible =3D "fsl,imx93-usb", "fsl,imx7d-usb",=20
"fsl,imx27-usb";
> +			reg =3D <0x4c200000 0x200>;
> +			interrupts =3D <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk IMX93_CLK_USB_CONTROLLER_GATE>,
> +				 <&clk IMX93_CLK_HSIO_32K_GATE>;
> +			clock-names =3D "usb_ctrl_root_clk",=20
"usb_wakeup_clk";
> +			assigned-clocks =3D <&clk IMX93_CLK_HSIO>;
> +			assigned-clock-parents =3D <&clk=20
IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> +			assigned-clock-rates =3D <133000000>;
> +			phys =3D <&usbphynop2>;
> +			fsl,usbmisc =3D <&usbmisc2 0>;
> +			status =3D "disabled";
> +		};
> +
> +		usbmisc2: usbmisc@4c200200 {
> +			compatible =3D "fsl,imx8mm-usbmisc", "fsl,imx7d-
usbmisc",
> +					"fsl,imx6q-usbmisc";

Please fix the alignment here as well.
With both changes applied:

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa9352LA/CA

> +			reg =3D <0x4c200200 0x200>;
> +			#index-cells =3D <1>;
> +		};
> +
>  		ddr-pmu@4e300dc0 {
>  			compatible =3D "fsl,imx93-ddr-pmu";
>  			reg =3D <0x4e300dc0 0x200>;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



