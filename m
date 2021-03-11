Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3AA337990
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 17:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhCKQij (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 11:38:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:56676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229648AbhCKQiW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 11:38:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 882CA64F9C;
        Thu, 11 Mar 2021 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615480701;
        bh=ONI/ckA6aWPXLx0KjR37fD6v5gXf2UsZV26wXnrMXVE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WBoy4ZOF08n/ctZERUedxAkNzc2mDjP3Adzuw9zipxUHhywJwvBgB3hIYRL609ZG/
         ydPLkEDT1q2DXogqS9AT2XT6ZrMVwH628oae8GoAAsEEJVZLfX/1/N3x1iNpYEmBm3
         BoVmsFaC+HdaN+u4pGE8M2LO8kBVHOVe4CjnQGP0vfJxH2Zl822ix2CcJVs2DBUxkB
         T9ccmK/PauoF1E4CV0gxSuVjOgfcJ3kOATNpCtPOe7RHSOm2LS4ExWodTcqo4TsAqK
         gIxMDaYNQM1Fzn+YUVoDV3xce+T83O4LWqPEyAR8ruBjWIGhg/akkVdlior7HsRXvt
         qm7vYKbLZZbxQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lKOKW-0000Wy-8R; Thu, 11 Mar 2021 17:38:33 +0100
Date:   Thu, 11 Mar 2021 17:38:32 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Klemen =?utf-8?B?S2/FoWly?= <klemen.kosir@kream.io>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: cp210x: Improve wording in some comments
Message-ID: <YEpHiP3ASiojtBRR@hovoldconsulting.com>
References: <20210311131435.293910-1-klemen.kosir@kream.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210311131435.293910-1-klemen.kosir@kream.io>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 11, 2021 at 10:14:35PM +0900, Klemen Košir wrote:
> This patch fixes some spelling mistakes and improves wording in some
> comments. It also renames one variable to unify naming with others.

It sounds like you're trying to do too many things at once, and I'm not
sure this kind of changes are worth it unless also doing some "real"
changes to the code in question.

> Signed-off-by: Klemen Košir <klemen.kosir@kream.io>
> ---
>  drivers/usb/serial/cp210x.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index a373cd63b3a4..7bcc253143a5 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -430,8 +430,8 @@ struct cp210x_comm_status {
>  /*
>   * CP210X_PURGE - 16 bits passed in wValue of USB request.
>   * SiLabs app note AN571 gives a strange description of the 4 bits:
> - * bit 0 or bit 2 clears the transmit queue and 1 or 3 receive.
> - * writing 1 to all, however, purges cp2108 well enough to avoid the hang.
> + * bit 0 or bit 2 clears the transmit queue and 1 or 3 clears the receive queue.

Maybe, but probably not worth it. Doesn't the line creep above 80
columns here now too?

> + * Writing 1 to all, however, purges CP2108 well enough to avoid the hang.

Hmm...

>   */
>  #define PURGE_ALL		0x000f
> 
> @@ -443,7 +443,6 @@ struct cp210x_comm_status {
>  #define CP210X_LSR_FRAME	BIT(3)
>  #define CP210X_LSR_BREAK	BIT(4)
> 
> -

Random whitespace change.

>  /* CP210X_GET_FLOW/CP210X_SET_FLOW read/write these 0x10 bytes */
>  struct cp210x_flow_ctl {
>  	__le32	ulControlHandshake;
> @@ -764,7 +763,7 @@ static void cp210x_close(struct usb_serial_port *port)
> 
>  	usb_serial_generic_close(port);
> 
> -	/* Clear both queues; cp2108 needs this to avoid an occasional hang */
> +	/* Clear both queues; CP2108 needs this to avoid an occasional hang. */
>  	cp210x_write_u16_reg(port, CP210X_PURGE, PURGE_ALL);
> 
>  	cp210x_write_u16_reg(port, CP210X_IFC_ENABLE, UART_DISABLE);
> @@ -1009,9 +1008,9 @@ static speed_t cp210x_get_actual_rate(speed_t baud)
>   *	div = round(freq / (2 x prescale x request))
>   *	actual = freq / (2 x prescale x div)
>   *
> - * For CP2104 and CP2105 freq is 48Mhz and prescale is 4 for request <= 365bps
> + * For CP2104 and CP2105 freq is 48MHz and prescale is 4 for request <= 365bps
>   * or 1 otherwise.
> - * For CP2110 freq is 24Mhz and prescale is 4 for request <= 300bps or 1
> + * For CP2110 freq is 24MHz and prescale is 4 for request <= 300bps or 1

Almost couldn't tell what changed, but ok.

>   * otherwise.
>   */
>  static void cp210x_change_speed(struct tty_struct *tty,
> @@ -1023,7 +1022,7 @@ static void cp210x_change_speed(struct tty_struct *tty,
> 
>  	/*
>  	 * This maps the requested rate to the actual rate, a valid rate on
> -	 * cp2102 or cp2103, or to an arbitrary rate in [1M, max_speed].
> +	 * CP2102 or CP2103, or to an arbitrary rate in [1M, max_speed].

So driver isn't consistent in how it refers to the various types. Just
leave it.

>  	 *
>  	 * NOTE: B0 is not implemented.
>  	 */
> @@ -1286,6 +1285,7 @@ static int cp210x_tiocmset(struct tty_struct *tty,
>  		unsigned int set, unsigned int clear)
>  {
>  	struct usb_serial_port *port = tty->driver_data;
> +

Not needed.

>  	return cp210x_tiocmset_port(port, set, clear);
>  }
> 
> @@ -1552,7 +1552,7 @@ static int cp210x_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
>  /*
>   * This function is for configuring GPIO using shared pins, where other signals
>   * are made unavailable by configuring the use of GPIO. This is believed to be
> - * only applicable to the cp2105 at this point, the other devices supported by
> + * only applicable to the CP2105 at this point, the other devices supported by
>   * this driver that provide GPIO do so in a way that does not impact other
>   * signals and are thus expected to have very different initialisation.
>   */
> @@ -1561,7 +1561,7 @@ static int cp2105_gpioconf_init(struct usb_serial *serial)
>  	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
>  	struct cp210x_pin_mode mode;
>  	struct cp210x_dual_port_config config;
> -	u8 intf_num = cp210x_interface_num(serial);
> +	u8 iface_num = cp210x_interface_num(serial);

Not worth it.

>  	u8 iface_config;
>  	int result;
> 
> @@ -1577,8 +1577,8 @@ static int cp2105_gpioconf_init(struct usb_serial *serial)
>  	if (result < 0)
>  		return result;
> 
> -	/*  2 banks of GPIO - One for the pins taken from each serial port */
> -	if (intf_num == 0) {
> +	/* 2 banks of GPIO - One for the pins taken from each serial port */

Sure...but no.

> +	if (iface_num == 0) {
>  		if (mode.eci == CP210X_PIN_MODE_MODEM) {
>  			/* mark all GPIOs of this interface as reserved */
>  			priv->gpio_altfunc = 0xff;
> @@ -1590,7 +1590,7 @@ static int cp2105_gpioconf_init(struct usb_serial *serial)
>  						CP210X_ECI_GPIO_MODE_MASK) >>
>  						CP210X_ECI_GPIO_MODE_OFFSET);
>  		priv->gc.ngpio = 2;
> -	} else if (intf_num == 1) {
> +	} else if (iface_num == 1) {
>  		if (mode.sci == CP210X_PIN_MODE_MODEM) {
>  			/* mark all GPIOs of this interface as reserved */
>  			priv->gpio_altfunc = 0xff;
> @@ -1659,7 +1659,7 @@ static int cp2104_gpioconf_init(struct usb_serial *serial)
>  	 */
>  	for (i = 0; i < priv->gc.ngpio; ++i) {
>  		/*
> -		 * Set direction to "input" iff pin is open-drain and reset
> +		 * Set direction to "input" if pin is open-drain and reset

"iff" means "if and only if" so you're changing the meaning here.

>  		 * value is 1.
>  		 */
>  		if (!(priv->gpio_pushpull & BIT(i)) && (gpio_latch & BIT(i)))
> @@ -1733,7 +1733,7 @@ static int cp2102n_gpioconf_init(struct usb_serial *serial)
>  		 * For the QFN28 package, GPIO4-6 are controlled by
>  		 * the low three bits of the mode/latch fields.
>  		 * Contrary to the document linked above, the bits for
> -		 * the SUSPEND pins are elsewhere.  No alternate
> +		 * the SUSPEND pins are elsewhere. No alternate

Come on.

>  		 * function is available for these pins.
>  		 */
>  		priv->gc.ngpio = 7;
> @@ -1742,16 +1742,16 @@ static int cp2102n_gpioconf_init(struct usb_serial *serial)
>  	}
> 
>  	/*
> -	 * The CP2102N does not strictly has input and output pin modes,
> +	 * The CP2102N does not strictly have input and output pin modes,

This is a good one.

>  	 * it only knows open-drain and push-pull modes which is set at
> -	 * factory. An open-drain pin can function both as an
> +	 * the factory. An open-drain pin can function both as an

And this one perhaps.

>  	 * input or an output. We emulate input mode for open-drain pins
>  	 * by making sure they are not driven low, and we do not allow
>  	 * push-pull pins to be set as an input.
>  	 */
>  	for (i = 0; i < priv->gc.ngpio; ++i) {
>  		/*
> -		 * Set direction to "input" iff pin is open-drain and reset
> +		 * Set direction to "input" if pin is open-drain and reset

Again, you're actually breaking comments by replacing "iff" like this.

>  		 * value is 1.
>  		 */
>  		if (!(priv->gpio_pushpull & BIT(i)) && (gpio_latch & BIT(i)))

If you want you can submit a v2 which fixes the two obvious
spelling/grammar mistakes and the Hz capitalisation that you found.

But I strongly recommend you stop submitting patches like this. We have
a ton of real issues that needs tending too if you're looking for
something to work on.

Johan
