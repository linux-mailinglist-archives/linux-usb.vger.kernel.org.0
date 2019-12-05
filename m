Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AED58114321
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 15:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbfLEO51 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 09:57:27 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42892 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbfLEO50 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 09:57:26 -0500
Received: by mail-lj1-f195.google.com with SMTP id e28so3900799ljo.9
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2019 06:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4tP/vxsDWo41ziEvbrEBzA2Vswgi6d5c0Mggp3F7FXk=;
        b=syqw3jscTe2z9TX/xqPcGLdiUOT8GsxU51nCLTl/W5YlJ1W5R2/LH56X4mf/8Zec93
         dD9Xd4qVap62gVJM25rx6dG+Yu5ACUa01aSDBkjC5yTTIlsJIruaFK6n3Geek2rl5w1z
         /IU9yctTnmgrFPpvHHhY7Zf/TQXbP2OJPl8e48h2apvHH2Fx99I2aJkvclEYptvL/PDU
         VhZ3fXpID113QgdJqvAhgO7G8pcHosoK5JESUJe/feTBNxhCtYpCz/DeaFpzBiVjjbtY
         WVL1qw2p2TUAkNBUNN0FEROO7W9bTZwxiY7VAA5IKYQDzYm2wzqEUoh9vG12nPw4Wgmt
         gGOw==
X-Gm-Message-State: APjAAAU/vwuD7O4XBaInK62N0rqUIQn7tkPvLu+HiSbosusCpgLVbe3Z
        e2C6A/sO/kcj0BxOPWYM9rI=
X-Google-Smtp-Source: APXvYqx44SyNN6yXKKcWIL45SkARnsgSx0qmnu1NBN3fz/XlC+GbhOEPTrEi63nXw84Xiz4ZrxkgUg==
X-Received: by 2002:a2e:9f47:: with SMTP id v7mr5652519ljk.124.1575557844924;
        Thu, 05 Dec 2019 06:57:24 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id d9sm2544170lja.73.2019.12.05.06.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 06:57:24 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1icsZP-0001UO-4Q; Thu, 05 Dec 2019 15:57:31 +0100
Date:   Thu, 5 Dec 2019 15:57:31 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH RESEND 1/1] usb: serial: option: add ZLP support for
 0x1bc7/0x9010
Message-ID: <20191205145731.GM10631@localhost>
References: <20191118133251.21401-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118133251.21401-1-dnlplm@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 02:32:51PM +0100, Daniele Palmas wrote:
> Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
> to be sent if out data size is equal to the endpoint max size.
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
>  drivers/usb/serial/option.c   | 8 ++++++++
>  drivers/usb/serial/usb-wwan.h | 1 +
>  drivers/usb/serial/usb_wwan.c | 9 +++++++++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index e9491d400a24..c13e063cb399 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -567,6 +567,9 @@ static void option_instat_callback(struct urb *urb);
>  /* Interface must have two endpoints */
>  #define NUMEP2		BIT(16)
>  
> +/* Device needs ZLP */
> +#define ZLP		BIT(17)
> +
>  
>  static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_COLT) },
> @@ -1196,6 +1199,8 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = NCTRL(0) | RSVD(1) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1901, 0xff),	/* Telit LN940 (MBIM) */
>  	  .driver_info = NCTRL(0) },
> +	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9010),				/* Telit SBL FN980 flashing device */
> +	  .driver_info = NCTRL(0) | ZLP },

Hmm. Could you post the lsusb -v output for this device?

I wonder whether using option is the right thing to do here. We're just
currently throwing everything modem related in here it seems. :)

>  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
>  	  .driver_info = RSVD(1) },
> @@ -2097,6 +2102,9 @@ static int option_attach(struct usb_serial *serial)
>  	if (!(device_flags & NCTRL(iface_desc->bInterfaceNumber)))
>  		data->use_send_setup = 1;
>  
> +	if (device_flags & ZLP)
> +		data->use_zlp = 1;
> +
>  	spin_lock_init(&data->susp_lock);
>  
>  	usb_set_serial_data(serial, data);
> diff --git a/drivers/usb/serial/usb-wwan.h b/drivers/usb/serial/usb-wwan.h
> index 1c120eaf4091..934e9361cf6b 100644
> --- a/drivers/usb/serial/usb-wwan.h
> +++ b/drivers/usb/serial/usb-wwan.h
> @@ -38,6 +38,7 @@ struct usb_wwan_intf_private {
>  	spinlock_t susp_lock;
>  	unsigned int suspended:1;
>  	unsigned int use_send_setup:1;
> +	unsigned int use_zlp:1;
>  	int in_flight;
>  	unsigned int open_ports;
>  	void *private;
> diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
> index 7e855c87e4f7..8066b5e2d305 100644
> --- a/drivers/usb/serial/usb_wwan.c
> +++ b/drivers/usb/serial/usb_wwan.c
> @@ -228,6 +228,15 @@ int usb_wwan_write(struct tty_struct *tty, struct usb_serial_port *port,
>  		} else {
>  			intfdata->in_flight++;
>  			spin_unlock_irqrestore(&intfdata->susp_lock, flags);
> +			if (intfdata->use_zlp) {
> +				unsigned int ep_maxp;
> +
> +				ep_maxp = usb_maxpacket(port->serial->dev,
> +							this_urb->pipe, 1);
> +
> +				if (ep_maxp && (todo % ep_maxp == 0))
> +					this_urb->transfer_flags |= URB_ZERO_PACKET;

No need to do the transfer_length calculations here, the host-controller
driver will take care of that. Just set URB_ZERO_PACKET unconditionally
if the device requires it.

> +			}
>  			err = usb_submit_urb(this_urb, GFP_ATOMIC);
>  			if (err) {
>  				dev_err(&port->dev,

Johan
