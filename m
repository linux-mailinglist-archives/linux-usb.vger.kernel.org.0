Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043933C8628
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 16:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbhGNOcQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 10:32:16 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50143 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232037AbhGNOcQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 10:32:16 -0400
Received: (qmail 381335 invoked by uid 1000); 14 Jul 2021 10:29:23 -0400
Date:   Wed, 14 Jul 2021 10:29:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Jeffery <djeffery@redhat.com>
Cc:     linux-usb@vger.kernel.org, loberman@redhat.com,
        andriy.shevchenko@linux.intel.com, emilne@redhat.com,
        apanagio@redhat.com, torez@redhat.com
Subject: Re: [PATCH] usb: ehci: Prevent missed ehci interrupts with
 edge-triggered MSI
Message-ID: <20210714142923.GA380727@rowland.harvard.edu>
References: <20210714140309.GA27799@redhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714140309.GA27799@redhat>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 14, 2021 at 10:03:09AM -0400, David Jeffery wrote:
> When MSI is used by the ehci driver, it can cause interrupts to be lost which
> results in ehci only continuing to work due to its polling fallback.  But the
> reliance of polling drasticly reduces performance of any I/O through ehci.
> 
> Interrupts are lost as ehci's interrupt handler does not safely handle
> edge-triggered interrupts.  It fails to ensure all interrupt status bits are
> cleared, which works with level-triggered interrupts but not the 
> edge-triggered interrupts typical from using MSI.
> 
> To fix this problem, check if the driver may have raced with the hardware
> setting additional interrupt status bits and clear status until it is in a
> stable state.
> 
> Signed-off-by: David Jeffery <djeffery@redhat.com>
> Tested-by: Laurence Oberman <loberman@redhat.com>
> ---
> 
> This is an alternative to reverting 306c54d0edb6ba94d39877524dddebaad7770cf2
> which is the patch that allowed MSI to be used with ehci.
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

Mild stylistic quibble: I generally prefer to have a blank line before a 
/* ... */ comment.  And it doesn't seem reasonable to have a blank line 
between "status = 0" and the current_status assignment, since those are 
similar once-only things before the beginning of the "restart" loop.  
Also, I would move the "status |= current_status" line after the test 
for device removed, since that test doesn't use status.

But obviously none of these things affect the patch's correntness.

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
> +	current_status = ehci_readl(ehci, &ehci->regs->status);
> +	if (current_status & INTR_MASK)
> +		goto restart;
> +
>  	cmd = ehci_readl(ehci, &ehci->regs->command);
>  	bh = 0;

You can choose to submit a new version of the patch with those stylistic 
changes, or if you prefer, just stick with this version.  Either way,

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Does this issue affect any other PCI-based host controller drivers?

Alan Stern
