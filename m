Return-Path: <linux-usb+bounces-31135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871FCA1684
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 20:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0B99300A2B0
	for <lists+linux-usb@lfdr.de>; Wed,  3 Dec 2025 19:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B90D338F2F;
	Wed,  3 Dec 2025 19:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FExCaMEF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661F5330B11
	for <linux-usb@vger.kernel.org>; Wed,  3 Dec 2025 19:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764790355; cv=none; b=YLSisqqLfGjt6oniDNFuWq9gZAtwt//Xd1FMvwUYEUMB6MlbM5LHLIlL1gRXcS0poqemK08ISgRgjy/f0rw8U5Zmrr7JyAQrDnjvs6tYkR29ZC7o4fWA8g3gi9tGN7Ed/+siS9EG10RX1tMQoRmknOGWvVfWS1KMdLcnAi7JPCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764790355; c=relaxed/simple;
	bh=pWCDSwrb8Qjx9aFMuO+jExQh4nZWBhK7+RdhKLY7MoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdFzvH8F8zhVf8afX8FVrgEADqsjLhyoKs1xQj9tY2W23nSjwPuTZpvoFyujG23mPerEZD0NHO4ADIiUA/F7IM1Wb6sM7mjHnrKwJyOy2xS10+//LWiNqO+rXU4LTcYdDH+58XXNZ3lyuEjKQRy13URpV1YMjM6KxSmtYEmBHDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FExCaMEF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764790354; x=1796326354;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pWCDSwrb8Qjx9aFMuO+jExQh4nZWBhK7+RdhKLY7MoU=;
  b=FExCaMEFHEgsg4D9CqOZ506SVTRIi7zMnq29RDoAcPE/Vk627W7Uy/oP
   43raQcL7Y02Fj+y+sVrXyuS4Lnz30fy7zQSMFeknmlprLUK/mx9Kv42eg
   Qbqj3hDaPyQmFWUKPlhC7tQdrBkNGG2yILAjSkPGQk2CJHVePmoSk+QLq
   VODzFG05yTwWr44plWz3H/8TUSUpAGHz2lN3H1GLpbAu4LbQXVvxsDgFK
   2W9bMWpETymcP8fj/SeblA/gfHjvv3yi5agUl9VZyeCj04BOGsQwF2otN
   RmYko80aaR2P0dVUUmLyV8IflpEyVMpfQA8BOHRX0UDm4QNFoaTsHukgQ
   g==;
X-CSE-ConnectionGUID: lQGj41ghQ22ofG7qZ8hH/w==
X-CSE-MsgGUID: oBdSOoP5SLeTE634qbQtVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70654490"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="70654490"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 11:32:33 -0800
X-CSE-ConnectionGUID: AFTAzn3TTLWH9vWGj2k9tg==
X-CSE-MsgGUID: Ptz7c7OUS+uzUR4wYItVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="194874085"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.51]) ([10.245.245.51])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 11:32:30 -0800
Message-ID: <5dce755a-df20-4879-8e67-9b5f76fd50a2@linux.intel.com>
Date: Wed, 3 Dec 2025 21:32:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: usb: xhci: add optional MSI-X interrupters for isoc and bulk
To: raoxu <raoxu@uniontech.com>, gregkh@linuxfoundation.org
Cc: niklas.neronin@linux.intel.com, michal.pecio@gmail.com,
 zhanjun@uniontech.com, USB <linux-usb@vger.kernel.org>
References: <26CCB3E37C6E9AD3+20251203100824.1168562-1-raoxu@uniontech.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <26CCB3E37C6E9AD3+20251203100824.1168562-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

(adding linux-usb mailing list)

On 12/3/25 12:08, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Some xHCI controllers expose multiple MSI-X vectors (e.g. AMD 1022:15e0
> with 8 vectors) but the driver still routes all traffic through the
> primary interrupter. In mixed isochronous and bulk workloads this means
> all completions share a single IRQ, leading to higher context switching
> and CPU migrations.
> 
> This patch introduces an optional quirk, XHCI_BULK_ISOC_SECONDARY_IRQ,
> that allows the driver to allocate dedicated interrupters for isoc and
> bulk endpoints when the host supports at least three interrupters /
> MSI-X vectors. URBs are routed to these interrupters via TRB_INTR_TARGET()
> and the corresponding event rings, so that isoc and bulk traffic can
> interrupt on different CPUs.
> 
> The implementation is generic and can in principle be used on any xHCI
> host that supports multiple interrupters. For now the new quirk is only
> enabled for the AMD 1022:15e0 controller to be conservative and to
> limit the initial behavioral change to this tested device. Other
> multi-MSI-X controllers could be opted in later by setting the same
> quirk or by introducing a more generic policy.
> 
> The single primary-interrupt path is preserved:
> 
>    - If the quirk is not set, the driver behaves exactly as before and
>      only uses interrupter[0].
>    - If MSI/MSI-X setup fails, or fewer than three vectors are available,
>      the driver clears the isoc/bulk interrupter indices and falls back
>      to interrupter[0] for all traffic.
>    - When MSI-X is disabled (e.g. INTx or single MSI), TRB_INTR_TARGET()
>      is forced to 0 so all events still go through the primary
>      interrupter and existing logic is unchanged.
> 
> With the quirk enabled on an AMD 1022:15e0 xHCI controller
> (03:00.3, MSI-X Count=8), and a workload that runs a USB camera
> (isochronous) and a USB flash drive (bulk) simultaneously, the secondary
> MSI-X vectors are used as follows:
> 
> cat /proc/interrupts | grep xhci
>   32:          0          0          0      11917 IR-PCI-MSIX-0000:03:00.3
> 						0-edge     xhci_hcd
>   33:     267794          0          0          0 IR-PCI-MSIX-0000:03:00.3
> 						1-edge     xhci_hcd
>   34:          0      33441          0          0 IR-PCI-MSIX-0000:03:00.3
> 						2-edge     xhci_hcd
> 
> Vector 32 is the primary interrupter, while vectors 33 and 34 serve as
> dedicated secondary interrupters for isoc and bulk traffic.
> 
> perf stat over 30 seconds, with the USB camera and USB flash drive both
> active, shows the following system-wide numbers:
> 
>    With dedicated MSI-X interrupters for isoc and bulk:
>      perf stat -a -e context-switches,cpu-migrations -- sleep 30
> 
>        context-switches:        389,068
>        cpu-migrations :         18,665
> 
>    Original single-primary-interrupt case:
>      perf stat -a -e context-switches,cpu-migrations -- sleep 30
> 
>        context-switches:        509,633
>        cpu-migrations :         42,644
> 
> In this workload, using separate MSI-X interrupters for isoc and bulk
> reduces cpu-migrations by roughly 56% and context-switches by about 24%
> compared to routing all traffic through the primary interrupter.

Thanks, good to get some numbers on secondary interrupter usage.

> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>   drivers/usb/host/xhci-mem.c  | 17 +++++++
>   drivers/usb/host/xhci-pci.c  | 40 +++++++++++++++
>   drivers/usb/host/xhci-ring.c | 99 ++++++++++++++++++++++++++++++++++--
>   drivers/usb/host/xhci.c      | 20 ++++++++
>   drivers/usb/host/xhci.h      |  5 ++
>   5 files changed, 177 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index c4a6544aa107..a0c04015d12e 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2412,6 +2412,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>   {
>   	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
>   	dma_addr_t	dma;
> +	struct xhci_interrupter *ir;
> 
>   	/*
>   	 * xHCI section 5.4.6 - Device Context array must be
> @@ -2505,6 +2506,22 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>   	if (!xhci->interrupters[0])
>   		goto fail;
> 
> +	/* Default to single-interrupt mode */
> +	xhci->msix_isoc_interrupter = 0;
> +	xhci->msix_bulk_interrupter = 0;

we could start with just one extra interrupter, use a struct xhci_interrupter pointer
here instead of an integer, and not name it according to any specific transfer type

xhci->xfer_interrupter

> +
> +	if (xhci->max_interrupters >= 3 && xhci->quirks & XHCI_BULK_ISOC_SECONDARY_IRQ) {
> +		ir = xhci_create_secondary_interrupter(xhci_to_hcd(xhci), 0, xhci->imod_interval,
> +				0);

xhci->xfer_interrupter = xhci_create_secondary_interrupter(..)

> +		if (ir)
> +			xhci->msix_isoc_interrupter = ir->intr_num;
> +
> +		ir = xhci_create_secondary_interrupter(xhci_to_hcd(xhci), 0, xhci->imod_interval,
> +				0);
> +		if (ir)
> +			xhci->msix_bulk_interrupter = ir->intr_num;
> +	}
> +
>   	if (scratchpad_alloc(xhci, flags))
>   		goto fail;
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index f67a4d956204..a333f6765b9c 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -135,6 +135,13 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
>   		return;
> 
>   	free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
> +
> +	if (xhci->msix_isoc_interrupter != 0)
> +		free_irq(pci_irq_vector(pdev, xhci->msix_isoc_interrupter), xhci_to_hcd(xhci));
> +

xhci_remove_secondary_interrupter(hcd, xhci->xfer_interrupter)

> +	if (xhci->msix_bulk_interrupter != 0)
> +		free_irq(pci_irq_vector(pdev, xhci->msix_bulk_interrupter), xhci_to_hcd(xhci));
> +
>   	pci_free_irq_vectors(pdev);
>   	hcd->msix_enabled = 0;
>   }
> @@ -179,8 +186,36 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
>   	if (ret)
>   		goto free_irq_vectors;
> 
> +	if (xhci->nvecs < 3) {
> +		xhci->msix_isoc_interrupter = 0;
> +		xhci->msix_bulk_interrupter = 0;
> +	}
> +
> +	if (xhci->msix_isoc_interrupter) {
> +		ret = request_irq(pci_irq_vector(pdev, xhci->msix_isoc_interrupter),
> +				xhci_msix_isoc_irq, 0, "xhci_hcd", xhci_to_hcd(xhci));
> +		if (ret) {
> +			xhci_dbg_trace(xhci, trace_xhci_dbg_init,
> +					"failed to request isoc msix irq %d, fallback to primary",
> +					xhci->msix_isoc_interrupter);
> +			xhci->msix_isoc_interrupter = 0;

xhci_remove_secondary_interrupter(hcd, xhci->xfer_interrupter)
xhci->xfer_interrupter = NULL;


> +		}
> +	}
> +
> +	if (xhci->msix_bulk_interrupter) {
> +		ret = request_irq(pci_irq_vector(pdev, xhci->msix_bulk_interrupter),
> +				xhci_msix_bulk_irq, 0, "xhci_hcd", xhci_to_hcd(xhci));
> +		if (ret) {
> +			xhci_dbg_trace(xhci, trace_xhci_dbg_init,
> +					"failed to request bulk msix irq %d, fallback to primary",
> +					xhci->msix_bulk_interrupter);
> +			xhci->msix_bulk_interrupter = 0;
> +		}
> +	}
> +
>   	hcd->msi_enabled = 1;
>   	hcd->msix_enabled = pdev->msix_enabled;
> +
>   	return 0;
> 
>   free_irq_vectors:
> @@ -514,6 +549,11 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>   	if (xhci->quirks & XHCI_RESET_ON_RESUME)
>   		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
>   				"QUIRK: Resetting on resume");
> +
> +	if (pdev->vendor == 0x1022 &&
> +	    pdev->device == 0x15e0)
> +		xhci->quirks |= XHCI_BULK_ISOC_SECONDARY_IRQ;
> +
>   }
> 
>   #ifdef CONFIG_ACPI
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 6309200e93dc..9427c447d269 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3244,6 +3244,93 @@ irqreturn_t xhci_msi_irq(int irq, void *hcd)
>   }
>   EXPORT_SYMBOL_GPL(xhci_msi_irq);
> 
> +static irqreturn_t xhci_msix_secondary_irq(struct usb_hcd *hcd,
> +		unsigned int intr_num)
> +{
> +	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> +	struct xhci_interrupter *ir;
> +	irqreturn_t ret = IRQ_HANDLED;
> +	u32 status;
> +
> +	if (!xhci->interrupters || intr_num >= xhci->max_interrupters)
> +		return IRQ_NONE;
> +
> +	ir = xhci->interrupters[intr_num];
> +	if (!ir || !ir->event_ring)
> +		return IRQ_NONE;
> +
> +	spin_lock(&xhci->lock);
> +
> +	/* Check if the xHC generated the interrupt, or the irq is shared */
> +	status = readl(&xhci->op_regs->status);
> +	if (status == ~(u32)0) {
> +		xhci_hc_died(xhci);
> +		goto out;
> +	}
> +
> +	if (status & STS_HCE) {
> +		xhci_warn(xhci, "WARNING: Host Controller Error\n");
> +		goto out;
> +	}
> +
> +	if (status & STS_FATAL) {
> +		xhci_warn(xhci, "WARNING: Host System Error\n");
> +		xhci_halt(xhci);
> +		goto out;
> +	}
> +
> +	xhci_handle_events(xhci, ir, false);
> +out:
> +	spin_unlock(&xhci->lock);
> +
> +	return ret;
> +}
> +

The handler above looks very similar to the existing handler


> +irqreturn_t xhci_msix_isoc_irq(int irq, void *hcd)
> +{
> +	struct usb_hcd *usb_hcd = hcd;
> +	struct xhci_hcd *xhci = hcd_to_xhci(usb_hcd);
> +
> +	if (!xhci->msix_isoc_interrupter)
> +		return IRQ_NONE;
> +
> +	/* Handler for secondary interrupter: isoc */
> +	return xhci_msix_secondary_irq(usb_hcd, xhci->msix_isoc_interrupter);
> +}
> +EXPORT_SYMBOL_GPL(xhci_msix_isoc_irq);
> +
> +irqreturn_t xhci_msix_bulk_irq(int irq, void *hcd)
> +{
> +	struct usb_hcd *usb_hcd = hcd;
> +	struct xhci_hcd *xhci = hcd_to_xhci(usb_hcd);
> +
> +	if (!xhci->msix_bulk_interrupter)
> +		return IRQ_NONE;
> +
> +	/* Handler for secondary interrupter: bulk */
> +	return xhci_msix_secondary_irq(usb_hcd, xhci->msix_bulk_interrupter);
> +}
> +EXPORT_SYMBOL_GPL(xhci_msix_bulk_irq);

Could we skip all three interrupt handling relater functions above, and change the
existing handler to take a struct xhci_interrupter *pointer instead of struct
usb_hcd *hcd

Then add the hcd pointer to struct xhci_interrupter, and dig it out from there when
needed.

i.e.
ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
                           &xhci->interrupters[0]);

if (xhci->xfer_interrupter) {
	ret = request_irq(pci_irq_vector(pdev, xhci->xfer_interrupter->intr_num),
				xhci_msix_irq, 0, "xhci_hcd", xhci->xfer_interrupter);
}

irqreturn_t xhci_msi_irq(int irq, void *ir)


> +
> +static unsigned int xhci_choose_msix_irqnum(struct xhci_hcd *xhci, struct urb *urb)
> +{
> +	u8 xfer_type = usb_endpoint_type(&urb->ep->desc);
> +	struct usb_hcd *hcd = xhci_to_hcd(xhci);
> +
> +	if (!hcd->msix_enabled)
> +		return 0;
> +
> +	if (xfer_type == USB_ENDPOINT_XFER_ISOC &&
> +			xhci->msix_isoc_interrupter)
> +		return xhci->msix_isoc_interrupter;
> +
> +	if (xfer_type == USB_ENDPOINT_XFER_BULK &&
> +			xhci->msix_bulk_interrupter)
> +		return xhci->msix_bulk_interrupter;
> +
> +	return 0;
> +}
> +
>   /****		Endpoint Ring Operations	****/
> 
>   /*
> @@ -3642,6 +3729,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>   	int sent_len, ret;
>   	u32 field, length_field, remainder;
>   	u64 addr, send_addr;
> +	unsigned int intr_num = 0;
> 
>   	ring = xhci_urb_to_transfer_ring(xhci, urb);
>   	if (!ring)
> @@ -3682,6 +3770,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>   	start_trb = &ring->enqueue->generic;
>   	start_cycle = ring->cycle_state;
>   	send_addr = addr;
> +	intr_num = xhci_choose_msix_irqnum(xhci, urb);

I don't think we should choose the interupter for every transfer

How about adding a pointer to the interrupter in struct xhci_virt_ep, and set it
to the desired interrupter when we enable the endpoint.

we should add reference counting to the interrupter as well, increase it
when its set for an endpoint, and decrease when endpoint is dropped.

This way we can prevent interrupter removal when it's still in use

> 
>   	/* Queue the TRBs, even if they are zero-length */
>   	for (enqd_len = 0; first_trb || enqd_len < full_len;
> @@ -3742,7 +3831,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
> 
>   		length_field = TRB_LEN(trb_buff_len) |
>   			TRB_TD_SIZE(remainder) |
> -			TRB_INTR_TARGET(0);
> +			TRB_INTR_TARGET(intr_num);

TRB_INTR_TARGET(ep->interrupter->intr_num);

Thanks
Mathias


