Return-Path: <linux-usb+bounces-708-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 683AB7B1F4D
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 16:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 1ACA2282311
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 14:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E123D39D;
	Thu, 28 Sep 2023 14:17:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A1610EB
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 14:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF0CC433C7;
	Thu, 28 Sep 2023 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695910635;
	bh=9ULyKkx2zLmpPV+yHL2NJSJxdy2E5G08rOyZ7AfBxUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iWAxAx4S952hzkPzcaPUdc0EX0g1jkPOoAU7CnLTdAL5MbgDaWlvqC6w9pP+xX5Ey
	 tQ8VDQuLgOTzrx6LYHyeb8OIpZ+44+52rh87CnloWXMkdpeiC2D5gP8rdg9sljEKWD
	 XeK0iOUhDNlbGAdHctz/7kpfZkDvcCO0t8uDFy80=
Date: Thu, 28 Sep 2023 16:17:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wentong Wu <wentong.wu@intel.com>
Cc: arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
	wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
	linus.walleij@linaro.org, hdegoede@redhat.com, maz@kernel.org,
	brgl@bgdev.pl, linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
	andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
	andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
	bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com,
	zhifeng.wang@intel.com
Subject: Re: [PATCH v19 4/4] gpio: update Intel LJCA USB GPIO driver
Message-ID: <2023092804-cider-viscosity-03b6@gregkh>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-5-git-send-email-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694890416-14409-5-git-send-email-wentong.wu@intel.com>

On Sun, Sep 17, 2023 at 02:53:36AM +0800, Wentong Wu wrote:
> This driver communicate with LJCA GPIO module with specific
> protocol through interfaces exported by LJCA USB driver.
> Update the driver according to LJCA USB driver's changes.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpio/Kconfig     |   4 +-
>  drivers/gpio/gpio-ljca.c | 246 +++++++++++++++++++++++++++--------------------
>  2 files changed, 145 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 673bafb..8d5b6c3 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1312,9 +1312,9 @@ config GPIO_KEMPLD
>  
>  config GPIO_LJCA
>  	tristate "INTEL La Jolla Cove Adapter GPIO support"
> -	depends on MFD_LJCA
> +	depends on USB_LJCA
>  	select GPIOLIB_IRQCHIP
> -	default MFD_LJCA
> +	default USB_LJCA
>  	help
>  	  Select this option to enable GPIO driver for the INTEL
>  	  La Jolla Cove Adapter (LJCA) board.
> diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> index 87863f0..7fae26d 100644
> --- a/drivers/gpio/gpio-ljca.c
> +++ b/drivers/gpio/gpio-ljca.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/dev_printk.h>
> @@ -13,19 +14,18 @@
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
>  #include <linux/kref.h>
> -#include <linux/mfd/ljca.h>
>  #include <linux/module.h>
> -#include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/usb/ljca.h>
>  
>  /* GPIO commands */
> -#define LJCA_GPIO_CONFIG	1
> -#define LJCA_GPIO_READ		2
> -#define LJCA_GPIO_WRITE		3
> -#define LJCA_GPIO_INT_EVENT	4
> -#define LJCA_GPIO_INT_MASK	5
> -#define LJCA_GPIO_INT_UNMASK	6
> +#define LJCA_GPIO_CONFIG		1
> +#define LJCA_GPIO_READ			2
> +#define LJCA_GPIO_WRITE			3
> +#define LJCA_GPIO_INT_EVENT		4
> +#define LJCA_GPIO_INT_MASK		5
> +#define LJCA_GPIO_INT_UNMASK		6

Why are you changing whitespace for no good reason?

Please don't do that, it makes finding the actual changes in this driver
impossible to notice and review.



>  
>  #define LJCA_GPIO_CONF_DISABLE		BIT(0)
>  #define LJCA_GPIO_CONF_INPUT		BIT(1)
> @@ -36,45 +36,49 @@
>  #define LJCA_GPIO_CONF_INTERRUPT	BIT(6)
>  #define LJCA_GPIO_INT_TYPE		BIT(7)
>  
> -#define LJCA_GPIO_CONF_EDGE	FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
> -#define LJCA_GPIO_CONF_LEVEL	FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
> +#define LJCA_GPIO_CONF_EDGE		FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
> +#define LJCA_GPIO_CONF_LEVEL		FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
>  
>  /* Intentional overlap with PULLUP / PULLDOWN */
> -#define LJCA_GPIO_CONF_SET	BIT(3)
> -#define LJCA_GPIO_CONF_CLR	BIT(4)
> +#define LJCA_GPIO_CONF_SET		BIT(3)
> +#define LJCA_GPIO_CONF_CLR		BIT(4)
>  
> -struct gpio_op {
> +#define LJCA_GPIO_BUF_SIZE		60u

Why "u"?  What requires that?

Odd, sorry, I know people are just getting tired of the constant churn
here, but really, you know better than making changes that are not
needed, or not documented.

greg k-h

