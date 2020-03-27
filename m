Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC10195385
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 10:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgC0JFi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 05:05:38 -0400
Received: from mail-vi1eur05on2061.outbound.protection.outlook.com ([40.107.21.61]:6221
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725956AbgC0JFi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Mar 2020 05:05:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jq5zc1qFMHeCy0NBIaEMPWZeWJyx9ALZdjaibpoYlqax7ZMayHXXN6XdU7PTbuIILL5Pbh9FiYTzlF/VeO34f1g+YPhdPImcuJ96zKZoL5dbGxIL8RXTuPyNt7Bff54W8GhB9aDdVOYx/GQihQg5ItCzDr27i4LhhKPsEzAp3EBBHSkTsnREVZXIzZx1Qd+YiqApmOayRG+xP2s+s5sDleXdP1NnXmGVDVvEMxQDCceP4xw0rMVpkDnVIPpN/5F4ZXjB05xjdvFM/iVsFGcYgJpE8G0kA/Eqf8B65s6jxOoGePrHC91yY1Zl0j5diUJE0RSPN3W2B5FW/Ey4Xz4tjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6xjeY3c63UALFSpRqRjlpBARVb9Aci+NZYFgjfT750=;
 b=f/lP4wslv6j+9hKw8/Royq1k+R3K5WD5Iqtm2A3Yg/+Z/FXaEFWbcYWV+FwovyQjKAPhhcJDrTfoDDJ5rG9o3ehx4qI6/4yNYgkd6R/fHhjXQI/+j8FFEzMLH7muifi5o3l99h2rnHab5WRmb26DB0bhTBKlDMlfmi84m3yt4SLYG7kZfrJ1gUNuEpni8qmBPjXwRfOTAsYr8OOj2iEt0f7/fvgEy3nzJtDMrQOLPdhBlTyWAJB6FlFQP4nCnA6hqAsVD6NZGDDvV8ZmmzBD6vc82MdlQBkFHuJm+bQhL1Wc3aW1yZLdo2aU8Wrl7D3I5+7csNf65w47apCx1e1dEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6xjeY3c63UALFSpRqRjlpBARVb9Aci+NZYFgjfT750=;
 b=NWSFjWb0tx4lcpX6fJpWlBdpNJlSf9AuVJfXHI4l22zsiC3r8HC6Ob9YgXfzgpRSnfgpsPBtLwrW24tJ4V4cqCV8wIgIaX2o7PGzAskbc86ghXFnOwX4pCO050iX9+ki875ws3RRwBIssjX97Z1EIvkii2d5HkBagdW+hYnCXW0=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6901.eurprd04.prod.outlook.com (10.141.173.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.18; Fri, 27 Mar 2020 09:05:33 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 09:05:33 +0000
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
Thread-Index: AQHWA5EMk/twZNx6oE6N7BqRdcYd1qhcJrQA
Date:   Fri, 27 Mar 2020 09:05:33 +0000
Message-ID: <20200327090554.GA31160@b29397-desktop>
References: <20200326170109.GA28051@optiplex>
In-Reply-To: <20200326170109.GA28051@optiplex>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 42b26151-7754-44a0-f73f-08d7d22e01d7
x-ms-traffictypediagnostic: AM7PR04MB6901:|AM7PR04MB6901:|AM7PR04MB6901:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB690134BC1EDF38BE59A241FC8BCC0@AM7PR04MB6901.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(7916004)(376002)(39860400002)(346002)(366004)(136003)(396003)(9686003)(4326008)(6506007)(2906002)(33716001)(53546011)(71200400001)(33656002)(86362001)(1076003)(66556008)(66476007)(81156014)(26005)(64756008)(6486002)(6916009)(6512007)(91956017)(76116006)(66446008)(8936002)(316002)(66946007)(81166006)(8676002)(966005)(54906003)(478600001)(186003)(44832011)(5660300002)(32563001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cuc5AjZBDrF4DSC+Hbc+yNUt/tD909456WtHvFVEwZ2FJyBkdrSVnLuj8uxY8OEVlV7VJpzr85X+3blOp/YsBQKaMrXpdPPmQsGU1BhSyJ5MMQVnGV4jLpOwSMz72dI711KJQHZnSRc8VgitrF7SMF3Td8uDfbZTHVQLGGFfk8yyJ2z5bI/aFvkK3Fa8WraXU4wYRiS2uHQxdOxW12hbAzuNKZjMOYVlIKtqvLPir5fmxgGmFXtogFQT7ZI2+DdZI6QfF4Z9rPR5U3UZCfhYH8/Vfna+YXlEBa3VPGt5fgUL40J64f1s7ZzMH9MJCH5t8TiWJ0RfajXGEdqj4BpgOCU2vYuo2qQJHPYqyv6cGLeSWsutONKf3mk2nWng8tYfggDNDf4aVW/F/JFpSLXj4DBTtGUbGpNhPbwHAZSm26oF5j7AoFsLODfWKiDs445S5D/8aQMeUhx55NSmwPcMDuSJwJK9O0H9LosfLxHuzMzfAO2nJU7yDaQ6ShoXBK6VAovifipD+OgWdi6QuSXiwmQ3OQS4JFRIFYnEQmQqrYSdYCE1x3+rUMWqgSntuvY8
x-ms-exchange-antispam-messagedata: CllerE05O6jpWjWeCfyRte1nnejRekrWCcewn8rDDCNzjP7ucUzjuaHTkjq+Vl7gDei+h7siSwBTlOnSohUkUiX40IYkeMwT1wuTKkILZTioHT26JaRauSbt02vyl8Bo+JhfjwtxsBDTFsrmhumcOQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2CB58761D6A49541A335D20739E27812@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b26151-7754-44a0-f73f-08d7d22e01d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 09:05:33.6358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dyD9VwXzcPeQ4iWpn683Qy/cABIBznm1G/4tnhVZ9EXm2Aixcopk4CQ9pFkUOQcRhGpLO8w3kJNwrdjxDXAHpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6901
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-03-26 18:01:09, Oliver Graute wrote:
> Hello,
>=20
> What is the right way for using the new cdns3-imx glue usb driver on a
> imx8qm soc with linux-next. I added this snippet in imx8qm.dtsi and
> enabled the driver in the kernel configuration.
>=20

Hi Oliver,

I just checked linux-next-0326, there is no imx8qm dtsi.=20
When I worked this driver, I use a internal version
based on v5.4, the dts layout is different with internal tree.

Besides, you need a PHY driver for upstream version:
https://patchwork.kernel.org/patch/11454581/

Peter

> usbotg3: usb3@5b110000 {
> 		compatible =3D "cdns,usb3";
> 		reg =3D <0x0 0x5B110000 0x0 0x10000>,
> 			<0x0 0x5B130000 0x0 0x10000>,
> 			<0x0 0x5B140000 0x0 0x10000>,
> 			<0x0 0x5B160000 0x0 0x40000>,
> 			<0x0 0x5B120000 0x0 0x10000>;
> 		interrupt-parent =3D <&gic>;
> 		interrupts =3D <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
> 		clocks =3D <&usb3_lpcg 1>,
> 			 <&usb3_lpcg 0>,
> 			 <&usb3_lpcg 5>,
> 			 <&usb3_lpcg 2>,
> 			 <&usb3_lpcg 3>;
> 		clock-names =3D "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
> 			"usb3_ipg_clk", "usb3_core_pclk";
> 		assigned-clocks =3D <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
> 				  <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> 				  <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> 		assigned-clock-rates =3D <125000000>, <12000000>, <250000000>;
> 		power-domains =3D <&pd IMX_SC_R_USB_2>;
> 		cdns3,usbphy =3D <&usb3phynop1>;
> 		status =3D "disabled";
> 	};
>=20
> In board dts I enabled this:
>=20
> &usbotg3 {
> 	dr_mode =3D "host";
> 	status =3D "okay";
> };
>=20
>=20
> On probing I got:
>=20
> [    2.932089] cdns-usb3 5b110000.usb3: missing host IRQ
>=20
> I also tried to enable "fsl,imx8qm-usb3" compatible buts this results
> directly into a crash.
>=20
> What do I miss here? some comments would be helpful.
>=20
> Best Regards,
>=20
> Oliver

--=20

Thanks,
Peter Chen=
