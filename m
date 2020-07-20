Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35EFA225CDF
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 12:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbgGTKqs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 06:46:48 -0400
Received: from mga18.intel.com ([134.134.136.126]:48898 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728232AbgGTKqr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jul 2020 06:46:47 -0400
IronPort-SDR: lOUnz9GVLw1YsdUui7W4/Eoa7iM61kqkUPZRGarpoj5EbC03QHLd4WypaMzLhHsShzpx9OVcH7
 KxZHxGb8nFTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="137368566"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
   d="scan'208";a="137368566"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2020 03:46:47 -0700
IronPort-SDR: 3oRwxjJLwKU2ponUQfm2XjvSE9pxl+ASqeHCNNVrH+Pbzlj9PACu9GUzdI1ETxpvZTyUnTU9lo
 1uxN2f2d4IZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
   d="scan'208";a="327494476"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 20 Jul 2020 03:46:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jxTJm-002rl5-6t; Mon, 20 Jul 2020 13:46:46 +0300
Date:   Mon, 20 Jul 2020 13:46:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: pch_udc: Convert to use GPIO descriptors
Message-ID: <20200720104646.GS3703480@smile.fi.intel.com>
References: <20200627111029.513642-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200627111029.513642-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 27, 2020 at 01:10:29PM +0200, Linus Walleij wrote:
> This switches the PCH UDC driver to use GPIO descriptors. The way
> this is supposed to be used is confusing. The code contains the
> following:
> 
>     /* GPIO port for VBUS detecting */
>     static int vbus_gpio_port = -1; /* GPIO port number (-1:Not used) */
> 
> So a hardcoded GPIO number in the code. Further the probe() path
> very clearly will exit if the GPIO is not found, so this driver
> can only be configured by editing the code, hard-coding a GPIO
> number into this variable.
> 
> This is simply not how we do things. My guess is that this is
> used in products by patching a GPIO number into this variable and
> shipping a kernel that is compile-time tailored for the target
> system.
> 
> I switched this mechanism to using a GPIO descriptor associated
> with the parent PCI device. This can be added by using the 16bit
> subsystem ID or similar to identify which exact machine we are
> running on and what GPIO is present on that machine, and then
> add a GPIO descriptor using gpiod_add_lookup_table() from
> <linux/gpio/machine.h>. Since I don't have any target systems
> I cannot add this but I'm happy to help. I put in a FIXME so
> the people actually using this driver knows what to do.

In the future I will submit a patch to fix below FIXME since I found the means
of testing, but it requires some time. Meanwhile I have tested on two Intel
platforms with such UDC and found no regressions

Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Felipe, I'm fine with this patch, please proceed if it's okay.

> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Andy: your input would be appreciated, this kind of code
> customizing random embedded Intel systems is deep water for
> me, so this is just a rough guess on how it should be done.
> ---
>  drivers/usb/gadget/udc/pch_udc.c | 55 +++++++++++++-------------------
>  1 file changed, 22 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
> index 3344fb8c4181..a9e332130091 100644
> --- a/drivers/usb/gadget/udc/pch_udc.c
> +++ b/drivers/usb/gadget/udc/pch_udc.c
> @@ -12,12 +12,9 @@
>  #include <linux/interrupt.h>
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/irq.h>
>  
> -/* GPIO port for VBUS detecting */
> -static int vbus_gpio_port = -1;		/* GPIO port number (-1:Not used) */
> -
>  #define PCH_VBUS_PERIOD		3000	/* VBUS polling period (msec) */
>  #define PCH_VBUS_INTERVAL	10	/* VBUS polling interval (msec) */
>  
> @@ -302,13 +299,13 @@ struct pch_udc_ep {
>  /**
>   * struct pch_vbus_gpio_data - Structure holding GPIO informaton
>   *					for detecting VBUS
> - * @port:		gpio port number
> + * @port:		gpio descriptor for the VBUS GPIO
>   * @intr:		gpio interrupt number
>   * @irq_work_fall	Structure for WorkQueue
>   * @irq_work_rise	Structure for WorkQueue
>   */
>  struct pch_vbus_gpio_data {
> -	int			port;
> +	struct gpio_desc	*port;
>  	int			intr;
>  	struct work_struct	irq_work_fall;
>  	struct work_struct	irq_work_rise;
> @@ -1253,7 +1250,7 @@ static int pch_vbus_gpio_get_value(struct pch_udc_dev *dev)
>  	int vbus = 0;
>  
>  	if (dev->vbus_gpio.port)
> -		vbus = gpio_get_value(dev->vbus_gpio.port) ? 1 : 0;
> +		vbus = gpiod_get_value(dev->vbus_gpio.port) ? 1 : 0;
>  	else
>  		vbus = -1;
>  
> @@ -1355,42 +1352,30 @@ static irqreturn_t pch_vbus_gpio_irq(int irq, void *data)
>  /**
>   * pch_vbus_gpio_init() - This API initializes GPIO port detecting VBUS.
>   * @dev:	Reference to the driver structure
> - * @vbus_gpio	Number of GPIO port to detect gpio
>   *
>   * Return codes:
>   *	0: Success
>   *	-EINVAL: GPIO port is invalid or can't be initialized.
>   */
> -static int pch_vbus_gpio_init(struct pch_udc_dev *dev, int vbus_gpio_port)
> +static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
>  {
>  	int err;
>  	int irq_num = 0;
> +	struct gpio_desc *gpiod;
>  
> -	dev->vbus_gpio.port = 0;
> +	dev->vbus_gpio.port = NULL;
>  	dev->vbus_gpio.intr = 0;
>  
> -	if (vbus_gpio_port <= -1)
> -		return -EINVAL;
> -
> -	err = gpio_is_valid(vbus_gpio_port);
> -	if (!err) {
> -		pr_err("%s: gpio port %d is invalid\n",
> -			__func__, vbus_gpio_port);
> -		return -EINVAL;
> -	}
> -
> -	err = gpio_request(vbus_gpio_port, "pch_vbus");
> -	if (err) {
> -		pr_err("%s: can't request gpio port %d, err: %d\n",
> -			__func__, vbus_gpio_port, err);
> -		return -EINVAL;
> -	}
> +	/* Retrieve the GPIO line from the USB gadget device */
> +	gpiod = devm_gpiod_get(dev->gadget.dev.parent, NULL, GPIOD_IN);
> +	if (IS_ERR(gpiod))
> +		return PTR_ERR(gpiod);
> +	gpiod_set_consumer_name(gpiod, "pch_vbus");
>  
> -	dev->vbus_gpio.port = vbus_gpio_port;
> -	gpio_direction_input(vbus_gpio_port);
> +	dev->vbus_gpio.port = gpiod;
>  	INIT_WORK(&dev->vbus_gpio.irq_work_fall, pch_vbus_gpio_work_fall);
>  
> -	irq_num = gpio_to_irq(vbus_gpio_port);
> +	irq_num = gpiod_to_irq(gpiod);
>  	if (irq_num > 0) {
>  		irq_set_irq_type(irq_num, IRQ_TYPE_EDGE_BOTH);
>  		err = request_irq(irq_num, pch_vbus_gpio_irq, 0,
> @@ -1416,9 +1401,6 @@ static void pch_vbus_gpio_free(struct pch_udc_dev *dev)
>  {
>  	if (dev->vbus_gpio.intr)
>  		free_irq(dev->vbus_gpio.intr, dev);
> -
> -	if (dev->vbus_gpio.port)
> -		gpio_free(dev->vbus_gpio.port);
>  }
>  
>  /**
> @@ -2894,7 +2876,7 @@ static int pch_udc_pcd_init(struct pch_udc_dev *dev)
>  {
>  	pch_udc_init(dev);
>  	pch_udc_pcd_reinit(dev);
> -	pch_vbus_gpio_init(dev, vbus_gpio_port);
> +	pch_vbus_gpio_init(dev);
>  	return 0;
>  }
>  
> @@ -3096,6 +3078,13 @@ static int pch_udc_probe(struct pci_dev *pdev,
>  
>  	dev->base_addr = pcim_iomap_table(pdev)[bar];
>  
> +	/*
> +	 * FIXME: add a GPIO descriptor table to pdev.dev using
> +	 * gpiod_add_descriptor_table() from <linux/gpio/machine.h> based on
> +	 * the PCI subsystem ID. The system-dependent GPIO is necessary for
> +	 * VBUS operation.
> +	 */
> +
>  	/* initialize the hardware */
>  	if (pch_udc_pcd_init(dev))
>  		return -ENODEV;
> -- 
> 2.25.4
> 

-- 
With Best Regards,
Andy Shevchenko


