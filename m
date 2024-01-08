Return-Path: <linux-usb+bounces-4842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0325827476
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 16:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48E5E28353B
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 15:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C1847778;
	Mon,  8 Jan 2024 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="WgO51rAN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190425100D;
	Mon,  8 Jan 2024 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1704728980; x=1736264980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nH6nxd4x4nwK+IhQjHIRG9EjGOXW493hGshxBqum9Ts=;
  b=WgO51rANay+uC125bxHvTcy2qqYZ1s6pJVsrzogFV8Imorq9rQApqYLr
   tqZ4CeJUvjbUZz6pt/tUWHWVWJwMQghrozHN+dL6QKLnEZNd8PQXTSqqD
   4RiJJqb26UkTFO9lNjiT0KLEFqiAzoXlxGziM0MB6OYXnrtiY9hQcQy1c
   CpYeUT92J2xXA9UNjJ6kS+JIYYVnJAmLGKSQRxPTH7m73+3uxncXpC5J8
   nZACExterGlkgEvyOe/4A/nlUc8AzoYXpeAOT0RpkOkiQP5MnGz73720G
   yxu8fFxY8eGgrcFMVF+GzcXJJBLyYonpov35MWbShN2bmFz9157AViT8V
   A==;
X-IronPort-AV: E=Sophos;i="6.04,180,1695679200"; 
   d="scan'208";a="34790581"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 08 Jan 2024 16:49:37 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3CA10280075;
	Mon,  8 Jan 2024 16:49:37 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Cc: linux-imx@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, linux-usb@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: imx93: add usb nodes
Date: Mon, 08 Jan 2024 16:49:36 +0100
Message-ID: <2609601.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231218085456.3962720-4-xu.yang_2@nxp.com>
References: <20231218085456.3962720-1-xu.yang_2@nxp.com> <20231218085456.3962720-4-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

thanks for the update.

Am Montag, 18. Dezember 2023, 09:54:55 CET schrieb Xu Yang:
> There are 2 USB controllers on i.MX93. Add them.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
> Changes in v2:
>  - fix format as suggested by Alexander
>  - change compatible from fsl,imx8mm-usb to fsl,imx93-usb
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 58 ++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi
> b/arch/arm64/boot/dts/freescale/imx93.dtsi index 34c0540276d1..043ec8dc9a=
ca
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
> @@ -1059,5 +1073,49 @@ ddr-pmu@4e300dc0 {
>  			reg =3D <0x4e300dc0 0x200>;
>  			interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
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
> +			fsl,usbphy =3D <&usbphynop1>;

fsl,usbphy is depreacated. Please refer to Documentation/devicetree/binding=
s/
usb/ci-hdrc-usb2.yaml

> +			fsl,usbmisc =3D <&usbmisc1 0>;
> +			status =3D "disabled";
> +		};
> +
> +		usbmisc1: usbmisc@4c100200 {
> +			compatible =3D "fsl,imx8mm-usbmisc", "fsl,imx7d-
usbmisc",
> +					"fsl,imx6q-usbmisc";
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
> +			fsl,usbphy =3D <&usbphynop2>;

fsl,usbphy is depreacated. Please refer to Documentation/devicetree/binding=
s/
usb/ci-hdrc-usb2.yaml

> +			fsl,usbmisc =3D <&usbmisc2 0>;
> +			status =3D "disabled";
> +		};
> +
> +		usbmisc2: usbmisc@4c200200 {
> +			compatible =3D "fsl,imx8mm-usbmisc", "fsl,imx7d-
usbmisc",
> +					"fsl,imx6q-usbmisc";
> +			reg =3D <0x4c200200 0x200>;
> +			#index-cells =3D <1>;
> +		};

Please insert these nodes sorted by node address. It should be inserted bef=
ore=20
ddr-pmu.

Best regards,
Alexander

>  	};
>  };


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



