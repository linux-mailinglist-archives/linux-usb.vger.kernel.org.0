Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2594E579E4
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 05:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfF0DPz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 23:15:55 -0400
Received: from mail-eopbgr80055.outbound.protection.outlook.com ([40.107.8.55]:35779
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726658AbfF0DPy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jun 2019 23:15:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=eOpPOJORTld4S5EGUtNArXZhNWedGwkNSuWZV6/lJn418/yIH9iypZm1C4n/r9drUq8exdnowpMltqpR3Gxu1ICU5owNn0lp4WhY0g7PCq/WssAwGE9Id9tlNJ2RAO2qnLljp8KZH28t2Y0/atHDLsibgEkIIBZplU5/A+EJBCE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//FTMzMLu4qy16pZrlWVzETg1EFJoMb9nkKmOsuKJR0=;
 b=sGcQua/UZMIlzjJ2D5wNvHSaPZzQy/1vPBRSmRTSDE4Mw7E33jQU5yDNhbKzQd9VPnV50LBl5o4pYxLMZAHgbnpqPJHhbvbmBo7f2MmvCe437faxzScP2r+2KygIZmHNjUCfMaRGrSdmXDYpP6sY0xlrNLCYA7Ga0jF+lEItoEg=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//FTMzMLu4qy16pZrlWVzETg1EFJoMb9nkKmOsuKJR0=;
 b=W0jmCSawPWsjdYNnrVf2hx2B946jULC0iJCaVWfqkNOxrndDGwnu0IOX9l7+wrKC1SOJ9mNFxJ8lbxtxNv1/UPgFxCZSTD9GK4J5FxiOXE/0ruw8O8+6xNpTSI4+sBM9tFmbCwVQzx6B8TegUpopBASqYECBgl7nD8pCkU+lpzU=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3247.eurprd04.prod.outlook.com (10.170.232.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 03:15:10 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a%7]) with mapi id 15.20.2008.014; Thu, 27 Jun 2019
 03:15:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>
CC:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: RE: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
Thread-Topic: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
Thread-Index: AQHVKz1enai+x3/0XUiWuEOLFWXTl6atMdCggAA+2YCAAWVgEA==
Date:   Thu, 27 Jun 2019 03:15:10 +0000
Message-ID: <VI1PR04MB53270E979BA9817D47A7AFC88BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
 <VI1PR04MB5327E09DB0DFEB7E868DB59D8BE20@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20190626055409.jjiwptyths6p6jty@pengutronix.de>
In-Reply-To: <20190626055409.jjiwptyths6p6jty@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be3b1208-ab83-4d52-b975-08d6faada9b2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3247;
x-ms-traffictypediagnostic: VI1PR04MB3247:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR04MB3247A1E13C951FA5A26CD8348BFD0@VI1PR04MB3247.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(396003)(366004)(136003)(346002)(199004)(189003)(6436002)(76176011)(5660300002)(99286004)(2501003)(53546011)(68736007)(14444005)(3846002)(54906003)(6506007)(476003)(66574012)(186003)(6246003)(55016002)(71200400001)(2906002)(256004)(52536014)(110136005)(11346002)(66066001)(71190400001)(7696005)(81156014)(33656002)(53936002)(8936002)(305945005)(81166006)(6116002)(102836004)(446003)(45080400002)(66476007)(7736002)(26005)(9686003)(64756008)(14454004)(73956011)(44832011)(86362001)(8676002)(316002)(76116006)(66556008)(6306002)(486006)(4326008)(66946007)(74316002)(25786009)(229853002)(66446008)(966005)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3247;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZpbfG2WyoMpzpdQcf7Zr16DmTKXOifMmJlACHQ6jOF37wC4cCTGBw7zTL+KI4l07UvUb9V93XIRU1rdimQUb69CWHdI7txzp8BJx6mBA1i706XEqA0p9SLTbo/Rl5z6FxVV9wUZAdlPiVk19EQlgojIERocZ9RMh6C+DBpq7j/QHBcjZWWBBdQyM2BjlHhIfDeUb8WJQ3IaJWtx049T0mc4YmBQWu9jDPpfUZHbl1Hoodg2xP44pjNhjPZWeuKZrWjYND+RhsPh0PYknoumNOlCGUfAue3QEw86zS87WAeayQtRol0M8RgB6iHJE1whGWKqWLSMjbkwk8KfJmRQXLqZah24dS6K3eX0dzGijWiDOSu1ViFO1Gnni7aIWxWC9Zm4P78DWTUYjt2nlkuFpXv4HvmVLnTk2vegarEMBHzQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3b1208-ab83-4d52-b975-08d6faada9b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 03:15:10.2272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3247
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> On 19-06-26 02:40, Peter Chen wrote:
> >
> > > Subject: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
> > >
> > > The usb phys are internal to the SoC and so it their 5V supply. With
> > > this regulator added explicitly the following (harmless) boot message=
s go away:
> > >
> > > 	usb_phy_generic usbphy:usb-phy@0: usbphy:usb-phy@0 supply vcc not
> > > found, using dummy regulator
> > > 	usb_phy_generic usbphy:usb-phy@1: usbphy:usb-phy@1 supply vcc not
> > > found, using dummy regulator
> > >
> >
> > To eliminate the warning message, I suggest doing below changes, as
> > vcc supply is not mandatory.
> >
> > diff --git a/drivers/usb/phy/phy-generic.c
> > b/drivers/usb/phy/phy-generic.c index a53b89be5324..01a5ff1a0515
> > 100644
> > --- a/drivers/usb/phy/phy-generic.c
> > +++ b/drivers/usb/phy/phy-generic.c
> > @@ -275,7 +275,7 @@ int usb_phy_gen_create_phy(struct device *dev, stru=
ct
> usb_phy_generic *nop,
> >                 }
> >         }
> >
> > -       nop->vcc =3D devm_regulator_get(dev, "vcc");
> > +       nop->vcc =3D devm_regulator_get_optional(dev, "vcc");
>=20
> Is the regulator optional? IMHO this shouldn't be the fix. I think the ri=
ght fix is Uwe's
> approach.
>=20

Add Felipe.

Some USB PHY's power are from the core system's power (eg, DDR), and some a=
re
fixed at the board and no switch for it. So, it is transparent for software=
 at some cases.

Peter

> Regards,
>   Marco
>=20
> >         if (IS_ERR(nop->vcc)) {
> >                 dev_dbg(dev, "Error getting vcc regulator: %ld\n",
> >                                         PTR_ERR(nop->vcc));
> >
> > Peter
> >
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > > Hello,
> > >
> > > note I'm an USB noob, so please consider carefully before applying
> > > :-) I also put the regulator near the usbphy node instead of in
> > > alphabetic order. Not sure what is sensible/usual here, too.
> > >
> > > Best regards
> > > Uwe
> > >
> > >  arch/arm/boot/dts/imx25.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/imx25.dtsi
> > > b/arch/arm/boot/dts/imx25.dtsi
> > > --- a/arch/arm/boot/dts/imx25.dtsi
> > > +++ b/arch/arm/boot/dts/imx25.dtsi
> > > @@ -614,6 +614,11 @@
> > >  		};
> > >  	};
> > >
> > > +	reg_usb: regulator_usbphy {
> > > +		compatible =3D "regulator-fixed";
> > > +		regulator-name =3D "usb-phy supply";
> > > +	};
> > > +
> > >  	usbphy {
> > >  		compatible =3D "simple-bus";
> > >  		#address-cells =3D <1>;
> > > @@ -623,12 +630,14 @@
> > >  			reg =3D <0>;
> > >  			compatible =3D "usb-nop-xceiv";
> > >  			#phy-cells =3D <0>;
> > > +			vcc-supply =3D <&reg_usb>;
> > >  		};
> > >
> > >  		usbphy1: usb-phy@1 {
> > >  			reg =3D <1>;
> > >  			compatible =3D "usb-nop-xceiv";
> > >  			#phy-cells =3D <0>;
> > > +			vcc-supply =3D <&reg_usb>;
> > >  		};
> > >  	};
> > >  };
> > > --
> > > 2.20.1
> >
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Industrial Linux Solutions                 |
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.pe=
ngutro
> nix.de%2F&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7Cd1a839827b3a49
> 0624f508d6f9fab73f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 6971252538657445&amp;sdata=3DkfTeGJ99AfS74BqdRAOLVJm52jIFIdNmZXXYPX
> SzAcA%3D&amp;reserved=3D0  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
