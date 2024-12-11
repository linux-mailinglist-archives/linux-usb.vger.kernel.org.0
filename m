Return-Path: <linux-usb+bounces-18382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B509EC937
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 10:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3ECA188A8EC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 09:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564251A83E9;
	Wed, 11 Dec 2024 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIiEL4F1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38DE236F8A
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909741; cv=none; b=A05srMUbwVmdq7uekEouRXKhDYiNAC9QCrRLbHz1wQvHWoPUbyh6dR8c77JSk+LOpWWq82ANVHDhtrQmT59ElQNZqtKwNXe2htcufR1RoDFYbXces5BiwU2WeoK2Hx4oOVYzjZ21lgKa7l0I66JfzjeCzaUkYKdEz7kGRm1eATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909741; c=relaxed/simple;
	bh=z0t+YqdQEoXVm+5Ln2J39txKNGJEKw2+FIuE6GFg4zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tq0SbaXFIKO5OMsV0tCT8r28L4PSv7cxaUiijyC4QMXoeBic3Mk+qK7ICl9qEokfvn0OKVElf9NXWlwVI/RUYOuMvKMKaoHOAxdnH9BY0aGnKnAlkv4/lUNfWmVoznkbLGAl6gf0k3JwJ3EjBFMm/2hL+qnw866z+uZgXKMhtxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIiEL4F1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599F8C4CEDE;
	Wed, 11 Dec 2024 09:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733909741;
	bh=z0t+YqdQEoXVm+5Ln2J39txKNGJEKw2+FIuE6GFg4zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIiEL4F1CGO0wwY1hd6moK6C6W6i2qedLzERQ/LIkiMK7IIGRbw+byrWE69ZMsX62
	 Akt+fhxprs+UbXBE09JVNnb+QIJ5qVla6e/EyJrzczCuTNzn+Q1czca28M78O7TsOw
	 QTFVLLYkqgeUbGDMUo9yPuLVvMIGZcSM5fztiITtGzXxxxYeoSk23dB7krtymeCbBD
	 ATygiocO3DdZzAqUISahHfokAu1eQuItV3E8EnTFCVsk/Oh7sexxn6ks2dcJRwzkMG
	 fJ8nKgonpdEcw2brT07XMt4eWVjyTt7MUoE7cHOXkX3KniKppBb3Wfr3TRElC+umU8
	 8wQyxuay5zD1w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tLJ8C-000000004m1-2NHv;
	Wed, 11 Dec 2024 10:35:44 +0100
Date: Wed, 11 Dec 2024 10:35:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Blake LaFleur <blake.k.lafleur@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ch341: Add product ID for CH9102
Message-ID: <Z1lc8O22rnS_e9w0@hovoldconsulting.com>
References: <20241208081115.4036852-1-blake.k.lafleur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208081115.4036852-1-blake.k.lafleur@gmail.com>

On Sun, Dec 08, 2024 at 02:11:15AM -0600, Blake LaFleur wrote:
> Adds a PID for the CH9102 chipset that can be found in some cheap ESP
> development boards.
> 
> Example: LILYGO T-Display (and its S3 variant)
> https://lilygo.cc/products/lilygo%C2%AE-ttgo-t-display-1-14-inch-lcd-esp32-control-board
> 
> After patching the driver to include idProduct=0x55d4 the devices work
> as expected.

Thanks for the patch. This is the first time I hear of CH9102.

Are there any errors or messages at all in the logs when you use this
device or does it appear to be perfectly compatible with the older
models?

Could you post the output of lsusb -v (with masked serial numbers if you
prefer) so we have a record of any type identifying information should
it ever be needed?
 
> Signed-off-by: Blake LaFleur <blake.k.lafleur@gmail.com>
> ---
>  drivers/usb/serial/ch341.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index d10e4c4848a0..302d8d8547cb 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -81,6 +81,7 @@
>  #define CH341_QUIRK_SIMULATE_BREAK	BIT(1)
>  
>  static const struct usb_device_id id_table[] = {
> +	{ USB_DEVICE(0x1a86, 0x55d4) },

nit: please try to keep the entries sorted by pid.

>  	{ USB_DEVICE(0x1a86, 0x5523) },
>  	{ USB_DEVICE(0x1a86, 0x7522) },
>  	{ USB_DEVICE(0x1a86, 0x7523) },

Johan

