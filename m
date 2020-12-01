Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62612CA678
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 16:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389849AbgLAPB6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 10:01:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:33780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389514AbgLAPB5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Dec 2020 10:01:57 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1706B20691;
        Tue,  1 Dec 2020 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606834876;
        bh=3peWW0gzDhg53QWR3p3MrFZHy1Ev+0muOybHCDu66+M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iDxgfnOHBZ8uTuNVOT9OzBbVIENBVQ7TsJSeopKt02no5szsFtc1cUGdMw7e1+vyu
         iUqE9c9GwL+09dsmObIRlLlLh62maQ/9pGE9lTSLcbB3Q1eABzW2GzksR8XqTPMjG1
         6VqlXY1DUFNEh5oNoGkWZ9J+HsT2KXH42fxylQnc=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kk79T-00F4zg-ID; Tue, 01 Dec 2020 15:01:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Dec 2020 15:01:11 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ftdi_sio: Helpful error on GPIO attempt
In-Reply-To: <20201201141048.1461042-1-linus.walleij@linaro.org>
References: <20201201141048.1461042-1-linus.walleij@linaro.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <43d788c69a0f4fe3caf578b98ae72395@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, johan@kernel.org, linux-usb@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linus,

On 2020-12-01 14:10, Linus Walleij wrote:
> The FTDI adapters present all potentially available GPIO
> lines to userspace, and they are often also visibly
> available on things like breakout boards. These are
> appetizing targets for random GPIO tinkering such as
> bit-banging or other industrial control over USB.
> 
> When a user attempts to use one of the GPIO lines, they
> can get the opaque error -ENODEV, because the flashed
> configuration says that the line is not in GPIO mode
> but another alternative function.
> 
> We had one user run into this, debug and finally fix the
> problem using ftx-prog.

Well, you gave me 2/3 of the solution ;-). How about adding
a pointer to this tool? [1]

> 
> Give the user some more helpful dmesg text and a pointer
> to ftx-prog when the error occurs.
> 
> Reported-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c 
> b/drivers/usb/serial/ftdi_sio.c
> index e0f4c3d9649c..405fec78f2fc 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1841,8 +1841,11 @@ static int ftdi_gpio_request(struct gpio_chip
> *gc, unsigned int offset)
>  	struct ftdi_private *priv = usb_get_serial_port_data(port);
>  	int result;
> 
> -	if (priv->gpio_altfunc & BIT(offset))
> +	if (priv->gpio_altfunc & BIT(offset)) {
> +		dev_err(&port->dev, "FTDI firmware says line is not in GPIO 
> mode\n");
> +		dev_err(&port->dev, "if you really know what you're doing the flash
> can be reconfigured using ftx-prog\n");
>  		return -ENODEV;
> +	}
> 
>  	mutex_lock(&priv->gpio_lock);
>  	if (!priv->gpio_used) {

It occurs to me that since the driver already knows which of the CBUS
pins are unusable, we should maybe find a way to expose the line as
"reserved", one way or another? Generic tools such as gpioinfo would
(or should?) be able to display the status of the pin to the user.

enum gpio_v2_line_flag doesn't have a "reserved" flag, so maybe
GPIO_V2_LINE_FLAG_USED is an adequate way to mark the line as
being unavailable for userspace?

Thanks,

         M.

[1] https://github.com/richardeoin/ftx-prog
-- 
Jazz is not dead. It just smells funny...
