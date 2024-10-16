Return-Path: <linux-usb+bounces-16313-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 569299A07FD
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 13:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 757A61C22759
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 11:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B289207216;
	Wed, 16 Oct 2024 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="e8WH66Tm";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XI2MQPm+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0FB2071F8;
	Wed, 16 Oct 2024 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729076652; cv=none; b=dDdpjQpWG89ZM8xyqm3Y5/aRFlaVPN2zd8dtfq/9fqSp78XqwMBkPRNBqRZtV8czxEMUmFg31ETzTQSc2P5gHMilapAOO24k8ZOVBjT8wZZPA67Zf8JkhxCF1IfdBrvJU0uSsCrMUlAd8HJUEDgsBDBHuF884dhJaXnJ44Tabbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729076652; c=relaxed/simple;
	bh=j7uqkslzjH6CNz0CR36nqNmHhVeQAxFmnElgWhQTsrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=buX2ddmtpyzOwmRbMxzN7eIotT5jEnPeAaUPJ1YEQOI8V/X2dJykXIvMicUnhuf5pg5Vvd0tPNXYtuGawiGXyfUBth/DdOVrTYowf03VyXlIjXFo56pFDx7dqeL46iPNThdXhjJiDNrcWtub3r9NLvzawRY/c6ZrkNs8P6LsfZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=e8WH66Tm; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XI2MQPm+ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729076649; x=1760612649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UQnSqYqpBfUV+6/cvpHKfQx6TgwRy+1JDtpQMvdUWAY=;
  b=e8WH66TmofbeTntJ5onHovsqJLOEu0vQu3OBsaJ210n76uIggIsRiCGI
   4Vm0mHRjH1en0Z5No9zh3LGh8eKJ4yzYBqVa5PHp3xh7OreBpn9ipbJHO
   vNOUy74Op6gULUBXNgyxwI4dwDXqAwu+943qAeJ52vDbEEAI8HeTogCA/
   e9kRjPu8XTsID/d6KS/eB+vo0Cvz+7FOpRN6JDUe3dnDm7b8IfnngPted
   k0X34tFXhyTAs/ZUkCjebDki1KL0M3ua7Gg42P9vpdMUc+HCLRXXZqDa6
   IIPovpa3AjbUlMCL8B+mVbYGoJ8Hdh6bog4JImGSzw/xJ63x+IXMEfy/q
   A==;
X-CSE-ConnectionGUID: 4/UoR85oRzeG0PblB3UK6Q==
X-CSE-MsgGUID: YU0fFkq7QwqVGtD9L/F5uw==
X-IronPort-AV: E=Sophos;i="6.11,207,1725314400"; 
   d="scan'208";a="39492910"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Oct 2024 13:04:00 +0200
X-CheckPoint: {670F9DA0-E-21611FC3-DAD22B0C}
X-MAIL-CPID: 7354DE9C6207C2B376A359CA9647EA1D_4
X-Control-Analysis: str=0001.0A682F1E.670F9DA0.00D7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D9C116853D;
	Wed, 16 Oct 2024 13:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729076635;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UQnSqYqpBfUV+6/cvpHKfQx6TgwRy+1JDtpQMvdUWAY=;
	b=XI2MQPm+Mb/NIn/vSlonjdjH9uLgzitytNffKH4fG82nU/9taJXmCN4sJ/t2FzcSPgaNP4
	XRgidS1bmOo2sLA+p8MAGqjA6j9wAOU+rM1ufpkxT5Fi3kpMZBlICZToZPblxy5kISnejT
	ltUEKOB2f+q3JYvaP1ebe561GvmJyVrygQOXO9swUbWkzQ34dGqAXse3nJRhBefmPya+Re
	oV3q2cbZPzVXOST2dHeS/hT7WgCLUsLAyhVsnV4hjbpAykUth8RHN/FBPVz+e4/02ga163
	qA6ialNJio94VChL6mUXQGKZ+GFHW72i8KIq3tt8M47szxmlG/XhFeFCk41BhQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org, peter.chen@kernel.org, herve.codina@bootlin.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v8 2/3] arm64: dts: imx95: add usb3 related nodes
Date: Wed, 16 Oct 2024 13:03:53 +0200
Message-ID: <3252989.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241016104140.rjmszgplmql4hwrs@hippo>
References: <20241015111018.2388913-1-xu.yang_2@nxp.com> <22464382.EfDdHjke4D@steina-w> <20241016104140.rjmszgplmql4hwrs@hippo>
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

Am Mittwoch, 16. Oktober 2024, 12:41:40 CEST schrieb Xu Yang:
> On Wed, Oct 16, 2024 at 10:53:50AM +0200, Alexander Stein wrote:
> > Hi,
> >=20
> > another thing I just noticed.
> >=20
> > Am Dienstag, 15. Oktober 2024, 13:10:17 CEST schrieb Xu Yang:
> > > Add usb3 phy and controller nodes for imx95.
> > >=20
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >=20
> > > ---
> > > Changes in v2:
> > >  - no changes
> > > Changes in v3:
> > >  - no changes
> > > Changes in v4:
> > >  - reorder nodes
> > > Changes in v5:
> > >  - no changes
> > > Changes in v6:
> > >  - rebase to latest
> > > Changes in v7:
> > >  - no changes
> > > Changes in v8:
> > >  - no changes
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++=
++
> > >  1 file changed, 43 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/bo=
ot/dts/freescale/imx95.dtsi
> > > index 03661e76550f..e3faa8462759 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > @@ -1473,6 +1473,49 @@ smmu: iommu@490d0000 {
> > >  			};
> > >  		};
> > > =20
> > > +		usb3: usb@4c010010 {
> > > +			compatible =3D "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
> > > +			reg =3D <0x0 0x4c010010 0x0 0x04>,
> > > +			      <0x0 0x4c1f0000 0x0 0x20>;
> > > +			clocks =3D <&scmi_clk IMX95_CLK_HSIO>,
> > > +				 <&scmi_clk IMX95_CLK_32K>;
> > > +			clock-names =3D "hsio", "suspend";
> > > +			interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> > > +			#address-cells =3D <2>;
> > > +			#size-cells =3D <2>;
> > > +			ranges;
> > > +			power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > > +			dma-ranges =3D <0x0 0x0 0x0 0x0 0x10 0x0>;
> > > +			status =3D "disabled";
> > > +
> > > +			usb3_dwc3: usb@4c100000 {
> > > +				compatible =3D "snps,dwc3";
> > > +				reg =3D <0x0 0x4c100000 0x0 0x10000>;
> > > +				clocks =3D <&scmi_clk IMX95_CLK_HSIO>,
> > > +					 <&scmi_clk IMX95_CLK_24M>,
> > > +					 <&scmi_clk IMX95_CLK_32K>;
> > > +				clock-names =3D "bus_early", "ref", "suspend";
> > > +				interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> > > +				phys =3D <&usb3_phy>, <&usb3_phy>;
> > > +				phy-names =3D "usb2-phy", "usb3-phy";
> > > +				snps,gfladj-refclk-lpm-sel-quirk;
> > > +				snps,parkmode-disable-ss-quirk;
> > > +				iommus =3D <&smmu 0xe>;
> > > +			};
> > > +		};
> > > +
> > > +		usb3_phy: phy@4c1f0040 {
> > > +			compatible =3D "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> > > +			reg =3D <0x0 0x4c1f0040 0x0 0x40>,
> > > +			      <0x0 0x4c1fc000 0x0 0x100>;
> > > +			clocks =3D <&scmi_clk IMX95_CLK_HSIO>;
> > > +			clock-names =3D "phy";
> > > +			#phy-cells =3D <0>;
> > > +			power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > > +			orientation-switch;
> > > +			status =3D "disabled";
> >=20
> > I got these dtbs check warnings:
> >=20
> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
> >  phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
> >         'port' is a required property
> >         'ports' is a required property
> >         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-u=
sb-phy.yaml#
> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:=20
> >  phy@4c1f0040: Unevaluated properties are not allowed ('orientation-swi=
tch' was unexpected)
> >         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-u=
sb-phy.yaml#
>=20
> Are you checking on usb tree? You need below two dt-binding patch.
>=20
>  - dt-bindings: usb: dwc3-imx8mp: add compatible string for imx95
>  - dt-bindings: phy: imx8mq-usb: add compatible "fsl,imx95-usb-phy"

Yes, these patches are already in linux-next. I'm on next-20241016.

> >=20
> >=20
> > How am I supposed to specify a port when the usb3 is used in host mode,=
 thus
> > no USB Type-C connector and no 'port' OF-graph accordingly?
>=20
> Host-only mode with Type-A connector? No Typec-C connector?
> Sorry, I do not get your meaning.

Yes, no Type-C connector. Actually not even a Type-A as there is an
on-board USB hub attached to this host.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



