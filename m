Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 241DEB48B9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 10:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731396AbfIQIDo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 04:03:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:45842 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728049AbfIQIDo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Sep 2019 04:03:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6F29CAF93;
        Tue, 17 Sep 2019 08:03:41 +0000 (UTC)
Message-ID: <1568707419.23075.2.camel@suse.com>
Subject: Re: [RFC PATCH 1/1] USB: myriad-ma24xx-vsc: Firmware loader driver
 for USB Myriad ma24xx
From:   Oliver Neukum <oneukum@suse.com>
To:     Rhys Kidd <rhyskidd@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Johan Hovold <johan@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-accelerators@lists.ozlabs.org,
        Alexander Shiyan <shc_work@mail.ru>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-usb@vger.kernel.org
Date:   Tue, 17 Sep 2019 10:03:39 +0200
In-Reply-To: <20190916110341.1310-2-rhyskidd@gmail.com>
References: <20190916110341.1310-1-rhyskidd@gmail.com>
         <20190916110341.1310-2-rhyskidd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 16.09.2019, 21:03 +1000 schrieb Rhys Kidd:
> The Myriad ma24xx in USB Intel Neural Compute Stick and Intel Neural
> Compute Stick 2 provides an API to accelerate AI inference calculations
> on the dedicated SHAVE VLIW vector co-processors, which are orchestrated
> by one or more LEON SPARC v8 real time cores.
> 
> However, they need firmware to be loaded beforehand. An uninitialised
> Myriad ma24xx presents with a distinctive USB ID. After firmware
> loading, the device detaches from the USB bus and reattaches with a new
> device ID. It can then be claimed by the usermode driver.

Why are you using a kernel space driver for this?

> Signed-off-by: Rhys Kidd <rhyskidd@gmail.com>
> ---
>  MAINTAINERS                          |   6 +
>  drivers/usb/misc/Kconfig             |   8 ++
>  drivers/usb/misc/Makefile            |   1 +
>  drivers/usb/misc/myriad-ma24xx-vsc.c | 171 +++++++++++++++++++++++++++
>  4 files changed, 186 insertions(+)
>  create mode 100644 drivers/usb/misc/myriad-ma24xx-vsc.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a50e97a63bc8..2c3ab39ac26a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16682,6 +16682,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>  S:	Maintained
>  F:	sound/usb/midi.*
>  
> +USB MYRIAD MA24XX FIRMWARE DRIVER
> +M:	Rhys Kidd <rhyskidd@gmail.com>
> +L:	linux-usb@vger.kernel.org
> +S:	Maintained
> +F:	drivers/usb/misc/myriad-ma24xx-vsc.c
> +
>  USB NETWORKING DRIVERS
>  L:	linux-usb@vger.kernel.org
>  S:	Odd Fixes
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index bdae62b2ffe0..5d600fb8ac50 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -275,3 +275,11 @@ config USB_CHAOSKEY
>  
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called chaoskey.
> +
> +config USB_MYRIAD_MA24XX_VSC
> +	tristate "USB Intel Myriad MA24xx firmware loading support"
> +	select FW_LOADER
> +	help
> +	  This driver loads firmware for Myriad ma24xx AI inference accelerators, as
> +	  found in the USB Intel Neural Compute Stick (ma2450) and Intel Neural
> +	  Compute Stick 2 (ma2485).
> \ No newline at end of file
> diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
> index 109f54f5b9aa..e19d1348c5b6 100644
> --- a/drivers/usb/misc/Makefile
> +++ b/drivers/usb/misc/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_USB_ISIGHTFW)		+= isight_firmware.o
>  obj-$(CONFIG_USB_LCD)			+= usblcd.o
>  obj-$(CONFIG_USB_LD)			+= ldusb.o
>  obj-$(CONFIG_USB_LEGOTOWER)		+= legousbtower.o
> +obj-$(CONFIG_USB_MYRIAD_MA24XX_VSC)    += myriad-ma24xx-vsc.o
>  obj-$(CONFIG_USB_RIO500)		+= rio500.o
>  obj-$(CONFIG_USB_TEST)			+= usbtest.o
>  obj-$(CONFIG_USB_EHSET_TEST_FIXTURE)    += ehset.o
> diff --git a/drivers/usb/misc/myriad-ma24xx-vsc.c b/drivers/usb/misc/myriad-ma24xx-vsc.c
> new file mode 100644
> index 000000000000..f516c236a8f5
> --- /dev/null
> +++ b/drivers/usb/misc/myriad-ma24xx-vsc.c
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for loading USB Myriad ma24xx firmware
> + *
> + * Copyright (C) 2018 Rhys Kidd <rhyskidd@gmail.com>
> + *
> + * The Myriad ma24xx in USB Intel Neural Compute Stick and Intel Neural
> + * Compute Stick 2 provides an API to accelerate AI inference calculations
> + * on the dedicated SHAVE VLIW vector co-processors, which are orchestrated
> + * by one or more LEON SPARC v8 real time cores.
> + *
> + * However, they need firmware to be loaded beforehand. An uninitialised
> + * Myriad ma24xx presents with a distinctive USB ID. After firmware
> + * loading, the device detaches from the USB bus and reattaches with a new
> + * device ID. It can then be claimed by the usermode driver.
> + *
> + * The firmware is non-free and must be extracted by the user.
> + */
> +
> +/* Standard include files */
> +#include <linux/errno.h>
> +#include <linux/firmware.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +
> +#define usb_dbg(usb_if, format, arg...) \
> +	dev_dbg(&(usb_if)->dev, format, ## arg)
> +
> +#define usb_err(usb_if, format, arg...) \
> +	dev_err(&(usb_if)->dev, format, ## arg)

Why?

> +/* Version Information */
> +#define DRIVER_AUTHOR "Rhys Kidd <rhyskidd@gmail.com>"
> +#define DRIVER_DESC   "Driver for loading USB Myriad ma24xx firmware"
> +#define DRIVER_SHORT  "myriad_ma24xx_vsc"
> +
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL");
> +
> +#define FW_DIR "myriad/"
> +#define MA2450_FIRMWARE FW_DIR "mvncapi-2450.mvcmd"
> +#define MA2480_FIRMWARE FW_DIR "mvncapi-2480.mvcmd"
> +
> +MODULE_FIRMWARE(MA2450_FIRMWARE);
> +MODULE_FIRMWARE(MA2480_FIRMWARE);
> +
> +enum {
> +	MA2450FW = 0,
> +	MA2480FW
> +};
> +
> +/* macros for struct usb_device_id */
> +#define MYRIAD_CHIP_VERSION(x) \
> +	((x)->driver_info & 0xf)
> +
> +#define MYRIAD_VID  0x03e7   /* Movidius Ltd, an Intel company */
> +#define MA2450_PID  0x2150   /* ma2450 VSC loopback device, without fw */
> +#define MA2485_PID  0x2485   /* ma2485 VSC loopback device, without fw */
> +
> +#define MYRIAD_BUF_LEN 512   /* max size of USB_SPEED_HIGH packet */
> +#define WRITE_TIMEOUT  2000  /* milliseconds */
> +
> +static const struct usb_device_id id_table[] = {
> +	{ USB_DEVICE(MYRIAD_VID, MA2450_PID), .driver_info = MA2450FW },
> +	{ USB_DEVICE(MYRIAD_VID, MA2485_PID), .driver_info = MA2480FW },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(usb, id_table);
> +
> +static int myriad_ma24xx_vsc_probe(struct usb_interface *intf,
> +				    const struct usb_device_id *id)
> +{
> +	struct usb_device *dev = interface_to_usbdev(intf);
> +	struct usb_host_interface *altsetting = intf->cur_altsetting;
> +	struct usb_endpoint_descriptor *epd;
> +	int out_ep, res, size;
> +	const struct firmware *firmware = NULL;
> +	const u8 *ptr;
> +	int offset, ret = 0;
> +	char *buf;
> +	char *fw_family_name;
> +
> +	usb_dbg(intf, "probe %s-%s", dev->product, dev->serial);
> +
> +	/* Find the first bulk OUT endpoint and its packet size */
> +	res = usb_find_bulk_out_endpoint(altsetting, &epd);
> +	if (res) {
> +		usb_err(intf, "no OUT endpoint found");
> +		return res;
> +	}
> +
> +	out_ep = usb_endpoint_num(epd);
> +	size = usb_endpoint_maxp(epd);
> +
> +	/* Validate endpoint and size */
> +	if (size <= 0) {
> +		usb_err(intf, "invalid size (%d)", size);
> +		return -ENODEV;
> +	}
> +
> +	if (size > MYRIAD_BUF_LEN) {
> +		usb_dbg(intf, "size reduced %d -> %d\n", size, MYRIAD_BUF_LEN);
> +		size = MYRIAD_BUF_LEN;
> +	}
> +
> +	buf = kmalloc(size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	switch (MYRIAD_CHIP_VERSION(id)) {
> +	case MA2450FW:
> +		fw_family_name = MA2450_FIRMWARE;
> +		break;
> +	case MA2480FW:
> +		fw_family_name = MA2480_FIRMWARE;
> +		break;
> +	default:
> +		usb_err(intf, "unsupported myriad ma24xx firmware family\n");
> +		return -ENODEV;

Memory leak

	Regards
		Oliver

