Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 059762DA730
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 05:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgLOEkp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Dec 2020 23:40:45 -0500
Received: from mail-eopbgr80077.outbound.protection.outlook.com ([40.107.8.77]:34107
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725562AbgLOEkk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Dec 2020 23:40:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrH9u531ZBcFxhXGnkNKtBn7SO6Driu2lLsVuyAnDJUBlTFyoKCi04ZVUQSPk9bOSGCzdcpp3nR0NK958IokQPCstFnQFRzNAIxEKNp4KdoCL2PIoFMR9KnIwF4jyYsalx1NYGMF2LNt9fBi1NWlE/VkskboY82eTOcQVg/vGLUIvh8EWX0zi4O+ke6oL1seIxIxXpjUDOpcHGr6q93TRFwr7IPq3A6MRqJhDHhNHu7Uw5a6ifgviMoZWn+gaK2KiJHjN1lAmUI0M0po6bEGapM34ppnOTHDpCNv5Pfnv6Q1wPtl62tTa0BDX7/1NaJWOT6Wp72R3zmCt0Eh+lWRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgDhWwrFPkppT8t6pfeqc1BOaxvtTGVl6YPM9ZmubyI=;
 b=K+1cIF7JxCVyRyDUhXzq6KCEU9hQCjEdol9Qr2fNL9yNOCW1sjx500E6exdyJRNQWycY0bbKyrFiYPphEkk/nsVqGBcs0fQXcnJN/Q7XVuEFH6Vfd2E67BrYYcuJ25Kr9fLjdM7PKh+KilCbo9owOu6ulYNWHNQw1zuO+BMGf2xwN/8ypyedeir1bj2j865HA+gM+dJ8pP2LRtLn2ILzw++z5r+M8O2ZxB4uhIxLFL4g//uoyZW5UUD95RdPuezMA3c74enAdADtqN/xqou0CBCWrKMyFPtLfNlSQYLlYvqwH5tnorh+Tf4IiBMCKA2EdTIGvEmZJdQlubQ9tYyWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgDhWwrFPkppT8t6pfeqc1BOaxvtTGVl6YPM9ZmubyI=;
 b=YOzId1SBUEkc7afkWGBCJVLldJnkwQGGtmbaraifZUxFmog3bov7GhtDjK0pmOzza2tjosFm75kE2HUUWk4uYd4GP992MLpz7Rek7LNsW55oPoAnUKwXZUJnmSOdUmTnjB9npbU1qFHgMq9faShy5au+YdY9oSCmJgcdef6Q/Wc=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Tue, 15 Dec
 2020 04:39:52 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3654.026; Tue, 15 Dec 2020
 04:39:52 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: fsl_mxc_udc: Remove the driver
Thread-Topic: [PATCH] usb: gadget: fsl_mxc_udc: Remove the driver
Thread-Index: AQHWzzbnKL8VzFsFkEKAOA+h60alnKn3mheA
Date:   Tue, 15 Dec 2020 04:39:52 +0000
Message-ID: <20201215043922.GA2142@b29397-desktop>
References: <20201210205538.15025-1-festevam@gmail.com>
In-Reply-To: <20201210205538.15025-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 14996fe3-a864-4027-eaf8-08d8a0b376c4
x-ms-traffictypediagnostic: DBAPR04MB7416:
x-microsoft-antispam-prvs: <DBAPR04MB7416266EC38A8444806B810F8BC60@DBAPR04MB7416.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KoHQM98V76pSBTyfzAVjPk6LAtfCTjPi6k9WfXtT2tFxh7VmejzSmUP8WbIiZW7uM3YWiYerkQU2wyDP9BMQwGGa8THLmiNkDr9nHKR/l7bdRDSgZIcRyfmEp7i2/V8NXgucsc/NEZ8WMVqIMk7EHTRg+V8V38Nr/JWwWA7YX403mlob0K4zgbCuvL+FJTs0XTj97BSN/ow2362cCXP7GeKa+h5UvmZq0rD4uTL8Mxwlh1LbsoWLv0Fy/aBL3cOlcoO9Wm1qvKzd1qHqZmySdBP7Cbogfogfb98VhCnp38/v8klPP0k1NWo+t1nmqSkgeR6brpqkI6L8Lsz7r2Pwhw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(376002)(396003)(366004)(346002)(39860400002)(4326008)(83380400001)(8936002)(2906002)(54906003)(6486002)(9686003)(6512007)(1076003)(44832011)(316002)(91956017)(64756008)(66476007)(66556008)(66446008)(76116006)(186003)(478600001)(33716001)(86362001)(71200400001)(8676002)(33656002)(6506007)(53546011)(26005)(6916009)(66946007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?NpPgkBF9MTZ5rB3Qfh85v4NqFG8uP1K9znkony8yNxyB4AzFTrcq+Tdce2Yz?=
 =?us-ascii?Q?WigTW6LlJ2FJxdNRpBqtjLkdGnIuQzTGHG3XIkhPzEL1oKa6uOI55KYwi1q2?=
 =?us-ascii?Q?5rs3ph5/KMGLOnbXwXMeMPlyNzVmkv/4O6qXKE4p++wVVlEB9ZvIF22k7kKW?=
 =?us-ascii?Q?xQAsDLGikXwbv+VH1+kuGkl9/gBUkKGYpfb2eGBhcoXGWGgxdykoM9XZBrsf?=
 =?us-ascii?Q?zrufOFDsciytsoLH044vG7pKtQrXP4d4lrOxSGIvyWYBWpp/E2vDw9PYWpkJ?=
 =?us-ascii?Q?W9BoKSaOkKi6zEdIaaBxQg0bkHIR4oVSuk3dJp8n6NhmMKVxKzLWYOIsk3dH?=
 =?us-ascii?Q?GOPHMcGsdmQyNt4BqB0GWrujxf9mLS80rmcT4XYO9hphETeadOjZhdfcGiiz?=
 =?us-ascii?Q?ChrdOwS94F9hle9M+/ny7P0fezNix0WToCJa1wj0dLnsKzTOSf6dRtaZdxE7?=
 =?us-ascii?Q?8myIgH4gfgDmRJp7ceeoaUHqMoU1cZVh4zYKeBEhidixmXuhRh65qXz24XpX?=
 =?us-ascii?Q?6rr+rcPf7xBGUjsHRZ/gf5GGKAF5j2DxHo95lOhE7F3PmO1+Y6IGfwxJ6c1h?=
 =?us-ascii?Q?+Dwo77uOKpDIyauI1rTeqet2U1bfvhJCb2NbQiG/tGDi+o0X0nqj6Q0WBGVW?=
 =?us-ascii?Q?Hah/H6yQ7S4k2Cb/eb5FQ/5nd4yU2SVozQsVLh9i+D8la/VdEwSuEatXSJcR?=
 =?us-ascii?Q?lSoJF4av0gW+81ZNyvTjMzBC6JrATiVDNtiqXCtgtfAAHTGrdpsAyU6ZI4mz?=
 =?us-ascii?Q?s8ate04yTem+XobMv1VYSXEvyH0Ilt+yu1mWb8iP50JkLZ5++uVw+Tc9GHbG?=
 =?us-ascii?Q?j2oilW3EeV7wWKeZnHKCHTDYtfhdRSNVadhAIG57MyV6qbFjap9bJrsGcWhn?=
 =?us-ascii?Q?h2CsEKYsrw/8fZFAlKFMF9qZEhlHRzTwL7EfH8nBHGTkliWjHRJnqtoQzY6J?=
 =?us-ascii?Q?ZVEC+o6SyFwJI97NVRGa5cCiHaTlOR0L+I0yxc5vzU8JpeCDTxPYMT/wpsIC?=
 =?us-ascii?Q?nK/S?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1CBE7137E058894C915D2E6C48B26021@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14996fe3-a864-4027-eaf8-08d8a0b376c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 04:39:52.4275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6o8r2xhYXmXRSIS86dbfTlR+jZtexjVOEbSmTGAL9bP63wi/jxyXgV9zdUh5mCXym0ZCSWfXIS6+n550hluSPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7416
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-10 17:55:38, Fabio Estevam wrote:
> Since 5.10-rc1 i.MX is a devicetree-only platform, and this driver
> was only unsed by the old non-DT i.MX devices.
>=20
> Remove the driver as it has no users left.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Peter Chen <peter.chen@nxp.com>

Peter
> ---
>  drivers/usb/gadget/udc/Kconfig       |   2 +-
>  drivers/usb/gadget/udc/Makefile      |   1 -
>  drivers/usb/gadget/udc/fsl_mxc_udc.c | 122 ---------------------------
>  3 files changed, 1 insertion(+), 124 deletions(-)
>  delete mode 100644 drivers/usb/gadget/udc/fsl_mxc_udc.c
>=20
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kcon=
fig
> index 1a12aab208b4..8c614bb86c66 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -90,7 +90,7 @@ config USB_BCM63XX_UDC
> =20
>  config USB_FSL_USB2
>  	tristate "Freescale Highspeed USB DR Peripheral Controller"
> -	depends on FSL_SOC || ARCH_MXC
> +	depends on FSL_SOC
>  	help
>  	   Some of Freescale PowerPC and i.MX processors have a High Speed
>  	   Dual-Role(DR) USB controller, which supports device mode.
> diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Mak=
efile
> index f5a7ce28aecd..a21f2224e7eb 100644
> --- a/drivers/usb/gadget/udc/Makefile
> +++ b/drivers/usb/gadget/udc/Makefile
> @@ -23,7 +23,6 @@ obj-$(CONFIG_USB_ATMEL_USBA)	+=3D atmel_usba_udc.o
>  obj-$(CONFIG_USB_BCM63XX_UDC)	+=3D bcm63xx_udc.o
>  obj-$(CONFIG_USB_FSL_USB2)	+=3D fsl_usb2_udc.o
>  fsl_usb2_udc-y			:=3D fsl_udc_core.o
> -fsl_usb2_udc-$(CONFIG_ARCH_MXC)	+=3D fsl_mxc_udc.o
>  obj-$(CONFIG_USB_TEGRA_XUDC)	+=3D tegra-xudc.o
>  obj-$(CONFIG_USB_M66592)	+=3D m66592-udc.o
>  obj-$(CONFIG_USB_R8A66597)	+=3D r8a66597-udc.o
> diff --git a/drivers/usb/gadget/udc/fsl_mxc_udc.c b/drivers/usb/gadget/ud=
c/fsl_mxc_udc.c
> deleted file mode 100644
> index 5a321992decc..000000000000
> --- a/drivers/usb/gadget/udc/fsl_mxc_udc.c
> +++ /dev/null
> @@ -1,122 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * Copyright (C) 2009
> - * Guennadi Liakhovetski, DENX Software Engineering, <lg@denx.de>
> - *
> - * Description:
> - * Helper routines for i.MX3x SoCs from Freescale, needed by the fsl_usb=
2_udc.c
> - * driver to function correctly on these systems.
> - */
> -#include <linux/clk.h>
> -#include <linux/delay.h>
> -#include <linux/err.h>
> -#include <linux/fsl_devices.h>
> -#include <linux/mod_devicetable.h>
> -#include <linux/platform_device.h>
> -#include <linux/io.h>
> -
> -#include "fsl_usb2_udc.h"
> -
> -static struct clk *mxc_ahb_clk;
> -static struct clk *mxc_per_clk;
> -static struct clk *mxc_ipg_clk;
> -
> -/* workaround ENGcm09152 for i.MX35 */
> -#define MX35_USBPHYCTRL_OFFSET		0x600
> -#define USBPHYCTRL_OTGBASE_OFFSET	0x8
> -#define USBPHYCTRL_EVDO			(1 << 23)
> -
> -int fsl_udc_clk_init(struct platform_device *pdev)
> -{
> -	struct fsl_usb2_platform_data *pdata;
> -	unsigned long freq;
> -	int ret;
> -
> -	pdata =3D dev_get_platdata(&pdev->dev);
> -
> -	mxc_ipg_clk =3D devm_clk_get(&pdev->dev, "ipg");
> -	if (IS_ERR(mxc_ipg_clk)) {
> -		dev_err(&pdev->dev, "clk_get(\"ipg\") failed\n");
> -		return PTR_ERR(mxc_ipg_clk);
> -	}
> -
> -	mxc_ahb_clk =3D devm_clk_get(&pdev->dev, "ahb");
> -	if (IS_ERR(mxc_ahb_clk)) {
> -		dev_err(&pdev->dev, "clk_get(\"ahb\") failed\n");
> -		return PTR_ERR(mxc_ahb_clk);
> -	}
> -
> -	mxc_per_clk =3D devm_clk_get(&pdev->dev, "per");
> -	if (IS_ERR(mxc_per_clk)) {
> -		dev_err(&pdev->dev, "clk_get(\"per\") failed\n");
> -		return PTR_ERR(mxc_per_clk);
> -	}
> -
> -	clk_prepare_enable(mxc_ipg_clk);
> -	clk_prepare_enable(mxc_ahb_clk);
> -	clk_prepare_enable(mxc_per_clk);
> -
> -	/* make sure USB_CLK is running at 60 MHz +/- 1000 Hz */
> -	if (!strcmp(pdev->id_entry->name, "imx-udc-mx27")) {
> -		freq =3D clk_get_rate(mxc_per_clk);
> -		if (pdata->phy_mode !=3D FSL_USB2_PHY_ULPI &&
> -		    (freq < 59999000 || freq > 60001000)) {
> -			dev_err(&pdev->dev, "USB_CLK=3D%lu, should be 60MHz\n", freq);
> -			ret =3D -EINVAL;
> -			goto eclkrate;
> -		}
> -	}
> -
> -	return 0;
> -
> -eclkrate:
> -	clk_disable_unprepare(mxc_ipg_clk);
> -	clk_disable_unprepare(mxc_ahb_clk);
> -	clk_disable_unprepare(mxc_per_clk);
> -	mxc_per_clk =3D NULL;
> -	return ret;
> -}
> -
> -int fsl_udc_clk_finalize(struct platform_device *pdev)
> -{
> -	struct fsl_usb2_platform_data *pdata =3D dev_get_platdata(&pdev->dev);
> -	int ret =3D 0;
> -
> -	/* workaround ENGcm09152 for i.MX35 */
> -	if (pdata->workaround & FLS_USB2_WORKAROUND_ENGCM09152) {
> -		unsigned int v;
> -		struct resource *res =3D platform_get_resource
> -			(pdev, IORESOURCE_MEM, 0);
> -		void __iomem *phy_regs =3D ioremap(res->start +
> -						MX35_USBPHYCTRL_OFFSET, 512);
> -		if (!phy_regs) {
> -			dev_err(&pdev->dev, "ioremap for phy address fails\n");
> -			ret =3D -EINVAL;
> -			goto ioremap_err;
> -		}
> -
> -		v =3D readl(phy_regs + USBPHYCTRL_OTGBASE_OFFSET);
> -		writel(v | USBPHYCTRL_EVDO,
> -			phy_regs + USBPHYCTRL_OTGBASE_OFFSET);
> -
> -		iounmap(phy_regs);
> -	}
> -
> -
> -ioremap_err:
> -	/* ULPI transceivers don't need usbpll */
> -	if (pdata->phy_mode =3D=3D FSL_USB2_PHY_ULPI) {
> -		clk_disable_unprepare(mxc_per_clk);
> -		mxc_per_clk =3D NULL;
> -	}
> -
> -	return ret;
> -}
> -
> -void fsl_udc_clk_release(void)
> -{
> -	if (mxc_per_clk)
> -		clk_disable_unprepare(mxc_per_clk);
> -	clk_disable_unprepare(mxc_ahb_clk);
> -	clk_disable_unprepare(mxc_ipg_clk);
> -}
> --=20
> 2.17.1
>=20

--=20

Thanks,
Peter Chen=
