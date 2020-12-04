Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5073B2CE588
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 03:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgLDCIH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 21:08:07 -0500
Received: from mail-am6eur05on2054.outbound.protection.outlook.com ([40.107.22.54]:2017
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725885AbgLDCIH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Dec 2020 21:08:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pvw/zOMDNgg2jmMqReXPtgbewTmoJZG8F3Pn2KzG6uISrXIW5NAJxnJs1MXpCjts0QN8iIWUuFgwI+auQi9JtgRAyjEDohKFOXXglDdcKuBXia2NQnmXEWshMX17KTHZoS+0H4nNEpmIq7QU466J0hAOaiNOGm7eKQy/O6/t/svBMNFl6SI0y2zSzyiC7iiol/yc+VxX/1Cb+yfJod8/CX1Od12PcszE/kCFvuGf3e1dQoI7MNyLE3+9Tm99uj6zzTYYtOhzsBHiCm5/CmXI1ZFLqnApfunIYNrYM4ggOfmiSNgOfOtuevTPiEOV9vUgEhvjaDYwMKcxHK6rwRVl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5IBZZQtyasKrRtY47iqlWB/NajTeKqlfpAsoJ7I8do=;
 b=Mgmp483O88Y+GkDxfM3LzSNGhcuO6KkgmRsJc5vH7tuzQzb6ssQz3HP/1J37Wi/sUgF6K27fiTgkpdPUc4d3Zft2YkUG6hxoqCFn6Da5PcG9w79H67XWkZna3QPTjPjSw1Vcn/f3S0HoyxSBbTfGRNLtziwMWEOq3e/LU86yLa9uU8594+g88AjkZMQIAOb1rFkkgtl1ffHfB+rRguz+soRpPKirZPY65oovWjDw743w8OsruJvZm3l+lRmh8MkUEJTnGqPthRWMkleyab7vWwsfyr/NtnrdVHb1olZ2041geisydqRjH2+bMyi9GmekEulcaddDy+8+DNKDkiXa9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5IBZZQtyasKrRtY47iqlWB/NajTeKqlfpAsoJ7I8do=;
 b=Dxp9v3p3lvzkQqOFvocdH02tZsrXc33XyICIwobM73egrzSmHKRxHCREroiBjmeNvTB5enLDcGyXNm1H07HDruCHAQr7ybFlyTHrKxf9RJPhU6piQ4fMrZNeOXzqRaMoFKPCMuUz2u+JevsdbrTS4xCIwTFyOrsyG/1Lf7iTn8Q=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB6928.eurprd04.prod.outlook.com (2603:10a6:803:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 02:07:16 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 02:07:16 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "krzk@kernel.org" <krzk@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Andy Duan <fugang.duan@nxp.com>,
        Horia Geanta <horia.geanta@nxp.com>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Peter Chen <peter.chen@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: RE: [PATCH v5 2/4] usb: dwc3: add imx8mp dwc3 glue layer driver
Thread-Topic: [PATCH v5 2/4] usb: dwc3: add imx8mp dwc3 glue layer driver
Thread-Index: AQHWmX2tZnFRc2Tm2UiIKp0bz566y6nmkKQw
Date:   Fri, 4 Dec 2020 02:07:16 +0000
Message-ID: <VE1PR04MB65286866D241D2E04CE9D1AB89F10@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1601726527-23326-1-git-send-email-jun.li@nxp.com>
 <1601726527-23326-3-git-send-email-jun.li@nxp.com>
In-Reply-To: <1601726527-23326-3-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 59b72060-34e4-450c-e22d-08d897f952ec
x-ms-traffictypediagnostic: VI1PR04MB6928:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6928B1FCCC436A02EFEC54F489F10@VI1PR04MB6928.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:428;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n8bJ1Wzioc98fNKJukY6xZK389XtaStV4RHSyCC30xjWB7MvvMkO1PHkX2kX0JkcaBuKeFsVJKSYlk49I3PW7zVDNw3SyGR/E+rWRP1bq2oID/rwNMhIT0Zwqv7QERDmtlA3OeqwDVbYlVM+Iu/9heCnKNvpS/8Bk5nBh+tDiEmOxiXmHqaJZX8DOhV63hN9PplWHL5zCsYJeNiTY4g8yF49KpP2RpW1azAooNCXsvypW8lb2ywTdiy9usOV2JK8Dea8eVQzIJCX1JOr++EQNOW0Oa/ne9B1OsPQZPegtXwI4LNq8/sxBCWTpUJEuT7s5JgBw/yuOMLD9ouYHUZymam9U4J/ehCdA9GTT7V694qSYmmbRxGOHQSeEvWYdjly
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(2906002)(83380400001)(186003)(9686003)(7696005)(7416002)(8936002)(71200400001)(26005)(316002)(6506007)(8676002)(33656002)(478600001)(4326008)(44832011)(64756008)(5660300002)(66446008)(52536014)(30864003)(6916009)(53546011)(66556008)(55016002)(66946007)(66476007)(54906003)(76116006)(86362001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?sBfG2ZbnQN7v88JKwjy0jBR6D8ZUu0ierbK0KmIUNDP6Dn8BVTPu3ayaFQSx?=
 =?us-ascii?Q?d7vqBh1djnON4O/3IkfhdYtmxW86QN5Ddkh23c2boXh6HwCY3tGFdHEMLq1Q?=
 =?us-ascii?Q?Nvrj2AcSib8ySvHr4j+jK6RFdMe3yns/dtSQK+8x1ys9dyKBzltxRFE6i1vR?=
 =?us-ascii?Q?vxnlwxt8oeTZu+eyDV3JbwbonyK632vc0SJf3AxwSN6Yvis3lVHqiwLtuXrp?=
 =?us-ascii?Q?q7gItWAx2xItDzTpahI3CceiVn9O9CmzeYpDCkYVwIYw/KC4976Lkj1OXTPM?=
 =?us-ascii?Q?jS+qSODzsTEDFXOSzcdWsZsEziYl9TJi/rZ0ufnpSU7bba0k3Vkc+k87diq/?=
 =?us-ascii?Q?VcGym876hg8ufSau3eCYQ52JSsxb1jVZZX4/5C2pEUemCAZLhYu8EKsAeiMO?=
 =?us-ascii?Q?wxCsLycnbxOowASf71sIXpGtmLHH/iSDZR1z/IbwH6DorcBgPVdXG84ZI1yd?=
 =?us-ascii?Q?ybZukOsQzEkIcpcoS9sgwxMKWo+d5g6IcxHC3UQo/Pxau0B1s/VMGa9VUKos?=
 =?us-ascii?Q?GnEKUiZAIOzDEyDZd04CF0E+wU2iVVQlXgBuP5EgNsjO5pHr5R3xiJM968VB?=
 =?us-ascii?Q?yKtH8UN5C9uU5yzam4vRlVA43KXEAFfE0Ks8n1YasKAd15CXIUCADACy5VgS?=
 =?us-ascii?Q?0gIm2YKbUK4SmqsyGm1ARl7Cit5L459j5WAKJxIHPsszEsbK1tlmisAnKRkW?=
 =?us-ascii?Q?hLsQzU8WK7VsWMYPj39psEAQiR/kxH/Kl+UYYq6U/KHM7uQhAh+Ya/dYogIm?=
 =?us-ascii?Q?sfJT9vWHGIhnqQ75FHmVb6cw/1hBivO7tUJBU/VnRClVQU/XVT+T5wquUBRH?=
 =?us-ascii?Q?8leapZMuP9W0FdAkMv4HJbSY4KA65dCXp5o4uSrNtvV+pizkVW4hoIx0jv2S?=
 =?us-ascii?Q?wMTRaO0wpjgjY6cBHm+FnvE64HYH9FtWDWghORn5qjHf7eADKpplh/3ufNMY?=
 =?us-ascii?Q?JxvK6qKNvVWP5EKmpAQne8e/AxaC49+EIdo8KK4H1Zg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b72060-34e4-450c-e22d-08d897f952ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2020 02:07:16.5243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gOAw83oEJRyJZboXek1geDoWT/Y/381jSwPMFPRgkfwL98VppRUipcz4AYlsYdU8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6928
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

> -----Original Message-----
> From: Jun Li <jun.li@nxp.com>
> Sent: Saturday, October 3, 2020 8:02 PM
> To: robh+dt@kernel.org; shawnguo@kernel.org; balbi@kernel.org
> Cc: krzk@kernel.org; gregkh@linuxfoundation.org; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx
> <linux-imx@nxp.com>; Anson Huang <anson.huang@nxp.com>; Jun Li
> <jun.li@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; Andy Duan <fugang.duan@nxp.com>; Horia Geanta
> <horia.geanta@nxp.com>; Joakim Zhang <qiangqing.zhang@nxp.com>; Peter Che=
n
> <peter.chen@nxp.com>; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org
> Subject: [PATCH v5 2/4] usb: dwc3: add imx8mp dwc3 glue layer driver
>=20
> imx8mp SoC integrate dwc3 3.30b IP and has some customizations to support
> low power, which has a seprated wakeup irq and additional logic to wakeup
> usb from low power mode both for host mode and device mode.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/dwc3/Kconfig       |  10 ++
>  drivers/usb/dwc3/Makefile      |   1 +
>  drivers/usb/dwc3/dwc3-imx8mp.c | 363
> +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 374 insertions(+)
>=20
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig index
> 7a23045..2133acf 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -139,4 +139,14 @@ config USB_DWC3_QCOM
>  	  for peripheral mode support.
>  	  Say 'Y' or 'M' if you have one such device.
>=20
> +config USB_DWC3_IMX8MP
> +	tristate "NXP iMX8MP Platform"
> +	depends on OF && COMMON_CLK
> +	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
> +	default USB_DWC3
> +	help
> +	  NXP iMX8M Plus SoC use DesignWare Core IP for USB2/3
> +	  functionality.
> +	  Say 'Y' or 'M' if you have one such device.
> +
>  endif
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile index
> ae86da0..2259f88 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -51,3 +51,4 @@ obj-$(CONFIG_USB_DWC3_MESON_G12A)	+=3D
> dwc3-meson-g12a.o
>  obj-$(CONFIG_USB_DWC3_OF_SIMPLE)	+=3D dwc3-of-simple.o
>  obj-$(CONFIG_USB_DWC3_ST)		+=3D dwc3-st.o
>  obj-$(CONFIG_USB_DWC3_QCOM)		+=3D dwc3-qcom.o
> +obj-$(CONFIG_USB_DWC3_IMX8MP)		+=3D dwc3-imx8mp.o
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c
> b/drivers/usb/dwc3/dwc3-imx8mp.c new file mode 100644 index
> 0000000..75f0042
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -0,0 +1,363 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**
> + * dwc3-imx8mp.c - NXP imx8mp Specific Glue layer
> + *
> + * Copyright (c) 2020 NXP.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "core.h"
> +
> +/* USB wakeup registers */
> +#define USB_WAKEUP_CTRL			0x00
> +
> +/* Global wakeup interrupt enable, also used to clear interrupt */
> +#define USB_WAKEUP_EN			BIT(31)
> +/* Wakeup from connect or disconnect, only for superspeed */
> +#define USB_WAKEUP_SS_CONN		BIT(5)
> +/* 0 select vbus_valid, 1 select sessvld */
> +#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
> +/* Enable signal for wake up from u3 state */
> +#define USB_WAKEUP_U3_EN		BIT(3)
> +/* Enable signal for wake up from id change */
> +#define USB_WAKEUP_ID_EN		BIT(2)
> +/* Enable signal for wake up from vbus change */
> +#define	USB_WAKEUP_VBUS_EN		BIT(1)
> +/* Enable signal for wake up from dp/dm change */
> +#define USB_WAKEUP_DPDM_EN		BIT(0)
> +
> +#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
> +
> +struct dwc3_imx8mp {
> +	struct device			*dev;
> +	struct platform_device		*dwc3;
> +	void __iomem			*glue_base;
> +	struct clk			*hsio_clk;
> +	struct clk			*suspend_clk;
> +	int				irq;
> +	bool				pm_suspended;
> +	bool				wakeup_pending;
> +};
> +
> +static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx) {
> +	struct dwc3	*dwc3 =3D platform_get_drvdata(dwc3_imx->dwc3);
> +	u32		val;
> +
> +	if (!dwc3)
> +		return;
> +
> +	val =3D readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
> +
> +	if ((dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc3->xhci)
> +		val |=3D USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
> +		       USB_WAKEUP_U3_EN | USB_WAKEUP_DPDM_EN;
> +	else if (dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
> +		val |=3D USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
> +		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
> +
> +	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL); }
> +
> +static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8mp *dwc3_imx) {
> +	u32 val;
> +
> +	val =3D readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
> +	val &=3D ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
> +	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL); }
> +
> +static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx) {
> +	struct dwc3_imx8mp	*dwc3_imx =3D _dwc3_imx;
> +	struct dwc3		*dwc =3D platform_get_drvdata(dwc3_imx->dwc3);
> +
> +	if (!dwc3_imx->pm_suspended)
> +		return IRQ_HANDLED;
> +
> +	disable_irq_nosync(dwc3_imx->irq);
> +	dwc3_imx->wakeup_pending =3D true;
> +
> +	if ((dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
> +		pm_runtime_resume(&dwc->xhci->dev);
> +	else if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
> +		pm_runtime_get(dwc->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int dwc3_imx8mp_probe(struct platform_device *pdev) {
> +	struct device		*dev =3D &pdev->dev;
> +	struct device_node	*dwc3_np, *node =3D dev->of_node;
> +	struct dwc3_imx8mp	*dwc3_imx;
> +	int			err, irq;
> +
> +	if (!node) {
> +		dev_err(dev, "device node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	dwc3_imx =3D devm_kzalloc(dev, sizeof(*dwc3_imx), GFP_KERNEL);
> +	if (!dwc3_imx)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, dwc3_imx);
> +
> +	dwc3_imx->dev =3D dev;
> +
> +	dwc3_imx->glue_base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dwc3_imx->glue_base))
> +		return PTR_ERR(dwc3_imx->glue_base);
> +
> +	dwc3_imx->hsio_clk =3D devm_clk_get(dev, "hsio");
> +	if (IS_ERR(dwc3_imx->hsio_clk)) {
> +		err =3D PTR_ERR(dwc3_imx->hsio_clk);
> +		dev_err(dev, "Failed to get hsio clk, err=3D%d\n", err);
> +		return err;
> +	}
> +
> +	err =3D clk_prepare_enable(dwc3_imx->hsio_clk);
> +	if (err) {
> +		dev_err(dev, "Failed to enable hsio clk, err=3D%d\n", err);
> +		return err;
> +	}
> +
> +	dwc3_imx->suspend_clk =3D devm_clk_get(dev, "suspend");
> +	if (IS_ERR(dwc3_imx->suspend_clk)) {
> +		err =3D PTR_ERR(dwc3_imx->suspend_clk);
> +		dev_err(dev, "Failed to get suspend clk, err=3D%d\n", err);
> +		goto disable_hsio_clk;
> +	}
> +
> +	err =3D clk_prepare_enable(dwc3_imx->suspend_clk);
> +	if (err) {
> +		dev_err(dev, "Failed to enable suspend clk, err=3D%d\n", err);
> +		goto disable_hsio_clk;
> +	}
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		err =3D irq;
> +		goto disable_clks;
> +	}
> +	dwc3_imx->irq =3D irq;
> +
> +	err =3D devm_request_threaded_irq(dev, irq, NULL, dwc3_imx8mp_interrupt=
,
> +					IRQF_ONESHOT, dev_name(dev), dwc3_imx);
> +	if (err) {
> +		dev_err(dev, "failed to request IRQ #%d --> %d\n", irq, err);
> +		goto disable_clks;
> +	}
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	err =3D pm_runtime_get_sync(dev);
> +	if (err < 0)
> +		goto disable_rpm;
> +
> +	dwc3_np =3D of_get_child_by_name(node, "dwc3");
> +	if (!dwc3_np) {
> +		dev_err(dev, "failed to find dwc3 core child\n");
> +		goto disable_rpm;
> +	}
> +
> +	err =3D of_platform_populate(node, NULL, NULL, dev);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to create dwc3 core\n");
> +		goto err_node_put;
> +	}
> +
> +	dwc3_imx->dwc3 =3D of_find_device_by_node(dwc3_np);
> +	if (!dwc3_imx->dwc3) {
> +		dev_err(dev, "failed to get dwc3 platform device\n");
> +		err =3D -ENODEV;
> +		goto depopulate;
> +	}
> +	of_node_put(dwc3_np);
> +
> +	device_set_wakeup_capable(dev, true);
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +
> +depopulate:
> +	of_platform_depopulate(dev);
> +err_node_put:
> +	of_node_put(dwc3_np);
> +disable_rpm:
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
> +disable_clks:
> +	clk_disable_unprepare(dwc3_imx->suspend_clk);
> +disable_hsio_clk:
> +	clk_disable_unprepare(dwc3_imx->hsio_clk);
> +
> +	return err;
> +}
> +
> +static int dwc3_imx8mp_remove(struct platform_device *pdev) {
> +	struct dwc3_imx8mp *dwc3_imx =3D platform_get_drvdata(pdev);
> +	struct device *dev =3D &pdev->dev;
> +
> +	pm_runtime_get_sync(dev);
> +	of_platform_depopulate(dev);
> +
> +	clk_disable_unprepare(dwc3_imx->suspend_clk);
> +	clk_disable_unprepare(dwc3_imx->hsio_clk);
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dwc3_imx8mp_suspend(struct dwc3_imx8mp
> *dwc3_imx,
> +					      pm_message_t msg)
> +{
> +	if (dwc3_imx->pm_suspended)
> +		return 0;
> +
> +	/* Wakeup enable */
> +	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc3_imx->dev))
> +		dwc3_imx8mp_wakeup_enable(dwc3_imx);
> +
> +	dwc3_imx->pm_suspended =3D true;
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dwc3_imx8mp_resume(struct dwc3_imx8mp
> *dwc3_imx,
> +					     pm_message_t msg)
> +{
> +	struct dwc3	*dwc =3D platform_get_drvdata(dwc3_imx->dwc3);
> +	int ret =3D 0;
> +
> +	if (!dwc3_imx->pm_suspended)
> +		return 0;
> +
> +	/* Wakeup disable */
> +	dwc3_imx8mp_wakeup_disable(dwc3_imx);
> +	dwc3_imx->pm_suspended =3D false;
> +
> +	if (dwc3_imx->wakeup_pending) {
> +		dwc3_imx->wakeup_pending =3D false;
> +		if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE) {
> +			pm_runtime_mark_last_busy(dwc->dev);
> +			pm_runtime_put_autosuspend(dwc->dev);
> +		} else {
> +			/*
> +			 * Add wait for xhci switch from suspend
> +			 * clock to normal clock to detect connection.
> +			 */
> +			usleep_range(9000, 10000);
> +		}
> +		enable_irq(dwc3_imx->irq);
> +	}
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused dwc3_imx8mp_pm_suspend(struct device *dev) {
> +	struct dwc3_imx8mp *dwc3_imx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D dwc3_imx8mp_suspend(dwc3_imx, PMSG_SUSPEND);
> +
> +	if (device_may_wakeup(dwc3_imx->dev))
> +		enable_irq_wake(dwc3_imx->irq);
> +	else
> +		clk_disable_unprepare(dwc3_imx->suspend_clk);
> +
> +	clk_disable_unprepare(dwc3_imx->hsio_clk);
> +	dev_dbg(dev, "dwc3 imx8mp pm suspend.\n");
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused dwc3_imx8mp_pm_resume(struct device *dev) {
> +	struct dwc3_imx8mp *dwc3_imx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (device_may_wakeup(dwc3_imx->dev)) {
> +		disable_irq_wake(dwc3_imx->irq);
> +	} else {
> +		ret =3D clk_prepare_enable(dwc3_imx->suspend_clk);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(dwc3_imx->hsio_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dwc3_imx8mp_resume(dwc3_imx, PMSG_RESUME);
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	dev_dbg(dev, "dwc3 imx8mp pm resume.\n");
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused dwc3_imx8mp_runtime_suspend(struct device
> +*dev) {
> +	struct dwc3_imx8mp *dwc3_imx =3D dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "dwc3 imx8mp runtime suspend.\n");
> +
> +	return dwc3_imx8mp_suspend(dwc3_imx, PMSG_AUTO_SUSPEND); }
> +
> +static int __maybe_unused dwc3_imx8mp_runtime_resume(struct device
> +*dev) {
> +	struct dwc3_imx8mp *dwc3_imx =3D dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "dwc3 imx8mp runtime resume.\n");
> +
> +	return dwc3_imx8mp_resume(dwc3_imx, PMSG_AUTO_RESUME); }
> +
> +static const struct dev_pm_ops dwc3_imx8mp_dev_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_imx8mp_pm_suspend,
> dwc3_imx8mp_pm_resume)
> +	SET_RUNTIME_PM_OPS(dwc3_imx8mp_runtime_suspend,
> +			   dwc3_imx8mp_runtime_resume, NULL) };
> +
> +static const struct of_device_id dwc3_imx8mp_of_match[] =3D {
> +	{ .compatible =3D "fsl,imx8mp-dwc3", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, dwc3_imx8mp_of_match);
> +
> +static struct platform_driver dwc3_imx8mp_driver =3D {
> +	.probe		=3D dwc3_imx8mp_probe,
> +	.remove		=3D dwc3_imx8mp_remove,
> +	.driver		=3D {
> +		.name	=3D "imx8mp-dwc3",
> +		.pm	=3D &dwc3_imx8mp_dev_pm_ops,
> +		.of_match_table	=3D dwc3_imx8mp_of_match,
> +	},
> +};
> +
> +module_platform_driver(dwc3_imx8mp_driver);
> +
> +MODULE_ALIAS("platform:imx8mp-dwc3");
> +MODULE_AUTHOR("jun.li@nxp.com");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("DesignWare USB3 imx8mp Glue Layer");
> --
> 2.7.4

A gentle ping.

Thanks
Li Jun

