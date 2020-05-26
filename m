Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A62FA1A0E9D
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2020 15:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbgDGNsl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Apr 2020 09:48:41 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51775 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728555AbgDGNsl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Apr 2020 09:48:41 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0216520003;
        Tue,  7 Apr 2020 13:48:38 +0000 (UTC)
Date:   Tue, 7 Apr 2020 15:48:38 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     cristian.birsan@microchip.com
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        nicolas.ferre@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        ludovic.desroches@microchip.com
Subject: Re: [PATCH 6/7] usb: gadget: udc: atmel: rename errata into caps
Message-ID: <20200407134838.GA127852@piout.net>
References: <20200407122852.19422-1-cristian.birsan@microchip.com>
 <20200407122852.19422-7-cristian.birsan@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407122852.19422-7-cristian.birsan@microchip.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07/04/2020 15:28:51+0300, cristian.birsan@microchip.com wrote:
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> Rename errata structure into capabilities (caps). It will be used to add
> capabilities for new SoCs. Get the pointer to PMC only for the SoCs that
> need it to perform toggle_bias or pulse_bias.
> 
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
> ---
>  drivers/usb/gadget/udc/atmel_usba_udc.c | 21 ++++++++++-----------
>  drivers/usb/gadget/udc/atmel_usba_udc.h |  4 ++--
>  2 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
> index 1e2194fe06cb..dfe30913c76b 100644
> --- a/drivers/usb/gadget/udc/atmel_usba_udc.c
> +++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
> @@ -389,8 +389,8 @@ static int vbus_is_present(struct usba_udc *udc)
>  
>  static void toggle_bias(struct usba_udc *udc, int is_on)
>  {
> -	if (udc->errata && udc->errata->toggle_bias)
> -		udc->errata->toggle_bias(udc, is_on);
> +	if (udc->caps && udc->caps->toggle_bias)
> +		udc->caps->toggle_bias(udc, is_on);
>  }
>  
>  static void generate_bias_pulse(struct usba_udc *udc)
> @@ -398,8 +398,8 @@ static void generate_bias_pulse(struct usba_udc *udc)
>  	if (!udc->bias_pulse_needed)
>  		return;
>  
> -	if (udc->errata && udc->errata->pulse_bias)
> -		udc->errata->pulse_bias(udc);
> +	if (udc->caps && udc->caps->pulse_bias)
> +		udc->caps->pulse_bias(udc);
>  
>  	udc->bias_pulse_needed = false;
>  }
> @@ -2032,17 +2032,17 @@ static void at91sam9g45_pulse_bias(struct usba_udc *udc)
>  			   AT91_PMC_BIASEN);
>  }
>  
> -static const struct usba_udc_errata at91sam9rl_errata = {
> +static const struct usba_udc_caps at91sam9rl_caps = {
>  	.toggle_bias = at91sam9rl_toggle_bias,
>  };
>  
> -static const struct usba_udc_errata at91sam9g45_errata = {
> +static const struct usba_udc_caps at91sam9g45_caps = {
>  	.pulse_bias = at91sam9g45_pulse_bias,
>  };
>  
>  static const struct of_device_id atmel_udc_dt_ids[] = {
> -	{ .compatible = "atmel,at91sam9rl-udc", .data = &at91sam9rl_errata },
> -	{ .compatible = "atmel,at91sam9g45-udc", .data = &at91sam9g45_errata },
> +	{ .compatible = "atmel,at91sam9rl-udc", .data = &at91sam9rl_caps },
> +	{ .compatible = "atmel,at91sam9g45-udc", .data = &at91sam9g45_caps },
>  	{ .compatible = "atmel,sama5d3-udc" },
>  	{ /* sentinel */ }
>  };
> @@ -2053,7 +2053,6 @@ static const struct of_device_id atmel_pmc_dt_ids[] = {
>  	{ .compatible = "atmel,at91sam9g45-pmc" },
>  	{ .compatible = "atmel,at91sam9rl-pmc" },
>  	{ .compatible = "atmel,at91sam9x5-pmc" },
> -	{ .compatible = "microchip,sam9x60-pmc" },

This was added in 2/7 and is removed now. I believe the series needs a
bit of rework.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
