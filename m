Return-Path: <linux-usb+bounces-4951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB7082BEAD
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 11:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66E67285C2D
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 10:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BB25810D;
	Fri, 12 Jan 2024 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="UI1Jw7sf"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2830282F7;
	Fri, 12 Jan 2024 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=it8h/gdngQ6Sf5rz/5yg1NpuPGYoI/cbbaYK2X2BrUC0vCx+QjflC/MbokPpWpmdhrdZcYrjDe24xo04N0YVSmwVBmAzwKN7RghuZ/h+1lBH7ZkjNdjlsXXzISVy4b3PlZxROOgYnpx3BK20mOySIaiSAsEX/PeMJpp97PEaU4nhkvPgs0bsSjtJAYG+8YIJedHAYWtjhlrFA+NdpS0aFzhaxZTvnPyiOrbd3hBFvbUJ3cJKEHQSUY71ALxPk0jJ5KcMxl2bP+538SmLr+ojuZVJKU3e4t++YHpzG5WsV1Prf4kfcnXo2kkWzkuX8CwDnxaHgZdLNwBQ/P7EfVa1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ll+QwaM0Ed7wC1fi/nWnCN5KsG9Wp5bOXx+Px2JbGs=;
 b=XQFvzAkMc3xFdjpz3qHM3g/x0HrQ6k/mtBOgWuzIkBXZ0tVl4U59U2wriz7psonCw7wJFSMp4yfnxcYZknhNhZWoQKJMtsmWP1FftvsMA1hN8GmwzBaLEwjXDY6gyQu/dKlbVJAPlea/9l6cVXVAPI3Py8F0SZ9I4CzPjeuaSAcV4wRsJo16GHYhJhMzTixEAwCx3q3M0QhSEebXydfdXPzrylSUBC/9H3kOvjYssaA9iXYazJjdZs1oY9AJbweBAGUbxsrlvnUd+pCnhMotYwUol7DXbiGfvATuEGyH9IkzdqyMyG0gIOu7GY7JcIrytThi5B5IS/YK3UPeDJfiLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ll+QwaM0Ed7wC1fi/nWnCN5KsG9Wp5bOXx+Px2JbGs=;
 b=UI1Jw7sf4M2pTTT9ljoBUWejUx/bzK7Ou3gMS4Vdpq62XEphfnRmVZ9b3fIrajXgfUaR1MUKtLPnDOZkoeMlr+hqQBwnln2ixqdn+xI6SIntoVl4Jqs586w5ijeDm4a+1oIqBUbqRWqQErJqYBL9QYUoXsvzrKyuT9usl5nRhdQ=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7736.eurprd04.prod.outlook.com (2603:10a6:20b:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 10:37:26 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 10:37:26 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jun Li <jun.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v2 4/5] arm64: dts: imx93: add usb nodes
Thread-Topic: [EXT] Re: [PATCH v2 4/5] arm64: dts: imx93: add usb nodes
Thread-Index: AQHaMY8W5lq7pwFrUkSo6ZPB95nMXrDQMXEAgAXxPlA=
Date: Fri, 12 Jan 2024 10:37:26 +0000
Message-ID:
 <DU2PR04MB88229B60FBA407CDEB2484CF8C6F2@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20231218085456.3962720-1-xu.yang_2@nxp.com>
 <20231218085456.3962720-4-xu.yang_2@nxp.com> <2609601.iZASKD2KPV@steina-w>
In-Reply-To: <2609601.iZASKD2KPV@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|AS8PR04MB7736:EE_
x-ms-office365-filtering-correlation-id: 26bf2fcb-9b34-4de0-69fc-08dc135a7871
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AimhSTaD9bfXHfjqFdWtj9KQD4KyOWAodg0qPYjoUnKpm1GoD1PuAJpixLEPlA2XMekb+xb+Sic3PeihxL8IMS0uzxVRCrOucYCfQGbYenr3z53zqfwX2r4SogvwV+7ZRXLwx5IlkOsNVmK2YDVM0Mh4n/u+/vHM2G0/WOFUlhzMpo34qA3E+aJbw3pnjwrWtltlzM2hul37PuhIp01nRusU0UxVhb9CJd7El1WPKWHnVuoTJA7lyFDTsXTak+w/Wj+dty2ET+6h1trTRqv7jMjwjr7riRss+u8W6/yp/J6dxWRBc88umWbaxolOI35av25rLfdFH0iJh03c+qT2hkqm2tb6qLLIrVTc9M1CSOmZKGy4AFUfNuQTZC4e5IXoh9StIiO38jL0vsKv/XrvnZ9wOreT0y+CQftr4yXxWtPdpfLSukANk1PNi1QD3/VQengutFLxmWKnOpnC/GGqjLQ8tae0H/v+X9dGILeUVTFjbuwkXb9XSWtq7GaBi220L0uP60S3KDj1+JhdUcxvCJHo+QtjmzqUfZnKqp6Q021Id0km2SAR2HEem9AmuIj9nS45Y6rIP/+KauyPaFtCGHesaGIrJHWFEOElwColltanrn0v5frxDhFyZqzMuBjY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(39860400002)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(83380400001)(66556008)(316002)(64756008)(66476007)(76116006)(110136005)(54906003)(66946007)(66446008)(71200400001)(38070700009)(9686003)(7696005)(26005)(122000001)(33656002)(66574015)(52536014)(8936002)(8676002)(4326008)(5660300002)(38100700002)(86362001)(6506007)(966005)(921011)(7416002)(45080400002)(41300700001)(478600001)(55016003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QuRnE8iCMI524iJvEbydEJol9ViQz/sQhgZNpZOEz50cKUuU+RUT3FrJg0?=
 =?iso-8859-1?Q?Bo6YTedf8gnydL2qQbJvyXga1uWDDzPGXdtbh5BpHsNxlz4JP4AwmFNF/5?=
 =?iso-8859-1?Q?nKqrLW5/+DszoyjK+ks1LaW61BLKTLSXcup0rNvIf/99C8kVjaOm+ZjeC1?=
 =?iso-8859-1?Q?lLM18IWtw9AlwLOhT8GeQMnoksc5e40+TOMxCUW3xlZ/bbLm02ZdM/Btk9?=
 =?iso-8859-1?Q?tWqj55ANUo3eg+nTu8GVEZK3sphzELqpnMT0OU93dCvSCmubKvF8L7RGzK?=
 =?iso-8859-1?Q?el8d9NyhhoZeeM/lpK3qhFhZqF7WlaoBlgcWhxdHJ/5M1fzNcnsN1RqnXv?=
 =?iso-8859-1?Q?d8xw2ZwGvhIPdlbNryBy08CxaB2en4nKCm0gV+IH2WOuDf3n8N0FYtnZeW?=
 =?iso-8859-1?Q?UOW76Tl85FLbuksOuoUVcKf+PiLksw6RX7oA4elwgz66HSiKzfI7TJ5PB8?=
 =?iso-8859-1?Q?4j8+RgJ9IKnPRc7JxcwqEyalvYJho3Thm9Li/eY1P7CaIj0qNf1rezbIM1?=
 =?iso-8859-1?Q?i5vO8IfkHcVosfcZ6wY1CFKn6v4jkRvsnHNUXPmYbbG4RYOHSnmfWF9elR?=
 =?iso-8859-1?Q?DR0VMJamoHJBnVFwsDDqrZKrU1xKPvInFpwGH5VijqvfnzQsa5CIDEtvq6?=
 =?iso-8859-1?Q?zW0hdVFc8BDbaExyAeKj19MDmm19UQg7kp7xS7fK4oY/xmlXjq0Qu1KnTm?=
 =?iso-8859-1?Q?9UrshjpBMbECPwo8Lv+1oCZXVY2gW6ZzIuTfzZCnWRoQbe4Kbn9p92RU+F?=
 =?iso-8859-1?Q?Tl65/ZibpOmy5FVlOP97rhbJOjN53UNyj1JJwCqbYiVKBp5i6zUU8l5wyW?=
 =?iso-8859-1?Q?so74xFQJ4/rBDq3dQXmDiC0/0zFaOI8nzVYF1zpXu7w51Bhn/ZNKRnCFCt?=
 =?iso-8859-1?Q?rgVIcZHtKkSatOnjQw96NMBpWIuZOlU9dhl5i9ZH/MwLim3yLW4B87CnI9?=
 =?iso-8859-1?Q?05NE9cpblxUe80omKay+iO3eL7rn/7N/u80uvYgiH2SJPYwNX9v3TRCil0?=
 =?iso-8859-1?Q?wNKlzAZi1lfLNCjR3jTIf0sN4Jn4Z7XA0X17iZA6+vuQ3zD06tijPHyCwp?=
 =?iso-8859-1?Q?Lb8gC4QPoYU4Es75hrvVjnAsa6IIxbi8rZEn392zdtzt+G5CDlh7uGle10?=
 =?iso-8859-1?Q?eVmFj1ile3FD0146FeOjQplXP7XcSAEv0RYUseZcBvugrg0n8DN5w4XFRF?=
 =?iso-8859-1?Q?jk1WmwEeWkxfY6vMmInS0SB6LylBiXiuVsUQ3J/TxvfDixq4HVm4XhYA3n?=
 =?iso-8859-1?Q?dHMvIay9C1ej9kQ2cjhtMFtNpm+eK/sa4J3vsolb04ZOEC9ZjA9xZiyYxA?=
 =?iso-8859-1?Q?wMQ6PXNOpvv0f3nLBoL9g4br0IYsrDuZdqVe3PN4W/UnjCyxwqQmySovdE?=
 =?iso-8859-1?Q?L1JN/pTLk+w9cKZyXco6R/o+Jlxt94DNtz8iW2mPRgcxIIsCtrYtfYCQQZ?=
 =?iso-8859-1?Q?qcQPh9vnI2SuwUzkR8XAXqRv0a+q1o1VNA+EEXLBIaBINcHPF+20mFMM/F?=
 =?iso-8859-1?Q?iZsIReXVIHkfSNdT95n9OXDnutHQsBubqoycTqS6MYallJmMw7+xDne2GF?=
 =?iso-8859-1?Q?FpP5ljZzyk6p0q29ooDazYK9L+Ci6T+Bgh/IrrpQvg8V3GyOWC3DMPVaha?=
 =?iso-8859-1?Q?TXMxnP6yDXtqE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bf2fcb-9b34-4de0-69fc-08dc135a7871
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 10:37:26.7970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZYzz0z/AviHD20o06T9XjpQCJbBI2pqyhxD5TnK0d+uHEDOKXB+fU340gQ7IKVm8nae1j6MqupMJI9WFbG+sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7736

Hi Alexander,

Thanks for your suggestions!

>
> Hi,
>
> thanks for the update.
>
> Am Montag, 18. Dezember 2023, 09:54:55 CET schrieb Xu Yang:
> > There are 2 USB controllers on i.MX93. Add them.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> > Changes in v2:
> >  - fix format as suggested by Alexander
> >  - change compatible from fsl,imx8mm-usb to fsl,imx93-usb
> > ---
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 58 ++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > b/arch/arm64/boot/dts/freescale/imx93.dtsi index 34c0540276d1..043ec8dc=
9aca
> > 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -171,6 +171,20 @@ cm33: remoteproc-cm33 {
> >               status =3D "disabled";
> >       };
> >
> > +     usbphynop1: usbphynop1 {
> > +             compatible =3D "usb-nop-xceiv";
> > +             #phy-cells =3D <0>;
> > +             clocks =3D <&clk IMX93_CLK_USB_PHY_BURUNIN>;
> > +             clock-names =3D "main_clk";
> > +     };
> > +
> > +     usbphynop2: usbphynop2 {
> > +             compatible =3D "usb-nop-xceiv";
> > +             #phy-cells =3D <0>;
> > +             clocks =3D <&clk IMX93_CLK_USB_PHY_BURUNIN>;
> > +             clock-names =3D "main_clk";
> > +     };
> > +
> >       soc@0 {
> >               compatible =3D "simple-bus";
> >               #address-cells =3D <1>;
> > @@ -1059,5 +1073,49 @@ ddr-pmu@4e300dc0 {
> >                       reg =3D <0x4e300dc0 0x200>;
> >                       interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> >               };
> > +
> > +             usbotg1: usb@4c100000 {
> > +                     compatible =3D "fsl,imx93-usb", "fsl,imx7d-usb",
> "fsl,imx27-usb";
> > +                     reg =3D <0x4c100000 0x200>;
> > +                     interrupts =3D <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&clk IMX93_CLK_USB_CONTROLLER_GATE>,
> > +                              <&clk IMX93_CLK_HSIO_32K_GATE>;
> > +                     clock-names =3D "usb_ctrl_root_clk",
> "usb_wakeup_clk";
> > +                     assigned-clocks =3D <&clk IMX93_CLK_HSIO>;
> > +                     assigned-clock-parents =3D <&clk
> IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> > +                     assigned-clock-rates =3D <133000000>;
> > +                     fsl,usbphy =3D <&usbphynop1>;
>
> fsl,usbphy is depreacated. Please refer to Documentation/devicetree/bindi=
ngs/
> usb/ci-hdrc-usb2.yaml

Will use phys.

>
> > +                     fsl,usbmisc =3D <&usbmisc1 0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             usbmisc1: usbmisc@4c100200 {
> > +                     compatible =3D "fsl,imx8mm-usbmisc", "fsl,imx7d-
> usbmisc",
> > +                                     "fsl,imx6q-usbmisc";
> > +                     reg =3D <0x4c100200 0x200>;
> > +                     #index-cells =3D <1>;
> > +             };
> > +
> > +             usbotg2: usb@4c200000 {
> > +                     compatible =3D "fsl,imx93-usb", "fsl,imx7d-usb",
> "fsl,imx27-usb";
> > +                     reg =3D <0x4c200000 0x200>;
> > +                     interrupts =3D <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&clk IMX93_CLK_USB_CONTROLLER_GATE>,
> > +                              <&clk IMX93_CLK_HSIO_32K_GATE>;
> > +                     clock-names =3D "usb_ctrl_root_clk",
> "usb_wakeup_clk";
> > +                     assigned-clocks =3D <&clk IMX93_CLK_HSIO>;
> > +                     assigned-clock-parents =3D <&clk
> IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> > +                     assigned-clock-rates =3D <133000000>;
> > +                     fsl,usbphy =3D <&usbphynop2>;
>
> fsl,usbphy is depreacated. Please refer to Documentation/devicetree/bindi=
ngs/
> usb/ci-hdrc-usb2.yaml

Will use phys.

>
> > +                     fsl,usbmisc =3D <&usbmisc2 0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             usbmisc2: usbmisc@4c200200 {
> > +                     compatible =3D "fsl,imx8mm-usbmisc", "fsl,imx7d-
> usbmisc",
> > +                                     "fsl,imx6q-usbmisc";
> > +                     reg =3D <0x4c200200 0x200>;
> > +                     #index-cells =3D <1>;
> > +             };
>
> Please insert these nodes sorted by node address. It should be inserted b=
efore
> ddr-pmu.

Yeah, will reorder this.

Thanks,
Xu Yang

>
> Best regards,
> Alexander
>
> >       };
> >  };
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq-/
> group.com%2F&data=3D05%7C02%7Cxu.yang_2%40nxp.com%7Ca7515221334d4f6208d80=
8dc10616ce0%7C686ea1d3bc2b4c6f
> a92cd99c5c301635%7C0%7C0%7C638403257827168718%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV
> 2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D14dgYcXowoH=
WMw9a1Snv1HxdQnXQe7RCyq0jn
> VXb710%3D&reserved=3D0
>


