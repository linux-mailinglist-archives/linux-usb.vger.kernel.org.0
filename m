Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915C020F3AD
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 13:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731800AbgF3LjO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 07:39:14 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37270 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731382AbgF3LjN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jun 2020 07:39:13 -0400
Received: by mail-lj1-f195.google.com with SMTP id e4so22074264ljn.4
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 04:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fJ9+N4LELNuafVlzbJ2byP1QztsHNirLA67/MKJ/T0U=;
        b=bBa0+/Pkdb19Mh6985mk3t9qm6O07UoUP+vJrkU1tqWoqKJ7bcPVGl5vv4lR9gUTHY
         16RjZUq2WYvbS5pS+IpvNXGT3Io2p/Yvby+e6HzG4oXz4nGd7R+Ay9MhY4fZQuvkeWf9
         Ivqf3kIGp/4uG7X9duxjA/FgWcwm1O6sL+KZ53ZqXWoPLDmIe51XZ8X80EK8ncf8ZYSt
         qLoV5tuXZNbFKsYpXVh/vzti18aBp+LQzjdt53/XH/skLxCd/wGudR9JSak3rHn3RO+8
         KJ1FNDxyCCP9DPZGP6clO4aUbUG20bj/+MhudyU1JMN27dwgbz5B3T/y6PUbvZgxbBO/
         se1A==
X-Gm-Message-State: AOAM530J50a1s/tsQ0ldA+JXUmF3muI3A3XCcx5amXS809KQkRhCMqFW
        X5beyoHdXl5D3eF9DBD7Q+7oXupTkcU=
X-Google-Smtp-Source: ABdhPJzxFIrJ0Mobi+vxedp6SKeh4kevhkg7B+qhfIUoJKYu4ihXUlUpSttfRgBEH0PN81zUB1FFjw==
X-Received: by 2002:a2e:9e58:: with SMTP id g24mr7074715ljk.278.1593517150069;
        Tue, 30 Jun 2020 04:39:10 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id i24sm719966lfg.83.2020.06.30.04.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 04:39:09 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jqEbS-0001Ec-TU; Tue, 30 Jun 2020 13:39:06 +0200
Date:   Tue, 30 Jun 2020 13:39:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH v2 6/6] USB: serial: ch341: Simulate break condition if
 not supported
Message-ID: <20200630113906.GA3334@localhost>
References: <cover.1585697281.git.public@hansmi.ch>
 <91bacfa4097350b4731724f5820e06bc03e7e8f3.1585697281.git.public@hansmi.ch>
 <20200514144721.GG25962@localhost>
 <6e29707b-6774-9f25-25ac-4b4cd202a017@msgid.hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e29707b-6774-9f25-25ac-4b4cd202a017@msgid.hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 28, 2020 at 12:21:11AM +0200, Michael Hanselmann wrote:
> On 14.05.20 16:47, Johan Hovold wrote:
> > On Tue, Mar 31, 2020 at 11:37:22PM +0000, Michael Hanselmann wrote:
> >>  static int ch341_set_baudrate_lcr(struct usb_device *dev,
> >> -				  struct ch341_private *priv, u8 lcr)
> >> +				  struct ch341_private *priv,
> >> +				  unsigned baud_rate, u8 lcr)
> > 
> > Use speed_t.
> 
> Done. ch341_private.baud_rate and ch341_set_termios also use unsigned
> though. Should those also be changed to speed_t?

I'd just leave it for now.

> >> +		r = ch341_set_baudrate_lcr(port->serial->dev, priv,
> >> +			CH341_MIN_BPS,
> >> +			CH341_LCR_ENABLE_RX | CH341_LCR_ENABLE_TX |
> > 
> > Hmm. This would corrupt incoming data as well during the break.
> 
> Yes, there's no way to avoid that. In my opinion being able to send a
> break signal for a serial console interrupt (SysRq) outweighs the
> corruption. Updated the comment on ch341_simulate_break to mention
> the caveat.
> 
> >> +	dev_dbg(&port->dev, "%s - Leave break state requested\n", __func__);
> >> +
> >> +	if (time_before(jiffies, priv->break_end)) {
> >> +		/* Wait until NUL byte is written */
> >> +		delay = min_t(unsigned long, HZ, priv->break_end - jiffies);
> > 
> > Looks like this can underflow if you're preempted after the check.
> 
> Moved the subtraction before the min_t macro to only evaluate it once.

That's not sufficient; the problem is that jiffies may be updated after
time_before().

> >> +	if (priv->quirks & CH341_QUIRK_SIMULATE_BREAK) {
> >> +		dev_warn_once(&port->dev,
> >> +			      "%s - hardware doesn't support real break"
> >> +			      " condition, simulating instead\n",
> >> +			      __func__);
> > 
> > Don't break the string, and drop the __func__.
> 
> Done, also for the other error messages you pointed out.
> 
> Michael
> 
> ---
> From 94fec46e814276491c9a027c5d3912b68deb9c55 Mon Sep 17 00:00:00 2001
> From: Michael Hanselmann <public@hansmi.ch>
> Date: Thu, 5 Mar 2020 01:50:35 +0100
> Subject: [PATCH 2/2] USB: serial: ch341: Simulate break condition if not
>  supported
> 
> A subset of all CH341 devices don't support a real break condition. This
> fact is already used in the "ch341_detect_quirks" function. With this
> change a quirk is implemented to simulate a break condition by
> temporarily lowering the baud rate and sending a NUL byte.
> 
> The primary drawbacks of this approach are that the duration of the
> break can't be controlled by userland and that data incoming during
> a simulated break is corrupted.
> 
> The "TTY_DRIVER_HARDWARE_BREAK" serial driver flag was investigated as
> an alternative. It's a driver-wide flag and would've required
> significant changes to the serial and USB-serial driver frameworks to
> expose it for individual USB-serial adapters.
> 
> Tested by sending a break condition and watching the TX pin using an
> oscilloscope.
> 
> Signed-off-by: Michael Hanselmann <public@hansmi.ch>
> ---
>  drivers/usb/serial/ch341.c | 105 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 97 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index 202cfa4ef6c7..1e63310cfd9c 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -78,6 +78,7 @@
>  #define CH341_LCR_CS5          0x00
>  
>  #define CH341_QUIRK_LIMITED_PRESCALER	BIT(0)
> +#define CH341_QUIRK_SIMULATE_BREAK	BIT(1)
>  
>  static const struct usb_device_id id_table[] = {
>  	{ USB_DEVICE(0x4348, 0x5523) },
> @@ -94,6 +95,7 @@ struct ch341_private {
>  	u8 msr;
>  	u8 lcr;
>  	unsigned long quirks;
> +	unsigned long break_end;
>  };
>  
>  static void ch341_set_termios(struct tty_struct *tty,
> @@ -168,10 +170,9 @@ static const speed_t ch341_min_rates[] = {
>   *		2 <= div <= 256 if fact = 0, or
>   *		9 <= div <= 256 if fact = 1
>   */
> -static int ch341_get_divisor(struct ch341_private *priv)
> +static int ch341_get_divisor(struct ch341_private *priv, speed_t speed)
>  {
>  	unsigned int fact, div, clk_div;
> -	speed_t speed = priv->baud_rate;
>  	bool force_fact0 = false;
>  	int ps;
>  
> @@ -234,15 +235,16 @@ static int ch341_get_divisor(struct ch341_private *priv)
>  }
>  
>  static int ch341_set_baudrate_lcr(struct usb_device *dev,
> -				  struct ch341_private *priv, u8 lcr)
> +				  struct ch341_private *priv,
> +				  speed_t baud_rate, u8 lcr)
>  {
>  	int val;
>  	int r;
>  
> -	if (!priv->baud_rate)
> +	if (!baud_rate)
>  		return -EINVAL;
>  
> -	val = ch341_get_divisor(priv);
> +	val = ch341_get_divisor(priv, baud_rate);
>  	if (val < 0)
>  		return -EINVAL;
>  
> @@ -322,7 +324,7 @@ static int ch341_configure(struct usb_device *dev, struct ch341_private *priv)
>  	if (r < 0)
>  		goto out;
>  
> -	r = ch341_set_baudrate_lcr(dev, priv, priv->lcr);
> +	r = ch341_set_baudrate_lcr(dev, priv, priv->baud_rate, priv->lcr);
>  	if (r < 0)
>  		goto out;
>  
> @@ -356,7 +358,7 @@ static int ch341_detect_quirks(struct usb_serial_port *port)
>  			    CH341_REG_BREAK, 0, buffer, size, DEFAULT_TIMEOUT);
>  	if (r == -EPIPE) {
>  		dev_dbg(&port->dev, "break control not supported\n");
> -		quirks = CH341_QUIRK_LIMITED_PRESCALER;
> +		quirks = CH341_QUIRK_LIMITED_PRESCALER | CH341_QUIRK_SIMULATE_BREAK;
>  		r = 0;
>  		goto out;
>  	}
> @@ -537,7 +539,8 @@ static void ch341_set_termios(struct tty_struct *tty,
>  	if (baud_rate) {
>  		priv->baud_rate = baud_rate;
>  
> -		r = ch341_set_baudrate_lcr(port->serial->dev, priv, lcr);
> +		r = ch341_set_baudrate_lcr(port->serial->dev, priv,
> +					   priv->baud_rate, lcr);
>  		if (r < 0 && old_termios) {
>  			priv->baud_rate = tty_termios_baud_rate(old_termios);
>  			tty_termios_copy_hw(&tty->termios, old_termios);
> @@ -556,15 +559,101 @@ static void ch341_set_termios(struct tty_struct *tty,
>  	ch341_set_handshake(port->serial->dev, priv->mcr);
>  }
>  
> +/*
> + * A subset of all CH34x devices don't support a real break condition and
> + * reading CH341_REG_BREAK fails (see also ch341_detect_quirks). This function
> + * simulates a break condition by lowering the baud rate to the minimum
> + * supported by the hardware upon enabling the break condition and sending
> + * a NUL byte.
> + *
> + * Incoming data is corrupted while the break condition is being simulated.
> + *
> + * Normally the duration of the break condition can be controlled individually
> + * by userspace using TIOCSBRK and TIOCCBRK or by passing an argument to
> + * TCSBRKP. Due to how the simulation is implemented the duration can't be
> + * controlled. The duration is always about (1s / 46bd * 9bit) = 196ms.
> + */
> +static void ch341_simulate_break(struct tty_struct *tty, int break_state)
> +{
> +	struct usb_serial_port *port = tty->driver_data;
> +	struct ch341_private *priv = usb_get_serial_port_data(port);
> +	unsigned long delay;
> +	int r;
> +
> +	if (break_state != 0) {
> +		dev_dbg(&port->dev, "enter break state requested\n");
> +
> +		r = ch341_set_baudrate_lcr(port->serial->dev, priv,
> +			CH341_MIN_BPS,
> +			CH341_LCR_ENABLE_RX | CH341_LCR_ENABLE_TX |
> +			CH341_LCR_CS8);

Continuation lines should be indented at least two tabs further.

And let's just merge the last two lines.

> +		if (r < 0) {
> +			dev_err(&port->dev,
> +				"failed to change baud rate to %u: %d\n",
> +				CH341_MIN_BPS, r);
> +			goto restore;
> +		}
> +
> +		r = tty_put_char(tty, '\0');
> +		if (r < 0) {
> +			dev_err(&port->dev,
> +				"failed to write NUL byte for simulated break condition: %d\n",
> +				r);
> +			goto restore;
> +		}
> +
> +		/*
> +		 * Compute how long transmission will take and add a bit of
> +		 * safety margin.
> +		 */

Where's that margin?

> +		priv->break_end = jiffies + (10 * HZ / CH341_MIN_BPS);
> +
> +		return;
> +	}
> +
> +	dev_dbg(&port->dev, "leave break state requested\n");
> +
> +	if (time_before(jiffies, priv->break_end)) {
> +		/*
> +		 * Wait until NUL byte is written and limit delay to one second
> +		 * at most.
> +		 */

So you could still be preempted here so that delay would wrap. Just
store jiffies in a "now" temporary before the conditional?

> +		delay = priv->break_end - jiffies;
> +		delay = min_t(unsigned long, HZ, delay);

And then you can skip the min_t() here.

> +
> +		dev_dbg(&port->dev,
> +			"wait %d ms while transmitting NUL byte at %u baud\n",
> +			jiffies_to_msecs(delay), CH341_MIN_BPS);
> +		schedule_timeout_interruptible(delay);
> +	}
> +
> +restore:
> +	/* Restore original baud rate */
> +	r = ch341_set_baudrate_lcr(port->serial->dev, priv, priv->baud_rate,
> +				   priv->lcr);
> +	if (r < 0)
> +		dev_err(&port->dev,
> +			"restoring original baud rate of %u failed: %d\n",
> +			priv->baud_rate, r);
> +}
> +
>  static void ch341_break_ctl(struct tty_struct *tty, int break_state)
>  {
>  	const uint16_t ch341_break_reg =
>  			((uint16_t) CH341_REG_LCR << 8) | CH341_REG_BREAK;
>  	struct usb_serial_port *port = tty->driver_data;
> +	struct ch341_private *priv = usb_get_serial_port_data(port);
>  	int r;
>  	uint16_t reg_contents;
>  	uint8_t *break_reg;
>  
> +	if (priv->quirks & CH341_QUIRK_SIMULATE_BREAK) {
> +		dev_warn_once(&port->dev,
> +			      "hardware doesn't support real break condition, simulating instead\n");

This should probably be moved to probe and quirk_detect() and be a
dev_info (e.g. consider having two of these devices in a system).

> +		ch341_simulate_break(tty, break_state);
> +		return;
> +	}
> +
>  	break_reg = kmalloc(2, GFP_KERNEL);
>  	if (!break_reg)
>  		return;

Care to respin as a v4?

Johan
