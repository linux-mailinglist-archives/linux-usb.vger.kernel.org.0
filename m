Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3A334BB0EC
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 05:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbiBREwZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 23:52:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbiBREwV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 23:52:21 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150051.outbound.protection.outlook.com [40.107.15.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933E513F46;
        Thu, 17 Feb 2022 20:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nu9KuLz1f759eKzy9bqxEtsn8ZHbcNNztySPgS1ZPw+WgeXHfKqBc+cSX8nDntsqjlc7yag2CBNO4XFdd30dKLG/Q0e+v3NrCT+ZOVsM+YN3HMLNMbEeAvyC37I0vbof/zncxweS/Qsv64CHfdHuv8KmUUWzzcfEtpkuCadkhuV8LCjGyJEZ5t+mNsw40vrUFNkOcY6V+GYSi26uaS8DCZgtRF8Oyi1zSnbm3Y/pVRqCeKJultzUKugQ8cpUphpSuZarwez1B7DXSfHCTxNco0QcRiXRa2mrhkMwrAo0tr2kY6H1FV5/BI9B820AU2YaTS2vMUWaIQOvdFWTtQc5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBzXnjy5r6WFTtzNu4UOyluQc/e/tiuuErPtAWPsAN0=;
 b=JLQWR1r+T3P1Kx8QDdhqDBVzb0KDnimEf/ZcGivvQPyI3ZIszXdsO2UZdp73QvKaZSrM6mPPjATilsYgRf2cAa6Fz3ywLPmVwvbsRkjnRDEJvlm2YbwBsSxJwjJEcnpTi26a58q8m6nbavgHSmsWkgp4ICe1FrjNZ7e+7oURw1kMRa1rok4dOhiib/INNxoWD88xHH1HnM89PgFLSH4CnpG7AN/C6WtK4Xt8dhLzMr85F29M8PJEZHrSuS5tbGEFiahzONxdANDUJrC2HR6lZgxQ3+71x/1o62VUtc2Nz/3V4MFiFHOu6Jqtjlo7/2d5PRr0p7FiYgXFGZvtmpGWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBzXnjy5r6WFTtzNu4UOyluQc/e/tiuuErPtAWPsAN0=;
 b=MBjoUTFpHxcq9QiGZ65fXQfIChycdRNt+NNOkbtc3cxw+C3AE90NBeV293uppFVrxN9Xu5vPdRWQ4WfdT4FhFxL5YRZbb0cznex76jemV8rdU8pSpWyVvYDT2qBWT+V2Yx7aY3mtKr3mzdYdC8qn7hE1VLXp2IMyJGFQbopGEY8=
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com (2603:10a6:803:49::27)
 by VI1PR04MB3056.eurprd04.prod.outlook.com (2603:10a6:802:8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Fri, 18 Feb
 2022 04:52:01 +0000
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::f54b:2953:6266:2f0b]) by VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::f54b:2953:6266:2f0b%2]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 04:52:01 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 1/4] usb: dwc3: imx8mp: rename iomem base pointer
Thread-Topic: [PATCH v4 1/4] usb: dwc3: imx8mp: rename iomem base pointer
Thread-Index: AQHYEr71kKv2375KsUO8Km2S04IIaayY4FQg
Date:   Fri, 18 Feb 2022 04:52:01 +0000
Message-ID: <VI1PR04MB4333BDD0E5C38F7620309EDF89379@VI1PR04MB4333.eurprd04.prod.outlook.com>
References: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
 <20220126141340.234125-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220126141340.234125-2-alexander.stein@ew.tq-group.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 463c5eea-e69c-4c81-5853-08d9f29a66bd
x-ms-traffictypediagnostic: VI1PR04MB3056:EE_
x-microsoft-antispam-prvs: <VI1PR04MB30564F8ABCF66C300D0E666B89379@VI1PR04MB3056.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kg/rM7FAacMFQcx9OEvEYeOMoeS/0XQGgmcz44GbOUQCvmbj4OSOfzRTRImm0HzGVXMTDR8xDZEtqJU/U2+vshoIbPPxQMPUvwX+xloahK47vw9bPgg7WScgRFHwmDDJ5p8UFg9Q0n41cwmHrq4cicmGut1UBVsu/h88k783LROasw63ezq/8DT/PLq1rB/f/KB2Eqa9OT+L0+zJv4zhmvg+D8w/E1Hyz2PpIFNOhxlzvmX6B1FtdwE8WzbeoZRWzK24wNBdEJ+RBC2lj1lHkQJJnGTGLtBMBIAYOGLmD5/1wxNu75X5Y4sU/cQeudxwFW26lXnyBurTwqnrSxqLweAe9ipfOmbDEb7nFDzNNbzmMN09IMVQ6Z3qBXFg2YUCF31JCu2AabS3Eu95cw5UsIHYAZkvDr3Io2BpZgekXM8mojYC8b+BV3GU/8S+1PeIY9MMtrT7IP+0i5RU0Ozh6N6CAWwpnzrYr+CdpMxgAV/snG43rd5pGjIrlAqcyoL5gCsv/AXygW8d3FVI6NZBKm3lUcwbv+3q3xj3mxkf1PTTi4CwuRnKM3kj1JUa9k+hLuXxYIWIfOd6BYTdjym+0Yrkdoq+ns3P2RIVvWZvLrl5wNW3QDqMrQOL9RXm8lHxYlwFV3bAAwHiG6bMvMwHxjMC3wFCNPRy8l/tAbbzNZmYZCpeZie8bgCwbxs322R/UYcLuIWNZACKVlHjVp+zq8I1yTuxkUPwgRtfKxxtrOI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4333.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(53546011)(9686003)(316002)(26005)(83380400001)(66556008)(52536014)(7696005)(6506007)(110136005)(38100700002)(54906003)(76116006)(64756008)(66446008)(4326008)(38070700005)(66476007)(122000001)(8676002)(8936002)(508600001)(55016003)(66946007)(5660300002)(86362001)(186003)(44832011)(33656002)(71200400001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wp5sQNuL06uu2UkCcFBTnfAe8dLDdmiyhwtwJpuO24r8lb5DQz4iYh8MJIYz?=
 =?us-ascii?Q?+BX1gc9F/r5mC3NHmSvc90MLAgkGq3wgYOzMTXROGr6plWKeaUpnShp2Ahqo?=
 =?us-ascii?Q?RXZqLF8AT/3Gmm3aoBd3HH5HNyjdLJkcfM4TAyboOhVZWjWpEs5uPJChe61b?=
 =?us-ascii?Q?igKxc8NYHcXLw7EOV9iehf8Md0IdGwYmTHVwNYF6G8mVCNgUhe7TsfaBinYJ?=
 =?us-ascii?Q?eoIXwGkdT09uTLkfVjMjNnimf8g1jINaB7qVfHpxhOFPk5NLV9KzAtRlWIbT?=
 =?us-ascii?Q?VxHx62UtExnHTrBWQam5CjgvSPAWHHsUGlOhJZWo59/PjTpe9wQt9Vr0m9wH?=
 =?us-ascii?Q?2D0/0C2jfB8RKhzA1Q2icJbJM5gZz/l4L1yaSpei1O8Lttn2g5XspApnWhBl?=
 =?us-ascii?Q?+YjLKpiwVZZ5ED/0AdbME/RNSqfzrf2iFiiCZaIOnudXhktsEJ4JkeTdobze?=
 =?us-ascii?Q?GPSPcm/71VkQYL/awN+1hI6RyK/VHSfkaL6e2GaNXGfO+JtCsg49jIoHk8qx?=
 =?us-ascii?Q?dIfmZMt5xLkQzZQig67R7IVblKbVa35pgWCZXhOwEqIQjQlOmE9J8XA/wAG/?=
 =?us-ascii?Q?3IXnjBeW2ki9NgnInnE9yqoZcQQ3Y+v/bJlon8OsEAoudiE147iBUtCc72u3?=
 =?us-ascii?Q?M85ukSLm0PcMB/FT5U/pDcFSM5TYeph7TXe7nKFamfoyB6Xpj7pHC1+YovMK?=
 =?us-ascii?Q?h5Svhp8EQW/dV4dgGyd35jW2TNI9yiJiQ8wo93cVD9RrBBWgUWWesDwtS47B?=
 =?us-ascii?Q?2LucArHuct68/Lej8ZwKDB1HhRetuy41fqw1l4gKGwySyFtNYwctffulDYOt?=
 =?us-ascii?Q?1PSUZ979/X/mWhmckMfNejkbXKvz6w/N3h1YHK7DtR3IVeg4HJhLCUytWUzT?=
 =?us-ascii?Q?qLrSoTiakwyhL+UGqdWwAfiPahnr+CnO9Gvs7hsYo8YwXHr/zSh8LdRsOv7/?=
 =?us-ascii?Q?wJ8BEUnWha7LvGXlXKkncPGvtVowbSbk32yVRdh8oY92tiiK52hoAw7Vkr9H?=
 =?us-ascii?Q?0n+ye2YmO5mizcaZ0XNefhiWzVS3Gm5hq5K2B7MfNQLjecFsvkR/s1sA49Ad?=
 =?us-ascii?Q?QyKwTCToaRyE+b1CBX1z87HTTtYsWIJj48mBBAdqXO+9PJ1vBP7TwXKU8+iw?=
 =?us-ascii?Q?FlmzoFW+UThaEoTV2IdIZ7ld1JUslUUy0P1EP5e5ZC2k1LQ2efuLYOXoexTA?=
 =?us-ascii?Q?NKgHoG6pVmckYaVpVFxMLsXme9/Z5Hty8ZEcd6KS6p8AdPOtAmUeHBIBbcwe?=
 =?us-ascii?Q?3ngHuhLEk/tOOuG/pMrhjp6e9cGgdH/3KV8FRAUKG2izxFaVO4Nm/z7SDTAa?=
 =?us-ascii?Q?ck6lkvF9qYHoS0agcN40jLdlrCCuZmdLdJHgiAGV7IJUwMpLdA4UNklkdJHs?=
 =?us-ascii?Q?g8GAsNUnO/kPVP4WDB99pTWE4Ar06C/64mf9d607B+XQFIlDe3jducJvFk12?=
 =?us-ascii?Q?fZhGUj4OpAdvoVqqqDIeCWKWphx10baz4lzmHEetub2FjxPck1T4zW897Pe3?=
 =?us-ascii?Q?LQPPrDC297IEQbY6roWI6is4p77WtsbhGcTJ13WSR+7uzsXyxEmmF+wCMg?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4333.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 463c5eea-e69c-4c81-5853-08d9f29a66bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 04:52:01.1112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NOjPSn6tdxdG+CL4vOHmuTNWb4Q+IE6F+0vwSIpUS9b5Fm+eaJaB9dDucsDBaTBJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3056
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> Sent: Wednesday, January 26, 2022 10:14 PM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Rob Herring
> <robh+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>; dl-linux-imx
> <linux-imx@nxp.com>; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Jun Li
> <jun.li@nxp.com>
> Subject: [PATCH v4 1/4] usb: dwc3: imx8mp: rename iomem base pointer
>=20
> Until now the iomem used is not USB glue as the name suggests, but HSIO B=
LK_CTL.
> Rename the struct member accordingly. This is a preparing patch for when
> USB glue is actually used.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Li Jun <jun.li@nxp.com>

> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c
> b/drivers/usb/dwc3/dwc3-imx8mp.c index d328d20abfbc..1c8fe657b3a9 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -39,7 +39,7 @@
>  struct dwc3_imx8mp {
>  	struct device			*dev;
>  	struct platform_device		*dwc3;
> -	void __iomem			*glue_base;
> +	void __iomem			*hsio_blk_base;
>  	struct clk			*hsio_clk;
>  	struct clk			*suspend_clk;
>  	int				irq;
> @@ -55,7 +55,7 @@ static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8m=
p
> *dwc3_imx)
>  	if (!dwc3)
>  		return;
>=20
> -	val =3D readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
> +	val =3D readl(dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
>=20
>  	if ((dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc3->xhci)
>  		val |=3D USB_WAKEUP_EN | USB_WAKEUP_SS_CONN | @@ -64,16 +64,16 @@ stat=
ic
> void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
>  		val |=3D USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
>  		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
>=20
> -	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL);
> +	writel(val, dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
>  }
>=20
>  static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8mp *dwc3_imx)  {
>  	u32 val;
>=20
> -	val =3D readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
> +	val =3D readl(dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
>  	val &=3D ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
> -	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL);
> +	writel(val, dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
>  }
>=20
>  static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx) @@
> -115,9 +115,9 @@ static int dwc3_imx8mp_probe(struct platform_device *pde=
v)
>=20
>  	dwc3_imx->dev =3D dev;
>=20
> -	dwc3_imx->glue_base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(dwc3_imx->glue_base))
> -		return PTR_ERR(dwc3_imx->glue_base);
> +	dwc3_imx->hsio_blk_base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dwc3_imx->hsio_blk_base))
> +		return PTR_ERR(dwc3_imx->hsio_blk_base);
>=20
>  	dwc3_imx->hsio_clk =3D devm_clk_get(dev, "hsio");
>  	if (IS_ERR(dwc3_imx->hsio_clk)) {
> --
> 2.25.1

