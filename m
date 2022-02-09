Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB934AF745
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 17:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237531AbiBIQ43 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 11:56:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233407AbiBIQ42 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 11:56:28 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54627C0613C9;
        Wed,  9 Feb 2022 08:56:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1BrkGktCLWpyWV8o/jJRe4a73hsunLRDJWmxCPCLCIhHZ8Hg5jzWqr46W9QKcdl5/LRiEHENzKWEPcGBTBbhvsmYVf7WXFT2IXyrJh+5FvPGOEYTYYLa4uqG8ZBLNDaUjR0RaSgeP6+bzhyVmxCezb6o6WWLIWlkITqs+6krqMkLUgULU1SQtrGRzQHGmmjei1KNEthc2zJuLM8qYAJbXmI1plurkuz4jMeqVuaHIEnuX6xkF2/kao9mQdKpb1oLIsxumSe7HBCujKNPkal9cM3gs2zRTCcWqj7Ycigswq8v734x9WNOkmdhYrTfLwCIV5t8xkAfXrCEc553I3ksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qR4xhcNK9U/fhE9KiAV6GvuglarUYQybrHfZfRMdUU=;
 b=AOkjf8wESrIys2JHbl9r+wqSrAsiji1fLPv6rwp/w5TVTrYb8D7JYB22nBxxRruaUruXKEQFDv+w/KStSONo6GE5ssqdIC50QEcey0j8LDGSI+fcvu3zjSXK3wGB1IrYCC7CqE60BGbxbfoR3Cg6fkzAKbaSGl5Xw7eAtQpkgyFy1Xnfta1wdOCATIqykYufsOYZ630ZM1H/vBB0Y6o877G8he30dFYbqkSsIotP4kUWPo5IXWnX89ndfg9p+yqAM1LXZdq1xfliaL66Lp5pjB/4PTf++Gu+j0OQRqjcf+ihfghBU5yQGgbpxoZ498RvsTdR1FnhfzrAlDG84/bgWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qR4xhcNK9U/fhE9KiAV6GvuglarUYQybrHfZfRMdUU=;
 b=OLckVqGg0l7q4nfnNQ4Jj+0+eYumLN/Xrt/0t11gL6mjq1BXIW/liqNCvi5c7wZBKu4yLHK+R4eWVCkP7j4bftIWmoRg/nDJ+bUu9L+mUfG7dhyPHW9ybM+7JhB8IGENdg3DXVanjKqF8PLvmM6l4f4jye7FIBJVLqH36zhfjJA=
Received: from SJ0PR02MB8644.namprd02.prod.outlook.com (2603:10b6:a03:3fe::20)
 by BN8PR02MB5906.namprd02.prod.outlook.com (2603:10b6:408:ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 16:56:29 +0000
Received: from SJ0PR02MB8644.namprd02.prod.outlook.com
 ([fe80::40fb:4094:595c:24cf]) by SJ0PR02MB8644.namprd02.prod.outlook.com
 ([fe80::40fb:4094:595c:24cf%4]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 16:56:29 +0000
From:   Piyush Mehta <piyushm@xilinx.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Michal Simek <michals@xilinx.com>,
        Manish Narani <MNARANI@xilinx.com>,
        "sean.anderson@seco.com" <sean.anderson@seco.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v8 3/3] usb: dwc3: xilinx: Add ULPI PHY reset handling
Thread-Topic: [PATCH v8 3/3] usb: dwc3: xilinx: Add ULPI PHY reset handling
Thread-Index: AQHYEw4j0omZ/ThA2EK/ezOoCkGe1ayLUvdA
Date:   Wed, 9 Feb 2022 16:56:29 +0000
Message-ID: <SJ0PR02MB86446B7F4942F866778C4CACD42E9@SJ0PR02MB8644.namprd02.prod.outlook.com>
References: <20220126234017.3619108-1-robert.hancock@calian.com>
 <20220126234017.3619108-4-robert.hancock@calian.com>
In-Reply-To: <20220126234017.3619108-4-robert.hancock@calian.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9da71cb7-d594-40aa-349e-08d9ebed1df6
x-ms-traffictypediagnostic: BN8PR02MB5906:EE_
x-microsoft-antispam-prvs: <BN8PR02MB5906EF2174EFF82F4F8AB29CD42E9@BN8PR02MB5906.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EZwlpFJNZC7hcCvQDfstpXQKUqmCSDXRsJOfkmVgnR2XHJ4o9EBoTmm+GPyonrDtQ8PHytaaRoc20hcJTLdUfTIe33/15Jjm6CgfMsV5yidOajqJS4mlVn0xFs+DM+rYtkee98h10KhZch2p4yyT8QLgAX0MT8styKtfazFT85BvpWmHr2Zns5SUbR+85xre/gLJordtMcUA+SxQ9MvWxwcX8uVCijNYVQLrZCZ+828rw38oxGUsDrDpL5fcp6DSMUP9uAM/YrRB+CbFnnv27jHOOigJ3+24ZcF0MsmB4eDJudO+sm543pcdCAvLZQyzbjH7aEjVqQC6CIUXupS9Ux/jFbFUpkldfd2rekr7Y3D3rkCOQ9NmYhscHFx5NWXNRJoH5i3Vn0IDfJ7CZRJCgXzw+6EpmKnHTwPs3xTDCd0OzlzrsSKWoIhFhZIz0v8YIEJuK/8hAbHiiN76OWk0t+YmWZkypvBuTCoVkQ5LlVw7NgN7tZxdAy90qpuXmt/cLXL0vM6+yXTl5XYUkbKIb0GAMa8JCI4vCVJBYZ394P4JHU0Hc63DrJgRar93+W2UEr8IKxPduqI8gQK6my86x0F+DZNnkmqY6gyjJpz5uNZ86eUtMG01GQhuOY0tnIkdOBkIV2GF/JunNZjsg5K9y0dO2sVCRq7xwOfHUX8srwMY+IdG16zOpDek4nlmrPiA1wIU6paPO8uaj6oHtvCSSA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR02MB8644.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(83380400001)(9686003)(76116006)(52536014)(71200400001)(64756008)(53546011)(8936002)(508600001)(5660300002)(66446008)(66556008)(26005)(6506007)(86362001)(33656002)(2906002)(7696005)(66946007)(38100700002)(8676002)(38070700005)(55016003)(316002)(54906003)(4326008)(110136005)(122000001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Xu0GrzYyiDeQVzUDqA+wwvM9HVDi8OJa3kNIJJwtjPjSE0Q+qvm3+vgztfzH?=
 =?us-ascii?Q?JrZLX4xH55Uba4ADPhu1x6l1krzbH9KS5VmBoddEkqcrrPZnr/fWS4czP4UA?=
 =?us-ascii?Q?TnK/fGLTkMSi1zyO+aDo4XUR4OX3/Tr/UJCfVUh1Volik7KptAy0Rkf3uOez?=
 =?us-ascii?Q?9JFWI52qFlBNCoAV7CfBQ1eYr9puz2/h7UuKelCuMt8JRvDN4Wm+mY/DFPkP?=
 =?us-ascii?Q?1X1ENeIkGAHXukpkpvMWozUBZh9T2opqgkb6gfNJ1znZF+0XodP6p/ncsGw8?=
 =?us-ascii?Q?LD6tnmyOjxg+0x/jBaYyxH+ej6myBOUN0G/R3izLBTKJbDa84HuflXGo1fTn?=
 =?us-ascii?Q?5yJWNkg6o690F2zVL1yFL1jnaO24MQMCNHDst7UKyY1cTvOdLO779TJ7bGa5?=
 =?us-ascii?Q?0O6juGOUS1S2NlHF4n5NyjMek0PT7Ic2YKNn/ACtpWX22yWTpAyCwBiaFE+p?=
 =?us-ascii?Q?V6AVTTS7/aDh7QNkh23yMFAtCSd47W2pfnWl0TdPwqXnkkY7ikw2jvx/9BIO?=
 =?us-ascii?Q?y+wXlMkU8MUfJNE4HpwLzVMYdFZFp2CWw/SOyV7pILQEGi01VNordUlqSllY?=
 =?us-ascii?Q?e7Fj7azhrqrMTOFJKjXJEYnW96gDoYDylJ3rFhMbOg62eZxCkI/B0xQoJFgr?=
 =?us-ascii?Q?0tezvPpJCqvO1uASTW/XNP6DuEKjO6U9Ob6+wPu11F2pCXdXD1g0yNh55xJr?=
 =?us-ascii?Q?1TDv08dlU2qHOe/gHqGT4OvW/GdtDSOJAAtvjfjrT99Znc3uhETXtez6IVrt?=
 =?us-ascii?Q?ubLKUYmPW2lDOf06KM4kahOytX/RxRfcAmbOMUsVexhBBXO70ChfJFXbsWAA?=
 =?us-ascii?Q?9avu+VH/B00s/YU1fzOAVTdu2Sw0IF+Mjo5PFu/3JlDiLNj0ZkifOgeDJSX4?=
 =?us-ascii?Q?sVq5YjX0wEX+xtUmkF/AF/ZNQJO+9bJi9x5RqzeXRR8HeV9UWIVVo8UO/hjI?=
 =?us-ascii?Q?ioOjmmZCMgd9Ua9RUgl+m3occWvHxKeWe18NIpE1cmF8VrvnNfavBDb7ZkAl?=
 =?us-ascii?Q?ROQbc9aqo0hwI8TjuzJnus5FUnkRfWOLHMsIGeLjzS3COvk7rxz777BrR1lV?=
 =?us-ascii?Q?m5UG1Rlkjki6kiEo9vxmOs5DlNw7i9I4omWBIHUp1Y7dxxqpRE+Gcdoc1Nyx?=
 =?us-ascii?Q?GMmbSIMkN/5IdDe3Dta9XmIrHBU5xi6kKzpEwfTeLyhtamFbhoZ/ZuENEQiQ?=
 =?us-ascii?Q?OX4KEXL/R8Wu/PZOmrBNJw7yHFpB4uTPAeqWf6zT9TZC6/lgreWnwWaxk0hR?=
 =?us-ascii?Q?SyXmVq6hWSNUqwu4Wo4yMv9/NwlKU6XNL/dwxFjnjkFVbAVcsP6QwewuRT3l?=
 =?us-ascii?Q?JrfRDD01XXP+MREPSSIHIlE/eyPym8MmtJ9vMc45X+StnPNbum5ZnaaHJpDz?=
 =?us-ascii?Q?thvpX9FycRKe9S7VdViAnBOJF5gqBBYISkbMQv0k7pdkTY+Uk8hsixz9KQjO?=
 =?us-ascii?Q?wdD9bWW7odmYvlW16q+P6QMUKQN99ep9XAgehQBniUAWiI+OEVHjf2LSFEVE?=
 =?us-ascii?Q?iF3QFq7i3abz+BzwCFgKnRWhA8eKraSAtJzih5r88pconxonCk4+stdix1rv?=
 =?us-ascii?Q?+JRTWm/N9E0SrCYhbOJEHLIjnzdAaVSJNupevrejGagrLgHZ26DikVBUKoKM?=
 =?us-ascii?Q?bKx7noNs1rA8w4k0dAiY3d4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8644.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da71cb7-d594-40aa-349e-08d9ebed1df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 16:56:29.0837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: URGaEZR7LCpKkCn+44+sAckNcYzgQkBT90eCebh1oABopv3Gv2OZ9gDd4AR3u/Ig8d8rYjSDlKnk6w4eMxxzKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5906
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Robert,

Thanks for patch.
All the Xilinx USB resets are ACTIVE_LOW reset.

Regards,
Piyush Mehta
> -----Original Message-----
> From: Robert Hancock <robert.hancock@calian.com>
> Sent: Thursday, January 27, 2022 5:10 AM
> To: linux-usb@vger.kernel.org
> Cc: balbi@kernel.org; gregkh@linuxfoundation.org; Michal Simek
> <michals@xilinx.com>; Manish Narani <MNARANI@xilinx.com>;
> sean.anderson@seco.com; robh+dt@kernel.org; devicetree@vger.kernel.org;
> Piyush Mehta <piyushm@xilinx.com>; Robert Hancock
> <robert.hancock@calian.com>
> Subject: [PATCH v8 3/3] usb: dwc3: xilinx: Add ULPI PHY reset handling
>=20
> Hook up an optional GPIO-based reset for the connected USB ULPI PHY devic=
e.
> This is typically already done by the first-stage boot loader, however it=
 can be
> more robust to ensure this reset is done prior to loading the driver in L=
inux.
>=20
> Based on a patch "usb: dwc3: xilinx: Add gpio-reset support" in the Xilin=
x kernel
> tree by Piyush Mehta <piyush.mehta@xilinx.com>.
>=20
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>  drivers/usb/dwc3/dwc3-xilinx.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilin=
x.c
> index a6f3a9b38789..1ee6011ada44 100644
> --- a/drivers/usb/dwc3/dwc3-xilinx.c
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>  #include <linux/clk.h>
>  #include <linux/of.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/of_platform.h>
> @@ -101,6 +102,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx
> *priv_data)
>  	struct phy		*usb3_phy;
>  	int			ret =3D 0;
>  	u32			reg;
> +	struct gpio_desc        *reset_gpio;
>=20
>  	usb3_phy =3D devm_phy_optional_get(dev, "usb3-phy");
>  	if (IS_ERR(usb3_phy)) {
> @@ -110,6 +112,14 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx
> *priv_data)
>  		goto err;
>  	}
>=20
> +	reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> GPIOD_OUT_HIGH);

reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
Note: Xilinx Support active low resets

> +	if (IS_ERR(reset_gpio)) {
> +		ret =3D PTR_ERR(reset_gpio);
> +		dev_err_probe(dev, ret,
> +			      "Failed to get reset gpio\n");
> +		goto err;
> +	}
> +
>  	/*
>  	 * The following core resets are not required unless a USB3 PHY
>  	 * is used, and the subsequent register settings are not required @@ -
> 201,6 +211,15 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx
> *priv_data)
>  	}
>=20
>  skip_usb3_phy:
> +	/* ulpi reset via gpio-modepin or gpio-framework driver */
> +	if (reset_gpio) {
> +		/* Toggle ulpi to reset the phy. */
> +		gpiod_set_value(reset_gpio, 0);
> +		usleep_range(5000, 10000); /* delay */
> +		gpiod_set_value(reset_gpio, 1);
> +		usleep_range(5000, 10000); /* delay */
> +	}
> +
>  	/*
>  	 * This routes the USB DMA traffic to go through FPD path instead
>  	 * of reaching DDR directly. This traffic routing is needed to
> --
> 2.31.1

