Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37751138D96
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 10:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgAMJUi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 04:20:38 -0500
Received: from mail-eopbgr150042.outbound.protection.outlook.com ([40.107.15.42]:48709
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726236AbgAMJUi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jan 2020 04:20:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEdZyR7qIecnZ7bkee8HrKtRGNHI2HzS1lVI+XvtDehgL6fzSXGE+j+oQdbZV7wbJxCkP66hnIkuS7sybGCkQ6tpk2PMfpUFKFIiWHjb9Y6SwIUIO22rqiM6juHbFl23hxMebWBvJ+C7wLuG6HDkS1HkXPSNrDpnw0lWyVB8CeMWKjeFEE3mDh6SptvRTnlrp5wobj9TEZTps5xJs2l3HcQA9Tn8Vx1SPp2ZExU/rcC7/eH+Epsp4krPcDhkjqcdfVWALk79vvipNwAlxPd2Di5BarbXbZw0LBbyz3F7MZTf2GlQ58z9QgEZ42gUntaz1scu0wqoyDZMqoDnMP1OoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LgL9izNlt8iND63LZeinocmoW25igZ5THPHpKXSfK0=;
 b=C61HExFCpsndGn9DBcSlnL5WfyV7Yzz8Tm2MwC4uxwFSKZK9QTWvmTnkrJSgrx3fd6YSJiFGNOwhrfaogIWlD5SiKdTND0bL2nujrrf7XchIeZyJeaiGhdT0Y4qeZnn7E1BlNVha9foHoMCjXAvfhSuOsvOBtj8nPtApRFkY9gSJHMqQ0Ni5OoTfTRhf9Dr0qJ7u4Tgi6rrWaor2JbI/WtjAzMGqPELoxYZzEPQ03H8UxN9o9UL+YzlBB3fvFYV8oWqBA9MF5N+pVnM/YV7+eyPlDZZ15ya3/YqxnCSHNc03htiFIs0uEiljEwwResmzQGZZ+kAuMXxdOAIm4bWOjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LgL9izNlt8iND63LZeinocmoW25igZ5THPHpKXSfK0=;
 b=gQMsYO5PQYoTdJYa9TJ2CZ0GjNV10aeBhfmZGK3DWQSbFBPTl0bi0SLOP97fkllvy7uAn+8NIOBujv4QJ+1Qpq/cS47qiYM++ePsYo0hh8ek4a+MXcx5W6uGcF5oFdk47dH/KOKSduf7Hjd/RdE8KZAUguq7U+fneN/nHd4FYt4=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB6222.eurprd04.prod.outlook.com (20.179.24.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Mon, 13 Jan 2020 09:20:30 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 09:20:29 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Roger Quadros <rogerq@ti.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v2 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Topic: [PATCH v2 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Index: AQHVxtDDYQC8DMUxY0O1pFYdKmO/zqfiQJuAgAYXJYA=
Date:   Mon, 13 Jan 2020 09:20:29 +0000
Message-ID: <20200113092027.GK17599@b29397-desktop>
References: <1578562558-32462-1-git-send-email-peter.chen@nxp.com>
 <54bba779-c064-e476-2960-896cf3eb4e81@ti.com>
In-Reply-To: <54bba779-c064-e476-2960-896cf3eb4e81@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fbe54c4d-a5ed-44c3-c1f5-08d79809d57b
x-ms-traffictypediagnostic: VI1PR04MB6222:|VI1PR04MB6222:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6222EB2293E44FC94AD7F1598B350@VI1PR04MB6222.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(346002)(39860400002)(366004)(376002)(136003)(396003)(189003)(199004)(54906003)(2906002)(8936002)(9686003)(6512007)(53546011)(66476007)(4326008)(26005)(66446008)(64756008)(6506007)(1076003)(44832011)(66556008)(91956017)(76116006)(6486002)(8676002)(6916009)(33716001)(86362001)(478600001)(316002)(186003)(33656002)(81166006)(81156014)(66946007)(5660300002)(71200400001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6222;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1su5cpwBdsESfpEamZZK9CbGSF7mV71lSUpIs7R27ZrjWFxADmpO4tHezt3bUPU839cNIMmy91BsQ7V/Q4TFpdSjR3Kdj5BRIdV3u36hGaj5I6HJ2IuTWyHEdX+wOk3pDX7h33X75fXmw+DIQxF7ajvWnTwAEAZr9TSxpC0WG5VlJHbUFS4f+APGlzqdxyTjBK6OtMiukBWK8hjK3Q6HI7bFkXD5NBwePunH0npfxCji2naSX4BcmipkdA8wDoQm9aQ8rCpge+BiNoVJ3de9wGfaoQgnMw/aEU6DqOLCbyEIScSkarSBX/xslI5/eLDm3PjMTXbRoN+y8USE2DRyuEQOXU7hDvEfUgeD09wMs3hdtqCZOUJuzJ22ThA26yhsZ7QObuHQE1Qjn+KGgsVjW7wbxiWSnG67XdHs83shFJZaOGKbsfgVur9kcnIfTSXUJUES70i5CpDIBnKkFpt8GIuBiJBt/S7Ls3r4Yf4qj67uAnl5+hBkziAc3LypFxLI
Content-Type: text/plain; charset="us-ascii"
Content-ID: <231E118726303F40A1CA1BF0F4E57B44@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe54c4d-a5ed-44c3-c1f5-08d79809d57b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 09:20:29.8870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V+GUS84GluhZbmioOV6rLYDK7QDErnNoLA+BM6Y1zqRShUvBegLE9UxIPrkC80d3Px9xgHULOGdsGHjjI9nUlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6222
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-01-09 14:20:03, Roger Quadros wrote:
> Hi Peter,
>=20
> On 09/01/2020 11:35, Peter Chen wrote:
> > There is a Cadence USB3 core for imx8qm and imx8qxp SoCs, the cdns
> > core is the child for this glue layer device.
> >=20
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> > Changes for v2:
> > - Add COMPILE_TEST Kconfig option
> > - Using BIT Macro for definition
> > - Delete runtime pm operation
> >=20
> >   drivers/usb/cdns3/Kconfig     |  10 ++
> >   drivers/usb/cdns3/Makefile    |   1 +
> >   drivers/usb/cdns3/cdns3-imx.c | 216 +++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 227 insertions(+)
> >   create mode 100644 drivers/usb/cdns3/cdns3-imx.c
> >=20
> > diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> > index 2a1e89d12ed9..84716d216ae5 100644
> > --- a/drivers/usb/cdns3/Kconfig
> > +++ b/drivers/usb/cdns3/Kconfig
> > @@ -53,4 +53,14 @@ config USB_CDNS3_TI
> >   	  e.g. J721e.
> > +config USB_CDNS3_IMX
> > +	tristate "Cadence USB3 support on NXP i.MX platforms"
> > +	depends on ARCH_MXC || COMPILE_TEST
> > +	default USB_CDNS3
> > +	help
> > +	  Say 'Y' or 'M' here if you are building for NXP i.MX
> > +	  platforms that contain Cadence USB3 controller core.
> > +
> > +	  For example, imx8qm and imx8qxp.
> > +
> >   endif
> > diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
> > index 948e6b88d1a9..d47e341a6f39 100644
> > --- a/drivers/usb/cdns3/Makefile
> > +++ b/drivers/usb/cdns3/Makefile
> > @@ -15,3 +15,4 @@ cdns3-$(CONFIG_USB_CDNS3_HOST)		+=3D host.o
> >   obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+=3D cdns3-pci-wrap.o
> >   obj-$(CONFIG_USB_CDNS3_TI)		+=3D cdns3-ti.o
> > +obj-$(CONFIG_USB_CDNS3_IMX)		+=3D cdns3-imx.o
> > diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-im=
x.c
> > new file mode 100644
> > index 000000000000..aba988e71958
> > --- /dev/null
> > +++ b/drivers/usb/cdns3/cdns3-imx.c
> > @@ -0,0 +1,216 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/**
> > + * cdns3-imx.c - NXP i.MX specific Glue layer for Cadence USB Controll=
er
> > + *
> > + * Copyright (C) 2019 NXP
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/io.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/iopoll.h>
> > +
> > +#define USB3_CORE_CTRL1    0x00
> > +#define USB3_CORE_CTRL2    0x04
> > +#define USB3_INT_REG       0x08
> > +#define USB3_CORE_STATUS   0x0c
> > +#define XHCI_DEBUG_LINK_ST 0x10
> > +#define XHCI_DEBUG_BUS     0x14
> > +#define USB3_SSPHY_CTRL1   0x40
> > +#define USB3_SSPHY_CTRL2   0x44
> > +#define USB3_SSPHY_STATUS  0x4c
> > +#define USB2_PHY_CTRL1     0x50
> > +#define USB2_PHY_CTRL2     0x54
> > +#define USB2_PHY_STATUS    0x5c
> > +
> > +/* Register bits definition */
> > +
> > +/* USB3_CORE_CTRL1 */
> > +#define SW_RESET_MASK	(0x3f << 26)
> > +#define PWR_SW_RESET	BIT(31)
> > +#define APB_SW_RESET	BIT(30)
> > +#define AXI_SW_RESET	BIT(29)
> > +#define RW_SW_RESET	BIT(28)
> > +#define PHY_SW_RESET	BIT(27)
> > +#define PHYAHB_SW_RESET	BIT(26)
> > +#define ALL_SW_RESET	(PWR_SW_RESET | APB_SW_RESET | AXI_SW_RESET | \
> > +		RW_SW_RESET | PHY_SW_RESET | PHYAHB_SW_RESET)
> > +#define OC_DISABLE	BIT(9)
> > +#define MDCTRL_CLK_SEL	BIT(7)
> > +#define MODE_STRAP_MASK	(0x7)
> > +#define DEV_MODE	(1 << 2)
> > +#define HOST_MODE	(1 << 1)
> > +#define OTG_MODE	(1 << 0)
> > +
> > +/* USB3_INT_REG */
> > +#define CLK_125_REQ	BIT(29)
> > +#define LPM_CLK_REQ	BIT(28)
> > +#define DEVU3_WAEKUP_EN	BIT(14)
> > +#define OTG_WAKEUP_EN	BIT(12)
> > +#define DEV_INT_EN (3 << 8) /* DEV INT b9:8 */
> > +#define HOST_INT1_EN (1 << 0) /* HOST INT b7:0 */
> > +
> > +/* USB3_CORE_STATUS */
> > +#define MDCTRL_CLK_STATUS	BIT(15)
> > +#define DEV_POWER_ON_READY	BIT(13)
> > +#define HOST_POWER_ON_READY	BIT(12)
> > +
> > +/* USB3_SSPHY_STATUS */
> > +#define CLK_VALID_MASK		(0x3f << 26)
> > +#define CLK_VALID_COMPARE_BITS	(0xf << 28)
> > +#define PHY_REFCLK_REQ		(1 << 0)
> > +
> > +struct cdns_imx {
> > +	struct device *dev;
> > +	void __iomem *noncore;
> > +	struct clk_bulk_data *clks;
> > +	int num_clks;
> > +};
> > +
> > +static inline u32 cdns_imx_readl(struct cdns_imx *data, u32 offset)
> > +{
> > +	return readl(data->noncore + offset);
> > +}
> > +
> > +static inline void cdns_imx_writel(struct cdns_imx *data, u32 offset, =
u32 value)
> > +{
> > +	writel(value, data->noncore + offset);
> > +}
> > +
> > +static const struct clk_bulk_data imx_cdns3_core_clks[] =3D {
> > +	{ .id =3D "usb3_lpm_clk" },
> > +	{ .id =3D "usb3_bus_clk" },
> > +	{ .id =3D "usb3_aclk" },
> > +	{ .id =3D "usb3_ipg_clk" },
> > +	{ .id =3D "usb3_core_pclk" },
> > +};
> > +
> > +static int cdns_imx_noncore_init(struct cdns_imx *data)
> > +{
> > +	u32 value;
> > +	int ret;
> > +	struct device *dev =3D data->dev;
> > +
> > +	cdns_imx_writel(data, USB3_SSPHY_STATUS, CLK_VALID_MASK);
> > +	udelay(1);
> > +	ret =3D readl_poll_timeout(data->noncore + USB3_SSPHY_STATUS, value,
> > +		(value & CLK_VALID_COMPARE_BITS) =3D=3D CLK_VALID_COMPARE_BITS,
> > +		10, 100000);
> > +	if (ret) {
> > +		dev_err(dev, "wait clkvld timeout\n");
> > +		return ret;
> > +	}
> > +
> > +	value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
> > +	value |=3D ALL_SW_RESET;
> > +	cdns_imx_writel(data, USB3_CORE_CTRL1, value);
> > +	udelay(1);
> > +
> > +	value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
> > +	value =3D (value & ~MODE_STRAP_MASK) | OTG_MODE | OC_DISABLE;
> > +	cdns_imx_writel(data, USB3_CORE_CTRL1, value);
> > +
> > +	value =3D cdns_imx_readl(data, USB3_INT_REG);
> > +	value |=3D HOST_INT1_EN | DEV_INT_EN;
> > +	cdns_imx_writel(data, USB3_INT_REG, value);
> > +
> > +	value =3D cdns_imx_readl(data, USB3_CORE_CTRL1);
> > +	value &=3D ~ALL_SW_RESET;
> > +	cdns_imx_writel(data, USB3_CORE_CTRL1, value);
> > +	return ret;
> > +}
> > +
> > +static int cdns_imx_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *node =3D dev->of_node;
> > +	struct cdns_imx *data;
> > +	int ret;
> > +
> > +	if (!node)
> > +		return -ENODEV;
> > +
> > +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, data);
> > +	data->dev =3D dev;
> > +	data->noncore =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(data->noncore)) {
> > +		dev_err(dev, "can't map IOMEM resource\n");
> > +		return PTR_ERR(data->noncore);
> > +	}
> > +
> > +	data->num_clks =3D ARRAY_SIZE(imx_cdns3_core_clks);
> > +	data->clks =3D (struct clk_bulk_data *)imx_cdns3_core_clks;
> > +	ret =3D devm_clk_bulk_get(dev, data->num_clks, data->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D clk_bulk_prepare_enable(data->num_clks, data->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D cdns_imx_noncore_init(data);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret =3D of_platform_populate(node, NULL, NULL, dev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to create children: %d\n", ret);
> > +		goto err;
> > +	}
> > +
> > +	return ret;
> > +
> > +err:
> > +	clk_bulk_disable_unprepare(data->num_clks, data->clks);
> > +	return ret;
> > +}
> > +
> > +static int cdns_imx_remove_core(struct device *dev, void *data)
> > +{
> > +	struct platform_device *pdev =3D to_platform_device(dev);
> > +
> > +	platform_device_unregister(pdev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int cdns_imx_remove(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +
> > +	device_for_each_child(dev, NULL, cdns_imx_remove_core);
>=20
> clk_bulk_disable_unprepare()?
>=20

I will add it, thanks.

--=20

Thanks,
Peter Chen=
