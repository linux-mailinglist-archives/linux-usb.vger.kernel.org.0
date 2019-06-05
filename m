Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29F853576C
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 09:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfFEHHe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 03:07:34 -0400
Received: from mail-eopbgr20080.outbound.protection.outlook.com ([40.107.2.80]:62209
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726536AbfFEHHe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 03:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLAAt3BL+sGQp4G4btulciJGZrB7AfgtnguDDX6EvfU=;
 b=jF70+Es9DCcFZRI6sgfNHduCGIWgAHMXSlHiZ1EYssKN/kVYBJTqxNqQL9WwcR5mCiRLzkIBLaRki9XEqu+1mlEF7KyvMnOa0CRyJefRIezyxKfTd54U2LBxQherU7lGB4VY8NgBGbI2d2chdxzIlNPC7kBJQwoQGWKUw8q9aHI=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4846.eurprd04.prod.outlook.com (20.177.49.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 07:07:30 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9891:c973:a697:3c7b]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9891:c973:a697:3c7b%3]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 07:07:30 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "chunfeng.yun@mediatek.com" <chunfeng.yun@mediatek.com>
Subject: RE: [PATCH v3 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Topic: [PATCH v3 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Index: AQHVFDjwJwcxVExAwkGmD5zag5gWjKaMpnEAgAALr+A=
Date:   Wed, 5 Jun 2019 07:07:30 +0000
Message-ID: <VI1PR04MB53274359CFCA91AE6A3681678B160@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190527030616.44397-1-peter.chen@nxp.com>
 <20190527030616.44397-7-peter.chen@nxp.com> <20190605062517.GF29853@dragon>
In-Reply-To: <20190605062517.GF29853@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bd2feaa-8643-4a11-da47-08d6e984799a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB4846;
x-ms-traffictypediagnostic: VI1PR04MB4846:
x-microsoft-antispam-prvs: <VI1PR04MB484652FCA720ACD74FA66AA78B160@VI1PR04MB4846.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(366004)(136003)(39860400002)(376002)(199004)(189003)(53936002)(14444005)(256004)(55016002)(6436002)(9686003)(7736002)(66066001)(74316002)(99286004)(229853002)(71190400001)(71200400001)(44832011)(25786009)(5660300002)(6116002)(486006)(6246003)(476003)(6916009)(3846002)(11346002)(446003)(4326008)(86362001)(52536014)(33656002)(73956011)(6506007)(66476007)(66946007)(66556008)(66446008)(64756008)(76116006)(76176011)(7696005)(54906003)(316002)(102836004)(2906002)(8936002)(305945005)(68736007)(8676002)(81156014)(81166006)(478600001)(26005)(186003)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4846;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J6ZfiYXQEemDHuK223RWhdo6tBRF4MsNwEVinmU3LKjVDR+hY+qJoWPJ73M6zqvxWBEHSWNI+R3tRhw6MVAZDfxJJAtL8PS0bNgqHFAAxD2Ps76Wrs8tcultTp8Nap1SaoSdoYWYSCNWq9+GK5baEsAP20RQJvKkaKZwIH7n9kEputOwpUQz4JNBbXeDOKhSQTAQpl28yAnYcIc/+1Srx+xhgG22ia9F+sOogjUvdLTmgG43zH8/E51QwymS/rmYaP4HLmDYnm5M6HvhE5g9I1oI59FGkill3mbLPo60fmXDAEL2+w6YsdL1WuTTpPdntvPw/TxPBENbFQSl/fN0qI413dDq9aFQ+qHgJllmuemcvewHhGfTUGZ1V8v5jWbF/ZUYsnzYs8B3YGrDjsLo1EyCn62xbIl54feN41w36ls=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd2feaa-8643-4a11-da47-08d6e984799a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 07:07:30.3660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  arch/arm/boot/dts/imx7ulp.dtsi | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/imx7ulp.dtsi
> > b/arch/arm/boot/dts/imx7ulp.dtsi index fca6e50f37c8..37b058119505
> > 100644
> > --- a/arch/arm/boot/dts/imx7ulp.dtsi
> > +++ b/arch/arm/boot/dts/imx7ulp.dtsi
> > @@ -30,6 +30,7 @@
> >  		serial1 =3D &lpuart5;
> >  		serial2 =3D &lpuart6;
> >  		serial3 =3D &lpuart7;
> > +		usbphy0 =3D &usbphy1;
> >  	};
> >
> >  	cpus {
> > @@ -133,6 +134,36 @@
> >  			clock-names =3D "ipg", "per";
> >  		};
> >
> > +		usbotg1: usb@40330000 {
> > +			compatible =3D "fsl,imx7ulp-usb", "fsl,imx6ul-usb",
> > +				"fsl,imx27-usb";
>=20
> If "fsl,imx6ul-usb" is the one that imx7ulp device is compatible with and=
 will match in
> driver, "fsl,imx27-usb" can just be dropped.  Same comment on usbmisc and
> usbphy below.
>=20

Ok, will change, thanks.

Peter

> Shawn
>=20
> > +			reg =3D <0x40330000 0x200>;
> > +			interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&pcc2 IMX7ULP_CLK_USB0>;
> > +			phys =3D <&usbphy1>;
> > +			fsl,usbmisc =3D <&usbmisc1 0>;
> > +			ahb-burst-config =3D <0x0>;
> > +			tx-burst-size-dword =3D <0x8>;
> > +			rx-burst-size-dword =3D <0x8>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		usbmisc1: usbmisc@40330200 {
> > +			compatible =3D "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc",
> > +				"fsl,imx6q-usbmisc";
> > +			#index-cells =3D <1>;
> > +			reg =3D <0x40330200 0x200>;
> > +		};
> > +
> > +		usbphy1: usbphy@0x40350000 {
> > +			compatible =3D "fsl,imx7ulp-usbphy",
> > +				"fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
> > +			reg =3D <0x40350000 0x1000>;
> > +			interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&pcc2 IMX7ULP_CLK_USB_PHY>;
> > +			#phy-cells =3D <0>;
> > +		};
> > +
> >  		usdhc0: mmc@40370000 {
> >  			compatible =3D "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
> >  			reg =3D <0x40370000 0x10000>;
> > --
> > 2.14.1
> >
