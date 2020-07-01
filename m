Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD100210F95
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 17:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731914AbgGAPnG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 11:43:06 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44561 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728796AbgGAPnG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 11:43:06 -0400
Received: by mail-lj1-f194.google.com with SMTP id s9so27590358ljm.11
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 08:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SSzhwf9gu55iDyLJBl9jIjPszlA/RrAEyoHQy2ruqS4=;
        b=lK4AUi+fzbaF7fjL55KI0d7E76e+Q1F17pSrbRLcR2V+q8Tsz3wXQwhXYwvBIL4C/w
         F+E2hTLJ84EdPo6cdXT8fqnLrdalYDrCHU9l8FJ5+VKFNqbCp4Vg/Ja+WeTLN41kpgMi
         zIfbNEBs8GWH80eW7Qa6YR0ZN1OG7nL6PaxpOYg8s9QHlyLVvPGXgvXfekN81V2AnpqM
         Fob18NFvZ9Agtoy43qFmiWDTKXc2OkBBv199oid5a1IECGWbsjPJWacsjCQOzwjG2+GM
         unMOdi96emkPa+qXMHJ4eXyc1UlPVekXow+8J8Nr1C/K8DMHzaL63ZRvJ6PTg8e739uW
         D42A==
X-Gm-Message-State: AOAM531q51jVTwiSgt+hNaDR3xlItjckmXuTzUsR1br3WXPGY6+kezN6
        qQ4rRQYf+l67nDFvBoW5I4pNnzmhIdM=
X-Google-Smtp-Source: ABdhPJyRjq/7KCdaay97RbvQzJMcsmsL32doTLkjzn5jJpi3/letVVvsQDtBTAJXVibn6n1KaWSWEQ==
X-Received: by 2002:a2e:9641:: with SMTP id z1mr10578124ljh.173.1593618182551;
        Wed, 01 Jul 2020 08:43:02 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id z12sm2178123lfh.61.2020.07.01.08.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 08:43:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jqesz-0000wS-AT; Wed, 01 Jul 2020 17:42:57 +0200
Date:   Wed, 1 Jul 2020 17:42:57 +0200
From:   Johan Hovold <johan@kernel.org>
To:     =?utf-8?B?SmFyb23DrXIgxaBrb3JwaWw=?= <Jerry@jrr.cz>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200701154257.GF3334@localhost>
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
 <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
 <20200622053146.GB134804@kroah.com>
 <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 22, 2020 at 05:13:41PM +0200, Jaromír Škorpil wrote:
> The current version of cp210x driver doesn't provide any way to detect
> a parity error in received data from userspace. Some serial protocols like
> STM32 bootloader protect data only by parity so application needs to
> know whether parity error happened to repeat peripheral data reading.
> 
> Added support for icount (ioctl TIOCGICOUNT) which sends GET_COMM_STATUS
> command to CP210X and according received flags increments fields for
> parity error, frame error, break and overrun. An application can detect
> an error condition after reading data from ttyUSB and reacts adequately.
> There is no impact for applications which don't call ioctl TIOCGICOUNT.
> 
> The flag "hardware overrun" is not examined because CP2102 sets this bit
> for the first received byte after openning of port which was previously
> closed with some unreaded data in buffer. This is confusing and checking
> "queue overrun" flag seems be enough.

It would be better if could detect both types of overrun.

Did you try moving the purge command at close to after disabling the
uart?

Or perhaps we can add a "dummy" comm-status command after disabling the
uart?

> Signed-off-by: Jaromír Škorpil <Jerry@jrr.cz>
> ---
> v2: Simplified counting - only queue overrun checked
> v3: Changed description + UTF8 name
> v4: Corrected endian
> 
>   cp210x.c |   43 ++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 38 insertions(+), 5 deletions(-)
> 
> diff -up linux-5.8-rc1/drivers/usb/serial/cp210x.c j/drivers/usb/serial/cp210x.c
> --- linux-5.8-rc1/drivers/usb/serial/cp210x.c
> +++ j/drivers/usb/serial/cp210x.c
> @@ -43,6 +43,8 @@ static int cp210x_tiocmget(struct tty_st
>   static int cp210x_tiocmset(struct tty_struct *, unsigned int, unsigned int);
>   static int cp210x_tiocmset_port(struct usb_serial_port *port,
>   		unsigned int, unsigned int);
> +static int cp210x_get_icount(struct tty_struct *tty,
> +		struct serial_icounter_struct *icount);
>   static void cp210x_break_ctl(struct tty_struct *, int);
>   static int cp210x_attach(struct usb_serial *);
>   static void cp210x_disconnect(struct usb_serial *);
> @@ -274,6 +276,7 @@ static struct usb_serial_driver cp210x_d
>   	.tx_empty		= cp210x_tx_empty,
>   	.tiocmget		= cp210x_tiocmget,
>   	.tiocmset		= cp210x_tiocmset,
> +	.get_icount		= cp210x_get_icount,
>   	.attach			= cp210x_attach,
>   	.disconnect		= cp210x_disconnect,
>   	.release		= cp210x_release,
> @@ -393,6 +396,13 @@ struct cp210x_comm_status {
>   	u8       bReserved;
>   } __packed;
>   
> +/* cp210x_comm_status::ulErrors */
> +#define CP210X_SERIAL_ERR_BREAK	BIT(0)
> +#define CP210X_SERIAL_ERR_FRAME	BIT(1)
> +#define CP210X_SERIAL_ERR_HW_OVERRUN	BIT(2)
> +#define CP210X_SERIAL_ERR_QUEUE_OVERRUN	BIT(3)
> +#define CP210X_SERIAL_ERR_PARITY	BIT(4)
> +
>   /*
>    * CP210X_PURGE - 16 bits passed in wValue of USB request.
>    * SiLabs app note AN571 gives a strange description of the 4 bits:
> @@ -836,10 +846,10 @@ static void cp210x_close(struct usb_seri
>   }
>   
>   /*
> - * Read how many bytes are waiting in the TX queue.
> + * Read how many bytes are waiting in the TX queue and update error counters.
>    */
> -static int cp210x_get_tx_queue_byte_count(struct usb_serial_port *port,
> -		u32 *count)
> +static int cp210x_get_comm_status(struct usb_serial_port *port,
> +		u32 *tx_count)
>   {
>   	struct usb_serial *serial = port->serial;
>   	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
> @@ -855,7 +865,17 @@ static int cp210x_get_tx_queue_byte_coun
>   			0, port_priv->bInterfaceNumber, sts, sizeof(*sts),
>   			USB_CTRL_GET_TIMEOUT);
>   	if (result == sizeof(*sts)) {
> -		*count = le32_to_cpu(sts->ulAmountInOutQueue);
> +		u32 flags = le32_to_cpu(sts->ulErrors);
> +		if (flags & CP210X_SERIAL_ERR_BREAK)
> +			port->icount.brk++;
> +		if (flags & CP210X_SERIAL_ERR_FRAME)
> +			port->icount.frame++;
> +		if (flags & CP210X_SERIAL_ERR_QUEUE_OVERRUN)
> +			port->icount.overrun++;
> +		if (flags & CP210X_SERIAL_ERR_PARITY)
> +			port->icount.parity++;
> +		if (tx_count)
> +			*tx_count = le32_to_cpu(sts->ulAmountInOutQueue);
>   		result = 0;
>   	} else {
>   		dev_err(&port->dev, "failed to get comm status: %d\n", result);
> @@ -873,13 +893,26 @@ static bool cp210x_tx_empty(struct usb_s
>   	int err;
>   	u32 count;
>   
> -	err = cp210x_get_tx_queue_byte_count(port, &count);
> +	err = cp210x_get_comm_status(port, &count);
>   	if (err)
>   		return true;
>   
>   	return !count;
>   }

It seems a bit weird to be updating the error counters while polling
for tx-empty during close. How about having cp210x_get_comm_status()
take two u32 pointers for tx_count and errors and only pass in one or
the other from cp210x_tx_empty() and cp210x_get_icount() respectively?

> +static int cp210x_get_icount(struct tty_struct *tty,
> +		struct serial_icounter_struct *icount)
> +{
> +	struct usb_serial_port *port = tty->driver_data;
> +	int result;
> +
> +	result = cp210x_get_comm_status(port, NULL);
> +	if (result)
> +		return result;

And then you update the error counters here, preferably under the port
lock.

> +
> +	return usb_serial_generic_get_icount(tty, icount);
> +}
> +
>   /*
>    * cp210x_get_termios
>    * Reads the baud rate, data bits, parity, stop bits and flow control mode
> 
> 
> 

Johan
