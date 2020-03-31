Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08BB71998B4
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 16:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730686AbgCaOjM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 10:39:12 -0400
Received: from mail-eopbgr60071.outbound.protection.outlook.com ([40.107.6.71]:42318
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726194AbgCaOjM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Mar 2020 10:39:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CS/rmVOI7f1rdEu8SmAgZqkXFTtN8Ypbp9ebpWByAkvLVdpY7EfhL9xzpoaHkRYt9qnJNxZ7lQnmCehy+QbBIWkK+qVRHmAVqrIKBMtYLgaDQByawLOKoWhomX05ozNdGREctPk1MEEHwemhnUpSDIVfa2R42Pt3Ej1Kp3h2SKk+djFRrCh98bQaaSY84Kd3ZIyQQFuwnr+LYjG3rf0i2fouKURRf1Fk1mmaFbrWzHzYu39RCjeuDFQN7ijHIwwzQ+iso+A1MsQkm1Ki5FyxDEYIjYCG5oj8f5mrhs0x1ndkrWLQqXBLy3g5Do+5NN0OXL0OR+3INsjumRkhj+NemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F76xeFQw7fex1hL0GNDE0vkMeBOTC98FTDjs3dYGXQ=;
 b=L6s6WoyLaeF+CDpfI+mbYRr6tstl9b7aJ9+Evkw+Im5vh9qaf9fsFYIUsobvMoam/lOe3syKfLbTs6VwqHI8/kok6hLj7H70ht3Idr+b2Rc8gzYOvVul11GNxKyqOQl7hXS1AewxWU4TY1QKuEYhCS/qeWZSW/ymzk4IL+k0InndETaIsrHdrNf8PZR9D+hT0DUS/bEHPxcS/Z6HHGfiB8wRQ9lJy0mYFHPOpwg+tRjoO43WrTvJeNSpDNDnHunW8MmGsLMpAr56ifebDpo3rtCaWLsIwcY+Q6WlIOCh+VyGp5tPxpelm+zdOkOgUXmWa4jYvZRhfEG1azfERvNoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F76xeFQw7fex1hL0GNDE0vkMeBOTC98FTDjs3dYGXQ=;
 b=OtGXAg88QxVsmd35UiMacOC5VyTxhKHQ9RpsqG3+FCx9IVbZkVXVY3IW5dTxHwOLin7szrm8FHZ1dYHjQyMwMfGP0HyDJVwPS2kRzft2pFUHOiK+9i47jr7fnLzl46l3VhN0t4foUKdEQ+h/COGdy+0RLfWujh8V3uGydUCsLAE=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6903.eurprd04.prod.outlook.com (10.141.174.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Tue, 31 Mar 2020 14:39:03 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 14:39:03 +0000
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
Subject: RE: using cdns3-imx driver on imx8qm
Thread-Topic: using cdns3-imx driver on imx8qm
Thread-Index: AQHWA5EMk/twZNx6oE6N7BqRdcYd1qhcJrQAgAAMdACAADsSgIAGWxiAgAABLUA=
Date:   Tue, 31 Mar 2020 14:39:03 +0000
Message-ID: <AM7PR04MB715728ED4EF3715A7798A5A08BC80@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200326170109.GA28051@optiplex>
 <20200327090554.GA31160@b29397-desktop> <20200327095028.GA19809@ripley>
 <20200327132153.GA31668@b29397-desktop> <20200331142528.GA2246@portage>
In-Reply-To: <20200331142528.GA2246@portage>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [180.171.74.255]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d5bccfd9-dd4c-4bac-b60b-08d7d5814269
x-ms-traffictypediagnostic: AM7PR04MB6903:|AM7PR04MB6903:|AM7PR04MB6903:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6903161FF100870D0C4851AA8BC80@AM7PR04MB6903.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(186003)(5660300002)(52536014)(7696005)(76116006)(44832011)(66946007)(6506007)(2906002)(4326008)(33656002)(26005)(8936002)(86362001)(81156014)(478600001)(316002)(71200400001)(81166006)(8676002)(9686003)(66556008)(54906003)(66476007)(55016002)(66446008)(6916009)(64756008)(32563001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 74lOSLKaT1uvWJzvRnjFGj331njbVKCLUs3F066cPbSm1w7lqUJY+3OFTRPxwK/4HuxkA2/y4dV40nDAQFRJd+BsNC6IlQ7EfgWiPe80+2i61K1+es5qlOBqG/XaywBhKo1bdVS37OPdcxtj1rpiwjz72eqgIOMMmYgsYpi53Jd8wgVq79OVW3Z5+nhtx3hrgwHhbfA2aslxHS1rkNSKwYr4epDoYuSrstk7GS7hDyLb1crfDkXJLjyyFVtkeQdwYplWadS+CvKplhPRRsW09YtSCPE1gJHZyFoe3yhszAC71ccmI+3ZYgVVNNghXy5qf9g/E+AJCGp3b1NBpNkmblqlIATawqJ1QHBWVO1bC1AXyj/hbncQkiAmEFVixclUuDs10/l4sHnBEeHYm/Gc5+SRo/f3TtGu5XwDi+XRotSppbX9SLh4h2OPWqqtqLkLSr9m3YoJK64NqIhf29USk3+rbtRuMGMQcRte/nHvsOhu+bL3XLhaHbMjgNkGn9cY
x-ms-exchange-antispam-messagedata: 5L0MooGHDoTp32hk1Jbx1Lh6YmxR6xRX9x5q2k5Wkb1avYsJV8E6Ok4A70ngNmJrfpq1RRsEC/GkaE840JBh/I21al5SGPQItKcj9yQMY3Vxh1nLq+gItZOK9dZH7aT6IqttQvwViK+uFvLSJsAF6Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bccfd9-dd4c-4bac-b60b-08d7d5814269
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 14:39:03.6741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5VCkQAcnBSARmc/aUCmubpFoI2yfEZFZooJB0vetCg9EFWMS0Z9Xkizl1K1sFA++wg9rvoMItoVRZzscyNepPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6903
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

 =20
> > 		compatible =3D "fsl,imx8qxp-lpcg";
> > 		reg =3D <0x5b280000 0x10000>;
> > 		#clock-cells =3D <1>;
> > 		bit-offset =3D <0 4 16 20 24 28>;
> > 		clocks =3D <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
> > 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> > 			 <&conn_ipg_clk>,
> > 			 <&conn_ipg_clk>,
> > 			 <&conn_ipg_clk>,
> > 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> > 		clock-output-names =3D "usb3_app_clk",
> > 				     "usb3_lpm_clk",
> > 				     "usb3_ipg_clk",
> > 				     "usb3_core_pclk",
> > 				     "usb3_phy_clk",
> > 				     "usb3_aclk";
> > 		power-domains =3D <&pd IMX_SC_R_USB_2_PHY>;
> > 	};
> >
> > 	usbotg3: usb3@5b110000 {
> > 		compatible =3D "fsl,imx8qm-usb3";
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <1>;
> > 		ranges;
> > 		reg =3D <0x5B110000 0x10000>;
> > 		clocks =3D <&usb3_lpcg 1>,
> > 			 <&usb3_lpcg 0>,
> > 			 <&usb3_lpcg 5>,
> > 			 <&usb3_lpcg 2>,
> > 			 <&usb3_lpcg 3>;
> > 		clock-names =3D "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
> > 			"usb3_ipg_clk", "usb3_core_pclk";
> > 		assigned-clocks =3D <&clk IMX_SC_R_USB_2
> IMX_SC_PM_CLK_PER>,
> > 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> > 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> > 		assigned-clock-rates =3D <125000000>, <12000000>, <250000000>;
> > 		power-domains =3D <&pd IMX_SC_R_USB_2>;
> > 		status =3D "disabled";
> >
> > 		usbotg3_cdns3: cdns3 {
> > 			compatible =3D "cdns,usb3";
> > 			#address-cells =3D <1>;
> > 			#size-cells =3D <1>;
> > 			interrupt-parent =3D <&gic>;
> > 			interrupts =3D <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> > 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> > 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
> > 			interrupt-names =3D "host", "peripheral", "otg";
> > 			reg =3D <0x5B130000 0x10000>,     /* memory area for HOST
> registers */
> > 				<0x5B140000 0x10000>,   /* memory area for
> DEVICE registers */
> > 				<0x5B120000 0x10000>;   /* memory area for
> OTG/DRD registers */
> > 			reg-names =3D "xhci", "dev", "otg";
> > 			phys =3D <&usb3_phy>;
> > 			phy-names =3D "cdns3,usb3-phy";
> > 			status =3D "disabled";
> > 		};
> > 	};
>=20
> Hello Peter,
>=20
> thx for the dts example. Now I get "wait clkvld timeout" in "cdns_imx_non=
core_init()"
> So USB3_SSPHY_STATUS register seems to be wrong.
>=20
> dmesg | grep imx
> [    1.065445] cdns3-imx 5b110000.usb3: Adding to iommu group 0
> [    1.257309] imx-scu scu: NXP i.MX SCU Initialized
> [    1.275489] imx-scu-clk: probe of gpt0_clk failed with error -5
> [    1.291143] imx-scu-clk: probe of pwm_clk failed with error -22
> [    1.302517] imx-scu-clk: probe of lcd_clk failed with error -22
> [    1.341405] imx8qm-pinctrl scu:pinctrl: initialized IMX pinctrl driver
> [    3.029484] cdns3-imx 5b110000.usb3: wait clkvld timeout
> [    3.034891] cdns3-imx: probe of 5b110000.usb3 failed with error -110
> [    3.237393] sdhci-esdhc-imx 5b030000.mmc: Got CD GPIO
> [    3.242468] sdhci-esdhc-imx 5b030000.mmc: Got WP GPIO
> [    3.316687] imx8qxp-lpcg-clk 5a4a0000.clock-controller: ignoring depen=
dency for
> device, assuming no driver
>=20
=20
Make sure the five clocks in dts are correct, and print the USB3_SSPHY_STAT=
US if
timeout still exists.

Peter
