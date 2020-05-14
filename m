Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B78D1D3369
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 16:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgENOrX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 10:47:23 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45345 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgENOrW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 10:47:22 -0400
Received: by mail-lj1-f194.google.com with SMTP id h4so3772139ljg.12
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 07:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yHnpvpv/o4nVosxDtGk6FynEs1czHgXyL3CNNV2NHfI=;
        b=lOm+B/V9g61yTusCWICsddPoSMk+guB8mqpATTNJxEVK3CfDWKt0vW3vE8SJ1rM1BQ
         Jk3FHai9oqZmmNcua+sPCDmCTlDIKw19qpoP75CN+Aht6PXvE8pcONo5EHmuZJGZMqEx
         32AV4iYWW4utaOx3WbRaXd42jRnr0RToxGhxfvZfpqaj4MR41oVTX+iHyrjulmNHgCIU
         V0AGQjsIVpay+SWOwN+i9RVDnemeV8paZRaT0QYgWFKdnDsL7YqUp6WzESHXgL3GBp5G
         wlVUIfWjdF9HCTx/psAf+ihP+UKlzChV7WzDffyqYEWkGOB630gtvMr7XvPkD5J8tQbX
         s/3g==
X-Gm-Message-State: AOAM532h1dOJqvDAUeUuhQYF2hunmidJhhnzWMHFnRiS0GuR5SPaQ0kE
        1MTh8YnJvBQXLzSPGNVJpGCVTdbd
X-Google-Smtp-Source: ABdhPJx+bmphFqrWbb0nkfK5t6EP6cBJVKRzEXReqVYAgaxpmJl4/Xkw60ir2AQAEnYC+ewJejwfsg==
X-Received: by 2002:a05:651c:c8:: with SMTP id 8mr2876862ljr.182.1589467639142;
        Thu, 14 May 2020 07:47:19 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id g11sm1618636ljg.24.2020.05.14.07.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:47:18 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jZF8r-0006sP-I8; Thu, 14 May 2020 16:47:21 +0200
Date:   Thu, 14 May 2020 16:47:21 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH v2 6/6] USB: serial: ch341: Simulate break condition if
 not supported
Message-ID: <20200514144721.GG25962@localhost>
References: <cover.1585697281.git.public@hansmi.ch>
 <91bacfa4097350b4731724f5820e06bc03e7e8f3.1585697281.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91bacfa4097350b4731724f5820e06bc03e7e8f3.1585697281.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 31, 2020 at 11:37:22PM +0000, Michael Hanselmann wrote:
> A subset of all CH341 devices don't support a real break condition. This
> fact is already used in the "ch341_detect_quirks" function. With this
> change a quirk is implemented to simulate a break condition by
> temporarily lowering the baud rate and sending a NUL byte.
> 
> The primary drawback of this approach is that the duration of the break
> can't be controlled by userland.
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
>  drivers/usb/serial/ch341.c | 95 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 85 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index c820772e6a07..fc8ef816d143 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -25,6 +25,7 @@
>  #define DEFAULT_TIMEOUT   1000
>  
>  #define CH341_QUIRK_LIMITED_PRESCALER 0x01
> +#define CH341_QUIRK_SIMULATE_BREAK    0x02
>
>  /* flags for IO-Bits */
>  #define CH341_BIT_RTS (1 << 6)
> @@ -94,6 +95,7 @@ struct ch341_private {
>  	u8 msr;
>  	u8 lcr;
>  	u8 quirks;
> +	unsigned long break_end;
>  };
>  
>  static void ch341_set_termios(struct tty_struct *tty,
> @@ -203,14 +205,11 @@ static int ch341_calc_divisor(speed_t speed, unsigned int ps,
>   *		2 <= div <= 256 if fact = 0, or
>   *		9 <= div <= 256 if fact = 1
>   */
> -static int ch341_get_divisor(struct ch341_private *priv)
> +static int ch341_get_divisor(struct ch341_private *priv, speed_t speed)
>  {
> -	speed_t speed;
>  	unsigned int fact, div, clk_div;
>  	int ps;
>  
> -	speed = priv->baud_rate;
> -
>  	/*
>  	 * Clamp to supported range, making the later range sanity checks
>  	 * redundant.
> @@ -282,15 +281,16 @@ static int ch341_get_divisor(struct ch341_private *priv)
>  }
>  
>  static int ch341_set_baudrate_lcr(struct usb_device *dev,
> -				  struct ch341_private *priv, u8 lcr)
> +				  struct ch341_private *priv,
> +				  unsigned baud_rate, u8 lcr)

Use speed_t.

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
> @@ -369,7 +369,7 @@ static int ch341_configure(struct usb_device *dev, struct ch341_private *priv)
>  	if (r < 0)
>  		goto out;
>  
> -	r = ch341_set_baudrate_lcr(dev, priv, priv->lcr);
> +	r = ch341_set_baudrate_lcr(dev, priv, priv->baud_rate, priv->lcr);
>  	if (r < 0)
>  		goto out;
>  
> @@ -401,7 +401,7 @@ static int ch341_detect_quirks(struct usb_device *dev)
>  	if (r == -EPIPE) {
>  		dev_dbg(&dev->dev, "%s - reading break condition register"
>  			" failed (%d)\n", __func__, r);
> -		r = CH341_QUIRK_LIMITED_PRESCALER;
> +		r = CH341_QUIRK_LIMITED_PRESCALER | CH341_QUIRK_SIMULATE_BREAK;
>  		goto out;
>  	}
>  
> @@ -579,7 +579,8 @@ static void ch341_set_termios(struct tty_struct *tty,
>  	if (baud_rate) {
>  		priv->baud_rate = baud_rate;
>  
> -		r = ch341_set_baudrate_lcr(port->serial->dev, priv, lcr);
> +		r = ch341_set_baudrate_lcr(port->serial->dev, priv,
> +					   priv->baud_rate, lcr);
>  		if (r < 0 && old_termios) {
>  			priv->baud_rate = tty_termios_baud_rate(old_termios);
>  			tty_termios_copy_hw(&tty->termios, old_termios);
> @@ -598,15 +599,89 @@ static void ch341_set_termios(struct tty_struct *tty,
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
> + * Normally the duration of the break condition can be controlled individually
> + * by userspace using TIOCSBRK and TIOCCBRK or by passing an argument to
> + * TCSBRKP. Due to how the simulation is implemented the duration can't be
> + * controlled. The duration is always 1s / 46bd * 10bit = 217ms.
> + */
> +static void ch341_simulate_break(struct tty_struct *tty, int break_state)
> +{
> +	struct usb_serial_port *port = tty->driver_data;
> +	struct ch341_private *priv = usb_get_serial_port_data(port);
> +	unsigned long delay;
> +	int r;
> +
> +	if (break_state != 0) {
> +		dev_dbg(&port->dev, "%s - Enter break state requested\n",
> +			__func__);
> +
> +		r = ch341_set_baudrate_lcr(port->serial->dev, priv,
> +			CH341_MIN_BPS,
> +			CH341_LCR_ENABLE_RX | CH341_LCR_ENABLE_TX |

Hmm. This would corrupt incoming data as well during the break.

> +			CH341_LCR_CS8);
> +		if (r < 0) {
> +			dev_err(&port->dev, "%s - baud rate status %d\n",
> +				__func__, r);

Spell out error messages instead of relying on __func__; "failed to
change baudrate: %d\n"?

> +			goto restore;
> +		}
> +
> +		r = tty_put_char(tty, '\0');
> +		if (r < 0) {
> +			dev_err(&port->dev, "%s - write status %d\n",
> +				__func__, r);

ditto

> +			goto restore;
> +		}
> +
> +		priv->break_end = jiffies + (10 * HZ / CH341_MIN_BPS);
> +
> +		return;
> +	}
> +
> +	dev_dbg(&port->dev, "%s - Leave break state requested\n", __func__);
> +
> +	if (time_before(jiffies, priv->break_end)) {
> +		/* Wait until NUL byte is written */
> +		delay = min_t(unsigned long, HZ, priv->break_end - jiffies);

Looks like this can underflow if you're preempted after the check.

> +
> +		dev_dbg(&port->dev, "%s - sleep for %d ms\n", __func__,
> +			jiffies_to_msecs(delay));
> +		schedule_timeout_interruptible(delay);
> +	}
> +
> +restore:
> +	/* Restore original baud rate */
> +	r = ch341_set_baudrate_lcr(port->serial->dev, priv, priv->baud_rate,
> +				   priv->lcr);
> +	if (r < 0)
> +		dev_err(&port->dev, "%s - baud rate status %d\n", __func__, r);
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
> +			      "%s - hardware doesn't support real break"
> +			      " condition, simulating instead\n",
> +			      __func__);

Don't break the string, and drop the __func__.

> +		ch341_simulate_break(tty, break_state);
> +		return;
> +	}
> +
>  	break_reg = kmalloc(2, GFP_KERNEL);
>  	if (!break_reg)
>  		return;

Johan
