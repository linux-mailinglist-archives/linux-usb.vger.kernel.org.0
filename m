Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC5E19A9C3
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 12:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730574AbgDAKnd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 06:43:33 -0400
Received: from mail-eopbgr130070.outbound.protection.outlook.com ([40.107.13.70]:62222
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726974AbgDAKnc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Apr 2020 06:43:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=On8KcrYcXC4kkweeWki6V7frNCFqD+2tfEz5zUUU6Y+Pssue6fQbk1vQ/BUA0UhvSgTGc2rt/Op6l8fvB00is7gICG0rWAAnU0Pd8oyQZOY7IvR5PgwVrRAkneYwJlE8AkJwd9VvXpWkqXa6eKaALP/uQcy0TKxr0nvbjQhmW22Twr7xK7+rIPDeD3Lb2HgfdrtJgRcqGE+oDzqs99Ko4e/h4babXyxFakFwcAHZpmoHffpiIKqAjKU8diO8tzJnIMOLtiEOtIxyaC5luXwoS3J3m7lJOrdqrJ4WmbXjR6DJ+yID72JhwL4wZMbggHK8lFw0W/5yAPXWBHlg/+vKhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d775G8gBdt4CNG4kHbUo3DZyZwy+Ho0rnLpc/PMWkpA=;
 b=kJO1BZ/nkBJob/CaqsLg1RCgDlYSIczxgW945p29+u9JuO2VlxjZpH8tm1YYLOm8PNWqMeJimVcu/KcxzFQHNo9cQ62p7yBNkCeRSt1/0M+t2ZcrmLYzyLRwvD1kFowny15yDZkJm/jPkMpHGK4OPNI22eGtcFPCeReDbtJHuXxLssKaorNJoHSB6139zrDjbVsPK8kgMUzJuKZD0tXjPkbRauBSWlv8SgC7fJTGXfKFgLYoM9qtHKH2LCZWQaBkwob4EcJec20AreljmDUP2GUEf24m6J5qRo8Ad53MCjJ2fmmR3LaSti2O+Ob74YH65OEC3BMFYYptHZS/Qu3IQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kococonnector.com; dmarc=pass action=none
 header.from=kococonnector.com; dkim=pass header.d=kococonnector.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d775G8gBdt4CNG4kHbUo3DZyZwy+Ho0rnLpc/PMWkpA=;
 b=NlBDQcywBfW7qOqsCj/NR+WchLUnHlk9SJWThm3PIhQvyHFUc7Ck3g4LA7o8QVmk4pMYclCldEGf7EA8Dfj6+BBvgYV3fYHotrpJo4FoyDMClX0a9OUSD97IEQZfoEkISuN6p4BhgIDs3V/XmwiL5W+JMMQHV1m2/MUyXtlULlU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oliver.graute@kococonnector.com; 
Received: from AM0PR09MB4067.eurprd09.prod.outlook.com (10.186.128.206) by
 AM0PR09MB2308.eurprd09.prod.outlook.com (20.177.110.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Wed, 1 Apr 2020 10:43:28 +0000
Received: from AM0PR09MB4067.eurprd09.prod.outlook.com
 ([fe80::7559:adc1:bb07:495f]) by AM0PR09MB4067.eurprd09.prod.outlook.com
 ([fe80::7559:adc1:bb07:495f%3]) with mapi id 15.20.2878.014; Wed, 1 Apr 2020
 10:43:28 +0000
Date:   Wed, 1 Apr 2020 12:34:34 +0200
From:   Oliver Graute <oliver.graute@kococonnector.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, oliver.graute@gmail.com,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: using cdns3-imx driver on imx8qm
Message-ID: <20200401103434.GA38169@archlinux.localdomain>
References: <20200326170109.GA28051@optiplex>
 <20200327090554.GA31160@b29397-desktop>
 <20200327095028.GA19809@ripley>
 <20200327132153.GA31668@b29397-desktop>
 <20200331142528.GA2246@portage>
 <AM7PR04MB715728ED4EF3715A7798A5A08BC80@AM7PR04MB7157.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB715728ED4EF3715A7798A5A08BC80@AM7PR04MB7157.eurprd04.prod.outlook.com>
X-ClientProxiedBy: AM0PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:208:122::31) To AM0PR09MB4067.eurprd09.prod.outlook.com
 (2603:10a6:208:194::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (31.17.95.22) by AM0PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:208:122::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Wed, 1 Apr 2020 10:43:27 +0000
X-Originating-IP: [31.17.95.22]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0294b06-3592-4710-e953-08d7d6298316
X-MS-TrafficTypeDiagnostic: AM0PR09MB2308:
X-Microsoft-Antispam-PRVS: <AM0PR09MB23080FEA22EAA2F5A3420452EBC90@AM0PR09MB2308.eurprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 03607C04F0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR09MB4067.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(136003)(346002)(366004)(39830400003)(376002)(2906002)(44832011)(508600001)(316002)(4326008)(52116002)(6916009)(6496006)(956004)(186003)(5660300002)(26005)(966005)(16526019)(6666004)(33656002)(1076003)(6486002)(66556008)(9686003)(8676002)(8936002)(86362001)(66476007)(81166006)(66946007)(81156014)(54906003)(32563001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: kococonnector.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Wjo9HGjg0t7y5hva6Np6idtEeQxUvK1T1/LtQxQIds21rlx8/DSEdf/1lukkY+QnKNKlOI2aAHuEqc2g5Ac/o97MZGVgktUPfkCLSVV/sJARiI7EZysy9cunOMS30F67aczqm5VeJOKd1mGjX4AxqBquCn7DGT/g3M3pNnpcKEdkTe8eSylJiXZjekTyPd43dtaXIgnJBhi/n33EQkWucJAsgh4k9tQsWprwKUGN47bIQ2g7n2I+ne9dDQ3REVOP/uqX/7mOefVR7ZS1OLVJvD4fMo1j97JGAHBjkvawjUE2SjfYs6s1FPZ1d0zyYS0JHKKbjVhonV3zpOVvAzyn8gSPJm9+ey7sq/8fG30MP5YJ2gm1Jm+6+PKOpaGg+jbVe7JJKkKzybCTGQEsTMKjFacTxFxO6Eao1PczTGUyKmQbo3QQ39ozXl6CIWGreSBCMaT9AF0iOxptpqme9KuCEahuVwl7aGP3v696E03xrDFZiksePpytvGAebeMcy+WF4N2hMiPJ0UWxrg8uT4KLo4nW2b9WZYsbgZYUdan21+glOGHkesAMMsZxUiziNbJ
X-MS-Exchange-AntiSpam-MessageData: CvGmEWRCh9A+qWPU4gZQSx9Re00rIx+88CPq83xijKMzdcCT29W61b6YZ5vrHInz08CzPIFDY0EgUJqRRFiewbK/cVM8U4zwZHlbINhWMbW7KVgOFkAofr4xjgA+hQpF1qFyO/Bpakl94MK3VfiDyQ==
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0294b06-3592-4710-e953-08d7d6298316
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 10:43:27.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1b2zDK8iNHsXIXwoVqvNKGOLOLWpA8ZJg4mgcrd36UhB3ptvTmrIspfpVJu1j9CvLjQgn81dPVfbvzA+uTjUZoPmeOn1WYsPyTftb/IVrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2308
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Make sure the five clocks in dts are correct, and print the USB3_SSPHY_STATUS if
> timeout still exists.

ok I got this for USB3_SSPHY_STATUS

[    3.057122] cdns3-imx 5b110000.usb3: wait clkvld timeout 0xb0b03827

Unfortunally my imx8qm spec is incomplete regarding the USB3_SSPHY_STATUS register.

this are my related DTS nodes:

	usb3_lpcg: clock-controller@5b280000 {
		compatible = "fsl,imx8qxp-lpcg";
		reg = <0x5b280000 0x10000>;
		#clock-cells = <1>;
		/* bit-offset = <0 4 16 20 24 28>; */
		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>,
				<IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>,
				<IMX_LPCG_CLK_6>, <IMX_LPCG_CLK_7>;
		clocks = <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
			 <&conn_ipg_clk>,
			 <&conn_ipg_clk>,
			 <&conn_ipg_clk>,
			 <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
		clock-output-names = "usb3_app_clk",
				     "usb3_lpm_clk",
				     "usb3_ipg_clk",
				     "usb3_core_pclk",
				     "usb3_phy_clk",
				     "usb3_aclk";
		power-domains = <&pd IMX_SC_R_USB_2_PHY>;
	};

	usbotg3: usb3@5b110000 {
		compatible = "fsl,imx8qm-usb3";
		#address-cells = <1>;
		#size-cells = <1>;
		/* ranges; */
		reg = <0x0 0x5B110000 0x0 0x10000>;
		clocks = <&usb3_lpcg 1>,
			 <&usb3_lpcg 0>,
			 <&usb3_lpcg 5>,
			 <&usb3_lpcg 2>,
			 <&usb3_lpcg 3>;
		clock-names = "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
			"usb3_ipg_clk", "usb3_core_pclk";
		assigned-clocks = <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_PER>,
			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MISC>,
			<&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
		assigned-clock-rates = <125000000>, <12000000>, <250000000>;
		power-domains = <&pd IMX_SC_R_USB_2>;
		status = "disabled";

		usbotg3_cdns3: cdns3 {
			compatible = "cdns,usb3";
			#address-cells = <1>;
			#size-cells = <1>;
			interrupt-parent = <&gic>;
			interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
					<GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
			interrupt-names = "host", "peripheral", "otg";
			reg = <0x5B130000 0x10000>,     /* memory area for HOST registers */
				<0x5B140000 0x10000>,   /* memory area for DEVICE registers */
				<0x5B120000 0x10000>;   /* memory area for OTG/DRD registers */
			reg-names = "xhci", "dev", "otg";
			phys = <&usbphynop2>;
			phy-names = "cdns3,usb2-phy";
			status = "disabled";
		};
	};

I'am also using the SCU related clock patches from here: 

https://patchwork.kernel.org/patch/11248255/

Thx for your comments,

Best regards,

Oliver
