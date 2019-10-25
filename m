Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A19E41F3
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2019 05:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391738AbfJYDJI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 23:09:08 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:7906 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2389230AbfJYDJI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 23:09:08 -0400
X-UUID: 49568c31a3bd4ae7aa666cd7b3e49b89-20191025
X-UUID: 49568c31a3bd4ae7aa666cd7b3e49b89-20191025
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1986252158; Fri, 25 Oct 2019 09:49:48 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 25 Oct
 2019 09:49:45 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 25 Oct 2019 09:49:44 +0800
Message-ID: <1571968186.18464.3.camel@mhfsdcap03>
Subject: Re: [PATCH v3 2/2] usb: cdns3: Add TI specific wrapper driver
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Roger Quadros <rogerq@ti.com>
CC:     <felipe.balbi@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <pawell@cadence.com>, <peter.chen@nxp.com>, <nsekhar@ti.com>,
        <kurahul@cadence.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Date:   Fri, 25 Oct 2019 09:49:46 +0800
In-Reply-To: <20191024114717.30984-3-rogerq@ti.com>
References: <20191024114717.30984-1-rogerq@ti.com>
         <20191024114717.30984-3-rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 3AC33AF4A9FE5BD081ED7950EDBEB3978C63142DE1505C4174253A93B01C45552000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2019-10-24 at 14:47 +0300, Roger Quadros wrote:
> The J721e platform comes with 2 Cadence USB3 controller
> instances. This driver supports the TI specific wrapper
> on this platform.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> ---
>  drivers/usb/cdns3/Kconfig    |  10 ++
>  drivers/usb/cdns3/Makefile   |   1 +
>  drivers/usb/cdns3/cdns3-ti.c | 236 +++++++++++++++++++++++++++++++++++
>  3 files changed, 247 insertions(+)
>  create mode 100644 drivers/usb/cdns3/cdns3-ti.c
> 
> diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> index d0331613a355..2a1e89d12ed9 100644
> --- a/drivers/usb/cdns3/Kconfig
> +++ b/drivers/usb/cdns3/Kconfig
> @@ -43,4 +43,14 @@ config USB_CDNS3_PCI_WRAP
>  	  If you choose to build this driver as module it will
>  	  be dynamically linked and module will be called cdns3-pci.ko
>  
> +config USB_CDNS3_TI
> +	tristate "Cadence USB3 support on TI platforms"
> +	depends on ARCH_K3 || COMPILE_TEST
> +	default USB_CDNS3
> +	help
> +	  Say 'Y' or 'M' here if you are building for Texas Instruments
> +	  platforms that contain Cadence USB3 controller core.
> +
> +	  e.g. J721e.
> +
>  endif
> diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
> index a703547350bb..948e6b88d1a9 100644
> --- a/drivers/usb/cdns3/Makefile
> +++ b/drivers/usb/cdns3/Makefile
> @@ -14,3 +14,4 @@ endif
>  cdns3-$(CONFIG_USB_CDNS3_HOST)		+= host.o
>  
>  obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+= cdns3-pci-wrap.o
> +obj-$(CONFIG_USB_CDNS3_TI)		+= cdns3-ti.o
> diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
> new file mode 100644
> index 000000000000..89620e40023f
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdns3-ti.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**
> + * cdns3-ti.c - TI specific Glue layer for Cadence USB Controller
> + *
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/io.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +
> +/* USB Wrapper register offsets */
> +#define USBSS_PID		0x0
> +#define	USBSS_W1		0x4
> +#define USBSS_STATIC_CONFIG	0x8
> +#define USBSS_PHY_TEST		0xc
> +#define	USBSS_DEBUG_CTRL	0x10
> +#define	USBSS_DEBUG_INFO	0x14
> +#define	USBSS_DEBUG_LINK_STATE	0x18
> +#define	USBSS_DEVICE_CTRL	0x1c
> +
> +/* Wrapper 1 register bits */
> +#define USBSS_W1_PWRUP_RST		BIT(0)
> +#define USBSS_W1_OVERCURRENT_SEL	BIT(8)
> +#define USBSS_W1_MODESTRAP_SEL		BIT(9)
> +#define USBSS_W1_OVERCURRENT		BIT(16)
> +#define USBSS_W1_MODESTRAP_MASK		GENMASK(18, 17)
> +#define USBSS_W1_MODESTRAP_SHIFT	17
> +#define USBSS_W1_USB2_ONLY		BIT(19)
> +
> +/* Static config register bits */
> +#define USBSS1_STATIC_PLL_REF_SEL_MASK	GENMASK(8, 5)
> +#define USBSS1_STATIC_PLL_REF_SEL_SHIFT	5
> +#define USBSS1_STATIC_LOOPBACK_MODE_MASK	GENMASK(4, 3)
> +#define USBSS1_STATIC_LOOPBACK_MODE_SHIFT	3
> +#define USBSS1_STATIC_VBUS_SEL_MASK	GENMASK(2, 1)
> +#define USBSS1_STATIC_VBUS_SEL_SHIFT	1
> +#define USBSS1_STATIC_LANE_REVERSE	BIT(0)
> +
> +/* Modestrap modes */
> +enum modestrap_mode { USBSS_MODESTRAP_MODE_NONE,
> +		      USBSS_MODESTRAP_MODE_HOST,
> +		      USBSS_MODESTRAP_MODE_PERIPHERAL};
> +
> +struct cdns_ti {
> +	struct device *dev;
> +	void __iomem *usbss;
> +	int usb2_only:1;
> +	int vbus_divider:1;
> +	struct clk *usb2_refclk;
> +	struct clk *lpm_clk;
> +};
> +
> +static const int cdns_ti_rate_table[] = {	/* in KHZ */
> +	9600,
> +	10000,
> +	12000,
> +	19200,
> +	20000,
> +	24000,
> +	25000,
> +	26000,
> +	38400,
> +	40000,
> +	58000,
> +	50000,
> +	52000,
> +};
> +
> +static inline u32 cdns_ti_readl(struct cdns_ti *data, u32 offset)
> +{
> +	return readl(data->usbss + offset);
> +}
> +
> +static inline void cdns_ti_writel(struct cdns_ti *data, u32 offset, u32 value)
> +{
> +	writel(value, data->usbss + offset);
> +}
> +
> +static int cdns_ti_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = pdev->dev.of_node;
> +	struct cdns_ti *data;
> +	struct resource	*res;
> +	int error;
> +	u32 reg;
> +	int rate_code, i;
> +	unsigned long rate;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	data->dev = dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	data->usbss = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(data->usbss))
> +		return PTR_ERR(data->usbss);
use devm_platform_ioremap_resource() ?

> +
> +	data->usb2_refclk = devm_clk_get(dev, "ref");
> +	if (IS_ERR(data->usb2_refclk)) {
> +		dev_err(dev, "can't get usb2_refclk\n");
> +		return PTR_ERR(data->usb2_refclk);
> +	}
> +
> +	data->lpm_clk = devm_clk_get(dev, "lpm");
> +	if (IS_ERR(data->lpm_clk)) {
> +		dev_err(dev, "can't get lpm_clk\n");
> +		return PTR_ERR(data->lpm_clk);
> +	}
> +
> +	rate = clk_get_rate(data->usb2_refclk);
> +	rate /= 1000;	/* To KHz */
> +	for (i = 0; i < ARRAY_SIZE(cdns_ti_rate_table); i++) {
> +		if (cdns_ti_rate_table[i] == rate)
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(cdns_ti_rate_table)) {
> +		dev_err(dev, "unsupported usb2_refclk rate: %lu KHz\n", rate);
> +		return -EINVAL;
> +	}
> +
> +	rate_code = i;
> +
> +	pm_runtime_enable(dev);
> +	error = pm_runtime_get_sync(dev);
> +	if (error < 0) {
> +		dev_err(dev, "pm_runtime_get_sync failed: %d\n", error);
> +		goto err_get;
> +	}
> +
> +	/* assert RESET */
> +	reg = cdns_ti_readl(data, USBSS_W1);
> +	reg &= ~USBSS_W1_PWRUP_RST;
> +	cdns_ti_writel(data, USBSS_W1, reg);
> +
> +	/* set static config */
> +	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
> +	reg &= ~USBSS1_STATIC_PLL_REF_SEL_MASK;
> +	reg |= rate_code << USBSS1_STATIC_PLL_REF_SEL_SHIFT;
> +
> +	reg &= ~USBSS1_STATIC_VBUS_SEL_MASK;
> +	data->vbus_divider = device_property_read_bool(dev, "ti,vbus-divider");
> +	if (data->vbus_divider)
> +		reg |= 1 << USBSS1_STATIC_VBUS_SEL_SHIFT;
> +
> +	cdns_ti_writel(data, USBSS_STATIC_CONFIG, reg);
> +	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
> +
> +	/* set USB2_ONLY mode if requested */
> +	reg = cdns_ti_readl(data, USBSS_W1);
> +	data->usb2_only = device_property_read_bool(dev, "ti,usb2-only");
> +	if (data->usb2_only)
> +		reg |= USBSS_W1_USB2_ONLY;
> +
> +	/* set default modestrap */
> +	reg |= USBSS_W1_MODESTRAP_SEL;
> +	reg &= ~USBSS_W1_MODESTRAP_MASK;
> +	reg |= USBSS_MODESTRAP_MODE_NONE << USBSS_W1_MODESTRAP_SHIFT;
> +	cdns_ti_writel(data, USBSS_W1, reg);
> +
> +	/* de-assert RESET */
> +	reg |= USBSS_W1_PWRUP_RST;
> +	cdns_ti_writel(data, USBSS_W1, reg);
> +
> +	error = of_platform_populate(node, NULL, NULL, dev);
> +	if (error) {
> +		dev_err(dev, "failed to create children: %d\n", error);
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	pm_runtime_put_sync(data->dev);
> +err_get:
> +	pm_runtime_disable(data->dev);
> +
> +	return error;
> +}
> +
> +static int cdns_ti_remove_core(struct device *dev, void *c)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +
> +	platform_device_unregister(pdev);
> +
> +	return 0;
> +}
> +
> +static int cdns_ti_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	device_for_each_child(dev, NULL, cdns_ti_remove_core);
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id cdns_ti_of_match[] = {
> +	{ .compatible = "ti,j721e-usb", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, cdns_ti_of_match);
> +
> +static struct platform_driver cdns_ti_driver = {
> +	.probe		= cdns_ti_probe,
> +	.remove		= cdns_ti_remove,
> +	.driver		= {
> +		.name	= "cdns3-ti",
> +		.of_match_table	= cdns_ti_of_match,
> +	},
> +};
> +
> +module_platform_driver(cdns_ti_driver);
> +
> +MODULE_ALIAS("platform:cdns3-ti");
> +MODULE_AUTHOR("Roger Quadros <rogerq@ti.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Cadence USB3 TI Glue Layer");


