Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDC755E01C
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237362AbiF0O2i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 10:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237312AbiF0O2h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 10:28:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB28B53;
        Mon, 27 Jun 2022 07:28:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DAC5461509;
        Mon, 27 Jun 2022 14:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F2AC3411D;
        Mon, 27 Jun 2022 14:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656340115;
        bh=EPvzEU9RXeJLCmVaTekleozBfg0QKTLFW3fDooa3hhA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fRolzTCbCuWTobTtwVCLecREgIDMkOUl8VsbMvSGucJxGVHDNU8Jfxu+fsCXH9fTz
         A22KSiyA3bnwIcZbjybgrGDH65QGOBrr+BshNa1XA9rF94tnK2c4Hkf69M4AsTmHZy
         SSD85+NJ177p/Km2SyOVcLZQJt1BTXFsirNFgS14=
Date:   Mon, 27 Jun 2022 16:28:32 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     frank zago <frank@zago.net>, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 1/4] mfd: ch341: add core driver for the WCH CH341 in
 I2C/SPI/GPIO mode
Message-ID: <Yrm+kH6NvTy5A9WO@kroah.com>
References: <20220616013747.126051-1-frank@zago.net>
 <20220616013747.126051-2-frank@zago.net>
 <Yrm48AYxkmoUgdwr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yrm48AYxkmoUgdwr@google.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 27, 2022 at 03:04:32PM +0100, Lee Jones wrote:
> USB review please.
> 
> > The CH341 is a multifunction chip, presenting 3 different USB PID. One
> > 
> > of these functions is for I2C/SPI/GPIO. This new set of drivers will
> > manage I2C and GPIO.
> > 
> > Signed-off-by: frank zago <frank@zago.net>
> > ---
> >  MAINTAINERS               |  7 +++
> >  drivers/mfd/Kconfig       | 10 +++++
> >  drivers/mfd/Makefile      |  1 +
> >  drivers/mfd/ch341-core.c  | 90 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/ch341.h | 18 ++++++++
> >  5 files changed, 126 insertions(+)
> >  create mode 100644 drivers/mfd/ch341-core.c
> >  create mode 100644 include/linux/mfd/ch341.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 43d3d07afccd..628eeaa9bf68 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -21475,6 +21475,13 @@ M:	David H�rdeman <david@hardeman.nu>
> >  S:	Maintained
> >  F:	drivers/media/rc/winbond-cir.c
> >  
> > +WINCHIPHEAD CH341 I2C/GPIO MFD DRIVER
> > +M:	Frank Zago <frank@zago.net>
> > +L:	linux-usb@vger.kernel.org
> > +S:	Maintained
> > +F:	drivers/mfd/ch341-core.c
> > +F:	include/linux/mfd/ch341.h
> > +
> >  WINSYSTEMS EBC-C384 WATCHDOG DRIVER
> >  M:	William Breathitt Gray <vilhelm.gray@gmail.com>
> >  L:	linux-watchdog@vger.kernel.org
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 3b59456f5545..893acc821a42 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1784,6 +1784,16 @@ config MFD_LOCHNAGAR
> >  	help
> >  	  Support for Cirrus Logic Lochnagar audio development board.
> >  
> > +config MFD_CH341
> > +	tristate "WinChipHead CH341 in I2C/SPI/GPIO mode"
> > +	depends on USB
> > +	help
> > +	  If you say yes to this option, support for the CH341 series
> > +	  of chips, running in I2C/SPI/GPIO mode will be included.
> > +
> > +	  This driver can also be built as a module.  If so, the
> > +	  module will be called ch341-core.
> > +
> >  config MFD_ARIZONA
> >  	select REGMAP
> >  	select REGMAP_IRQ
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 858cacf659d6..fd615ab3929f 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -13,6 +13,7 @@ obj-$(CONFIG_MFD_ASIC3)		+= asic3.o tmio_core.o
> >  obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
> >  obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
> >  obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
> > +obj-$(CONFIG_MFD_CH341)		+= ch341-core.o
> >  obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
> >  obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
> >  obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
> > diff --git a/drivers/mfd/ch341-core.c b/drivers/mfd/ch341-core.c
> > new file mode 100644
> > index 000000000000..f08a67dd6074
> > --- /dev/null
> > +++ b/drivers/mfd/ch341-core.c
> > @@ -0,0 +1,90 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Core driver for the CH341A, CH341B and CH341T in I2C/SPI/GPIO
> > + * mode. There are cell drivers available for I2C and GPIO. SPI is not
> > + * yet supported.
> > + *
> > + * Copyright 2022, Frank Zago
> > + * Copyright (c) 2017 Gunar Schorcht (gunar@schorcht.net)
> > + * Copyright (c) 2016 Tse Lun Bien
> > + * Copyright (c) 2014 Marco Gittler
> > + * Copyright (c) 2006-2007 Till Harbaum (Till@Harbaum.org)
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/ch341.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/usb.h>
> > +
> > +static const struct mfd_cell ch341_devs[] = {
> > +	{
> > +		.name = "ch341-gpio",
> > +	},
> > +	{
> > +		.name = "ch341-i2c",
> > +	},
> > +};
> > +
> > +static int ch341_usb_probe(struct usb_interface *iface,
> > +			   const struct usb_device_id *usb_id)
> > +{
> > +	struct usb_endpoint_descriptor *bulk_out;
> > +	struct usb_endpoint_descriptor *bulk_in;
> > +	struct usb_endpoint_descriptor *intr_in;
> > +	struct ch341_ddata *ddata;
> > +	int ret;
> > +
> > +	ddata = devm_kzalloc(&iface->dev, sizeof(*ddata), GFP_KERNEL);
> > +	if (!ddata)
> > +		return -ENOMEM;
> > +
> > +	ddata->usb_dev = interface_to_usbdev(iface);
> > +	mutex_init(&ddata->usb_lock);
> > +
> > +	ret = usb_find_common_endpoints(iface->cur_altsetting, &bulk_in,
> > +					&bulk_out, &intr_in, NULL);
> > +	if (ret) {
> > +		dev_err(&iface->dev, "Could not find all endpoints\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	ddata->ep_in = bulk_in->bEndpointAddress;
> > +	ddata->ep_out = bulk_out->bEndpointAddress;
> > +	ddata->ep_intr = intr_in->bEndpointAddress;
> > +	ddata->ep_intr_interval = intr_in->bInterval;
> > +
> > +	usb_set_intfdata(iface, ddata);
> > +
> > +	ret = mfd_add_devices(&iface->dev, PLATFORM_DEVID_AUTO, ch341_devs,
> > +			      ARRAY_SIZE(ch341_devs), NULL, 0, NULL);
> > +	if (ret)
> > +		return dev_err_probe(&iface->dev, ret,
> > +				     "Failed to register child devices\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static void ch341_usb_disconnect(struct usb_interface *usb_if)
> > +{
> > +	mfd_remove_devices(&usb_if->dev);
> > +}
> > +
> > +static const struct usb_device_id ch341_usb_table[] = {
> > +	{ USB_DEVICE(0x1a86, 0x5512) },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(usb, ch341_usb_table);
> > +
> > +static struct usb_driver ch341_usb_driver = {
> > +	.name       = "ch341-mfd",
> > +	.id_table   = ch341_usb_table,
> > +	.probe      = ch341_usb_probe,
> > +	.disconnect = ch341_usb_disconnect,
> > +};
> > +module_usb_driver(ch341_usb_driver);
> > +
> > +MODULE_AUTHOR("Frank Zago <frank@zago.net>");
> > +MODULE_DESCRIPTION("CH341 USB to I2C/SPI/GPIO adapter");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mfd/ch341.h b/include/linux/mfd/ch341.h
> > new file mode 100644
> > index 000000000000..44f5da0720bd
> > --- /dev/null
> > +++ b/include/linux/mfd/ch341.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/* Definitions for the CH341 driver */
> > +
> > +#include <linux/mutex.h>
> > +#include <linux/types.h>
> > +
> > +struct usb_device;
> > +struct usb_interface;
> > +
> > +struct ch341_ddata {
> > +	struct usb_device *usb_dev;
> > +	struct mutex usb_lock;
> > +
> > +	int ep_in;
> > +	int ep_out;
> > +	int ep_intr;
> > +	u8 ep_intr_interval;
> > +};


Looks sane enough, but doesn't actually do any USB data transfers, maybe
that happens somewhere else...

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
