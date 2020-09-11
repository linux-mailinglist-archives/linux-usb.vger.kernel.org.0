Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E98266437
	for <lists+linux-usb@lfdr.de>; Fri, 11 Sep 2020 18:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgIKQdY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Sep 2020 12:33:24 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42957 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726264AbgIKPRi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Sep 2020 11:17:38 -0400
Received: (qmail 884616 invoked by uid 1000); 11 Sep 2020 11:17:23 -0400
Date:   Fri, 11 Sep 2020 11:17:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: ohci: Default to per-port over-current
 protection
Message-ID: <20200911151723.GA884518@rowland.harvard.edu>
References: <20200910212512.16670-1-hamish.martin@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910212512.16670-1-hamish.martin@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 11, 2020 at 09:25:11AM +1200, Hamish Martin wrote:
> Some integrated OHCI controller hubs do not expose all ports of the hub
> to pins on the SoC. In some cases the unconnected ports generate
> spurious over-current events. For example the Broadcom 56060/Ranger 2 SoC
> contains a nominally 3 port hub but only the first port is wired.
> 
> Default behaviour for ohci-platform driver is to use global over-current
> protection mode (AKA "ganged"). This leads to the spurious over-current
> events affecting all ports in the hub.
> 
> We now alter the default to use per-port over-current protection.
> 
> This patch results in the following configuration changes depending
> on quirks:
> - For quirk OHCI_QUIRK_SUPERIO no changes. These systems remain set up
>   for ganged power switching and no over-current protection.
> - For quirk OHCI_QUIRK_AMD756 or OHCI_QUIRK_HUB_POWER power switching
>   remains at none, while over-current protection is now guaranteed to be
>   set to per-port rather than the previous behaviour where it was either
>   none or global over-current protection depending on the value at
>   function entry.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v2:
>     - remove clearing of RH_A_PSM in OHCI_QUIRK_HUB_POWER block.
> 
>  drivers/usb/host/ohci-hcd.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
> index dd37e77dae00..2845ea328a06 100644
> --- a/drivers/usb/host/ohci-hcd.c
> +++ b/drivers/usb/host/ohci-hcd.c
> @@ -673,20 +673,24 @@ static int ohci_run (struct ohci_hcd *ohci)
>  
>  	/* handle root hub init quirks ... */
>  	val = roothub_a (ohci);
> -	val &= ~(RH_A_PSM | RH_A_OCPM);
> +	/* Configure for per-port over-current protection by default */
> +	val &= ~RH_A_NOCP;
> +	val |= RH_A_OCPM;
>  	if (ohci->flags & OHCI_QUIRK_SUPERIO) {
> -		/* NSC 87560 and maybe others */
> +		/* NSC 87560 and maybe others.
> +		 * Ganged power switching, no over-current protection.
> +		 */
>  		val |= RH_A_NOCP;
> -		val &= ~(RH_A_POTPGT | RH_A_NPS);
> -		ohci_writel (ohci, val, &ohci->regs->roothub.a);
> +		val &= ~(RH_A_POTPGT | RH_A_NPS | RH_A_PSM | RH_A_OCPM);
>  	} else if ((ohci->flags & OHCI_QUIRK_AMD756) ||
>  			(ohci->flags & OHCI_QUIRK_HUB_POWER)) {
>  		/* hub power always on; required for AMD-756 and some
> -		 * Mac platforms.  ganged overcurrent reporting, if any.
> +		 * Mac platforms.
>  		 */
>  		val |= RH_A_NPS;
> -		ohci_writel (ohci, val, &ohci->regs->roothub.a);
>  	}
> +	ohci_writel(ohci, val, &ohci->regs->roothub.a);
> +
>  	ohci_writel (ohci, RH_HS_LPSC, &ohci->regs->roothub.status);
>  	ohci_writel (ohci, (val & RH_A_NPS) ? 0 : RH_B_PPCM,
>  						&ohci->regs->roothub.b);
> -- 
> 2.28.0

Acked-by: Alan Stern <stern@rowland.harvard.edu>
