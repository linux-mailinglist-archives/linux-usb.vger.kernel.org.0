Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB52284B35
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 14:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729571AbfHGMIp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 08:08:45 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37610 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729238AbfHGMIo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 08:08:44 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77C8aVb057345;
        Wed, 7 Aug 2019 07:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565179716;
        bh=hpUWUkgpe831iRRUHIzNsH2XIHcTveS3AIAMo6wwQ28=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=OQY8wUf5/BdNqwDR5LbrohbLjBjdiVw8IuFr3GtIU7j0sMgFXHyDucneqoByLdf2N
         CcH8cayrg1yGqcUWrfsrQvl44aqgBKieLZ2pulIL1he9gSwSwh5Ui4XKpiVn15Qkt9
         5NmtEe9KqrT/1Kx0NmSyWb39cjPhL04MOqz7qK1c=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77C8ax9128211
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 07:08:36 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 07:08:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 07:08:35 -0500
Received: from [137.167.41.248] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77C8WZi090325;
        Wed, 7 Aug 2019 07:08:33 -0500
Subject: Re: [PATCH v10 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
To:     Pawel Laszczak <pawell@cadence.com>, <felipe.balbi@linux.intel.com>
CC:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <jbergsagel@ti.com>,
        <nsekhar@ti.com>, <nm@ti.com>, <sureshp@cadence.com>,
        <jpawar@cadence.com>, <kurahul@cadence.com>, <aniljoy@cadence.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
References: <1563733939-21214-1-git-send-email-pawell@cadence.com>
 <1563733939-21214-6-git-send-email-pawell@cadence.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <88742d5b-ee10-cf4e-6724-58e7bdd19cb9@ti.com>
Date:   Wed, 7 Aug 2019 15:08:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563733939-21214-6-git-send-email-pawell@cadence.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Pawel,

On 21/07/2019 21:32, Pawel Laszczak wrote:
> This patch introduce new Cadence USBSS DRD driver to Linux kernel.
> 
> The Cadence USBSS DRD Controller is a highly configurable IP Core which
> can be instantiated as Dual-Role Device (DRD), Peripheral Only and
> Host Only (XHCI)configurations.
> 
> The current driver has been validated with FPGA platform. We have
> support for PCIe bus, which is used on FPGA prototyping.
> 
> The host side of USBSS-DRD controller is compliant with XHCI
> specification, so it works with standard XHCI Linux driver.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  drivers/usb/Kconfig                |    2 +
>  drivers/usb/Makefile               |    2 +
>  drivers/usb/cdns3/Kconfig          |   46 +
>  drivers/usb/cdns3/Makefile         |   17 +
>  drivers/usb/cdns3/cdns3-pci-wrap.c |  203 +++
>  drivers/usb/cdns3/core.c           |  554 +++++++
>  drivers/usb/cdns3/core.h           |  109 ++
>  drivers/usb/cdns3/debug.h          |  171 ++
>  drivers/usb/cdns3/debugfs.c        |   87 ++
>  drivers/usb/cdns3/drd.c            |  390 +++++
>  drivers/usb/cdns3/drd.h            |  166 ++
>  drivers/usb/cdns3/ep0.c            |  914 +++++++++++
>  drivers/usb/cdns3/gadget-export.h  |   28 +
>  drivers/usb/cdns3/gadget.c         | 2338 ++++++++++++++++++++++++++++
>  drivers/usb/cdns3/gadget.h         | 1321 ++++++++++++++++
>  drivers/usb/cdns3/host-export.h    |   28 +
>  drivers/usb/cdns3/host.c           |   71 +
>  drivers/usb/cdns3/trace.c          |   11 +
>  drivers/usb/cdns3/trace.h          |  493 ++++++
>  19 files changed, 6951 insertions(+)
>  create mode 100644 drivers/usb/cdns3/Kconfig
>  create mode 100644 drivers/usb/cdns3/Makefile
>  create mode 100644 drivers/usb/cdns3/cdns3-pci-wrap.c
>  create mode 100644 drivers/usb/cdns3/core.c
>  create mode 100644 drivers/usb/cdns3/core.h
>  create mode 100644 drivers/usb/cdns3/debug.h
>  create mode 100644 drivers/usb/cdns3/debugfs.c
>  create mode 100644 drivers/usb/cdns3/drd.c
>  create mode 100644 drivers/usb/cdns3/drd.h
>  create mode 100644 drivers/usb/cdns3/ep0.c
>  create mode 100644 drivers/usb/cdns3/gadget-export.h
>  create mode 100644 drivers/usb/cdns3/gadget.c
>  create mode 100644 drivers/usb/cdns3/gadget.h
>  create mode 100644 drivers/usb/cdns3/host-export.h
>  create mode 100644 drivers/usb/cdns3/host.c
>  create mode 100644 drivers/usb/cdns3/trace.c
>  create mode 100644 drivers/usb/cdns3/trace.h
> 
> diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
> index e4b27413f528..c2e78882f8c2 100644
> --- a/drivers/usb/Kconfig
> +++ b/drivers/usb/Kconfig
> @@ -113,6 +113,8 @@ source "drivers/usb/usbip/Kconfig"
>  
>  endif
>  
> +source "drivers/usb/cdns3/Kconfig"
> +
>  source "drivers/usb/mtu3/Kconfig"
>  
>  source "drivers/usb/musb/Kconfig"
> diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
> index 7d1b8c82b208..ab125b966cac 100644
> --- a/drivers/usb/Makefile
> +++ b/drivers/usb/Makefile
> @@ -12,6 +12,8 @@ obj-$(CONFIG_USB_DWC3)		+= dwc3/
>  obj-$(CONFIG_USB_DWC2)		+= dwc2/
>  obj-$(CONFIG_USB_ISP1760)	+= isp1760/
>  
> +obj-$(CONFIG_USB_CDNS3)		+= cdns3/
> +
>  obj-$(CONFIG_USB_MON)		+= mon/
>  obj-$(CONFIG_USB_MTU3)		+= mtu3/
>  
> diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> new file mode 100644
> index 000000000000..d0331613a355
> --- /dev/null
> +++ b/drivers/usb/cdns3/Kconfig
> @@ -0,0 +1,46 @@
> +config USB_CDNS3
> +	tristate "Cadence USB3 Dual-Role Controller"
> +	depends on USB_SUPPORT && (USB || USB_GADGET) && HAS_DMA
> +	select USB_XHCI_PLATFORM if USB_XHCI_HCD
> +	select USB_ROLE_SWITCH
> +	help
> +	  Say Y here if your system has a Cadence USB3 dual-role controller.
> +	  It supports: dual-role switch, Host-only, and Peripheral-only.
> +
> +	  If you choose to build this driver is a dynamically linked
> +	  as module, the module will be called cdns3.ko.
> +
> +if USB_CDNS3
> +
> +config USB_CDNS3_GADGET
> +	bool "Cadence USB3 device controller"
> +	depends on USB_GADGET=y || USB_GADGET=USB_CDNS3
> +	help
> +	  Say Y here to enable device controller functionality of the
> +	  Cadence USBSS-DEV driver.
> +
> +	  This controller supports FF, HS and SS mode. It doesn't support

s/FF/FS

> +	  LS and SSP mode.
> +
> +config USB_CDNS3_HOST
> +	bool "Cadence USB3 host controller"
> +	depends on USB=y || USB=USB_CDNS3
> +	help
> +	  Say Y here to enable host controller functionality of the
> +	  Cadence driver.
> +
> +	  Host controller is compliant with XHCI so it will use
> +	  standard XHCI driver.
> +
> +config USB_CDNS3_PCI_WRAP
> +	tristate "Cadence USB3 support on PCIe-based platforms"
> +	depends on USB_PCI && ACPI
> +	default USB_CDNS3
> +	help
> +	  If you're using the USBSS Core IP with a PCIe, please say
> +	  'Y' or 'M' here.
> +
> +	  If you choose to build this driver as module it will
> +	  be dynamically linked and module will be called cdns3-pci.ko
> +
> +endif
> diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
> new file mode 100644
> index 000000000000..6c58660b9cd1
> --- /dev/null
> +++ b/drivers/usb/cdns3/Makefile
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# define_trace.h needs to know how to find our header
> +CFLAGS_trace.o				:= -I$(src)
> +
> +cdns3-y					:= core.o drd.o
> +
> +obj-$(CONFIG_USB_CDNS3)			+= cdns3.o
> +cdns3-$(CONFIG_DEBUG_FS)		+= debugfs.o
> +cdns3-$(CONFIG_USB_CDNS3_GADGET)	+= gadget.o ep0.o
> +
> +ifneq ($(CONFIG_USB_CDNS3_GADGET),)
> +cdns3-$(CONFIG_TRACING)			+= trace.o
> +endif
> +
> +cdns3-$(CONFIG_USB_CDNS3_HOST)		+= host.o
> +
> +obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+= cdns3-pci-wrap.o
> diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
> new file mode 100644
> index 000000000000..c41ddb61b857
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cadence USBSS PCI Glue driver
> + *
> + * Copyright (C) 2018-2019 Cadence.
> + *
> + * Author: Pawel Laszczak <pawell@cadence.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/slab.h>
> +
> +struct cdns3_wrap {
> +	struct platform_device *plat_dev;
> +	struct resource dev_res[6];
> +	int devfn;
> +};
> +
> +#define RES_IRQ_HOST_ID		0
> +#define RES_IRQ_PERIPHERAL_ID	1
> +#define RES_IRQ_OTG_ID		2
> +#define RES_HOST_ID		3
> +#define RES_DEV_ID		4
> +#define RES_DRD_ID		5
> +
> +#define PCI_BAR_HOST		0
> +#define PCI_BAR_DEV		2
> +#define PCI_BAR_OTG		0
> +
> +#define PCI_DEV_FN_HOST_DEVICE	0
> +#define PCI_DEV_FN_OTG		1
> +
> +#define PCI_DRIVER_NAME		"cdns3-pci-usbss"
> +#define PLAT_DRIVER_NAME	"cdns-usb3"
> +
> +#define CDNS_VENDOR_ID		0x17cd
> +#define CDNS_DEVICE_ID		0x0100
> +
> +static struct pci_dev *cdns3_get_second_fun(struct pci_dev *pdev)
> +{
> +	struct pci_dev *func;
> +
> +	/*
> +	 * Gets the second function.
> +	 * It's little tricky, but this platform has two function.
> +	 * The fist keeps resources for Host/Device while the second
> +	 * keeps resources for DRD/OTG.
> +	 */
> +	func = pci_get_device(pdev->vendor, pdev->device, NULL);
> +	if (unlikely(!func))
> +		return NULL;
> +
> +	if (func->devfn == pdev->devfn) {
> +		func = pci_get_device(pdev->vendor, pdev->device, func);
> +		if (unlikely(!func))
> +			return NULL;
> +	}
> +
> +	return func;
> +}
> +
> +static int cdns3_pci_probe(struct pci_dev *pdev,
> +			   const struct pci_device_id *id)
> +{
> +	struct platform_device_info plat_info;
> +	struct cdns3_wrap *wrap;
> +	struct resource *res;
> +	struct pci_dev *func;
> +	int err;
> +
> +	/*
> +	 * for GADGET/HOST PCI (devfn) function number is 0,
> +	 * for OTG PCI (devfn) function number is 1
> +	 */
> +	if (!id || (pdev->devfn != PCI_DEV_FN_HOST_DEVICE &&
> +		    pdev->devfn != PCI_DEV_FN_OTG))
> +		return -EINVAL;
> +
> +	func = cdns3_get_second_fun(pdev);
> +	if (unlikely(!func))
> +		return -EINVAL;
> +
> +	err = pcim_enable_device(pdev);
> +	if (err) {
> +		dev_err(&pdev->dev, "Enabling PCI device has failed %d\n", err);
> +		return err;
> +	}
> +
> +	pci_set_master(pdev);
> +
> +	if (pci_is_enabled(func)) {
> +		wrap = pci_get_drvdata(func);
> +	} else {
> +		wrap = kzalloc(sizeof(*wrap), GFP_KERNEL);
> +		if (!wrap) {
> +			pci_disable_device(pdev);
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	res = wrap->dev_res;
> +
> +	if (pdev->devfn == PCI_DEV_FN_HOST_DEVICE) {
> +		/* function 0: host(BAR_0) + device(BAR_1).*/
> +		dev_dbg(&pdev->dev, "Initialize Device resources\n");
> +		res[RES_DEV_ID].start = pci_resource_start(pdev, PCI_BAR_DEV);
> +		res[RES_DEV_ID].end =   pci_resource_end(pdev, PCI_BAR_DEV);
> +		res[RES_DEV_ID].name = "dev";
> +		res[RES_DEV_ID].flags = IORESOURCE_MEM;
> +		dev_dbg(&pdev->dev, "USBSS-DEV physical base addr: %pa\n",
> +			&res[RES_DEV_ID].start);
> +
> +		res[RES_HOST_ID].start = pci_resource_start(pdev, PCI_BAR_HOST);
> +		res[RES_HOST_ID].end = pci_resource_end(pdev, PCI_BAR_HOST);
> +		res[RES_HOST_ID].name = "xhci";
> +		res[RES_HOST_ID].flags = IORESOURCE_MEM;
> +		dev_dbg(&pdev->dev, "USBSS-XHCI physical base addr: %pa\n",
> +			&res[RES_HOST_ID].start);
> +
> +		/* Interrupt for XHCI */
> +		wrap->dev_res[RES_IRQ_HOST_ID].start = pdev->irq;
> +		wrap->dev_res[RES_IRQ_HOST_ID].name = "host";
> +		wrap->dev_res[RES_IRQ_HOST_ID].flags = IORESOURCE_IRQ;
> +
> +		/* Interrupt device. It's the same as for HOST. */
> +		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].start = pdev->irq;
> +		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].name = "peripheral";
> +		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].flags = IORESOURCE_IRQ;
> +	} else {
> +		res[RES_DRD_ID].start = pci_resource_start(pdev, PCI_BAR_OTG);
> +		res[RES_DRD_ID].end =   pci_resource_end(pdev, PCI_BAR_OTG);
> +		res[RES_DRD_ID].name = "otg";
> +		res[RES_DRD_ID].flags = IORESOURCE_MEM;
> +		dev_dbg(&pdev->dev, "USBSS-DRD physical base addr: %pa\n",
> +			&res[RES_DRD_ID].start);
> +
> +		/* Interrupt for OTG/DRD. */
> +		wrap->dev_res[RES_IRQ_OTG_ID].start = pdev->irq;
> +		wrap->dev_res[RES_IRQ_OTG_ID].name = "otg";
> +		wrap->dev_res[RES_IRQ_OTG_ID].flags = IORESOURCE_IRQ;
> +	}
> +
> +	if (pci_is_enabled(func)) {
> +		/* set up platform device info */
> +		memset(&plat_info, 0, sizeof(plat_info));
> +		plat_info.parent = &pdev->dev;
> +		plat_info.fwnode = pdev->dev.fwnode;
> +		plat_info.name = PLAT_DRIVER_NAME;
> +		plat_info.id = pdev->devfn;
> +		wrap->devfn  = pdev->devfn;
> +		plat_info.res = wrap->dev_res;
> +		plat_info.num_res = ARRAY_SIZE(wrap->dev_res);
> +		plat_info.dma_mask = pdev->dma_mask;
> +		/* register platform device */
> +		wrap->plat_dev = platform_device_register_full(&plat_info);
> +		if (IS_ERR(wrap->plat_dev)) {
> +			pci_disable_device(pdev);
> +			kfree(wrap);
> +			return PTR_ERR(wrap->plat_dev);
> +		}
> +	}
> +
> +	pci_set_drvdata(pdev, wrap);
> +	return err;
> +}
> +
> +static void cdns3_pci_remove(struct pci_dev *pdev)
> +{
> +	struct cdns3_wrap *wrap;
> +	struct pci_dev *func;
> +
> +	func = cdns3_get_second_fun(pdev);
> +
> +	wrap = (struct cdns3_wrap *)pci_get_drvdata(pdev);
> +	if (wrap->devfn == pdev->devfn)
> +		platform_device_unregister(wrap->plat_dev);
> +
> +	if (!pci_is_enabled(func))
> +		kfree(wrap);
> +}
> +
> +static const struct pci_device_id cdns3_pci_ids[] = {
> +	{ PCI_DEVICE(CDNS_VENDOR_ID, CDNS_DEVICE_ID), },
> +	{ 0, }
> +};
> +
> +static struct pci_driver cdns3_pci_driver = {
> +	.name = PCI_DRIVER_NAME,
> +	.id_table = cdns3_pci_ids,
> +	.probe = cdns3_pci_probe,
> +	.remove = cdns3_pci_remove,
> +};
> +
> +module_pci_driver(cdns3_pci_driver);
> +MODULE_DEVICE_TABLE(pci, cdns3_pci_ids);
> +
> +MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Cadence USBSS PCI wrapperr");
> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> new file mode 100644
> index 000000000000..900b2ce08162
> --- /dev/null
> +++ b/drivers/usb/cdns3/core.c
> @@ -0,0 +1,554 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cadence USBSS DRD Driver.
> + *
> + * Copyright (C) 2018-2019 Cadence.
> + * Copyright (C) 2017-2018 NXP
> + * Copyright (C) 2019 Texas Instruments
> + *
> + * Author: Peter Chen <peter.chen@nxp.com>
> + *         Pawel Laszczak <pawell@cadence.com>
> + *         Roger Quadros <rogerq@ti.com>
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "gadget.h"
> +#include "core.h"
> +#include "host-export.h"
> +#include "gadget-export.h"
> +#include "drd.h"
> +#include "debug.h"
> +
> +static inline
> +struct cdns3_role_driver *cdns3_get_current_role_driver(struct cdns3 *cdns)
> +{
> +	WARN_ON(!cdns->roles[cdns->role]);
> +	return cdns->roles[cdns->role];
> +}
> +
> +static int cdns3_role_start(struct cdns3 *cdns, enum usb_role role)
> +{
> +	int ret;
> +
> +	if (WARN_ON(role > USB_ROLE_DEVICE))
> +		return 0;
> +
> +	mutex_lock(&cdns->mutex);
> +	cdns->role = role;
> +	mutex_unlock(&cdns->mutex);
> +
> +	if (role == USB_ROLE_NONE)
> +		return 0;
> +
> +	if (!cdns->roles[role])
> +		return -ENXIO;
> +
> +	if (cdns->roles[role]->state == CDNS3_ROLE_STATE_ACTIVE)
> +		return 0;
> +
> +	mutex_lock(&cdns->mutex);
> +	if (role == USB_ROLE_HOST)
> +		cdns3_drd_switch_host(cdns, 1);
> +	else
> +		cdns3_drd_switch_gadget(cdns, 1);
> +
> +	ret = cdns->roles[role]->start(cdns);
> +	if (!ret)
> +		cdns->roles[role]->state = CDNS3_ROLE_STATE_ACTIVE;
> +	mutex_unlock(&cdns->mutex);
> +
> +	return ret;
> +}
> +
> +static void cdns3_role_stop(struct cdns3 *cdns)
> +{
> +	enum usb_role role = cdns->role;
> +
> +	if (WARN_ON(role > USB_ROLE_DEVICE))
> +		return;
> +
> +	if (role == USB_ROLE_NONE)
> +		return;
> +
> +	if (cdns->roles[role]->state == CDNS3_ROLE_STATE_INACTIVE)
> +		return;
> +
> +	mutex_lock(&cdns->mutex);
> +	cdns->roles[role]->stop(cdns);
> +	if (role == USB_ROLE_HOST)
> +		cdns3_drd_switch_host(cdns, 0);
> +	else
> +		cdns3_drd_switch_gadget(cdns, 0);
> +
> +	cdns->roles[role]->state = CDNS3_ROLE_STATE_INACTIVE;
> +	mutex_unlock(&cdns->mutex);
> +}
> +
> +static void cdns3_exit_roles(struct cdns3 *cdns)
> +{
> +	cdns3_role_stop(cdns);
> +	cdns3_drd_exit(cdns);
> +}
> +
> +enum usb_role cdsn3_real_role_switch_get(struct device *dev);
> +
> +/**
> + * cdns3_core_init_role - initialize role of operation
> + * @cdns: Pointer to cdns3 structure
> + *
> + * Returns 0 on success otherwise negative errno
> + */
> +static int cdns3_core_init_role(struct cdns3 *cdns)
> +{
> +	struct device *dev = cdns->dev;
> +	enum usb_dr_mode best_dr_mode;
> +	enum usb_dr_mode dr_mode;
> +	int ret = 0;
> +
> +	dr_mode = usb_get_dr_mode(dev);
> +	cdns->role = USB_ROLE_NONE;
> +
> +	/*
> +	 * If driver can't read mode by means of usb_get_dr_mode function then
> +	 * chooses mode according with Kernel configuration. This setting
> +	 * can be restricted later depending on strap pin configuration.
> +	 */
> +	if (dr_mode == USB_DR_MODE_UNKNOWN) {
> +		if (IS_ENABLED(CONFIG_USB_CDNS3_HOST) &&
> +		    IS_ENABLED(CONFIG_USB_CDNS3_GADGET))
> +			dr_mode = USB_DR_MODE_OTG;
> +		else if (IS_ENABLED(CONFIG_USB_CDNS3_HOST))
> +			dr_mode = USB_DR_MODE_HOST;
> +		else if (IS_ENABLED(CONFIG_USB_CDNS3_GADGET))
> +			dr_mode = USB_DR_MODE_PERIPHERAL;
> +	}
> +
> +	/*
> +	 * At this point cdns->dr_mode contains strap configuration.
> +	 * Driver try update this setting considering kernel configuration
> +	 */
> +	best_dr_mode = cdns->dr_mode;
> +
> +	if (dr_mode == USB_DR_MODE_OTG) {
> +		best_dr_mode = cdns->dr_mode;
> +	} else if (cdns->dr_mode == USB_DR_MODE_OTG) {
> +		best_dr_mode = dr_mode;
> +	} else if (cdns->dr_mode != dr_mode) {
> +		dev_err(dev, "Incorrect DRD configuration\n");
> +		return -EINVAL;
> +	}
> +
> +	dr_mode = best_dr_mode;
> +
> +	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_HOST) {
> +		ret = cdns3_host_init(cdns);
> +		if (ret) {
> +			dev_err(dev, "Host initialization failed with %d\n",
> +				ret);
> +			goto err;
> +		}
> +	}
> +
> +	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_PERIPHERAL) {
> +		ret = cdns3_gadget_init(cdns);
> +		if (ret) {
> +			dev_err(dev, "Device initialization failed with %d\n",
> +				ret);
> +			goto err;
> +		}
> +	}
> +
> +	cdns->desired_dr_mode = dr_mode;
> +	cdns->dr_mode = dr_mode;
> +
> +	/*
> +	 * desired_dr_mode might have changed so we need to update
> +	 * the controller configuration"?
> +	 */
> +	ret = cdns3_drd_update_mode(cdns);
> +	if (ret)
> +		goto err;
> +
> +	cdns->role = cdsn3_real_role_switch_get(cdns->dev);
> +
> +	ret = cdns3_role_start(cdns, cdns->role);
> +	if (ret) {
> +		dev_err(dev, "can't start %s role\n",
> +			cdns3_get_current_role_driver(cdns)->name);
> +		goto err;
> +	}
> +
> +	return ret;
> +err:
> +	cdns3_exit_roles(cdns);
> +	return ret;
> +}
> +
> +/**
> + * cdsn3_real_role_switch_get - get real role of controller based on hardware
> + *   settings.
> + * @dev: Pointer to device structure
> + *
> + * Returns role
> + */
> +enum usb_role cdsn3_real_role_switch_get(struct device *dev)
> +{
> +	struct cdns3 *cdns = dev_get_drvdata(dev);
> +	enum usb_role role;
> +	int id, vbus;
> +
> +	if (cdns->current_dr_mode != USB_DR_MODE_OTG)
> +		goto not_otg;
> +
> +	id = cdns3_get_id(cdns);
> +	vbus = cdns3_get_vbus(cdns);
> +
> +	/*
> +	 * Role change state machine
> +	 * Inputs: ID, VBUS
> +	 * Previous state: cdns->role
> +	 * Next state: role
> +	 */
> +	role = cdns->role;
> +
> +	switch (role) {
> +	case USB_ROLE_NONE:
> +		/*
> +		 * Driver treat USB_ROLE_NONE synonymous to IDLE state from
> +		 * controller specification.
> +		 */
> +		if (!id)
> +			role = USB_ROLE_HOST;
> +		else if (vbus)
> +			role = USB_ROLE_DEVICE;
> +		break;
> +	case USB_ROLE_HOST: /* from HOST, we can only change to NONE */
> +		if (id)
> +			role = USB_ROLE_NONE;
> +		break;
> +	case USB_ROLE_DEVICE: /* from GADGET, we can only change to NONE*/
> +		if (!vbus)
> +			role = USB_ROLE_NONE;
> +		break;
> +	}
> +
> +	dev_dbg(cdns->dev, "role %d -> %d\n", cdns->role, role);
> +
> +	return role;
> +
> +not_otg:
> +	if (cdns3_is_host(cdns))
> +		role = USB_ROLE_HOST;
> +	if (cdns3_is_device(cdns))
> +		role = USB_ROLE_DEVICE;
> +
> +	return role;
> +}
> +
> +/**
> + * cdns3_role_switch_set - work queue handler for role switch
> + *
> + * @dev: pointer to device object
> + * @role - the previous role
> + * Handles below events:
> + * - Role switch for dual-role devices
> + * - USB_ROLE_GADGET <--> USB_ROLE_NONE for peripheral-only devices
> + */
> +static int cdns3_role_switch_set(struct device *dev, enum usb_role role)
> +{
> +	struct cdns3 *cdns = dev_get_drvdata(dev);
> +	enum usb_role real_role = USB_ROLE_NONE;
> +	enum usb_role current_role;
> +	int ret = 0;
> +
> +	/* Check if dr_mode was changed.*/
> +	ret = cdns3_drd_update_mode(cdns);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_get_sync(cdns->dev);
> +
> +	real_role = cdsn3_real_role_switch_get(cdns->dev);
> +
> +	/* Do nothing if nothing changed */
> +	if (cdns->role == real_role)
> +		goto exit;
> +
> +	cdns3_role_stop(cdns);
> +
> +	real_role = cdsn3_real_role_switch_get(cdns->dev);
> +
> +	current_role = role;
> +	dev_dbg(cdns->dev, "Switching role");
> +
> +	ret = cdns3_role_start(cdns, real_role);
> +	if (ret) {
> +		/* Back to current role */
> +		dev_err(cdns->dev, "set %d has failed, back to %d\n",
> +			role, current_role);
> +		ret = cdns3_role_start(cdns, current_role);
> +		if (ret)
> +			dev_err(cdns->dev, "back to %d failed too\n",
> +				current_role);
> +	}
> +exit:
> +	pm_runtime_put_sync(cdns->dev);
> +	return ret;
> +}
> +
> +static const struct usb_role_switch_desc cdns3_switch_desc = {
> +	.set = cdns3_role_switch_set,
> +	.get = cdsn3_real_role_switch_get,
> +	.allow_userspace_control = true,

how does user initiated cdns3_role_switch_set() via sysfs co-exist with role
changes done by hardware events. e.g. ID/VBUS?

> +};
> +
> +/**
> + * cdns3_probe - probe for cdns3 core device
> + * @pdev: Pointer to cdns3 core platform device
> + *
> + * Returns 0 on success otherwise negative errno
> + */
> +static int cdns3_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource	*res;
> +	struct cdns3 *cdns;
> +	void __iomem *regs;
> +	int ret;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(dev, "error setting dma mask: %d\n", ret);
> +		return -ENODEV;
> +	}
> +
> +	cdns = devm_kzalloc(dev, sizeof(*cdns), GFP_KERNEL);
> +	if (!cdns)
> +		return -ENOMEM;
> +
> +	cdns->dev = dev;
> +
> +	platform_set_drvdata(pdev, cdns);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "host");
> +	if (!res) {
> +		dev_err(dev, "missing host IRQ\n");
> +		return -ENODEV;
> +	}
> +
> +	cdns->xhci_res[0] = *res;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "xhci");
> +	if (!res) {
> +		dev_err(dev, "couldn't get xhci resource\n");
> +		return -ENXIO;
> +	}
> +
> +	cdns->xhci_res[1] = *res;
> +
> +	cdns->dev_irq = platform_get_irq_byname(pdev, "peripheral");
> +	if (cdns->dev_irq == -EPROBE_DEFER)
> +		return cdns->dev_irq;
> +
> +	if (cdns->dev_irq < 0)
> +		dev_err(dev, "couldn't get peripheral irq\n");
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dev");
> +	regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(regs)) {
> +		dev_err(dev, "couldn't iomap dev resource\n");
> +		return PTR_ERR(regs);
> +	}
> +	cdns->dev_regs	= regs;
> +
> +	cdns->otg_irq = platform_get_irq_byname(pdev, "otg");
> +	if (cdns->otg_irq == -EPROBE_DEFER)
> +		return cdns->otg_irq;
> +
> +	if (cdns->otg_irq < 0) {
> +		dev_err(dev, "couldn't get otg irq\n");
> +		return cdns->otg_irq;
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "otg");
> +	if (!res) {
> +		dev_err(dev, "couldn't get otg resource\n");
> +		return -ENXIO;
> +	}
> +
> +	cdns->otg_res = *res;
> +
> +	mutex_init(&cdns->mutex);
> +
> +	cdns->usb2_phy = devm_phy_optional_get(dev, "cdns3,usb2-phy");
> +	if (IS_ERR(cdns->usb2_phy))
> +		return PTR_ERR(cdns->usb2_phy);
> +
> +	phy_init(cdns->usb2_phy);
> +	ret = phy_init(cdns->usb2_phy);

why phy_init() twice?

> +	if (ret)
> +		return ret;
> +
> +	cdns->usb3_phy = devm_phy_optional_get(dev, "cdns3,usb3-phy");
> +	if (IS_ERR(cdns->usb3_phy))
> +		return PTR_ERR(cdns->usb3_phye t);
> +
> +	phy_init(cdns->usb3_phy);
> +	ret = phy_init(cdns->usb3_phy);

here too.

> +	if (ret)

phy_exit(usb2_phy);

> +		return ret;
> +
> +	ret = phy_power_on(cdns->usb2_phy);
> +	if (ret)

phy_exit on cleanup.
> +		return ret;
> +
> +	ret = phy_power_on(cdns->usb3_phy);
> +	if (ret)
> +		goto err1;
> +
> +	cdns->role_sw = usb_role_switch_register(dev, &cdns3_switch_desc);
> +	if (IS_ERR(cdns->role_sw)) {
> +		ret = PTR_ERR(cdns->role_sw);
> +		dev_warn(dev, "Unable to register Role Switch\n");
> +		goto err2;
> +	}
> +
> +	ret = cdns3_drd_init(cdns);
> +	if (ret)
> +		goto err3;
> +
> +	ret = cdns3_core_init_role(cdns);
> +	if (ret)

cdns3_drd_exit();

> +		goto err3;
> +
> +	cdns3_debugfs_init(cdns);
> +	device_set_wakeup_capable(dev, true);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	/*
> +	 * The controller needs less time between bus and controller suspend,
> +	 * and we also needs a small delay to avoid frequently entering low
> +	 * power mode.
> +	 */
> +	pm_runtime_set_autosuspend_delay(dev, 20);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_use_autosuspend(dev);
> +	dev_dbg(dev, "Cadence USB3 core: probe succeed\n");
> +
> +	return 0;
> +err3:
> +	usb_role_switch_unregister(cdns->role_sw);
> +err2:
> +	phy_power_off(cdns->usb3_phy);
> +
> +err1:
> +	phy_power_off(cdns->usb2_phy);
> +	phy_exit(cdns->usb2_phy);
> +	phy_exit(cdns->usb3_phy);
> +
> +	return ret;
> +}
> +
> +/**
> + * cdns3_remove - unbind drd driver and clean up
> + * @pdev: Pointer to Linux platform device
> + *
> + * Returns 0 on success otherwise negative errno
> + */
> +static int cdns3_remove(struct platform_device *pdev)
> +{
> +	struct cdns3 *cdns = platform_get_drvdata(pdev);
> +
> +	pm_runtime_get_sync(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
> +	cdns3_debugfs_exit(cdns);
> +	cdns3_exit_roles(cdns);
> +	usb_role_switch_unregister(cdns->role_sw);
> +	phy_power_off(cdns->usb2_phy);
> +	phy_power_off(cdns->usb3_phy);
> +	phy_exit(cdns->usb2_phy);
> +	phy_exit(cdns->usb3_phy);
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +
> +static int cdns3_suspend(struct device *dev)
> +{
> +	struct cdns3 *cdns = dev_get_drvdata(dev);
> +	unsigned long flags;
> +
> +	if (cdns->role == USB_ROLE_HOST)
> +		return 0;
> +
> +	if (pm_runtime_status_suspended(dev))
> +		pm_runtime_resume(dev);
> +
> +	if (cdns->roles[cdns->role]->suspend) {
> +		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);

Aren't interrupts disabled during system suspend?
What is the purpose of this lock?

> +		cdns->roles[cdns->role]->suspend(cdns, false);
> +		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
> +	}
> +
> +	return 0;
> +}
> +
> +static int cdns3_resume(struct device *dev)
> +{
> +	struct cdns3 *cdns = dev_get_drvdata(dev);
> +	unsigned long flags;
> +> +	if (cdns->role == USB_ROLE_HOST)
> +		return 0;> +
> +	if (cdns->roles[cdns->role]->resume) {
> +		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
> +		cdns->roles[cdns->role]->resume(cdns, false);
> +		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
> +	}
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops cdns3_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(cdns3_suspend, cdns3_resume)
> +};
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id of_cdns3_match[] = {
> +	{ .compatible = "cdns,usb3" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, of_cdns3_match);
> +#endif
> +
> +static struct platform_driver cdns3_driver = {
> +	.probe		= cdns3_probe,
> +	.remove		= cdns3_remove,
> +	.driver		= {
> +		.name	= "cdns-usb3",
> +		.of_match_table	= of_match_ptr(of_cdns3_match),
> +		.pm	= &cdns3_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(cdns3_driver);
> +
> +MODULE_ALIAS("platform:cdns3");
> +MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Cadence USB3 DRD Controller Driver");
> diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
> new file mode 100644
> index 000000000000..581a2f28aca4
> --- /dev/null
> +++ b/drivers/usb/cdns3/core.h
> @@ -0,0 +1,109 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Cadence USBSS DRD Header File.
> + *
> + * Copyright (C) 2017-2018 NXP
> + * Copyright (C) 2018-2019 Cadence.
> + *
> + * Authors: Peter Chen <peter.chen@nxp.com>
> + *          Pawel Laszczak <pawell@cadence.com>
> + */
> +#include <linux/usb/otg.h>
> +#include <linux/usb/role.h>
> +
> +#ifndef __LINUX_CDNS3_CORE_H
> +#define __LINUX_CDNS3_CORE_H
> +
> +struct cdns3;
> +
> +/**
> + * struct cdns3_role_driver - host/gadget role driver
> + * @start: start this role
> + * @stop: stop this role
> + * @suspend: suspend callback for this role
> + * @resume: resume callback for this role
> + * @irq: irq handler for this role
> + * @name: role name string (host/gadget)
> + * @state: current state
> + */
> +struct cdns3_role_driver {
> +	int (*start)(struct cdns3 *cdns);
> +	void (*stop)(struct cdns3 *cdns);
> +	int (*suspend)(struct cdns3 *cdns, bool do_wakeup);
> +	int (*resume)(struct cdns3 *cdns, bool hibernated);
> +	const char *name;
> +#define CDNS3_ROLE_STATE_INACTIVE	0
> +#define CDNS3_ROLE_STATE_ACTIVE		1
> +	int state;
> +};
> +
> +#define CDNS3_XHCI_RESOURCES_NUM	2
> +/**
> + * struct cdns3 - Representation of Cadence USB3 DRD controller.
> + * @dev: pointer to Cadence device struct
> + * @xhci_regs: pointer to base of xhci registers
> + * @xhci_res: the resource for xhci
> + * @dev_regs: pointer to base of dev registers
> + * @otg_res: the resource for otg
> + * @otg_v0_regs: pointer to base of v0 otg registers
> + * @otg_v1_regs: pointer to base of v1 otg registers
> + * @otg_regs: pointer to base of otg registers
> + * @otg_irq: irq number for otg controller
> + * @dev_irq: irq number for device controller
> + * @roles: array of supported roles for this controller
> + * @role: current role
> + * @host_dev: the child host device pointer for cdns3 core
> + * @gadget_dev: the child gadget device pointer for cdns3 core
> + * @usb2_phy: pointer to USB2 PHY
> + * @usb3_phy: pointer to USB3 PHY
> + * @mutex: the mutex for concurrent code at driver
> + * @dr_mode: supported mode of operation it can be only Host, only Device
> + *           or OTG mode that allow to switch between Device and Host mode.
> + *           This field based on firmware setting, kernel configuration
> + *           and hardware configuration.
> + * @current_dr_mode: current mode of operation when in dual-role mode
> + * @desired_dr_mode: desired mode of operation when in dual-role mode.
> + *           This value can be changed during runtime.
> + *           Available options depends on  dr_mode:
> + *           dr_mode                 |  desired_dr_mode and current_dr_mode
> + *           ----------------------------------------------------------------
> + *           USB_DR_MODE_HOST        | only USB_DR_MODE_HOST
> + *           USB_DR_MODE_PERIPHERAL  | only USB_DR_MODE_PERIPHERAL
> + *           USB_DR_MODE_OTG         | USB_DR_MODE_OTG or USB_DR_MODE_HOST or
> + *                                   | USB_DR_MODE_PERIPHERAL
> + *           Desired_dr_role can be changed by means of debugfs.
> + * @role_sw: pointer to role switch object.
> + * @root: debugfs root folder pointer
> + */
> +struct cdns3 {
> +	struct device			*dev;
> +	void __iomem			*xhci_regs;
> +	struct resource			xhci_res[CDNS3_XHCI_RESOURCES_NUM];
> +	struct cdns3_usb_regs __iomem	*dev_regs;
> +
> +	struct resource			otg_res;
> +	struct cdns3_otg_legacy_regs	*otg_v0_regs;
> +	struct cdns3_otg_regs		*otg_v1_regs;
> +	struct cdns3_otg_common_regs	*otg_regs;
> +#define CDNS3_CONTROLLER_V0	0
> +#define CDNS3_CONTROLLER_V1	1
> +	u32				version;
> +
> +	int				otg_irq;
> +	int				dev_irq;
> +	struct cdns3_role_driver	*roles[USB_ROLE_DEVICE + 1];
> +	enum usb_role			role;
> +	struct platform_device		*host_dev;
> +	struct cdns3_device		*gadget_dev;
> +	struct phy			*usb2_phy;
> +	struct phy			*usb3_phy;
> +	/* mutext used in workqueue*/
> +	struct mutex			mutex;
> +	enum usb_dr_mode		dr_mode;
> +	enum usb_dr_mode		current_dr_mode;
> +	enum usb_dr_mode		desired_dr_mode;
> +	struct usb_role_switch		*role_sw;
> +	struct dentry			*root;
> +};
> +
> +#endif /* __LINUX_CDNS3_CORE_H */
> diff --git a/drivers/usb/cdns3/debug.h b/drivers/usb/cdns3/debug.h
> new file mode 100644
> index 000000000000..4fcd826cf930
> --- /dev/null
> +++ b/drivers/usb/cdns3/debug.h
> @@ -0,0 +1,171 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Cadence USBSS DRD Driver.
> + * Debug header file.
> + *
> + * Copyright (C) 2018-2019 Cadence.
> + *
> + * Author: Pawel Laszczak <pawell@cadence.com>
> + */
> +#ifndef __LINUX_CDNS3_DEBUG
> +#define __LINUX_CDNS3_DEBUG
> +
> +#include "core.h"
> +
> +static inline char *cdns3_decode_usb_irq(char *str,
> +					 enum usb_device_speed speed,
> +					 u32 usb_ists)
> +{
> +	int ret;
> +
> +	ret = sprintf(str, "IRQ %08x = ", usb_ists);
> +
> +	if (usb_ists & (USB_ISTS_CON2I | USB_ISTS_CONI)) {
> +		ret += sprintf(str + ret, "Connection %s\n",
> +			       usb_speed_string(speed));
> +	}
> +	if (usb_ists & USB_ISTS_DIS2I || usb_ists & USB_ISTS_DISI)
> +		ret += sprintf(str + ret, "Disconnection ");
> +	if (usb_ists & USB_ISTS_L2ENTI)
> +		ret += sprintf(str + ret, "suspended ");
> +	if (usb_ists & USB_ISTS_L1ENTI)
> +		ret += sprintf(str + ret, "L1 enter ");
> +	if (usb_ists & USB_ISTS_L1EXTI)
> +		ret += sprintf(str + ret, "L1 exit ");
> +	if (usb_ists & USB_ISTS_L2ENTI)
> +		ret += sprintf(str + ret, "L2 enter ");
> +	if (usb_ists & USB_ISTS_L2EXTI)
> +		ret += sprintf(str + ret, "L2 exit ");
> +	if (usb_ists & USB_ISTS_U3EXTI)
> +		ret += sprintf(str + ret, "U3 exit ");
> +	if (usb_ists & USB_ISTS_UWRESI)
> +		ret += sprintf(str + ret, "Warm Reset ");
> +	if (usb_ists & USB_ISTS_UHRESI)
> +		ret += sprintf(str + ret, "Hot Reset ");
> +	if (usb_ists & USB_ISTS_U2RESI)
> +		ret += sprintf(str + ret, "Reset");
> +
> +	return str;
> +}
> +
> +static inline  char *cdns3_decode_ep_irq(char *str,
> +					 u32 ep_sts,
> +					 const char *ep_name)
> +{
> +	int ret;
> +
> +	ret = sprintf(str, "IRQ for %s: %08x ", ep_name, ep_sts);
> +
> +	if (ep_sts & EP_STS_SETUP)
> +		ret += sprintf(str + ret, "SETUP ");
> +	if (ep_sts & EP_STS_IOC)
> +		ret += sprintf(str + ret, "IOC ");
> +	if (ep_sts & EP_STS_ISP)
> +		ret += sprintf(str + ret, "ISP ");
> +	if (ep_sts & EP_STS_DESCMIS)
> +		ret += sprintf(str + ret, "DESCMIS ");
> +	if (ep_sts & EP_STS_STREAMR)
> +		ret += sprintf(str + ret, "STREAMR ");
> +	if (ep_sts & EP_STS_MD_EXIT)
> +		ret += sprintf(str + ret, "MD_EXIT ");
> +	if (ep_sts & EP_STS_TRBERR)
> +		ret += sprintf(str + ret, "TRBERR ");
> +	if (ep_sts & EP_STS_NRDY)
> +		ret += sprintf(str + ret, "NRDY ");
> +	if (ep_sts & EP_STS_PRIME)
> +		ret += sprintf(str + ret, "PRIME ");
> +	if (ep_sts & EP_STS_SIDERR)
> +		ret += sprintf(str + ret, "SIDERRT ");
> +	if (ep_sts & EP_STS_OUTSMM)
> +		ret += sprintf(str + ret, "OUTSMM ");
> +	if (ep_sts & EP_STS_ISOERR)
> +		ret += sprintf(str + ret, "ISOERR ");
> +	if (ep_sts & EP_STS_IOT)
> +		ret += sprintf(str + ret, "IOT ");
> +
> +	return str;
> +}
> +
> +static inline char *cdns3_decode_epx_irq(char *str,
> +					 char *ep_name,
> +					 u32 ep_sts)
> +{
> +	return cdns3_decode_ep_irq(str, ep_sts, ep_name);
> +}
> +
> +static inline char *cdns3_decode_ep0_irq(char *str,
> +					 int dir,
> +					 u32 ep_sts)
> +{
> +	return cdns3_decode_ep_irq(str, ep_sts,
> +				   dir ? "ep0IN" : "ep0OUT");
> +}
> +
> +/**
> + * Debug a transfer ring.
> + *
> + * Prints out all TRBs in the endpoint ring, even those after the Link TRB.
> + *.
> + */
> +static inline char *cdns3_dbg_ring(struct cdns3_endpoint *priv_ep,
> +				   struct cdns3_trb *ring, char *str)
> +{
> +	dma_addr_t addr = priv_ep->trb_pool_dma;
> +	struct cdns3_trb *trb;
> +	int trb_per_sector;
> +	int ret = 0;
> +	int i;
> +
> +	trb_per_sector = GET_TRBS_PER_SEGMENT(priv_ep->type);
> +
> +	trb = &priv_ep->trb_pool[priv_ep->dequeue];
> +	ret += sprintf(str + ret, "\n\t\tRing contents for %s:", priv_ep->name);
> +
> +	ret += sprintf(str + ret,
> +		       "\n\t\tRing deq index: %d, trb: %p (virt), 0x%llx (dma)\n",
> +		       priv_ep->dequeue, trb,
> +		       (unsigned long long)cdns3_trb_virt_to_dma(priv_ep, trb));
> +
> +	trb = &priv_ep->trb_pool[priv_ep->enqueue];
> +	ret += sprintf(str + ret,
> +		       "\t\tRing enq index: %d, trb: %p (virt), 0x%llx (dma)\n",
> +		       priv_ep->enqueue, trb,
> +		       (unsigned long long)cdns3_trb_virt_to_dma(priv_ep, trb));
> +
> +	ret += sprintf(str + ret,
> +		       "\t\tfree trbs: %d, CCS=%d, PCS=%d\n",
> +		       priv_ep->free_trbs, priv_ep->ccs, priv_ep->pcs);
> +
> +	if (trb_per_sector > TRBS_PER_SEGMENT)
> +		trb_per_sector = TRBS_PER_SEGMENT;
> +
> +	if (trb_per_sector > TRBS_PER_SEGMENT) {
> +		sprintf(str + ret, "\t\tTo big transfer ring %d\n",
> +			trb_per_sector);
> +		return str;
> +	}
> +
> +	for (i = 0; i < trb_per_sector; ++i) {
> +		trb = &ring[i];
> +		ret += sprintf(str + ret,
> +			"\t\t@%pad %08x %08x %08x\n", &addr,
> +			le32_to_cpu(trb->buffer),
> +			le32_to_cpu(trb->length),
> +			le32_to_cpu(trb->control));
> +		addr += sizeof(*trb);
> +	}
> +
> +	return str;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +void cdns3_debugfs_init(struct cdns3 *cdns);
> +void cdns3_debugfs_exit(struct cdns3 *cdns);
> +#else
> +void cdns3_debugfs_init(struct cdns3 *cdns);
static inline void ...
> +{  }
> +void cdns3_debugfs_exit(struct cdns3 *cdns);

static inline void ...
> +{  }
> +#endif
> +
> +#endif /*__LINUX_CDNS3_DEBUG*/
> diff --git a/drivers/usb/cdns3/debugfs.c b/drivers/usb/cdns3/debugfs.c
> new file mode 100644
> index 000000000000..6a4dcde8dac9
> --- /dev/null
> +++ b/drivers/usb/cdns3/debugfs.c
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cadence USBSS DRD Controller DebugFS filer.
> + *
> + * Copyright (C) 2018-2019 Cadence.
> + *
> + * Author: Pawel Laszczak <pawell@cadence.com>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/uaccess.h>
> +
> +#include "core.h"
> +#include "gadget.h"
> +#include "drd.h"
> +
> +static int cdns3_mode_show(struct seq_file *s, void *unused)
> +{
> +	struct cdns3 *cdns = s->private;
> +
> +	seq_printf(s, "%s\n", usb_dr_mode_to_string(cdns->current_dr_mode));
> +	return 0;
> +}
> +
> +static int cdns3_mode_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, cdns3_mode_show, inode->i_private);
> +}
> +
> +static ssize_t cdns3_mode_write(struct file *file,
> +				const char __user *ubuf,
> +				size_t count, loff_t *ppos)
> +{
> +	struct seq_file	 *s = file->private_data;
> +	struct cdns3 *cdns = s->private;
> +	char buf[32];
> +	int ret;
> +
> +	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
> +		return -EFAULT;
> +
> +	buf[count - 1] = '\0';
> +
> +	ret = usb_get_dr_mode_from_string(buf);
> +	if (ret == USB_DR_MODE_UNKNOWN) {
> +		dev_err(cdns->dev, "Failed: incorrect mode setting\n");
> +		return -EINVAL;
> +	}
> +
> +	if (cdns->current_dr_mode != ret) {
> +		cdns->desired_dr_mode = ret;
> +
> +		if (cdns->role != USB_ROLE_NONE)
> +			usb_role_switch_set_role(cdns->role_sw, cdns->role);
> +
> +		usb_role_switch_set_role(cdns->role_sw, cdns->role);
> +	}
> +
> +	return count;
> +}

Why do we still need this debugfs interface?
Doesn't the role switch sysfs do the same thing?

> +
> +static const struct file_operations cdns3_mode_fops = {
> +	.open			= cdns3_mode_open,
> +	.write			= cdns3_mode_write,
> +	.read			= seq_read,
> +	.llseek			= seq_lseek,
> +	.release		= single_release,
> +};
> +
> +void cdns3_debugfs_init(struct cdns3 *cdns)
> +{
> +	struct dentry *root;
> +
> +	root = debugfs_create_dir(dev_name(cdns->dev), usb_debug_root);
> +	cdns->root = root;
> +	if (IS_ENABLED(CONFIG_USB_CDNS3_GADGET) &&
> +	    IS_ENABLED(CONFIG_USB_CDNS3_HOST))
> +		debugfs_create_file("mode", 0644, root, cdns,
> +				    &cdns3_mode_fops);
> +}
> +
> +void cdns3_debugfs_exit(struct cdns3 *cdns)
> +{
> +	debugfs_remove_recursive(cdns->root);
> +}
> diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
> new file mode 100644
> index 000000000000..77f8a1516140
> --- /dev/null
> +++ b/drivers/usb/cdns3/drd.c
> @@ -0,0 +1,390 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cadence USBSS DRD Driver.
> + *
> + * Copyright (C) 2018-2019 Cadence.
> + * Copyright (C) 2019 Texas Instruments
> + *
> + * Author: Pawel Laszczak <pawell@cadence.com>
> + *         Roger Quadros <rogerq@ti.com>
> + *
> + *
> + */
> +#include <linux/kernel.h>
> +#include <linux/interrupt.h>
> +#include <linux/delay.h>
> +#include <linux/iopoll.h>
> +#include <linux/usb/otg.h>
> +
> +#include "gadget.h"
> +#include "drd.h"
> +#include "core.h"
> +
> +/**
> + * cdns3_set_mode - change mode of OTG Core
> + * @cdns: pointer to context structure
> + * @mode: selected mode from cdns_role
> + *
> + * Returns 0 on success otherwise negative errno
> + */
> +int cdns3_set_mode(struct cdns3 *cdns, enum usb_dr_mode mode)
> +{
> +	int ret = 0;
> +	u32 reg;
> +
> +	cdns->current_dr_mode = mode;
> +
> +	switch (mode) {
> +	case USB_DR_MODE_PERIPHERAL:
> +		break;
> +	case USB_DR_MODE_HOST:
> +		break;
> +	case USB_DR_MODE_OTG:
> +		dev_dbg(cdns->dev, "Set controller to OTG mode\n");
> +		if (cdns->version == CDNS3_CONTROLLER_V1) {
> +			reg = readl(&cdns->otg_v1_regs->override);
> +			reg |= OVERRIDE_IDPULLUP;
> +			writel(reg, &cdns->otg_v1_regs->override);
> +		} else {
> +			reg = readl(&cdns->otg_v0_regs->ctrl1);
> +			reg |= OVERRIDE_IDPULLUP_V0;
> +			writel(reg, &cdns->otg_v0_regs->ctrl1);
> +		}
> +
> +		/*
> +		 * Hardware specification says: "ID_VALUE must be valid within
> +		 * 50ms after idpullup is set to '1" so driver must wait
> +		 * 50ms before reading this pin.
> +		 */
> +		usleep_range(50000, 60000);
> +		break;
> +	default:
> +		cdns->current_dr_mode = USB_DR_MODE_UNKNOWN;
> +		dev_err(cdns->dev, "Unsupported mode of operation %d\n", mode);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +int cdns3_get_id(struct cdns3 *cdns)
> +{
> +	int id;
> +
> +	id = readl(&cdns->otg_regs->sts) & OTGSTS_ID_VALUE;
> +	dev_dbg(cdns->dev, "OTG ID: %d", id);
> +
> +	return id;
> +}
> +
> +int cdns3_get_vbus(struct cdns3 *cdns)
> +{
> +	int vbus;
> +
> +	vbus = !!(readl(&cdns->otg_regs->sts) & OTGSTS_VBUS_VALID);
> +	dev_dbg(cdns->dev, "OTG VBUS: %d", vbus);
> +
> +	return vbus;
> +}
> +
> +int cdns3_is_host(struct cdns3 *cdns)
> +{
> +	if (cdns->current_dr_mode == USB_DR_MODE_HOST)
> +		return 1;
> +	else if (!cdns3_get_id(cdns))
> +		return 1;
> +
> +	return 0;
> +}
> +
> +int cdns3_is_device(struct cdns3 *cdns)
> +{
> +	if (cdns->current_dr_mode == USB_DR_MODE_PERIPHERAL)
> +		return 1;
> +	else if (cdns->current_dr_mode == USB_DR_MODE_OTG)
> +		if (cdns3_get_id(cdns))
> +			return 1;
> +
> +	return 0;
> +}
> +
> +/**
> + * cdns3_otg_disable_irq - Disable all OTG interrupts
> + * @cdns: Pointer to controller context structure
> + */
> +static void cdns3_otg_disable_irq(struct cdns3 *cdns)
> +{
> +	writel(0, &cdns->otg_regs->ien);
> +}
> +
> +/**
> + * cdns3_otg_enable_irq - enable id and sess_valid interrupts
> + * @cdns: Pointer to controller context structure
> + */
> +static void cdns3_otg_enable_irq(struct cdns3 *cdns)
> +{
> +	writel(OTGIEN_ID_CHANGE_INT | OTGIEN_VBUSVALID_RISE_INT |
> +	       OTGIEN_VBUSVALID_FALL_INT, &cdns->otg_regs->ien);
> +}
> +
> +/**
> + * cdns3_drd_switch_host - start/stop host
> + * @cdns: Pointer to controller context structure
> + * @on: 1 for start, 0 for stop
> + *
> + * Returns 0 on success otherwise negative errno
> + */
> +int cdns3_drd_switch_host(struct cdns3 *cdns, int on)
> +{
> +	int ret, val;
> +	u32 reg = OTGCMD_OTG_DIS;
> +
> +	/* switch OTG core */
> +	if (on) {
> +		writel(OTGCMD_HOST_BUS_REQ | reg, &cdns->otg_regs->cmd);
> +
> +		dev_dbg(cdns->dev, "Waiting till Host mode is turned on\n");
> +		ret = readl_poll_timeout_atomic(&cdns->otg_regs->sts, val,
> +						val & OTGSTS_XHCI_READY,
> +						1, 100000);
> +		if (ret) {
> +			dev_err(cdns->dev, "timeout waiting for xhci_ready\n");
> +			return ret;
> +		}
> +	} else {
> +		writel(OTGCMD_HOST_BUS_DROP | OTGCMD_DEV_BUS_DROP |
> +		       OTGCMD_DEV_POWER_OFF | OTGCMD_HOST_POWER_OFF,
> +		       &cdns->otg_regs->cmd);
> +		/* Waiting till H_IDLE state.*/
> +		readl_poll_timeout_atomic(&cdns->otg_regs->state, val,
> +					  !(val & OTGSTATE_HOST_STATE_MASK),
> +					  1, 2000000);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * cdns3_drd_switch_gadget - start/stop gadget
> + * @cdns: Pointer to controller context structure
> + * @on: 1 for start, 0 for stop
> + *
> + * Returns 0 on success otherwise negative errno
> + */
> +int cdns3_drd_switch_gadget(struct cdns3 *cdns, int on)
> +{
> +	int ret, val;
> +	u32 reg = OTGCMD_OTG_DIS;
> +
> +	/* switch OTG core */
> +	if (on) {
> +		writel(OTGCMD_DEV_BUS_REQ | reg, &cdns->otg_regs->cmd);
> +
> +		dev_dbg(cdns->dev, "Waiting till Device mode is turned on\n");
> +
> +		ret = readl_poll_timeout_atomic(&cdns->otg_regs->sts, val,
> +						val & OTGSTS_DEV_READY,
> +						1, 100000);
> +		if (ret) {
> +			dev_err(cdns->dev, "timeout waiting for dev_ready\n");
> +			return ret;
> +		}
> +	} else {
> +		/*
> +		 * driver should wait at least 10us after disabling Device
> +		 * before turning-off Device (DEV_BUS_DROP)
> +		 */
> +		usleep_range(20, 30);
> +		writel(OTGCMD_HOST_BUS_DROP | OTGCMD_DEV_BUS_DROP |
> +		       OTGCMD_DEV_POWER_OFF | OTGCMD_HOST_POWER_OFF,
> +		       &cdns->otg_regs->cmd);
> +		/* Waiting till DEV_IDLE state.*/
> +		readl_poll_timeout_atomic(&cdns->otg_regs->state, val,
> +					  !(val & OTGSTATE_DEV_STATE_MASK),
> +					  1, 2000000);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * cdns3_init_otg_mode - initialize drd controller
> + * @cdns: Pointer to controller context structure
> + *
> + * Returns 0 on success otherwise negative errno
> + */
> +static int cdns3_init_otg_mode(struct cdns3 *cdns)
> +{
> +	int ret = 0;
> +
> +	cdns3_otg_disable_irq(cdns);
> +	/* clear all interrupts */
> +	writel(~0, &cdns->otg_regs->ivect);
> +
> +	ret = cdns3_set_mode(cdns, USB_DR_MODE_OTG);
> +	if (ret)
> +		return ret;
> +
> +	cdns3_otg_enable_irq(cdns);
> +	return ret;
> +}
> +
> +/**
> + * cdns3_drd_update_mode - initialize mode of operation
> + * @cdns: Pointer to controller context structure
> + *
> + * Returns 0 on success otherwise negative errno
> + */
> +int cdns3_drd_update_mode(struct cdns3 *cdns)
> +{
> +	int ret = 0;
> +
> +	if (cdns->desired_dr_mode == cdns->current_dr_mode)
> +		return ret;
> +
> +	switch (cdns->desired_dr_mode) {
> +	case USB_DR_MODE_PERIPHERAL:
> +		ret = cdns3_set_mode(cdns, USB_DR_MODE_PERIPHERAL);
> +		break;
> +	case USB_DR_MODE_HOST:
> +		ret = cdns3_set_mode(cdns, USB_DR_MODE_HOST);
> +		break;
> +	case USB_DR_MODE_OTG:
> +		ret = cdns3_init_otg_mode(cdns);
> +		break;
> +	default:
> +		dev_err(cdns->dev, "Unsupported mode of operation %d\n",
> +			cdns->dr_mode);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static irqreturn_t cdns3_drd_thread_irq(int irq, void *data)
> +{
> +	struct cdns3 *cdns = data;
> +
> +	usb_role_switch_set_role(cdns->role_sw, cdns->role);

How to ensure that HW events don't step over user chosen role?

> +
> +	return IRQ_HANDLED;
> +}
> +
> +/**
> + * cdns3_drd_irq - interrupt handler for OTG events
> + *
> + * @irq: irq number for cdns3 core device
> + * @data: structure of cdns3
> + *
> + * Returns IRQ_HANDLED or IRQ_NONE
> + */
> +static irqreturn_t cdns3_drd_irq(int irq, void *data)
> +{
> +	irqreturn_t ret = IRQ_NONE;
> +	struct cdns3 *cdns = data;
> +	u32 reg;
> +
> +	if (cdns->dr_mode != USB_DR_MODE_OTG)
> +		return ret;
> +
> +	reg = readl(&cdns->otg_regs->ivect);
> +
> +	if (!reg)
> +		return ret;
> +
> +	if (reg & OTGIEN_ID_CHANGE_INT) {
> +		dev_dbg(cdns->dev, "OTG IRQ: new ID: %d\n",
> +			cdns3_get_id(cdns));
> +
> +		ret = IRQ_WAKE_THREAD;
> +	}
> +
> +	if (reg & (OTGIEN_VBUSVALID_RISE_INT | OTGIEN_VBUSVALID_FALL_INT)) {
> +		dev_dbg(cdns->dev, "OTG IRQ: new VBUS: %d\n",
> +			cdns3_get_vbus(cdns));
> +
> +		ret = IRQ_WAKE_THREAD;
> +	}
> +
> +	writel(~0, &cdns->otg_regs->ivect);

Do we need to keep the events masked till IRQ thread handler completes?
Else we can get a new hard irq even before previous event is handled by the thread.

> +	return ret;
> +}
> +
> +int cdns3_drd_init(struct cdns3 *cdns)
> +{
> +	void __iomem *regs;
> +	int ret = 0;
> +	u32 state;
> +
> +	regs = devm_ioremap_resource(cdns->dev, &cdns->otg_res);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	/* Detection of DRD version. Controller has been released
> +	 * in two versions. Both are similar, but they have same changes
> +	 * in register maps.
> +	 * The first register in old version is command register and it's read
> +	 * only, so driver should read 0 from it. On the other hand, in v1
> +	 * the first register contains device ID number which is not set to 0.
> +	 * Driver uses this fact to detect the proper version of
> +	 * controller.
> +	 */
> +	cdns->otg_v0_regs = regs;
> +	if (!readl(&cdns->otg_v0_regs->cmd)) {
> +		cdns->version  = CDNS3_CONTROLLER_V0;
> +		cdns->otg_v1_regs = NULL;
> +		cdns->otg_regs = regs;
> +		writel(1, &cdns->otg_v0_regs->simulate);
> +		dev_info(cdns->dev, "DRD version v0 (%08x)\n",
> +			 readl(&cdns->otg_v0_regs->version));
> +	} else {
> +		cdns->otg_v0_regs = NULL;
> +		cdns->otg_v1_regs = regs;
> +		cdns->otg_regs = (void *)&cdns->otg_v1_regs->cmd;
> +		cdns->version  = CDNS3_CONTROLLER_V1;
> +		writel(1, &cdns->otg_v1_regs->simulate);
> +		dev_info(cdns->dev, "DRD version v1 (ID: %08x, rev: %08x)\n",
> +			 readl(&cdns->otg_v1_regs->did),
> +			 readl(&cdns->otg_v1_regs->rid));
> +	}
> +
> +	state = OTGSTS_STRAP(readl(&cdns->otg_regs->sts));
> +
> +	/* Update dr_mode according to STRAP configuration. */
> +	cdns->dr_mode = USB_DR_MODE_OTG;
> +	if (state == OTGSTS_STRAP_HOST) {
> +		dev_dbg(cdns->dev, "Controller strapped to HOST\n");
> +		cdns->dr_mode = USB_DR_MODE_HOST;
> +	} else if (state == OTGSTS_STRAP_GADGET) {
> +		dev_dbg(cdns->dev, "Controller strapped to PERIPHERAL\n");
> +		cdns->dr_mode = USB_DR_MODE_PERIPHERAL;
> +	}
> +
> +	cdns->desired_dr_mode = cdns->dr_mode;
> +	cdns->current_dr_mode = USB_DR_MODE_UNKNOWN;
> +
> +	ret = devm_request_threaded_irq(cdns->dev, cdns->otg_irq,
> +					cdns3_drd_irq,
> +					cdns3_drd_thread_irq,
> +					IRQF_SHARED,
> +					dev_name(cdns->dev), cdns);
> +
> +	if (ret) {
> +		dev_err(cdns->dev, "couldn't get otg_irq\n");
> +		return ret;
> +	}
> +
> +	state = readl(&cdns->otg_regs->sts);
> +	if (OTGSTS_OTG_NRDY(state) != 0) {
> +		dev_err(cdns->dev, "Cadence USB3 OTG device not ready\n");
> +		return -ENODEV;
> +	}
> +
> +	return ret;
> +}
> +
> +int cdns3_drd_exit(struct cdns3 *cdns)
> +{
> +	cdns3_otg_disable_irq(cdns);
> +	return 0;
> +}
> diff --git a/drivers/usb/cdns3/drd.h b/drivers/usb/cdns3/drd.h
> new file mode 100644
> index 000000000000..bf6c7bc41b58
> --- /dev/null
> +++ b/drivers/usb/cdns3/drd.h
> @@ -0,0 +1,166 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Cadence USB3 DRD header file.
> + *
> + * Copyright (C) 2018-2019 Cadence.
> + *
> + * Author: Pawel Laszczak <pawell@cadence.com>
> + */
> +#ifndef __LINUX_CDNS3_DRD
> +#define __LINUX_CDNS3_DRD
> +
> +#include <linux/usb/otg.h>
> +#include <linux/phy/phy.h>
> +#include "core.h"
> +
> +/*  DRD register interface for version v1. */
> +struct cdns3_otg_regs {
> +	__le32 did;
> +	__le32 rid;
> +	__le32 capabilities;
> +	__le32 reserved1;
> +	__le32 cmd;
> +	__le32 sts;
> +	__le32 state;
> +	__le32 reserved2;
> +	__le32 ien;
> +	__le32 ivect;
> +	__le32 refclk;
> +	__le32 tmr;
> +	__le32 reserved3[4];
> +	__le32 simulate;
> +	__le32 override;
> +	__le32 susp_ctrl;
> +	__le32 reserved4;
> +	__le32 anasts;
> +	__le32 adp_ramp_time;
> +	__le32 ctrl1;
> +	__le32 ctrl2;
> +};
> +
> +/*  DRD register interface for version v0. */
> +struct cdns3_otg_legacy_regs {
> +	__le32 cmd;
> +	__le32 sts;
> +	__le32 state;
> +	__le32 refclk;
> +	__le32 ien;
> +	__le32 ivect;
> +	__le32 reserved1[3];
> +	__le32 tmr;
> +	__le32 reserved2[2];
> +	__le32 version;
> +	__le32 capabilities;
> +	__le32 reserved3[2];
> +	__le32 simulate;
> +	__le32 reserved4[5];
> +	__le32 ctrl1;
> +};
> +
> +/*
> + * Common registers interface for both version of DRD.
> + */
> +struct cdns3_otg_common_regs {
> +	__le32 cmd;
> +	__le32 sts;
> +	__le32 state;
> +	__le32 different1;
> +	__le32 ien;
> +	__le32 ivect;
> +};
> +
> +/* CDNS_RID - bitmasks */
> +#define CDNS_RID(p)			((p) & GENMASK(15, 0))
> +
> +/* CDNS_VID - bitmasks */
> +#define CDNS_DID(p)			((p) & GENMASK(31, 0))
> +
> +/* OTGCMD - bitmasks */
> +/* "Request the bus for Device mode. */
> +#define OTGCMD_DEV_BUS_REQ		BIT(0)
> +/* Request the bus for Host mode */
> +#define OTGCMD_HOST_BUS_REQ		BIT(1)
> +/* Enable OTG mode. */
> +#define OTGCMD_OTG_EN			BIT(2)
> +/* Disable OTG mode */
> +#define OTGCMD_OTG_DIS			BIT(3)
> +/*"Configure OTG as A-Device. */
> +#define OTGCMD_A_DEV_EN			BIT(4)
> +/*"Configure OTG as A-Device. */
> +#define OTGCMD_A_DEV_DIS		BIT(5)
> +/* Drop the bus for Device mod	e. */
> +#define OTGCMD_DEV_BUS_DROP		BIT(8)
> +/* Drop the bus for Host mode*/
> +#define OTGCMD_HOST_BUS_DROP		BIT(9)
> +/* Power Down USBSS-DEV. */
> +#define OTGCMD_DEV_POWER_OFF		BIT(11)
> +/* Power Down CDNSXHCI. */
> +#define OTGCMD_HOST_POWER_OFF		BIT(12)
> +
> +/* OTGIEN - bitmasks */
> +/* ID change interrupt enable */
> +#define OTGIEN_ID_CHANGE_INT		BIT(0)
> +/* Vbusvalid fall detected interrupt enable.*/
> +#define OTGIEN_VBUSVALID_RISE_INT	BIT(4)
> +/* Vbusvalid fall detected interrupt enable */
> +#define OTGIEN_VBUSVALID_FALL_INT	BIT(5)
> +
> +/* OTGSTS - bitmasks */
> +/*
> + * Current value of the ID pin. It is only valid when idpullup in
> + *  OTGCTRL1_TYPE register is set to '1'.
> + */
> +#define OTGSTS_ID_VALUE			BIT(0)
> +/* Current value of the vbus_valid */
> +#define OTGSTS_VBUS_VALID		BIT(1)
> +/* Current value of the b_sess_vld */
> +#define OTGSTS_SESSION_VALID		BIT(2)
> +/*Device mode is active*/
> +#define OTGSTS_DEV_ACTIVE		BIT(3)
> +/* Host mode is active. */
> +#define OTGSTS_HOST_ACTIVE		BIT(4)
> +/* OTG Controller not ready. */
> +#define OTGSTS_OTG_NRDY_MASK		BIT(11)
> +#define OTGSTS_OTG_NRDY(p)		((p) & OTGSTS_OTG_NRDY_MASK)
> +/*
> + * Value of the strap pins.
> + * 000 - no default configuration
> + * 010 - Controller initiall configured as Host
> + * 100 - Controller initially configured as Device
> + */
> +#define OTGSTS_STRAP(p)			(((p) & GENMASK(14, 12)) >> 12)
> +#define OTGSTS_STRAP_NO_DEFAULT_CFG	0x00
> +#define OTGSTS_STRAP_HOST_OTG		0x01
> +#define OTGSTS_STRAP_HOST		0x02
> +#define OTGSTS_STRAP_GADGET		0x04
> +/* Host mode is turned on. */
> +#define OTGSTS_XHCI_READY		BIT(26)
> +/* "Device mode is turned on .*/
> +#define OTGSTS_DEV_READY		BIT(27)
> +
> +/* OTGSTATE- bitmasks */
> +#define OTGSTATE_DEV_STATE_MASK		GENMASK(2, 0)
> +#define OTGSTATE_HOST_STATE_MASK	GENMASK(5, 3)
> +#define OTGSTATE_HOST_STATE_IDLE	0x0
> +#define OTGSTATE_HOST_STATE_VBUS_FALL	0x7
> +#define OTGSTATE_HOST_STATE(p)		(((p) & OTGSTATE_HOST_STATE_MASK) >> 3)
> +
> +/* OTGREFCLK - bitmasks */
> +#define OTGREFCLK_STB_CLK_SWITCH_EN	BIT(31)
> +
> +/* OVERRIDE - bitmasks */
> +#define OVERRIDE_IDPULLUP		BIT(0)
> +/* Only for CDNS3_CONTROLLER_V0 version */
> +#define OVERRIDE_IDPULLUP_V0		BIT(24)
> +
> +int cdns3_is_host(struct cdns3 *cdns);
> +int cdns3_is_device(struct cdns3 *cdns);
> +int cdns3_get_id(struct cdns3 *cdns);
> +int cdns3_get_vbus(struct cdns3 *cdns);
> +int cdns3_drd_init(struct cdns3 *cdns);
> +int cdns3_drd_exit(struct cdns3 *cdns);
> +int cdns3_drd_update_mode(struct cdns3 *cdns);
> +int cdns3_drd_switch_gadget(struct cdns3 *cdns, int on);
> +int cdns3_drd_switch_host(struct cdns3 *cdns, int on);
> +
> +#endif /* __LINUX_CDNS3_DRD */

<snip>

> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> new file mode 100644
> index 000000000000..291f08be56fe
> --- /dev/null
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -0,0 +1,2338 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cadence USBSS DRD Driver - gadget side.
> + *
> + * Copyright (C) 2018-2019 Cadence Design Systems.
> + * Copyright (C) 2017-2018 NXP
> + *
> + * Authors: Pawel Jez <pjez@cadence.com>,
> + *          Pawel Laszczak <pawell@cadence.com>
> + *          Peter Chen <peter.chen@nxp.com>
> + */
> +

<snip>

> +/**
> + * cdns3_device_irq_handler- interrupt handler for device part of controller
> + *
> + * @irq: irq number for cdns3 core device
> + * @data: structure of cdns3
> + *
> + * Returns IRQ_HANDLED or IRQ_NONE
> + */
> +static irqreturn_t cdns3_device_irq_handler(int irq, void *data)
> +{
> +	struct cdns3_device *priv_dev;
> +	struct cdns3 *cdns = data;
> +	irqreturn_t ret = IRQ_NONE;
> +	unsigned long flags;
> +	u32 reg;
> +
> +	priv_dev = cdns->gadget_dev;
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +
> +	/* check USB device interrupt */
> +	reg = readl(&priv_dev->regs->usb_ists);
> +
> +	if (reg) {
> +		writel(reg, &priv_dev->regs->usb_ists);

Do we need to mask device interrupts till thread handler has done processing
current set of events?

> +		cdns3_check_usb_interrupt_proceed(priv_dev, reg);
> +		ret = IRQ_HANDLED;
> +	}
> +
> +	/* check endpoint interrupt */
> +	reg = readl(&priv_dev->regs->ep_ists);
> +
> +	if (reg) {
> +		priv_dev->shadow_ep_en |= reg;
> +		reg = ~reg & readl(&priv_dev->regs->ep_ien);
> +		/* mask deferred interrupt. */
> +		writel(reg, &priv_dev->regs->ep_ien);
> +		ret = IRQ_WAKE_THREAD;
> +	}
> +
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return ret;
> +}
> +

<snip>

> +
> +static int cdns3_gadget_start(struct cdns3 *cdns)
> +{
> +	struct cdns3_device *priv_dev;
> +	u32 max_speed;
> +	int ret;
> +
> +	priv_dev = kzalloc(sizeof(*priv_dev), GFP_KERNEL);
> +	if (!priv_dev)
> +		return -ENOMEM;
> +
> +	cdns->gadget_dev = priv_dev;
> +	priv_dev->sysdev = cdns->dev;
> +	priv_dev->dev = cdns->dev;
> +	priv_dev->regs = cdns->dev_regs;
> +
> +	device_property_read_u16(priv_dev->dev, "cdns,on-chip-buff-size",
> +				 &priv_dev->onchip_buffers);
> +
> +	if (priv_dev->onchip_buffers <=  0) {
> +		u32 reg = readl(&priv_dev->regs->usb_cap2);
> +
> +		priv_dev->onchip_buffers = USB_CAP2_ACTUAL_MEM_SIZE(reg);
> +	}
> +
> +	if (!priv_dev->onchip_buffers)
> +		priv_dev->onchip_buffers = 256;
> +
> +	max_speed = usb_get_maximum_speed(cdns->dev);
> +
> +	/* Check the maximum_speed parameter */
> +	switch (max_speed) {
> +	case USB_SPEED_FULL:

In this case we need to limit controller max speed to full-speed as system
integrator would expect that. e.g. in DT node, maximum-speed = "full-speed";

I suppose we need to set the force Full-speed bit here?

> +	case USB_SPEED_HIGH:

Here we need to restrict device controller max-speed to high-speed.

> +	case USB_SPEED_SUPER:
> +		break;
> +	default:
> +		dev_err(cdns->dev, "invalid maximum_speed parameter %d\n",
> +			max_speed);
> +		/* fall through */
> +	case USB_SPEED_UNKNOWN:
> +		/* default to superspeed */
> +		max_speed = USB_SPEED_SUPER;
> +		break;
> +	}
> +
> +	/* fill gadget fields */
> +	priv_dev->gadget.max_speed = max_speed;
> +	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
> +	priv_dev->gadget.ops = &cdns3_gadget_ops;
> +	priv_dev->gadget.name = "usb-ss-gadget";
> +	priv_dev->gadget.sg_supported = 1;
> +
> +	spin_lock_init(&priv_dev->lock);
> +	INIT_WORK(&priv_dev->pending_status_wq,
> +		  cdns3_pending_setup_status_handler);
> +
> +	/* initialize endpoint container */
> +	INIT_LIST_HEAD(&priv_dev->gadget.ep_list);
> +	INIT_LIST_HEAD(&priv_dev->aligned_buf_list);
> +
> +	ret = cdns3_init_eps(priv_dev);
> +	if (ret) {
> +		dev_err(priv_dev->dev, "Failed to create endpoints\n");
> +		goto err1;
> +	}
> +
> +	/* allocate memory for setup packet buffer */
> +	priv_dev->setup_buf = dma_alloc_coherent(priv_dev->sysdev, 8,
> +						 &priv_dev->setup_dma, GFP_DMA);
> +	if (!priv_dev->setup_buf) {
> +		ret = -ENOMEM;
> +		goto err2;
> +	}
> +
> +	priv_dev->dev_ver = readl(&priv_dev->regs->usb_cap6);
> +
> +	dev_dbg(priv_dev->dev, "Device Controller version: %08x\n",
> +		readl(&priv_dev->regs->usb_cap6));
> +	dev_dbg(priv_dev->dev, "USB Capabilities:: %08x\n",
> +		readl(&priv_dev->regs->usb_cap1));
> +	dev_dbg(priv_dev->dev, "On-Chip memory cnfiguration: %08x\n",
> +		readl(&priv_dev->regs->usb_cap2));
> +
> +	priv_dev->dev_ver = GET_DEV_BASE_VERSION(priv_dev->dev_ver);
> +
> +	priv_dev->zlp_buf = kzalloc(CDNS3_EP_ZLP_BUF_SIZE, GFP_KERNEL);
> +	if (!priv_dev->zlp_buf) {
> +		ret = -ENOMEM;
> +		goto err3;
> +	}
> +
> +	/* add USB gadget device */
> +	ret = usb_add_gadget_udc(priv_dev->dev, &priv_dev->gadget);
> +	if (ret < 0) {
> +		dev_err(priv_dev->dev,
> +			"Failed to register USB device controller\n");
> +		goto err4;
> +	}
> +
> +	return 0;
> +err4:
> +	kfree(priv_dev->zlp_buf);
> +err3:
> +	dma_free_coherent(priv_dev->sysdev, 8, priv_dev->setup_buf,
> +			  priv_dev->setup_dma);
> +err2:
> +	cdns3_free_all_eps(priv_dev);
> +err1:
> +	cdns->gadget_dev = NULL;
> +	return ret;
> +}
> +

<snip>

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
