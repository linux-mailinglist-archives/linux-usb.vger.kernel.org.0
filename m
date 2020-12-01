Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F180C2CA544
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 15:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbgLAOLn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 09:11:43 -0500
Received: from fgw20-4.mail.saunalahti.fi ([62.142.5.107]:10622 "EHLO
        fgw20-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727132AbgLAOLn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 09:11:43 -0500
Received: from darkstar.musicnaut.iki.fi (85-76-8-36-nat.elisa-mobile.fi [85.76.8.36])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 0a762813-33df-11eb-ba24-005056bd6ce9;
        Tue, 01 Dec 2020 16:11:01 +0200 (EET)
Date:   Tue, 1 Dec 2020 16:11:01 +0200
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: ohci-omap: Fix descriptor conversion
Message-ID: <20201201141101.GI551434@darkstar.musicnaut.iki.fi>
References: <20201201121606.235982-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201121606.235982-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Dec 01, 2020 at 01:16:06PM +0100, Linus Walleij wrote:
> There were a bunch of issues with the patch converting the
> OMAP1 OSK board to use descriptors for controlling the USB
> host:
> 
> - The chip label was incorrect
> - The GPIO offset was off-by-one
> - The code should use sleeping accessors
> 
> This patch tries to fix all issues at the same time.
> 
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Fixes: 15d157e87443 ("usb: ohci-omap: Convert to use GPIO descriptors")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Thanks,

A.

> ---
> ChangeLog v1->v2:
> - Also free the GPIO in the boardfile bootstrap code so that
>   the driver can later on properly grab it.
> ---
>  arch/arm/mach-omap1/board-osk.c | 4 +++-
>  drivers/usb/host/ohci-omap.c    | 4 ++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
> index 144b9caa935c..0a4c9b0b13b0 100644
> --- a/arch/arm/mach-omap1/board-osk.c
> +++ b/arch/arm/mach-omap1/board-osk.c
> @@ -203,6 +203,8 @@ static int osk_tps_setup(struct i2c_client *client, void *context)
>  	 */
>  	gpio_request(OSK_TPS_GPIO_USB_PWR_EN, "n_vbus_en");
>  	gpio_direction_output(OSK_TPS_GPIO_USB_PWR_EN, 1);
> +	/* Free the GPIO again as the driver will request it */
> +	gpio_free(OSK_TPS_GPIO_USB_PWR_EN);
>  
>  	/* Set GPIO 2 high so LED D3 is off by default */
>  	tps65010_set_gpio_out_value(GPIO2, HIGH);
> @@ -288,7 +290,7 @@ static struct gpiod_lookup_table osk_usb_gpio_table = {
>  	.dev_id = "ohci",
>  	.table = {
>  		/* Power GPIO on the I2C-attached TPS65010 */
> -		GPIO_LOOKUP("i2c-tps65010", 1, "power", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP("tps65010", 0, "power", GPIO_ACTIVE_HIGH),
>  		GPIO_LOOKUP(OMAP_GPIO_LABEL, 9, "overcurrent",
>  			    GPIO_ACTIVE_HIGH),
>  	},
> diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
> index 9ccdf2c216b5..6374501ba139 100644
> --- a/drivers/usb/host/ohci-omap.c
> +++ b/drivers/usb/host/ohci-omap.c
> @@ -91,14 +91,14 @@ static int omap_ohci_transceiver_power(struct ohci_omap_priv *priv, int on)
>  				| ((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
>  			       INNOVATOR_FPGA_CAM_USB_CONTROL);
>  		else if (priv->power)
> -			gpiod_set_value(priv->power, 0);
> +			gpiod_set_value_cansleep(priv->power, 0);
>  	} else {
>  		if (machine_is_omap_innovator() && cpu_is_omap1510())
>  			__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
>  				& ~((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
>  			       INNOVATOR_FPGA_CAM_USB_CONTROL);
>  		else if (priv->power)
> -			gpiod_set_value(priv->power, 1);
> +			gpiod_set_value_cansleep(priv->power, 1);
>  	}
>  
>  	return 0;
> -- 
> 2.26.2
> 
