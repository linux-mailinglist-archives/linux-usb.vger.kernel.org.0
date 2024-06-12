Return-Path: <linux-usb+bounces-11179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB72904D55
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 10:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A01AB24969
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 08:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0209816D313;
	Wed, 12 Jun 2024 07:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BDl8RvHK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C616C878
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179196; cv=none; b=d9sP0uxFXMHNHpHti0MvAGuVbCYqxkYP3vRwstJNBoWdRmp+qKRnjZ8WRX1+T5wt1TAwP2xFmzsBFLa5P9+N3BAohp2oBCWrZFpy6wZxJsbgDTRDtg+pUFCsphzU8RSfakvbP03l4otsgZ9xjWMI3JUeJPPGLYFZM2brip9iR8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179196; c=relaxed/simple;
	bh=EqRgWObHxNdpIsb/JXXoiQBod6Qk4k4vENRFqmZiEDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDwzuqZfRS38CHz6W11tY78lMGS9nEG5+Fm0dOsJQkea9WU/QY7gfCxXshanKWdtsgErSyRKHJKa43fFAW2lIgr/TjsFsMTx2oQWIR03Tds7TiYDaeX5IOMzOLAvzrUAPanqBwX9bRVg3HMKi0nl5KJx6g2pKsLdxbYzpX+L87o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BDl8RvHK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0272CC3277B;
	Wed, 12 Jun 2024 07:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718179196;
	bh=EqRgWObHxNdpIsb/JXXoiQBod6Qk4k4vENRFqmZiEDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDl8RvHKwVBhhmuELW1U7/hTS6lqTQ5KQ0v6lePIcixbYCQ3pz80ZkK4l3cTqakuS
	 4+cIN7qnp6wU0dPFZt8J45lI6Q45tRgrjKiihd7eVnLx6HOLK0nUyf2IB5a7LETN5M
	 +IJPPGdghcQzlT1hKIlE4mTTi8A/hMoj0zX1Do3U=
Date: Wed, 12 Jun 2024 09:59:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix device address configuration
Message-ID: <2024061242-viper-duplicity-7ccb@gregkh>
References: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>

On Wed, Jun 12, 2024 at 10:07:33AM +0800, Jeremy Kerr wrote:
> In the aspeed UDC setup, we configure the UDC hardware with the assigned
> USB device address.
> 
> However, we have an off-by-one in the bitmask, so we're only setting the
> lower 6 bits of the address (USB addresses being 7 bits, and the
> hardware bitmask being bits 0:6).
> 
> This means that device enumeration fails if the assigned address is
> greater than 64:
> 
> [  344.607255] usb 1-1: new high-speed USB device number 63 using ehci-platform
> [  344.808459] usb 1-1: New USB device found, idVendor=cc00, idProduct=cc00, bcdDevice= 6.10
> [  344.817684] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [  344.825671] usb 1-1: Product: Test device
> [  344.831075] usb 1-1: Manufacturer: Test vendor
> [  344.836335] usb 1-1: SerialNumber: 00
> [  349.917181] usb 1-1: USB disconnect, device number 63
> [  352.036775] usb 1-1: new high-speed USB device number 64 using ehci-platform
> [  352.249432] usb 1-1: device descriptor read/all, error -71
> [  352.696740] usb 1-1: new high-speed USB device number 65 using ehci-platform
> [  352.909431] usb 1-1: device descriptor read/all, error -71
> 
> Use the correct mask of 0x7f (rather than 0x3f), and generate this
> through the GENMASK macro, so we have numbers that correspond exactly
> to the hardware register definition.
> 
> Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
> index 3916c8e2ba01..821a6ab5da56 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -66,8 +66,8 @@
>  #define USB_UPSTREAM_EN			BIT(0)
>  
>  /* Main config reg */
> -#define UDC_CFG_SET_ADDR(x)		((x) & 0x3f)
> -#define UDC_CFG_ADDR_MASK		(0x3f)
> +#define UDC_CFG_SET_ADDR(x)		((x) & UDC_CFG_ADDR_MASK)
> +#define UDC_CFG_ADDR_MASK		GENMASK(6, 0)
>  
>  /* Interrupt ctrl & status reg */
>  #define UDC_IRQ_EP_POOL_NAK		BIT(17)
> 
> ---
> base-commit: 32f88d65f01bf6f45476d7edbe675e44fb9e1d58
> change-id: 20240611-aspeed-udc-07dcde062ccf
> 
> Best regards,
> -- 
> Jeremy Kerr <jk@codeconstruct.com.au>
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

