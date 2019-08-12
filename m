Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 888D989FD5
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 15:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbfHLNjF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 09:39:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:33174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbfHLNjE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Aug 2019 09:39:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E3CE206C2;
        Mon, 12 Aug 2019 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565617144;
        bh=kFHorBiiMCpO0ZDXkYoeGp/HBBU4aEr7IDmWr33d88g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yAq7RvwLT3WvY6wQFt25wHg7d3qeZGBv27B1x/IR1HeMDBd88M2M9krxH9wc9q8m2
         qn3F24GDgzHYjB/6NeHOl+ZdS7w4HOYh0C1FuvPh+NP5t5nAlhJ/GYbgbFk0oRIB1a
         8RyPf/lmwq7KdK+r5sXK1GVPBUG/dHg0pq8/G7Ow=
Date:   Mon, 12 Aug 2019 15:39:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rick Tseng <rtseng@nvidia.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci: wait CNR when doing xhci resume
Message-ID: <20190812133901.GA8165@kroah.com>
References: <1565594692-23683-1-git-send-email-rtseng@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565594692-23683-1-git-send-email-rtseng@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 12, 2019 at 03:24:52PM +0800, Rick Tseng wrote:
> From: Rick <rtseng@nvidia.com>
> 
> NVIDIA 3.1 xHCI card would lose power when moving power state into D3Cold.
> Thus we need to wait CNR bit to clear when xhci resmue as xhci init.
> 
> Signed-off-by: Rick <rtseng@nvidia.com>

We need a "full" name on the from and signed-off-by lines, please.

> ---
>  drivers/usb/host/xhci-pci.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 1e0236e..857ad8a 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -12,6 +12,7 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/acpi.h>
> +#include <linux/iopoll.h>
>  
>  #include "xhci.h"
>  #include "xhci-trace.h"
> @@ -455,6 +456,19 @@ static void xhci_pme_quirk(struct usb_hcd *hcd)
>  	readl(reg);
>  }
>  
> +static int xhci_poll_cnr(struct usb_hcd *hcd)
> +{
> +	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> +	void __iomem *reg = &xhci->op_regs->status;
> +	u32 result;
> +	int ret;
> +
> +	ret = readl_poll_timeout_atomic(reg, result,
> +					(result & STS_CNR) == 0,
> +					1, 100 * 1000);
> +	return ret;
> +}
> +
>  static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
>  {
>  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
> @@ -508,6 +522,12 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
>  	if (pdev->vendor == PCI_VENDOR_ID_INTEL)
>  		usb_enable_intel_xhci_ports(pdev);
>  
> +	if (pdev->vendor == PCI_VENDOR_ID_NVIDIA) {

So all devices of this vendor need that?  Are you _sure_?  Why not just
blacklist a single device?

thanks,

greg k-h
