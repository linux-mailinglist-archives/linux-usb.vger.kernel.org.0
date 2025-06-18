Return-Path: <linux-usb+bounces-24882-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B82ADED23
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 14:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E074318912F4
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 12:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958C62E2EF2;
	Wed, 18 Jun 2025 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEGgLj/u"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF252E2651
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251475; cv=none; b=ayMckmQrbdNxtryWJ8Im9BpSPJ0b7h/PkQzNrVwaz1bdm1H2VFk6BMA/FCs7W8k5Hr0hdQ5sLvdzBUUOb6SL7u5TGw1+v/3036If4YH+oG6Wf6NW2s1u3dinjoZxUcTFu1ADYx/n2fXC6bKiL+UzEmHQ1IXHzG+3hMMMKwhYQzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251475; c=relaxed/simple;
	bh=Y2IvOcS/oGdlNC7lpQT8ahw1kB0Bt0ONG4kmKXVpVDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FId2vv+hoLqMne/PrhZviYpCrVdG+NpQ9Dh0YRTJarvB4Qx3wnMPCuGtrSDzVjIFK4FMQbx1pGeokmGkfALYxsN+mjy7ZP33U8VQNwzkj6YcFuGBFfqvWe5vkDr1k0k8SsUBHz+MkarJjzxYAqZRQuq5TgEqAZkXL6xTGEQ43Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEGgLj/u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C600C4CEE7;
	Wed, 18 Jun 2025 12:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750251474;
	bh=Y2IvOcS/oGdlNC7lpQT8ahw1kB0Bt0ONG4kmKXVpVDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PEGgLj/uSwGMBMf0K9ZxPocG4dX2UCnsPd0Q06frN+4zf6ufmJOpTeVR5t2QVoeQt
	 U/LH1d2lOsVJpDnP3633N70rBhT0bIoaDPj0PKp57yYNejCJzFx4vzKnrUPRDpeHJC
	 DRdcdIthcUFXVQaNk6LUqvTDqZpAVGqTkgWTLf9TlIBekKk1ggrELP5ACW4qKuRfKT
	 Jozb8sW2LznqEj8sbhJ1rZSuHiPpazIdxyrPwJcctHVW6K2ZAs31x+KDqov6dvfmet
	 vTFrQqVj8s4jOVFxwgDBwPixKwuxpy8F7GpvtmtLssy6a/Pack7l/5/28C2IyakwUP
	 KpnAnt7UTXxlQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uRsMT-000000002bY-46CL;
	Wed, 18 Jun 2025 14:57:54 +0200
Date: Wed, 18 Jun 2025 14:57:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Charles Yeh <charlesyeh522@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	charles-yeh@prolific.com.tw, joy-yeh@prolific.com.tw
Subject: Re: [PATCH] USB: serial: pl2303: add PL2303G GPIO_A and GPIO_B
 functions
Message-ID: <aFK30fcz0ujRbKBj@hovoldconsulting.com>
References: <20250618123513.12-1-charlesyeh522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618123513.12-1-charlesyeh522@gmail.com>

On Wed, Jun 18, 2025 at 08:35:13PM +0800, Charles Yeh wrote:
> PL2303G (TYPE_HXN) series ICs: PL2303GC, PL2303GS, PL2303GT, PL2303GR,.. etc.
> 
> For example:
> PL2303GC can provide up to 16 GPIO (general purpose input/output) signals.
> they are composed of GPIO_A0~A7 and GPIO_B0~B7 respectively.
> 
> In addition to the original UART functions such as Tx, Rx, RTS, CTS, etc.,
> users can also use GPIO to implement certain applications,
> such as turning on/off the LED power.
> 
> Users can download the PL2303G Linux GPIO app: PL2303G_Linux_GPIO_Test.c
> from the Prolific website.
> 
> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---
>  drivers/usb/serial/pl2303.c | 182 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 182 insertions(+)
> 
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index 22579d0d8ab8..be7e695bea60 100644
> --- a/drivers/usb/serial/pl2303.c
> +++ b/drivers/usb/serial/pl2303.c
> @@ -175,6 +175,37 @@ MODULE_DEVICE_TABLE(usb, id_table);
>  #define PL2303_HXN_FLOWCTRL_RTS_CTS	0x18
>  #define PL2303_HXN_FLOWCTRL_XON_XOFF	0x0c
>  
> +
> +struct PL2303G_GPIO {
> +	u8 GP_Branch;
> +	u8 Number;
> +	u8 Value;

We use lower case symbol names in the kernel.

> +};
> +
> +
> +#define GPIO_AB_CONTROL_MODE		_IOW(0x81, 10, struct PL2303G_GPIO)
> +#define GPIO_AB_OUTPUT_MODE		_IOW(0x81, 11, struct PL2303G_GPIO)
> +#define GPIO_AB_SET_VALUE		_IOW(0x81, 12, struct PL2303G_GPIO)
> +#define GPIO_AB_GET_VALUE		_IOR(0x81, 13, struct PL2303G_GPIO)

No, custom ioctls won't do. We have a standard interface for accessing
GPIOs so you need to model this as gpio chips similar to what the
ftdi_sio and cp210x drivers do.

> +static int pl2303_ioctl(struct tty_struct *tty,
> +			unsigned int cmd, unsigned long arg)
> +{
> +	int retval = 0;
> +	struct serial_struct ser;
> +	struct usb_serial_port *port = tty->driver_data;
> +	struct usb_serial *serial = port->serial;
> +
> +	switch (cmd) {
> +	case TIOCGSERIAL:
> +		memset(&ser, 0, sizeof(ser));
> +		ser.type = PORT_16654;
> +		ser.line = port->minor;
> +		ser.port = port->port_number;
> +		ser.baud_base = 460800;
> +
> +		if (copy_to_user((void __user *)arg, &ser, sizeof(ser)))
> +			return -EFAULT;
> +
> +		return 0;

This looks unrelated.

> +	case GPIO_AB_CONTROL_MODE:
> +		retval = pl2303N_gpio_set(serial, (void __user *) arg,
> +								PL2303N_CE_MODE);
> +		break;
> +	case GPIO_AB_OUTPUT_MODE:
> +		retval = pl2303N_gpio_set(serial, (void __user *) arg,
> +								PL2303N_OE_MODE);
> +		break;
> +	case GPIO_AB_SET_VALUE:
> +		retval = pl2303N_gpio_set(serial, (void __user *) arg,
> +								PL2303N_SET_MODE);
> +		break;
> +	case GPIO_AB_GET_VALUE:
> +		retval = pl2303N_gpio_get(serial, (void __user *) arg,
> +								PL2303N_GET_MODE);
> +		break;
> +	default:
> +		retval = -ENOIOCTLCMD;
> +		break;
> +	}
> +
> +	return retval;
> +
> +}

Johan

