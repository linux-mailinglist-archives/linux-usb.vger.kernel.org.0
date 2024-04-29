Return-Path: <linux-usb+bounces-9917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D8E8B5E8A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 18:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A3D283D94
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC06283A18;
	Mon, 29 Apr 2024 16:05:11 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D502074400
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714406711; cv=none; b=PHXNVVoX6KjT1L0i7jcp2dVBYw/SOk9rcUbWNL2P5TU+y+VfCRFttdC/5V3bGP7tMkp9T6wxbuZB4GhX8D1mRvHFegL3J3bHl2iu7BmkevRh3wFhbKwNZtLdRq+rfM2Qc87L23CqJdaTJx4csX9uRlvGAp3iVeSBiuOYnB4RsYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714406711; c=relaxed/simple;
	bh=RvNtWaz/pqnDe60zXUF+YFq8E8319BsMGi5oymiOrm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DU7+Ji9HE0uQYMg/q+OXuSMJTX+xFMb/PRDNFwE9PltYV9pjO0ocqqxNLHZD+sbrDtWdJyrXeHlK9zXU+2KAvUa6Be0pqw372CaIm6wvzP7Hl3J7VhoJcx8WUQgj/EHg33pcvNxprqBDhIlglxoiFJa/DoZ1d3P3Q0c2AaQoSjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 626663 invoked by uid 1000); 29 Apr 2024 12:05:04 -0400
Date: Mon, 29 Apr 2024 12:05:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
  David Laight <David.Laight@aculab.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] usb: ohci: Prevent missed ohci interrupts
Message-ID: <2c2ba8df-cdce-4666-8da3-252d4b707239@rowland.harvard.edu>
References: <20240429154010.1507366-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429154010.1507366-1-linux@roeck-us.net>

On Mon, Apr 29, 2024 at 08:40:10AM -0700, Guenter Roeck wrote:
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
> Cc: David Laight <David.Laight@aculab.com>
> Cc: stable@vger.kernel.org
> Fixes: 306c54d0edb6 ("usb: hcd: Try MSI interrupts on PCI devices")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v3: Check if any interrupts are pending before reading intrenable
>     Add 'Cc: stable@vger.kernel.org'
> v2: Only repeat if the interface is still active
> 
> Note that I did not apply Alan's Reviewed-by: tag since I was not sure
> if that was appropriate after the code change.

I'm not too confident that the guess about all interrupt bits normally 
being off is correct, but in any case the extra test won't hurt.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Guenter, if you want to work on a patch to cache the interrupt-enable 
value in the driver, feel free to do it.  I have too much other stuff 
going on to spend any significant time on ohci-hcd.

Alan Stern

> 
>  drivers/usb/host/ohci-hcd.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
> index 4f9982ecfb58..5cec7640e913 100644
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
> @@ -982,6 +983,13 @@ static irqreturn_t ohci_irq (struct usb_hcd *hcd)
>  	}
>  	spin_unlock(&ohci->lock);
>  
> +	/* repeat until all enabled interrupts are handled */
> +	if (ohci->rh_state != OHCI_RH_HALTED) {
> +		ints = ohci_readl(ohci, &regs->intrstatus);
> +		if (ints && (ints & ohci_readl(ohci, &regs->intrenable)))
> +			goto again;
> +	}
> +
>  	return IRQ_HANDLED;
>  }
>  
> -- 
> 2.39.2
> 

