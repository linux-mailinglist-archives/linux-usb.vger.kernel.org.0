Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAA32753A3
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 10:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgIWItK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 04:49:10 -0400
Received: from mail-eopbgr130047.outbound.protection.outlook.com ([40.107.13.47]:33252
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726244AbgIWItK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 04:49:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QshjauApqZKrTYWLnQ61YPR7Pv5IYFF952FQHPqq2559uPUxLbFZfIqz59An4/cCsv5e086xQXAXPGa1zdNZD8Ka7ZX+BuEm6CsFc99zrziYeI9ZdDyGaxPO08UsMUbN9+6ib4SeSFOOmDMuAzc7j6vO9bweVs3FlSkVrurBn0OM/tV19wn3MpzBj0+uew9UcQpF2FrjVA9UoQrrFkgJ3XSQVw6ZvCSwbm4qNTVJNPRVEqjQR+PJqztFx9+N2XJMlvXex6rzoPil5yb62qraCDFrgiRrNdCtzPgaUgq1CimedhIityL+oXylGS0m4V8paFCsFHTVQqEG9quofQ281w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/iAM6DadWaPI3yy4W0PNa+QYF7LKdAioCjLZ520Sbg=;
 b=PE46e8nCSqpF/raCYH/RGIPN1XPGSk/Tz7f4VN0P17mEG6xwC3H2N/DWHUHd67j3FXwC4XpvBbfwbJFYwSSDzvcjc0Oe2CINct4NTCzOrmYzR5DWvL3v9sSO5y0xH4BdQtSgcKPWWQOkd3kWRVVeKB+nvJDu5fHBo6173yUhHGicsMEL+MoBrlhQzd+wZtqC1pwBOBZ0hTfLleAV3UzByDd68+xj/6Q0x7cGCJjZLmJZJrHsVhq3pMMEgzjrODB7ZthJa86cOSpgHPxb8M9UZGMz8qr6RWSZvKaGnugswFNI6DeaG8f33lYmZJ79UDamkK5OOJvnusp0DBZfx6IRtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/iAM6DadWaPI3yy4W0PNa+QYF7LKdAioCjLZ520Sbg=;
 b=gzZnml35sH1w/MBCmLM1haXwO/vr5NbwZURrdujMg1FyfmXI771KwQZ9PC000epgqfdr62MUywRIEc/pD3kauGK3dh3M6KQFVblrDqczHS+iZGl7OlL+SIjUaYbc3c2WmeuMe17x0neoE6eGA1J1lnmol1vphizy/hzNRkaRCBk=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB2911.eurprd04.prod.outlook.com (2603:10a6:800:b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 23 Sep
 2020 08:49:02 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3412.021; Wed, 23 Sep 2020
 08:49:02 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Andy Duan <fugang.duan@nxp.com>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Horia Geanta <horia.geanta@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 5/6] arm64: dtsi: imx8mp: add usb nodes
Thread-Topic: [PATCH v3 5/6] arm64: dtsi: imx8mp: add usb nodes
Thread-Index: AQHWkM7DXkEXgbilUUGiAK82DqBrNKl12tgAgAAQB0A=
Date:   Wed, 23 Sep 2020 08:49:02 +0000
Message-ID: <VE1PR04MB6528E04C7D110000509B6D3C89380@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
 <1600771612-30727-6-git-send-email-jun.li@nxp.com>
 <20200923075040.GD25328@pengutronix.de>
In-Reply-To: <20200923075040.GD25328@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 291852a4-04bb-4899-e4fa-08d85f9d8549
x-ms-traffictypediagnostic: VI1PR0402MB2911:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB291107D1EFEEC908E821D50E89380@VI1PR0402MB2911.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p4sY4n5OZlpG5o3tmTrnWdo5f9EeDzi3w0aJVkZtMsejG/soDeRLph6GTTK5MOoRcrIpaCyFWLVcRZgfmges38x7dCXkBfXCLt4s5vdYBzKkXmEBtNqx1xOwlYInkaM6rqj5rXUzRCcAKcuqp0kmdBf+a+v7vss/iaajnalqGvSuMSwRYlnwf++BZGydGkwVRcd8A67iy+WpulSBH2ucsCTc9XMEu4mK68bx0mztiAiDjcPqe2GHYigIaJLw60Fy7UJb/IJlWOuD+xXQ47FQkL8YBj0uDI16sLeELuHFptCbb+rCUeg0uTJxs1nX4+tycceaYbVErqUtqCoaiFJFyZcsZogTf4hQ99xnYZYRLCf89hCMoGWcQeDkK57uLMZibsO2ukq0ahN263bssytLA2ABMv/CpkIDYxV+xARP3kv+QPg7kbx6CHlYtFm4brYKRMpWWTCSbWuteJuLumr/8urCQIH0Ysn0xgYyxKNJP3d8S+8Gw654Jgw+E1ebZ8ms
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(52536014)(53546011)(8676002)(76116006)(45080400002)(44832011)(186003)(66476007)(66556008)(478600001)(966005)(26005)(8936002)(55016002)(2906002)(6916009)(64756008)(66946007)(7416002)(4326008)(6506007)(66446008)(316002)(83080400001)(71200400001)(83380400001)(33656002)(9686003)(54906003)(86362001)(7696005)(5660300002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: SZLZkP6086y806Qk3lN3fMSc/C6+Q/TeTJxpUSdHGTlrfLF5y5+tx2jdorTQsKrY/6dgzbISX6AhZNsLxypjMgsDqEm07/URIHvWsyUkN1VmbASp0t2GLd2vxGeUaVlD6XS72QbeOzl6hnWnQWFwVd+XpHdm2vn/YonPJVX7RToO94WomKnALMn/0obq71uG3PkIH+nespj5xp57q6/6IwBshWn1JjVPhM3VQU2OS610UIv7fv9zFp+C9VtaENDML0IDiUY0AR1u+5hApjTE9wXoL4FfTpcQrk77ljFGStTbtsw0j+J/3VdyFNfyXv72GUEVDHNsGPFLd8f/0KtTapWbDgdOcJtt375FEw0/piN4Iz9QvOUXv0GObdauFXck78XS9ngqKSEo4MWoxi2bu8D1WKGxhx5z/JUaluSpyEyukkfb6jFiqW0pblds7DrtW8JCUYEYzvxeOzLTACBf833KmTcFVWWuM9PAkVCKJ5U12dw5dkjX25xkjFztH50IBgUrwdy8gsNTqxG9cgd6EpDIJExwvyzYLtkry6XGJ1uukQ1rIaqz7iUAB1QweFFxFrV4gJviKjOgLCCaR3TK+MmPydICS+2RuX1TmekAANjbmwTNoekvU3YcYaX0IlBbzaGmH3QfUsZxDVbcAT1Nfw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291852a4-04bb-4899-e4fa-08d85f9d8549
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 08:49:02.2792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uk/m9NRTWe0HKum+yMUxiAs2sC6ez+gRiOIN9IkpiF9LS9jkN/xlRE0vGqwMzxsX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2911
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Sascha Hauer <s.hauer@pengutronix.de>
> Sent: Wednesday, September 23, 2020 3:51 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: robh+dt@kernel.org; shawnguo@kernel.org; balbi@kernel.org;
> mathias.nyman@intel.com; gregkh@linuxfoundation.org;
> kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx
> <linux-imx@nxp.com>; Anson Huang <anson.huang@nxp.com>; Aisheng Dong
> <aisheng.dong@nxp.com>; Peng Fan <peng.fan@nxp.com>; Andy Duan
> <fugang.duan@nxp.com>; Joakim Zhang <qiangqing.zhang@nxp.com>; Horia
> Geanta <horia.geanta@nxp.com>; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v3 5/6] arm64: dtsi: imx8mp: add usb nodes
>=20
> On Tue, Sep 22, 2020 at 06:46:51PM +0800, Li Jun wrote:
> > imx8mp integrates 2 identical dwc3 based USB3 controllers and Synopsys
> > phys, each instance has additional wakeup logic to support low power
> > mode, so the glue layer need a node with dwc3 core sub node.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 88
> > +++++++++++++++++++++++++++++++
> >  1 file changed, 88 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index 9de2aa1..1b7ed4c 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +		usb3_1: usb@32f10108 {
> > +			compatible =3D "fsl,imx8mp-dwc3";
> > +			reg =3D <0x32f10108 0x8>;
> > +			clocks =3D <&clk IMX8MP_CLK_HSIO_ROOT>,
> > +				 <&clk IMX8MP_CLK_USB_ROOT>;
> > +			clock-names =3D "hsio", "suspend";
> > +			assigned-clocks =3D <&clk IMX8MP_CLK_HSIO_AXI_SRC>;
>=20
> In Linux-5.9-rc6 this clock doesn't exist anymore. Should be
> IMX8MP_CLK_HSIO_AXI

Will change.

>=20
> > +			assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_500M>;
> > +			assigned-clock-rates =3D <500000000>;
> > +			interrupts =3D <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +			ranges;
> > +			status =3D "disabled";
> > +
> > +			usb_dwc3_1: dwc3@38200000 {
> > +				compatible =3D "snps,dwc3";
> > +				reg =3D <0x38200000 0x10000>;
> > +				clocks =3D <&clk IMX8MP_CLK_HSIO_AXI>,
> > +					 <&clk IMX8MP_CLK_USB_CORE_REF>,
> > +					 <&clk IMX8MP_CLK_USB_ROOT>;
> > +				clock-names =3D "bus_early", "ref", "suspend";
> > +				assigned-clocks =3D <&clk IMX8MP_CLK_HSIO_AXI>;
> > +				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_500M>;
> > +				assigned-clock-rates =3D <500000000>;
> > +				interrupts =3D <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> > +				phys =3D <&usb3_phy1>, <&usb3_phy1>;
> > +				phy-names =3D "usb2-phy", "usb3-phy";
> > +				snps,dis-u2-freeclk-exists-quirk;
> > +				xhci-64bit-support-disable;
> > +				status =3D "disabled";
>=20
> Does it make sense for a board to enable the parent node and leave this o=
ne
> disabled? If not you can drop this status =3D "disabled" here.

OK, will drop it.

Thanks
Li Jun
>=20
> Sascha
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       |
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.pe
> ngutronix.de%2F&amp;data=3D02%7C01%7Cjun.li%40nxp.com%7Cadbbbfe2edec4cca1
> 38908d85f956382%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6373644425
> 20571896&amp;sdata=3D07ku8kTQCv8lv8qdRiOcU3CX4lly3503LO4bUDIbjow%3D&amp;r
> eserved=3D0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
