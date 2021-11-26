Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3663D45EAB8
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 10:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238162AbhKZJxV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 04:53:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:44576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234676AbhKZJvO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Nov 2021 04:51:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE51A610FE;
        Fri, 26 Nov 2021 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637920080;
        bh=CczF4rEDnw26fu0snuJ/zcLY55iydu7dxE9p8n71ytw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=atNXCgH++8ZYRYZLSScDvYUaK+NKEAAAY6aILO4f0/Wt8gZpdu0vjudsTH7P2BDy0
         Wnw+xBcM0w5HnsmFg67KolFQIAIcTfT2WODL+/nbhDOKHsKYkEDAnZDaLurZY7ONKx
         z+VA5T/Z39PG8fJoIBG858dHIgpnNGrBIomXSdENbPL9DFqanrficr4LraUK3R6hdC
         /xJc1oMyyGFRr41bTkOJa83wIQp/k8wvFaK0k8VxNutiYCDdxr9cllSx8ve0gZozCv
         ohxWvEinneQA+JN7fjYFhT8mUOfd2/lhES6jyfezuqme1kmHmAn3RiVkdr5ZtzNkJb
         zoRliqBmagEFA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mqXpV-0008HY-OV; Fri, 26 Nov 2021 10:47:41 +0100
Date:   Fri, 26 Nov 2021 10:47:41 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Maarten Brock <m.brock@vanmierlo.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: CP2105 gives kernel error -22 when in modem mode
Message-ID: <YaCtPXkQXQIzsuq2@hovoldconsulting.com>
References: <5eb560c81d2ea1a2b4602a92d9f48a89@vanmierlo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eb560c81d2ea1a2b4602a92d9f48a89@vanmierlo.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 25, 2021 at 04:42:27PM +0100, Maarten Brock wrote:
> Hello all,
> 
> When a uart of the CP2105 USB-serial chip is programmed to be in modem 
> mode, all its gpio pins are in alternate use and none are available for 
> gpio. Still the cp210x driver tries to add a gpiochip unconditionally, 
> which results in an error.
> 
> > cp210x 1-1.4.4:1.0: cp210x converter detected
> > usb 1-1.4.4: cp210x converter now attached to ttyUSB0
> > cp210x 1-1.4.4:1.1: cp210x converter detected
> > gpio gpiochip2: (cp210x): tried to insert a GPIO chip with zero lines
> > gpiochip_add_data_with_key: GPIOs 0..-1 (cp210x) failed to register, 
> > -22
> > cp210x 1-1.4.4:1.1: GPIO initialisation failed: -22
> > usb 1-1.4.4: cp210x converter now attached to ttyUSB1

Thanks for reporting this.

> I propose to add something like the following to cp210x_gpio_init
> 
> +	unsigned long valid_mask, altfunc_mask;
> ...
> +	altfunc_mask = priv->gpio_altfunc;
> +	bitmap_complement(&valid_mask, &altfunc_mask, priv->gc.ngpio);
> +	if (bitmap_empty(&valid_mask, priv->gc.ngpio))
> +		return 0;
> +
>   	priv->gc.label = "cp210x";
>   	priv->gc.request = cp210x_gpio_request;
>   	priv->gc.get_direction = cp210x_gpio_direction_get;
> 
> I can write a proper patch, but am unsure if and what the Fixes tag 
> should be.

This was introduced by commit c8acfe0aadbe ("USB: serial: cp210x:
implement GPIO support for CP2102N") when generalising GPIO support and
adding support for CP2102N. Before that commit, the GPIO chip would
indeed never have been registered in this case.

The right fix however is to continue to always register the gpiochip but
to make sure that the number of lines is initialised before doing so.
This is how we deal with with the other device types and is also how
CP2105 is handled when both pins of the CP2105 ECI port are muxed for
LED function.

I've just posted a fix here:

	https://lore.kernel.org/r/20211126094348.31698-1-johan@kernel.org

Johan
