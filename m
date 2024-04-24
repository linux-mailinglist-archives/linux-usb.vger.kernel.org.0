Return-Path: <linux-usb+bounces-9737-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3ED8B162D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 00:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91124B2171F
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 22:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1779E16DECE;
	Wed, 24 Apr 2024 22:30:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id ADD0E16DEA5
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 22:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713997815; cv=none; b=LO48L5DJaS2hLqXQIVKDPjqF5/3Bu6WxnZ5/NIt83WuOyOsA3wIPnSgw/f9ZDFNJM4Fhzx1zcfbNy/gC42xfXKFcbNNFoSnpasGubNiYEvsk67W0lplDx2mxdlKycMooKrLadk7Ql7gLEuq+w+0sYn9+wXjg5gQ2UjQFFERVQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713997815; c=relaxed/simple;
	bh=HDHCFTiG9P0rM6J/rTMdHTIogb/0OwpJMxF2VUxSp74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftf1qaWqBAw8rXqIOzlvJ5hwfKO2kOAUvK7mf7og4sOocUUQ37cgfJSXFZMgQYFVhp6vaTQspU//2+czV1eJzZ9nVLMc4DYuo1KI5kx+7xHX1KFV+xVI264ac2mxGxdmPEsrV3c0xGa7bjsq/u/qT/3/U2DrR0trBn4tUvmLSJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 470718 invoked by uid 1000); 24 Apr 2024 18:30:06 -0400
Date: Wed, 24 Apr 2024 18:30:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] usb: ohci: Prevent missed ohci interrupts
Message-ID: <0a29cc85-a79e-476d-aae6-0a054aad2e90@rowland.harvard.edu>
References: <20240424195951.3749388-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424195951.3749388-1-linux@roeck-us.net>

On Wed, Apr 24, 2024 at 12:59:51PM -0700, Guenter Roeck wrote:
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
> v2: Only repeat if the interface is still active

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Greg might insist that the patch be CC'ed to stable@vger.kernel.org since 
it contains a Fixes: tag.

Alan Stern

>  drivers/usb/host/ohci-hcd.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
> index 4f9982ecfb58..bb6b50b4a356 100644
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
> +		if (ints & ohci_readl(ohci, &regs->intrenable))
> +			goto again;
> +	}
> +
>  	return IRQ_HANDLED;
>  }
>  
> -- 
> 2.39.2
> 

