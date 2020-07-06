Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F218521545A
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 11:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbgGFJIR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 05:08:17 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40411 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbgGFJIR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 05:08:17 -0400
Received: by mail-lj1-f194.google.com with SMTP id n23so44428263ljh.7
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 02:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=q9XeN1Z7ZDkU/p2xrMAJrwaaL8aRsPWYOa1QuO1MMEA=;
        b=aQogoI22/JvxT8ExpzzgzA6bf6jy3pmCLlJe+pWebCucp/8XhxCRr8QHTJZlKcg1QA
         5a1ibltp148InNQthsCrilSaIFc139mgHX3ZYAOOnbY7Jhnzg5pzNiyPT7KkNt+xzXdo
         npl4QSNfdvtU2APGedXQ7rMzxZcm+LeOMrR1Fr0pXnlon+Jl+VNjUXY7sq0ZWvaRLEnT
         V2t1AqFugws9mTNt5XLPRvHYme4c7HK6OM7BL/Zut6tMe+xapq4uy/zDgXCyJkPSqWMe
         g5z+IAJ9dm68J3t/qzWOKX1kZdcwOrWepTJRhKfiA4LYalaNH9PPgHnxAyuo1Bnf3wCs
         +AHw==
X-Gm-Message-State: AOAM533z2Urmq0zfbt+KMztW6yA1aJpbfcfwGZ+UTtlGGokt3Lg06mIT
        TBMHMNRBczj7ZJvC2vT2dOt8SQnepOM=
X-Google-Smtp-Source: ABdhPJxK6vT6pRrq3tFJ9HWZFl8tlHDZZ0zOuQFdMH7hOIg0QQrFc7FCIg3n0STmKw9ZCAF4gQZozw==
X-Received: by 2002:a2e:6f08:: with SMTP id k8mr25964099ljc.384.1594026494125;
        Mon, 06 Jul 2020 02:08:14 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id r25sm10093385ljg.9.2020.07.06.02.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 02:08:13 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jsN6f-00025z-O2; Mon, 06 Jul 2020 11:08:10 +0200
Date:   Mon, 6 Jul 2020 11:08:09 +0200
From:   Johan Hovold <johan@kernel.org>
To:     =?utf-8?B?SmFyb23DrXIgxaBrb3JwaWw=?= <Jerry@jrr.cz>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200706090809.GH3453@localhost>
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
> 
> Signed-off-by: Jaromír Škorpil <Jerry@jrr.cz>
> ---
> v2: Simplified counting - only queue overrun checked
> v3: Changed description + UTF8 name
> v4: Corrected endian

So let's go with this and then I can add support for in-band reporting
on top.

I was gonna apply it and the missing locking, but noticed that the patch
is white-space damaged. At least some leading tabs have been converted.

Try sending the patch yourself (e.g. using git-send-email) and make sure
you can apply it using git-am.

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

Can you drop the SERIAL_ infix here?

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

Here should be a newline.

> +		if (flags & CP210X_SERIAL_ERR_BREAK)
> +			port->icount.brk++;
> +		if (flags & CP210X_SERIAL_ERR_FRAME)
> +			port->icount.frame++;
> +		if (flags & CP210X_SERIAL_ERR_QUEUE_OVERRUN)
> +			port->icount.overrun++;
> +		if (flags & CP210X_SERIAL_ERR_PARITY)
> +			port->icount.parity++;

And these icount increments should be done under the port->lock as
TIOCGICOUNT can be called in parallel.

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
>   
> +static int cp210x_get_icount(struct tty_struct *tty,
> +		struct serial_icounter_struct *icount)
> +{
> +	struct usb_serial_port *port = tty->driver_data;
> +	int result;
> +
> +	result = cp210x_get_comm_status(port, NULL);
> +	if (result)
> +		return result;
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
