Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80D4E1A0505
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2020 04:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgDGCqc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 22:46:32 -0400
Received: from mail-eopbgr150087.outbound.protection.outlook.com ([40.107.15.87]:49524
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726312AbgDGCqc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Apr 2020 22:46:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFBVqRTNj8SmuidceifMQiHTaV1QUUc29hBaB+dorQpv1pWLhPY1a1psZWIrg8ysjGK5ITNBz/PLOsjgbF7q5Rtc9itUfjuZIYirv3BxhcaiBco9wqZtc05lILilQJHJwSW01nfsUqxEKrP8fx+ou/rDI2XdnyQPI5ILAicfL+oyMs+R/odTdEvygeOjf7aJfhvYdhlS9f0mwL/o9bf/A5mumnCz3hAe+g9drlz856qjFtzAumz5F/ZISeJi3LVmjlUx/3f2B0A7Dz1TYg6fl07gMsiHYpTQ9EQO4psztNC4bB0qYU0d33Mp8PgqniaYVpeRxAvrTNUh8g/o9S6sPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzv+PRGOdaM2/uoiDkWrYE4f9T2+6CHTX3C8GzAfTVc=;
 b=M2k4EVFXt0qOkswphNKBHz/V5vaN+iW26UDJb4fULi780Mw0NAvO5P32KG1QlXfvVfBK+HFc0XfkxYYRwOnWM0LBfUopX386oQtVhP3qw/Ozj6daUvUUwAOTKO5LdjstPLhpPjDos3pAaeZPnk6+ugCtlAlyV3OcpTe2rMPTQacaQKKa99fp5eR4wPoWMRSvLWaPIs+atOMh5tGwigkfY5O+ccLpzGN1v17YIYfopRR0CAqtu0jUOySu8u55apYtgcAI/tew2RvuPlDwTQ4sq8fIs4nQbLTlRRMrlj97saxjzjMziD6mxvhvQxDGzX2XxNOgXi/Pi+c0IIihV07Mpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzv+PRGOdaM2/uoiDkWrYE4f9T2+6CHTX3C8GzAfTVc=;
 b=em77krqHbMDsjIFleCujK6BVk8fMEGlgJmmsnHw8K1HLSVr8ED7NzTV/fiTFZKr2TdJWODLMLNlhsTchLSZ76og9eikKP9iGsj96owx6VjYAB5XfPNw2V4GjxwbmRgxJWXK2XjiKlGhJ5wSycgNmEkOd6flAvIw5cffv/BmMugA=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7126.eurprd04.prod.outlook.com (2603:10a6:20b:117::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Tue, 7 Apr
 2020 02:46:27 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 02:46:27 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Oliver Graute <oliver.graute@gmail.com>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Oliver Graute <Oliver.Graute@KoCoConnector.com>
Subject: Re: using cdns3-imx driver on imx8qm
Thread-Topic: using cdns3-imx driver on imx8qm
Thread-Index: AQHWA5EMk/twZNx6oE6N7BqRdcYd1qhcJrQAgAAMdACAADsSgIAGWxiAgAABLUCABLoUAIAE1DWAgACtqAA=
Date:   Tue, 7 Apr 2020 02:46:27 +0000
Message-ID: <20200407024650.GA26899@b29397-desktop>
References: <20200326170109.GA28051@optiplex>
 <20200327090554.GA31160@b29397-desktop> <20200327095028.GA19809@ripley>
 <20200327132153.GA31668@b29397-desktop> <20200331142528.GA2246@portage>
 <AM7PR04MB715728ED4EF3715A7798A5A08BC80@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200403144044.GA49880@archlinux.localdomain>
 <20200406162517.GA3320@portage>
In-Reply-To: <20200406162517.GA3320@portage>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3f8f1486-9b9f-4d60-a3f4-08d7da9dde69
x-ms-traffictypediagnostic: AM7PR04MB7126:|AM7PR04MB7126:|AM7PR04MB7126:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB712650C06F2C2F568B91456D8BC30@AM7PR04MB7126.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(7916004)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(54906003)(2906002)(478600001)(8936002)(5660300002)(26005)(91956017)(1076003)(9686003)(6512007)(6486002)(66556008)(66946007)(71200400001)(316002)(186003)(76116006)(66476007)(66446008)(64756008)(6916009)(33716001)(86362001)(8676002)(81156014)(81166006)(53546011)(6506007)(33656002)(4326008)(44832011)(32563001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NiVmEYLog3swXA2O29YV2B4THumHshof53DM2+s7r6/0u1Z3W+6ir6jKDLwkOEopKDV9bRcjqU/iWEvJv8lfbv6IZXSWePvBWdL08gm8S+GnovDiQri9AJz7CM2i6006dRNG8055auTzqKPbrdUfal03+v92ef0IMQMz9SGGP28YYaQEza2dtU0lqwUoeKFF6cjoySc9NjYKXacLIj2KwfgTBA7TXyqKeYkth1HhLQcQ8DoOUGhpfswSRd1XR4K1joTb1XzZypFh01PovIs9Sbm2G+5SzMtwJKpEn/jkVohdhE9DV/rbOUl/nnGVakNWb5rpT+4u7hh+z3F3fPqOVeqjFhSVxv3jxao5qoYsvudALw5yB5GTT7Ef1cJ2gmHrU2tkUr2OWH7UGordl3BmbyjnKmku+8pxHIYnBvoExlTPGh0DFhB57ZlIrP5npjw8GauxsLaUIJnQvgczzL+PjhXJ1fU2rnQwI44IZpPY7pA=
x-ms-exchange-antispam-messagedata: 3XuKUhY4pSFuFM5LbOPiB1Mz/IiyQTQ4Tec71KNh+03iGR4SMc6eVFm6g+2FdNtXM1t3LQUAn6OSn6GOqABM/4BME0TaIcwHPS20C1nid/1K/0rbBQ6PAFR82jzMChX/DzNwkdhPeV5c+5pZClkmEg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9220884C60FD5543A027FF44C430B1D1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8f1486-9b9f-4d60-a3f4-08d7da9dde69
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 02:46:27.1554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EYP6UDcFI+9cd3iz+LQsaUQGv8PvDinKiCq0zZHPutpSZUGidf9zXynRGfuJIdA47tTagTNMMKj7m0iIZXJ2Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7126
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-04-06 18:25:17, Oliver Graute wrote:
> On 03/04/20, Oliver Graute wrote:
> > On 31/03/20, Peter Chen wrote:
> > >  =20
> > > > > 		compatible =3D "fsl,imx8qxp-lpcg";
> > > > > 		reg =3D <0x5b280000 0x10000>;
> > > > > 		#clock-cells =3D <1>;
> > > > > 		bit-offset =3D <0 4 16 20 24 28>;
> > > > > 		clocks =3D <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
> > > > > 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> > > > > 			 <&conn_ipg_clk>,
> > > > > 			 <&conn_ipg_clk>,
> > > > > 			 <&conn_ipg_clk>,
> > > > > 			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> > > > > 		clock-output-names =3D "usb3_app_clk",
> > > > > 				     "usb3_lpm_clk",
> > > > > 				     "usb3_ipg_clk",
> > > > > 				     "usb3_core_pclk",
> > > > > 				     "usb3_phy_clk",
> > > > > 				     "usb3_aclk";
> > > > > 		power-domains =3D <&pd IMX_SC_R_USB_2_PHY>;
> > > > > 	};
> > > > >
> > > > > 	usbotg3: usb3@5b110000 {
> > > > > 		compatible =3D "fsl,imx8qm-usb3";
> > > > > 		#address-cells =3D <1>;
> > > > > 		#size-cells =3D <1>;
> > > > > 		ranges;
> > > > > 		reg =3D <0x5B110000 0x10000>;
> > > > > 		clocks =3D <&usb3_lpcg 1>,
> > > > > 			 <&usb3_lpcg 0>,
> > > > > 			 <&usb3_lpcg 5>,
> > > > > 			 <&usb3_lpcg 2>,
> > > > > 			 <&usb3_lpcg 3>;
> > > > > 		clock-names =3D "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
> > > > > 			"usb3_ipg_clk", "usb3_core_pclk";
> > > > > 		assigned-clocks =3D <&clk IMX_SC_R_USB_2
> > > > IMX_SC_PM_CLK_PER>,
> > > > > 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
> > > > > 			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> > > > > 		assigned-clock-rates =3D <125000000>, <12000000>, <250000000>;
> > > > > 		power-domains =3D <&pd IMX_SC_R_USB_2>;
> > > > > 		status =3D "disabled";
> > > > >
> > > > > 		usbotg3_cdns3: cdns3 {
> > > > > 			compatible =3D "cdns,usb3";
> > > > > 			#address-cells =3D <1>;
> > > > > 			#size-cells =3D <1>;
> > > > > 			interrupt-parent =3D <&gic>;
> > > > > 			interrupts =3D <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> > > > > 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> > > > > 					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
> > > > > 			interrupt-names =3D "host", "peripheral", "otg";
> > > > > 			reg =3D <0x5B130000 0x10000>,     /* memory area for HOST
> > > > registers */
> > > > > 				<0x5B140000 0x10000>,   /* memory area for
> > > > DEVICE registers */
> > > > > 				<0x5B120000 0x10000>;   /* memory area for
> > > > OTG/DRD registers */
> > > > > 			reg-names =3D "xhci", "dev", "otg";
> > > > > 			phys =3D <&usb3_phy>;
> > > > > 			phy-names =3D "cdns3,usb3-phy";
> > > > > 			status =3D "disabled";
> > > > > 		};
> > > > > 	};
> > > >=20
> > > > Hello Peter,
> > > >=20
> > > > thx for the dts example. Now I get "wait clkvld timeout" in "cdns_i=
mx_noncore_init()"
> > > > So USB3_SSPHY_STATUS register seems to be wrong.
> > > >=20
> > > > dmesg | grep imx
> > > > [    1.065445] cdns3-imx 5b110000.usb3: Adding to iommu group 0
> > > > [    1.257309] imx-scu scu: NXP i.MX SCU Initialized
> > > > [    1.275489] imx-scu-clk: probe of gpt0_clk failed with error -5
> > > > [    1.291143] imx-scu-clk: probe of pwm_clk failed with error -22
> > > > [    1.302517] imx-scu-clk: probe of lcd_clk failed with error -22
> > > > [    1.341405] imx8qm-pinctrl scu:pinctrl: initialized IMX pinctrl =
driver
> > > > [    3.029484] cdns3-imx 5b110000.usb3: wait clkvld timeout
> > > > [    3.034891] cdns3-imx: probe of 5b110000.usb3 failed with error =
-110
> > > > [    3.237393] sdhci-esdhc-imx 5b030000.mmc: Got CD GPIO
> > > > [    3.242468] sdhci-esdhc-imx 5b030000.mmc: Got WP GPIO
> > > > [    3.316687] imx8qxp-lpcg-clk 5a4a0000.clock-controller: ignoring=
 dependency for
> > > > device, assuming no driver
> > > >=20
> > > =20
> > > Make sure the five clocks in dts are correct, and print the USB3_SSPH=
Y_STATUS if
> > > timeout still exists.
> >=20
> > ok thx, we got it fixed by replacing:
> >=20
> >  clocks =3D <&usb3_lpcg 1>,
> >           <&usb3_lpcg 0>,
> >           <&usb3_lpcg 4>,
> >           <&usb3_lpcg 2>,
> >           <&usb3_lpcg 3>;
> >=20
> > with this:
> > =20
> >  clocks =3D <&usb3_lpcg IMX_LPCG_CLK_1>,
> >           <&usb3_lpcg IMX_LPCG_CLK_0>,
> >           <&usb3_lpcg IMX_LPCG_CLK_7>,
> >           <&usb3_lpcg IMX_LPCG_CLK_4>,
> >           <&usb3_lpcg IMX_LPCG_CLK_5>;
> >=20
> > now the "wait clkvld timeout" is gone and the USB3_SSPHY_STATUS registe=
r
> > is very similar to another imx8qm device which runs linux-imx from NXP.
> >=20
> > Now I try to get into USB HOST mode:
> >=20
> > --- a/drivers/usb/cdns3/cdns3-imx.c
> > +++ b/drivers/usb/cdns3/cdns3-imx.c
> > @@ -113,11 +115,11 @@ static int cdns_imx_noncore_init(struct cdns_imx =
*data)
> >         udelay(1);
> >=20
> >         value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
> > -       value =3D (value & ~MODE_STRAP_MASK) | OTG_MODE | OC_DISABLE;
> > +       value =3D (value & ~MODE_STRAP_MASK) | HOST_MODE | OC_DISABLE;
> >         cdns_imx_writel(data, USB3_CORE_CTRL1, value);
> >=20
> > Is this change necessary?

No

> >=20
> > Do I need special changes on xhci.c do get it work with cdns-imx in hos=
t mode?
> >=20

No

> > I'am stuck at:
> >=20
> > [   16.697525] xhci-hcd xhci-hcd.0.auto: can't setup: -110
>=20
> A bit more debug information:
>=20
> [    5.988571] cdns-usb3 5b130000.cdns3: DRD version v0 (00000100)
> [    6.012664] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> [    6.018173] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned=
 bus number 1
> [    6.036369] xhci-hcd xhci-hcd.0.auto: // Halt the HC
> [    6.041335] xhci-hcd xhci-hcd.0.auto: Resetting HCD
> [    6.056364] xhci-hcd xhci-hcd.0.auto: // Reset the HC
> [   16.062450] xhci-hcd xhci-hcd.0.auto: can't setup: -110
> [   16.067686] xhci-hcd xhci-hcd.0.auto: USB bus 1 deregistered
> [   16.073361] xhci-hcd: probe of xhci-hcd.0.auto failed with error -110
>=20

set dr_mode =3D "otg" at dts, and after boot up, run below commands at
console:

echo host > /sys/class/usb_role/5b130000.cdns3-role-switch/role

--=20

Thanks,
Peter Chen=
