Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62A0E59E4F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 17:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfF1PBC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 11:01:02 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44889 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfF1PBC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 11:01:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id k18so6280366ljc.11
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2019 08:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n9qM3qr+fVookz0wZxz/98gyfwpmqDR+zvv2DeB/Wog=;
        b=cHj5mX0WaHHRh1Fzhtx4CrutIJwy6Yj4YWtsfR70jHGEYiT2GKYjiuMhWKY3W1mzcj
         4DuX/AVLgjxrludfeZmsnMYqeXkNdDUm8P74SBUYoGbXXXn7gWhxKP0ojIXpwppb6l3V
         cTQZhwxnamAJICvxPHQaVTAHTELZhBXWrXIwUhW8C3PHQA+FkvhlXToY6a9P0LQGWh5K
         QMnVQIrHMGXlkSQGogdoYTA5WyBLvd1qkzK/rCTMNQM5Dl81vMpv8zSFk3lzM4vLfd95
         GQvZy+mRt6opsb9nUdSWubssb92z5CQmopNiT+K/XvAQfkZcCiB58VH0ZtxFYbmUDmp9
         unhw==
X-Gm-Message-State: APjAAAXBEy/BsQF4e1c+unk/IN2B0YRZN/8T9wySbUaG4jIHVKNo3BsR
        p6/5vsaqNUShlt2O8MpEu7E=
X-Google-Smtp-Source: APXvYqyYzwPWZu0Q+y4ynf8F18MhjLRrPrQnBnZt5SyXtQqTPNCVM+6wdHl0AnqpZmUW1imPtUMXtQ==
X-Received: by 2002:a2e:9198:: with SMTP id f24mr6597846ljg.221.1561734059431;
        Fri, 28 Jun 2019 08:00:59 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id 72sm785615ljj.104.2019.06.28.08.00.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 08:00:57 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hgsMz-0006Hc-5d; Fri, 28 Jun 2019 17:00:57 +0200
Date:   Fri, 28 Jun 2019 17:00:57 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw
Subject: Re: [PATCH] [PATCH v5] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190628150057.GN508@localhost>
References: <20190613134544.6404-1-charlesyeh522@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613134544.6404-1-charlesyeh522@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 13, 2019 at 09:45:44PM +0800, Charles Yeh wrote:
> Prolific has developed a new USB to UART chip: PL2303HXN
> PL2303HXN : PL2303GC/PL2303GS/PL2303GT/PL2303GL/PL2303GE/PL2303GB
> The Vendor request used by the PL2303HXN (TYPE_HXN) is different from
> the existing PL2303 series (TYPE_HX & TYPE_01).
> Therefore, different Vendor requests are used to issue related commands.
> 
> 1. Added a new TYPE_HXN type in pl2303_type_data, and then executes
>    new Vendor request,new flow control and other related instructions
>    if TYPE_HXN is recognized.
> 
> 2. Because the new PL2303HXN only accept the new Vendor request,
>    the old Vendor request cannot be accepted (the error message
>    will be returned)
>    So first determine the TYPE_HX or TYPE_HXN through
>    PL2303_READ_TYPE_HX_STATUS in pl2303_startup.
> 
>   2.1 If the return message is "1", then the PL2303 is the existing
>       TYPE_HX/ TYPE_01 series.
>       The other settings in pl2303_startup are to continue execution.
>   2.2 If the return message is "not 1", then the PL2303 is the new
>       TYPE_HXN series.
>       The other settings in pl2303_startup are ignored.
>       (PL2303HXN will directly use the default value in the hardware,
>        no need to add additional settings through the software)
> 
> 3. In pl2303_open: Because TYPE_HXN is different from the instruction of reset
>    down/up stream used by TYPE_HX.
>    Therefore, we will also execute different instructions here.
> 
> 4. In pl2303_set_termios: The UART flow control instructions used by
>    TYPE_HXN/TYPE_HX/TYPE_01 are different.
>    Therefore, we will also execute different instructions here.
> 
> 5. In pl2303_vendor_read & pl2303_vendor_write, since TYPE_HXN is different
>    from the vendor request instruction used by TYPE_HX/TYPE_01,
>    it will also execute different instructions here.
> 
> 6. In pl2303_update_reg: TYPE_HXN used different register for flow control.
>    Therefore, we will also execute different instructions here.
> 
> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>

Sorry for not getting back to you on the clean ups yet. Just really
short on time these last few months.

We can merge your patch and I can just add those clean ups on top later.

But please fix the below first.

> ---
> changelog:
> v5:
> 1. Modify pl2303_update_reg

Surely you did more than just modify pl2303_update_reg (and that doesn't
explain how or why you did it).

Please be more specific in your changelogs.

> 2. Add a patch version on subject
> 3. Add a space after each colon at subject line
> ---
>  drivers/usb/serial/pl2303.c | 113 +++++++++++++++++++++++++++++-------
>  drivers/usb/serial/pl2303.h |   7 ++-
>  2 files changed, 97 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index 55122ac84518..22ad82aa3894 100644
> --- a/drivers/usb/serial/pl2303.c
> +++ b/drivers/usb/serial/pl2303.c
> @@ -47,6 +47,12 @@ static const struct usb_device_id id_table[] = {
>  	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_MOTOROLA) },
>  	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_ZTEK) },
>  	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_TB) },
> +	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GC) },
> +	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GB) },
> +	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GT) },
> +	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GL) },
> +	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GE) },
> +	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GS) },
>  	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID) },
>  	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID_RSAQ5) },
>  	{ USB_DEVICE(ATEN_VENDOR_ID, ATEN_PRODUCT_ID),
> @@ -129,9 +135,11 @@ MODULE_DEVICE_TABLE(usb, id_table);
>  
>  #define VENDOR_WRITE_REQUEST_TYPE	0x40
>  #define VENDOR_WRITE_REQUEST		0x01
> +#define VENDOR_WRITE_NREQUEST		0x80
>  
>  #define VENDOR_READ_REQUEST_TYPE	0xc0
>  #define VENDOR_READ_REQUEST		0x01
> +#define VENDOR_READ_NREQUEST		0x81
>  
>  #define UART_STATE_INDEX		8
>  #define UART_STATE_MSR_MASK		0x8b
> @@ -146,12 +154,20 @@ MODULE_DEVICE_TABLE(usb, id_table);
>  #define UART_CTS			0x80
>  
>  #define PL2303_FLOWCTRL_MASK		0xf0
> +#define PL2303_HXN_FLOWCTRL_MASK	0x1C
> +#define PL2303_READ_TYPE_HX_STATUS	0x8080

Add a newline here to separate the HXN register defines, and...

> +#define PL2303_HXN_FLOWCTRL		0x0A

...I'd move the HXN flow control mask here.

> +#define PL2303_HXN_CTRL_RTS_CTS		0x18
> +#define PL2303_HXN_CTRL_XON_XOFF	0x0C
> +#define PL2303_HXN_CTRL_NONE		0x1C
> +#define PL2303_HXN_RESET_DOWN_UPSTREAM	0x07

This register does more than reset the up- and downstream buffers. Your
documentation calls it "Chip reset control", so PL2303_HXN_RESET_CONTROL
might be a better name.

And move it before the flow-control register definition to keep them
sorted by address.

>  static void pl2303_set_break(struct usb_serial_port *port, bool enable);
>  
>  enum pl2303_type {
>  	TYPE_01,	/* Type 0 and 1 (difference unknown) */
>  	TYPE_HX,	/* HX version of the pl2303 chip */
> +	TYPE_HXN,	/* HXN version of the pl2303 chip */
>  	TYPE_COUNT
>  };
>  
> @@ -183,16 +199,26 @@ static const struct pl2303_type_data pl2303_type_data[TYPE_COUNT] = {
>  	[TYPE_HX] = {
>  		.max_baud_rate		= 12000000,
>  	},
> +	[TYPE_HXN] = {
> +		.max_baud_rate		= 12000000,
> +	},
>  };
>  
>  static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
>  							unsigned char buf[1])
>  {
>  	struct device *dev = &serial->interface->dev;
> +	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
>  	int res;
> +	u8 request;
> +
> +	if (spriv->type == &pl2303_type_data[TYPE_HXN])
> +		request = VENDOR_READ_NREQUEST;
> +	else
> +		request = VENDOR_READ_REQUEST;
>  
>  	res = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> -			VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
> +			request, VENDOR_READ_REQUEST_TYPE,
>  			value, 0, buf, 1, 100);
>  	if (res != 1) {
>  		dev_err(dev, "%s - failed to read [%04x]: %d\n", __func__,
> @@ -211,12 +237,19 @@ static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
>  static int pl2303_vendor_write(struct usb_serial *serial, u16 value, u16 index)
>  {
>  	struct device *dev = &serial->interface->dev;
> +	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
>  	int res;
> +	u8 request;
>  
>  	dev_dbg(dev, "%s - [%04x] = %02x\n", __func__, value, index);
>  
> +	if (spriv->type == &pl2303_type_data[TYPE_HXN])
> +		request = VENDOR_WRITE_NREQUEST;
> +	else
> +		request = VENDOR_WRITE_REQUEST;
> +
>  	res = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
> -			VENDOR_WRITE_REQUEST, VENDOR_WRITE_REQUEST_TYPE,
> +			request, VENDOR_WRITE_REQUEST_TYPE,
>  			value, index, NULL, 0, 100);
>  	if (res) {
>  		dev_err(dev, "%s - failed to write [%04x]: %d\n", __func__,
> @@ -231,12 +264,17 @@ static int pl2303_update_reg(struct usb_serial *serial, u8 reg, u8 mask, u8 val)
>  {
>  	int ret = 0;
>  	u8 *buf;
> +	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
>  
>  	buf = kmalloc(1, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
>  
> -	ret = pl2303_vendor_read(serial, reg | 0x80, buf);
> +	if (spriv->type == &pl2303_type_data[TYPE_HXN])
> +		ret = pl2303_vendor_read(serial, reg, buf);
> +	else
> +		ret = pl2303_vendor_read(serial, reg | 0x80, buf);

Ok, this will do for now, but we really should move that OR into the
read helper eventually.

> +
>  	if (ret)
>  		goto out_free;
>  
> @@ -319,6 +357,7 @@ static int pl2303_startup(struct usb_serial *serial)
>  	struct pl2303_serial_private *spriv;
>  	enum pl2303_type type = TYPE_01;
>  	unsigned char *buf;
> +	int res;
>  
>  	spriv = kzalloc(sizeof(*spriv), GFP_KERNEL);
>  	if (!spriv)
> @@ -340,26 +379,37 @@ static int pl2303_startup(struct usb_serial *serial)
>  		type = TYPE_01;		/* type 1 */
>  	dev_dbg(&serial->interface->dev, "device type: %d\n", type);
>  
> +	if (type == TYPE_HX) {
> +		res = usb_control_msg(serial->dev,
> +			usb_rcvctrlpipe(serial->dev, 0),
> +			VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
> +			PL2303_READ_TYPE_HX_STATUS, 0, buf, 1, 100);

Please indent continuation lines at least two tabs further.

> +		if (res != 1)
> +			type = TYPE_HXN;
> +	}
> +
>  	spriv->type = &pl2303_type_data[type];
>  	spriv->quirks = (unsigned long)usb_get_serial_data(serial);
>  	spriv->quirks |= spriv->type->quirks;
>  
>  	usb_set_serial_data(serial, spriv);
>  
> -	pl2303_vendor_read(serial, 0x8484, buf);
> -	pl2303_vendor_write(serial, 0x0404, 0);
> -	pl2303_vendor_read(serial, 0x8484, buf);
> -	pl2303_vendor_read(serial, 0x8383, buf);
> -	pl2303_vendor_read(serial, 0x8484, buf);
> -	pl2303_vendor_write(serial, 0x0404, 1);
> -	pl2303_vendor_read(serial, 0x8484, buf);
> -	pl2303_vendor_read(serial, 0x8383, buf);
> -	pl2303_vendor_write(serial, 0, 1);
> -	pl2303_vendor_write(serial, 1, 0);
> -	if (spriv->quirks & PL2303_QUIRK_LEGACY)
> -		pl2303_vendor_write(serial, 2, 0x24);
> -	else
> -		pl2303_vendor_write(serial, 2, 0x44);
> +	if (type != TYPE_HXN) {
> +		pl2303_vendor_read(serial, 0x8484, buf);
> +		pl2303_vendor_write(serial, 0x0404, 0);
> +		pl2303_vendor_read(serial, 0x8484, buf);
> +		pl2303_vendor_read(serial, 0x8383, buf);
> +		pl2303_vendor_read(serial, 0x8484, buf);
> +		pl2303_vendor_write(serial, 0x0404, 1);
> +		pl2303_vendor_read(serial, 0x8484, buf);
> +		pl2303_vendor_read(serial, 0x8383, buf);
> +		pl2303_vendor_write(serial, 0, 1);
> +		pl2303_vendor_write(serial, 1, 0);
> +		if (spriv->quirks & PL2303_QUIRK_LEGACY)
> +			pl2303_vendor_write(serial, 2, 0x24);
> +		else
> +			pl2303_vendor_write(serial, 2, 0x44);
> +	}
>  
>  	kfree(buf);
>  
> @@ -720,12 +770,26 @@ static void pl2303_set_termios(struct tty_struct *tty,
>  	if (C_CRTSCTS(tty)) {
>  		if (spriv->quirks & PL2303_QUIRK_LEGACY)
>  			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x40);
> -		else

You need to add bracket {} to all branches when adding to one branch, as
I've mentioned before.

> +		else if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
> +			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +			PL2303_HXN_FLOWCTRL_MASK, PL2303_HXN_CTRL_RTS_CTS);

Odd indentation; again use at least two tabs more for continuation
lines.

> +		} else {
>  			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x60);
> +		}
>  	} else if (pl2303_enable_xonxoff(tty, spriv->type)) {
> -		pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
> +		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
> +			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +			PL2303_HXN_FLOWCTRL_MASK, PL2303_HXN_CTRL_XON_XOFF);

Same here.

> +		} else {
> +			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
> +		}
>  	} else {
> -		pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
> +		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
> +			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +			PL2303_HXN_FLOWCTRL_MASK, PL2303_HXN_CTRL_NONE);

And here.

> +		} else {
> +			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
> +		}
>  	}
>  
>  	kfree(buf);
> @@ -766,8 +830,13 @@ static int pl2303_open(struct tty_struct *tty, struct usb_serial_port *port)
>  		usb_clear_halt(serial->dev, port->read_urb->pipe);
>  	} else {
>  		/* reset upstream data pipes */
> -		pl2303_vendor_write(serial, 8, 0);
> -		pl2303_vendor_write(serial, 9, 0);
> +		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
> +			pl2303_vendor_write(serial,
> +			PL2303_HXN_RESET_DOWN_UPSTREAM, 0);

Indentation again.

Also, as I've asked you already; why do you write 0 here to the
reset-control register when your documentation indicates that you should
be writing 0x3 to reset the upstream and downstream pipes. Please
explain and fix if necessary.

> +		} else {
> +			pl2303_vendor_write(serial, 8, 0);
> +			pl2303_vendor_write(serial, 9, 0);
> +		}
>  	}
>  
>  	/* Setup termios */
> diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
> index 559941ca884d..f1c8b5a36816 100644
> --- a/drivers/usb/serial/pl2303.h
> +++ b/drivers/usb/serial/pl2303.h
> @@ -20,7 +20,12 @@
>  #define PL2303_PRODUCT_ID_HCR331	0x331a
>  #define PL2303_PRODUCT_ID_MOTOROLA	0x0307
>  #define PL2303_PRODUCT_ID_ZTEK		0xe1f1
> -
> +#define PL2303_PRODUCT_ID_GC		0x23A3
> +#define PL2303_PRODUCT_ID_GB		0x23B3
> +#define PL2303_PRODUCT_ID_GT		0x23C3
> +#define PL2303_PRODUCT_ID_GL		0x23D3
> +#define PL2303_PRODUCT_ID_GE		0x23E3
> +#define PL2303_PRODUCT_ID_GS		0x23F3
>  
>  #define ATEN_VENDOR_ID		0x0557
>  #define ATEN_VENDOR_ID2		0x0547

Johan
