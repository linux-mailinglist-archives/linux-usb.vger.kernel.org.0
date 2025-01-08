Return-Path: <linux-usb+bounces-19137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859E0A05B11
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 13:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82E5D166BD2
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 12:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA08B1F8F17;
	Wed,  8 Jan 2025 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1cZL3clx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C121A3035;
	Wed,  8 Jan 2025 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338246; cv=none; b=e+T85E6g3JI9SnNVtZ9O5Svw6RodC2wLOT0knQHgAOH1M9PXKnVcUcsNIr6JM/FCkYJhU2P1V3zTo+t3j+OxSeNuLKcQrfUx+DQSKdBlK4S6H9dPlC6P5GKgD+GCb7uED8R3DEo2xSLS/rm92FE9Bsp0zvoAzJ1/t29U2BSXnzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338246; c=relaxed/simple;
	bh=Ym+bOTD/OwGjwrs8FLqhNvjdFHoXiW8W6nPki7ngB8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEwK3sbY0DAgzZAgAFofwLV9nlfcZ7uspAKkEARsUmD4GXTO811m7fXmNhD22KOjsn/KKP5MFoByYazutI2t+oSHjFmWckdIQtlqeIZF9JlNeE4xIkk8eotWVVWA62BfPUyzSIWd1z1YzFeqMwkskam7a5iMOaulZxW6CGfIoJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1cZL3clx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2EDC4CEDD;
	Wed,  8 Jan 2025 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736338245;
	bh=Ym+bOTD/OwGjwrs8FLqhNvjdFHoXiW8W6nPki7ngB8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1cZL3clxw+fyZr7VkOTMAGcBHatpdE/uPnSmsq/+/wNaQV0m8S5MI1EGjkcZ2hUhL
	 VPDwhhPmqbGJ7jxJNhr52NooA/vDioo77ldRump0SH4u3odeyBWUzXNDyT7DU26rGy
	 A56oaw9hp9Ms6AOyK729FU5FW+gfl5yHGNcMoueE=
Date: Wed, 8 Jan 2025 13:10:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Lode Willems <me@lodewillems.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ch341: use fix-width types consistently
Message-ID: <2025010835-foil-designer-84e0@gregkh>
References: <20250108101518.30607-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108101518.30607-1-johan@kernel.org>

On Wed, Jan 08, 2025 at 11:15:18AM +0100, Johan Hovold wrote:
> Use Linux fix-width types consistently and drop a related unnecessary
> cast.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/ch341.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index ac74b353b26d..7cc36f84821f 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -660,13 +660,12 @@ static int ch341_simulate_break(struct tty_struct *tty, int break_state)
>  
>  static int ch341_break_ctl(struct tty_struct *tty, int break_state)
>  {
> -	const uint16_t ch341_break_reg =
> -			((uint16_t) CH341_REG_LCR << 8) | CH341_REG_BREAK;
> +	const u16 ch341_break_reg = (CH341_REG_LCR << 8) | CH341_REG_BREAK;
>  	struct usb_serial_port *port = tty->driver_data;
>  	struct ch341_private *priv = usb_get_serial_port_data(port);
> +	u16 reg_contents;
> +	u8 break_reg[2];
>  	int r;
> -	uint16_t reg_contents;
> -	uint8_t break_reg[2];
>  
>  	if (priv->quirks & CH341_QUIRK_SIMULATE_BREAK)
>  		return ch341_simulate_break(tty, break_state);
> -- 
> 2.45.2
> 
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

