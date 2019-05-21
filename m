Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 210C324AA1
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 10:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfEUImf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 04:42:35 -0400
Received: from mail-eopbgr130044.outbound.protection.outlook.com ([40.107.13.44]:50660
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725790AbfEUImf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 04:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTwn26hGk98qhFNKDhuqmtRcWqbka96B26HnzTZdOIo=;
 b=gdjrHy4H3hIAefLoi/Ia6QoSNPIdnAjQtvAXKlTSf8qoRnG9pxtbcRUucEIfNARw3BY63xh2RGnW6VePYsc5wFI8eIg81hH5onkLtLAm6FTw7Eqooh4L+VGC+W6EKwahLPZ2IM2Munrr2ouMy0bUSJTLJ//5jGgdEqRffXqtlZo=
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com (20.177.41.157) by
 AM0PR04MB5409.eurprd04.prod.outlook.com (20.178.116.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Tue, 21 May 2019 08:42:32 +0000
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::f0fd:f85a:5df:8dd0]) by AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::f0fd:f85a:5df:8dd0%5]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 08:42:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Topic: [PATCH v2 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Index: AQHVCigBwvPXZQ0UVkuAwmjsg1TEmaZzp+eAgAGl6NA=
Date:   Tue, 21 May 2019 08:42:31 +0000
Message-ID: <AM0PR04MB53140D914E608A9BA2CB30858B070@AM0PR04MB5314.eurprd04.prod.outlook.com>
References: <20190514073529.29505-1-peter.chen@nxp.com>
 <20190514073529.29505-7-peter.chen@nxp.com> <20190520073157.GW15856@dragon>
In-Reply-To: <20190520073157.GW15856@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edd3fda7-4874-497e-fc87-08d6ddc843c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5409;
x-ms-traffictypediagnostic: AM0PR04MB5409:
x-microsoft-antispam-prvs: <AM0PR04MB5409520D87D99FE36402900A8B070@AM0PR04MB5409.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(346002)(376002)(136003)(396003)(39860400002)(366004)(189003)(199004)(6506007)(54906003)(316002)(71200400001)(8676002)(33656002)(81166006)(81156014)(71190400001)(14454004)(7696005)(76176011)(73956011)(66946007)(6116002)(3846002)(76116006)(5660300002)(66476007)(66556008)(64756008)(66446008)(68736007)(6916009)(8936002)(186003)(25786009)(26005)(6436002)(2906002)(74316002)(256004)(9686003)(14444005)(11346002)(55016002)(52536014)(66066001)(102836004)(229853002)(476003)(305945005)(486006)(99286004)(446003)(86362001)(4326008)(44832011)(7736002)(478600001)(53936002)(6246003)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5409;H:AM0PR04MB5314.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h0MOTsQ3ZcKrMCMGiPE/NqeeppooVODBcwMXx7sxmFOryGJJL05dOaEdedrd4wUdeVGS9ZmlbESBM5e0TvQSLPeDL7VixVSPiifVK9nLiOCcbkV3+OAkUns339hlQtHLqSbBkXY2YRmQP2qI5LPHLsM5WDFxUzHgHysFhsH4ouDJS4F1HbDCR5W9UMP/R5pgY4siWtz/AVVgE5d+9x9XQbY2CBKi2yPAyU6smzTWLnKCeWkW4T688OwDFVvOEubd4L/Yqz61A4I8RoTfTeso9K2t1ua1NGYzu9N4rrIsmUhUJ28C/Qe2mTN6I6Faeze+JDXqD/qVWOis+1dPH0SNvQuL8O1tdw7JpdTwuKTXUGQcvzRMGh7tl8qftikxdk8XMFM5Jv+HF1Lb3vbrq7EG9HHoXqoNKjSAQqJRQRGeGQQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd3fda7-4874-497e-fc87-08d6ddc843c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 08:42:31.9062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5409
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/imx7ulp.dtsi
> > b/arch/arm/boot/dts/imx7ulp.dtsi index fca6e50f37c8..60c9ea116d0a
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
> > +			#index-cells =3D <1>;
>=20
> Nit: we usually start with 'compatible', so can we move it behind?
>=20

Thanks, will change.

Peter


> Shawn
>=20
> > +			compatible =3D "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc",
> > +				"fsl,imx6q-usbmisc";
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
