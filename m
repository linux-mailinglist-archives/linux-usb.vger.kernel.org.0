Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22582C5378
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 13:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731534AbgKZL7o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 06:59:44 -0500
Received: from mga04.intel.com ([192.55.52.120]:41151 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgKZL7o (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 06:59:44 -0500
IronPort-SDR: DQz3fN9nvmnhLVjyXJgt1A6nWYP8lvbStRoUVy1meMKdOZfKpKReHLAeWD29rrjKbewWaIqoK6
 Cob6lOQxQ/Lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="169715912"
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; 
   d="scan'208";a="169715912"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 03:59:43 -0800
IronPort-SDR: fDApwtF2zajLnzWWbtoBKKc4aoo2X8m/PHSjHsvwDbUiPkTa3Y3olsiLgI3HFV4d4+K/slEbTD
 CEZDYeEu1cHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; 
   d="scan'208";a="433253893"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 Nov 2020 03:59:39 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 26 Nov 2020 13:59:38 +0200
Date:   Thu, 26 Nov 2020 13:59:38 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, rafael@kernel.org, gregkh@linuxfoundation.org,
        andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        lee.jones@linaro.org, mika.westerberg@linux.intel.com,
        dmitry.torokhov@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: Re: [PATCH v6 6/6] usb: typec: mux: add typec switch simple driver
Message-ID: <20201126115938.GL1008337@kuha.fi.intel.com>
References: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
 <1606140096-1382-6-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606140096-1382-6-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 23, 2020 at 10:01:36PM +0800, Li Jun wrote:
> This patch adds a simple typec switch driver for cases which only
> needs some simple operations but a dedicated driver is required,
> current driver only supports GPIO toggle to switch the super speed
> active channel according to typec orientation.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes for v6:
> - Use general mux control for typec switch, currently only support
>   max 2 GPIOs to control one typec switch with 3 states: orientation
>   normal(cc1), reverse(cc2), none(deselected both channels).
> 
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
>  drivers/usb/typec/mux/Kconfig         |  10 +++
>  drivers/usb/typec/mux/Makefile        |   1 +
>  drivers/usb/typec/mux/switch-simple.c | 126 ++++++++++++++++++++++++++++++++++
>  3 files changed, 137 insertions(+)
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
> index 0000000..4671169
> --- /dev/null
> +++ b/drivers/usb/typec/mux/switch-simple.c
> @@ -0,0 +1,126 @@
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
> +#include <linux/mux/driver.h>
> +#include <linux/platform_device.h>
> +#include <linux/usb/typec_mux.h>
> +
> +struct typec_switch_simple {
> +	struct typec_switch *sw;
> +	struct mux_control *mux;
> +	struct gpio_descs *switch_gpios;
> +};
> +
> +static int typec_switch_simple_mux_set(struct mux_control *mux, int state)
> +{
> +	struct typec_switch_simple *typec_ss = mux_chip_priv(mux->chip);
> +	DECLARE_BITMAP(values, BITS_PER_TYPE(state));
> +
> +	values[0] = state;
> +	gpiod_set_array_value_cansleep(typec_ss->switch_gpios->ndescs,
> +				       typec_ss->switch_gpios->desc,
> +				       typec_ss->switch_gpios->info,
> +				       values);
> +
> +	return 0;
> +}
> +
> +static const struct mux_control_ops typec_switch_mux_ops = {
> +	.set = typec_switch_simple_mux_set,
> +};
> +
> +static int typec_switch_simple_probe(struct platform_device *pdev)
> +{
> +	struct device			*dev = &pdev->dev;
> +	struct mux_chip			*mux_chip;
> +	struct typec_switch_desc	sw_desc;
> +	struct typec_switch_simple	*typec_ss;
> +	int				idle_state;
> +	int				pins;
> +	int				ret;
> +
> +	pins = gpiod_count(dev, "switch");
> +	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*typec_ss));
> +	if (IS_ERR(mux_chip))
> +		return PTR_ERR(mux_chip);
> +
> +	typec_ss = mux_chip_priv(mux_chip);
> +	mux_chip->ops = &typec_switch_mux_ops;
> +
> +	/* Get the super speed active channel selection GPIO */
> +	typec_ss->switch_gpios = devm_gpiod_get_array_optional(dev,
> +				 "switch", GPIOD_OUT_LOW);
> +	if (IS_ERR(typec_ss->switch_gpios))
> +		return PTR_ERR(typec_ss->switch_gpios);
> +
> +	if (pins) {
> +		WARN_ON(pins != typec_ss->switch_gpios->ndescs || pins > 2);
> +		mux_chip->mux->states = pins + 1;
> +	}
> +
> +	ret = device_property_read_u32(dev, "idle-state", (u32 *)&idle_state);
> +	if (ret >= 0 && idle_state != MUX_IDLE_AS_IS) {
> +		if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
> +			dev_err(dev, "invalid idle-state %u\n", idle_state);
> +			return -EINVAL;
> +		}
> +		mux_chip->mux->idle_state = idle_state;
> +	}
> +
> +	ret = devm_mux_chip_register(dev, mux_chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, typec_ss);
> +	sw_desc.drvdata = typec_ss;
> +	sw_desc.fwnode = dev->fwnode;
> +
> +	typec_ss->sw = typec_switch_register(&mux_chip->dev, &sw_desc);
> +	if (IS_ERR(typec_ss->sw)) {
> +		dev_err(dev, "Error registering typec switch: %ld\n",
> +			PTR_ERR(typec_ss->sw));
> +		return PTR_ERR(typec_ss->sw);
> +	}
> +
> +	return 0;
> +}
> +
> +static int typec_switch_simple_remove(struct platform_device *pdev)
> +{
> +	struct typec_switch_simple *typec_ss = platform_get_drvdata(pdev);
> +
> +	typec_switch_unregister(typec_ss->sw);
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
