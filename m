Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2FFA9C72F
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 04:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfHZCRO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Aug 2019 22:17:14 -0400
Received: from mail-eopbgr70041.outbound.protection.outlook.com ([40.107.7.41]:17617
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726434AbfHZCRO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Aug 2019 22:17:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilfqEOTemd7nlKpMF6Y+yjqSExP9l2TBnfOiICvY8gcSqbXZDS/utfvHEOC17nDtY40/JYG5Pf80AHvRV4w1Dq+2YY1+IxxkxZ4vKE5tclBkTHwGcqILk4ogc6o3RdvE0bYRwTFum/k5mrvRTHog1Es2BYVf0xvZjVM69dVaxY3CHhhOLnMJ2+SBCyb3L8pRsQu6cM4ckjKNn4vMTVJrpNj2QmdRbCUo23OKm6oTzz/xznLS/nEONRZCJQkaVvr5uLVLFuAWxYZKPnRI05wEk6R6avGXMcqZgR983TX6xyvl2AYTuL/PWPftNRdIDgfvjQemX4EIxarB3BFYYTFzOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UO0jobrWbiCVxEyD+zw0yWmzItCAco1sSq/OzFOC5Bg=;
 b=HlSFt/RcGNNDHKi3mnOBOj3KOp4hgZNMlXn2E2je7UQqG5qsdi2TfQ2OEvy2005zeuRA4G+5DEuj4HBlFT6BlEqEUsCUrWsMzWnFSazYk7twWat1vBQdHdUoOJrH36/rtcTPnCxpjLn11saBzllOtBrQK4b1CBS58MVT3UXN5h/ARah2soam6/j9HWpc3jAA2NAdo7iLPwlAMDWaqCKe1wiGMohXWDNnSDApfYO6YlhmsTj6SOLiYf8lnnz8ajQmQ/35CC+lt9e/+4diHg0WxYt8+sbSlNh03ahzpKMbuoKI21/CH78Oi14v4Gf3gcfl2OQaErBrARo+hx7Cx1wWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UO0jobrWbiCVxEyD+zw0yWmzItCAco1sSq/OzFOC5Bg=;
 b=rtRpR+sRiehQuHkXqsAkFJ/MyYA/hQd0Grw/Q//UID1/xK6r5jDnKP9IDbMbEzh6eLeZ0rfAGQMziA3K5iXTvbVOLh5jReZoxeRfeVMPDSztaTRMbtO3ZHbMm3Vcj3bN85kA6+kvp0X7GNXGFllidQ0NH7/r9era2MDHxqtLk7k=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB6334.eurprd04.prod.outlook.com (20.179.28.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 02:16:17 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a%4]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 02:16:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Pawel Laszczak <pawell@cadence.com>
CC:     "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jbergsagel@ti.com" <jbergsagel@ti.com>,
        "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>,
        "sureshp@cadence.com" <sureshp@cadence.com>,
        "jpawar@cadence.com" <jpawar@cadence.com>,
        "kurahul@cadence.com" <kurahul@cadence.com>,
        "aniljoy@cadence.com" <aniljoy@cadence.com>
Subject: Re: [PATCH v10 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Thread-Topic: [PATCH v10 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Thread-Index: AQHVP/LzINxqurpIx0u0mwY+o5QU+KcM59CA
Date:   Mon, 26 Aug 2019 02:16:17 +0000
Message-ID: <20190826021331.whfm7edlnxvjss63@b29397-desktop>
References: <1563733939-21214-1-git-send-email-pawell@cadence.com>
 <1563733939-21214-6-git-send-email-pawell@cadence.com>
In-Reply-To: <1563733939-21214-6-git-send-email-pawell@cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e3c4358-810c-4cef-cd7a-08d729cb60e5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB6334;
x-ms-traffictypediagnostic: VI1PR04MB6334:
x-microsoft-antispam-prvs: <VI1PR04MB63345E308C5EBD289BFB71838BA10@VI1PR04MB6334.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(199004)(189003)(51234002)(7736002)(6116002)(6436002)(8676002)(6486002)(316002)(14454004)(476003)(486006)(44832011)(5660300002)(53936002)(11346002)(446003)(1076003)(25786009)(4326008)(53946003)(6512007)(6246003)(9686003)(478600001)(30864003)(3846002)(66946007)(91956017)(2906002)(76116006)(66446008)(64756008)(66556008)(66476007)(186003)(229853002)(71190400001)(71200400001)(256004)(14444005)(102836004)(53546011)(6506007)(26005)(33716001)(81156014)(81166006)(66066001)(6916009)(86362001)(8936002)(99286004)(305945005)(7416002)(76176011)(54906003)(569006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6334;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UvW6pP/RAr0+ABLAACwpN5IIUYwAzJwWgYNZ/v8R11R4pCzTIveB53v37z7+5duNppIhcN8QKv9uizDeogPkMi6NdbMc+AsnCR2yykGi3/lb7Ey7WLy9zN2aBAtoRU2CtG41MTvqegGQAta4qzA1bczohlSGQGzSu81gJYLih6iy5V9tOXfYVIPw6MrNFNDRwPGfiYPvi96sZtrd84gAGm01TAaij6DbZ+7jsM+a/Ko+lKNjSqEohymb4qV1QapmdYSoEhtrNsUyxdIXBl0KrqhiGuHUXJ5Alt5Yka7XTkRwJr5Rom3GuQ7B4CkY6lCdoZL03MESqkEyTcGuh+BVLlg5jYVsWb13L21KQzuLEnHHlt57HcXSwKyB5bp4kwNcuCEtLVvjPnlcgv3mWnlSEpY7Wvju9sD0v7mgeXLkkPM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <296D7D45A5FADC4BAC4B8E1350A84600@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3c4358-810c-4cef-cd7a-08d729cb60e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 02:16:17.4269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KpWyq7CM93P+GBkZcfR7iCLM9n0T5okyFSYNjND5oy2d+MD5QIzHPYHvjC2bPetL3mA7Im+qnWBGqpd/CTh6OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6334
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-07-21 19:32:18, Pawel Laszczak wrote:
> This patch introduce new Cadence USBSS DRD driver to Linux kernel.
>=20
> The Cadence USBSS DRD Controller is a highly configurable IP Core which
> can be instantiated as Dual-Role Device (DRD), Peripheral Only and
> Host Only (XHCI)configurations.
>=20
> The current driver has been validated with FPGA platform. We have
> support for PCIe bus, which is used on FPGA prototyping.
>=20
> The host side of USBSS-DRD controller is compliant with XHCI
> specification, so it works with standard XHCI Linux driver.
>=20
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
>=20

Pawel, one question duirng my debug, what's purpose
for below code:
function: cdns3_gadget_ep_dequeue

	/* Update ring */
	request =3D cdns3_next_request(&priv_ep->deferred_req_list);
	if (request) {
		priv_req =3D to_cdns3_request(request);

		link_trb->buffer =3D TRB_BUFFER(priv_ep->trb_pool_dma +
					      (priv_req->start_trb * TRB_SIZE));
		link_trb->control =3D (link_trb->control & TRB_CYCLE) |
				    TRB_TYPE(TRB_LINK) | TRB_CHAIN | TRB_TOGGLE;
	} else {
		priv_ep->flags |=3D EP_UPDATE_EP_TRBADDR;
	}

Besides, would you please cc me when you send next version?
Thanks,

Peter

> diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
> index e4b27413f528..c2e78882f8c2 100644
> --- a/drivers/usb/Kconfig
> +++ b/drivers/usb/Kconfig
> @@ -113,6 +113,8 @@ source "drivers/usb/usbip/Kconfig"
> =20
>  endif
> =20
> +source "drivers/usb/cdns3/Kconfig"
> +
>  source "drivers/usb/mtu3/Kconfig"
> =20
>  source "drivers/usb/musb/Kconfig"
> diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
> index 7d1b8c82b208..ab125b966cac 100644
> --- a/drivers/usb/Makefile
> +++ b/drivers/usb/Makefile
> @@ -12,6 +12,8 @@ obj-$(CONFIG_USB_DWC3)		+=3D dwc3/
>  obj-$(CONFIG_USB_DWC2)		+=3D dwc2/
>  obj-$(CONFIG_USB_ISP1760)	+=3D isp1760/
> =20
> +obj-$(CONFIG_USB_CDNS3)		+=3D cdns3/
> +
>  obj-$(CONFIG_USB_MON)		+=3D mon/
>  obj-$(CONFIG_USB_MTU3)		+=3D mtu3/
> =20
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
> +	depends on USB_GADGET=3Dy || USB_GADGET=3DUSB_CDNS3
> +	help
> +	  Say Y here to enable device controller functionality of the
> +	  Cadence USBSS-DEV driver.
> +
> +	  This controller supports FF, HS and SS mode. It doesn't support
> +	  LS and SSP mode.
> +
> +config USB_CDNS3_HOST
> +	bool "Cadence USB3 host controller"
> +	depends on USB=3Dy || USB=3DUSB_CDNS3
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
> +CFLAGS_trace.o				:=3D -I$(src)
> +
> +cdns3-y					:=3D core.o drd.o
> +
> +obj-$(CONFIG_USB_CDNS3)			+=3D cdns3.o
> +cdns3-$(CONFIG_DEBUG_FS)		+=3D debugfs.o
> +cdns3-$(CONFIG_USB_CDNS3_GADGET)	+=3D gadget.o ep0.o
> +
> +ifneq ($(CONFIG_USB_CDNS3_GADGET),)
> +cdns3-$(CONFIG_TRACING)			+=3D trace.o
> +endif
> +
> +cdns3-$(CONFIG_USB_CDNS3_HOST)		+=3D host.o
> +
> +obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+=3D cdns3-pci-wrap.o
> diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3=
-pci-wrap.c
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
> +	func =3D pci_get_device(pdev->vendor, pdev->device, NULL);
> +	if (unlikely(!func))
> +		return NULL;
> +
> +	if (func->devfn =3D=3D pdev->devfn) {
> +		func =3D pci_get_device(pdev->vendor, pdev->device, func);
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
> +	if (!id || (pdev->devfn !=3D PCI_DEV_FN_HOST_DEVICE &&
> +		    pdev->devfn !=3D PCI_DEV_FN_OTG))
> +		return -EINVAL;
> +
> +	func =3D cdns3_get_second_fun(pdev);
> +	if (unlikely(!func))
> +		return -EINVAL;
> +
> +	err =3D pcim_enable_device(pdev);
> +	if (err) {
> +		dev_err(&pdev->dev, "Enabling PCI device has failed %d\n", err);
> +		return err;
> +	}
> +
> +	pci_set_master(pdev);
> +
> +	if (pci_is_enabled(func)) {
> +		wrap =3D pci_get_drvdata(func);
> +	} else {
> +		wrap =3D kzalloc(sizeof(*wrap), GFP_KERNEL);
> +		if (!wrap) {
> +			pci_disable_device(pdev);
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	res =3D wrap->dev_res;
> +
> +	if (pdev->devfn =3D=3D PCI_DEV_FN_HOST_DEVICE) {
> +		/* function 0: host(BAR_0) + device(BAR_1).*/
> +		dev_dbg(&pdev->dev, "Initialize Device resources\n");
> +		res[RES_DEV_ID].start =3D pci_resource_start(pdev, PCI_BAR_DEV);
> +		res[RES_DEV_ID].end =3D   pci_resource_end(pdev, PCI_BAR_DEV);
> +		res[RES_DEV_ID].name =3D "dev";
> +		res[RES_DEV_ID].flags =3D IORESOURCE_MEM;
> +		dev_dbg(&pdev->dev, "USBSS-DEV physical base addr: %pa\n",
> +			&res[RES_DEV_ID].start);
> +
> +		res[RES_HOST_ID].start =3D pci_resource_start(pdev, PCI_BAR_HOST);
> +		res[RES_HOST_ID].end =3D pci_resource_end(pdev, PCI_BAR_HOST);
> +		res[RES_HOST_ID].name =3D "xhci";
> +		res[RES_HOST_ID].flags =3D IORESOURCE_MEM;
> +		dev_dbg(&pdev->dev, "USBSS-XHCI physical base addr: %pa\n",
> +			&res[RES_HOST_ID].start);
> +
> +		/* Interrupt for XHCI */
> +		wrap->dev_res[RES_IRQ_HOST_ID].start =3D pdev->irq;
> +		wrap->dev_res[RES_IRQ_HOST_ID].name =3D "host";
> +		wrap->dev_res[RES_IRQ_HOST_ID].flags =3D IORESOURCE_IRQ;
> +
> +		/* Interrupt device. It's the same as for HOST. */
> +		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].start =3D pdev->irq;
> +		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].name =3D "peripheral";
> +		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].flags =3D IORESOURCE_IRQ;
> +	} else {
> +		res[RES_DRD_ID].start =3D pci_resource_start(pdev, PCI_BAR_OTG);
> +		res[RES_DRD_ID].end =3D   pci_resource_end(pdev, PCI_BAR_OTG);
> +		res[RES_DRD_ID].name =3D "otg";
> +		res[RES_DRD_ID].flags =3D IORESOURCE_MEM;
> +		dev_dbg(&pdev->dev, "USBSS-DRD physical base addr: %pa\n",
> +			&res[RES_DRD_ID].start);
> +
> +		/* Interrupt for OTG/DRD. */
> +		wrap->dev_res[RES_IRQ_OTG_ID].start =3D pdev->irq;
> +		wrap->dev_res[RES_IRQ_OTG_ID].name =3D "otg";
> +		wrap->dev_res[RES_IRQ_OTG_ID].flags =3D IORESOURCE_IRQ;
> +	}
> +
> +	if (pci_is_enabled(func)) {
> +		/* set up platform device info */
> +		memset(&plat_info, 0, sizeof(plat_info));
> +		plat_info.parent =3D &pdev->dev;
> +		plat_info.fwnode =3D pdev->dev.fwnode;
> +		plat_info.name =3D PLAT_DRIVER_NAME;
> +		plat_info.id =3D pdev->devfn;
> +		wrap->devfn  =3D pdev->devfn;
> +		plat_info.res =3D wrap->dev_res;
> +		plat_info.num_res =3D ARRAY_SIZE(wrap->dev_res);
> +		plat_info.dma_mask =3D pdev->dma_mask;
> +		/* register platform device */
> +		wrap->plat_dev =3D platform_device_register_full(&plat_info);
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
> +	func =3D cdns3_get_second_fun(pdev);
> +
> +	wrap =3D (struct cdns3_wrap *)pci_get_drvdata(pdev);
> +	if (wrap->devfn =3D=3D pdev->devfn)
> +		platform_device_unregister(wrap->plat_dev);
> +
> +	if (!pci_is_enabled(func))
> +		kfree(wrap);
> +}
> +
> +static const struct pci_device_id cdns3_pci_ids[] =3D {
> +	{ PCI_DEVICE(CDNS_VENDOR_ID, CDNS_DEVICE_ID), },
> +	{ 0, }
> +};
> +
> +static struct pci_driver cdns3_pci_driver =3D {
> +	.name =3D PCI_DRIVER_NAME,
> +	.id_table =3D cdns3_pci_ids,
> +	.probe =3D cdns3_pci_probe,
> +	.remove =3D cdns3_pci_remove,
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
> +struct cdns3_role_driver *cdns3_get_current_role_driver(struct cdns3 *cd=
ns)
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
> +	cdns->role =3D role;
> +	mutex_unlock(&cdns->mutex);
> +
> +	if (role =3D=3D USB_ROLE_NONE)
> +		return 0;
> +
> +	if (!cdns->roles[role])
> +		return -ENXIO;
> +
> +	if (cdns->roles[role]->state =3D=3D CDNS3_ROLE_STATE_ACTIVE)
> +		return 0;
> +
> +	mutex_lock(&cdns->mutex);
> +	if (role =3D=3D USB_ROLE_HOST)
> +		cdns3_drd_switch_host(cdns, 1);
> +	else
> +		cdns3_drd_switch_gadget(cdns, 1);
> +
> +	ret =3D cdns->roles[role]->start(cdns);
> +	if (!ret)
> +		cdns->roles[role]->state =3D CDNS3_ROLE_STATE_ACTIVE;
> +	mutex_unlock(&cdns->mutex);
> +
> +	return ret;
> +}
> +
> +static void cdns3_role_stop(struct cdns3 *cdns)
> +{
> +	enum usb_role role =3D cdns->role;
> +
> +	if (WARN_ON(role > USB_ROLE_DEVICE))
> +		return;
> +
> +	if (role =3D=3D USB_ROLE_NONE)
> +		return;
> +
> +	if (cdns->roles[role]->state =3D=3D CDNS3_ROLE_STATE_INACTIVE)
> +		return;
> +
> +	mutex_lock(&cdns->mutex);
> +	cdns->roles[role]->stop(cdns);
> +	if (role =3D=3D USB_ROLE_HOST)
> +		cdns3_drd_switch_host(cdns, 0);
> +	else
> +		cdns3_drd_switch_gadget(cdns, 0);
> +
> +	cdns->roles[role]->state =3D CDNS3_ROLE_STATE_INACTIVE;
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
> +	struct device *dev =3D cdns->dev;
> +	enum usb_dr_mode best_dr_mode;
> +	enum usb_dr_mode dr_mode;
> +	int ret =3D 0;
> +
> +	dr_mode =3D usb_get_dr_mode(dev);
> +	cdns->role =3D USB_ROLE_NONE;
> +
> +	/*
> +	 * If driver can't read mode by means of usb_get_dr_mode function then
> +	 * chooses mode according with Kernel configuration. This setting
> +	 * can be restricted later depending on strap pin configuration.
> +	 */
> +	if (dr_mode =3D=3D USB_DR_MODE_UNKNOWN) {
> +		if (IS_ENABLED(CONFIG_USB_CDNS3_HOST) &&
> +		    IS_ENABLED(CONFIG_USB_CDNS3_GADGET))
> +			dr_mode =3D USB_DR_MODE_OTG;
> +		else if (IS_ENABLED(CONFIG_USB_CDNS3_HOST))
> +			dr_mode =3D USB_DR_MODE_HOST;
> +		else if (IS_ENABLED(CONFIG_USB_CDNS3_GADGET))
> +			dr_mode =3D USB_DR_MODE_PERIPHERAL;
> +	}
> +
> +	/*
> +	 * At this point cdns->dr_mode contains strap configuration.
> +	 * Driver try update this setting considering kernel configuration
> +	 */
> +	best_dr_mode =3D cdns->dr_mode;
> +
> +	if (dr_mode =3D=3D USB_DR_MODE_OTG) {
> +		best_dr_mode =3D cdns->dr_mode;
> +	} else if (cdns->dr_mode =3D=3D USB_DR_MODE_OTG) {
> +		best_dr_mode =3D dr_mode;
> +	} else if (cdns->dr_mode !=3D dr_mode) {
> +		dev_err(dev, "Incorrect DRD configuration\n");
> +		return -EINVAL;
> +	}
> +
> +	dr_mode =3D best_dr_mode;
> +
> +	if (dr_mode =3D=3D USB_DR_MODE_OTG || dr_mode =3D=3D USB_DR_MODE_HOST) =
{
> +		ret =3D cdns3_host_init(cdns);
> +		if (ret) {
> +			dev_err(dev, "Host initialization failed with %d\n",
> +				ret);
> +			goto err;
> +		}
> +	}
> +
> +	if (dr_mode =3D=3D USB_DR_MODE_OTG || dr_mode =3D=3D USB_DR_MODE_PERIPH=
ERAL) {
> +		ret =3D cdns3_gadget_init(cdns);
> +		if (ret) {
> +			dev_err(dev, "Device initialization failed with %d\n",
> +				ret);
> +			goto err;
> +		}
> +	}
> +
> +	cdns->desired_dr_mode =3D dr_mode;
> +	cdns->dr_mode =3D dr_mode;
> +
> +	/*
> +	 * desired_dr_mode might have changed so we need to update
> +	 * the controller configuration"?
> +	 */
> +	ret =3D cdns3_drd_update_mode(cdns);
> +	if (ret)
> +		goto err;
> +
> +	cdns->role =3D cdsn3_real_role_switch_get(cdns->dev);
> +
> +	ret =3D cdns3_role_start(cdns, cdns->role);
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
> + * cdsn3_real_role_switch_get - get real role of controller based on har=
dware
> + *   settings.
> + * @dev: Pointer to device structure
> + *
> + * Returns role
> + */
> +enum usb_role cdsn3_real_role_switch_get(struct device *dev)
> +{
> +	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> +	enum usb_role role;
> +	int id, vbus;
> +
> +	if (cdns->current_dr_mode !=3D USB_DR_MODE_OTG)
> +		goto not_otg;
> +
> +	id =3D cdns3_get_id(cdns);
> +	vbus =3D cdns3_get_vbus(cdns);
> +
> +	/*
> +	 * Role change state machine
> +	 * Inputs: ID, VBUS
> +	 * Previous state: cdns->role
> +	 * Next state: role
> +	 */
> +	role =3D cdns->role;
> +
> +	switch (role) {
> +	case USB_ROLE_NONE:
> +		/*
> +		 * Driver treat USB_ROLE_NONE synonymous to IDLE state from
> +		 * controller specification.
> +		 */
> +		if (!id)
> +			role =3D USB_ROLE_HOST;
> +		else if (vbus)
> +			role =3D USB_ROLE_DEVICE;
> +		break;
> +	case USB_ROLE_HOST: /* from HOST, we can only change to NONE */
> +		if (id)
> +			role =3D USB_ROLE_NONE;
> +		break;
> +	case USB_ROLE_DEVICE: /* from GADGET, we can only change to NONE*/
> +		if (!vbus)
> +			role =3D USB_ROLE_NONE;
> +		break;
> +	}
> +
> +	dev_dbg(cdns->dev, "role %d -> %d\n", cdns->role, role);
> +
> +	return role;
> +
> +not_otg:
> +	if (cdns3_is_host(cdns))
> +		role =3D USB_ROLE_HOST;
> +	if (cdns3_is_device(cdns))
> +		role =3D USB_ROLE_DEVICE;
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
> +	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> +	enum usb_role real_role =3D USB_ROLE_NONE;
> +	enum usb_role current_role;
> +	int ret =3D 0;
> +
> +	/* Check if dr_mode was changed.*/
> +	ret =3D cdns3_drd_update_mode(cdns);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_get_sync(cdns->dev);
> +
> +	real_role =3D cdsn3_real_role_switch_get(cdns->dev);
> +
> +	/* Do nothing if nothing changed */
> +	if (cdns->role =3D=3D real_role)
> +		goto exit;
> +
> +	cdns3_role_stop(cdns);
> +
> +	real_role =3D cdsn3_real_role_switch_get(cdns->dev);
> +
> +	current_role =3D role;
> +	dev_dbg(cdns->dev, "Switching role");
> +
> +	ret =3D cdns3_role_start(cdns, real_role);
> +	if (ret) {
> +		/* Back to current role */
> +		dev_err(cdns->dev, "set %d has failed, back to %d\n",
> +			role, current_role);
> +		ret =3D cdns3_role_start(cdns, current_role);
> +		if (ret)
> +			dev_err(cdns->dev, "back to %d failed too\n",
> +				current_role);
> +	}
> +exit:
> +	pm_runtime_put_sync(cdns->dev);
> +	return ret;
> +}
> +
> +static const struct usb_role_switch_desc cdns3_switch_desc =3D {
> +	.set =3D cdns3_role_switch_set,
> +	.get =3D cdsn3_real_role_switch_get,
> +	.allow_userspace_control =3D true,
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
> +	struct device *dev =3D &pdev->dev;
> +	struct resource	*res;
> +	struct cdns3 *cdns;
> +	void __iomem *regs;
> +	int ret;
> +
> +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(dev, "error setting dma mask: %d\n", ret);
> +		return -ENODEV;
> +	}
> +
> +	cdns =3D devm_kzalloc(dev, sizeof(*cdns), GFP_KERNEL);
> +	if (!cdns)
> +		return -ENOMEM;
> +
> +	cdns->dev =3D dev;
> +
> +	platform_set_drvdata(pdev, cdns);
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_IRQ, "host");
> +	if (!res) {
> +		dev_err(dev, "missing host IRQ\n");
> +		return -ENODEV;
> +	}
> +
> +	cdns->xhci_res[0] =3D *res;
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "xhci");
> +	if (!res) {
> +		dev_err(dev, "couldn't get xhci resource\n");
> +		return -ENXIO;
> +	}
> +
> +	cdns->xhci_res[1] =3D *res;
> +
> +	cdns->dev_irq =3D platform_get_irq_byname(pdev, "peripheral");
> +	if (cdns->dev_irq =3D=3D -EPROBE_DEFER)
> +		return cdns->dev_irq;
> +
> +	if (cdns->dev_irq < 0)
> +		dev_err(dev, "couldn't get peripheral irq\n");
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dev");
> +	regs =3D devm_ioremap_resource(dev, res);
> +	if (IS_ERR(regs)) {
> +		dev_err(dev, "couldn't iomap dev resource\n");
> +		return PTR_ERR(regs);
> +	}
> +	cdns->dev_regs	=3D regs;
> +
> +	cdns->otg_irq =3D platform_get_irq_byname(pdev, "otg");
> +	if (cdns->otg_irq =3D=3D -EPROBE_DEFER)
> +		return cdns->otg_irq;
> +
> +	if (cdns->otg_irq < 0) {
> +		dev_err(dev, "couldn't get otg irq\n");
> +		return cdns->otg_irq;
> +	}
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "otg");
> +	if (!res) {
> +		dev_err(dev, "couldn't get otg resource\n");
> +		return -ENXIO;
> +	}
> +
> +	cdns->otg_res =3D *res;
> +
> +	mutex_init(&cdns->mutex);
> +
> +	cdns->usb2_phy =3D devm_phy_optional_get(dev, "cdns3,usb2-phy");
> +	if (IS_ERR(cdns->usb2_phy))
> +		return PTR_ERR(cdns->usb2_phy);
> +
> +	phy_init(cdns->usb2_phy);
> +	ret =3D phy_init(cdns->usb2_phy);
> +	if (ret)
> +		return ret;
> +
> +	cdns->usb3_phy =3D devm_phy_optional_get(dev, "cdns3,usb3-phy");
> +	if (IS_ERR(cdns->usb3_phy))
> +		return PTR_ERR(cdns->usb3_phy);
> +
> +	phy_init(cdns->usb3_phy);
> +	ret =3D phy_init(cdns->usb3_phy);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D phy_power_on(cdns->usb2_phy);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D phy_power_on(cdns->usb3_phy);
> +	if (ret)
> +		goto err1;
> +
> +	cdns->role_sw =3D usb_role_switch_register(dev, &cdns3_switch_desc);
> +	if (IS_ERR(cdns->role_sw)) {
> +		ret =3D PTR_ERR(cdns->role_sw);
> +		dev_warn(dev, "Unable to register Role Switch\n");
> +		goto err2;
> +	}
> +
> +	ret =3D cdns3_drd_init(cdns);
> +	if (ret)
> +		goto err3;
> +
> +	ret =3D cdns3_core_init_role(cdns);
> +	if (ret)
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
> +	struct cdns3 *cdns =3D platform_get_drvdata(pdev);
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
> +	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +
> +	if (cdns->role =3D=3D USB_ROLE_HOST)
> +		return 0;
> +
> +	if (pm_runtime_status_suspended(dev))
> +		pm_runtime_resume(dev);
> +
> +	if (cdns->roles[cdns->role]->suspend) {
> +		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
> +		cdns->roles[cdns->role]->suspend(cdns, false);
> +		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
> +	}
> +
> +	return 0;
> +}
> +
> +static int cdns3_resume(struct device *dev)
> +{
> +	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +
> +	if (cdns->role =3D=3D USB_ROLE_HOST)
> +		return 0;
> +
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
> +static const struct dev_pm_ops cdns3_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(cdns3_suspend, cdns3_resume)
> +};
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id of_cdns3_match[] =3D {
> +	{ .compatible =3D "cdns,usb3" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, of_cdns3_match);
> +#endif
> +
> +static struct platform_driver cdns3_driver =3D {
> +	.probe		=3D cdns3_probe,
> +	.remove		=3D cdns3_remove,
> +	.driver		=3D {
> +		.name	=3D "cdns-usb3",
> +		.of_match_table	=3D of_match_ptr(of_cdns3_match),
> +		.pm	=3D &cdns3_pm_ops,
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
> + * @dr_mode: supported mode of operation it can be only Host, only Devic=
e
> + *           or OTG mode that allow to switch between Device and Host mo=
de.
> + *           This field based on firmware setting, kernel configuration
> + *           and hardware configuration.
> + * @current_dr_mode: current mode of operation when in dual-role mode
> + * @desired_dr_mode: desired mode of operation when in dual-role mode.
> + *           This value can be changed during runtime.
> + *           Available options depends on  dr_mode:
> + *           dr_mode                 |  desired_dr_mode and current_dr_m=
ode
> + *           -----------------------------------------------------------=
-----
> + *           USB_DR_MODE_HOST        | only USB_DR_MODE_HOST
> + *           USB_DR_MODE_PERIPHERAL  | only USB_DR_MODE_PERIPHERAL
> + *           USB_DR_MODE_OTG         | USB_DR_MODE_OTG or USB_DR_MODE_HO=
ST or
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
> +	ret =3D sprintf(str, "IRQ %08x =3D ", usb_ists);
> +
> +	if (usb_ists & (USB_ISTS_CON2I | USB_ISTS_CONI)) {
> +		ret +=3D sprintf(str + ret, "Connection %s\n",
> +			       usb_speed_string(speed));
> +	}
> +	if (usb_ists & USB_ISTS_DIS2I || usb_ists & USB_ISTS_DISI)
> +		ret +=3D sprintf(str + ret, "Disconnection ");
> +	if (usb_ists & USB_ISTS_L2ENTI)
> +		ret +=3D sprintf(str + ret, "suspended ");
> +	if (usb_ists & USB_ISTS_L1ENTI)
> +		ret +=3D sprintf(str + ret, "L1 enter ");
> +	if (usb_ists & USB_ISTS_L1EXTI)
> +		ret +=3D sprintf(str + ret, "L1 exit ");
> +	if (usb_ists & USB_ISTS_L2ENTI)
> +		ret +=3D sprintf(str + ret, "L2 enter ");
> +	if (usb_ists & USB_ISTS_L2EXTI)
> +		ret +=3D sprintf(str + ret, "L2 exit ");
> +	if (usb_ists & USB_ISTS_U3EXTI)
> +		ret +=3D sprintf(str + ret, "U3 exit ");
> +	if (usb_ists & USB_ISTS_UWRESI)
> +		ret +=3D sprintf(str + ret, "Warm Reset ");
> +	if (usb_ists & USB_ISTS_UHRESI)
> +		ret +=3D sprintf(str + ret, "Hot Reset ");
> +	if (usb_ists & USB_ISTS_U2RESI)
> +		ret +=3D sprintf(str + ret, "Reset");
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
> +	ret =3D sprintf(str, "IRQ for %s: %08x ", ep_name, ep_sts);
> +
> +	if (ep_sts & EP_STS_SETUP)
> +		ret +=3D sprintf(str + ret, "SETUP ");
> +	if (ep_sts & EP_STS_IOC)
> +		ret +=3D sprintf(str + ret, "IOC ");
> +	if (ep_sts & EP_STS_ISP)
> +		ret +=3D sprintf(str + ret, "ISP ");
> +	if (ep_sts & EP_STS_DESCMIS)
> +		ret +=3D sprintf(str + ret, "DESCMIS ");
> +	if (ep_sts & EP_STS_STREAMR)
> +		ret +=3D sprintf(str + ret, "STREAMR ");
> +	if (ep_sts & EP_STS_MD_EXIT)
> +		ret +=3D sprintf(str + ret, "MD_EXIT ");
> +	if (ep_sts & EP_STS_TRBERR)
> +		ret +=3D sprintf(str + ret, "TRBERR ");
> +	if (ep_sts & EP_STS_NRDY)
> +		ret +=3D sprintf(str + ret, "NRDY ");
> +	if (ep_sts & EP_STS_PRIME)
> +		ret +=3D sprintf(str + ret, "PRIME ");
> +	if (ep_sts & EP_STS_SIDERR)
> +		ret +=3D sprintf(str + ret, "SIDERRT ");
> +	if (ep_sts & EP_STS_OUTSMM)
> +		ret +=3D sprintf(str + ret, "OUTSMM ");
> +	if (ep_sts & EP_STS_ISOERR)
> +		ret +=3D sprintf(str + ret, "ISOERR ");
> +	if (ep_sts & EP_STS_IOT)
> +		ret +=3D sprintf(str + ret, "IOT ");
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
> + * Prints out all TRBs in the endpoint ring, even those after the Link T=
RB.
> + *.
> + */
> +static inline char *cdns3_dbg_ring(struct cdns3_endpoint *priv_ep,
> +				   struct cdns3_trb *ring, char *str)
> +{
> +	dma_addr_t addr =3D priv_ep->trb_pool_dma;
> +	struct cdns3_trb *trb;
> +	int trb_per_sector;
> +	int ret =3D 0;
> +	int i;
> +
> +	trb_per_sector =3D GET_TRBS_PER_SEGMENT(priv_ep->type);
> +
> +	trb =3D &priv_ep->trb_pool[priv_ep->dequeue];
> +	ret +=3D sprintf(str + ret, "\n\t\tRing contents for %s:", priv_ep->nam=
e);
> +
> +	ret +=3D sprintf(str + ret,
> +		       "\n\t\tRing deq index: %d, trb: %p (virt), 0x%llx (dma)\n",
> +		       priv_ep->dequeue, trb,
> +		       (unsigned long long)cdns3_trb_virt_to_dma(priv_ep, trb));
> +
> +	trb =3D &priv_ep->trb_pool[priv_ep->enqueue];
> +	ret +=3D sprintf(str + ret,
> +		       "\t\tRing enq index: %d, trb: %p (virt), 0x%llx (dma)\n",
> +		       priv_ep->enqueue, trb,
> +		       (unsigned long long)cdns3_trb_virt_to_dma(priv_ep, trb));
> +
> +	ret +=3D sprintf(str + ret,
> +		       "\t\tfree trbs: %d, CCS=3D%d, PCS=3D%d\n",
> +		       priv_ep->free_trbs, priv_ep->ccs, priv_ep->pcs);
> +
> +	if (trb_per_sector > TRBS_PER_SEGMENT)
> +		trb_per_sector =3D TRBS_PER_SEGMENT;
> +
> +	if (trb_per_sector > TRBS_PER_SEGMENT) {
> +		sprintf(str + ret, "\t\tTo big transfer ring %d\n",
> +			trb_per_sector);
> +		return str;
> +	}
> +
> +	for (i =3D 0; i < trb_per_sector; ++i) {
> +		trb =3D &ring[i];
> +		ret +=3D sprintf(str + ret,
> +			"\t\t@%pad %08x %08x %08x\n", &addr,
> +			le32_to_cpu(trb->buffer),
> +			le32_to_cpu(trb->length),
> +			le32_to_cpu(trb->control));
> +		addr +=3D sizeof(*trb);
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
> +{  }
> +void cdns3_debugfs_exit(struct cdns3 *cdns);
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
> +	struct cdns3 *cdns =3D s->private;
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
> +	struct seq_file	 *s =3D file->private_data;
> +	struct cdns3 *cdns =3D s->private;
> +	char buf[32];
> +	int ret;
> +
> +	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
> +		return -EFAULT;
> +
> +	buf[count - 1] =3D '\0';
> +
> +	ret =3D usb_get_dr_mode_from_string(buf);
> +	if (ret =3D=3D USB_DR_MODE_UNKNOWN) {
> +		dev_err(cdns->dev, "Failed: incorrect mode setting\n");
> +		return -EINVAL;
> +	}
> +
> +	if (cdns->current_dr_mode !=3D ret) {
> +		cdns->desired_dr_mode =3D ret;
> +
> +		if (cdns->role !=3D USB_ROLE_NONE)
> +			usb_role_switch_set_role(cdns->role_sw, cdns->role);
> +
> +		usb_role_switch_set_role(cdns->role_sw, cdns->role);
> +	}
> +
> +	return count;
> +}
> +
> +static const struct file_operations cdns3_mode_fops =3D {
> +	.open			=3D cdns3_mode_open,
> +	.write			=3D cdns3_mode_write,
> +	.read			=3D seq_read,
> +	.llseek			=3D seq_lseek,
> +	.release		=3D single_release,
> +};
> +
> +void cdns3_debugfs_init(struct cdns3 *cdns)
> +{
> +	struct dentry *root;
> +
> +	root =3D debugfs_create_dir(dev_name(cdns->dev), usb_debug_root);
> +	cdns->root =3D root;
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
> +	int ret =3D 0;
> +	u32 reg;
> +
> +	cdns->current_dr_mode =3D mode;
> +
> +	switch (mode) {
> +	case USB_DR_MODE_PERIPHERAL:
> +		break;
> +	case USB_DR_MODE_HOST:
> +		break;
> +	case USB_DR_MODE_OTG:
> +		dev_dbg(cdns->dev, "Set controller to OTG mode\n");
> +		if (cdns->version =3D=3D CDNS3_CONTROLLER_V1) {
> +			reg =3D readl(&cdns->otg_v1_regs->override);
> +			reg |=3D OVERRIDE_IDPULLUP;
> +			writel(reg, &cdns->otg_v1_regs->override);
> +		} else {
> +			reg =3D readl(&cdns->otg_v0_regs->ctrl1);
> +			reg |=3D OVERRIDE_IDPULLUP_V0;
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
> +		cdns->current_dr_mode =3D USB_DR_MODE_UNKNOWN;
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
> +	id =3D readl(&cdns->otg_regs->sts) & OTGSTS_ID_VALUE;
> +	dev_dbg(cdns->dev, "OTG ID: %d", id);
> +
> +	return id;
> +}
> +
> +int cdns3_get_vbus(struct cdns3 *cdns)
> +{
> +	int vbus;
> +
> +	vbus =3D !!(readl(&cdns->otg_regs->sts) & OTGSTS_VBUS_VALID);
> +	dev_dbg(cdns->dev, "OTG VBUS: %d", vbus);
> +
> +	return vbus;
> +}
> +
> +int cdns3_is_host(struct cdns3 *cdns)
> +{
> +	if (cdns->current_dr_mode =3D=3D USB_DR_MODE_HOST)
> +		return 1;
> +	else if (!cdns3_get_id(cdns))
> +		return 1;
> +
> +	return 0;
> +}
> +
> +int cdns3_is_device(struct cdns3 *cdns)
> +{
> +	if (cdns->current_dr_mode =3D=3D USB_DR_MODE_PERIPHERAL)
> +		return 1;
> +	else if (cdns->current_dr_mode =3D=3D USB_DR_MODE_OTG)
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
> +	u32 reg =3D OTGCMD_OTG_DIS;
> +
> +	/* switch OTG core */
> +	if (on) {
> +		writel(OTGCMD_HOST_BUS_REQ | reg, &cdns->otg_regs->cmd);
> +
> +		dev_dbg(cdns->dev, "Waiting till Host mode is turned on\n");
> +		ret =3D readl_poll_timeout_atomic(&cdns->otg_regs->sts, val,
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
> +	u32 reg =3D OTGCMD_OTG_DIS;
> +
> +	/* switch OTG core */
> +	if (on) {
> +		writel(OTGCMD_DEV_BUS_REQ | reg, &cdns->otg_regs->cmd);
> +
> +		dev_dbg(cdns->dev, "Waiting till Device mode is turned on\n");
> +
> +		ret =3D readl_poll_timeout_atomic(&cdns->otg_regs->sts, val,
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
> +	int ret =3D 0;
> +
> +	cdns3_otg_disable_irq(cdns);
> +	/* clear all interrupts */
> +	writel(~0, &cdns->otg_regs->ivect);
> +
> +	ret =3D cdns3_set_mode(cdns, USB_DR_MODE_OTG);
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
> +	int ret =3D 0;
> +
> +	if (cdns->desired_dr_mode =3D=3D cdns->current_dr_mode)
> +		return ret;
> +
> +	switch (cdns->desired_dr_mode) {
> +	case USB_DR_MODE_PERIPHERAL:
> +		ret =3D cdns3_set_mode(cdns, USB_DR_MODE_PERIPHERAL);
> +		break;
> +	case USB_DR_MODE_HOST:
> +		ret =3D cdns3_set_mode(cdns, USB_DR_MODE_HOST);
> +		break;
> +	case USB_DR_MODE_OTG:
> +		ret =3D cdns3_init_otg_mode(cdns);
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
> +	struct cdns3 *cdns =3D data;
> +
> +	usb_role_switch_set_role(cdns->role_sw, cdns->role);
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
> +	irqreturn_t ret =3D IRQ_NONE;
> +	struct cdns3 *cdns =3D data;
> +	u32 reg;
> +
> +	if (cdns->dr_mode !=3D USB_DR_MODE_OTG)
> +		return ret;
> +
> +	reg =3D readl(&cdns->otg_regs->ivect);
> +
> +	if (!reg)
> +		return ret;
> +
> +	if (reg & OTGIEN_ID_CHANGE_INT) {
> +		dev_dbg(cdns->dev, "OTG IRQ: new ID: %d\n",
> +			cdns3_get_id(cdns));
> +
> +		ret =3D IRQ_WAKE_THREAD;
> +	}
> +
> +	if (reg & (OTGIEN_VBUSVALID_RISE_INT | OTGIEN_VBUSVALID_FALL_INT)) {
> +		dev_dbg(cdns->dev, "OTG IRQ: new VBUS: %d\n",
> +			cdns3_get_vbus(cdns));
> +
> +		ret =3D IRQ_WAKE_THREAD;
> +	}
> +
> +	writel(~0, &cdns->otg_regs->ivect);
> +	return ret;
> +}
> +
> +int cdns3_drd_init(struct cdns3 *cdns)
> +{
> +	void __iomem *regs;
> +	int ret =3D 0;
> +	u32 state;
> +
> +	regs =3D devm_ioremap_resource(cdns->dev, &cdns->otg_res);
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
> +	cdns->otg_v0_regs =3D regs;
> +	if (!readl(&cdns->otg_v0_regs->cmd)) {
> +		cdns->version  =3D CDNS3_CONTROLLER_V0;
> +		cdns->otg_v1_regs =3D NULL;
> +		cdns->otg_regs =3D regs;
> +		writel(1, &cdns->otg_v0_regs->simulate);
> +		dev_info(cdns->dev, "DRD version v0 (%08x)\n",
> +			 readl(&cdns->otg_v0_regs->version));
> +	} else {
> +		cdns->otg_v0_regs =3D NULL;
> +		cdns->otg_v1_regs =3D regs;
> +		cdns->otg_regs =3D (void *)&cdns->otg_v1_regs->cmd;
> +		cdns->version  =3D CDNS3_CONTROLLER_V1;
> +		writel(1, &cdns->otg_v1_regs->simulate);
> +		dev_info(cdns->dev, "DRD version v1 (ID: %08x, rev: %08x)\n",
> +			 readl(&cdns->otg_v1_regs->did),
> +			 readl(&cdns->otg_v1_regs->rid));
> +	}
> +
> +	state =3D OTGSTS_STRAP(readl(&cdns->otg_regs->sts));
> +
> +	/* Update dr_mode according to STRAP configuration. */
> +	cdns->dr_mode =3D USB_DR_MODE_OTG;
> +	if (state =3D=3D OTGSTS_STRAP_HOST) {
> +		dev_dbg(cdns->dev, "Controller strapped to HOST\n");
> +		cdns->dr_mode =3D USB_DR_MODE_HOST;
> +	} else if (state =3D=3D OTGSTS_STRAP_GADGET) {
> +		dev_dbg(cdns->dev, "Controller strapped to PERIPHERAL\n");
> +		cdns->dr_mode =3D USB_DR_MODE_PERIPHERAL;
> +	}
> +
> +	cdns->desired_dr_mode =3D cdns->dr_mode;
> +	cdns->current_dr_mode =3D USB_DR_MODE_UNKNOWN;
> +
> +	ret =3D devm_request_threaded_irq(cdns->dev, cdns->otg_irq,
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
> +	state =3D readl(&cdns->otg_regs->sts);
> +	if (OTGSTS_OTG_NRDY(state) !=3D 0) {
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
> diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
> new file mode 100644
> index 000000000000..48c7f34db8a5
> --- /dev/null
> +++ b/drivers/usb/cdns3/ep0.c
> @@ -0,0 +1,914 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cadence USBSS DRD Driver - gadget side.
> + *
> + * Copyright (C) 2018 Cadence Design Systems.
> + * Copyright (C) 2017-2018 NXP
> + *
> + * Authors: Pawel Jez <pjez@cadence.com>,
> + *          Pawel Laszczak <pawell@cadence.com>
> + *          Peter Chen <peter.chen@nxp.com>
> + */
> +
> +#include <linux/usb/composite.h>
> +#include <linux/iopoll.h>
> +
> +#include "gadget.h"
> +#include "trace.h"
> +
> +static struct usb_endpoint_descriptor cdns3_gadget_ep0_desc =3D {
> +	.bLength =3D USB_DT_ENDPOINT_SIZE,
> +	.bDescriptorType =3D USB_DT_ENDPOINT,
> +	.bmAttributes =3D	USB_ENDPOINT_XFER_CONTROL,
> +};
> +
> +/**
> + * cdns3_ep0_run_transfer - Do transfer on default endpoint hardware
> + * @priv_dev: extended gadget object
> + * @dma_addr: physical address where data is/will be stored
> + * @length: data length
> + * @erdy: set it to 1 when ERDY packet should be sent -
> + *        exit from flow control state
> + */
> +static void cdns3_ep0_run_transfer(struct cdns3_device *priv_dev,
> +				   dma_addr_t dma_addr,
> +				   unsigned int length, int erdy, int zlp)
> +{
> +	struct cdns3_usb_regs __iomem *regs =3D priv_dev->regs;
> +	struct cdns3_endpoint *priv_ep =3D priv_dev->eps[0];
> +
> +	priv_ep->trb_pool[0].buffer =3D TRB_BUFFER(dma_addr);
> +	priv_ep->trb_pool[0].length =3D TRB_LEN(length);
> +
> +	if (zlp) {
> +		priv_ep->trb_pool[0].control =3D TRB_CYCLE | TRB_TYPE(TRB_NORMAL);
> +		priv_ep->trb_pool[1].buffer =3D TRB_BUFFER(dma_addr);
> +		priv_ep->trb_pool[1].length =3D TRB_LEN(0);
> +		priv_ep->trb_pool[1].control =3D TRB_CYCLE | TRB_IOC |
> +		    TRB_TYPE(TRB_NORMAL);
> +	} else {
> +		priv_ep->trb_pool[0].control =3D TRB_CYCLE | TRB_IOC |
> +		    TRB_TYPE(TRB_NORMAL);
> +		priv_ep->trb_pool[1].control =3D 0;
> +	}
> +
> +	trace_cdns3_prepare_trb(priv_ep, priv_ep->trb_pool);
> +
> +	cdns3_select_ep(priv_dev, priv_dev->ep0_data_dir);
> +
> +	writel(EP_STS_TRBERR, &regs->ep_sts);
> +	writel(EP_TRADDR_TRADDR(priv_ep->trb_pool_dma), &regs->ep_traddr);
> +	trace_cdns3_doorbell_ep0(priv_dev->ep0_data_dir ? "ep0in" : "ep0out",
> +				 readl(&regs->ep_traddr));
> +
> +	/* TRB should be prepared before starting transfer. */
> +	writel(EP_CMD_DRDY, &regs->ep_cmd);
> +
> +	/* Resume controller before arming transfer. */
> +	__cdns3_gadget_wakeup(priv_dev);
> +
> +	if (erdy)
> +		writel(EP_CMD_ERDY, &priv_dev->regs->ep_cmd);
> +}
> +
> +/**
> + * cdns3_ep0_delegate_req - Returns status of handling setup packet
> + * Setup is handled by gadget driver
> + * @priv_dev: extended gadget object
> + * @ctrl_req: pointer to received setup packet
> + *
> + * Returns zero on success or negative value on failure
> + */
> +static int cdns3_ep0_delegate_req(struct cdns3_device *priv_dev,
> +				  struct usb_ctrlrequest *ctrl_req)
> +{
> +	int ret;
> +
> +	spin_unlock(&priv_dev->lock);
> +	priv_dev->setup_pending =3D 1;
> +	ret =3D priv_dev->gadget_driver->setup(&priv_dev->gadget, ctrl_req);
> +	priv_dev->setup_pending =3D 0;
> +	spin_lock(&priv_dev->lock);
> +	return ret;
> +}
> +
> +static void cdns3_prepare_setup_packet(struct cdns3_device *priv_dev)
> +{
> +	priv_dev->ep0_data_dir =3D 0;
> +	priv_dev->ep0_stage =3D CDNS3_SETUP_STAGE;
> +	cdns3_ep0_run_transfer(priv_dev, priv_dev->setup_dma,
> +			       sizeof(struct usb_ctrlrequest), 0, 0);
> +}
> +
> +static void cdns3_ep0_complete_setup(struct cdns3_device *priv_dev,
> +				     u8 send_stall, u8 send_erdy)
> +{
> +	struct cdns3_endpoint *priv_ep =3D priv_dev->eps[0];
> +	struct usb_request *request;
> +
> +	request =3D cdns3_next_request(&priv_ep->pending_req_list);
> +	if (request)
> +		list_del_init(&request->list);
> +
> +	if (send_stall) {
> +		trace_cdns3_halt(priv_ep, send_stall, 0);
> +		/* set_stall on ep0 */
> +		cdns3_select_ep(priv_dev, 0x00);
> +		writel(EP_CMD_SSTALL, &priv_dev->regs->ep_cmd);
> +	} else {
> +		cdns3_prepare_setup_packet(priv_dev);
> +	}
> +
> +	priv_dev->ep0_stage =3D CDNS3_SETUP_STAGE;
> +	writel((send_erdy ? EP_CMD_ERDY : 0) | EP_CMD_REQ_CMPL,
> +	       &priv_dev->regs->ep_cmd);
> +
> +	cdns3_allow_enable_l1(priv_dev, 1);
> +}
> +
> +/**
> + * cdns3_req_ep0_set_configuration - Handling of SET_CONFIG standard USB=
 request
> + * @priv_dev: extended gadget object
> + * @ctrl_req: pointer to received setup packet
> + *
> + * Returns 0 if success, USB_GADGET_DELAYED_STATUS on deferred status st=
age,
> + * error code on error
> + */
> +static int cdns3_req_ep0_set_configuration(struct cdns3_device *priv_dev=
,
> +					   struct usb_ctrlrequest *ctrl_req)
> +{
> +	enum usb_device_state device_state =3D priv_dev->gadget.state;
> +	struct cdns3_endpoint *priv_ep;
> +	u32 config =3D le16_to_cpu(ctrl_req->wValue);
> +	int result =3D 0;
> +	int i;
> +
> +	switch (device_state) {
> +	case USB_STATE_ADDRESS:
> +		/* Configure non-control EPs */
> +		for (i =3D 0; i < CDNS3_ENDPOINTS_MAX_COUNT; i++) {
> +			priv_ep =3D priv_dev->eps[i];
> +			if (!priv_ep)
> +				continue;
> +
> +			if (priv_ep->flags & EP_CLAIMED)
> +				cdns3_ep_config(priv_ep);
> +		}
> +
> +		result =3D cdns3_ep0_delegate_req(priv_dev, ctrl_req);
> +
> +		if (result)
> +			return result;
> +
> +		if (config) {
> +			cdns3_set_hw_configuration(priv_dev);
> +		} else {
> +			cdns3_hw_reset_eps_config(priv_dev);
> +			usb_gadget_set_state(&priv_dev->gadget,
> +					     USB_STATE_ADDRESS);
> +		}
> +		break;
> +	case USB_STATE_CONFIGURED:
> +		result =3D cdns3_ep0_delegate_req(priv_dev, ctrl_req);
> +
> +		if (!config && !result) {
> +			cdns3_hw_reset_eps_config(priv_dev);
> +			usb_gadget_set_state(&priv_dev->gadget,
> +					     USB_STATE_ADDRESS);
> +		}
> +		break;
> +	default:
> +		result =3D -EINVAL;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * cdns3_req_ep0_set_address - Handling of SET_ADDRESS standard USB requ=
est
> + * @priv_dev: extended gadget object
> + * @ctrl_req: pointer to received setup packet
> + *
> + * Returns 0 if success, error code on error
> + */
> +static int cdns3_req_ep0_set_address(struct cdns3_device *priv_dev,
> +				     struct usb_ctrlrequest *ctrl_req)
> +{
> +	enum usb_device_state device_state =3D priv_dev->gadget.state;
> +	u32 reg;
> +	u32 addr;
> +
> +	addr =3D le16_to_cpu(ctrl_req->wValue);
> +
> +	if (addr > USB_DEVICE_MAX_ADDRESS) {
> +		dev_err(priv_dev->dev,
> +			"Device address (%d) cannot be greater than %d\n",
> +			addr, USB_DEVICE_MAX_ADDRESS);
> +		return -EINVAL;
> +	}
> +
> +	if (device_state =3D=3D USB_STATE_CONFIGURED) {
> +		dev_err(priv_dev->dev,
> +			"can't set_address from configured state\n");
> +		return -EINVAL;
> +	}
> +
> +	reg =3D readl(&priv_dev->regs->usb_cmd);
> +
> +	writel(reg | USB_CMD_FADDR(addr) | USB_CMD_SET_ADDR,
> +	       &priv_dev->regs->usb_cmd);
> +
> +	usb_gadget_set_state(&priv_dev->gadget,
> +			     (addr ? USB_STATE_ADDRESS : USB_STATE_DEFAULT));
> +
> +	return 0;
> +}
> +
> +/**
> + * cdns3_req_ep0_get_status - Handling of GET_STATUS standard USB reques=
t
> + * @priv_dev: extended gadget object
> + * @ctrl_req: pointer to received setup packet
> + *
> + * Returns 0 if success, error code on error
> + */
> +static int cdns3_req_ep0_get_status(struct cdns3_device *priv_dev,
> +				    struct usb_ctrlrequest *ctrl)
> +{
> +	__le16 *response_pkt;
> +	u16 usb_status =3D 0;
> +	u32 recip;
> +	u32 reg;
> +
> +	recip =3D ctrl->bRequestType & USB_RECIP_MASK;
> +
> +	switch (recip) {
> +	case USB_RECIP_DEVICE:
> +		/* self powered */
> +		if (priv_dev->is_selfpowered)
> +			usb_status =3D BIT(USB_DEVICE_SELF_POWERED);
> +
> +		if (priv_dev->wake_up_flag)
> +			usb_status |=3D BIT(USB_DEVICE_REMOTE_WAKEUP);
> +
> +		if (priv_dev->gadget.speed !=3D USB_SPEED_SUPER)
> +			break;
> +
> +		reg =3D readl(&priv_dev->regs->usb_sts);
> +
> +		if (priv_dev->u1_allowed)
> +			usb_status |=3D BIT(USB_DEV_STAT_U1_ENABLED);
> +
> +		if (priv_dev->u2_allowed)
> +			usb_status |=3D BIT(USB_DEV_STAT_U2_ENABLED);
> +
> +		break;
> +	case USB_RECIP_INTERFACE:
> +		return cdns3_ep0_delegate_req(priv_dev, ctrl);
> +	case USB_RECIP_ENDPOINT:
> +		/* check if endpoint is stalled */
> +		cdns3_select_ep(priv_dev, ctrl->wIndex);
> +		if (EP_STS_STALL(readl(&priv_dev->regs->ep_sts)))
> +			usb_status =3D  BIT(USB_ENDPOINT_HALT);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	response_pkt =3D (__le16 *)priv_dev->setup_buf;
> +	*response_pkt =3D cpu_to_le16(usb_status);
> +
> +	cdns3_ep0_run_transfer(priv_dev, priv_dev->setup_dma,
> +			       sizeof(*response_pkt), 1, 0);
> +	return 0;
> +}
> +
> +static int cdns3_ep0_feature_handle_device(struct cdns3_device *priv_dev=
,
> +					   struct usb_ctrlrequest *ctrl,
> +					   int set)
> +{
> +	enum usb_device_state state;
> +	enum usb_device_speed speed;
> +	int ret =3D 0;
> +	u32 wValue;
> +	u32 wIndex;
> +	u16 tmode;
> +
> +	wValue =3D le16_to_cpu(ctrl->wValue);
> +	wIndex =3D le16_to_cpu(ctrl->wIndex);
> +	state =3D priv_dev->gadget.state;
> +	speed =3D priv_dev->gadget.speed;
> +
> +	switch (ctrl->wValue) {
> +	case USB_DEVICE_REMOTE_WAKEUP:
> +		priv_dev->wake_up_flag =3D !!set;
> +		break;
> +	case USB_DEVICE_U1_ENABLE:
> +		if (state !=3D USB_STATE_CONFIGURED || speed !=3D USB_SPEED_SUPER)
> +			return -EINVAL;
> +
> +		priv_dev->u1_allowed =3D !!set;
> +		break;
> +	case USB_DEVICE_U2_ENABLE:
> +		if (state !=3D USB_STATE_CONFIGURED || speed !=3D USB_SPEED_SUPER)
> +			return -EINVAL;
> +
> +		priv_dev->u2_allowed =3D !!set;
> +		break;
> +	case USB_DEVICE_LTM_ENABLE:
> +		ret =3D -EINVAL;
> +		break;
> +	case USB_DEVICE_TEST_MODE:
> +		if (state !=3D USB_STATE_CONFIGURED || speed > USB_SPEED_HIGH)
> +			return -EINVAL;
> +
> +		tmode =3D le16_to_cpu(ctrl->wIndex);
> +
> +		if (!set || (tmode & 0xff) !=3D 0)
> +			return -EINVAL;
> +
> +		switch (tmode >> 8) {
> +		case TEST_J:
> +		case TEST_K:
> +		case TEST_SE0_NAK:
> +		case TEST_PACKET:
> +			cdns3_ep0_complete_setup(priv_dev, 0, 1);
> +			/**
> +			 *  Little delay to give the controller some time
> +			 * for sending status stage.
> +			 * This time should be less then 3ms.
> +			 */
> +			usleep_range(1000, 2000);
> +			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
> +					       USB_CMD_STMODE |
> +					       USB_STS_TMODE_SEL(tmode - 1));
> +			break;
> +		default:
> +			ret =3D -EINVAL;
> +		}
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int cdns3_ep0_feature_handle_intf(struct cdns3_device *priv_dev,
> +					 struct usb_ctrlrequest *ctrl,
> +					 int set)
> +{
> +	u32 wValue;
> +	int ret =3D 0;
> +
> +	wValue =3D le16_to_cpu(ctrl->wValue);
> +
> +	switch (wValue) {
> +	case USB_INTRF_FUNC_SUSPEND:
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int cdns3_ep0_feature_handle_endpoint(struct cdns3_device *priv_d=
ev,
> +					     struct usb_ctrlrequest *ctrl,
> +					     int set)
> +{
> +	struct cdns3_endpoint *priv_ep;
> +	int ret =3D 0;
> +	u8 index;
> +	int val;
> +
> +	if (le16_to_cpu(ctrl->wValue) !=3D USB_ENDPOINT_HALT)
> +		return -EINVAL;
> +
> +	if (!(ctrl->wIndex & ~USB_DIR_IN))
> +		return 0;
> +
> +	index =3D cdns3_ep_addr_to_index(ctrl->wIndex);
> +	priv_ep =3D priv_dev->eps[index];
> +
> +	cdns3_select_ep(priv_dev, ctrl->wIndex);
> +
> +	if (set) {
> +		writel(EP_CMD_SSTALL, &priv_dev->regs->ep_cmd);
> +		trace_cdns3_halt(priv_ep, set, 0);
> +		priv_ep->flags |=3D EP_STALL;
> +	} else {
> +		struct usb_request *request;
> +
> +		if (priv_dev->eps[index]->flags & EP_WEDGE) {
> +			cdns3_select_ep(priv_dev, 0x00);
> +			return 0;
> +		}
> +
> +		trace_cdns3_halt(priv_ep, set, 0);
> +
> +		writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
> +
> +		/* wait for EPRST cleared */
> +		readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
> +					  !(val & EP_CMD_EPRST), 1, 100);
> +		if (ret)
> +			return -EINVAL;
> +
> +		priv_ep->flags &=3D ~EP_STALL;
> +
> +		request =3D cdns3_next_request(&priv_ep->pending_req_list);
> +		if (request)
> +			cdns3_rearm_transfer(priv_ep, 1);
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * cdns3_req_ep0_handle_feature -
> + * Handling of GET/SET_FEATURE standard USB request
> + *
> + * @priv_dev: extended gadget object
> + * @ctrl_req: pointer to received setup packet
> + * @set: must be set to 1 for SET_FEATURE request
> + *
> + * Returns 0 if success, error code on error
> + */
> +static int cdns3_req_ep0_handle_feature(struct cdns3_device *priv_dev,
> +					struct usb_ctrlrequest *ctrl,
> +					int set)
> +{
> +	int ret =3D 0;
> +	u32 recip;
> +
> +	recip =3D ctrl->bRequestType & USB_RECIP_MASK;
> +
> +	switch (recip) {
> +	case USB_RECIP_DEVICE:
> +		ret =3D cdns3_ep0_feature_handle_device(priv_dev, ctrl, set);
> +		break;
> +	case USB_RECIP_INTERFACE:
> +		ret =3D cdns3_ep0_feature_handle_intf(priv_dev, ctrl, set);
> +		break;
> +	case USB_RECIP_ENDPOINT:
> +		ret =3D cdns3_ep0_feature_handle_endpoint(priv_dev, ctrl, set);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * cdns3_req_ep0_set_sel - Handling of SET_SEL standard USB request
> + * @priv_dev: extended gadget object
> + * @ctrl_req: pointer to received setup packet
> + *
> + * Returns 0 if success, error code on error
> + */
> +static int cdns3_req_ep0_set_sel(struct cdns3_device *priv_dev,
> +				 struct usb_ctrlrequest *ctrl_req)
> +{
> +	if (priv_dev->gadget.state < USB_STATE_ADDRESS)
> +		return -EINVAL;
> +
> +	if (ctrl_req->wLength !=3D 6) {
> +		dev_err(priv_dev->dev, "Set SEL should be 6 bytes, got %d\n",
> +			ctrl_req->wLength);
> +		return -EINVAL;
> +	}
> +
> +	cdns3_ep0_run_transfer(priv_dev, priv_dev->setup_dma, 6, 1, 0);
> +	return 0;
> +}
> +
> +/**
> + * cdns3_req_ep0_set_isoch_delay -
> + * Handling of GET_ISOCH_DELAY standard USB request
> + * @priv_dev: extended gadget object
> + * @ctrl_req: pointer to received setup packet
> + *
> + * Returns 0 if success, error code on error
> + */
> +static int cdns3_req_ep0_set_isoch_delay(struct cdns3_device *priv_dev,
> +					 struct usb_ctrlrequest *ctrl_req)
> +{
> +	if (ctrl_req->wIndex || ctrl_req->wLength)
> +		return -EINVAL;
> +
> +	priv_dev->isoch_delay =3D ctrl_req->wValue;
> +
> +	return 0;
> +}
> +
> +/**
> + * cdns3_ep0_standard_request - Handling standard USB requests
> + * @priv_dev: extended gadget object
> + * @ctrl_req: pointer to received setup packet
> + *
> + * Returns 0 if success, error code on error
> + */
> +static int cdns3_ep0_standard_request(struct cdns3_device *priv_dev,
> +				      struct usb_ctrlrequest *ctrl_req)
> +{
> +	int ret;
> +
> +	switch (ctrl_req->bRequest) {
> +	case USB_REQ_SET_ADDRESS:
> +		ret =3D cdns3_req_ep0_set_address(priv_dev, ctrl_req);
> +		break;
> +	case USB_REQ_SET_CONFIGURATION:
> +		ret =3D cdns3_req_ep0_set_configuration(priv_dev, ctrl_req);
> +		break;
> +	case USB_REQ_GET_STATUS:
> +		ret =3D cdns3_req_ep0_get_status(priv_dev, ctrl_req);
> +		break;
> +	case USB_REQ_CLEAR_FEATURE:
> +		ret =3D cdns3_req_ep0_handle_feature(priv_dev, ctrl_req, 0);
> +		break;
> +	case USB_REQ_SET_FEATURE:
> +		ret =3D cdns3_req_ep0_handle_feature(priv_dev, ctrl_req, 1);
> +		break;
> +	case USB_REQ_SET_SEL:
> +		ret =3D cdns3_req_ep0_set_sel(priv_dev, ctrl_req);
> +		break;
> +	case USB_REQ_SET_ISOCH_DELAY:
> +		ret =3D cdns3_req_ep0_set_isoch_delay(priv_dev, ctrl_req);
> +		break;
> +	default:
> +		ret =3D cdns3_ep0_delegate_req(priv_dev, ctrl_req);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static void __pending_setup_status_handler(struct cdns3_device *priv_dev=
)
> +{
> +	struct usb_request *request =3D priv_dev->pending_status_request;
> +
> +	if (priv_dev->status_completion_no_call && request &&
> +	    request->complete) {
> +		request->complete(&priv_dev->eps[0]->endpoint, request);
> +		priv_dev->status_completion_no_call =3D 0;
> +	}
> +}
> +
> +void cdns3_pending_setup_status_handler(struct work_struct *work)
> +{
> +	struct cdns3_device *priv_dev =3D container_of(work, struct cdns3_devic=
e,
> +			pending_status_wq);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +	__pending_setup_status_handler(priv_dev);
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +}
> +
> +/**
> + * cdns3_ep0_setup_phase - Handling setup USB requests
> + * @priv_dev: extended gadget object
> + */
> +static void cdns3_ep0_setup_phase(struct cdns3_device *priv_dev)
> +{
> +	struct usb_ctrlrequest *ctrl =3D priv_dev->setup_buf;
> +	struct cdns3_endpoint *priv_ep =3D priv_dev->eps[0];
> +	int result;
> +
> +	priv_dev->ep0_data_dir =3D ctrl->bRequestType & USB_DIR_IN;
> +
> +	trace_cdns3_ctrl_req(ctrl);
> +
> +	if (!list_empty(&priv_ep->pending_req_list)) {
> +		struct usb_request *request;
> +
> +		request =3D cdns3_next_request(&priv_ep->pending_req_list);
> +		priv_ep->dir =3D priv_dev->ep0_data_dir;
> +		cdns3_gadget_giveback(priv_ep, to_cdns3_request(request),
> +				      -ECONNRESET);
> +	}
> +
> +	if (le16_to_cpu(ctrl->wLength))
> +		priv_dev->ep0_stage =3D CDNS3_DATA_STAGE;
> +	else
> +		priv_dev->ep0_stage =3D CDNS3_STATUS_STAGE;
> +
> +	if ((ctrl->bRequestType & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD)
> +		result =3D cdns3_ep0_standard_request(priv_dev, ctrl);
> +	else
> +		result =3D cdns3_ep0_delegate_req(priv_dev, ctrl);
> +
> +	if (result =3D=3D USB_GADGET_DELAYED_STATUS)
> +		return;
> +
> +	if (result < 0)
> +		cdns3_ep0_complete_setup(priv_dev, 1, 1);
> +	else if (priv_dev->ep0_stage =3D=3D CDNS3_STATUS_STAGE)
> +		cdns3_ep0_complete_setup(priv_dev, 0, 1);
> +}
> +
> +static void cdns3_transfer_completed(struct cdns3_device *priv_dev)
> +{
> +	struct cdns3_endpoint *priv_ep =3D priv_dev->eps[0];
> +
> +	if (!list_empty(&priv_ep->pending_req_list)) {
> +		struct usb_request *request;
> +
> +		trace_cdns3_complete_trb(priv_ep, priv_ep->trb_pool);
> +		request =3D cdns3_next_request(&priv_ep->pending_req_list);
> +
> +		request->actual =3D
> +			TRB_LEN(le32_to_cpu(priv_ep->trb_pool->length));
> +
> +		priv_ep->dir =3D priv_dev->ep0_data_dir;
> +		cdns3_gadget_giveback(priv_ep, to_cdns3_request(request), 0);
> +	}
> +
> +	cdns3_ep0_complete_setup(priv_dev, 0, 0);
> +}
> +
> +/**
> + * cdns3_check_new_setup - Check if controller receive new SETUP packet.
> + * @priv_dev: extended gadget object
> + *
> + * The SETUP packet can be kept in on-chip memory or in system memory.
> + */
> +static bool cdns3_check_new_setup(struct cdns3_device *priv_dev)
> +{
> +	u32 ep_sts_reg;
> +
> +	cdns3_select_ep(priv_dev, 0 | USB_DIR_OUT);
> +	ep_sts_reg =3D readl(&priv_dev->regs->ep_sts);
> +
> +	return !!(ep_sts_reg & (EP_STS_SETUP | EP_STS_STPWAIT));
> +}
> +
> +/**
> + * cdns3_check_ep0_interrupt_proceed - Processes interrupt related to en=
dpoint 0
> + * @priv_dev: extended gadget object
> + * @dir: USB_DIR_IN for IN direction, USB_DIR_OUT for OUT direction
> + */
> +void cdns3_check_ep0_interrupt_proceed(struct cdns3_device *priv_dev, in=
t dir)
> +{
> +	u32 ep_sts_reg;
> +
> +	cdns3_select_ep(priv_dev, dir);
> +
> +	ep_sts_reg =3D readl(&priv_dev->regs->ep_sts);
> +	writel(ep_sts_reg, &priv_dev->regs->ep_sts);
> +
> +	trace_cdns3_ep0_irq(priv_dev, ep_sts_reg);
> +
> +	__pending_setup_status_handler(priv_dev);
> +
> +	if (ep_sts_reg & EP_STS_SETUP)
> +		priv_dev->wait_for_setup =3D 1;
> +
> +	if (priv_dev->wait_for_setup && ep_sts_reg & EP_STS_IOC) {
> +		priv_dev->wait_for_setup =3D 0;
> +		cdns3_allow_enable_l1(priv_dev, 0);
> +		cdns3_ep0_setup_phase(priv_dev);
> +	} else if ((ep_sts_reg & EP_STS_IOC) || (ep_sts_reg & EP_STS_ISP)) {
> +		priv_dev->ep0_data_dir =3D dir;
> +		cdns3_transfer_completed(priv_dev);
> +	}
> +
> +	if (ep_sts_reg & EP_STS_DESCMIS) {
> +		if (dir =3D=3D 0 && !priv_dev->setup_pending)
> +			cdns3_prepare_setup_packet(priv_dev);
> +	}
> +}
> +
> +/**
> + * cdns3_gadget_ep0_enable
> + * Function shouldn't be called by gadget driver,
> + * endpoint 0 is allways active
> + */
> +static int cdns3_gadget_ep0_enable(struct usb_ep *ep,
> +				   const struct usb_endpoint_descriptor *desc)
> +{
> +	return -EINVAL;
> +}
> +
> +/**
> + * cdns3_gadget_ep0_disable
> + * Function shouldn't be called by gadget driver,
> + * endpoint 0 is allways active
> + */
> +static int cdns3_gadget_ep0_disable(struct usb_ep *ep)
> +{
> +	return -EINVAL;
> +}
> +
> +/**
> + * cdns3_gadget_ep0_set_halt
> + * @ep: pointer to endpoint zero object
> + * @value: 1 for set stall, 0 for clear stall
> + *
> + * Returns 0
> + */
> +static int cdns3_gadget_ep0_set_halt(struct usb_ep *ep, int value)
> +{
> +	/* TODO */
> +	return 0;
> +}
> +
> +/**
> + * cdns3_gadget_ep0_queue Transfer data on endpoint zero
> + * @ep: pointer to endpoint zero object
> + * @request: pointer to request object
> + * @gfp_flags: gfp flags
> + *
> + * Returns 0 on success, error code elsewhere
> + */
> +static int cdns3_gadget_ep0_queue(struct usb_ep *ep,
> +				  struct usb_request *request,
> +				  gfp_t gfp_flags)
> +{
> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	unsigned long flags;
> +	int erdy_sent =3D 0;
> +	int ret =3D 0;
> +	u8 zlp =3D 0;
> +
> +	trace_cdns3_ep0_queue(priv_dev, request);
> +
> +	/* cancel the request if controller receive new SETUP packet. */
> +	if (cdns3_check_new_setup(priv_dev))
> +		return -ECONNRESET;
> +
> +	/* send STATUS stage. Should be called only for SET_CONFIGURATION */
> +	if (priv_dev->ep0_stage =3D=3D CDNS3_STATUS_STAGE) {
> +		spin_lock_irqsave(&priv_dev->lock, flags);
> +		cdns3_select_ep(priv_dev, 0x00);
> +
> +		erdy_sent =3D !priv_dev->hw_configured_flag;
> +		cdns3_set_hw_configuration(priv_dev);
> +
> +		if (!erdy_sent)
> +			cdns3_ep0_complete_setup(priv_dev, 0, 1);
> +
> +		cdns3_allow_enable_l1(priv_dev, 1);
> +
> +		request->actual =3D 0;
> +		priv_dev->status_completion_no_call =3D true;
> +		priv_dev->pending_status_request =3D request;
> +		spin_unlock_irqrestore(&priv_dev->lock, flags);
> +
> +		/*
> +		 * Since there is no completion interrupt for status stage,
> +		 * it needs to call ->completion in software after
> +		 * ep0_queue is back.
> +		 */
> +		queue_work(system_freezable_wq, &priv_dev->pending_status_wq);
> +		return 0;
> +	}
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +	if (!list_empty(&priv_ep->pending_req_list)) {
> +		dev_err(priv_dev->dev,
> +			"can't handle multiple requests for ep0\n");
> +		spin_unlock_irqrestore(&priv_dev->lock, flags);
> +		return -EBUSY;
> +	}
> +
> +	ret =3D usb_gadget_map_request_by_dev(priv_dev->sysdev, request,
> +					    priv_dev->ep0_data_dir);
> +	if (ret) {
> +		spin_unlock_irqrestore(&priv_dev->lock, flags);
> +		dev_err(priv_dev->dev, "failed to map request\n");
> +		return -EINVAL;
> +	}
> +
> +	request->status =3D -EINPROGRESS;
> +	list_add_tail(&request->list, &priv_ep->pending_req_list);
> +
> +	if (request->zero && request->length &&
> +	    (request->length % ep->maxpacket =3D=3D 0))
> +		zlp =3D 1;
> +
> +	cdns3_ep0_run_transfer(priv_dev, request->dma, request->length, 1, zlp)=
;
> +
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +
> +	return ret;
> +}
> +
> +/**
> + * cdns3_gadget_ep_set_wedge Set wedge on selected endpoint
> + * @ep: endpoint object
> + *
> + * Returns 0
> + */
> +int cdns3_gadget_ep_set_wedge(struct usb_ep *ep)
> +{
> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +
> +	dev_dbg(priv_dev->dev, "Wedge for %s\n", ep->name);
> +	cdns3_gadget_ep_set_halt(ep, 1);
> +	priv_ep->flags |=3D EP_WEDGE;
> +
> +	return 0;
> +}
> +
> +const struct usb_ep_ops cdns3_gadget_ep0_ops =3D {
> +	.enable =3D cdns3_gadget_ep0_enable,
> +	.disable =3D cdns3_gadget_ep0_disable,
> +	.alloc_request =3D cdns3_gadget_ep_alloc_request,
> +	.free_request =3D cdns3_gadget_ep_free_request,
> +	.queue =3D cdns3_gadget_ep0_queue,
> +	.dequeue =3D cdns3_gadget_ep_dequeue,
> +	.set_halt =3D cdns3_gadget_ep0_set_halt,
> +	.set_wedge =3D cdns3_gadget_ep_set_wedge,
> +};
> +
> +/**
> + * cdns3_ep0_config - Configures default endpoint
> + * @priv_dev: extended gadget object
> + *
> + * Functions sets parameters: maximal packet size and enables interrupts
> + */
> +void cdns3_ep0_config(struct cdns3_device *priv_dev)
> +{
> +	struct cdns3_usb_regs __iomem *regs;
> +	struct cdns3_endpoint *priv_ep;
> +	u32 max_packet_size =3D 64;
> +
> +	regs =3D priv_dev->regs;
> +
> +	if (priv_dev->gadget.speed =3D=3D USB_SPEED_SUPER)
> +		max_packet_size =3D 512;
> +
> +	priv_ep =3D priv_dev->eps[0];
> +
> +	if (!list_empty(&priv_ep->pending_req_list)) {
> +		struct usb_request *request;
> +
> +		request =3D cdns3_next_request(&priv_ep->pending_req_list);
> +		list_del_init(&request->list);
> +	}
> +
> +	priv_dev->u1_allowed =3D 0;
> +	priv_dev->u2_allowed =3D 0;
> +
> +	priv_dev->gadget.ep0->maxpacket =3D max_packet_size;
> +	cdns3_gadget_ep0_desc.wMaxPacketSize =3D cpu_to_le16(max_packet_size);
> +
> +	/* init ep out */
> +	cdns3_select_ep(priv_dev, USB_DIR_OUT);
> +
> +	if (priv_dev->dev_ver >=3D DEV_VER_V3) {
> +		cdns3_set_register_bit(&priv_dev->regs->dtrans,
> +				       BIT(0) | BIT(16));
> +		cdns3_set_register_bit(&priv_dev->regs->tdl_from_trb,
> +				       BIT(0) | BIT(16));
> +	}
> +
> +	writel(EP_CFG_ENABLE | EP_CFG_MAXPKTSIZE(max_packet_size),
> +	       &regs->ep_cfg);
> +
> +	writel(EP_STS_EN_SETUPEN | EP_STS_EN_DESCMISEN | EP_STS_EN_TRBERREN,
> +	       &regs->ep_sts_en);
> +
> +	/* init ep in */
> +	cdns3_select_ep(priv_dev, USB_DIR_IN);
> +
> +	writel(EP_CFG_ENABLE | EP_CFG_MAXPKTSIZE(max_packet_size),
> +	       &regs->ep_cfg);
> +
> +	writel(EP_STS_EN_SETUPEN | EP_STS_EN_TRBERREN, &regs->ep_sts_en);
> +
> +	cdns3_set_register_bit(&regs->usb_conf, USB_CONF_U1DS | USB_CONF_U2DS);
> +}
> +
> +/**
> + * cdns3_init_ep0 Initializes software endpoint 0 of gadget
> + * @priv_dev: extended gadget object
> + * @ep_priv: extended endpoint object
> + *
> + * Returns 0 on success else error code.
> + */
> +int cdns3_init_ep0(struct cdns3_device *priv_dev,
> +		   struct cdns3_endpoint *priv_ep)
> +{
> +	sprintf(priv_ep->name, "ep0");
> +
> +	/* fill linux fields */
> +	priv_ep->endpoint.ops =3D &cdns3_gadget_ep0_ops;
> +	priv_ep->endpoint.maxburst =3D 1;
> +	usb_ep_set_maxpacket_limit(&priv_ep->endpoint,
> +				   CDNS3_EP0_MAX_PACKET_LIMIT);
> +	priv_ep->endpoint.address =3D 0;
> +	priv_ep->endpoint.caps.type_control =3D 1;
> +	priv_ep->endpoint.caps.dir_in =3D 1;
> +	priv_ep->endpoint.caps.dir_out =3D 1;
> +	priv_ep->endpoint.name =3D priv_ep->name;
> +	priv_ep->endpoint.desc =3D &cdns3_gadget_ep0_desc;
> +	priv_dev->gadget.ep0 =3D &priv_ep->endpoint;
> +	priv_ep->type =3D USB_ENDPOINT_XFER_CONTROL;
> +
> +	return cdns3_allocate_trb_pool(priv_ep);
> +}
> diff --git a/drivers/usb/cdns3/gadget-export.h b/drivers/usb/cdns3/gadget=
-export.h
> new file mode 100644
> index 000000000000..577469eee961
> --- /dev/null
> +++ b/drivers/usb/cdns3/gadget-export.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Cadence USBSS DRD Driver - Gadget Export APIs.
> + *
> + * Copyright (C) 2017 NXP
> + * Copyright (C) 2017-2018 NXP
> + *
> + * Authors: Peter Chen <peter.chen@nxp.com>
> + */
> +#ifndef __LINUX_CDNS3_GADGET_EXPORT
> +#define __LINUX_CDNS3_GADGET_EXPORT
> +
> +#ifdef CONFIG_USB_CDNS3_GADGET
> +
> +int cdns3_gadget_init(struct cdns3 *cdns);
> +void cdns3_gadget_exit(struct cdns3 *cdns);
> +#else
> +
> +static inline int cdns3_gadget_init(struct cdns3 *cdns)
> +{
> +	return -ENXIO;
> +}
> +
> +static inline void cdns3_gadget_exit(struct cdns3 *cdns) { }
> +
> +#endif
> +
> +#endif /* __LINUX_CDNS3_GADGET_EXPORT */
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
> +/*
> + * Work around 1:
> + * At some situations, the controller may get stale data address in TRB
> + * at below sequences:
> + * 1. Controller read TRB includes data address
> + * 2. Software updates TRBs includes data address and Cycle bit
> + * 3. Controller read TRB which includes Cycle bit
> + * 4. DMA run with stale data address
> + *
> + * To fix this problem, driver needs to make the first TRB in TD as inva=
lid.
> + * After preparing all TRBs driver needs to check the position of DMA an=
d
> + * if the DMA point to the first just added TRB and doorbell is 1,
> + * then driver must defer making this TRB as valid. This TRB will be mak=
e
> + * as valid during adding next TRB only if DMA is stopped or at TRBERR
> + * interrupt.
> + *
> + * Issue has been fixed in DEV_VER_V3 version of controller.
> + *
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/usb/gadget.h>
> +#include <linux/module.h>
> +#include <linux/iopoll.h>
> +
> +#include "core.h"
> +#include "gadget-export.h"
> +#include "gadget.h"
> +#include "trace.h"
> +#include "drd.h"
> +
> +static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
> +				   struct usb_request *request,
> +				   gfp_t gfp_flags);
> +
> +/**
> + * cdns3_set_register_bit - set bit in given register.
> + * @ptr: address of device controller register to be read and changed
> + * @mask: bits requested to set
> + */
> +void cdns3_set_register_bit(void __iomem *ptr, u32 mask)
> +{
> +	mask =3D readl(ptr) | mask;
> +	writel(mask, ptr);
> +}
> +
> +/**
> + * cdns3_ep_addr_to_index - Macro converts endpoint address to
> + * index of endpoint object in cdns3_device.eps[] container
> + * @ep_addr: endpoint address for which endpoint object is required
> + *
> + */
> +u8 cdns3_ep_addr_to_index(u8 ep_addr)
> +{
> +	return (((ep_addr & 0x7F)) + ((ep_addr & USB_DIR_IN) ? 16 : 0));
> +}
> +
> +static int cdns3_get_dma_pos(struct cdns3_device *priv_dev,
> +			     struct cdns3_endpoint *priv_ep)
> +{
> +	int dma_index;
> +
> +	dma_index =3D readl(&priv_dev->regs->ep_traddr) - priv_ep->trb_pool_dma=
;
> +
> +	return dma_index / TRB_SIZE;
> +}
> +
> +/**
> + * cdns3_next_request - returns next request from list
> + * @list: list containing requests
> + *
> + * Returns request or NULL if no requests in list
> + */
> +struct usb_request *cdns3_next_request(struct list_head *list)
> +{
> +	return list_first_entry_or_null(list, struct usb_request, list);
> +}
> +
> +/**
> + * cdns3_next_align_buf - returns next buffer from list
> + * @list: list containing buffers
> + *
> + * Returns buffer or NULL if no buffers in list
> + */
> +struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
> +{
> +	return list_first_entry_or_null(list, struct cdns3_aligned_buf, list);
> +}
> +
> +/**
> + * select_ep - selects endpoint
> + * @priv_dev:  extended gadget object
> + * @ep: endpoint address
> + */
> +void cdns3_select_ep(struct cdns3_device *priv_dev, u32 ep)
> +{
> +	if (priv_dev->selected_ep =3D=3D ep)
> +		return;
> +
> +	priv_dev->selected_ep =3D ep;
> +	writel(ep, &priv_dev->regs->ep_sel);
> +}
> +
> +dma_addr_t cdns3_trb_virt_to_dma(struct cdns3_endpoint *priv_ep,
> +				 struct cdns3_trb *trb)
> +{
> +	u32 offset =3D (char *)trb - (char *)priv_ep->trb_pool;
> +
> +	return priv_ep->trb_pool_dma + offset;
> +}
> +
> +int cdns3_ring_size(struct cdns3_endpoint *priv_ep)
> +{
> +	switch (priv_ep->type) {
> +	case USB_ENDPOINT_XFER_ISOC:
> +		return TRB_ISO_RING_SIZE;
> +	case USB_ENDPOINT_XFER_CONTROL:
> +		return TRB_CTRL_RING_SIZE;
> +	default:
> +		return TRB_RING_SIZE;
> +	}
> +}
> +
> +/**
> + * cdns3_allocate_trb_pool - Allocates TRB's pool for selected endpoint
> + * @priv_ep:  endpoint object
> + *
> + * Function will return 0 on success or -ENOMEM on allocation error
> + */
> +int cdns3_allocate_trb_pool(struct cdns3_endpoint *priv_ep)
> +{
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	int ring_size =3D cdns3_ring_size(priv_ep);
> +	struct cdns3_trb *link_trb;
> +
> +	if (!priv_ep->trb_pool) {
> +		priv_ep->trb_pool =3D dma_alloc_coherent(priv_dev->sysdev,
> +						       ring_size,
> +						       &priv_ep->trb_pool_dma,
> +						       GFP_DMA32 | GFP_ATOMIC);
> +		if (!priv_ep->trb_pool)
> +			return -ENOMEM;
> +	} else {
> +		memset(priv_ep->trb_pool, 0, ring_size);
> +	}
> +
> +	if (!priv_ep->num)
> +		return 0;
> +
> +	priv_ep->num_trbs =3D ring_size / TRB_SIZE;
> +	/* Initialize the last TRB as Link TRB. */
> +	link_trb =3D (priv_ep->trb_pool + (priv_ep->num_trbs - 1));
> +	link_trb->buffer =3D TRB_BUFFER(priv_ep->trb_pool_dma);
> +	link_trb->control =3D TRB_CYCLE | TRB_TYPE(TRB_LINK) | TRB_TOGGLE;
> +
> +	return 0;
> +}
> +
> +static void cdns3_free_trb_pool(struct cdns3_endpoint *priv_ep)
> +{
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +
> +	if (priv_ep->trb_pool) {
> +		dma_free_coherent(priv_dev->sysdev,
> +				  cdns3_ring_size(priv_ep),
> +				  priv_ep->trb_pool, priv_ep->trb_pool_dma);
> +		priv_ep->trb_pool =3D NULL;
> +	}
> +}
> +
> +/**
> + * cdns3_ep_stall_flush - Stalls and flushes selected endpoint
> + * @priv_ep: endpoint object
> + *
> + * Endpoint must be selected before call to this function
> + */
> +static void cdns3_ep_stall_flush(struct cdns3_endpoint *priv_ep)
> +{
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	int val;
> +
> +	trace_cdns3_halt(priv_ep, 1, 1);
> +
> +	writel(EP_CMD_DFLUSH | EP_CMD_ERDY | EP_CMD_SSTALL,
> +	       &priv_dev->regs->ep_cmd);
> +
> +	/* wait for DFLUSH cleared */
> +	readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
> +				  !(val & EP_CMD_DFLUSH), 1, 1000);
> +	priv_ep->flags |=3D EP_STALL;
> +}
> +
> +/**
> + * cdns3_hw_reset_eps_config - reset endpoints configuration kept by con=
troller.
> + * @priv_dev: extended gadget object
> + */
> +void cdns3_hw_reset_eps_config(struct cdns3_device *priv_dev)
> +{
> +	writel(USB_CONF_CFGRST, &priv_dev->regs->usb_conf);
> +
> +	cdns3_allow_enable_l1(priv_dev, 0);
> +	priv_dev->hw_configured_flag =3D 0;
> +	priv_dev->onchip_used_size =3D 0;
> +	priv_dev->out_mem_is_allocated =3D 0;
> +	priv_dev->wait_for_setup =3D 0;
> +}
> +
> +/**
> + * cdns3_ep_inc_trb - increment a trb index.
> + * @index: Pointer to the TRB index to increment.
> + * @cs: Cycle state
> + * @trb_in_seg: number of TRBs in segment
> + *
> + * The index should never point to the link TRB. After incrementing,
> + * if it is point to the link TRB, wrap around to the beginning and reve=
rt
> + * cycle state bit The
> + * link TRB is always at the last TRB entry.
> + */
> +static void cdns3_ep_inc_trb(int *index, u8 *cs, int trb_in_seg)
> +{
> +	(*index)++;
> +	if (*index =3D=3D (trb_in_seg - 1)) {
> +		*index =3D 0;
> +		*cs ^=3D  1;
> +	}
> +}
> +
> +/**
> + * cdns3_ep_inc_enq - increment endpoint's enqueue pointer
> + * @priv_ep: The endpoint whose enqueue pointer we're incrementing
> + */
> +static void cdns3_ep_inc_enq(struct cdns3_endpoint *priv_ep)
> +{
> +	priv_ep->free_trbs--;
> +	cdns3_ep_inc_trb(&priv_ep->enqueue, &priv_ep->pcs, priv_ep->num_trbs);
> +}
> +
> +/**
> + * cdns3_ep_inc_deq - increment endpoint's dequeue pointer
> + * @priv_ep: The endpoint whose dequeue pointer we're incrementing
> + */
> +static void cdns3_ep_inc_deq(struct cdns3_endpoint *priv_ep)
> +{
> +	priv_ep->free_trbs++;
> +	cdns3_ep_inc_trb(&priv_ep->dequeue, &priv_ep->ccs, priv_ep->num_trbs);
> +}
> +
> +void cdns3_move_deq_to_next_trb(struct cdns3_request *priv_req)
> +{
> +	struct cdns3_endpoint *priv_ep =3D priv_req->priv_ep;
> +	int current_trb =3D priv_req->start_trb;
> +
> +	while (current_trb !=3D priv_req->end_trb) {
> +		cdns3_ep_inc_deq(priv_ep);
> +		current_trb =3D priv_ep->dequeue;
> +	}
> +
> +	cdns3_ep_inc_deq(priv_ep);
> +}
> +
> +/**
> + * cdns3_allow_enable_l1 - enable/disable permits to transition to L1.
> + * @priv_dev: Extended gadget object
> + * @enable: Enable/disable permit to transition to L1.
> + *
> + * If bit USB_CONF_L1EN is set and device receive Extended Token packet,
> + * then controller answer with ACK handshake.
> + * If bit USB_CONF_L1DS is set and device receive Extended Token packet,
> + * then controller answer with NYET handshake.
> + */
> +void cdns3_allow_enable_l1(struct cdns3_device *priv_dev, int enable)
> +{
> +	if (enable)
> +		writel(USB_CONF_L1EN, &priv_dev->regs->usb_conf);
> +	else
> +		writel(USB_CONF_L1DS, &priv_dev->regs->usb_conf);
> +}
> +
> +enum usb_device_speed cdns3_get_speed(struct cdns3_device *priv_dev)
> +{
> +	u32 reg;
> +
> +	reg =3D readl(&priv_dev->regs->usb_sts);
> +
> +	if (DEV_SUPERSPEED(reg))
> +		return USB_SPEED_SUPER;
> +	else if (DEV_HIGHSPEED(reg))
> +		return USB_SPEED_HIGH;
> +	else if (DEV_FULLSPEED(reg))
> +		return USB_SPEED_FULL;
> +	else if (DEV_LOWSPEED(reg))
> +		return USB_SPEED_LOW;
> +	return USB_SPEED_UNKNOWN;
> +}
> +
> +/**
> + * cdns3_start_all_request - add to ring all request not started
> + * @priv_dev: Extended gadget object
> + * @priv_ep: The endpoint for whom request will be started.
> + *
> + * Returns return ENOMEM if transfer ring i not enough TRBs to start
> + *         all requests.
> + */
> +static int cdns3_start_all_request(struct cdns3_device *priv_dev,
> +				   struct cdns3_endpoint *priv_ep)
> +{
> +	struct cdns3_request *priv_req;
> +	struct usb_request *request;
> +	int ret =3D 0;
> +
> +	while (!list_empty(&priv_ep->deferred_req_list)) {
> +		request =3D cdns3_next_request(&priv_ep->deferred_req_list);
> +		priv_req =3D to_cdns3_request(request);
> +
> +		ret =3D cdns3_ep_run_transfer(priv_ep, request);
> +		if (ret)
> +			return ret;
> +
> +		list_del(&request->list);
> +		list_add_tail(&request->list,
> +			      &priv_ep->pending_req_list);
> +	}
> +
> +	priv_ep->flags &=3D ~EP_RING_FULL;
> +	return ret;
> +}
> +
> +/**
> + * cdns3_gadget_giveback - call struct usb_request's ->complete callback
> + * @priv_ep: The endpoint to whom the request belongs to
> + * @priv_req: The request we're giving back
> + * @status: completion code for the request
> + *
> + * Must be called with controller's lock held and interrupts disabled. T=
his
> + * function will unmap @req and call its ->complete() callback to notify=
 upper
> + * layers that it has completed.
> + */
> +void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
> +			   struct cdns3_request *priv_req,
> +			   int status)
> +{
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	struct usb_request *request =3D &priv_req->request;
> +
> +	list_del_init(&request->list);
> +
> +	if (request->status =3D=3D -EINPROGRESS)
> +		request->status =3D status;
> +
> +	usb_gadget_unmap_request_by_dev(priv_dev->sysdev, request,
> +					priv_ep->dir);
> +
> +	if ((priv_req->flags & REQUEST_UNALIGNED) &&
> +	    priv_ep->dir =3D=3D USB_DIR_OUT && !request->status)
> +		memcpy(request->buf, priv_req->aligned_buf->buf,
> +		       request->length);
> +
> +	priv_req->flags &=3D ~(REQUEST_PENDING | REQUEST_UNALIGNED);
> +	trace_cdns3_gadget_giveback(priv_req);
> +
> +	if (request->complete) {
> +		spin_unlock(&priv_dev->lock);
> +		usb_gadget_giveback_request(&priv_ep->endpoint,
> +					    request);
> +		spin_lock(&priv_dev->lock);
> +	}
> +
> +	if (request->buf =3D=3D priv_dev->zlp_buf)
> +		cdns3_gadget_ep_free_request(&priv_ep->endpoint, request);
> +}
> +
> +void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
> +{
> +	/* Work around for stale data address in TRB*/
> +	if (priv_ep->wa1_set) {
> +		trace_cdns3_wa1(priv_ep, "restore cycle bit");
> +
> +		priv_ep->wa1_set =3D 0;
> +		priv_ep->wa1_trb_index =3D 0xFFFF;
> +		if (priv_ep->wa1_cycle_bit) {
> +			priv_ep->wa1_trb->control =3D
> +				priv_ep->wa1_trb->control | 0x1;
> +		} else {
> +			priv_ep->wa1_trb->control =3D
> +				priv_ep->wa1_trb->control & ~0x1;
> +		}
> +	}
> +}
> +
> +static int cdns3_prepare_aligned_request_buf(struct cdns3_request *priv_=
req)
> +{
> +	struct cdns3_endpoint *priv_ep =3D priv_req->priv_ep;
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	struct cdns3_aligned_buf *buf;
> +
> +	/* check if buffer is aligned to 8. */
> +	if (!((uintptr_t)priv_req->request.buf & 0x7))
> +		return 0;
> +
> +	buf =3D priv_req->aligned_buf;
> +
> +	if (!buf || priv_req->request.length > buf->size) {
> +		buf =3D kzalloc(sizeof(*buf), GFP_ATOMIC);
> +		if (!buf)
> +			return -ENOMEM;
> +
> +		buf->size =3D priv_req->request.length;
> +
> +		buf->buf =3D dma_alloc_coherent(priv_dev->sysdev,
> +					      buf->size,
> +					      &buf->dma,
> +					      GFP_ATOMIC);
> +		if (!buf->buf) {
> +			kfree(buf);
> +			return -ENOMEM;
> +		}
> +
> +		if (priv_req->aligned_buf) {
> +			trace_cdns3_free_aligned_request(priv_req);
> +			priv_req->aligned_buf->in_use =3D 0;
> +			priv_dev->run_garbage_collector =3D 1;
> +		}
> +
> +		buf->in_use =3D 1;
> +		priv_req->aligned_buf =3D buf;
> +
> +		list_add_tail(&buf->list,
> +			      &priv_dev->aligned_buf_list);
> +	}
> +
> +	if (priv_ep->dir =3D=3D USB_DIR_IN) {
> +		memcpy(buf->buf, priv_req->request.buf,
> +		       priv_req->request.length);
> +	}
> +
> +	priv_req->flags |=3D REQUEST_UNALIGNED;
> +	trace_cdns3_prepare_aligned_request(priv_req);
> +
> +	return 0;
> +}
> +
> +static int cdns3_wa1_update_guard(struct cdns3_endpoint *priv_ep,
> +				  struct cdns3_trb *trb)
> +{
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +
> +	if (!priv_ep->wa1_set) {
> +		u32 doorbell;
> +
> +		doorbell =3D !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);
> +
> +		if (doorbell) {
> +			priv_ep->wa1_cycle_bit =3D priv_ep->pcs ? TRB_CYCLE : 0;
> +			priv_ep->wa1_set =3D 1;
> +			priv_ep->wa1_trb =3D trb;
> +			priv_ep->wa1_trb_index =3D priv_ep->enqueue;
> +			trace_cdns3_wa1(priv_ep, "set guard");
> +			return 0;
> +		}
> +	}
> +	return 1;
> +}
> +
> +static void cdns3_wa1_tray_restore_cycle_bit(struct cdns3_device *priv_d=
ev,
> +					     struct cdns3_endpoint *priv_ep)
> +{
> +	int dma_index;
> +	u32 doorbell;
> +
> +	doorbell =3D !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);
> +	dma_index =3D cdns3_get_dma_pos(priv_dev, priv_ep);
> +
> +	if (!doorbell || dma_index !=3D priv_ep->wa1_trb_index)
> +		cdns3_wa1_restore_cycle_bit(priv_ep);
> +}
> +
> +/**
> + * cdns3_ep_run_transfer - start transfer on no-default endpoint hardwar=
e
> + * @priv_ep: endpoint object
> + *
> + * Returns zero on success or negative value on failure
> + */
> +int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
> +			  struct usb_request *request)
> +{
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	struct cdns3_request *priv_req;
> +	struct cdns3_trb *trb;
> +	dma_addr_t trb_dma;
> +	u32 togle_pcs =3D 1;
> +	int sg_iter =3D 0;
> +	int num_trb;
> +	int address;
> +	u32 control;
> +	int pcs;
> +
> +	if (priv_ep->type =3D=3D USB_ENDPOINT_XFER_ISOC)
> +		num_trb =3D priv_ep->interval;
> +	else
> +		num_trb =3D request->num_sgs ? request->num_sgs : 1;
> +
> +	if (num_trb > priv_ep->free_trbs) {
> +		priv_ep->flags |=3D EP_RING_FULL;
> +		return -ENOBUFS;
> +	}
> +
> +	priv_req =3D to_cdns3_request(request);
> +	address =3D priv_ep->endpoint.desc->bEndpointAddress;
> +
> +	priv_ep->flags |=3D EP_PENDING_REQUEST;
> +
> +	/* must allocate buffer aligned to 8 */
> +	if (priv_req->flags & REQUEST_UNALIGNED)
> +		trb_dma =3D priv_req->aligned_buf->dma;
> +	else
> +		trb_dma =3D request->dma;
> +
> +	trb =3D priv_ep->trb_pool + priv_ep->enqueue;
> +	priv_req->start_trb =3D priv_ep->enqueue;
> +	priv_req->trb =3D trb;
> +
> +	cdns3_select_ep(priv_ep->cdns3_dev, address);
> +
> +	/* prepare ring */
> +	if ((priv_ep->enqueue + num_trb)  >=3D (priv_ep->num_trbs - 1)) {
> +		struct cdns3_trb *link_trb;
> +		int doorbell, dma_index;
> +		u32 ch_bit =3D 0;
> +
> +		doorbell =3D !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);
> +		dma_index =3D cdns3_get_dma_pos(priv_dev, priv_ep);
> +
> +		/* Driver can't update LINK TRB if it is current processed. */
> +		if (doorbell && dma_index =3D=3D priv_ep->num_trbs - 1) {
> +			priv_ep->flags |=3D EP_DEFERRED_DRDY;
> +			return -ENOBUFS;
> +		}
> +
> +		/*updating C bt in  Link TRB before starting DMA*/
> +		link_trb =3D priv_ep->trb_pool + (priv_ep->num_trbs - 1);
> +		/*
> +		 * For TRs size equal 2 enabling TRB_CHAIN for epXin causes
> +		 * that DMA stuck at the LINK TRB.
> +		 * On the other hand, removing TRB_CHAIN for longer TRs for
> +		 * epXout cause that DMA stuck after handling LINK TRB.
> +		 * To eliminate this strange behavioral driver set TRB_CHAIN
> +		 * bit only for TR size > 2.
> +		 */
> +		if (priv_ep->type =3D=3D USB_ENDPOINT_XFER_ISOC ||
> +		    TRBS_PER_SEGMENT > 2)
> +			ch_bit =3D TRB_CHAIN;
> +
> +		link_trb->control =3D ((priv_ep->pcs) ? TRB_CYCLE : 0) |
> +				    TRB_TYPE(TRB_LINK) | TRB_TOGGLE | ch_bit;
> +	}
> +
> +	if (priv_dev->dev_ver <=3D DEV_VER_V2)
> +		togle_pcs =3D cdns3_wa1_update_guard(priv_ep, trb);
> +
> +	/* set incorrect Cycle Bit for first trb*/
> +	control =3D priv_ep->pcs ? 0 : TRB_CYCLE;
> +
> +	do {
> +		u32 length;
> +		u16 td_size =3D 0;
> +
> +		/* fill TRB */
> +		control |=3D TRB_TYPE(TRB_NORMAL);
> +		trb->buffer =3D TRB_BUFFER(request->num_sgs =3D=3D 0
> +				? trb_dma : request->sg[sg_iter].dma_address);
> +
> +		if (likely(!request->num_sgs))
> +			length =3D request->length;
> +		else
> +			length =3D request->sg[sg_iter].length;
> +
> +		if (likely(priv_dev->dev_ver >=3D DEV_VER_V2))
> +			td_size =3D DIV_ROUND_UP(length,
> +					       priv_ep->endpoint.maxpacket);
> +
> +		trb->length =3D TRB_BURST_LEN(priv_ep->trb_burst_size) |
> +					TRB_LEN(length);
> +		if (priv_dev->gadget.speed =3D=3D USB_SPEED_SUPER)
> +			trb->length |=3D TRB_TDL_SS_SIZE(td_size);
> +		else
> +			control |=3D TRB_TDL_HS_SIZE(td_size);
> +
> +		pcs =3D priv_ep->pcs ? TRB_CYCLE : 0;
> +
> +		/*
> +		 * first trb should be prepared as last to avoid processing
> +		 *  transfer to early
> +		 */
> +		if (sg_iter !=3D 0)
> +			control |=3D pcs;
> +
> +		if (priv_ep->type =3D=3D USB_ENDPOINT_XFER_ISOC  && !priv_ep->dir) {
> +			control |=3D TRB_IOC | TRB_ISP;
> +		} else {
> +			/* for last element in TD or in SG list */
> +			if (sg_iter =3D=3D (num_trb - 1) && sg_iter !=3D 0)
> +				control |=3D pcs | TRB_IOC | TRB_ISP;
> +		}
> +
> +		if (sg_iter)
> +			trb->control =3D control;
> +		else
> +			priv_req->trb->control =3D control;
> +
> +		control =3D 0;
> +		++sg_iter;
> +		priv_req->end_trb =3D priv_ep->enqueue;
> +		cdns3_ep_inc_enq(priv_ep);
> +		trb =3D priv_ep->trb_pool + priv_ep->enqueue;
> +	} while (sg_iter < num_trb);
> +
> +	trb =3D priv_req->trb;
> +
> +	priv_req->flags |=3D REQUEST_PENDING;
> +
> +	if (sg_iter =3D=3D 1)
> +		trb->control |=3D TRB_IOC | TRB_ISP;
> +	/*
> +	 * Memory barrier - cycle bit must be set before other filds in trb.
> +	 */
> +	wmb();
> +
> +	/* give the TD to the consumer*/
> +	if (togle_pcs)
> +		trb->control =3D  trb->control ^ 1;
> +
> +	if (priv_dev->dev_ver <=3D DEV_VER_V2)
> +		cdns3_wa1_tray_restore_cycle_bit(priv_dev, priv_ep);
> +
> +	trace_cdns3_prepare_trb(priv_ep, priv_req->trb);
> +
> +	/*
> +	 * Memory barrier - Cycle Bit must be set before trb->length  and
> +	 * trb->buffer fields.
> +	 */
> +	wmb();
> +
> +	/*
> +	 * For DMULT mode we can set address to transfer ring only once after
> +	 * enabling endpoint.
> +	 */
> +	if (priv_ep->flags & EP_UPDATE_EP_TRBADDR) {
> +		/*
> +		 * Until SW is not ready to handle the OUT transfer the ISO OUT
> +		 * Endpoint should be disabled (EP_CFG.ENABLE =3D 0).
> +		 * EP_CFG_ENABLE must be set before updating ep_traddr.
> +		 */
> +		if (priv_ep->type =3D=3D USB_ENDPOINT_XFER_ISOC  && !priv_ep->dir &&
> +		    !(priv_ep->flags & EP_QUIRK_ISO_OUT_EN)) {
> +			priv_ep->flags |=3D EP_QUIRK_ISO_OUT_EN;
> +			cdns3_set_register_bit(&priv_dev->regs->ep_cfg,
> +					       EP_CFG_ENABLE);
> +		}
> +
> +		writel(EP_TRADDR_TRADDR(priv_ep->trb_pool_dma +
> +					priv_req->start_trb * TRB_SIZE),
> +					&priv_dev->regs->ep_traddr);
> +
> +		priv_ep->flags &=3D ~EP_UPDATE_EP_TRBADDR;
> +	}
> +
> +	if (!priv_ep->wa1_set && !(priv_ep->flags & EP_STALL)) {
> +		trace_cdns3_ring(priv_ep);
> +		/*clearing TRBERR and EP_STS_DESCMIS before seting DRDY*/
> +		writel(EP_STS_TRBERR | EP_STS_DESCMIS, &priv_dev->regs->ep_sts);
> +		writel(EP_CMD_DRDY, &priv_dev->regs->ep_cmd);
> +		trace_cdns3_doorbell_epx(priv_ep->name,
> +					 readl(&priv_dev->regs->ep_traddr));
> +	}
> +
> +	/* WORKAROUND for transition to L0 */
> +	__cdns3_gadget_wakeup(priv_dev);
> +
> +	return 0;
> +}
> +
> +void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
> +{
> +	struct cdns3_endpoint *priv_ep;
> +	struct usb_ep *ep;
> +	int val;
> +
> +	if (priv_dev->hw_configured_flag)
> +		return;
> +
> +	writel(USB_CONF_CFGSET, &priv_dev->regs->usb_conf);
> +	writel(EP_CMD_ERDY | EP_CMD_REQ_CMPL, &priv_dev->regs->ep_cmd);
> +
> +	cdns3_set_register_bit(&priv_dev->regs->usb_conf,
> +			       USB_CONF_U1EN | USB_CONF_U2EN);
> +
> +	/* wait until configuration set */
> +	readl_poll_timeout_atomic(&priv_dev->regs->usb_sts, val,
> +				  val & USB_STS_CFGSTS_MASK, 1, 100);
> +
> +	priv_dev->hw_configured_flag =3D 1;
> +
> +	list_for_each_entry(ep, &priv_dev->gadget.ep_list, ep_list) {
> +		if (ep->enabled) {
> +			priv_ep =3D ep_to_cdns3_ep(ep);
> +			cdns3_start_all_request(priv_dev, priv_ep);
> +		}
> +	}
> +}
> +
> +/**
> + * cdns3_request_handled - check whether request has been handled by DMA
> + *
> + * @priv_ep: extended endpoint object.
> + * @priv_req: request object for checking
> + *
> + * Endpoint must be selected before invoking this function.
> + *
> + * Returns false if request has not been handled by DMA, else returns tr=
ue.
> + *
> + * SR - start ring
> + * ER -  end ring
> + * DQ =3D priv_ep->dequeue - dequeue position
> + * EQ =3D priv_ep->enqueue -  enqueue position
> + * ST =3D priv_req->start_trb - index of first TRB in transfer ring
> + * ET =3D priv_req->end_trb - index of last TRB in transfer ring
> + * CI =3D current_index - index of processed TRB by DMA.
> + *
> + * As first step, function checks if cycle bit for priv_req->start_trb i=
s
> + * correct.
> + *
> + * some rules:
> + * 1. priv_ep->dequeue never exceed current_index.
> + * 2  priv_ep->enqueue never exceed priv_ep->dequeue
> + * 3. exception: priv_ep->enqueue =3D=3D priv_ep->dequeue
> + *    and priv_ep->free_trbs is zero.
> + *    This case indicate that TR is full.
> + *
> + * Then We can split recognition into two parts:
> + * Case 1 - priv_ep->dequeue < current_index
> + *      SR ... EQ ... DQ ... CI ... ER
> + *      SR ... DQ ... CI ... EQ ... ER
> + *
> + *      Request has been handled by DMA if ST and ET is between DQ and C=
I.
> + *
> + * Case 2 - priv_ep->dequeue > current_index
> + * This situation take place when CI go through the LINK TRB at the end =
of
> + * transfer ring.
> + *      SR ... CI ... EQ ... DQ ... ER
> + *
> + *      Request has been handled by DMA if ET is less then CI or
> + *      ET is greater or equal DQ.
> + */
> +static bool cdns3_request_handled(struct cdns3_endpoint *priv_ep,
> +				  struct cdns3_request *priv_req)
> +{
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	struct cdns3_trb *trb =3D priv_req->trb;
> +	int current_index =3D 0;
> +	int handled =3D 0;
> +	int doorbell;
> +
> +	current_index =3D cdns3_get_dma_pos(priv_dev, priv_ep);
> +	doorbell =3D !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);
> +
> +	trb =3D &priv_ep->trb_pool[priv_req->start_trb];
> +
> +	if ((trb->control  & TRB_CYCLE) !=3D priv_ep->ccs)
> +		goto finish;
> +
> +	if (doorbell =3D=3D 1 && current_index =3D=3D priv_ep->dequeue)
> +		goto finish;
> +
> +	/* The corner case for TRBS_PER_SEGMENT equal 2). */
> +	if (TRBS_PER_SEGMENT =3D=3D 2 && priv_ep->type !=3D USB_ENDPOINT_XFER_I=
SOC) {
> +		handled =3D 1;
> +		goto finish;
> +	}
> +
> +	if (priv_ep->enqueue =3D=3D priv_ep->dequeue &&
> +	    priv_ep->free_trbs =3D=3D 0) {
> +		handled =3D 1;
> +	} else if (priv_ep->dequeue < current_index) {
> +		if ((current_index =3D=3D (priv_ep->num_trbs - 1)) &&
> +		    !priv_ep->dequeue)
> +			goto finish;
> +
> +		if (priv_req->end_trb >=3D priv_ep->dequeue &&
> +		    priv_req->end_trb < current_index)
> +			handled =3D 1;
> +	} else if (priv_ep->dequeue  > current_index) {
> +		if (priv_req->end_trb  < current_index ||
> +		    priv_req->end_trb >=3D priv_ep->dequeue)
> +			handled =3D 1;
> +	}
> +
> +finish:
> +	trace_cdns3_request_handled(priv_req, current_index, handled);
> +
> +	return handled;
> +}
> +
> +static void cdns3_transfer_completed(struct cdns3_device *priv_dev,
> +				     struct cdns3_endpoint *priv_ep)
> +{
> +	struct cdns3_request *priv_req;
> +	struct usb_request *request;
> +	struct cdns3_trb *trb;
> +
> +	while (!list_empty(&priv_ep->pending_req_list)) {
> +		request =3D cdns3_next_request(&priv_ep->pending_req_list);
> +		priv_req =3D to_cdns3_request(request);
> +
> +		/* Re-select endpoint. It could be changed by other CPU during
> +		 * handling usb_gadget_giveback_request.
> +		 */
> +		cdns3_select_ep(priv_dev, priv_ep->endpoint.address);
> +
> +		if (!cdns3_request_handled(priv_ep, priv_req))
> +			goto prepare_next_td;
> +
> +		trb =3D priv_ep->trb_pool + priv_ep->dequeue;
> +		trace_cdns3_complete_trb(priv_ep, trb);
> +
> +		if (trb !=3D priv_req->trb)
> +			dev_warn(priv_dev->dev,
> +				 "request_trb=3D0x%p, queue_trb=3D0x%p\n",
> +				 priv_req->trb, trb);
> +
> +		request->actual =3D TRB_LEN(le32_to_cpu(trb->length));
> +		cdns3_move_deq_to_next_trb(priv_req);
> +		cdns3_gadget_giveback(priv_ep, priv_req, 0);
> +
> +		if (priv_ep->type !=3D USB_ENDPOINT_XFER_ISOC &&
> +		    TRBS_PER_SEGMENT =3D=3D 2)
> +			break;
> +	}
> +	priv_ep->flags &=3D ~EP_PENDING_REQUEST;
> +
> +prepare_next_td:
> +	cdns3_start_all_request(priv_dev, priv_ep);
> +}
> +
> +void cdns3_rearm_transfer(struct cdns3_endpoint *priv_ep, u8 rearm)
> +{
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +
> +	cdns3_wa1_restore_cycle_bit(priv_ep);
> +
> +	if (rearm) {
> +		trace_cdns3_ring(priv_ep);
> +
> +		/* Cycle Bit must be updated before arming DMA. */
> +		wmb();
> +		writel(EP_CMD_DRDY, &priv_dev->regs->ep_cmd);
> +
> +		__cdns3_gadget_wakeup(priv_dev);
> +
> +		trace_cdns3_doorbell_epx(priv_ep->name,
> +					 readl(&priv_dev->regs->ep_traddr));
> +	}
> +}
> +
> +/**
> + * cdns3_check_ep_interrupt_proceed - Processes interrupt related to end=
point
> + * @priv_ep: endpoint object
> + *
> + * Returns 0
> + */
> +static int cdns3_check_ep_interrupt_proceed(struct cdns3_endpoint *priv_=
ep)
> +{
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	u32 ep_sts_reg;
> +
> +	cdns3_select_ep(priv_dev, priv_ep->endpoint.address);
> +
> +	trace_cdns3_epx_irq(priv_dev, priv_ep);
> +
> +	ep_sts_reg =3D readl(&priv_dev->regs->ep_sts);
> +	writel(ep_sts_reg, &priv_dev->regs->ep_sts);
> +
> +	if (ep_sts_reg & EP_STS_TRBERR) {
> +		/*
> +		 * For isochronous transfer driver completes request on
> +		 * IOC or on TRBERR. IOC appears only when device receive
> +		 * OUT data packet. If host disable stream or lost some packet
> +		 * then the only way to finish all queued transfer is to do it
> +		 * on TRBERR event.
> +		 */
> +		if (priv_ep->type =3D=3D USB_ENDPOINT_XFER_ISOC &&
> +		    !priv_ep->wa1_set) {
> +			if (!priv_ep->dir) {
> +				u32 ep_cfg =3D readl(&priv_dev->regs->ep_cfg);
> +
> +				ep_cfg &=3D ~EP_CFG_ENABLE;
> +				writel(ep_cfg, &priv_dev->regs->ep_cfg);
> +				priv_ep->flags &=3D ~EP_QUIRK_ISO_OUT_EN;
> +			}
> +			cdns3_transfer_completed(priv_dev, priv_ep);
> +		} else {
> +			if (priv_ep->flags & EP_DEFERRED_DRDY) {
> +				priv_ep->flags &=3D ~EP_DEFERRED_DRDY;
> +				cdns3_start_all_request(priv_dev, priv_ep);
> +			} else {
> +				cdns3_rearm_transfer(priv_ep, priv_ep->wa1_set);
> +			}
> +		}
> +	}
> +
> +	if ((ep_sts_reg & EP_STS_IOC) || (ep_sts_reg & EP_STS_ISP))
> +		cdns3_transfer_completed(priv_dev, priv_ep);
> +
> +	return 0;
> +}
> +
> +static void cdns3_disconnect_gadget(struct cdns3_device *priv_dev)
> +{
> +	if (priv_dev->gadget_driver && priv_dev->gadget_driver->disconnect) {
> +		spin_unlock(&priv_dev->lock);
> +		priv_dev->gadget_driver->disconnect(&priv_dev->gadget);
> +		spin_lock(&priv_dev->lock);
> +	}
> +}
> +
> +/**
> + * cdns3_check_usb_interrupt_proceed - Processes interrupt related to de=
vice
> + * @priv_dev: extended gadget object
> + * @usb_ists: bitmap representation of device's reported interrupts
> + * (usb_ists register value)
> + */
> +static void cdns3_check_usb_interrupt_proceed(struct cdns3_device *priv_=
dev,
> +					      u32 usb_ists)
> +{
> +	int speed =3D 0;
> +
> +	trace_cdns3_usb_irq(priv_dev, usb_ists);
> +	if (usb_ists & USB_ISTS_L1ENTI) {
> +		/*
> +		 * WORKAROUND: CDNS3 controller has issue with hardware resuming
> +		 * from L1. To fix it, if any DMA transfer is pending driver
> +		 * must starts driving resume signal immediately.
> +		 */
> +		if (readl(&priv_dev->regs->drbl))
> +			__cdns3_gadget_wakeup(priv_dev);
> +	}
> +
> +	/* Connection detected */
> +	if (usb_ists & (USB_ISTS_CON2I | USB_ISTS_CONI)) {
> +		speed =3D cdns3_get_speed(priv_dev);
> +		priv_dev->gadget.speed =3D speed;
> +		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_POWERED);
> +		cdns3_ep0_config(priv_dev);
> +	}
> +
> +	/* Disconnection detected */
> +	if (usb_ists & (USB_ISTS_DIS2I | USB_ISTS_DISI)) {
> +		cdns3_disconnect_gadget(priv_dev);
> +		priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
> +		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
> +		cdns3_hw_reset_eps_config(priv_dev);
> +	}
> +
> +	if (usb_ists & (USB_ISTS_L2ENTI | USB_ISTS_U3ENTI)) {
> +		if (priv_dev->gadget_driver &&
> +		    priv_dev->gadget_driver->suspend) {
> +			spin_unlock(&priv_dev->lock);
> +			priv_dev->gadget_driver->suspend(&priv_dev->gadget);
> +			spin_lock(&priv_dev->lock);
> +		}
> +	}
> +
> +	if (usb_ists & (USB_ISTS_L2EXTI | USB_ISTS_U3EXTI)) {
> +		if (priv_dev->gadget_driver &&
> +		    priv_dev->gadget_driver->resume) {
> +			spin_unlock(&priv_dev->lock);
> +			priv_dev->gadget_driver->resume(&priv_dev->gadget);
> +			spin_lock(&priv_dev->lock);
> +		}
> +	}
> +
> +	/* reset*/
> +	if (usb_ists & (USB_ISTS_UWRESI | USB_ISTS_UHRESI | USB_ISTS_U2RESI)) {
> +		if (priv_dev->gadget_driver) {
> +			spin_unlock(&priv_dev->lock);
> +			usb_gadget_udc_reset(&priv_dev->gadget,
> +					     priv_dev->gadget_driver);
> +			spin_lock(&priv_dev->lock);
> +
> +			/*read again to check the actual speed*/
> +			speed =3D cdns3_get_speed(priv_dev);
> +			priv_dev->gadget.speed =3D speed;
> +			cdns3_hw_reset_eps_config(priv_dev);
> +			cdns3_ep0_config(priv_dev);
> +		}
> +	}
> +}
> +
> +/**
> + * cdns3_device_irq_handler- interrupt handler for device part of contro=
ller
> + *
> + * @irq: irq number for cdns3 core device
> + * @data: structure of cdns3
> + *
> + * Returns IRQ_HANDLED or IRQ_NONE
> + */
> +static irqreturn_t cdns3_device_irq_handler(int irq, void *data)
> +{
> +	struct cdns3_device *priv_dev;
> +	struct cdns3 *cdns =3D data;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	unsigned long flags;
> +	u32 reg;
> +
> +	priv_dev =3D cdns->gadget_dev;
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +
> +	/* check USB device interrupt */
> +	reg =3D readl(&priv_dev->regs->usb_ists);
> +
> +	if (reg) {
> +		writel(reg, &priv_dev->regs->usb_ists);
> +		cdns3_check_usb_interrupt_proceed(priv_dev, reg);
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	/* check endpoint interrupt */
> +	reg =3D readl(&priv_dev->regs->ep_ists);
> +
> +	if (reg) {
> +		priv_dev->shadow_ep_en |=3D reg;
> +		reg =3D ~reg & readl(&priv_dev->regs->ep_ien);
> +		/* mask deferred interrupt. */
> +		writel(reg, &priv_dev->regs->ep_ien);
> +		ret =3D IRQ_WAKE_THREAD;
> +	}
> +
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return ret;
> +}
> +
> +/**
> + * cdns3_device_thread_irq_handler- interrupt handler for device part
> + * of controller
> + *
> + * @irq: irq number for cdns3 core device
> + * @data: structure of cdns3
> + *
> + * Returns IRQ_HANDLED or IRQ_NONE
> + */
> +static irqreturn_t cdns3_device_thread_irq_handler(int irq, void *data)
> +{
> +	struct cdns3_device *priv_dev;
> +	struct cdns3 *cdns =3D data;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	unsigned long flags;
> +	u32 ep_ien;
> +	int bit;
> +	u32 reg;
> +
> +	priv_dev =3D cdns->gadget_dev;
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +
> +	reg =3D readl(&priv_dev->regs->ep_ists);
> +
> +	/* handle default endpoint OUT */
> +	if (reg & EP_ISTS_EP_OUT0) {
> +		cdns3_check_ep0_interrupt_proceed(priv_dev, USB_DIR_OUT);
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	/* handle default endpoint IN */
> +	if (reg & EP_ISTS_EP_IN0) {
> +		cdns3_check_ep0_interrupt_proceed(priv_dev, USB_DIR_IN);
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	/* check if interrupt from non default endpoint, if no exit */
> +	reg &=3D ~(EP_ISTS_EP_OUT0 | EP_ISTS_EP_IN0);
> +	if (!reg)
> +		goto irqend;
> +
> +	for_each_set_bit(bit, (unsigned long *)&reg,
> +			 sizeof(u32) * BITS_PER_BYTE) {
> +		priv_dev->shadow_ep_en |=3D BIT(bit);
> +		cdns3_check_ep_interrupt_proceed(priv_dev->eps[bit]);
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	if (priv_dev->run_garbage_collector) {
> +		struct cdns3_aligned_buf *buf, *tmp;
> +
> +		list_for_each_entry_safe(buf, tmp, &priv_dev->aligned_buf_list,
> +					 list) {
> +			if (!buf->in_use) {
> +				list_del(&buf->list);
> +
> +				spin_unlock_irqrestore(&priv_dev->lock, flags);
> +				dma_free_coherent(priv_dev->sysdev, buf->size,
> +						  buf->buf,
> +						  buf->dma);
> +				spin_lock_irqsave(&priv_dev->lock, flags);
> +
> +				kfree(buf);
> +			}
> +		}
> +
> +		priv_dev->run_garbage_collector =3D 0;
> +	}
> +
> +irqend:
> +	ep_ien =3D readl(&priv_dev->regs->ep_ien) | priv_dev->shadow_ep_en;
> +	priv_dev->shadow_ep_en =3D 0;
> +	/* Unmask all handled EP interrupts */
> +	writel(ep_ien, &priv_dev->regs->ep_ien);
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return ret;
> +}
> +
> +/**
> + * cdns3_ep_onchip_buffer_reserve - Try to reserve onchip buf for EP
> + *
> + * The real reservation will occur during write to EP_CFG register,
> + * this function is used to check if the 'size' reservation is allowed.
> + *
> + * @priv_dev: extended gadget object
> + * @size: the size (KB) for EP would like to allocate
> + * @is_in: endpoint direction
> + *
> + * Return 0 if the required size can met or negative value on failure
> + */
> +static int cdns3_ep_onchip_buffer_reserve(struct cdns3_device *priv_dev,
> +					  int size, int is_in)
> +{
> +	int remained;
> +
> +	/* 2KB are reserved for EP0*/
> +	remained =3D priv_dev->onchip_buffers - priv_dev->onchip_used_size - 2;
> +
> +	if (is_in) {
> +		if (remained < size)
> +			return -EPERM;
> +
> +		priv_dev->onchip_used_size +=3D size;
> +	} else {
> +		int required;
> +
> +		/**
> +		 *  ALL OUT EPs are shared the same chunk onchip memory, so
> +		 * driver checks if it already has assigned enough buffers
> +		 */
> +		if (priv_dev->out_mem_is_allocated >=3D size)
> +			return 0;
> +
> +		required =3D size - priv_dev->out_mem_is_allocated;
> +
> +		if (required > remained)
> +			return -EPERM;
> +
> +		priv_dev->out_mem_is_allocated +=3D required;
> +		priv_dev->onchip_used_size +=3D required;
> +	}
> +
> +	return 0;
> +}
> +
> +void cdns3_configure_dmult(struct cdns3_device *priv_dev,
> +			   struct cdns3_endpoint *priv_ep)
> +{
> +	struct cdns3_usb_regs __iomem *regs =3D priv_dev->regs;
> +
> +	/* For dev_ver > DEV_VER_V2 DMULT is configured per endpoint */
> +	if (priv_dev->dev_ver <=3D DEV_VER_V2)
> +		writel(USB_CONF_DMULT, &regs->usb_conf);
> +
> +	if (priv_dev->dev_ver =3D=3D DEV_VER_V2)
> +		writel(USB_CONF2_EN_TDL_TRB, &regs->usb_conf2);
> +
> +	if (priv_dev->dev_ver >=3D DEV_VER_V3 && priv_ep) {
> +		u32 mask;
> +
> +		if (priv_ep->dir)
> +			mask =3D BIT(priv_ep->num + 16);
> +		else
> +			mask =3D BIT(priv_ep->num);
> +
> +		if (priv_ep->type !=3D USB_ENDPOINT_XFER_ISOC) {
> +			cdns3_set_register_bit(&regs->tdl_from_trb, mask);
> +			cdns3_set_register_bit(&regs->tdl_beh, mask);
> +			cdns3_set_register_bit(&regs->tdl_beh2, mask);
> +			cdns3_set_register_bit(&regs->dma_adv_td, mask);
> +		}
> +
> +		if (priv_ep->type =3D=3D USB_ENDPOINT_XFER_ISOC && !priv_ep->dir)
> +			cdns3_set_register_bit(&regs->tdl_from_trb, mask);
> +
> +		cdns3_set_register_bit(&regs->dtrans, mask);
> +	}
> +}
> +
> +/**
> + * cdns3_ep_config Configure hardware endpoint
> + * @priv_ep: extended endpoint object
> + */
> +void cdns3_ep_config(struct cdns3_endpoint *priv_ep)
> +{
> +	bool is_iso_ep =3D (priv_ep->type =3D=3D USB_ENDPOINT_XFER_ISOC);
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	u32 bEndpointAddress =3D priv_ep->num | priv_ep->dir;
> +	u32 max_packet_size =3D 0;
> +	u8 maxburst =3D 0;
> +	u32 ep_cfg =3D 0;
> +	u8 buffering;
> +	u8 mult =3D 0;
> +	int ret;
> +
> +	buffering =3D CDNS3_EP_BUF_SIZE - 1;
> +
> +	cdns3_configure_dmult(priv_dev, priv_ep);
> +
> +	switch (priv_ep->type) {
> +	case USB_ENDPOINT_XFER_INT:
> +		ep_cfg =3D EP_CFG_EPTYPE(USB_ENDPOINT_XFER_INT);
> +
> +		if ((priv_dev->dev_ver =3D=3D DEV_VER_V2 && !priv_ep->dir) ||
> +		    priv_dev->dev_ver > DEV_VER_V2)
> +			ep_cfg |=3D EP_CFG_TDL_CHK;
> +		break;
> +	case USB_ENDPOINT_XFER_BULK:
> +		ep_cfg =3D EP_CFG_EPTYPE(USB_ENDPOINT_XFER_BULK);
> +
> +		if ((priv_dev->dev_ver =3D=3D DEV_VER_V2  && !priv_ep->dir) ||
> +		    priv_dev->dev_ver > DEV_VER_V2)
> +			ep_cfg |=3D EP_CFG_TDL_CHK;
> +		break;
> +	default:
> +		ep_cfg =3D EP_CFG_EPTYPE(USB_ENDPOINT_XFER_ISOC);
> +		mult =3D CDNS3_EP_ISO_HS_MULT - 1;
> +		buffering =3D mult + 1;
> +	}
> +
> +	switch (priv_dev->gadget.speed) {
> +	case USB_SPEED_FULL:
> +		max_packet_size =3D is_iso_ep ? 1023 : 64;
> +		break;
> +	case USB_SPEED_HIGH:
> +		max_packet_size =3D is_iso_ep ? 1024 : 512;
> +		break;
> +	case USB_SPEED_SUPER:
> +		/* It's limitation that driver assumes in driver. */
> +		mult =3D 0;
> +		max_packet_size =3D 1024;
> +		if (priv_ep->type =3D=3D USB_ENDPOINT_XFER_ISOC) {
> +			maxburst =3D CDNS3_EP_ISO_SS_BURST - 1;
> +			buffering =3D (mult + 1) *
> +				    (maxburst + 1);
> +
> +			if (priv_ep->interval > 1)
> +				buffering++;
> +		} else {
> +			maxburst =3D CDNS3_EP_BUF_SIZE - 1;
> +		}
> +		break;
> +	default:
> +		/* all other speed are not supported */
> +		return;
> +	}
> +
> +	if (max_packet_size =3D=3D 1024)
> +		priv_ep->trb_burst_size =3D 128;
> +	else if (max_packet_size >=3D 512)
> +		priv_ep->trb_burst_size =3D 64;
> +	else
> +		priv_ep->trb_burst_size =3D 16;
> +
> +	ret =3D cdns3_ep_onchip_buffer_reserve(priv_dev, buffering + 1,
> +					     !!priv_ep->dir);
> +	if (ret) {
> +		dev_err(priv_dev->dev, "onchip mem is full, ep is invalid\n");
> +		return;
> +	}
> +
> +	ep_cfg |=3D EP_CFG_MAXPKTSIZE(max_packet_size) |
> +		  EP_CFG_MULT(mult) |
> +		  EP_CFG_BUFFERING(buffering) |
> +		  EP_CFG_MAXBURST(maxburst);
> +
> +	cdns3_select_ep(priv_dev, bEndpointAddress);
> +	writel(ep_cfg, &priv_dev->regs->ep_cfg);
> +
> +	dev_dbg(priv_dev->dev, "Configure %s: with val %08x\n",
> +		priv_ep->name, ep_cfg);
> +}
> +
> +/* Find correct direction for HW endpoint according to description */
> +static int cdns3_ep_dir_is_correct(struct usb_endpoint_descriptor *desc,
> +				   struct cdns3_endpoint *priv_ep)
> +{
> +	return (priv_ep->endpoint.caps.dir_in && usb_endpoint_dir_in(desc)) ||
> +	       (priv_ep->endpoint.caps.dir_out && usb_endpoint_dir_out(desc));
> +}
> +
> +static struct
> +cdns3_endpoint *cdns3_find_available_ep(struct cdns3_device *priv_dev,
> +					struct usb_endpoint_descriptor *desc)
> +{
> +	struct usb_ep *ep;
> +	struct cdns3_endpoint *priv_ep;
> +
> +	list_for_each_entry(ep, &priv_dev->gadget.ep_list, ep_list) {
> +		unsigned long num;
> +		int ret;
> +		/* ep name pattern likes epXin or epXout */
> +		char c[2] =3D {ep->name[2], '\0'};
> +
> +		ret =3D kstrtoul(c, 10, &num);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		priv_ep =3D ep_to_cdns3_ep(ep);
> +		if (cdns3_ep_dir_is_correct(desc, priv_ep)) {
> +			if (!(priv_ep->flags & EP_CLAIMED)) {
> +				priv_ep->num  =3D num;
> +				return priv_ep;
> +			}
> +		}
> +	}
> +
> +	return ERR_PTR(-ENOENT);
> +}
> +
> +/*
> + *  Cadence IP has one limitation that all endpoints must be configured
> + * (Type & MaxPacketSize) before setting configuration through hardware
> + * register, it means we can't change endpoints configuration after
> + * set_configuration.
> + *
> + * This function set EP_CLAIMED flag which is added when the gadget driv=
er
> + * uses usb_ep_autoconfig to configure specific endpoint;
> + * When the udc driver receives set_configurion request,
> + * it goes through all claimed endpoints, and configure all endpoints
> + * accordingly.
> + *
> + * At usb_ep_ops.enable/disable, we only enable and disable endpoint thr=
ough
> + * ep_cfg register which can be changed after set_configuration, and do
> + * some software operation accordingly.
> + */
> +static struct
> +usb_ep *cdns3_gadget_match_ep(struct usb_gadget *gadget,
> +			      struct usb_endpoint_descriptor *desc,
> +			      struct usb_ss_ep_comp_descriptor *comp_desc)
> +{
> +	struct cdns3_device *priv_dev =3D gadget_to_cdns3_device(gadget);
> +	struct cdns3_endpoint *priv_ep;
> +	unsigned long flags;
> +
> +	priv_ep =3D cdns3_find_available_ep(priv_dev, desc);
> +	if (IS_ERR(priv_ep)) {
> +		dev_err(priv_dev->dev, "no available ep\n");
> +		return NULL;
> +	}
> +
> +	dev_dbg(priv_dev->dev, "match endpoint: %s\n", priv_ep->name);
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +	priv_ep->endpoint.desc =3D desc;
> +	priv_ep->dir  =3D usb_endpoint_dir_in(desc) ? USB_DIR_IN : USB_DIR_OUT;
> +	priv_ep->type =3D usb_endpoint_type(desc);
> +	priv_ep->flags |=3D EP_CLAIMED;
> +	priv_ep->interval =3D desc->bInterval ? BIT(desc->bInterval - 1) : 0;
> +
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return &priv_ep->endpoint;
> +}
> +
> +/**
> + * cdns3_gadget_ep_alloc_request Allocates request
> + * @ep: endpoint object associated with request
> + * @gfp_flags: gfp flags
> + *
> + * Returns allocated request address, NULL on allocation error
> + */
> +struct usb_request *cdns3_gadget_ep_alloc_request(struct usb_ep *ep,
> +						  gfp_t gfp_flags)
> +{
> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
> +	struct cdns3_request *priv_req;
> +
> +	priv_req =3D kzalloc(sizeof(*priv_req), gfp_flags);
> +	if (!priv_req)
> +		return NULL;
> +
> +	priv_req->priv_ep =3D priv_ep;
> +
> +	trace_cdns3_alloc_request(priv_req);
> +	return &priv_req->request;
> +}
> +
> +/**
> + * cdns3_gadget_ep_free_request Free memory occupied by request
> + * @ep: endpoint object associated with request
> + * @request: request to free memory
> + */
> +void cdns3_gadget_ep_free_request(struct usb_ep *ep,
> +				  struct usb_request *request)
> +{
> +	struct cdns3_request *priv_req =3D to_cdns3_request(request);
> +
> +	if (priv_req->aligned_buf)
> +		priv_req->aligned_buf->in_use =3D 0;
> +
> +	trace_cdns3_free_request(priv_req);
> +	kfree(priv_req);
> +}
> +
> +/**
> + * cdns3_gadget_ep_enable Enable endpoint
> + * @ep: endpoint object
> + * @desc: endpoint descriptor
> + *
> + * Returns 0 on success, error code elsewhere
> + */
> +static int cdns3_gadget_ep_enable(struct usb_ep *ep,
> +				  const struct usb_endpoint_descriptor *desc)
> +{
> +	struct cdns3_endpoint *priv_ep;
> +	struct cdns3_device *priv_dev;
> +	u32 reg =3D EP_STS_EN_TRBERREN;
> +	u32 bEndpointAddress;
> +	unsigned long flags;
> +	int enable =3D 1;
> +	int ret;
> +	int val;
> +
> +	priv_ep =3D ep_to_cdns3_ep(ep);
> +	priv_dev =3D priv_ep->cdns3_dev;
> +
> +	if (!ep || !desc || desc->bDescriptorType !=3D USB_DT_ENDPOINT) {
> +		dev_dbg(priv_dev->dev, "usbss: invalid parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!desc->wMaxPacketSize) {
> +		dev_err(priv_dev->dev, "usbss: missing wMaxPacketSize\n");
> +		return -EINVAL;
> +	}
> +
> +	if (dev_WARN_ONCE(priv_dev->dev, priv_ep->flags & EP_ENABLED,
> +			  "%s is already enabled\n", priv_ep->name))
> +		return 0;
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +
> +	priv_ep->endpoint.desc =3D desc;
> +	priv_ep->type =3D usb_endpoint_type(desc);
> +	priv_ep->interval =3D desc->bInterval ? BIT(desc->bInterval - 1) : 0;
> +
> +	if (priv_ep->interval > ISO_MAX_INTERVAL &&
> +	    priv_ep->type =3D=3D USB_ENDPOINT_XFER_ISOC) {
> +		dev_err(priv_dev->dev, "Driver is limited to %d period\n",
> +			ISO_MAX_INTERVAL);
> +
> +		ret =3D  -EINVAL;
> +		goto exit;
> +	}
> +
> +	ret =3D cdns3_allocate_trb_pool(priv_ep);
> +
> +	if (ret)
> +		goto exit;
> +
> +	bEndpointAddress =3D priv_ep->num | priv_ep->dir;
> +	cdns3_select_ep(priv_dev, bEndpointAddress);
> +
> +	trace_cdns3_gadget_ep_enable(priv_ep);
> +
> +	writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
> +
> +	ret =3D readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
> +					!(val & (EP_CMD_CSTALL | EP_CMD_EPRST)),
> +					1, 1000);
> +
> +	if (unlikely(ret)) {
> +		cdns3_free_trb_pool(priv_ep);
> +		ret =3D  -EINVAL;
> +		goto exit;
> +	}
> +
> +	/* enable interrupt for selected endpoint */
> +	cdns3_set_register_bit(&priv_dev->regs->ep_ien,
> +			       BIT(cdns3_ep_addr_to_index(bEndpointAddress)));
> +
> +	writel(reg, &priv_dev->regs->ep_sts_en);
> +
> +	/*
> +	 * For some versions of controller at some point during ISO OUT traffic
> +	 * DMA reads Transfer Ring for the EP which has never got doorbell.
> +	 * This issue was detected only on simulation, but to avoid this issue
> +	 * driver add protection against it. To fix it driver enable ISO OUT
> +	 * endpoint before setting DRBL. This special treatment of ISO OUT
> +	 * endpoints are recommended by controller specification.
> +	 */
> +	if (priv_ep->type =3D=3D USB_ENDPOINT_XFER_ISOC  && !priv_ep->dir)
> +		enable =3D 0;
> +
> +	if (enable)
> +		cdns3_set_register_bit(&priv_dev->regs->ep_cfg, EP_CFG_ENABLE);
> +
> +	ep->desc =3D desc;
> +	priv_ep->flags &=3D ~(EP_PENDING_REQUEST | EP_STALL |
> +			    EP_QUIRK_ISO_OUT_EN);
> +	priv_ep->flags |=3D EP_ENABLED | EP_UPDATE_EP_TRBADDR;
> +	priv_ep->wa1_set =3D 0;
> +	priv_ep->enqueue =3D 0;
> +	priv_ep->dequeue =3D 0;
> +	reg =3D readl(&priv_dev->regs->ep_sts);
> +	priv_ep->pcs =3D !!EP_STS_CCS(reg);
> +	priv_ep->ccs =3D !!EP_STS_CCS(reg);
> +	/* one TRB is reserved for link TRB used in DMULT mode*/
> +	priv_ep->free_trbs =3D priv_ep->num_trbs - 1;
> +exit:
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +
> +	return ret;
> +}
> +
> +/**
> + * cdns3_gadget_ep_disable Disable endpoint
> + * @ep: endpoint object
> + *
> + * Returns 0 on success, error code elsewhere
> + */
> +static int cdns3_gadget_ep_disable(struct usb_ep *ep)
> +{
> +	struct cdns3_endpoint *priv_ep;
> +	struct cdns3_device *priv_dev;
> +	struct usb_request *request;
> +	unsigned long flags;
> +	int ret =3D 0;
> +	u32 ep_cfg;
> +	int val;
> +
> +	if (!ep) {
> +		pr_err("usbss: invalid parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	priv_ep =3D ep_to_cdns3_ep(ep);
> +	priv_dev =3D priv_ep->cdns3_dev;
> +
> +	if (dev_WARN_ONCE(priv_dev->dev, !(priv_ep->flags & EP_ENABLED),
> +			  "%s is already disabled\n", priv_ep->name))
> +		return 0;
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +
> +	trace_cdns3_gadget_ep_disable(priv_ep);
> +
> +	cdns3_select_ep(priv_dev, ep->desc->bEndpointAddress);
> +
> +	ep_cfg =3D readl(&priv_dev->regs->ep_cfg);
> +	ep_cfg &=3D ~EP_CFG_ENABLE;
> +	writel(ep_cfg, &priv_dev->regs->ep_cfg);
> +
> +	/**
> +	 * Driver needs some time before resetting endpoint.
> +	 * It need waits for clearing DBUSY bit or for timeout expired.
> +	 * 10us is enough time for controller to stop transfer.
> +	 */
> +	readl_poll_timeout_atomic(&priv_dev->regs->ep_sts, val,
> +				  !(val & EP_STS_DBUSY), 1, 10);
> +	writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
> +
> +	readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
> +				  !(val & (EP_CMD_CSTALL | EP_CMD_EPRST)),
> +				  1, 1000);
> +	if (unlikely(ret))
> +		dev_err(priv_dev->dev, "Timeout: %s resetting failed.\n",
> +			priv_ep->name);
> +
> +	while (!list_empty(&priv_ep->pending_req_list)) {
> +		request =3D cdns3_next_request(&priv_ep->pending_req_list);
> +
> +		cdns3_gadget_giveback(priv_ep, to_cdns3_request(request),
> +				      -ESHUTDOWN);
> +	}
> +
> +	while (!list_empty(&priv_ep->deferred_req_list)) {
> +		request =3D cdns3_next_request(&priv_ep->deferred_req_list);
> +
> +		cdns3_gadget_giveback(priv_ep, to_cdns3_request(request),
> +				      -ESHUTDOWN);
> +	}
> +
> +	ep->desc =3D NULL;
> +	priv_ep->flags &=3D ~EP_ENABLED;
> +
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +
> +	return ret;
> +}
> +
> +/**
> + * cdns3_gadget_ep_queue Transfer data on endpoint
> + * @ep: endpoint object
> + * @request: request object
> + * @gfp_flags: gfp flags
> + *
> + * Returns 0 on success, error code elsewhere
> + */
> +static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
> +				   struct usb_request *request,
> +				   gfp_t gfp_flags)
> +{
> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	struct cdns3_request *priv_req;
> +	int ret =3D 0;
> +
> +	request->actual =3D 0;
> +	request->status =3D -EINPROGRESS;
> +	priv_req =3D to_cdns3_request(request);
> +	trace_cdns3_ep_queue(priv_req);
> +
> +	ret =3D cdns3_prepare_aligned_request_buf(priv_req);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D usb_gadget_map_request_by_dev(priv_dev->sysdev, request,
> +					    usb_endpoint_dir_in(ep->desc));
> +	if (ret)
> +		return ret;
> +
> +	list_add_tail(&request->list, &priv_ep->deferred_req_list);
> +
> +	/*
> +	 * If hardware endpoint configuration has not been set yet then
> +	 * just queue request in deferred list. Transfer will be started in
> +	 * cdns3_set_hw_configuration.
> +	 */
> +	if (priv_dev->hw_configured_flag)
> +		cdns3_start_all_request(priv_dev, priv_ep);
> +
> +	return 0;
> +}
> +
> +static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *=
request,
> +				 gfp_t gfp_flags)
> +{
> +	struct usb_request *zlp_request;
> +	struct cdns3_endpoint *priv_ep;
> +	struct cdns3_device *priv_dev;
> +	unsigned long flags;
> +	int ret;
> +
> +	if (!request || !ep)
> +		return -EINVAL;
> +
> +	priv_ep =3D ep_to_cdns3_ep(ep);
> +	priv_dev =3D priv_ep->cdns3_dev;
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +
> +	ret =3D __cdns3_gadget_ep_queue(ep, request, gfp_flags);
> +
> +	if (ret =3D=3D 0 && request->zero && request->length &&
> +	    (request->length % ep->maxpacket =3D=3D 0)) {
> +		struct cdns3_request *priv_req;
> +
> +		zlp_request =3D cdns3_gadget_ep_alloc_request(ep, GFP_ATOMIC);
> +		zlp_request->buf =3D priv_dev->zlp_buf;
> +		zlp_request->length =3D 0;
> +
> +		priv_req =3D to_cdns3_request(zlp_request);
> +		priv_req->flags |=3D REQUEST_ZLP;
> +
> +		dev_dbg(priv_dev->dev, "Queuing ZLP for endpoint: %s\n",
> +			priv_ep->name);
> +		ret =3D __cdns3_gadget_ep_queue(ep, zlp_request, gfp_flags);
> +	}
> +
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return ret;
> +}
> +
> +/**
> + * cdns3_gadget_ep_dequeue Remove request from transfer queue
> + * @ep: endpoint object associated with request
> + * @request: request object
> + *
> + * Returns 0 on success, error code elsewhere
> + */
> +int cdns3_gadget_ep_dequeue(struct usb_ep *ep,
> +			    struct usb_request *request)
> +{
> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	struct usb_request *req, *req_temp;
> +	struct cdns3_request *priv_req;
> +	struct cdns3_trb *link_trb;
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	if (!ep || !request || !ep->desc)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +
> +	priv_req =3D to_cdns3_request(request);
> +
> +	trace_cdns3_ep_dequeue(priv_req);
> +
> +	cdns3_select_ep(priv_dev, ep->desc->bEndpointAddress);
> +
> +	list_for_each_entry_safe(req, req_temp, &priv_ep->pending_req_list,
> +				 list) {
> +		if (request =3D=3D req)
> +			goto found;
> +	}
> +
> +	list_for_each_entry_safe(req, req_temp, &priv_ep->deferred_req_list,
> +				 list) {
> +		if (request =3D=3D req)
> +			goto found;
> +	}
> +
> +	goto not_found;
> +
> +found:
> +
> +	if (priv_ep->wa1_trb =3D=3D priv_req->trb)
> +		cdns3_wa1_restore_cycle_bit(priv_ep);
> +
> +	link_trb =3D priv_req->trb;
> +	cdns3_move_deq_to_next_trb(priv_req);
> +	cdns3_gadget_giveback(priv_ep, priv_req, -ECONNRESET);
> +
> +	/* Update ring */
> +	request =3D cdns3_next_request(&priv_ep->deferred_req_list);
> +	if (request) {
> +		priv_req =3D to_cdns3_request(request);
> +
> +		link_trb->buffer =3D TRB_BUFFER(priv_ep->trb_pool_dma +
> +					      (priv_req->start_trb * TRB_SIZE));
> +		link_trb->control =3D (link_trb->control & TRB_CYCLE) |
> +				    TRB_TYPE(TRB_LINK) | TRB_CHAIN | TRB_TOGGLE;
> +	} else {
> +		priv_ep->flags |=3D EP_UPDATE_EP_TRBADDR;
> +	}
> +
> +not_found:
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return ret;
> +}
> +
> +/**
> + * cdns3_gadget_ep_set_halt Sets/clears stall on selected endpoint
> + * @ep: endpoint object to set/clear stall on
> + * @value: 1 for set stall, 0 for clear stall
> + *
> + * Returns 0 on success, error code elsewhere
> + */
> +int cdns3_gadget_ep_set_halt(struct usb_ep *ep, int value)
> +{
> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> +	unsigned long flags;
> +	int ret =3D 0;
> +	int val;
> +
> +	if (!(priv_ep->flags & EP_ENABLED))
> +		return -EPERM;
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +
> +	cdns3_select_ep(priv_dev, ep->desc->bEndpointAddress);
> +	if (value) {
> +		cdns3_ep_stall_flush(priv_ep);
> +	} else {
> +		priv_ep->flags &=3D ~EP_WEDGE;
> +
> +		trace_cdns3_halt(priv_ep, value, 0);
> +
> +		writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
> +
> +		/* wait for EPRST cleared */
> +		readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
> +					  !(val & EP_CMD_EPRST), 1, 100);
> +		if (unlikely(ret)) {
> +			dev_err(priv_dev->dev,
> +				"Clearing halt condition failed for %s\n",
> +				priv_ep->name);
> +			goto finish;
> +		} else {
> +			priv_ep->flags &=3D ~EP_STALL;
> +		}
> +	}
> +
> +	priv_ep->flags &=3D ~EP_PENDING_REQUEST;
> +finish:
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +
> +	return ret;
> +}
> +
> +extern const struct usb_ep_ops cdns3_gadget_ep0_ops;
> +
> +static const struct usb_ep_ops cdns3_gadget_ep_ops =3D {
> +	.enable =3D cdns3_gadget_ep_enable,
> +	.disable =3D cdns3_gadget_ep_disable,
> +	.alloc_request =3D cdns3_gadget_ep_alloc_request,
> +	.free_request =3D cdns3_gadget_ep_free_request,
> +	.queue =3D cdns3_gadget_ep_queue,
> +	.dequeue =3D cdns3_gadget_ep_dequeue,
> +	.set_halt =3D cdns3_gadget_ep_set_halt,
> +	.set_wedge =3D cdns3_gadget_ep_set_wedge,
> +};
> +
> +/**
> + * cdns3_gadget_get_frame Returns number of actual ITP frame
> + * @gadget: gadget object
> + *
> + * Returns number of actual ITP frame
> + */
> +static int cdns3_gadget_get_frame(struct usb_gadget *gadget)
> +{
> +	struct cdns3_device *priv_dev =3D gadget_to_cdns3_device(gadget);
> +
> +	return readl(&priv_dev->regs->usb_itpn);
> +}
> +
> +int __cdns3_gadget_wakeup(struct cdns3_device *priv_dev)
> +{
> +	enum usb_device_speed speed;
> +
> +	speed =3D cdns3_get_speed(priv_dev);
> +
> +	if (speed >=3D USB_SPEED_SUPER)
> +		return 0;
> +
> +	/* Start driving resume signaling to indicate remote wakeup. */
> +	writel(USB_CONF_LGO_L0, &priv_dev->regs->usb_conf);
> +
> +	return 0;
> +}
> +
> +static int cdns3_gadget_wakeup(struct usb_gadget *gadget)
> +{
> +	struct cdns3_device *priv_dev =3D gadget_to_cdns3_device(gadget);
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +	ret =3D __cdns3_gadget_wakeup(priv_dev);
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return ret;
> +}
> +
> +static int cdns3_gadget_set_selfpowered(struct usb_gadget *gadget,
> +					int is_selfpowered)
> +{
> +	struct cdns3_device *priv_dev =3D gadget_to_cdns3_device(gadget);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +	priv_dev->is_selfpowered =3D !!is_selfpowered;
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return 0;
> +}
> +
> +static int cdns3_gadget_pullup(struct usb_gadget *gadget, int is_on)
> +{
> +	struct cdns3_device *priv_dev =3D gadget_to_cdns3_device(gadget);
> +
> +	if (is_on)
> +		writel(USB_CONF_DEVEN, &priv_dev->regs->usb_conf);
> +	else
> +		writel(USB_CONF_DEVDS, &priv_dev->regs->usb_conf);
> +
> +	return 0;
> +}
> +
> +static void cdns3_gadget_config(struct cdns3_device *priv_dev)
> +{
> +	struct cdns3_usb_regs __iomem *regs =3D priv_dev->regs;
> +	u32 reg;
> +
> +	cdns3_ep0_config(priv_dev);
> +
> +	/* enable interrupts for endpoint 0 (in and out) */
> +	writel(EP_IEN_EP_OUT0 | EP_IEN_EP_IN0, &regs->ep_ien);
> +
> +	/*
> +	 * Driver needs to modify LFPS minimal U1 Exit time for DEV_VER_TI_V1
> +	 * revision of controller.
> +	 */
> +	if (priv_dev->dev_ver =3D=3D DEV_VER_TI_V1) {
> +		reg =3D readl(&regs->dbg_link1);
> +
> +		reg &=3D ~DBG_LINK1_LFPS_MIN_GEN_U1_EXIT_MASK;
> +		reg |=3D DBG_LINK1_LFPS_MIN_GEN_U1_EXIT(0x55) |
> +		       DBG_LINK1_LFPS_MIN_GEN_U1_EXIT_SET;
> +		writel(reg, &regs->dbg_link1);
> +	}
> +
> +	/*
> +	 * By default some platforms has set protected access to memory.
> +	 * This cause problem with cache, so driver restore non-secure
> +	 * access to memory.
> +	 */
> +	reg =3D readl(&regs->dma_axi_ctrl);
> +	reg =3D DMA_AXI_CTRL_MARPROT(DMA_AXI_CTRL_NON_SECURE) |
> +	      DMA_AXI_CTRL_MAWPROT(DMA_AXI_CTRL_NON_SECURE);
> +	writel(reg, &regs->dma_axi_ctrl);
> +
> +	/* enable generic interrupt*/
> +	writel(USB_IEN_INIT, &regs->usb_ien);
> +	writel(USB_CONF_CLK2OFFDS | USB_CONF_L1DS, &regs->usb_conf);
> +
> +	cdns3_configure_dmult(priv_dev, NULL);
> +
> +	cdns3_gadget_pullup(&priv_dev->gadget, 1);
> +}
> +
> +/**
> + * cdns3_gadget_udc_start Gadget start
> + * @gadget: gadget object
> + * @driver: driver which operates on this gadget
> + *
> + * Returns 0 on success, error code elsewhere
> + */
> +static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
> +				  struct usb_gadget_driver *driver)
> +{
> +	struct cdns3_device *priv_dev =3D gadget_to_cdns3_device(gadget);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +	priv_dev->gadget_driver =3D driver;
> +	cdns3_gadget_config(priv_dev);
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return 0;
> +}
> +
> +/**
> + * cdns3_gadget_udc_stop Stops gadget
> + * @gadget: gadget object
> + *
> + * Returns 0
> + */
> +static int cdns3_gadget_udc_stop(struct usb_gadget *gadget)
> +{
> +	struct cdns3_device *priv_dev =3D gadget_to_cdns3_device(gadget);
> +	struct cdns3_endpoint *priv_ep;
> +	u32 bEndpointAddress;
> +	struct usb_ep *ep;
> +	int ret =3D 0;
> +	int val;
> +
> +	priv_dev->gadget_driver =3D NULL;
> +
> +	priv_dev->onchip_used_size =3D 0;
> +	priv_dev->out_mem_is_allocated =3D 0;
> +	priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
> +
> +	list_for_each_entry(ep, &priv_dev->gadget.ep_list, ep_list) {
> +		priv_ep =3D ep_to_cdns3_ep(ep);
> +		bEndpointAddress =3D priv_ep->num | priv_ep->dir;
> +		cdns3_select_ep(priv_dev, bEndpointAddress);
> +		writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
> +		readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
> +					  !(val & EP_CMD_EPRST), 1, 100);
> +	}
> +
> +	/* disable interrupt for device */
> +	writel(0, &priv_dev->regs->usb_ien);
> +	writel(USB_CONF_DEVDS, &priv_dev->regs->usb_conf);
> +
> +	return ret;
> +}
> +
> +static const struct usb_gadget_ops cdns3_gadget_ops =3D {
> +	.get_frame =3D cdns3_gadget_get_frame,
> +	.wakeup =3D cdns3_gadget_wakeup,
> +	.set_selfpowered =3D cdns3_gadget_set_selfpowered,
> +	.pullup =3D cdns3_gadget_pullup,
> +	.udc_start =3D cdns3_gadget_udc_start,
> +	.udc_stop =3D cdns3_gadget_udc_stop,
> +	.match_ep =3D cdns3_gadget_match_ep,
> +};
> +
> +static void cdns3_free_all_eps(struct cdns3_device *priv_dev)
> +{
> +	int i;
> +
> +	/* ep0 OUT point to ep0 IN. */
> +	priv_dev->eps[16] =3D NULL;
> +
> +	for (i =3D 0; i < CDNS3_ENDPOINTS_MAX_COUNT; i++)
> +		if (priv_dev->eps[i]) {
> +			cdns3_free_trb_pool(priv_dev->eps[i]);
> +			devm_kfree(priv_dev->dev, priv_dev->eps[i]);
> +		}
> +}
> +
> +/**
> + * cdns3_init_eps Initializes software endpoints of gadget
> + * @cdns3: extended gadget object
> + *
> + * Returns 0 on success, error code elsewhere
> + */
> +static int cdns3_init_eps(struct cdns3_device *priv_dev)
> +{
> +	u32 ep_enabled_reg, iso_ep_reg;
> +	struct cdns3_endpoint *priv_ep;
> +	int ep_dir, ep_number;
> +	u32 ep_mask;
> +	int ret =3D 0;
> +	int i;
> +
> +	/* Read it from USB_CAP3 to USB_CAP5 */
> +	ep_enabled_reg =3D readl(&priv_dev->regs->usb_cap3);
> +	iso_ep_reg =3D readl(&priv_dev->regs->usb_cap4);
> +
> +	dev_dbg(priv_dev->dev, "Initializing non-zero endpoints\n");
> +
> +	for (i =3D 0; i < CDNS3_ENDPOINTS_MAX_COUNT; i++) {
> +		ep_dir =3D i >> 4;	/* i div 16 */
> +		ep_number =3D i & 0xF;	/* i % 16 */
> +		ep_mask =3D BIT(i);
> +
> +		if (!(ep_enabled_reg & ep_mask))
> +			continue;
> +
> +		if (ep_dir && !ep_number) {
> +			priv_dev->eps[i] =3D priv_dev->eps[0];
> +			continue;
> +		}
> +
> +		priv_ep =3D devm_kzalloc(priv_dev->dev, sizeof(*priv_ep),
> +				       GFP_KERNEL);
> +		if (!priv_ep) {
> +			ret =3D -ENOMEM;
> +			goto err;
> +		}
> +
> +		/* set parent of endpoint object */
> +		priv_ep->cdns3_dev =3D priv_dev;
> +		priv_dev->eps[i] =3D priv_ep;
> +		priv_ep->num =3D ep_number;
> +		priv_ep->dir =3D ep_dir ? USB_DIR_IN : USB_DIR_OUT;
> +
> +		if (!ep_number) {
> +			ret =3D cdns3_init_ep0(priv_dev, priv_ep);
> +			if (ret) {
> +				dev_err(priv_dev->dev, "Failed to init ep0\n");
> +				goto err;
> +			}
> +		} else {
> +			snprintf(priv_ep->name, sizeof(priv_ep->name), "ep%d%s",
> +				 ep_number, !!ep_dir ? "in" : "out");
> +			priv_ep->endpoint.name =3D priv_ep->name;
> +
> +			usb_ep_set_maxpacket_limit(&priv_ep->endpoint,
> +						   CDNS3_EP_MAX_PACKET_LIMIT);
> +			priv_ep->endpoint.max_streams =3D CDNS3_EP_MAX_STREAMS;
> +			priv_ep->endpoint.ops =3D &cdns3_gadget_ep_ops;
> +			if (ep_dir)
> +				priv_ep->endpoint.caps.dir_in =3D 1;
> +			else
> +				priv_ep->endpoint.caps.dir_out =3D 1;
> +
> +			if (iso_ep_reg & ep_mask)
> +				priv_ep->endpoint.caps.type_iso =3D 1;
> +
> +			priv_ep->endpoint.caps.type_bulk =3D 1;
> +			priv_ep->endpoint.caps.type_int =3D 1;
> +
> +			list_add_tail(&priv_ep->endpoint.ep_list,
> +				      &priv_dev->gadget.ep_list);
> +		}
> +
> +		priv_ep->flags =3D 0;
> +
> +		dev_info(priv_dev->dev, "Initialized  %s support: %s %s\n",
> +			 priv_ep->name,
> +			 priv_ep->endpoint.caps.type_bulk ? "BULK, INT" : "",
> +			 priv_ep->endpoint.caps.type_iso ? "ISO" : "");
> +
> +		INIT_LIST_HEAD(&priv_ep->pending_req_list);
> +		INIT_LIST_HEAD(&priv_ep->deferred_req_list);
> +	}
> +
> +	return 0;
> +err:
> +	cdns3_free_all_eps(priv_dev);
> +	return -ENOMEM;
> +}
> +
> +void cdns3_gadget_exit(struct cdns3 *cdns)
> +{
> +	struct cdns3_device *priv_dev;
> +
> +	priv_dev =3D cdns->gadget_dev;
> +
> +	devm_free_irq(cdns->dev, cdns->dev_irq, cdns);
> +
> +	pm_runtime_mark_last_busy(cdns->dev);
> +	pm_runtime_put_autosuspend(cdns->dev);
> +
> +	usb_del_gadget_udc(&priv_dev->gadget);
> +
> +	cdns3_free_all_eps(priv_dev);
> +
> +	while (!list_empty(&priv_dev->aligned_buf_list)) {
> +		struct cdns3_aligned_buf *buf;
> +
> +		buf =3D cdns3_next_align_buf(&priv_dev->aligned_buf_list);
> +		dma_free_coherent(priv_dev->sysdev, buf->size,
> +				  buf->buf,
> +				  buf->dma);
> +
> +		list_del(&buf->list);
> +		kfree(buf);
> +	}
> +
> +	dma_free_coherent(priv_dev->sysdev, 8, priv_dev->setup_buf,
> +			  priv_dev->setup_dma);
> +
> +	kfree(priv_dev->zlp_buf);
> +	kfree(priv_dev);
> +	cdns->gadget_dev =3D NULL;
> +}
> +
> +static int cdns3_gadget_start(struct cdns3 *cdns)
> +{
> +	struct cdns3_device *priv_dev;
> +	u32 max_speed;
> +	int ret;
> +
> +	priv_dev =3D kzalloc(sizeof(*priv_dev), GFP_KERNEL);
> +	if (!priv_dev)
> +		return -ENOMEM;
> +
> +	cdns->gadget_dev =3D priv_dev;
> +	priv_dev->sysdev =3D cdns->dev;
> +	priv_dev->dev =3D cdns->dev;
> +	priv_dev->regs =3D cdns->dev_regs;
> +
> +	device_property_read_u16(priv_dev->dev, "cdns,on-chip-buff-size",
> +				 &priv_dev->onchip_buffers);
> +
> +	if (priv_dev->onchip_buffers <=3D  0) {
> +		u32 reg =3D readl(&priv_dev->regs->usb_cap2);
> +
> +		priv_dev->onchip_buffers =3D USB_CAP2_ACTUAL_MEM_SIZE(reg);
> +	}
> +
> +	if (!priv_dev->onchip_buffers)
> +		priv_dev->onchip_buffers =3D 256;
> +
> +	max_speed =3D usb_get_maximum_speed(cdns->dev);
> +
> +	/* Check the maximum_speed parameter */
> +	switch (max_speed) {
> +	case USB_SPEED_FULL:
> +	case USB_SPEED_HIGH:
> +	case USB_SPEED_SUPER:
> +		break;
> +	default:
> +		dev_err(cdns->dev, "invalid maximum_speed parameter %d\n",
> +			max_speed);
> +		/* fall through */
> +	case USB_SPEED_UNKNOWN:
> +		/* default to superspeed */
> +		max_speed =3D USB_SPEED_SUPER;
> +		break;
> +	}
> +
> +	/* fill gadget fields */
> +	priv_dev->gadget.max_speed =3D max_speed;
> +	priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
> +	priv_dev->gadget.ops =3D &cdns3_gadget_ops;
> +	priv_dev->gadget.name =3D "usb-ss-gadget";
> +	priv_dev->gadget.sg_supported =3D 1;
> +
> +	spin_lock_init(&priv_dev->lock);
> +	INIT_WORK(&priv_dev->pending_status_wq,
> +		  cdns3_pending_setup_status_handler);
> +
> +	/* initialize endpoint container */
> +	INIT_LIST_HEAD(&priv_dev->gadget.ep_list);
> +	INIT_LIST_HEAD(&priv_dev->aligned_buf_list);
> +
> +	ret =3D cdns3_init_eps(priv_dev);
> +	if (ret) {
> +		dev_err(priv_dev->dev, "Failed to create endpoints\n");
> +		goto err1;
> +	}
> +
> +	/* allocate memory for setup packet buffer */
> +	priv_dev->setup_buf =3D dma_alloc_coherent(priv_dev->sysdev, 8,
> +						 &priv_dev->setup_dma, GFP_DMA);
> +	if (!priv_dev->setup_buf) {
> +		ret =3D -ENOMEM;
> +		goto err2;
> +	}
> +
> +	priv_dev->dev_ver =3D readl(&priv_dev->regs->usb_cap6);
> +
> +	dev_dbg(priv_dev->dev, "Device Controller version: %08x\n",
> +		readl(&priv_dev->regs->usb_cap6));
> +	dev_dbg(priv_dev->dev, "USB Capabilities:: %08x\n",
> +		readl(&priv_dev->regs->usb_cap1));
> +	dev_dbg(priv_dev->dev, "On-Chip memory cnfiguration: %08x\n",
> +		readl(&priv_dev->regs->usb_cap2));
> +
> +	priv_dev->dev_ver =3D GET_DEV_BASE_VERSION(priv_dev->dev_ver);
> +
> +	priv_dev->zlp_buf =3D kzalloc(CDNS3_EP_ZLP_BUF_SIZE, GFP_KERNEL);
> +	if (!priv_dev->zlp_buf) {
> +		ret =3D -ENOMEM;
> +		goto err3;
> +	}
> +
> +	/* add USB gadget device */
> +	ret =3D usb_add_gadget_udc(priv_dev->dev, &priv_dev->gadget);
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
> +	cdns->gadget_dev =3D NULL;
> +	return ret;
> +}
> +
> +static int __cdns3_gadget_init(struct cdns3 *cdns)
> +{
> +	struct cdns3_device *priv_dev;
> +	int ret =3D 0;
> +
> +	pm_runtime_get_sync(cdns->dev);
> +
> +	ret =3D cdns3_gadget_start(cdns);
> +	if (ret)
> +		return ret;
> +
> +	priv_dev =3D cdns->gadget_dev;
> +	ret =3D devm_request_threaded_irq(cdns->dev, cdns->dev_irq,
> +					cdns3_device_irq_handler,
> +					cdns3_device_thread_irq_handler,
> +					IRQF_SHARED, dev_name(cdns->dev), cdns);
> +
> +	if (ret)
> +		goto err0;
> +
> +	return 0;
> +err0:
> +	cdns3_gadget_exit(cdns);
> +	return ret;
> +}
> +
> +static int cdns3_gadget_suspend(struct cdns3 *cdns, bool do_wakeup)
> +{
> +	struct cdns3_device *priv_dev =3D cdns->gadget_dev;
> +
> +	cdns3_disconnect_gadget(priv_dev);
> +
> +	priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
> +	usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
> +	cdns3_hw_reset_eps_config(priv_dev);
> +
> +	/* disable interrupt for device */
> +	writel(0, &priv_dev->regs->usb_ien);
> +
> +	cdns3_gadget_pullup(&priv_dev->gadget, 0);
> +
> +	return 0;
> +}
> +
> +static int cdns3_gadget_resume(struct cdns3 *cdns, bool hibernated)
> +{
> +	struct cdns3_device *priv_dev =3D cdns->gadget_dev;
> +
> +	if (!priv_dev->gadget_driver)
> +		return 0;
> +
> +	cdns3_gadget_config(priv_dev);
> +
> +	return 0;
> +}
> +
> +/**
> + * cdns3_gadget_init - initialize device structure
> + *
> + * cdns: cdns3 instance
> + *
> + * This function initializes the gadget.
> + */
> +int cdns3_gadget_init(struct cdns3 *cdns)
> +{
> +	struct cdns3_role_driver *rdrv;
> +
> +	rdrv =3D devm_kzalloc(cdns->dev, sizeof(*rdrv), GFP_KERNEL);
> +	if (!rdrv)
> +		return -ENOMEM;
> +
> +	rdrv->start	=3D __cdns3_gadget_init;
> +	rdrv->stop	=3D cdns3_gadget_exit;
> +	rdrv->suspend	=3D cdns3_gadget_suspend;
> +	rdrv->resume	=3D cdns3_gadget_resume;
> +	rdrv->state	=3D CDNS3_ROLE_STATE_INACTIVE;
> +	rdrv->name	=3D "gadget";
> +	cdns->roles[USB_ROLE_DEVICE] =3D rdrv;
> +
> +	return 0;
> +}
> diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
> new file mode 100644
> index 000000000000..2a97c16aea4b
> --- /dev/null
> +++ b/drivers/usb/cdns3/gadget.h
> @@ -0,0 +1,1321 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * USBSS device controller driver header file
> + *
> + * Copyright (C) 2018-2019 Cadence.
> + * Copyright (C) 2017-2018 NXP
> + *
> + * Author: Pawel Laszczak <pawell@cadence.com>
> + *         Pawel Jez <pjez@cadence.com>
> + *         Peter Chen <peter.chen@nxp.com>
> + */
> +#ifndef __LINUX_CDNS3_GADGET
> +#define __LINUX_CDNS3_GADGET
> +#include <linux/usb/gadget.h>
> +
> +/*
> + * USBSS-DEV register interface.
> + * This corresponds to the USBSS Device Controller Interface
> + */
> +
> +/**
> + * struct cdns3_usb_regs - device controller registers.
> + * @usb_conf:      Global Configuration Register.
> + * @usb_sts:       Global Status Register.
> + * @usb_cmd:       Global Command Register.
> + * @usb_itpn:      ITP/SOF number Register.
> + * @usb_lpm:       Global Command Register.
> + * @usb_ien:       USB Interrupt Enable Register.
> + * @usb_ists:      USB Interrupt Status Register.
> + * @ep_sel:        Endpoint Select Register.
> + * @ep_traddr:     Endpoint Transfer Ring Address Register.
> + * @ep_cfg:        Endpoint Configuration Register.
> + * @ep_cmd:        Endpoint Command Register.
> + * @ep_sts:        Endpoint Status Register.
> + * @ep_sts_sid:    Endpoint Status Register.
> + * @ep_sts_en:     Endpoint Status Register Enable.
> + * @drbl:          Doorbell Register.
> + * @ep_ien:        EP Interrupt Enable Register.
> + * @ep_ists:       EP Interrupt Status Register.
> + * @usb_pwr:       Global Power Configuration Register.
> + * @usb_conf2:     Global Configuration Register 2.
> + * @usb_cap1:      Capability Register 1.
> + * @usb_cap2:      Capability Register 2.
> + * @usb_cap3:      Capability Register 3.
> + * @usb_cap4:      Capability Register 4.
> + * @usb_cap5:      Capability Register 5.
> + * @usb_cap6:      Capability Register 6.
> + * @usb_cpkt1:     Custom Packet Register 1.
> + * @usb_cpkt2:     Custom Packet Register 2.
> + * @usb_cpkt3:     Custom Packet Register 3.
> + * @ep_dma_ext_addr: Upper address for DMA operations Register.
> + * @buf_addr:      Address for On-chip Buffer operations Register.
> + * @buf_data:      Data for On-chip Buffer operations Register.
> + * @buf_ctrl:      On-chip Buffer Access Control Registe.
> + * @dtrans:        DMA Transfer Mode Register.
> + * @tdl_from_trb:  Source of TD Configuration Register.
> + * @tdl_beh:       TDL Behavior Configuration Register.
> + * @ep_tdl:        Endpoint TDL Register.
> + * @tdl_beh2:      TDL Behavior 2 Configuration Register.
> + * @dma_adv_td:    DMA Advance TD Configuration Register.
> + * @reserved1:     Reserved.
> + * @cfg_regs:      Configuration registers.
> + * @reserved2:     Reserved.
> + * @dma_axi_ctrl:  AXI Control register.
> + * @dma_axi_id:    AXI ID register.
> + * @dma_axi_cap:   AXI Capability register.
> + * @dma_axi_ctrl0: AXI Control 0 register.
> + * @dma_axi_ctrl1: AXI Control 1 register.
> + */
> +struct cdns3_usb_regs {
> +	__le32 usb_conf;
> +	__le32 usb_sts;
> +	__le32 usb_cmd;
> +	__le32 usb_itpn;
> +	__le32 usb_lpm;
> +	__le32 usb_ien;
> +	__le32 usb_ists;
> +	__le32 ep_sel;
> +	__le32 ep_traddr;
> +	__le32 ep_cfg;
> +	__le32 ep_cmd;
> +	__le32 ep_sts;
> +	__le32 ep_sts_sid;
> +	__le32 ep_sts_en;
> +	__le32 drbl;
> +	__le32 ep_ien;
> +	__le32 ep_ists;
> +	__le32 usb_pwr;
> +	__le32 usb_conf2;
> +	__le32 usb_cap1;
> +	__le32 usb_cap2;
> +	__le32 usb_cap3;
> +	__le32 usb_cap4;
> +	__le32 usb_cap5;
> +	__le32 usb_cap6;
> +	__le32 usb_cpkt1;
> +	__le32 usb_cpkt2;
> +	__le32 usb_cpkt3;
> +	__le32 ep_dma_ext_addr;
> +	__le32 buf_addr;
> +	__le32 buf_data;
> +	__le32 buf_ctrl;
> +	__le32 dtrans;
> +	__le32 tdl_from_trb;
> +	__le32 tdl_beh;
> +	__le32 ep_tdl;
> +	__le32 tdl_beh2;
> +	__le32 dma_adv_td;
> +	__le32 reserved1[26];
> +	__le32 cfg_reg1;
> +	__le32 dbg_link1;
> +	__le32 dbg_link2;
> +	__le32 cfg_regs[74];
> +	__le32 reserved2[34];
> +	__le32 dma_axi_ctrl;
> +	__le32 dma_axi_id;
> +	__le32 dma_axi_cap;
> +	__le32 dma_axi_ctrl0;
> +	__le32 dma_axi_ctrl1;
> +};
> +
> +/* USB_CONF - bitmasks */
> +/* Reset USB device configuration. */
> +#define USB_CONF_CFGRST		BIT(0)
> +/* Set Configuration. */
> +#define USB_CONF_CFGSET		BIT(1)
> +/* Disconnect USB device in SuperSpeed. */
> +#define USB_CONF_USB3DIS	BIT(3)
> +/* Disconnect USB device in HS/FS */
> +#define USB_CONF_USB2DIS	BIT(4)
> +/* Little Endian access - default */
> +#define USB_CONF_LENDIAN	BIT(5)
> +/*
> + * Big Endian access. Driver assume that byte order for
> + * SFRs access always is as Little Endian so this bit
> + * is not used.
> + */
> +#define USB_CONF_BENDIAN	BIT(6)
> +/* Device software reset. */
> +#define USB_CONF_SWRST		BIT(7)
> +/* Singular DMA transfer mode. Only for VER < DEV_VER_V3*/
> +#define USB_CONF_DSING		BIT(8)
> +/* Multiple DMA transfers mode. Only for VER < DEV_VER_V3 */
> +#define USB_CONF_DMULT		BIT(9)
> +/* DMA clock turn-off enable. */
> +#define USB_CONF_DMAOFFEN	BIT(10)
> +/* DMA clock turn-off disable. */
> +#define USB_CONF_DMAOFFDS	BIT(11)
> +/* Clear Force Full Speed. */
> +#define USB_CONF_CFORCE_FS	BIT(12)
> +/* Set Force Full Speed. */
> +#define USB_CONF_SFORCE_FS	BIT(13)
> +/* Device enable. */
> +#define USB_CONF_DEVEN		BIT(14)
> +/* Device disable. */
> +#define USB_CONF_DEVDS		BIT(15)
> +/* L1 LPM state entry enable (used in HS/FS mode). */
> +#define USB_CONF_L1EN		BIT(16)
> +/* L1 LPM state entry disable (used in HS/FS mode). */
> +#define USB_CONF_L1DS		BIT(17)
> +/* USB 2.0 clock gate disable. */
> +#define USB_CONF_CLK2OFFEN	BIT(18)
> +/* USB 2.0 clock gate enable. */
> +#define USB_CONF_CLK2OFFDS	BIT(19)
> +/* L0 LPM state entry request (used in HS/FS mode). */
> +#define USB_CONF_LGO_L0		BIT(20)
> +/* USB 3.0 clock gate disable. */
> +#define USB_CONF_CLK3OFFEN	BIT(21)
> +/* USB 3.0 clock gate enable. */
> +#define USB_CONF_CLK3OFFDS	BIT(22)
> +/* Bit 23 is reserved*/
> +/* U1 state entry enable (used in SS mode). */
> +#define USB_CONF_U1EN		BIT(24)
> +/* U1 state entry disable (used in SS mode). */
> +#define USB_CONF_U1DS		BIT(25)
> +/* U2 state entry enable (used in SS mode). */
> +#define USB_CONF_U2EN		BIT(26)
> +/* U2 state entry disable (used in SS mode). */
> +#define USB_CONF_U2DS		BIT(27)
> +/* U0 state entry request (used in SS mode). */
> +#define USB_CONF_LGO_U0		BIT(28)
> +/* U1 state entry request (used in SS mode). */
> +#define USB_CONF_LGO_U1		BIT(29)
> +/* U2 state entry request (used in SS mode). */
> +#define USB_CONF_LGO_U2		BIT(30)
> +/* SS.Inactive state entry request (used in SS mode) */
> +#define USB_CONF_LGO_SSINACT	BIT(31)
> +
> +/* USB_STS - bitmasks */
> +/*
> + * Configuration status.
> + * 1 - device is in the configured state.
> + * 0 - device is not configured.
> + */
> +#define USB_STS_CFGSTS_MASK	BIT(0)
> +#define USB_STS_CFGSTS(p)	((p) & USB_STS_CFGSTS_MASK)
> +/*
> + * On-chip memory overflow.
> + * 0 - On-chip memory status OK.
> + * 1 - On-chip memory overflow.
> + */
> +#define USB_STS_OV_MASK		BIT(1)
> +#define USB_STS_OV(p)		((p) & USB_STS_OV_MASK)
> +/*
> + * SuperSpeed connection status.
> + * 0 - USB in SuperSpeed mode disconnected.
> + * 1 - USB in SuperSpeed mode connected.
> + */
> +#define USB_STS_USB3CONS_MASK	BIT(2)
> +#define USB_STS_USB3CONS(p)	((p) & USB_STS_USB3CONS_MASK)
> +/*
> + * DMA transfer configuration status.
> + * 0 - single request.
> + * 1 - multiple TRB chain
> + * Supported only for controller version <  DEV_VER_V3
> + */
> +#define USB_STS_DTRANS_MASK	BIT(3)
> +#define USB_STS_DTRANS(p)	((p) & USB_STS_DTRANS_MASK)
> +/*
> + * Device speed.
> + * 0 - Undefined (value after reset).
> + * 1 - Low speed
> + * 2 - Full speed
> + * 3 - High speed
> + * 4 - Super speed
> + */
> +#define USB_STS_USBSPEED_MASK	GENMASK(6, 4)
> +#define USB_STS_USBSPEED(p)	(((p) & USB_STS_USBSPEED_MASK) >> 4)
> +#define USB_STS_LS		(0x1 << 4)
> +#define USB_STS_FS		(0x2 << 4)
> +#define USB_STS_HS		(0x3 << 4)
> +#define USB_STS_SS		(0x4 << 4)
> +#define DEV_UNDEFSPEED(p)	(((p) & USB_STS_USBSPEED_MASK) =3D=3D (0x0 << =
4))
> +#define DEV_LOWSPEED(p)		(((p) & USB_STS_USBSPEED_MASK) =3D=3D USB_STS_L=
S)
> +#define DEV_FULLSPEED(p)	(((p) & USB_STS_USBSPEED_MASK) =3D=3D USB_STS_F=
S)
> +#define DEV_HIGHSPEED(p)	(((p) & USB_STS_USBSPEED_MASK) =3D=3D USB_STS_H=
S)
> +#define DEV_SUPERSPEED(p)	(((p) & USB_STS_USBSPEED_MASK) =3D=3D USB_STS_=
SS)
> +/*
> + * Endianness for SFR access.
> + * 0 - Little Endian order (default after hardware reset).
> + * 1 - Big Endian order
> + */
> +#define USB_STS_ENDIAN_MASK	BIT(7)
> +#define USB_STS_ENDIAN(p)	((p) & USB_STS_ENDIAN_MASK)
> +/*
> + * HS/FS clock turn-off status.
> + * 0 - hsfs clock is always on.
> + * 1 - hsfs clock turn-off in L2 (HS/FS mode) is enabled
> + *          (default after hardware reset).
> + */
> +#define USB_STS_CLK2OFF_MASK	BIT(8)
> +#define USB_STS_CLK2OFF(p)	((p) & USB_STS_CLK2OFF_MASK)
> +/*
> + * PCLK clock turn-off status.
> + * 0 - pclk clock is always on.
> + * 1 - pclk clock turn-off in U3 (SS mode) is enabled
> + *          (default after hardware reset).
> + */
> +#define USB_STS_CLK3OFF_MASK	BIT(9)
> +#define USB_STS_CLK3OFF(p)	((p) & USB_STS_CLK3OFF_MASK)
> +/*
> + * Controller in reset state.
> + * 0 - Internal reset is active.
> + * 1 - Internal reset is not active and controller is fully operational.
> + */
> +#define USB_STS_IN_RST_MASK	BIT(10)
> +#define USB_STS_IN_RST(p)	((p) & USB_STS_IN_RST_MASK)
> +/*
> + * Status of the "TDL calculation basing on TRB" feature.
> + * 0 - disabled
> + * 1 - enabled
> + * Supported only for DEV_VER_V2 controller version.
> + */
> +#define USB_STS_TDL_TRB_ENABLED	BIT(11)
> +/*
> + * Device enable Status.
> + * 0 - USB device is disabled (VBUS input is disconnected from internal =
logic).
> + * 1 - USB device is enabled (VBUS input is connected to the internal lo=
gic).
> + */
> +#define USB_STS_DEVS_MASK	BIT(14)
> +#define USB_STS_DEVS(p)		((p) & USB_STS_DEVS_MASK)
> +/*
> + * Address status.
> + * 0 - USB device is default state.
> + * 1 - USB device is at least in address state.
> + */
> +#define USB_STS_ADDRESSED_MASK	BIT(15)
> +#define USB_STS_ADDRESSED(p)	((p) & USB_STS_ADDRESSED_MASK)
> +/*
> + * L1 LPM state enable status (used in HS/FS mode).
> + * 0 - Entering to L1 LPM state disabled.
> + * 1 - Entering to L1 LPM state enabled.
> + */
> +#define USB_STS_L1ENS_MASK	BIT(16)
> +#define USB_STS_L1ENS(p)	((p) & USB_STS_L1ENS_MASK)
> +/*
> + * Internal VBUS connection status (used both in HS/FS  and SS mode).
> + * 0 - internal VBUS is not detected.
> + * 1 - internal VBUS is detected.
> + */
> +#define USB_STS_VBUSS_MASK	BIT(17)
> +#define USB_STS_VBUSS(p)	((p) & USB_STS_VBUSS_MASK)
> +/*
> + * HS/FS LPM  state (used in FS/HS mode).
> + * 0 - L0 State
> + * 1 - L1 State
> + * 2 - L2 State
> + * 3 - L3 State
> + */
> +#define USB_STS_LPMST_MASK	GENMASK(19, 18)
> +#define DEV_L0_STATE(p)		(((p) & USB_STS_LPMST_MASK) =3D=3D (0x0 << 18))
> +#define DEV_L1_STATE(p)		(((p) & USB_STS_LPMST_MASK) =3D=3D (0x1 << 18))
> +#define DEV_L2_STATE(p)		(((p) & USB_STS_LPMST_MASK) =3D=3D (0x2 << 18))
> +#define DEV_L3_STATE(p)		(((p) & USB_STS_LPMST_MASK) =3D=3D (0x3 << 18))
> +/*
> + * Disable HS status (used in FS/HS mode).
> + * 0 - the disconnect bit for HS/FS mode is set .
> + * 1 - the disconnect bit for HS/FS mode is not set.
> + */
> +#define USB_STS_USB2CONS_MASK	BIT(20)
> +#define USB_STS_USB2CONS(p)	((p) & USB_STS_USB2CONS_MASK)
> +/*
> + * HS/FS mode connection status (used in FS/HS mode).
> + * 0 - High Speed operations in USB2.0 (FS/HS) mode not disabled.
> + * 1 - High Speed operations in USB2.0 (FS/HS).
> + */
> +#define USB_STS_DISABLE_HS_MASK	BIT(21)
> +#define USB_STS_DISABLE_HS(p)	((p) & USB_STS_DISABLE_HS_MASK)
> +/*
> + * U1 state enable status (used in SS mode).
> + * 0 - Entering to  U1 state disabled.
> + * 1 - Entering to  U1 state enabled.
> + */
> +#define USB_STS_U1ENS_MASK	BIT(24)
> +#define USB_STS_U1ENS(p)	((p) & USB_STS_U1ENS_MASK)
> +/*
> + * U2 state enable status (used in SS mode).
> + * 0 - Entering to  U2 state disabled.
> + * 1 - Entering to  U2 state enabled.
> + */
> +#define USB_STS_U2ENS_MASK	BIT(25)
> +#define USB_STS_U2ENS(p)	((p) & USB_STS_U2ENS_MASK)
> +/*
> + * SuperSpeed Link LTSSM state. This field reflects USBSS-DEV current
> + * SuperSpeed link state
> + */
> +#define USB_STS_LST_MASK	GENMASK(29, 26)
> +#define DEV_LST_U0		(((p) & USB_STS_LST_MASK) =3D=3D (0x0 << 26))
> +#define DEV_LST_U1		(((p) & USB_STS_LST_MASK) =3D=3D (0x1 << 26))
> +#define DEV_LST_U2		(((p) & USB_STS_LST_MASK) =3D=3D (0x2 << 26))
> +#define DEV_LST_U3		(((p) & USB_STS_LST_MASK) =3D=3D (0x3 << 26))
> +#define DEV_LST_DISABLED	(((p) & USB_STS_LST_MASK) =3D=3D (0x4 << 26))
> +#define DEV_LST_RXDETECT	(((p) & USB_STS_LST_MASK) =3D=3D (0x5 << 26))
> +#define DEV_LST_INACTIVE	(((p) & USB_STS_LST_MASK) =3D=3D (0x6 << 26))
> +#define DEV_LST_POLLING		(((p) & USB_STS_LST_MASK) =3D=3D (0x7 << 26))
> +#define DEV_LST_RECOVERY	(((p) & USB_STS_LST_MASK) =3D=3D (0x8 << 26))
> +#define DEV_LST_HOT_RESET	(((p) & USB_STS_LST_MASK) =3D=3D (0x9 << 26))
> +#define DEV_LST_COMP_MODE	(((p) & USB_STS_LST_MASK) =3D=3D (0xa << 26))
> +#define DEV_LST_LB_STATE	(((p) & USB_STS_LST_MASK) =3D=3D (0xb << 26))
> +/*
> + * DMA clock turn-off status.
> + * 0 - DMA clock is always on (default after hardware reset).
> + * 1 - DMA clock turn-off in U1, U2 and U3 (SS mode) is enabled.
> + */
> +#define USB_STS_DMAOFF_MASK	BIT(30)
> +#define USB_STS_DMAOFF(p)	((p) & USB_STS_DMAOFF_MASK)
> +/*
> + * SFR Endian status.
> + * 0 - Little Endian order (default after hardware reset).
> + * 1 - Big Endian order.
> + */
> +#define USB_STS_ENDIAN2_MASK	BIT(31)
> +#define USB_STS_ENDIAN2(p)	((p) & USB_STS_ENDIAN2_MASK)
> +
> +/* USB_CMD -  bitmasks */
> +/* Set Function Address */
> +#define USB_CMD_SET_ADDR	BIT(0)
> +/*
> + * Function Address This field is saved to the device only when the fiel=
d
> + * SET_ADDR is set '1 ' during write to USB_CMD register.
> + * Software is responsible for entering the address of the device during
> + * SET_ADDRESS request service. This field should be set immediately aft=
er
> + * the SETUP packet is decoded, and prior to confirmation of the status =
phase
> + */
> +#define USB_CMD_FADDR_MASK	GENMASK(7, 1)
> +#define USB_CMD_FADDR(p)	(((p) << 1) & USB_CMD_FADDR_MASK)
> +/* Send Function Wake Device Notification TP (used only in SS mode). */
> +#define USB_CMD_SDNFW		BIT(8)
> +/* Set Test Mode (used only in HS/FS mode). */
> +#define USB_CMD_STMODE		BIT(9)
> +/* Test mode selector (used only in HS/FS mode) */
> +#define USB_STS_TMODE_SEL_MASK	GENMASK(11, 10)
> +#define USB_STS_TMODE_SEL(p)	(((p) << 10) & USB_STS_TMODE_SEL_MASK)
> +/*
> + *  Send Latency Tolerance Message Device Notification TP (used only
> + *  in SS mode).
> + */
> +#define USB_CMD_SDNLTM		BIT(12)
> +/* Send Custom Transaction Packet (used only in SS mode) */
> +#define USB_CMD_SPKT		BIT(13)
> +/*Device Notification 'Function Wake' - Interface value (only in SS mode=
. */
> +#define USB_CMD_DNFW_INT_MASK	GENMASK(23, 16)
> +#define USB_STS_DNFW_INT(p)	(((p) << 16) & USB_CMD_DNFW_INT_MASK)
> +/*
> + * Device Notification 'Latency Tolerance Message' -373 BELT value [7:0]
> + * (used only in SS mode).
> + */
> +#define USB_CMD_DNLTM_BELT_MASK	GENMASK(27, 16)
> +#define USB_STS_DNLTM_BELT(p)	(((p) << 16) & USB_CMD_DNLTM_BELT_MASK)
> +
> +/* USB_ITPN - bitmasks */
> +/*
> + * ITP(SS) / SOF (HS/FS) number
> + * In SS mode this field represent number of last ITP received from host=
.
> + * In HS/FS mode this field represent number of last SOF received from h=
ost.
> + */
> +#define USB_ITPN_MASK		GENMASK(13, 0)
> +#define USB_ITPN(p)		((p) & USB_ITPN_MASK)
> +
> +/* USB_LPM - bitmasks */
> +/* Host Initiated Resume Duration. */
> +#define USB_LPM_HIRD_MASK	GENMASK(3, 0)
> +#define USB_LPM_HIRD(p)		((p) & USB_LPM_HIRD_MASK)
> +/* Remote Wakeup Enable (bRemoteWake). */
> +#define USB_LPM_BRW		BIT(4)
> +
> +/* USB_IEN - bitmasks */
> +/* SS connection interrupt enable */
> +#define USB_IEN_CONIEN		BIT(0)
> +/* SS disconnection interrupt enable. */
> +#define USB_IEN_DISIEN		BIT(1)
> +/* USB SS warm reset interrupt enable. */
> +#define USB_IEN_UWRESIEN	BIT(2)
> +/* USB SS hot reset interrupt enable */
> +#define USB_IEN_UHRESIEN	BIT(3)
> +/* SS link U3 state enter interrupt enable (suspend).*/
> +#define USB_IEN_U3ENTIEN	BIT(4)
> +/* SS link U3 state exit interrupt enable (wakeup). */
> +#define USB_IEN_U3EXTIEN	BIT(5)
> +/* SS link U2 state enter interrupt enable.*/
> +#define USB_IEN_U2ENTIEN	BIT(6)
> +/* SS link U2 state exit interrupt enable.*/
> +#define USB_IEN_U2EXTIEN	BIT(7)
> +/* SS link U1 state enter interrupt enable.*/
> +#define USB_IEN_U1ENTIEN	BIT(8)
> +/* SS link U1 state exit interrupt enable.*/
> +#define USB_IEN_U1EXTIEN	BIT(9)
> +/* ITP/SOF packet detected interrupt enable.*/
> +#define USB_IEN_ITPIEN		BIT(10)
> +/* Wakeup interrupt enable.*/
> +#define USB_IEN_WAKEIEN		BIT(11)
> +/* Send Custom Packet interrupt enable.*/
> +#define USB_IEN_SPKTIEN		BIT(12)
> +/* HS/FS mode connection interrupt enable.*/
> +#define USB_IEN_CON2IEN		BIT(16)
> +/* HS/FS mode disconnection interrupt enable.*/
> +#define USB_IEN_DIS2IEN		BIT(17)
> +/* USB reset (HS/FS mode) interrupt enable.*/
> +#define USB_IEN_U2RESIEN	BIT(18)
> +/* LPM L2 state enter interrupt enable.*/
> +#define USB_IEN_L2ENTIEN	BIT(20)
> +/* LPM  L2 state exit interrupt enable.*/
> +#define USB_IEN_L2EXTIEN	BIT(21)
> +/* LPM L1 state enter interrupt enable.*/
> +#define USB_IEN_L1ENTIEN	BIT(24)
> +/* LPM  L1 state exit interrupt enable.*/
> +#define USB_IEN_L1EXTIEN	BIT(25)
> +/* Configuration reset interrupt enable.*/
> +#define USB_IEN_CFGRESIEN	BIT(26)
> +/* Start of the USB SS warm reset interrupt enable.*/
> +#define USB_IEN_UWRESSIEN	BIT(28)
> +/* End of the USB SS warm reset interrupt enable.*/
> +#define USB_IEN_UWRESEIEN	BIT(29)
> +
> +#define USB_IEN_INIT  (USB_IEN_U2RESIEN | USB_ISTS_DIS2I | USB_IEN_CON2I=
EN \
> +		       | USB_IEN_UHRESIEN | USB_IEN_UWRESIEN | USB_IEN_DISIEN \
> +		       | USB_IEN_CONIEN | USB_IEN_U3EXTIEN | USB_IEN_L2ENTIEN \
> +		       | USB_IEN_L2EXTIEN | USB_IEN_L1ENTIEN)
> +
> +/* USB_ISTS - bitmasks */
> +/* SS Connection detected. */
> +#define USB_ISTS_CONI		BIT(0)
> +/* SS Disconnection detected. */
> +#define USB_ISTS_DISI		BIT(1)
> +/* UUSB warm reset detectede. */
> +#define USB_ISTS_UWRESI		BIT(2)
> +/* USB hot reset detected. */
> +#define USB_ISTS_UHRESI		BIT(3)
> +/* U3 link state enter detected (suspend).*/
> +#define USB_ISTS_U3ENTI		BIT(4)
> +/* U3 link state exit detected (wakeup). */
> +#define USB_ISTS_U3EXTI		BIT(5)
> +/* U2 link state enter detected.*/
> +#define USB_ISTS_U2ENTI		BIT(6)
> +/* U2 link state exit detected.*/
> +#define USB_ISTS_U2EXTI		BIT(7)
> +/* U1 link state enter detected.*/
> +#define USB_ISTS_U1ENTI		BIT(8)
> +/* U1 link state exit detected.*/
> +#define USB_ISTS_U1EXTI		BIT(9)
> +/* ITP/SOF packet detected.*/
> +#define USB_ISTS_ITPI		BIT(10)
> +/* Wakeup detected.*/
> +#define USB_ISTS_WAKEI		BIT(11)
> +/* Send Custom Packet detected.*/
> +#define USB_ISTS_SPKTI		BIT(12)
> +/* HS/FS mode connection detected.*/
> +#define USB_ISTS_CON2I		BIT(16)
> +/* HS/FS mode disconnection detected.*/
> +#define USB_ISTS_DIS2I		BIT(17)
> +/* USB reset (HS/FS mode) detected.*/
> +#define USB_ISTS_U2RESI		BIT(18)
> +/* LPM L2 state enter detected.*/
> +#define USB_ISTS_L2ENTI		BIT(20)
> +/* LPM  L2 state exit detected.*/
> +#define USB_ISTS_L2EXTI		BIT(21)
> +/* LPM L1 state enter detected.*/
> +#define USB_ISTS_L1ENTI		BIT(24)
> +/* LPM L1 state exit detected.*/
> +#define USB_ISTS_L1EXTI		BIT(25)
> +/* USB configuration reset detected.*/
> +#define USB_ISTS_CFGRESI	BIT(26)
> +/* Start of the USB warm reset detected.*/
> +#define USB_ISTS_UWRESSI	BIT(28)
> +/* End of the USB warm reset detected.*/
> +#define USB_ISTS_UWRESEI	BIT(29)
> +
> +/* USB_SEL - bitmasks */
> +#define EP_SEL_EPNO_MASK	GENMASK(3, 0)
> +/* Endpoint number. */
> +#define EP_SEL_EPNO(p)		((p) & EP_SEL_EPNO_MASK)
> +/* Endpoint direction bit - 0 - OUT, 1 - IN. */
> +#define EP_SEL_DIR		BIT(7)
> +
> +#define select_ep_in(nr)	(EP_SEL_EPNO(p) | EP_SEL_DIR)
> +#define select_ep_out		(EP_SEL_EPNO(p))
> +
> +/* EP_TRADDR - bitmasks */
> +/* Transfer Ring address. */
> +#define EP_TRADDR_TRADDR(p)	((p))
> +
> +/* EP_CFG - bitmasks */
> +/* Endpoint enable */
> +#define EP_CFG_ENABLE		BIT(0)
> +/*
> + *  Endpoint type.
> + * 1 - isochronous
> + * 2 - bulk
> + * 3 - interrupt
> + */
> +#define EP_CFG_EPTYPE_MASK	GENMASK(2, 1)
> +#define EP_CFG_EPTYPE(p)	(((p) << 1)  & EP_CFG_EPTYPE_MASK)
> +/* Stream support enable (only in SS mode). */
> +#define EP_CFG_STREAM_EN	BIT(3)
> +/* TDL check (only in SS mode for BULK EP). */
> +#define EP_CFG_TDL_CHK		BIT(4)
> +/* SID check (only in SS mode for BULK OUT EP). */
> +#define EP_CFG_SID_CHK		BIT(5)
> +/* DMA transfer endianness. */
> +#define EP_CFG_EPENDIAN		BIT(7)
> +/* Max burst size (used only in SS mode). */
> +#define EP_CFG_MAXBURST_MASK	GENMASK(11, 8)
> +#define EP_CFG_MAXBURST(p)	(((p) << 8) & EP_CFG_MAXBURST_MASK)
> +/* ISO max burst. */
> +#define EP_CFG_MULT_MASK	GENMASK(15, 14)
> +#define EP_CFG_MULT(p)		(((p) << 14) & EP_CFG_MULT_MASK)
> +/* ISO max burst. */
> +#define EP_CFG_MAXPKTSIZE_MASK	GENMASK(26, 16)
> +#define EP_CFG_MAXPKTSIZE(p)	(((p) << 16) & EP_CFG_MAXPKTSIZE_MASK)
> +/* Max number of buffered packets. */
> +#define EP_CFG_BUFFERING_MASK	GENMASK(31, 27)
> +#define EP_CFG_BUFFERING(p)	(((p) << 27) & EP_CFG_BUFFERING_MASK)
> +
> +/* EP_CMD - bitmasks */
> +/* Endpoint reset. */
> +#define EP_CMD_EPRST		BIT(0)
> +/* Endpoint STALL set. */
> +#define EP_CMD_SSTALL		BIT(1)
> +/* Endpoint STALL clear. */
> +#define EP_CMD_CSTALL		BIT(2)
> +/* Send ERDY TP. */
> +#define EP_CMD_ERDY		BIT(3)
> +/* Request complete. */
> +#define EP_CMD_REQ_CMPL		BIT(5)
> +/* Transfer descriptor ready. */
> +#define EP_CMD_DRDY		BIT(6)
> +/* Data flush. */
> +#define EP_CMD_DFLUSH		BIT(7)
> +/*
> + * Transfer Descriptor Length write  (used only for Bulk Stream capable
> + * endpoints in SS mode).
> + * Bit Removed from DEV_VER_V3 controller version.
> + */
> +#define EP_CMD_STDL		BIT(8)
> +/*
> + * Transfer Descriptor Length (used only in SS mode for bulk endpoints).
> + * Bits Removed from DEV_VER_V3 controller version.
> + */
> +#define EP_CMD_TDL_MASK		GENMASK(15, 9)
> +#define EP_CMD_TDL(p)		(((p) << 9) & EP_CMD_TDL_MASK)
> +/* ERDY Stream ID value (used in SS mode). */
> +#define EP_CMD_ERDY_SID_MASK	GENMASK(31, 16)
> +#define EP_CMD_ERDY_SID(p)	(((p) << 16) & EP_CMD_SID_MASK)
> +
> +/* EP_STS - bitmasks */
> +/* Setup transfer complete. */
> +#define EP_STS_SETUP		BIT(0)
> +/* Endpoint STALL status. */
> +#define EP_STS_STALL(p)		((p) & BIT(1))
> +/* Interrupt On Complete. */
> +#define EP_STS_IOC		BIT(2)
> +/* Interrupt on Short Packet. */
> +#define EP_STS_ISP		BIT(3)
> +/* Transfer descriptor missing. */
> +#define EP_STS_DESCMIS		BIT(4)
> +/* Stream Rejected (used only in SS mode) */
> +#define EP_STS_STREAMR		BIT(5)
> +/* EXIT from MOVE DATA State (used only for stream transfers in SS mode)=
. */
> +#define EP_STS_MD_EXIT		BIT(6)
> +/* TRB error. */
> +#define EP_STS_TRBERR		BIT(7)
> +/* Not ready (used only in SS mode). */
> +#define EP_STS_NRDY		BIT(8)
> +/* DMA busy bit. */
> +#define EP_STS_DBUSY		BIT(9)
> +/* Endpoint Buffer Empty */
> +#define EP_STS_BUFFEMPTY(p)	((p) & BIT(10))
> +/* Current Cycle Status */
> +#define EP_STS_CCS(p)		((p) & BIT(11))
> +/* Prime (used only in SS mode. */
> +#define EP_STS_PRIME		BIT(12)
> +/* Stream error (used only in SS mode). */
> +#define EP_STS_SIDERR		BIT(13)
> +/* OUT size mismatch. */
> +#define EP_STS_OUTSMM		BIT(14)
> +/* ISO transmission error. */
> +#define EP_STS_ISOERR		BIT(15)
> +/* Host Packet Pending (only for SS mode). */
> +#define EP_STS_HOSTPP(p)	((p) & BIT(16))
> +/* Stream Protocol State Machine State (only for Bulk stream endpoints).=
 */
> +#define EP_STS_SPSMST_MASK		GENMASK(18, 17)
> +#define EP_STS_SPSMST_DISABLED(p)	(((p) & EP_STS_SPSMST_MASK) >> 17)
> +#define EP_STS_SPSMST_IDLE(p)		(((p) & EP_STS_SPSMST_MASK) >> 17)
> +#define EP_STS_SPSMST_START_STREAM(p)	(((p) & EP_STS_SPSMST_MASK) >> 17)
> +#define EP_STS_SPSMST_MOVE_DATA(p)	(((p) & EP_STS_SPSMST_MASK) >> 17)
> +/* Interrupt On Transfer complete. */
> +#define EP_STS_IOT		BIT(19)
> +/* OUT queue endpoint number. */
> +#define EP_STS_OUTQ_NO_MASK	GENMASK(27, 24)
> +#define EP_STS_OUTQ_NO(p)	(((p) & EP_STS_OUTQ_NO_MASK) >> 24)
> +/* OUT queue valid flag. */
> +#define EP_STS_OUTQ_VAL_MASK	BIT(28)
> +#define EP_STS_OUTQ_VAL(p)	((p) & EP_STS_OUTQ_VAL_MASK)
> +/* SETUP WAIT. */
> +#define EP_STS_STPWAIT		BIT(31)
> +
> +/* EP_STS_SID - bitmasks */
> +/* Stream ID (used only in SS mode). */
> +#define EP_STS_SID_MASK		GENMASK(15, 0)
> +#define EP_STS_SID(p)		((p) & EP_STS_SID_MASK)
> +
> +/* EP_STS_EN - bitmasks */
> +/* SETUP interrupt enable. */
> +#define EP_STS_EN_SETUPEN	BIT(0)
> +/* OUT transfer missing descriptor enable. */
> +#define EP_STS_EN_DESCMISEN	BIT(4)
> +/* Stream Rejected enable. */
> +#define EP_STS_EN_STREAMREN	BIT(5)
> +/* Move Data Exit enable.*/
> +#define EP_STS_EN_MD_EXITEN	BIT(6)
> +/* TRB enable. */
> +#define EP_STS_EN_TRBERREN	BIT(7)
> +/* NRDY enable. */
> +#define EP_STS_EN_NRDYEN	BIT(8)
> +/* Prime enable. */
> +#define EP_STS_EN_PRIMEEEN	BIT(12)
> +/* Stream error enable. */
> +#define EP_STS_EN_SIDERREN	BIT(13)
> +/* OUT size mismatch enable. */
> +#define EP_STS_EN_OUTSMMEN	BIT(14)
> +/* ISO transmission error enable. */
> +#define EP_STS_EN_ISOERREN	BIT(15)
> +/* Interrupt on Transmission complete enable. */
> +#define EP_STS_EN_IOTEN		BIT(19)
> +/* Setup Wait interrupt enable. */
> +#define EP_STS_EN_STPWAITEN	BIT(31)
> +
> +/* DRBL- bitmasks */
> +#define DB_VALUE_BY_INDEX(index) (1 << (index))
> +#define DB_VALUE_EP0_OUT	BIT(0)
> +#define DB_VALUE_EP0_IN		BIT(16)
> +
> +/* EP_IEN - bitmasks */
> +#define EP_IEN(index)		(1 << (index))
> +#define EP_IEN_EP_OUT0		BIT(0)
> +#define EP_IEN_EP_IN0		BIT(16)
> +
> +/* EP_ISTS - bitmasks */
> +#define EP_ISTS(index)		(1 << (index))
> +#define EP_ISTS_EP_OUT0		BIT(0)
> +#define EP_ISTS_EP_IN0		BIT(16)
> +
> +/* USB_PWR- bitmasks */
> +/*Power Shut Off capability enable*/
> +#define PUSB_PWR_PSO_EN		BIT(0)
> +/*Power Shut Off capability disable*/
> +#define PUSB_PWR_PSO_DS		BIT(1)
> +/*
> + * Enables turning-off Reference Clock.
> + * This bit is optional and implemented only when support for OTG is
> + * implemented (indicated by OTG_READY bit set to '1').
> + */
> +#define PUSB_PWR_STB_CLK_SWITCH_EN	BIT(8)
> +/*
> + * Status bit indicating that operation required by STB_CLK_SWITCH_EN wr=
ite
> + * is completed
> + */
> +#define PUSB_PWR_STB_CLK_SWITCH_DONE	BIT(9)
> +/* This bit informs if Fast Registers Access is enabled. */
> +#define PUSB_PWR_FST_REG_ACCESS_STAT	BIT(30)
> +/* Fast Registers Access Enable. */
> +#define PUSB_PWR_FST_REG_ACCESS		BIT(31)
> +
> +/* USB_CONF2- bitmasks */
> +/*
> + * Writing 1 disables TDL calculation basing on TRB feature in controlle=
r
> + * for DMULT mode.
> + * Bit supported only for DEV_VER_V2 version.
> + */
> +#define USB_CONF2_DIS_TDL_TRB		BIT(1)
> +/*
> + * Writing 1 enables TDL calculation basing on TRB feature in controller
> + * for DMULT mode.
> + * Bit supported only for DEV_VER_V2 version.
> + */
> +#define USB_CONF2_EN_TDL_TRB		BIT(2)
> +
> +/* USB_CAP1- bitmasks */
> +/*
> + * SFR Interface type
> + * These field reflects type of SFR interface implemented:
> + * 0x0 - OCP
> + * 0x1 - AHB,
> + * 0x2 - PLB
> + * 0x3 - AXI
> + * 0x4-0xF - reserved
> + */
> +#define USB_CAP1_SFR_TYPE_MASK	GENMASK(3, 0)
> +#define DEV_SFR_TYPE_OCP(p)	(((p) & USB_CAP1_SFR_TYPE_MASK) =3D=3D 0x0)
> +#define DEV_SFR_TYPE_AHB(p)	(((p) & USB_CAP1_SFR_TYPE_MASK) =3D=3D 0x1)
> +#define DEV_SFR_TYPE_PLB(p)	(((p) & USB_CAP1_SFR_TYPE_MASK) =3D=3D 0x2)
> +#define DEV_SFR_TYPE_AXI(p)	(((p) & USB_CAP1_SFR_TYPE_MASK) =3D=3D 0x3)
> +/*
> + * SFR Interface width
> + * These field reflects width of SFR interface implemented:
> + * 0x0 - 8 bit interface,
> + * 0x1 - 16 bit interface,
> + * 0x2 - 32 bit interface
> + * 0x3 - 64 bit interface
> + * 0x4-0xF - reserved
> + */
> +#define USB_CAP1_SFR_WIDTH_MASK	GENMASK(7, 4)
> +#define DEV_SFR_WIDTH_8(p)	(((p) & USB_CAP1_SFR_WIDTH_MASK) =3D=3D (0x0 =
<< 4))
> +#define DEV_SFR_WIDTH_16(p)	(((p) & USB_CAP1_SFR_WIDTH_MASK) =3D=3D (0x1=
 << 4))
> +#define DEV_SFR_WIDTH_32(p)	(((p) & USB_CAP1_SFR_WIDTH_MASK) =3D=3D (0x2=
 << 4))
> +#define DEV_SFR_WIDTH_64(p)	(((p) & USB_CAP1_SFR_WIDTH_MASK) =3D=3D (0x3=
 << 4))
> +/*
> + * DMA Interface type
> + * These field reflects type of DMA interface implemented:
> + * 0x0 - OCP
> + * 0x1 - AHB,
> + * 0x2 - PLB
> + * 0x3 - AXI
> + * 0x4-0xF - reserved
> + */
> +#define USB_CAP1_DMA_TYPE_MASK	GENMASK(11, 8)
> +#define DEV_DMA_TYPE_OCP(p)	(((p) & USB_CAP1_DMA_TYPE_MASK) =3D=3D (0x0 =
<< 8))
> +#define DEV_DMA_TYPE_AHB(p)	(((p) & USB_CAP1_DMA_TYPE_MASK) =3D=3D (0x1 =
<< 8))
> +#define DEV_DMA_TYPE_PLB(p)	(((p) & USB_CAP1_DMA_TYPE_MASK) =3D=3D (0x2 =
<< 8))
> +#define DEV_DMA_TYPE_AXI(p)	(((p) & USB_CAP1_DMA_TYPE_MASK) =3D=3D (0x3 =
<< 8))
> +/*
> + * DMA Interface width
> + * These field reflects width of DMA interface implemented:
> + * 0x0 - reserved,
> + * 0x1 - reserved,
> + * 0x2 - 32 bit interface
> + * 0x3 - 64 bit interface
> + * 0x4-0xF - reserved
> + */
> +#define USB_CAP1_DMA_WIDTH_MASK	GENMASK(15, 12)
> +#define DEV_DMA_WIDTH_32(p)	(((p) & USB_CAP1_DMA_WIDTH_MASK) =3D=3D (0x2=
 << 12))
> +#define DEV_DMA_WIDTH_64(p)	(((p) & USB_CAP1_DMA_WIDTH_MASK) =3D=3D (0x3=
 << 12))
> +/*
> + * USB3 PHY Interface type
> + * These field reflects type of USB3 PHY interface implemented:
> + * 0x0 - USB PIPE,
> + * 0x1 - RMMI,
> + * 0x2-0xF - reserved
> + */
> +#define USB_CAP1_U3PHY_TYPE_MASK GENMASK(19, 16)
> +#define DEV_U3PHY_PIPE(p) (((p) & USB_CAP1_U3PHY_TYPE_MASK) =3D=3D (0x0 =
<< 16))
> +#define DEV_U3PHY_RMMI(p) (((p) & USB_CAP1_U3PHY_TYPE_MASK) =3D=3D (0x1 =
<< 16))
> +/*
> + * USB3 PHY Interface width
> + * These field reflects width of USB3 PHY interface implemented:
> + * 0x0 - 8 bit PIPE interface,
> + * 0x1 - 16 bit PIPE interface,
> + * 0x2 - 32 bit PIPE interface,
> + * 0x3 - 64 bit PIPE interface
> + * 0x4-0xF - reserved
> + * Note: When SSIC interface is implemented this field shows the width o=
f
> + * internal PIPE interface. The RMMI interface is always 20bit wide.
> + */
> +#define USB_CAP1_U3PHY_WIDTH_MASK GENMASK(23, 20)
> +#define DEV_U3PHY_WIDTH_8(p) \
> +	(((p) & USB_CAP1_U3PHY_WIDTH_MASK) =3D=3D (0x0 << 20))
> +#define DEV_U3PHY_WIDTH_16(p) \
> +	(((p) & USB_CAP1_U3PHY_WIDTH_MASK) =3D=3D (0x1 << 16))
> +#define DEV_U3PHY_WIDTH_32(p) \
> +	(((p) & USB_CAP1_U3PHY_WIDTH_MASK) =3D=3D (0x2 << 20))
> +#define DEV_U3PHY_WIDTH_64(p) \
> +	(((p) & USB_CAP1_U3PHY_WIDTH_MASK) =3D=3D (0x3 << 16))
> +
> +/*
> + * USB2 PHY Interface enable
> + * These field informs if USB2 PHY interface is implemented:
> + * 0x0 - interface NOT implemented,
> + * 0x1 - interface implemented
> + */
> +#define USB_CAP1_U2PHY_EN(p)	((p) & BIT(24))
> +/*
> + * USB2 PHY Interface type
> + * These field reflects type of USB2 PHY interface implemented:
> + * 0x0 - UTMI,
> + * 0x1 - ULPI
> + */
> +#define DEV_U2PHY_ULPI(p)	((p) & BIT(25))
> +/*
> + * USB2 PHY Interface width
> + * These field reflects width of USB2 PHY interface implemented:
> + * 0x0 - 8 bit interface,
> + * 0x1 - 16 bit interface,
> + * Note: The ULPI interface is always 8bit wide.
> + */
> +#define DEV_U2PHY_WIDTH_16(p)	((p) & BIT(26))
> +/*
> + * OTG Ready
> + * 0x0 - pure device mode
> + * 0x1 - some features and ports for CDNS USB OTG controller are impleme=
nted.
> + */
> +#define USB_CAP1_OTG_READY(p)	((p) & BIT(27))
> +
> +/*
> + * When set, indicates that controller supports automatic internal TDL
> + * calculation basing on the size provided in TRB (TRB[22:17]) for DMULT=
 mode
> + * Supported only for DEV_VER_V2 controller version.
> + */
> +#define USB_CAP1_TDL_FROM_TRB(p)	((p) & BIT(28))
> +
> +/* USB_CAP2- bitmasks */
> +/*
> + * The actual size of the connected On-chip RAM memory in kB:
> + * - 0 means 256 kB (max supported mem size)
> + * - value other than 0 reflects the mem size in kB
> + */
> +#define USB_CAP2_ACTUAL_MEM_SIZE(p) ((p) & GENMASK(7, 0))
> +/*
> + * Max supported mem size
> + * These field reflects width of on-chip RAM address bus width,
> + * which determines max supported mem size:
> + * 0x0-0x7 - reserved,
> + * 0x8 - support for 4kB mem,
> + * 0x9 - support for 8kB mem,
> + * 0xA - support for 16kB mem,
> + * 0xB - support for 32kB mem,
> + * 0xC - support for 64kB mem,
> + * 0xD - support for 128kB mem,
> + * 0xE - support for 256kB mem,
> + * 0xF - reserved
> + */
> +#define USB_CAP2_MAX_MEM_SIZE(p) ((p) & GENMASK(11, 8))
> +
> +/* USB_CAP3- bitmasks */
> +#define EP_IS_IMPLEMENTED(reg, index) ((reg) & (1 << (index)))
> +
> +/* USB_CAP4- bitmasks */
> +#define EP_SUPPORT_ISO(reg, index) ((reg) & (1 << (index)))
> +
> +/* USB_CAP5- bitmasks */
> +#define EP_SUPPORT_STREAM(reg, index) ((reg) & (1 << (index)))
> +
> +/* USB_CAP6- bitmasks */
> +/* The USBSS-DEV Controller  Internal build number. */
> +#define GET_DEV_BASE_VERSION(p) ((p) & GENMASK(23, 0))
> +/* The USBSS-DEV Controller version number. */
> +#define GET_DEV_CUSTOM_VERSION(p) ((p) & GENMASK(31, 24))
> +
> +#define DEV_VER_NXP_V1		0x00024502
> +#define DEV_VER_TI_V1		0x00024509
> +#define DEV_VER_V2		0x0002450C
> +#define DEV_VER_V3		0x0002450d
> +
> +/* DBG_LINK1- bitmasks */
> +/*
> + * LFPS_MIN_DET_U1_EXIT value This parameter configures the minimum
> + * time required for decoding the received LFPS as an LFPS.U1_Exit.
> + */
> +#define DBG_LINK1_LFPS_MIN_DET_U1_EXIT(p)	((p) & GENMASK(7, 0))
> +/*
> + * LFPS_MIN_GEN_U1_EXIT value This parameter configures the minimum time=
 for
> + * phytxelecidle deassertion when LFPS.U1_Exit
> + */
> +#define DBG_LINK1_LFPS_MIN_GEN_U1_EXIT_MASK	GENMASK(15, 8)
> +#define DBG_LINK1_LFPS_MIN_GEN_U1_EXIT(p)	(((p) << 8) & GENMASK(15, 8))
> +/*
> + * RXDET_BREAK_DIS value This parameter configures terminating the Far-e=
nd
> + * Receiver termination detection sequence:
> + * 0: it is possible that USBSS_DEV will terminate Farend receiver
> + *    termination detection sequence
> + * 1: USBSS_DEV will not terminate Far-end receiver termination
> + *    detection sequence
> + */
> +#define DBG_LINK1_RXDET_BREAK_DIS		BIT(16)
> +/* LFPS_GEN_PING value This parameter configures the LFPS.Ping generatio=
n */
> +#define DBG_LINK1_LFPS_GEN_PING(p)		(((p) << 17) & GENMASK(21, 17))
> +/*
> + * Set the LFPS_MIN_DET_U1_EXIT value Writing '1' to this bit writes the
> + * LFPS_MIN_DET_U1_EXIT field value to the device. This bit is automatic=
ally
> + * cleared. Writing '0' has no effect
> + */
> +#define DBG_LINK1_LFPS_MIN_DET_U1_EXIT_SET	BIT(24)
> +/*
> + * Set the LFPS_MIN_GEN_U1_EXIT value. Writing '1' to this bit writes th=
e
> + * LFPS_MIN_GEN_U1_EXIT field value to the device. This bit is automatic=
ally
> + * cleared. Writing '0' has no effect
> + */
> +#define DBG_LINK1_LFPS_MIN_GEN_U1_EXIT_SET	BIT(25)
> +/*
> + * Set the RXDET_BREAK_DIS value Writing '1' to this bit writes
> + * the RXDET_BREAK_DIS field value to the device. This bit is automatica=
lly
> + * cleared. Writing '0' has no effect
> + */
> +#define DBG_LINK1_RXDET_BREAK_DIS_SET		BIT(26)
> +/*
> + * Set the LFPS_GEN_PING_SET value Writing '1' to this bit writes
> + * the LFPS_GEN_PING field value to the device. This bit is automaticall=
y
> + * cleared. Writing '0' has no effect."
> + */
> +#define DBG_LINK1_LFPS_GEN_PING_SET		BIT(27)
> +
> +/* DMA_AXI_CTRL- bitmasks */
> +/* The mawprot pin configuration. */
> +#define DMA_AXI_CTRL_MARPROT(p) ((p) & GENMASK(2, 0))
> +/* The marprot pin configuration. */
> +#define DMA_AXI_CTRL_MAWPROT(p) (((p) < 16) & GENMASK(18, 16))
> +#define DMA_AXI_CTRL_NON_SECURE 0x02
> +
> +#define gadget_to_cdns3_device(g) (container_of(g, struct cdns3_device, =
gadget))
> +
> +#define ep_to_cdns3_ep(ep) (container_of(ep, struct cdns3_endpoint, endp=
oint))
> +
> +/*----------------------------------------------------------------------=
---*/
> +/*
> + * USBSS-DEV DMA interface.
> + */
> +#define TRBS_PER_SEGMENT	40
> +
> +#define ISO_MAX_INTERVAL	10
> +
> +#if TRBS_PER_SEGMENT < 2
> +#error "Incorrect TRBS_PER_SEGMENT. Minimal Transfer Ring size is 2."
> +#endif
> +
> +/*
> + *Only for ISOC endpoints - maximum number of TRBs is calculated as
> + * pow(2, bInterval-1) * number of usb requests. It is limitation made b=
y
> + * driver to save memory. Controller must prepare TRB for each ITP even
> + * if bInterval > 1. It's the reason why driver needs so many TRBs for
> + * isochronous endpoints.
> + */
> +#define TRBS_PER_ISOC_SEGMENT	(ISO_MAX_INTERVAL * 8)
> +
> +#define GET_TRBS_PER_SEGMENT(ep_type) ((ep_type) =3D=3D USB_ENDPOINT_XFE=
R_ISOC ? \
> +				      TRBS_PER_ISOC_SEGMENT : TRBS_PER_SEGMENT)
> +/**
> + * struct cdns3_trb - represent Transfer Descriptor block.
> + * @buffer:	pointer to buffer data
> + * @length:	length of data
> + * @control:	control flags.
> + *
> + * This structure describes transfer block serviced by DMA module.
> + */
> +struct cdns3_trb {
> +	__le32 buffer;
> +	__le32 length;
> +	__le32 control;
> +};
> +
> +#define TRB_SIZE		(sizeof(struct cdns3_trb))
> +#define TRB_RING_SIZE		(TRB_SIZE * TRBS_PER_SEGMENT)
> +#define TRB_ISO_RING_SIZE	(TRB_SIZE * TRBS_PER_ISOC_SEGMENT)
> +#define TRB_CTRL_RING_SIZE	(TRB_SIZE * 2)
> +
> +/* TRB bit mask */
> +#define TRB_TYPE_BITMASK	GENMASK(15, 10)
> +#define TRB_TYPE(p)		((p) << 10)
> +#define TRB_FIELD_TO_TYPE(p)	(((p) & TRB_TYPE_BITMASK) >> 10)
> +
> +/* TRB type IDs */
> +/* bulk, interrupt, isoc , and control data stage */
> +#define TRB_NORMAL		1
> +/* TRB for linking ring segments */
> +#define TRB_LINK		6
> +
> +/* Cycle bit - indicates TRB ownership by driver or hw*/
> +#define TRB_CYCLE		BIT(0)
> +/*
> + * When set to '1', the device will toggle its interpretation of the Cyc=
le bit
> + */
> +#define TRB_TOGGLE		BIT(1)
> +
> +/*
> + * Short Packet (SP). OUT EPs at DMULT=3D1 only. Indicates if the TRB wa=
s
> + * processed while USB short packet was received. No more buffers define=
d by
> + * the TD will be used. DMA will automatically advance to next TD.
> + * - Shall be set to 0 by Software when putting TRB on the Transfer Ring
> + * - Shall be set to 1 by Controller when Short Packet condition for thi=
s TRB
> + *   is detected independent if ISP is set or not.
> + */
> +#define TRB_SP			BIT(1)
> +
> +/* Interrupt on short packet*/
> +#define TRB_ISP			BIT(2)
> +/*Setting this bit enables FIFO DMA operation mode*/
> +#define TRB_FIFO_MODE		BIT(3)
> +/* Set PCIe no snoop attribute */
> +#define TRB_CHAIN		BIT(4)
> +/* Interrupt on completion */
> +#define TRB_IOC			BIT(5)
> +
> +/* stream ID bitmasks. */
> +#define TRB_STREAM_ID(p)	((p) & GENMASK(31, 16))
> +
> +/* Size of TD expressed in USB packets for HS/FS mode. */
> +#define TRB_TDL_HS_SIZE(p)	(((p) << 16) & GENMASK(31, 16))
> +#define TRB_TDL_HS_SIZE_GET(p)	(((p) & GENMASK(31, 16)) >> 16)
> +
> +/* transfer_len bitmasks. */
> +#define TRB_LEN(p)		((p) & GENMASK(16, 0))
> +
> +/* Size of TD expressed in USB packets for SS mode. */
> +#define TRB_TDL_SS_SIZE(p)	(((p) << 17) & GENMASK(23, 17))
> +#define TRB_TDL_SS_SIZE_GET(p)	(((p) & GENMASK(23, 17)) >> 17)
> +
> +/* transfer_len bitmasks - bits 31:24 */
> +#define TRB_BURST_LEN(p)	(((p) << 24) & GENMASK(31, 24))
> +#define TRB_BURST_LEN_GET(p)	(((p) & GENMASK(31, 24)) >> 24)
> +
> +/* Data buffer pointer bitmasks*/
> +#define TRB_BUFFER(p)		((p) & GENMASK(31, 0))
> +
> +/*----------------------------------------------------------------------=
---*/
> +/* Driver numeric constants */
> +
> +/* Such declaration should be added to ch9.h */
> +#define USB_DEVICE_MAX_ADDRESS		127
> +
> +/* Endpoint init values */
> +#define CDNS3_EP_MAX_PACKET_LIMIT	1024
> +#define CDNS3_EP_MAX_STREAMS		15
> +#define CDNS3_EP0_MAX_PACKET_LIMIT	512
> +
> +/* All endpoints including EP0 */
> +#define CDNS3_ENDPOINTS_MAX_COUNT	32
> +#define CDNS3_EP_ZLP_BUF_SIZE		1024
> +
> +#define CDNS3_EP_BUF_SIZE		2	/* KB */
> +#define CDNS3_EP_ISO_HS_MULT		3
> +#define CDNS3_EP_ISO_SS_BURST		3
> +#define CDNS3_MAX_NUM_DESCMISS_BUF	32
> +#define CDNS3_DESCMIS_BUF_SIZE		2048	/* Bytes */
> +/*----------------------------------------------------------------------=
---*/
> +/* Used structs */
> +
> +struct cdns3_device;
> +
> +/**
> + * struct cdns3_endpoint - extended device side representation of USB en=
dpoint.
> + * @endpoint: usb endpoint
> + * @pending_req_list: list of requests queuing on transfer ring.
> + * @deferred_req_list: list of requests waiting for queuing on transfer =
ring.
> + * @trb_pool: transfer ring - array of transaction buffers
> + * @trb_pool_dma: dma address of transfer ring
> + * @cdns3_dev: device associated with this endpoint
> + * @name: a human readable name e.g. ep1out
> + * @flags: specify the current state of endpoint
> + * @dir: endpoint direction
> + * @num: endpoint number (1 - 15)
> + * @type: set to bmAttributes & USB_ENDPOINT_XFERTYPE_MASK
> + * @interval: interval between packets used for ISOC endpoint.
> + * @free_trbs: number of free TRBs in transfer ring
> + * @num_trbs: number of all TRBs in transfer ring
> + * @pcs: producer cycle state
> + * @ccs: consumer cycle state
> + * @enqueue: enqueue index in transfer ring
> + * @dequeue: dequeue index in transfer ring
> + * @trb_burst_size: number of burst used in trb.
> + */
> +struct cdns3_endpoint {
> +	struct usb_ep		endpoint;
> +	struct list_head	pending_req_list;
> +	struct list_head	deferred_req_list;
> +
> +	struct cdns3_trb	*trb_pool;
> +	dma_addr_t		trb_pool_dma;
> +
> +	struct cdns3_device	*cdns3_dev;
> +	char			name[20];
> +
> +#define EP_ENABLED		BIT(0)
> +#define EP_STALL		BIT(1)
> +#define EP_WEDGE		BIT(2)
> +#define EP_TRANSFER_STARTED	BIT(3)
> +#define EP_UPDATE_EP_TRBADDR	BIT(4)
> +#define EP_PENDING_REQUEST	BIT(5)
> +#define EP_RING_FULL		BIT(6)
> +#define EP_CLAIMED		BIT(7)
> +#define EP_DEFERRED_DRDY	BIT(8)
> +#define EP_QUIRK_ISO_OUT_EN	BIT(9)
> +	u32			flags;
> +
> +	u8			dir;
> +	u8			num;
> +	u8			type;
> +	int			interval;
> +
> +	int			free_trbs;
> +	int			num_trbs;
> +	u8			pcs;
> +	u8			ccs;
> +	int			enqueue;
> +	int			dequeue;
> +	u8			trb_burst_size;
> +
> +	unsigned int		wa1_set:1;
> +	struct cdns3_trb	*wa1_trb;
> +	unsigned int		wa1_trb_index;
> +	unsigned int		wa1_cycle_bit:1;
> +};
> +
> +/**
> + * struct cdns3_aligned_buf - represent aligned buffer used for DMA tran=
sfer
> + * @buf: aligned to 8 bytes data buffer. Buffer address used in
> + *       TRB shall be aligned to 8.
> + * @dma: dma address
> + * @size: size of buffer
> + * @in_use: inform if this buffer is associated with usb_request
> + * @list: used to adding instance of this object to list
> + */
> +struct cdns3_aligned_buf {
> +	void			*buf;
> +	dma_addr_t		dma;
> +	u32			size;
> +	int			in_use:1;
> +	struct list_head	list;
> +};
> +
> +/**
> + * struct cdns3_request - extended device side representation of usb_req=
uest
> + *                        object .
> + * @request: generic usb_request object describing single I/O request.
> + * @priv_ep: extended representation of usb_ep object
> + * @trb: the first TRB association with this request
> + * @start_trb: number of the first TRB in transfer ring
> + * @end_trb: number of the last TRB in transfer ring
> + * @aligned_buf: object holds information about aligned buffer associate=
d whit
> + *               this endpoint
> + * @flags: flag specifying special usage of request
> + */
> +struct cdns3_request {
> +	struct usb_request		request;
> +	struct cdns3_endpoint		*priv_ep;
> +	struct cdns3_trb		*trb;
> +	int				start_trb;
> +	int				end_trb;
> +	struct cdns3_aligned_buf	*aligned_buf;
> +#define REQUEST_PENDING			BIT(0)
> +#define REQUEST_INTERNAL		BIT(1)
> +#define REQUEST_INTERNAL_CH		BIT(2)
> +#define REQUEST_ZLP			BIT(3)
> +#define REQUEST_UNALIGNED		BIT(4)
> +	u32				flags;
> +	struct list_head		list;
> +};
> +
> +#define to_cdns3_request(r) (container_of(r, struct cdns3_request, reque=
st))
> +
> +/*Stages used during enumeration process.*/
> +#define CDNS3_SETUP_STAGE		0x0
> +#define CDNS3_DATA_STAGE		0x1
> +#define CDNS3_STATUS_STAGE		0x2
> +
> +/**
> + * struct cdns3_device - represent USB device.
> + * @dev: pointer to device structure associated whit this controller
> + * @sysdev: pointer to the DMA capable device
> + * @gadget: device side representation of the peripheral controller
> + * @gadget_driver: pointer to the gadget driver
> + * @dev_ver: device controller version.
> + * @lock: for synchronizing
> + * @regs: base address for device side registers
> + * @setup_buf: used while processing usb control requests
> + * @setup_dma: dma address for setup_buf
> + * @zlp_buf - zlp buffer
> + * @ep0_stage: ep0 stage during enumeration process.
> + * @ep0_data_dir: direction for control transfer
> + * @eps: array of pointers to all endpoints with exclusion ep0
> + * @aligned_buf_list: list of aligned buffers internally allocated by dr=
iver
> + * @run_garbage_collector: infroms that at least one element of aligned_=
buf_list
> + *                        can be freed
> + * @selected_ep: actually selected endpoint. It's used only to improve
> + *               performance.
> + * @isoch_delay: value from Set Isoch Delay request. Only valid on SS/SS=
P.
> + * @u1_allowed: allow device transition to u1 state
> + * @u2_allowed: allow device transition to u2 state
> + * @is_selfpowered: device is self powered
> + * @setup_pending: setup packet is processing by gadget driver
> + * @hw_configured_flag: hardware endpoint configuration was set.
> + * @wake_up_flag: allow device to remote up the host
> + * @status_completion_no_call: indicate that driver is waiting for statu=
s s
> + *     stage completion. It's used in deferred SET_CONFIGURATION request=
.
> + * @onchip_buffers: number of available on-chip buffers.
> + * @onchip_used_size: actual size of on-chip memory assigned to endpoint=
s.
> + * @pending_status_wq: workqueue handling status stage for deferred requ=
ests.
> + * @shadow_ep_en: hold information about endpoints that will be enabled
> + *     in soft irq.
> + * @pending_status_request: request for which status stage was deferred
> + */
> +struct cdns3_device {
> +	struct device			*dev;
> +	struct device			*sysdev;
> +
> +	struct usb_gadget		gadget;
> +	struct usb_gadget_driver	*gadget_driver;
> +
> +#define CDNS_REVISION_V0		0x00024501
> +#define CDNS_REVISION_V1		0x00024509
> +	u32				dev_ver;
> +
> +	/* generic spin-lock for drivers */
> +	spinlock_t			lock;
> +
> +	struct cdns3_usb_regs		__iomem *regs;
> +
> +	struct usb_ctrlrequest		*setup_buf;
> +	dma_addr_t			setup_dma;
> +	void				*zlp_buf;
> +
> +	u8				ep0_stage;
> +	int				ep0_data_dir;
> +
> +	struct cdns3_endpoint		*eps[CDNS3_ENDPOINTS_MAX_COUNT];
> +
> +	struct list_head		aligned_buf_list;
> +	unsigned			run_garbage_collector:1;
> +
> +	u32				selected_ep;
> +	u16				isoch_delay;
> +
> +	unsigned			wait_for_setup:1;
> +	unsigned			u1_allowed:1;
> +	unsigned			u2_allowed:1;
> +	unsigned			is_selfpowered:1;
> +	unsigned			setup_pending:1;
> +	int				hw_configured_flag:1;
> +	int				wake_up_flag:1;
> +	unsigned			status_completion_no_call:1;
> +	int				out_mem_is_allocated;
> +
> +	struct work_struct		pending_status_wq;
> +	struct usb_request		*pending_status_request;
> +	u32				shadow_ep_en;
> +	/*in KB */
> +	u16				onchip_buffers;
> +	u16				onchip_used_size;
> +};
> +
> +void cdns3_set_register_bit(void __iomem *ptr, u32 mask);
> +dma_addr_t cdns3_trb_virt_to_dma(struct cdns3_endpoint *priv_ep,
> +				 struct cdns3_trb *trb);
> +enum usb_device_speed cdns3_get_speed(struct cdns3_device *priv_dev);
> +void cdns3_pending_setup_status_handler(struct work_struct *work);
> +void cdns3_hw_reset_eps_config(struct cdns3_device *priv_dev);
> +void cdns3_set_hw_configuration(struct cdns3_device *priv_dev);
> +void cdns3_select_ep(struct cdns3_device *priv_dev, u32 ep);
> +void cdns3_allow_enable_l1(struct cdns3_device *priv_dev, int enable);
> +struct usb_request *cdns3_next_request(struct list_head *list);
> +int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
> +			  struct usb_request *request);
> +void cdns3_rearm_transfer(struct cdns3_endpoint *priv_ep, u8 rearm);
> +int cdns3_allocate_trb_pool(struct cdns3_endpoint *priv_ep);
> +u8 cdns3_ep_addr_to_index(u8 ep_addr);
> +int cdns3_gadget_ep_set_wedge(struct usb_ep *ep);
> +int cdns3_gadget_ep_set_halt(struct usb_ep *ep, int value);
> +struct usb_request *cdns3_gadget_ep_alloc_request(struct usb_ep *ep,
> +						  gfp_t gfp_flags);
> +void cdns3_gadget_ep_free_request(struct usb_ep *ep,
> +				  struct usb_request *request);
> +int cdns3_gadget_ep_dequeue(struct usb_ep *ep, struct usb_request *reque=
st);
> +void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
> +			   struct cdns3_request *priv_req,
> +			   int status);
> +
> +int cdns3_init_ep0(struct cdns3_device *priv_dev,
> +		   struct cdns3_endpoint *priv_ep);
> +void cdns3_ep0_config(struct cdns3_device *priv_dev);
> +void cdns3_ep_config(struct cdns3_endpoint *priv_ep);
> +void cdns3_check_ep0_interrupt_proceed(struct cdns3_device *priv_dev, in=
t dir);
> +int __cdns3_gadget_wakeup(struct cdns3_device *priv_dev);
> +
> +#endif /* __LINUX_CDNS3_GADGET */
> diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-exp=
ort.h
> new file mode 100644
> index 000000000000..b498a170b7e8
> --- /dev/null
> +++ b/drivers/usb/cdns3/host-export.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Cadence USBSS DRD Driver - Host Export APIs
> + *
> + * Copyright (C) 2017-2018 NXP
> + *
> + * Authors: Peter Chen <peter.chen@nxp.com>
> + */
> +#ifndef __LINUX_CDNS3_HOST_EXPORT
> +#define __LINUX_CDNS3_HOST_EXPORT
> +
> +#ifdef CONFIG_USB_CDNS3_HOST
> +
> +int cdns3_host_init(struct cdns3 *cdns);
> +void cdns3_host_exit(struct cdns3 *cdns);
> +
> +#else
> +
> +static inline int cdns3_host_init(struct cdns3 *cdns)
> +{
> +	return -ENXIO;
> +}
> +
> +static inline void cdns3_host_exit(struct cdns3 *cdns) { }
> +
> +#endif /* CONFIG_USB_CDNS3_HOST */
> +
> +#endif /* __LINUX_CDNS3_HOST_EXPORT */
> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
> new file mode 100644
> index 000000000000..a7629ab2c20c
> --- /dev/null
> +++ b/drivers/usb/cdns3/host.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cadence USBSS DRD Driver - host side
> + *
> + * Copyright (C) 2018-2019 Cadence Design Systems.
> + * Copyright (C) 2017-2018 NXP
> + *
> + * Authors: Peter Chen <peter.chen@nxp.com>
> + *          Pawel Laszczak <pawell@cadence.com>
> + */
> +
> +#include <linux/platform_device.h>
> +#include "core.h"
> +#include "drd.h"
> +
> +static int __cdns3_host_init(struct cdns3 *cdns)
> +{
> +	struct platform_device *xhci;
> +	int ret;
> +
> +	xhci =3D platform_device_alloc("xhci-hcd", PLATFORM_DEVID_AUTO);
> +	if (!xhci) {
> +		dev_err(cdns->dev, "couldn't allocate xHCI device\n");
> +		return -ENOMEM;
> +	}
> +
> +	xhci->dev.parent =3D cdns->dev;
> +	cdns->host_dev =3D xhci;
> +
> +	ret =3D platform_device_add_resources(xhci, cdns->xhci_res,
> +					    CDNS3_XHCI_RESOURCES_NUM);
> +	if (ret) {
> +		dev_err(cdns->dev, "couldn't add resources to xHCI device\n");
> +		goto err1;
> +	}
> +
> +	ret =3D platform_device_add(xhci);
> +	if (ret) {
> +		dev_err(cdns->dev, "failed to register xHCI device\n");
> +		goto err1;
> +	}
> +
> +	return 0;
> +err1:
> +	platform_device_put(xhci);
> +	return ret;
> +}
> +
> +static void cdns3_host_exit(struct cdns3 *cdns)
> +{
> +	platform_device_unregister(cdns->host_dev);
> +	cdns->host_dev =3D NULL;
> +}
> +
> +int cdns3_host_init(struct cdns3 *cdns)
> +{
> +	struct cdns3_role_driver *rdrv;
> +
> +	rdrv =3D devm_kzalloc(cdns->dev, sizeof(*rdrv), GFP_KERNEL);
> +	if (!rdrv)
> +		return -ENOMEM;
> +
> +	rdrv->start	=3D __cdns3_host_init;
> +	rdrv->stop	=3D cdns3_host_exit;
> +	rdrv->state	=3D CDNS3_ROLE_STATE_INACTIVE;
> +	rdrv->name	=3D "host";
> +
> +	cdns->roles[USB_ROLE_HOST] =3D rdrv;
> +
> +	return 0;
> +}
> diff --git a/drivers/usb/cdns3/trace.c b/drivers/usb/cdns3/trace.c
> new file mode 100644
> index 000000000000..459fa72d9c74
> --- /dev/null
> +++ b/drivers/usb/cdns3/trace.c
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * USBSS device controller driver Trace Support
> + *
> + * Copyright (C) 2018-2019 Cadence.
> + *
> + * Author: Pawel Laszczak <pawell@cadence.com>
> + */
> +
> +#define CREATE_TRACE_POINTS
> +#include "trace.h"
> diff --git a/drivers/usb/cdns3/trace.h b/drivers/usb/cdns3/trace.h
> new file mode 100644
> index 000000000000..725dcfa65f2b
> --- /dev/null
> +++ b/drivers/usb/cdns3/trace.h
> @@ -0,0 +1,493 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * USBSS device controller driver.
> + * Trace support header file.
> + *
> + * Copyright (C) 2018-2019 Cadence.
> + *
> + * Author: Pawel Laszczak <pawell@cadence.com>
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM cdns3
> +
> +#if !defined(__LINUX_CDNS3_TRACE) || defined(TRACE_HEADER_MULTI_READ)
> +#define __LINUX_CDNS3_TRACE
> +
> +#include <linux/types.h>
> +#include <linux/tracepoint.h>
> +#include <asm/byteorder.h>
> +#include <linux/usb/ch9.h>
> +#include "core.h"
> +#include "gadget.h"
> +#include "debug.h"
> +
> +#define CDNS3_MSG_MAX	500
> +
> +TRACE_EVENT(cdns3_halt,
> +	TP_PROTO(struct cdns3_endpoint *ep_priv, u8 halt, u8 flush),
> +	TP_ARGS(ep_priv, halt, flush),
> +	TP_STRUCT__entry(
> +		__string(name, ep_priv->name)
> +		__field(u8, halt)
> +		__field(u8, flush)
> +	),
> +	TP_fast_assign(
> +		__assign_str(name, ep_priv->name);
> +		__entry->halt =3D halt;
> +		__entry->flush =3D flush;
> +	),
> +	TP_printk("Halt %s for %s: %s", __entry->flush ? " and flush" : "",
> +		  __get_str(name), __entry->halt ? "set" : "cleared")
> +);
> +
> +TRACE_EVENT(cdns3_wa1,
> +	TP_PROTO(struct cdns3_endpoint *ep_priv, char *msg),
> +	TP_ARGS(ep_priv, msg),
> +	TP_STRUCT__entry(
> +		__string(ep_name, ep_priv->name)
> +		__string(msg, msg)
> +	),
> +	TP_fast_assign(
> +		__assign_str(ep_name, ep_priv->name);
> +		__assign_str(msg, msg);
> +	),
> +	TP_printk("WA1: %s %s", __get_str(ep_name), __get_str(msg))
> +);
> +
> +TRACE_EVENT(cdns3_wa2,
> +	TP_PROTO(struct cdns3_endpoint *ep_priv, char *msg),
> +	TP_ARGS(ep_priv, msg),
> +	TP_STRUCT__entry(
> +		__string(ep_name, ep_priv->name)
> +		__string(msg, msg)
> +	),
> +	TP_fast_assign(
> +		__assign_str(ep_name, ep_priv->name);
> +		__assign_str(msg, msg);
> +	),
> +	TP_printk("WA2: %s %s", __get_str(ep_name), __get_str(msg))
> +);
> +
> +DECLARE_EVENT_CLASS(cdns3_log_doorbell,
> +	TP_PROTO(const char *ep_name, u32 ep_trbaddr),
> +	TP_ARGS(ep_name, ep_trbaddr),
> +	TP_STRUCT__entry(
> +		__string(name, ep_name)
> +		__field(u32, ep_trbaddr)
> +	),
> +	TP_fast_assign(
> +		__assign_str(name, ep_name);
> +		__entry->ep_trbaddr =3D ep_trbaddr;
> +	),
> +	TP_printk("%s, ep_trbaddr %08x", __get_str(name),
> +		  __entry->ep_trbaddr)
> +);
> +
> +DEFINE_EVENT(cdns3_log_doorbell, cdns3_doorbell_ep0,
> +	TP_PROTO(const char *ep_name, u32 ep_trbaddr),
> +	TP_ARGS(ep_name, ep_trbaddr)
> +);
> +
> +DEFINE_EVENT(cdns3_log_doorbell, cdns3_doorbell_epx,
> +	TP_PROTO(const char *ep_name, u32 ep_trbaddr),
> +	TP_ARGS(ep_name, ep_trbaddr)
> +);
> +
> +DECLARE_EVENT_CLASS(cdns3_log_usb_irq,
> +	TP_PROTO(struct cdns3_device *priv_dev, u32 usb_ists),
> +	TP_ARGS(priv_dev, usb_ists),
> +	TP_STRUCT__entry(
> +		__field(enum usb_device_speed, speed)
> +		__field(u32, usb_ists)
> +		__dynamic_array(char, str, CDNS3_MSG_MAX)
> +	),
> +	TP_fast_assign(
> +		__entry->speed =3D cdns3_get_speed(priv_dev);
> +		__entry->usb_ists =3D usb_ists;
> +	),
> +	TP_printk("%s", cdns3_decode_usb_irq(__get_str(str), __entry->speed,
> +					     __entry->usb_ists))
> +);
> +
> +DEFINE_EVENT(cdns3_log_usb_irq, cdns3_usb_irq,
> +	TP_PROTO(struct cdns3_device *priv_dev, u32 usb_ists),
> +	TP_ARGS(priv_dev, usb_ists)
> +);
> +
> +DECLARE_EVENT_CLASS(cdns3_log_epx_irq,
> +	TP_PROTO(struct cdns3_device *priv_dev, struct cdns3_endpoint *priv_ep)=
,
> +	TP_ARGS(priv_dev, priv_ep),
> +	TP_STRUCT__entry(
> +		__string(ep_name, priv_ep->name)
> +		__field(u32, ep_sts)
> +		__field(u32, ep_traddr)
> +		__dynamic_array(char, str, CDNS3_MSG_MAX)
> +	),
> +	TP_fast_assign(
> +		__assign_str(ep_name, priv_ep->name);
> +		__entry->ep_sts =3D readl(&priv_dev->regs->ep_sts);
> +		__entry->ep_traddr =3D readl(&priv_dev->regs->ep_traddr);
> +	),
> +	TP_printk("%s, ep_traddr: %08x",
> +		  cdns3_decode_epx_irq(__get_str(str),
> +				       __get_str(ep_name),
> +				       __entry->ep_sts),
> +		  __entry->ep_traddr)
> +);
> +
> +DEFINE_EVENT(cdns3_log_epx_irq, cdns3_epx_irq,
> +	TP_PROTO(struct cdns3_device *priv_dev, struct cdns3_endpoint *priv_ep)=
,
> +	TP_ARGS(priv_dev, priv_ep)
> +);
> +
> +DECLARE_EVENT_CLASS(cdns3_log_ep0_irq,
> +	TP_PROTO(struct cdns3_device *priv_dev,  u32 ep_sts),
> +	TP_ARGS(priv_dev, ep_sts),
> +	TP_STRUCT__entry(
> +		__field(int, ep_dir)
> +		__field(u32, ep_sts)
> +		__dynamic_array(char, str, CDNS3_MSG_MAX)
> +	),
> +	TP_fast_assign(
> +		__entry->ep_dir =3D priv_dev->ep0_data_dir;
> +		__entry->ep_sts =3D ep_sts;
> +	),
> +	TP_printk("%s", cdns3_decode_ep0_irq(__get_str(str),
> +					     __entry->ep_dir,
> +					     __entry->ep_sts))
> +);
> +
> +DEFINE_EVENT(cdns3_log_ep0_irq, cdns3_ep0_irq,
> +	TP_PROTO(struct cdns3_device *priv_dev, u32 ep_sts),
> +	TP_ARGS(priv_dev, ep_sts)
> +);
> +
> +DECLARE_EVENT_CLASS(cdns3_log_ctrl,
> +	TP_PROTO(struct usb_ctrlrequest *ctrl),
> +	TP_ARGS(ctrl),
> +	TP_STRUCT__entry(
> +		__field(u8, bRequestType)
> +		__field(u8, bRequest)
> +		__field(u16, wValue)
> +		__field(u16, wIndex)
> +		__field(u16, wLength)
> +		__dynamic_array(char, str, CDNS3_MSG_MAX)
> +	),
> +	TP_fast_assign(
> +		__entry->bRequestType =3D ctrl->bRequestType;
> +		__entry->bRequest =3D ctrl->bRequest;
> +		__entry->wValue =3D le16_to_cpu(ctrl->wValue);
> +		__entry->wIndex =3D le16_to_cpu(ctrl->wIndex);
> +		__entry->wLength =3D le16_to_cpu(ctrl->wLength);
> +	),
> +	TP_printk("%s", usb_decode_ctrl(__get_str(str), CDNS3_MSG_MAX,
> +					__entry->bRequestType,
> +					__entry->bRequest, __entry->wValue,
> +					__entry->wIndex, __entry->wLength)
> +	)
> +);
> +
> +DEFINE_EVENT(cdns3_log_ctrl, cdns3_ctrl_req,
> +	TP_PROTO(struct usb_ctrlrequest *ctrl),
> +	TP_ARGS(ctrl)
> +);
> +
> +DECLARE_EVENT_CLASS(cdns3_log_request,
> +	TP_PROTO(struct cdns3_request *req),
> +	TP_ARGS(req),
> +	TP_STRUCT__entry(
> +		__string(name, req->priv_ep->name)
> +		__field(struct cdns3_request *, req)
> +		__field(void *, buf)
> +		__field(unsigned int, actual)
> +		__field(unsigned int, length)
> +		__field(int, status)
> +		__field(int, zero)
> +		__field(int, short_not_ok)
> +		__field(int, no_interrupt)
> +		__field(int, start_trb)
> +		__field(int, end_trb)
> +		__field(struct cdns3_trb *, start_trb_addr)
> +		__field(int, flags)
> +	),
> +	TP_fast_assign(
> +		__assign_str(name, req->priv_ep->name);
> +		__entry->req =3D req;
> +		__entry->buf =3D req->request.buf;
> +		__entry->actual =3D req->request.actual;
> +		__entry->length =3D req->request.length;
> +		__entry->status =3D req->request.status;
> +		__entry->zero =3D req->request.zero;
> +		__entry->short_not_ok =3D req->request.short_not_ok;
> +		__entry->no_interrupt =3D req->request.no_interrupt;
> +		__entry->start_trb =3D req->start_trb;
> +		__entry->end_trb =3D req->end_trb;
> +		__entry->start_trb_addr =3D req->trb;
> +		__entry->flags =3D req->flags;
> +	),
> +	TP_printk("%s: req: %p, req buff %p, length: %u/%u %s%s%s, status: %d,"
> +		  " trb: [start:%d, end:%d: virt addr %pa], flags:%x ",
> +		__get_str(name), __entry->req, __entry->buf, __entry->actual,
> +		__entry->length,
> +		__entry->zero ? "Z" : "z",
> +		__entry->short_not_ok ? "S" : "s",
> +		__entry->no_interrupt ? "I" : "i",
> +		__entry->status,
> +		__entry->start_trb,
> +		__entry->end_trb,
> +		__entry->start_trb_addr,
> +		__entry->flags
> +	)
> +);
> +
> +DEFINE_EVENT(cdns3_log_request, cdns3_alloc_request,
> +	TP_PROTO(struct cdns3_request *req),
> +	TP_ARGS(req)
> +);
> +
> +DEFINE_EVENT(cdns3_log_request, cdns3_free_request,
> +	TP_PROTO(struct cdns3_request *req),
> +	TP_ARGS(req)
> +);
> +
> +DEFINE_EVENT(cdns3_log_request, cdns3_ep_queue,
> +	TP_PROTO(struct cdns3_request *req),
> +	TP_ARGS(req)
> +);
> +
> +DEFINE_EVENT(cdns3_log_request, cdns3_ep_dequeue,
> +	TP_PROTO(struct cdns3_request *req),
> +	TP_ARGS(req)
> +);
> +
> +DEFINE_EVENT(cdns3_log_request, cdns3_gadget_giveback,
> +	TP_PROTO(struct cdns3_request *req),
> +	TP_ARGS(req)
> +);
> +
> +TRACE_EVENT(cdns3_ep0_queue,
> +	TP_PROTO(struct cdns3_device *dev_priv, struct usb_request *request),
> +	TP_ARGS(dev_priv, request),
> +	TP_STRUCT__entry(
> +		__field(int, dir)
> +		__field(int, length)
> +	),
> +	TP_fast_assign(
> +		__entry->dir =3D dev_priv->ep0_data_dir;
> +		__entry->length =3D request->length;
> +	),
> +	TP_printk("Queue to ep0%s length: %u", __entry->dir ? "in" : "out",
> +		  __entry->length)
> +);
> +
> +DECLARE_EVENT_CLASS(cdns3_log_aligned_request,
> +	TP_PROTO(struct cdns3_request *priv_req),
> +	TP_ARGS(priv_req),
> +	TP_STRUCT__entry(
> +		__string(name, priv_req->priv_ep->name)
> +		__field(struct usb_request *, req)
> +		__field(void *, buf)
> +		__field(dma_addr_t, dma)
> +		__field(void *, aligned_buf)
> +		__field(dma_addr_t, aligned_dma)
> +		__field(u32, aligned_buf_size)
> +	),
> +	TP_fast_assign(
> +		__assign_str(name, priv_req->priv_ep->name);
> +		__entry->req =3D &priv_req->request;
> +		__entry->buf =3D priv_req->request.buf;
> +		__entry->dma =3D priv_req->request.dma;
> +		__entry->aligned_buf =3D priv_req->aligned_buf->buf;
> +		__entry->aligned_dma =3D priv_req->aligned_buf->dma;
> +		__entry->aligned_buf_size =3D priv_req->aligned_buf->size;
> +	),
> +	TP_printk("%s: req: %p, req buf %p, dma %pad a_buf %p a_dma %pad, size =
%d",
> +		__get_str(name), __entry->req, __entry->buf, &__entry->dma,
> +		__entry->aligned_buf, &__entry->aligned_dma,
> +		__entry->aligned_buf_size
> +	)
> +);
> +
> +DEFINE_EVENT(cdns3_log_aligned_request, cdns3_free_aligned_request,
> +	TP_PROTO(struct cdns3_request *req),
> +	TP_ARGS(req)
> +);
> +
> +DEFINE_EVENT(cdns3_log_aligned_request, cdns3_prepare_aligned_request,
> +	TP_PROTO(struct cdns3_request *req),
> +	TP_ARGS(req)
> +);
> +
> +DECLARE_EVENT_CLASS(cdns3_log_trb,
> +	TP_PROTO(struct cdns3_endpoint *priv_ep, struct cdns3_trb *trb),
> +	TP_ARGS(priv_ep, trb),
> +	TP_STRUCT__entry(
> +		__string(name, priv_ep->name)
> +		__field(struct cdns3_trb *, trb)
> +		__field(u32, buffer)
> +		__field(u32, length)
> +		__field(u32, control)
> +		__field(u32, type)
> +	),
> +	TP_fast_assign(
> +		__assign_str(name, priv_ep->name);
> +		__entry->trb =3D trb;
> +		__entry->buffer =3D trb->buffer;
> +		__entry->length =3D trb->length;
> +		__entry->control =3D trb->control;
> +		__entry->type =3D usb_endpoint_type(priv_ep->endpoint.desc);
> +	),
> +	TP_printk("%s: trb %p, dma buf: 0x%08x, size: %ld, burst: %d ctrl: 0x%0=
8x (%s%s%s%s%s%s%s)",
> +		__get_str(name), __entry->trb, __entry->buffer,
> +		TRB_LEN(__entry->length),
> +		(u8)TRB_BURST_LEN_GET(__entry->length),
> +		__entry->control,
> +		__entry->control & TRB_CYCLE ? "C=3D1, " : "C=3D0, ",
> +		__entry->control & TRB_TOGGLE ? "T=3D1, " : "T=3D0, ",
> +		__entry->control & TRB_ISP ? "ISP, " : "",
> +		__entry->control & TRB_FIFO_MODE ? "FIFO, " : "",
> +		__entry->control & TRB_CHAIN ? "CHAIN, " : "",
> +		__entry->control & TRB_IOC ? "IOC, " : "",
> +		TRB_FIELD_TO_TYPE(__entry->control) =3D=3D TRB_NORMAL ? "Normal" : "LI=
NK"
> +	)
> +);
> +
> +DEFINE_EVENT(cdns3_log_trb, cdns3_prepare_trb,
> +	TP_PROTO(struct cdns3_endpoint *priv_ep, struct cdns3_trb *trb),
> +	TP_ARGS(priv_ep, trb)
> +);
> +
> +DEFINE_EVENT(cdns3_log_trb, cdns3_complete_trb,
> +	TP_PROTO(struct cdns3_endpoint *priv_ep, struct cdns3_trb *trb),
> +	TP_ARGS(priv_ep, trb)
> +);
> +
> +DECLARE_EVENT_CLASS(cdns3_log_ring,
> +	TP_PROTO(struct cdns3_endpoint *priv_ep),
> +	TP_ARGS(priv_ep),
> +	TP_STRUCT__entry(
> +		__dynamic_array(u8, ring, TRB_RING_SIZE)
> +		__dynamic_array(u8, priv_ep, sizeof(struct cdns3_endpoint))
> +		__dynamic_array(char, buffer,
> +				(TRBS_PER_SEGMENT * 65) + CDNS3_MSG_MAX)
> +	),
> +	TP_fast_assign(
> +		memcpy(__get_dynamic_array(priv_ep), priv_ep,
> +		       sizeof(struct cdns3_endpoint));
> +		memcpy(__get_dynamic_array(ring), priv_ep->trb_pool,
> +		       TRB_RING_SIZE);
> +	),
> +
> +	TP_printk("%s",
> +		  cdns3_dbg_ring((struct cdns3_endpoint *)__get_str(priv_ep),
> +				 (struct cdns3_trb *)__get_str(ring),
> +				 __get_str(buffer)))
> +);
> +
> +DEFINE_EVENT(cdns3_log_ring, cdns3_ring,
> +	TP_PROTO(struct cdns3_endpoint *priv_ep),
> +	TP_ARGS(priv_ep)
> +);
> +
> +DECLARE_EVENT_CLASS(cdns3_log_ep,
> +	TP_PROTO(struct cdns3_endpoint *priv_ep),
> +	TP_ARGS(priv_ep),
> +	TP_STRUCT__entry(
> +		__string(name, priv_ep->name)
> +		__field(unsigned int, maxpacket)
> +		__field(unsigned int, maxpacket_limit)
> +		__field(unsigned int, max_streams)
> +		__field(unsigned int, maxburst)
> +		__field(unsigned int, flags)
> +		__field(unsigned int, dir)
> +		__field(u8, enqueue)
> +		__field(u8, dequeue)
> +	),
> +	TP_fast_assign(
> +		__assign_str(name, priv_ep->name);
> +		__entry->maxpacket =3D priv_ep->endpoint.maxpacket;
> +		__entry->maxpacket_limit =3D priv_ep->endpoint.maxpacket_limit;
> +		__entry->max_streams =3D priv_ep->endpoint.max_streams;
> +		__entry->maxburst =3D priv_ep->endpoint.maxburst;
> +		__entry->flags =3D priv_ep->flags;
> +		__entry->dir =3D priv_ep->dir;
> +		__entry->enqueue =3D priv_ep->enqueue;
> +		__entry->dequeue =3D priv_ep->dequeue;
> +	),
> +	TP_printk("%s: mps: %d/%d. streams: %d, burst: %d, enq idx: %d, "
> +		  "deq idx: %d, flags %s%s%s%s%s%s%s%s, dir: %s",
> +		__get_str(name), __entry->maxpacket,
> +		__entry->maxpacket_limit, __entry->max_streams,
> +		__entry->maxburst, __entry->enqueue,
> +		__entry->dequeue,
> +		__entry->flags & EP_ENABLED ? "EN | " : "",
> +		__entry->flags & EP_STALL ? "STALL | " : "",
> +		__entry->flags & EP_WEDGE ? "WEDGE | " : "",
> +		__entry->flags & EP_TRANSFER_STARTED ? "STARTED | " : "",
> +		__entry->flags & EP_UPDATE_EP_TRBADDR ? "UPD TRB | " : "",
> +		__entry->flags & EP_PENDING_REQUEST ? "REQ PEN | " : "",
> +		__entry->flags & EP_RING_FULL ? "RING FULL |" : "",
> +		__entry->flags & EP_CLAIMED ?  "CLAIMED " : "",
> +		__entry->dir ? "IN" : "OUT"
> +	)
> +);
> +
> +DEFINE_EVENT(cdns3_log_ep, cdns3_gadget_ep_enable,
> +	TP_PROTO(struct cdns3_endpoint *priv_ep),
> +	TP_ARGS(priv_ep)
> +);
> +
> +DEFINE_EVENT(cdns3_log_ep, cdns3_gadget_ep_disable,
> +	TP_PROTO(struct cdns3_endpoint *priv_ep),
> +	TP_ARGS(priv_ep)
> +);
> +
> +DECLARE_EVENT_CLASS(cdns3_log_request_handled,
> +	TP_PROTO(struct cdns3_request *priv_req, int current_index,
> +		 int handled),
> +	TP_ARGS(priv_req, current_index, handled),
> +	TP_STRUCT__entry(
> +		__field(struct cdns3_request *, priv_req)
> +		__field(unsigned int, dma_position)
> +		__field(unsigned int, handled)
> +		__field(unsigned int, dequeue_idx)
> +		__field(unsigned int, enqueue_idx)
> +		__field(unsigned int, start_trb)
> +		__field(unsigned int, end_trb)
> +	),
> +	TP_fast_assign(
> +		__entry->priv_req =3D priv_req;
> +		__entry->dma_position =3D current_index;
> +		__entry->handled =3D handled;
> +		__entry->dequeue_idx =3D priv_req->priv_ep->dequeue;
> +		__entry->enqueue_idx =3D priv_req->priv_ep->enqueue;
> +		__entry->start_trb =3D priv_req->start_trb;
> +		__entry->end_trb =3D priv_req->end_trb;
> +	),
> +	TP_printk("Req: %p %s, DMA pos: %d, ep deq: %d, ep enq: %d,"
> +		  " start trb: %d, end trb: %d",
> +		__entry->priv_req,
> +		__entry->handled ? "handled" : "not handled",
> +		__entry->dma_position, __entry->dequeue_idx,
> +		__entry->enqueue_idx, __entry->start_trb,
> +		__entry->end_trb
> +	)
> +);
> +
> +DEFINE_EVENT(cdns3_log_request_handled, cdns3_request_handled,
> +	TP_PROTO(struct cdns3_request *priv_req, int current_index,
> +		 int handled),
> +	TP_ARGS(priv_req, current_index, handled)
> +);
> +#endif /* __LINUX_CDNS3_TRACE */
> +
> +/* this part must be outside header guard */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE trace
> +
> +#include <trace/define_trace.h>
> --=20
> 2.17.1
> =
