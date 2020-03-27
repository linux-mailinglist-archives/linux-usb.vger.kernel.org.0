Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE0311957E5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 14:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgC0NVi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 09:21:38 -0400
Received: from mail-vi1eur05on2050.outbound.protection.outlook.com ([40.107.21.50]:6157
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726275AbgC0NVi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Mar 2020 09:21:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8NFM95qb9DV0jeyLtUqt6x95CmsQpRf3NdUDCgHCLe3xiffbheF7ru4tzg+SHF5yDwsmZ6NRgad7oJw/huGRxr45Mc/nmjHtZlyOLlNs76vCtrGJBOp41teo0YQDqCldPlmwCcphE9Nugecl2OdPq+iMg/U4MSzVJH2vgq7YkkrV53caIFUGauodSqXzYi880lYNODxxStU0Else3yNqTL7CAGAMdxs51xksExTOcjusKiB1z11ScluF2Py9nrxaDpRSSj6sjJbMvmrU8fxvJit+HrMEDKFfPSwTdhON0sAoUXiRT5SAprRMsEjFYxIAgzOYEXWwL3HT+pXRN2SSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ce5DBR5Vm5VyEDfp2mZD1/d+Po3CHUz8wqdHe9Z9oGo=;
 b=PlcnnfoHE8rZ0/Q/TuHrEAdwh4lCscUUaBDyLHGBlDpwsgzoEp73+1lN8YkIQvLVBZfwafGx/9mnGp0qG1OgfxgnZyKz3VCfrg5TqtSApf521CPHZMTm85xLa1IPQHe2AcKuw8u9ZKjON2hzs9hJLFjr1AzdQjp2y1sSYRnUxaiKEu6hTYfUwaGZXkcTbVhUdqh4+F/1iYxFKybH2ld6DfEPKgxsbypgW89xnjh5oM8TjC8UIbs2nwc/9f9XkLBiL9KSKd8lzzpJ6K53lKlSA0/2h+uq38NdMXCzSjWHjwRGGg8Ef/i0xdmum/HJsU18O3uGWTJQCuk67P8ws7FlNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ce5DBR5Vm5VyEDfp2mZD1/d+Po3CHUz8wqdHe9Z9oGo=;
 b=qZoyTePpywsHoQVg4oiqZrVN2CvEgvBlGcbDwpxe5mxtVza7PgKc1nVxejatq+LUfui9UuvVwOK5eikNQljI6yP2g1w98PeeZfn4YTZX0E/Ni5YTbZLE3vvHHT7exfnwaXCYexHyaO9l4aoiqkR8PPvzcLurxWCeIu6mrTqen3M=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB7000.eurprd04.prod.outlook.com (10.141.172.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.18; Fri, 27 Mar 2020 13:21:34 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 13:21:33 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Oliver Graute <oliver.graute@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oliver Graute <Oliver.Graute@KoCoConnector.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: using cdns3-imx driver on imx8qm
Thread-Topic: using cdns3-imx driver on imx8qm
Thread-Index: AQHWA5EMk/twZNx6oE6N7BqRdcYd1qhcJrQAgAAMdACAADsSgA==
Date:   Fri, 27 Mar 2020 13:21:32 +0000
Message-ID: <20200327132153.GA31668@b29397-desktop>
References: <20200326170109.GA28051@optiplex>
 <20200327090554.GA31160@b29397-desktop> <20200327095028.GA19809@ripley>
In-Reply-To: <20200327095028.GA19809@ripley>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5735f7b0-71fd-46e4-b60a-08d7d251c4b7
x-ms-traffictypediagnostic: AM7PR04MB7000:|AM7PR04MB7000:|AM7PR04MB7000:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7000E78E28FC8A11EAEC1B2D8BCC0@AM7PR04MB7000.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(7916004)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(71200400001)(1076003)(91956017)(53546011)(76116006)(66946007)(66476007)(6506007)(66556008)(66446008)(64756008)(33656002)(26005)(86362001)(8936002)(6512007)(2906002)(9686003)(5660300002)(81156014)(81166006)(8676002)(478600001)(316002)(44832011)(45080400002)(6916009)(33716001)(186003)(6486002)(54906003)(4326008)(966005)(32563001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R8V1HxoIR8Rl4z78sdvZ9ye2w+ZHeUkmTcxqvV4PYTUaH06dnTfvem/lUhW1+3c1hyilWJTcFjCMaCNycLXEjOvcTL+cK9qH+GnMv6klg4diCcx+sn4UtoMtggqX3jmNmXCy+fvOrT6rFbFytFGz2FwIeROImLRLdAk15WBlhclFfv9Szdj0ov3zTfAg7L+o+KWOLpMxvyYVYO6z1g2Dv0UgdTeDkLrauCa0Y8m7b9Zfo8TmTvAKCRM70qwGhfzKsVdVKdx2C8+td6tPu/2ieyXfjgsZ+wYY+cGi5ORMJWgq4c8U3o313tuy7U3IM8f8uYlzFqVwOlJMqndCOiqGoTgVistQyuB00sQBHAAOUHau8MP9ARY/aWF0dX0ygFul2K7kHUpt65ILyHDwJCT/hAEsxaFl8SLIn3W3EvMeN4Tqqd/4XoHfyZcT9KtrdhapvMAYt6IxdhSsp8WQCCdpWco/g1+7blXzyY+wA6Z7KytliSDQED4HxLpaI7hqT4yEbrr7ztLk2XHPOAxvsmC7Zbxc9uXkax86F+SueAKNLShFYHmwFc1A6K1e5EaRad1a
x-ms-exchange-antispam-messagedata: NdiRLhbwDtVtbfkXPhYicXrgGa8m0wKAF7gEGuTzzRdaiR9lZviF8bT7EqU7IUNCF+5+sjAmmMJ0XQUBHip1byE9d00aOsRRvl/ERsIq8BkEHkDWuzpJHdeMjvh1xwuEwTX8D8/pE+rtOYy5Fw5haw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <15AD6D65BECCD345A033DCC471A70FFD@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5735f7b0-71fd-46e4-b60a-08d7d251c4b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 13:21:32.9766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fq0vgpRCuIPjOJqUH2fA9FlbpwmGU4JAzhffol7OUJIM5Yuv4NZbCTSnl3qlu8Yl07fQJoDIILPyf2EOGg8tkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7000
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-03-27 10:50:28, Oliver Graute wrote:
> On 27/03/20, Peter Chen wrote:
> > On 20-03-26 18:01:09, Oliver Graute wrote:
> > > Hello,
> > >=20
> > > What is the right way for using the new cdns3-imx glue usb driver on =
a
> > > imx8qm soc with linux-next. I added this snippet in imx8qm.dtsi and
> > > enabled the driver in the kernel configuration.
> > >=20
> >=20
> > Hi Oliver,
> >=20
> > I just checked linux-next-0326, there is no imx8qm dtsi.=20
>=20
> I'am currently using this series on top of linux-next-0214.
>=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.kernel.org%2Fpatch%2F11248331%2F&amp;data=3D02%7C01%7Cpeter.chen%40nxp=
.com%7C1b6963823b924b76684908d7d2344976%7C686ea1d3bc2b4c6fa92cd99c5c301635%=
7C0%7C0%7C637208994318640157&amp;sdata=3DHGG4r65ROTeY54uQArcWTZGT9%2BLrr0kn=
dwmDegULtDw%3D&amp;reserved=3D0
>=20
>=20
> > When I worked this driver, I use a internal version
> > based on v5.4, the dts layout is different with internal tree.
>=20
> I looked also at:
>=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsourc=
e.codeaurora.org%2Fexternal%2Fimx%2Flinux-imx%2Ftree%2Farch%2Farm64%2Fboot%=
2Fdts%2Ffreescale%2Fimx8-ss-conn.dtsi%3Fh%3Dimx_5.4.3_2.0.0&amp;data=3D02%7=
C01%7Cpeter.chen%40nxp.com%7C1b6963823b924b76684908d7d2344976%7C686ea1d3bc2=
b4c6fa92cd99c5c301635%7C0%7C0%7C637208994318640157&amp;sdata=3DyTiMWh5BpWdt=
A%2B8Vy06KeCvg2jPzlgPOmKaM3fmK%2F6w%3D&amp;reserved=3D0
>=20
> How do I adapt the usbotg3 for linux-next? I already ported some usb
> related dependencies from imx8-ss-conn.dtsi. But the cdns3 core driver
> is stucked at probe and currently I don't understand how the cdns3-imx gl=
ue
> layer comes into play.
>=20

cdns3-imx is the parent device, the cdns3 core is the child device. The
example dts like below:

	usb3_lpcg: clock-controller@5b280000 {
		compatible =3D "fsl,imx8qxp-lpcg";
		reg =3D <0x5b280000 0x10000>;
		#clock-cells =3D <1>;
		bit-offset =3D <0 4 16 20 24 28>;
		clocks =3D <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
			 <&conn_ipg_clk>,
			 <&conn_ipg_clk>,
			 <&conn_ipg_clk>,
			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
		clock-output-names =3D "usb3_app_clk",
				     "usb3_lpm_clk",
				     "usb3_ipg_clk",
				     "usb3_core_pclk",
				     "usb3_phy_clk",
				     "usb3_aclk";
		power-domains =3D <&pd IMX_SC_R_USB_2_PHY>;
	};

	usbotg3: usb3@5b110000 {
		compatible =3D "fsl,imx8qm-usb3";
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		ranges;
		reg =3D <0x5B110000 0x10000>;
		clocks =3D <&usb3_lpcg 1>,
			 <&usb3_lpcg 0>,
			 <&usb3_lpcg 5>,
			 <&usb3_lpcg 2>,
			 <&usb3_lpcg 3>;
		clock-names =3D "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
			"usb3_ipg_clk", "usb3_core_pclk";
		assigned-clocks =3D <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
		assigned-clock-rates =3D <125000000>, <12000000>, <250000000>;
		power-domains =3D <&pd IMX_SC_R_USB_2>;
		status =3D "disabled";

		usbotg3_cdns3: cdns3 {
			compatible =3D "cdns,usb3";
			#address-cells =3D <1>;
			#size-cells =3D <1>;
			interrupt-parent =3D <&gic>;
			interrupts =3D <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
			interrupt-names =3D "host", "peripheral", "otg";
			reg =3D <0x5B130000 0x10000>,     /* memory area for HOST registers */
				<0x5B140000 0x10000>,   /* memory area for DEVICE registers */
				<0x5B120000 0x10000>;   /* memory area for OTG/DRD registers */
			reg-names =3D "xhci", "dev", "otg";
			phys =3D <&usb3_phy>;
			phy-names =3D "cdns3,usb3-phy";
			status =3D "disabled";
		};
	};

After kernel boots up, it neither at host mode nor device mode, you
need to echo host or device to role-switch sys entry.

--=20

Thanks,
Peter Chen=
