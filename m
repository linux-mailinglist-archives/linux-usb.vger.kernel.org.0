Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30BDC292758
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 14:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgJSMaV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 08:30:21 -0400
Received: from mga14.intel.com ([192.55.52.115]:42210 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbgJSMaU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Oct 2020 08:30:20 -0400
IronPort-SDR: VKHmLlTlQL1g7kORkED7xD+OCtV1e6pYUKlvlnupCPsquH9H32xMWzhNdc0RP8w8xMeEb904Ni
 PqxGrkim58Yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="166240053"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="166240053"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 05:30:16 -0700
IronPort-SDR: B/ke+E2bgZ2kHZafEOBOG6k3y3w873rxf2XwbUS1hHt9n+n4Xc8n6JnzDZzNBNkcUg8U53vy9T
 7TjaGN6Tld0Q==
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="521984773"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 05:30:12 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUUJm-00AZw1-Fa; Mon, 19 Oct 2020 15:31:14 +0300
Date:   Mon, 19 Oct 2020 15:31:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        rafael@kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com,
        lee.jones@linaro.org, mika.westerberg@linux.intel.com,
        dmitry.torokhov@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: Re: [PATCH v4 4/4] usb: typec: mux: add typec switch simple driver
Message-ID: <20201019123114.GO4077@smile.fi.intel.com>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-4-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603098195-9923-4-git-send-email-jun.li@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 19, 2020 at 05:03:15PM +0800, Li Jun wrote:
> This patch adds a simple typec switch driver for cases which only
> needs some simple operations but a dedicated driver is required,
> current driver only supports GPIO toggle to switch the super speed
> active channel according to typec orientation.

...

>  	  Driver for USB muxes controlled by Intel PMC FW. Intel PMC FW can
>  	  control the USB role switch and also the multiplexer/demultiplexer
>  	  switches used with USB Type-C Alternate Modes.

Missed blank line.

> +config TYPEC_SWITCH_SIMPLE
> +	tristate "Type-c orientation switch Simple driver"

Type-c -> Type-C

Simple -> simple


> +	depends on GPIOLIB
> +	help
> +	  Say Y or M if your system need a simple driver for typec switch
> +	  control, like use GPIO to select active channel.

Driver name?

...

> +/**

Is it kernel doc?!

> + * switch-simple.c - typec switch simple control.

Remove file name from the file.

> + *
> + * Copyright 2020 NXP
> + * Author: Jun Li <jun.li@nxp.com>

> + *

Redundant blank line.

> + */

...

> +#include <linux/of.h>
> +#include <linux/of_gpio.h>

No evidence of use of these headers, but
mod_devicetable.h along with gpio/consumer.h are missed.


...

> +	switch (orientation) {
> +	case TYPEC_ORIENTATION_NORMAL:
> +		if (typec_sw->sel_gpio)

Optional GPIO does not require these checks. Drop them and learn what "optional" means.

> +			gpiod_set_value_cansleep(typec_sw->sel_gpio, 1);
> +		break;
> +	case TYPEC_ORIENTATION_REVERSE:
> +		if (typec_sw->sel_gpio)
> +			gpiod_set_value_cansleep(typec_sw->sel_gpio, 0);
> +		break;
> +	case TYPEC_ORIENTATION_NONE:
> +		break;
> +	}

...

> +	struct typec_switch_simple	*typec_sw;
> +	struct device			*dev = &pdev->dev;
> +	struct typec_switch_desc sw_desc;

Be consistent with indentation.

...

> +	/* Get the super speed active channel selection GPIO */
> +	typec_sw->sel_gpio = devm_gpiod_get_optional(dev, "switch",
> +						     GPIOD_OUT_LOW);

It can be one line.

> +	if (IS_ERR(typec_sw->sel_gpio))
> +		return PTR_ERR(typec_sw->sel_gpio);

-- 
With Best Regards,
Andy Shevchenko


