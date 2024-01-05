Return-Path: <linux-usb+bounces-4782-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7060582530D
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 12:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 682C91C21152
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 11:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1362C85B;
	Fri,  5 Jan 2024 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoFZskFz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7EB2C6AC
	for <linux-usb@vger.kernel.org>; Fri,  5 Jan 2024 11:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5D1C433C7;
	Fri,  5 Jan 2024 11:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704455059;
	bh=HInLTwV5ceIi3MgThBI0gIcfhBXdkSGkrv6pK/pQkA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KoFZskFzyb57FGlIcAxy3y6SPpblK2vu1CauCAx6joLg8x6cwHJWOCULR1y0CjYlv
	 /ggITiN86atX+OPdzcK7V5jAU5ppjX86vPvjbX1l0sewS87ueH/GK/vwJWXIP7WBza
	 pFzvkezVjFjXfgi8Fok/OhqkAehm48LpYDVGeCepzCUrVh5MOgwc4H9b1feZoOfTt/
	 xep33FPUjTkLeU+H6qbdB9t8p6hInOUCeDcIRGQzpvRZPBKTVKlm49A7YvzTsMcTwh
	 10knWTU+56SwxeawcL0U5JQwC1icK3FYuXxANU6PvWCRuGyggsDwgu6noPdK1iWSP2
	 Bi1S5HyhY4ISA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rLicb-00044j-2c;
	Fri, 05 Jan 2024 12:44:18 +0100
Date: Fri, 5 Jan 2024 12:44:17 +0100
From: Johan Hovold <johan@kernel.org>
To: leonard.dallmayr@mailbox.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] Add support for the IMST USB-Stick for Smart Meter
 device to the cp210x driver.
Message-ID: <ZZfrkSbmCW7vNCEZ@hovoldconsulting.com>
References: <20240105110029.80421-1-leonard.dallmayr@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105110029.80421-1-leonard.dallmayr@mailbox.org>

On Fri, Jan 05, 2024 at 11:59:16AM +0100, leonard.dallmayr@mailbox.org wrote:
> From: Leonard Dallmayr <leonard.dallmayr@mailbox.org>
> 
> The device IMST USB-Stick for Smart Meter is a rebranded iM871A-USB Wireless M-Bus USB-adapter. It is used to measure smart meters for electricity, 
> heating, water, etc.

Please wrap you commit message at 72 chars or so and also use a more
succinct commit summary (Subject) including the common prefix ("USB:
serial: cp210x: ").
 
> Signed-off-by: Leonard Dallmayr <leonard.dallmayr@mailbox.org>
> ---
>  drivers/usb/serial/cp210x.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index 1e61fe043171..099cde4974a3 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -146,6 +146,7 @@ static const struct usb_device_id id_table[] = {
>  	{ USB_DEVICE(0x10C4, 0x85F8) }, /* Virtenio Preon32 */
>  	{ USB_DEVICE(0x10C4, 0x8664) }, /* AC-Services CAN-IF */
>  	{ USB_DEVICE(0x10C4, 0x8665) }, /* AC-Services OBD-IF */
> +	{ USB_DEVICE(0x10C4, 0x87ed) }, /* IMST USB-Stick for Smart Meter */

Use uppercase hex as the other entries in this file do.

>  	{ USB_DEVICE(0x10C4, 0x8856) },	/* CEL EM357 ZigBee USB Stick - LR */
>  	{ USB_DEVICE(0x10C4, 0x8857) },	/* CEL EM357 ZigBee USB Stick */
>  	{ USB_DEVICE(0x10C4, 0x88A4) }, /* MMB Networks ZigBee USB Device */

Johan

