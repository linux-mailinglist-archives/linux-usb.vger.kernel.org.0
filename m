Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2972E27C239
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 12:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgI2KTX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 06:19:23 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43529 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgI2KTX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 06:19:23 -0400
Received: by mail-lf1-f66.google.com with SMTP id y2so4817882lfy.10
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 03:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xeQEfzCyevuRnrCLm3bYghFyZR+Fm4mV3CWVzjL/uIk=;
        b=bAczAdX1RFvyKM/nSuawgxA8bL0/nnxwhYRiuipmUUatpon2fEPo+Sw4gnXghV4jHM
         D7OBT7xwQPUwZgPnEcHn8d5QzkvV1NEAEknLo/HGLFpQIt07+kcDt4ZDnZsV4z0cqlpf
         8rE8Ak5UgM0rcefAOQqMeIXAHcqXo10PwCSETWzNoxcC1m1qGBTCY6xyFFxfS04DVgPJ
         InZJdN4zgmvInt1NpOPxu5+peB3NM76TBT1eTfM15Zgjapwg9fD5e/nAMrL2wm6lnxE7
         bTEtsQpEO3njqg8CVvWsU4nhwFoOEDaHOkg+rutZCa81Om/eybRKoIEPzFIZTJ7cEWrP
         Iwxg==
X-Gm-Message-State: AOAM5336wD/AcpdcashWXMQZBns8tyggKzZIbWHLgjfH338uYy+xpUbN
        HjWC9C+9HUORvpO3ix70hnoFMZ713Vg=
X-Google-Smtp-Source: ABdhPJypzZzw2qnX/7OOeVZ+YyP4f9BV/D30APsGstO3JKKi1RAKpj84GEARatpgQCcbqS/ajsBwwg==
X-Received: by 2002:a19:b55:: with SMTP id 82mr900392lfl.43.1601374759653;
        Tue, 29 Sep 2020 03:19:19 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id c69sm3145087lfd.88.2020.09.29.03.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:19:18 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kNCj3-0001VV-K6; Tue, 29 Sep 2020 12:19:13 +0200
Date:   Tue, 29 Sep 2020 12:19:13 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "Mychaela N. Falconia" <falcon@freecalypso.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        mychaela.falconia@gmail.com
Subject: Re: [PATCH 3/3] USB: serial: ftdi_sio: add support for FreeCalypso
 DUART28C adapter
Message-ID: <20200929101913.GS24441@localhost>
References: <20200916015644.B89E1374026F@freecalypso.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916015644.B89E1374026F@freecalypso.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 16, 2020 at 01:56:44AM +0000, Mychaela N. Falconia wrote:
> FreeCalypso DUART28C is an FT2232D-based USB to dual UART adapter
> with a special quirk: Channel B RTS and DTR outputs (BDBUS2 and BDBUS4
> on the chip) have been repurposed to drive power and reset controls
> on Calypso targets.  The circuit is wired such that BDBUS[24] high
> (RTS/DTR inactive) is the normal state with power/reset control
> NOT activated, whereas BDBUS[24] low (RTS or DTR active) turn ON
> the corresponding power/reset control drivers.
> 
> A special ftdi_sio driver quirk is needed in order to suppress
> automatic assertion of DTR & RTS on device open: this device's
> special power and reset control drivers MUST NOT be activated
> when the port is ordinarily opened for plain serial communication,
> instead they must only be activated when a special userspace
> application explicitly requests such activation with a TIOCMBIS ioctl.
> 
> The special quirk is conditionalized on the DUART28C adapter's custom
> USB ID, and is further limited to FT2232D Channel B only: Channel A
> is wired normally, with the chip's ADBUS2 and ADBUS4 outputs
> actually being RTS and DTR rather than something else.
> 
> Signed-off-by: Mychaela N. Falconia <falcon@freecalypso.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 51 +++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index cdf4f4e05fb2..73c6b4e2c3e4 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -69,6 +69,8 @@ struct ftdi_private {
>  				   this value */
>  	int force_rtscts;	/* if non-zero, force RTS-CTS to always
>  				   be enabled */
> +	int no_auto_dtr_rts;	/* if non-zero, suppress automatic assertion
> +				   of DTR & RTS on device open */
>  
>  	unsigned int latency;		/* latency setting in use */
>  	unsigned short max_packet_size;
> @@ -99,6 +101,8 @@ static void  ftdi_USB_UIRT_setup(struct usb_serial_port *port,
>  				 struct ftdi_private *priv);
>  static void  ftdi_HE_TIRA1_setup(struct usb_serial_port *port,
>  				 struct ftdi_private *priv);
> +static void  ftdi_duart28c_setup(struct usb_serial_port *port,
> +				 struct ftdi_private *priv);
>  
>  static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
>  	.probe	= ftdi_jtag_probe,
> @@ -124,6 +128,10 @@ static const struct ftdi_sio_quirk ftdi_8u2232c_quirk = {
>  	.probe	= ftdi_8u2232c_probe,
>  };
>  
> +static const struct ftdi_sio_quirk ftdi_duart28c_quirk = {
> +	.port_probe = ftdi_duart28c_setup,
> +};
> +
>  /*
>   * The 8U232AM has the same API as the sio except for:
>   * - it can support MUCH higher baudrates; up to:
> @@ -1044,6 +1052,8 @@ static const struct usb_device_id id_table_combined[] = {
>  		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
>  	{ USB_DEVICE(FTDI_VID, FTDI_FALCONIA_JTAG_UNBUF_PID),
>  		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
> +	{ USB_DEVICE(FTDI_VID, FTDI_FALCONIA_DUART28C_PID),
> +		.driver_info = (kernel_ulong_t)&ftdi_duart28c_quirk },

Make sure that this patch adds the dual-port PID define as well.

>  	{ }					/* Terminating entry */
>  };
>  
> @@ -2388,6 +2398,37 @@ static int ftdi_stmclite_probe(struct usb_serial *serial)
>  	return 0;
>  }
>  
> +/*
> + * FreeCalypso DUART28C is an FT2232D-based USB to dual UART adapter
> + * with a special quirk: Channel B RTS and DTR outputs (BDBUS2 and BDBUS4
> + * on the chip) have been repurposed to drive power and reset controls
> + * on Calypso targets.  The circuit is wired such that BDBUS[24] high
> + * (RTS/DTR inactive) is the normal state with power/reset control
> + * NOT activated, whereas BDBUS[24] low (RTS or DTR active) turn ON
> + * the corresponding power/reset control drivers.
> + *
> + * A special ftdi_sio driver quirk is needed in order to suppress
> + * automatic assertion of DTR & RTS on device open: this device's
> + * special power and reset control drivers MUST NOT be activated
> + * when the port is ordinarily opened for plain serial communication,
> + * instead they must only be activated when a special userspace
> + * application explicitly requests such activation with a TIOCMBIS ioctl.
> + *
> + * The special quirk must be applied only to FT2232D Channel B:
> + * Channel A is wired normally, with the chip's ADBUS2 and ADBUS4 outputs
> + * actually being RTS and DTR rather than something else.
> + */
> +static void ftdi_duart28c_setup(struct usb_serial_port *port,
> +				struct ftdi_private *priv)
> +{
> +	struct usb_serial *serial = port->serial;
> +	struct usb_device *udev = serial->dev;
> +	struct usb_interface *interface = serial->interface;
> +
> +	if (interface == udev->actconfig->interface[1])

Driver's shouldn't rely on the order of these pointers. I've prepared a
patch to fix up the other instances in this driver, and please use
bNumInterfaces here as well.

> +		priv->no_auto_dtr_rts = 1;
> +}
> +
>  static int ftdi_sio_port_remove(struct usb_serial_port *port)
>  {
>  	struct ftdi_private *priv = usb_get_serial_port_data(port);
> @@ -2440,9 +2481,10 @@ static void ftdi_dtr_rts(struct usb_serial_port *port, int on)
>  		}
>  	}
>  	/* drop RTS and DTR */
> -	if (on)
> -		set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
> -	else
> +	if (on) {
> +		if (!priv->no_auto_dtr_rts)
> +			set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
> +	} else
>  		clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);

If we are to add this, then you shouldn't allow for automatic deassert
either.

>  }
>  
> @@ -2790,7 +2832,8 @@ static void ftdi_set_termios(struct tty_struct *tty,
>  			dev_err(ddev, "%s urb failed to set baudrate\n", __func__);
>  		mutex_unlock(&priv->cfg_lock);
>  		/* Ensure RTS and DTR are raised when baudrate changed from 0 */
> -		if (old_termios && (old_termios->c_cflag & CBAUD) == B0)
> +		if (old_termios && (old_termios->c_cflag & CBAUD) == B0
> +		    && !priv->no_auto_dtr_rts)
>  			set_mctrl(port, TIOCM_DTR | TIOCM_RTS);

Same here.

>  	}

And then there's CRTSCTS of course...

Johan
