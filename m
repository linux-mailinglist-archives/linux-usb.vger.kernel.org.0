Return-Path: <linux-usb+bounces-9728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 043EB8B123B
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 20:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4403284F10
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 18:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35801C9EBE;
	Wed, 24 Apr 2024 18:15:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B78351C8FD7
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 18:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713982543; cv=none; b=BJzn3S36La0zV22McMKIuufvTMA6/YcT3Um/ehI4qxNTJrHcXi0g25YScejuIcGJ63jf3Uue79r1atZLa0pn2pf2xj6YQyiaj5bcsBNgyCzd/ZEhXGgY0Zo8EwcI5pIMWlyeqzPF4dS0gqTAxUmyvac4EpG7+6W7kF8c9tsK+Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713982543; c=relaxed/simple;
	bh=DlQyTPVSjb+PU7NRGFFp/uRnhLy9lXW2ebSsJ0iDs94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SD+n8spCC4FFw7D+U/ZDjWbUebI70EFZQF3ROpSLn5zLqs2S4mzxDJ7fEc/2asPiFo70lBl5VzjDtZ647zlcXswH66C3gxlClcpfpR8D3gairCcU8s+XHAQaEI2kRFwjZF9kJU4ghZFAtgFwAr1aiGN9BQx3c58gzKFDS3WNyzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 460785 invoked by uid 1000); 24 Apr 2024 14:15:39 -0400
Date: Wed, 24 Apr 2024 14:15:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] usb: ohci: Prevent missed ohci interrupts
Message-ID: <57511487-e622-476d-adb2-5dfc725032d4@rowland.harvard.edu>
References: <20240424170250.3738037-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424170250.3738037-1-linux@roeck-us.net>

On Wed, Apr 24, 2024 at 10:02:50AM -0700, Guenter Roeck wrote:
> Testing ohci functionality with qemu's pci-ohci emulation often results
> in ohci interface stalls, resulting in hung task timeouts.
> 
> The problem is caused by lost interrupts between the emulation and the
> Linux kernel code. Additional interrupts raised while the ohci interrupt
> handler in Linux is running and before the handler clears the interrupt
> status are not handled. The fix for a similar problem in ehci suggests
> that the problem is likely caused by edge-triggered MSI interrupts. See
> commit 0b60557230ad ("usb: ehci: Prevent missed ehci interrupts with
> edge-triggered MSI") for details.
> 
> Ensure that the ohci interrupt code handles all pending interrupts before
> returning to solve the problem.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Fixes: 306c54d0edb6 ("usb: hcd: Try MSI interrupts on PCI devices")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/usb/host/ohci-hcd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
> index 4f9982ecfb58..4d764eb6c1e5 100644
> --- a/drivers/usb/host/ohci-hcd.c
> +++ b/drivers/usb/host/ohci-hcd.c
> @@ -888,6 +888,7 @@ static irqreturn_t ohci_irq (struct usb_hcd *hcd)
>  	/* Check for an all 1's result which is a typical consequence
>  	 * of dead, unclocked, or unplugged (CardBus...) devices
>  	 */
> +again:
>  	if (ints == ~(u32)0) {
>  		ohci->rh_state = OHCI_RH_HALTED;
>  		ohci_dbg (ohci, "device removed!\n");
> @@ -982,6 +983,11 @@ static irqreturn_t ohci_irq (struct usb_hcd *hcd)
>  	}
>  	spin_unlock(&ohci->lock);
>  
> +	/* repeat until all enabled interrupts are handled */
> +	ints = ohci_readl(ohci, &regs->intrstatus);
> +	if (ints & ohci_readl(ohci, &regs->intrenable))
> +		goto again;

If we take the repeat, we don't want to return IRQ_NOTMINE by accident.  To 
prevent this, we should check that ohci->rh_state != OHCI_RH_HALTED before 
re-reading ints and jumping back.

(If rh_state _is_ OHCI_RH_HALTED, it means the device is supposedly stopped 
and disabled for generating further interrupt requests, so we shouldn't 
need to worry about any outstanding intrstatus bits still set.)

Alan Stern

> +
>  	return IRQ_HANDLED;
>  }
>  
> -- 
> 2.39.2
> 

