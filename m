Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E47E719B9BF
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 03:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732560AbgDBBQw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 21:16:52 -0400
Received: from mail-eopbgr40060.outbound.protection.outlook.com ([40.107.4.60]:60800
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732435AbgDBBQw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Apr 2020 21:16:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ83H8IgwEYvJ1vnvFMooDFeawA+5Ipm8OcW1sOUPkjYjY+WAIZ9EL8cAPkebofIA7vfjfeBZRvobXtSXI0MXg4G3z77PBiSQHoDlUtv01gHvAEAvw1MdfZeQT4vshp8DFUexSRqt9a7H7PlnXTk5BCAk6qUzMkSM/Gd1GWz8/HIRF3o3evs8XBCwBoInG+p0ub28yn1C3qtvK5/IFDtEA3K5VQfgNkVNcpbyCTEk3659Ar0mrhY36N8/x/+96OmEYAc03MBk6Z+abAdpoPOh0/JebQ8p3DQeWtt0thshll254ZcDVX5XSXRwbax8JuZR4pqTrqXmTOSHx7GmZghIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6m1Wq3h7sqdORqJIIJxFkueOyJMDeRN17IpERGIyBJs=;
 b=abdkKQzlezstz9jHX4vKaVIM7CLRoCOaPBJqon7C6eCYsqP7LdSNB06Wqu+mocnZv2dvnm19fHCh1I4N3sec0LonhNHlhqqJQEJbdcO6rYiKquksIITEpzYYwhtr5aleR3n58DYtExpBgwMKCGFEgdbgtPfjVG7hYcTkwHrIvRk2QDQRVYdzVJxbTew7ODvLM2OnYLZ0wA7aTVoVzXHrcmeBnaVwJBPzk9iOB479+1v4VgwafGwBvd8Zq5tTiCiVgn82oNqTyApC7Ib6XRk/wQrlOt0FVqNB6lgvA4R2rdI+/WO4OjA6NHW/co7yvDKEF0z+JpJS0IPhYsVLH3RxbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6m1Wq3h7sqdORqJIIJxFkueOyJMDeRN17IpERGIyBJs=;
 b=HtV0EA77eK0hQRI2PPy/VpagqhYoAl10Lvs8jQlCpfdd+MDfU84XxEf15e1zoH1ScIiFyiUlmn9tlIM8nnvUirzmRWyof/PMbMZd1GNC//lgqJQlQFLwpJhBoeztqqmP0gWiON7Oi5U6Cv9BdprnSq/5yTLnZ9SUu7+0UK+WACw=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (52.135.62.205) by
 DB8PR04MB6937.eurprd04.prod.outlook.com (52.133.240.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.16; Thu, 2 Apr 2020 01:16:48 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::754a:fd16:5d9:2512]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::754a:fd16:5d9:2512%6]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 01:16:48 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Oliver Graute <Oliver.Graute@KoCoConnector.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "oliver.graute@gmail.com" <oliver.graute@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: using cdns3-imx driver on imx8qm
Thread-Topic: using cdns3-imx driver on imx8qm
Thread-Index: AQHWA5EMk/twZNx6oE6N7BqRdcYd1qhcJrQAgAAMdACAADsSgIAGWxiAgAABLUCAAVCjAIAA9pkA
Date:   Thu, 2 Apr 2020 01:16:47 +0000
Message-ID: <20200402011710.GA6295@b29397-desktop>
References: <20200326170109.GA28051@optiplex>
 <20200327090554.GA31160@b29397-desktop> <20200327095028.GA19809@ripley>
 <20200327132153.GA31668@b29397-desktop> <20200331142528.GA2246@portage>
 <AM7PR04MB715728ED4EF3715A7798A5A08BC80@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200401103434.GA38169@archlinux.localdomain>
In-Reply-To: <20200401103434.GA38169@archlinux.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aa13e45f-dcb8-4857-43dd-08d7d6a3843d
x-ms-traffictypediagnostic: DB8PR04MB6937:|DB8PR04MB6937:|DB8PR04MB6937:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6937E94789E9EF438CF514B78BC60@DB8PR04MB6937.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(7916004)(346002)(39860400002)(376002)(366004)(396003)(136003)(316002)(6512007)(44832011)(1076003)(66556008)(66476007)(64756008)(66446008)(91956017)(76116006)(6486002)(66946007)(71200400001)(4326008)(6506007)(53546011)(8936002)(54906003)(8676002)(81156014)(81166006)(9686003)(26005)(6916009)(5660300002)(966005)(186003)(33656002)(478600001)(45080400002)(33716001)(2906002)(86362001)(32563001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hNJvmOD19q6looqZvWAksO+a2Bh6Wi/mtWiREOoSCXVbMHL7OXvfyulzzX7CiuGMlUyL73RLp4ORTI/O4EMVhz/VgXFO7qIAwVBA2LVRTwvCUnek3QaENnOB+9b6wPX2ewULKFPmOSJygoYRnmaw8iDcbAjCsXWh0CEnxsa4UhZ9bTiOpZvf479AlZjylkCzb1C7V822mgjAni/8rKGp2vw5TXIZdva1R7mZN10Gx+IqQajoOTaNjg9lJrTMVpTRqL8w72rY2zdXb1RSdwEvvsXoL3UnSsbWHxIe3jTTBbylxAncdFa5VrRY53sSkh1RtezhSpdD1zNbHrjMinUuataFzhZn3eE3AI1Zp82v3vI79r19sXHZSMi1DuxQT96K0QnJlM3z9P3l5D7x1qg1LIGSpdua/X8unTmvIU9d+Ti4r0dJakjxLRf6SoOncm6r3f51YMfgTzor5hMoqwB55tGqma7TCpK9w233Zpv7YvvsLSr4RRNGxv0kerqKN1TO7navry+eTJCkXEGyGSxEWahaztSLDFe/q+Dwdj4487+8ZowgSuWB8ZHFT2M4rV/8
x-ms-exchange-antispam-messagedata: 5pNM3NGNJKAWCDCqRn7v4ybDlbZHAQGH1zJR1NbpEKbqCFTloDKh9c+GyGOrbrhxT9NKKoB9FcR5cpX2ap92Zdy/saeTGRLJmtSHHv99cmwI5h+PbVu2s6VaRueWggnSNNtKQjFAHX46/tS1fWNLYg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <83B063A832208E4AB8A715D523E19EB2@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa13e45f-dcb8-4857-43dd-08d7d6a3843d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 01:16:48.1421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2D+Z/VP41UBZKAwq1hbxJ/qZ2wihT7dFsUs8EUkf103AkKmis9uNUlXBSyimf+HPclA0y7Sa2Y24+JhebZOSww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6937
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-04-01 12:34:34, Oliver Graute wrote:
> > Make sure the five clocks in dts are correct, and print the USB3_SSPHY_=
STATUS if
> > timeout still exists.
>=20
> ok I got this for USB3_SSPHY_STATUS
>=20
> [    3.057122] cdns3-imx 5b110000.usb3: wait clkvld timeout 0xb0b03827
>=20

It indicates usb3_aclk did not open correctly. Tried to see if u-boot
could work well, and see if set its assigned-clock-rates as 500000000
could work.

Peter


> Unfortunally my imx8qm spec is incomplete regarding the USB3_SSPHY_STATUS=
 register.
>=20
> this are my related DTS nodes:
>=20
> 	usb3_lpcg: clock-controller@5b280000 {
> 		compatible =3D "fsl,imx8qxp-lpcg";
> 		reg =3D <0x5b280000 0x10000>;
> 		#clock-cells =3D <1>;
> 		/* bit-offset =3D <0 4 16 20 24 28>; */
> 		clock-indices =3D <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>,
> 				<IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>,
> 				<IMX_LPCG_CLK_6>, <IMX_LPCG_CLK_7>;
> 		clocks =3D <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
> 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> 			 <&conn_ipg_clk>,
> 			 <&conn_ipg_clk>,
> 			 <&conn_ipg_clk>,
> 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> 		clock-output-names =3D "usb3_app_clk",
> 				     "usb3_lpm_clk",
> 				     "usb3_ipg_clk",
> 				     "usb3_core_pclk",
> 				     "usb3_phy_clk",
> 				     "usb3_aclk";
> 		power-domains =3D <&pd IMX_SC_R_USB_2_PHY>;
> 	};
>=20
> 	usbotg3: usb3@5b110000 {
> 		compatible =3D "fsl,imx8qm-usb3";
> 		#address-cells =3D <1>;
> 		#size-cells =3D <1>;
> 		/* ranges; */
> 		reg =3D <0x0 0x5B110000 0x0 0x10000>;
> 		clocks =3D <&usb3_lpcg 1>,
> 			 <&usb3_lpcg 0>,
> 			 <&usb3_lpcg 5>,
> 			 <&usb3_lpcg 2>,
> 			 <&usb3_lpcg 3>;
> 		clock-names =3D "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
> 			"usb3_ipg_clk", "usb3_core_pclk";
> 		assigned-clocks =3D <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
> 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> 		assigned-clock-rates =3D <125000000>, <12000000>, <250000000>;
> 		power-domains =3D <&pd IMX_SC_R_USB_2>;
> 		status =3D "disabled";
>=20
> 		usbotg3_cdns3: cdns3 {
> 			compatible =3D "cdns,usb3";
> 			#address-cells =3D <1>;
> 			#size-cells =3D <1>;
> 			interrupt-parent =3D <&gic>;
> 			interrupts =3D <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
> 			interrupt-names =3D "host", "peripheral", "otg";
> 			reg =3D <0x5B130000 0x10000>,     /* memory area for HOST registers */
> 				<0x5B140000 0x10000>,   /* memory area for DEVICE registers */
> 				<0x5B120000 0x10000>;   /* memory area for OTG/DRD registers */
> 			reg-names =3D "xhci", "dev", "otg";
> 			phys =3D <&usbphynop2>;
> 			phy-names =3D "cdns3,usb2-phy";
> 			status =3D "disabled";
> 		};
> 	};
>=20
> I'am also using the SCU related clock patches from here:=20
>=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.kernel.org%2Fpatch%2F11248255%2F&amp;data=3D02%7C01%7Cpeter.chen%40nxp=
.com%7Ce6d163e72ed14b064f4208d7d629842f%7C686ea1d3bc2b4c6fa92cd99c5c301635%=
7C0%7C1%7C637213346107862080&amp;sdata=3DChqqxYqxdJysskHzHP1dmF69zGVzw4PfDz=
%2Fim%2F0khHc%3D&amp;reserved=3D0
>=20
> Thx for your comments,
>=20
> Best regards,
>=20
> Oliver

--=20

Thanks,
Peter Chen=
