Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B49112E858
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 16:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbgABPya (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 10:54:30 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53403 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728678AbgABPya (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 10:54:30 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1in2ns-0007n9-AQ; Thu, 02 Jan 2020 16:54:28 +0100
Message-ID: <5d5b290572cb3aa8559fc3cc64d25161a7570b29.camel@pengutronix.de>
Subject: Re: [PATCH] usb: phy: phy-gpio-vbus-usb: Convert to GPIO descriptors
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
Date:   Thu, 02 Jan 2020 16:54:26 +0100
In-Reply-To: <20191231174848.741314-1-linus.walleij@linaro.org>
References: <20191231174848.741314-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-12-31 at 18:48 +0100, Linus Walleij wrote:
> Instead of using the legacy GPIO API and keeping track on
> polarity inversion semantics in the driver, switch to use
> GPIO descriptors for this driver and change all consumers
> in the process.
> 
> This makes it possible to retire platform data completely:
> the only remaining platform data member was "wakeup" which
> was intended to make the vbus interrupt wakeup capable,
> but was not set by any users and thus remained unused. VBUS
> was not waking any devices up. Leave a comment about it so
> later developers using the platform can consider setting it
> to always enabled so plugging in USB wakes up the platform.
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This change hits arch/arm/mach-pxa/* and
> arch/arm/mach-s3c64* so I have CC to the most active
> maintainers.
> ---
>  arch/arm/mach-pxa/colibri-pxa320.c  | 16 ++---
>  arch/arm/mach-pxa/eseries.c         | 40 +++++++-----
>  arch/arm/mach-pxa/gumstix.c         | 18 +++---
>  arch/arm/mach-pxa/hx4700.c          | 22 ++++---
>  arch/arm/mach-pxa/magician.c        | 22 ++++---
>  arch/arm/mach-pxa/mioa701.c         | 15 +++--
>  arch/arm/mach-pxa/palm27x.c         | 34 +++++------
>  arch/arm/mach-pxa/palmt5.c          |  1 -
>  arch/arm/mach-pxa/palmtc.c          | 18 +++---
>  arch/arm/mach-pxa/palmte2.c         | 18 +++---
>  arch/arm/mach-pxa/palmtx.c          |  1 -
>  arch/arm/mach-pxa/palmz72.c         |  1 -
>  arch/arm/mach-pxa/tosa.c            | 18 +++---
>  arch/arm/mach-pxa/vpac270.c         | 15 ++---
>  arch/arm/mach-s3c64xx/mach-smartq.c | 13 ++--
>  drivers/usb/phy/phy-gpio-vbus-usb.c | 95 +++++++++++++----------------
>  include/linux/usb/gpio_vbus.h       | 33 ----------
>  17 files changed, 188 insertions(+), 192 deletions(-)
>  delete mode 100644 include/linux/usb/gpio_vbus.h
[...]
> diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
> index 311268d186ab..238a751a8797 100644
> --- a/arch/arm/mach-pxa/hx4700.c
> +++ b/arch/arm/mach-pxa/hx4700.c
> @@ -34,7 +34,6 @@
>  #include <linux/spi/ads7846.h>
>  #include <linux/spi/spi.h>
>  #include <linux/spi/pxa2xx_spi.h>
> -#include <linux/usb/gpio_vbus.h>
>  #include <linux/platform_data/i2c-pxa.h>
>  
>  #include <mach/hardware.h>
> @@ -578,18 +577,24 @@ static struct pwm_lookup hx4700_pwm_lookup[] = {
>   * USB "Transceiver"
>   */
>  
> -static struct gpio_vbus_mach_info gpio_vbus_info = {
> -	.gpio_pullup        = GPIO76_HX4700_USBC_PUEN,
> -	.gpio_vbus          = GPIOD14_nUSBC_DETECT,
> -	.gpio_vbus_inverted = 1,
> +static struct gpiod_lookup_table gpio_vbus_gpiod_table = {
> +	.dev_id = "gpio-vbus",
> +	.table = {
> +		/* This GPIO is on ASIC3 */
> +		GPIO_LOOKUP("asic3",
> +			    /* Convert to a local offset on the ASIC3 */
> +			    GPIOD14_nUSBC_DETECT - HX4700_ASIC3_GPIO_BASE,
> +			    "vbus", GPIO_ACTIVE_LOW),
> +		/* This one is on the primary SOC GPIO */
> +		GPIO_LOOKUP("gpio-pxa", GPIO76_HX4700_USBC_PUEN,
> +			    "pullup", GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
>  };
>  
>  static struct platform_device gpio_vbus = {
>  	.name          = "gpio-vbus",
>  	.id            = -1,
> -	.dev = {
> -		.platform_data = &gpio_vbus_info,
> -	},
>  };
>  
>  static struct pxa2xx_udc_mach_info hx4700_udc_info;
> @@ -883,6 +888,7 @@ static void __init hx4700_init(void)
>  	pxa_set_stuart_info(NULL);
>  
>  	gpiod_add_lookup_table(&bq24022_gpiod_table);
> +	gpiod_add_lookup_table(&gpio_vbus_gpiod_table);
>  	platform_add_devices(devices, ARRAY_SIZE(devices));
>  	pwm_add_table(hx4700_pwm_lookup, ARRAY_SIZE(hx4700_pwm_lookup));
>  
> diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
> index e1a394ac3eea..5a1976e431e7 100644
> --- a/arch/arm/mach-pxa/magician.c
> +++ b/arch/arm/mach-pxa/magician.c
> @@ -27,7 +27,6 @@
>  #include <linux/regulator/fixed.h>
>  #include <linux/regulator/gpio-regulator.h>
>  #include <linux/regulator/machine.h>
> -#include <linux/usb/gpio_vbus.h>
>  #include <linux/platform_data/i2c-pxa.h>
>  
>  #include <mach/hardware.h>
> @@ -506,9 +505,20 @@ static struct resource gpio_vbus_resource = {
>  	.end	= IRQ_MAGICIAN_VBUS,
>  };
>  
> -static struct gpio_vbus_mach_info gpio_vbus_info = {
> -	.gpio_pullup	= GPIO27_MAGICIAN_USBC_PUEN,
> -	.gpio_vbus	= EGPIO_MAGICIAN_CABLE_VBUS,
> +static struct gpiod_lookup_table gpio_vbus_gpiod_table = {
> +	.dev_id = "gpio-vbus",
> +	.table = {
> +		/*
> +		 * EGPIO on register 4 index 1, the second EGPIO chip
> +		 * starts at register 4 so this will be at index 1 on that
> +		 * chip.
> +		 */
> +		GPIO_LOOKUP("htc-egpio-1", 1,
> +			    "vbus", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP("gpio-pxa", GPIO27_MAGICIAN_USBC_PUEN,
> +			    "pullup", GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
>  };
>  
>  static struct platform_device gpio_vbus = {
> @@ -516,9 +526,6 @@ static struct platform_device gpio_vbus = {
>  	.id		= -1,
>  	.num_resources	= 1,
>  	.resource	= &gpio_vbus_resource,
> -	.dev = {
> -		.platform_data = &gpio_vbus_info,
> -	},
>  };
>  
>  /*
> @@ -1032,6 +1039,7 @@ static void __init magician_init(void)
>  		ARRAY_SIZE(pwm_backlight_supply), 5000000);
>  
>  	gpiod_add_lookup_table(&bq24022_gpiod_table);
> +	gpiod_add_lookup_table(&gpio_vbus_gpiod_table);
>  	platform_add_devices(ARRAY_AND_SIZE(devices));
>  }
[...]

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

