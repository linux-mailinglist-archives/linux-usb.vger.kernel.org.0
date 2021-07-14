Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B963C861D
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 16:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239471AbhGNOaJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 10:30:09 -0400
Received: from mga11.intel.com ([192.55.52.93]:18328 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239468AbhGNOaI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Jul 2021 10:30:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="207336122"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; 
   d="scan'208";a="207336122"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2021 07:27:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; 
   d="scan'208";a="505293086"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2021 07:27:15 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m3fqv-00DLwd-RZ; Wed, 14 Jul 2021 17:27:09 +0300
Date:   Wed, 14 Jul 2021 17:27:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     David Jeffery <djeffery@redhat.com>
Cc:     linux-usb@vger.kernel.org, loberman@redhat.com, emilne@redhat.com,
        apanagio@redhat.com, torez@redhat.com
Subject: Re: [PATCH] usb: ehci: Prevent missed ehci interrupts with
 edge-triggered MSI
Message-ID: <YO70Pf6051RbK7kl@smile.fi.intel.com>
References: <20210714140309.GA27799@redhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714140309.GA27799@redhat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 14, 2021 at 10:03:09AM -0400, David Jeffery wrote:

Thanks, I have few minor comments, after addressing them feel free to add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> When MSI is used by the ehci driver, it can cause interrupts to be lost which

ehci -> EHCI everywhere?

> results in ehci only continuing to work due to its polling fallback.  But the
> reliance of polling drasticly reduces performance of any I/O through ehci.
> 
> Interrupts are lost as ehci's interrupt handler does not safely handle
> edge-triggered interrupts.  It fails to ensure all interrupt status bits are
> cleared, which works with level-triggered interrupts but not the 

Drop trailing white space here and double spaces in the couple of places above?

> edge-triggered interrupts typical from using MSI.
> 
> To fix this problem, check if the driver may have raced with the hardware
> setting additional interrupt status bits and clear status until it is in a
> stable state.

Fixes tag?

> Signed-off-by: David Jeffery <djeffery@redhat.com>
> Tested-by: Laurence Oberman <loberman@redhat.com>
> ---
> 
> This is an alternative to reverting 306c54d0edb6ba94d39877524dddebaad7770cf2
> which is the patch that allowed MSI to be used with ehci.

Thanks!

> 
>  ehci-hcd.c |   16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index 36f5bf6a0752..2283205d4b40 100644
> --- a/drivers/usb/host/ehci-hcd.c
> +++ b/drivers/usb/host/ehci-hcd.c
> @@ -704,14 +704,18 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
>  {
>  	struct ehci_hcd		*ehci = hcd_to_ehci (hcd);
>  	u32			status, masked_status, pcd_status = 0, cmd;
> +	u32			current_status;

Perhaps

	u32			status, current_status, masked_status, pcd_status = 0;
	u32			cmd;

?

>  	int			bh;
>  
>  	spin_lock(&ehci->lock);
>  
> -	status = ehci_readl(ehci, &ehci->regs->status);
> +	status = 0;
>  
> +	current_status = ehci_readl(ehci, &ehci->regs->status);
> +restart:
> +	status |= current_status;
>  	/* e.g. cardbus physical eject */
> -	if (status == ~(u32) 0) {
> +	if (current_status == ~(u32) 0) {
>  		ehci_dbg (ehci, "device removed\n");
>  		goto dead;
>  	}
> @@ -720,7 +724,7 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
>  	 * We don't use STS_FLR, but some controllers don't like it to
>  	 * remain on, so mask it out along with the other status bits.
>  	 */
> -	masked_status = status & (INTR_MASK | STS_FLR);
> +	masked_status = current_status & (INTR_MASK | STS_FLR);
>  
>  	/* Shared IRQ? */
>  	if (!masked_status || unlikely(ehci->rh_state == EHCI_RH_HALTED)) {
> @@ -730,6 +734,12 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
>  
>  	/* clear (just) interrupts */
>  	ehci_writel(ehci, masked_status, &ehci->regs->status);
> +
> +	/* for edge interrupts, don't race with an interrupt bit being raised */

for -> For

> +	current_status = ehci_readl(ehci, &ehci->regs->status);
> +	if (current_status & INTR_MASK)
> +		goto restart;
> +
>  	cmd = ehci_readl(ehci, &ehci->regs->command);
>  	bh = 0;

-- 
With Best Regards,
Andy Shevchenko


