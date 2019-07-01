Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1905BCFA
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 15:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbfGANcn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 09:32:43 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33611 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728547AbfGANcn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 09:32:43 -0400
Received: by mail-lf1-f68.google.com with SMTP id y17so8840871lfe.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Jul 2019 06:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sMOE07bRcjzYONBWg0XOmG2zFTNx/piwAj9SIxgwWMM=;
        b=CpReNcZyccfDuUHwYVZKa7ZQkAji1ZnT7cRDp0YLp0LzkbMsiIxKR1Z6qYEsQakZAl
         7YyWjts0K/mhhoLe0nU8ZFAwmzQTY/7fylkzecScwO1jYMtI1Q5dZ3wT1iI5jr2xytp0
         Pafq2tNdjcRaMzOc9TOiNqKnEgmvfuHKgL3i0d6jaoYX0h8s9dsipHPL2nQB4uQ9koqx
         51V6/xfAbFx4qBBappIOehGgi+nborQUDgPVIAZB/Rkd5nXaWIB34blhaAzWfr61LDFx
         hZFsVyEAIXrhbyUoKCB4ZlR+u9TX/tMbAUjsIt88p73S+zS6HFNu2opx9GZuK507DSYf
         CddQ==
X-Gm-Message-State: APjAAAWiJYJpHfzephAwTpJs1aY4HDUIxFAwR+F5F+wHA+pAYhWT2MOj
        3/f+S2x8JKJ+IHeuoHK/3HvBbWLP39s=
X-Google-Smtp-Source: APXvYqxspbMfNF/yGPcAE+A50b1owAYGcratqbYCAQKuib5u0qyP+p/++sAOdHxg3nzC/5i/s+5hhQ==
X-Received: by 2002:ac2:5dc3:: with SMTP id x3mr11586355lfq.168.1561987960394;
        Mon, 01 Jul 2019 06:32:40 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id z12sm2499062lfg.67.2019.07.01.06.32.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:32:38 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hhwQ5-0006ul-KX; Mon, 01 Jul 2019 15:32:33 +0200
Date:   Mon, 1 Jul 2019 15:32:33 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw
Subject: Re: [PATCH] [PATCH v6] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190701133233.GI27333@localhost>
References: <20190701122114.2952-1-charlesyeh522@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701122114.2952-1-charlesyeh522@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 01, 2019 at 08:21:14PM +0800, Charles Yeh wrote:
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
>    The default of chip Reset Control is 0xFF(TYPE_HXN), therefore we will
>    write 0x00 to reset down/up stream(TYPE_HXN).
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
> ---
> changelog:
> v6:
> 1. Modify pl2303_update_reg:TYPE_HXN used different register for flow control.
>    Therefore, we will also execute different instructions here.
> 2. Modify define name: PL2303_HXN_RESET_DOWN_UPSTREAM to
>    PL2303_HXN_RESET_CONTROL
> 3. Re-Sorting flow-control register definition by address.
> 4. Indent continuation lines at least tw tabs.
> 
> v5:
> 1. Modify pl2303_update_reg
> 2. add a patch version on subject
> 3. add a space after each colon at subject line
> ---
>  drivers/usb/serial/pl2303.c | 127 +++++++++++++++++++++++++++++-------
>  drivers/usb/serial/pl2303.h |   7 +-
>  2 files changed, 108 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index d7abde14b3cf..d36d53b234c4 100644
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
> @@ -130,9 +136,11 @@ MODULE_DEVICE_TABLE(usb, id_table);
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
> @@ -147,12 +155,22 @@ MODULE_DEVICE_TABLE(usb, id_table);
>  #define UART_CTS			0x80
>  
>  #define PL2303_FLOWCTRL_MASK		0xf0
> +#define PL2303_HXN_FLOWCTRL_MASK	0x1C

Move after PL2303_HXN_RESET_CONTROL as I suggested.

> +#define PL2303_READ_TYPE_HX_STATUS	0x8080
> +
> +#define PL2303_HXN_RESET_CONTROL	0x07
> +#define PL2303_HXN_FLOWCTRL		0x0A
> +#define PL2303_HXN_CTRL_XON_XOFF	0x0C
> +#define PL2303_HXN_CTRL_RTS_CTS		0x18
> +#define PL2303_HXN_CTRL_NONE		0x1C

> @@ -719,14 +771,34 @@ static void pl2303_set_termios(struct tty_struct *tty,
>  	}
>  
>  	if (C_CRTSCTS(tty)) {
> -		if (spriv->quirks & PL2303_QUIRK_LEGACY)
> -			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x40);
> -		else
> -			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x60);
> +		if (spriv->quirks & PL2303_QUIRK_LEGACY) {
> +			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK,
> +				0x40);

No need to break this line even if you end up with slightly more than 80
chars.

> +		} else if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
> +			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +				PL2303_HXN_FLOWCTRL_MASK,
> +				PL2303_HXN_CTRL_RTS_CTS);

Again, continuation lines should be indented at least two tabs further
(you only use one tab now).

> +		} else {
> +			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK,
> +				0x60);

No need to break line.

> +		}
>  	} else if (pl2303_enable_xonxoff(tty, spriv->type)) {
> -		pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
> +		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
> +			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +				PL2303_HXN_FLOWCTRL_MASK,
> +				PL2303_HXN_CTRL_XON_XOFF);

Indentation.

> +		} else {
> +			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK,
> +				0xc0);

No need to break line.

> +		}
>  	} else {
> -		pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
> +		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
> +			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +				PL2303_HXN_FLOWCTRL_MASK,
> +				PL2303_HXN_CTRL_NONE);

Indentation.

> +		} else {
> +			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
> +		}
>  	}
>  
>  	kfree(buf);
> @@ -767,8 +839,13 @@ static int pl2303_open(struct tty_struct *tty, struct usb_serial_port *port)
>  		usb_clear_halt(serial->dev, port->read_urb->pipe);
>  	} else {
>  		/* reset upstream data pipes */
> -		pl2303_vendor_write(serial, 8, 0);
> -		pl2303_vendor_write(serial, 9, 0);
> +		if (spriv->type == &pl2303_type_data[TYPE_HXN]) {

Merge this with else above to reduce indentation, that is

	} else if (spriv->type == &pl2303_type_data[TYPE_HXN]) {

> +			pl2303_vendor_write(serial, PL2303_HXN_RESET_CONTROL,
> +				0);

You again completely ignored my question about why you're wring 0
instead of 3 here.

I'll ignore your patch until you explain.

> +		} else {
> +			pl2303_vendor_write(serial, 8, 0);
> +			pl2303_vendor_write(serial, 9, 0);
> +		}
>  	}

Johan
