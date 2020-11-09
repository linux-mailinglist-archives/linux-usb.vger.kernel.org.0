Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8892AB285
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 09:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgKIIg2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 03:36:28 -0500
Received: from mga09.intel.com ([134.134.136.24]:62281 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727077AbgKIIg1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 03:36:27 -0500
IronPort-SDR: QCg9wn3MORsCwnsiivEwqPE+ZE2d2RivkJ1P9Ao6zixGMaV5ylsf0lFLk6yPpPf0l+oOhsdO8m
 mUKy6qOkiIpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="169921211"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="169921211"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 00:36:27 -0800
IronPort-SDR: zx4YSIYa8thRb83kzAa13sKwRcdsFQjANxj3PF8wk2W0iRn/8v9eq41tTfmyDKcnKliDb1LMhW
 n5Fh/7qXGwuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="427921962"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Nov 2020 00:36:22 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 09 Nov 2020 10:36:22 +0200
Date:   Mon, 9 Nov 2020 10:36:21 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, rafael@kernel.org, gregkh@linuxfoundation.org,
        andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        lee.jones@linaro.org, mika.westerberg@linux.intel.com,
        dmitry.torokhov@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: Re: [PATCH v5 4/4] usb: typec: mux: add typec switch simple driver
Message-ID: <20201109083621.GJ4062920@kuha.fi.intel.com>
References: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
 <1604403610-16577-4-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604403610-16577-4-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 03, 2020 at 07:40:10PM +0800, Li Jun wrote:
> This patch adds a simple typec switch driver for cases which only
> needs some simple operations but a dedicated driver is required,
> current driver only supports GPIO toggle to switch the super speed
> active channel according to typec orientation.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes for v5:
> - A few changes address Andy's comment, remove gpio check as it's
>   optional, add module name for Kconfig, use correct header files,
>   and other minor changes.
> - Remove the mutex lock as it's not required currently.
> 
> Changes for v4:
> - Change driver name to be switch simple from switch GPIO, to make it
>   generic for possible extention.
> - Use compatiable "typec-orientation-switch" instead of bool property
>   for switch matching.
> - Make acitve channel selection GPIO to be optional.
> - Remove Andy's R-b tag since the driver changes a lot.
> 
> Change for v3:
> - Remove file name in driver description.
> - Add Andy Shevchenko's Reviewed-by tag.
> 
> Changes for v2:
> - Use the correct head files for gpio api and of_device_id:
>   #include <linux/gpio/consumer.h>
>   #include <linux/mod_devicetable.h>
> - Add driver dependency on GPIOLIB
> 
>  drivers/usb/typec/mux/Kconfig         |  10 ++++
>  drivers/usb/typec/mux/Makefile        |   1 +
>  drivers/usb/typec/mux/switch-simple.c | 100 ++++++++++++++++++++++++++++++++++
>  3 files changed, 111 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index a4dbd11..11320d7 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -18,4 +18,14 @@ config TYPEC_MUX_INTEL_PMC
>  	  control the USB role switch and also the multiplexer/demultiplexer
>  	  switches used with USB Type-C Alternate Modes.
>  
> +config TYPEC_SWITCH_SIMPLE
> +	tristate "Type-C orientation switch simple driver"
> +	depends on GPIOLIB
> +	help
> +	  Say Y or M if your system need a simple driver for typec switch
> +	  control, like use GPIO to select active channel.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called switch-simple.
> +
>  endmenu
> diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
> index 280a6f5..712d0ad 100644
> --- a/drivers/usb/typec/mux/Makefile
> +++ b/drivers/usb/typec/mux/Makefile
> @@ -2,3 +2,4 @@
>  
>  obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
>  obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
> +obj-$(CONFIG_TYPEC_SWITCH_SIMPLE)	+= switch-simple.o
> diff --git a/drivers/usb/typec/mux/switch-simple.c b/drivers/usb/typec/mux/switch-simple.c
> new file mode 100644
> index 0000000..8707703
> --- /dev/null
> +++ b/drivers/usb/typec/mux/switch-simple.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Type-C switch simple control driver
> + *
> + * Copyright 2020 NXP
> + * Author: Jun Li <jun.li@nxp.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/usb/typec_mux.h>
> +
> +struct typec_switch_simple {
> +	struct typec_switch *sw;
> +	struct gpio_desc *sel_gpio;
> +};
> +
> +static int typec_switch_simple_set(struct typec_switch *sw,
> +				   enum typec_orientation orientation)
> +{
> +	struct typec_switch_simple *typec_sw = typec_switch_get_drvdata(sw);
> +
> +	switch (orientation) {
> +	case TYPEC_ORIENTATION_NORMAL:
> +		gpiod_set_value_cansleep(typec_sw->sel_gpio, 1);
> +		break;
> +	case TYPEC_ORIENTATION_REVERSE:
> +		gpiod_set_value_cansleep(typec_sw->sel_gpio, 0);
> +		break;
> +	case TYPEC_ORIENTATION_NONE:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int typec_switch_simple_probe(struct platform_device *pdev)
> +{
> +	struct device			*dev = &pdev->dev;
> +	struct typec_switch_desc	sw_desc;
> +	struct typec_switch_simple	*typec_sw;
> +
> +	typec_sw = devm_kzalloc(dev, sizeof(*typec_sw), GFP_KERNEL);
> +	if (!typec_sw)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, typec_sw);
> +
> +	sw_desc.drvdata = typec_sw;
> +	sw_desc.fwnode = dev->fwnode;
> +	sw_desc.set = typec_switch_simple_set;
> +
> +	/* Get the super speed active channel selection GPIO */
> +	typec_sw->sel_gpio = devm_gpiod_get_optional(dev, "switch", GPIOD_OUT_LOW);
> +	if (IS_ERR(typec_sw->sel_gpio))
> +		return PTR_ERR(typec_sw->sel_gpio);
> +
> +	typec_sw->sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(typec_sw->sw)) {
> +		dev_err(dev, "Error registering typec switch: %ld\n",
> +			PTR_ERR(typec_sw->sw));
> +		return PTR_ERR(typec_sw->sw);
> +	}
> +
> +	return 0;
> +}
> +
> +static int typec_switch_simple_remove(struct platform_device *pdev)
> +{
> +	struct typec_switch_simple *typec_sw = platform_get_drvdata(pdev);
> +
> +	typec_switch_unregister(typec_sw->sw);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id of_typec_switch_simple_match[] = {
> +	{ .compatible = "typec-orientation-switch" },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_typec_switch_simple_match);
> +
> +static struct platform_driver typec_switch_simple_driver = {
> +	.probe		= typec_switch_simple_probe,
> +	.remove		= typec_switch_simple_remove,
> +	.driver		= {
> +		.name	= "typec-switch-simple",
> +		.of_match_table = of_typec_switch_simple_match,
> +	},
> +};
> +
> +module_platform_driver(typec_switch_simple_driver);
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("TypeC Orientation Switch Simple driver");
> +MODULE_AUTHOR("Jun Li <jun.li@nxp.com>");
> -- 
> 2.7.4

thanks,

-- 
heikki
