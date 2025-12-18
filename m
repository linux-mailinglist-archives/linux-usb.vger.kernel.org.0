Return-Path: <linux-usb+bounces-31603-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D838CCCC9A8
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 16:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4A0A3064109
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F4A358D37;
	Thu, 18 Dec 2025 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8kNbSQd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C95F358D12
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 15:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072975; cv=none; b=qXS/OW1z/mpwdUDUY/1UsIyoVTXMy6LirDzKhpkLc1VTBA8QPsCy4v1kNQjD7DK33Nk3tb1+X5UvpA1efZmPniqdMof/CBfayKtsAxXuXucKy2sNCRxDupQja+c53PSL852Pw3uPDTfR53i3cZuYpl4MZpkZWTZab/oyKBjgxq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072975; c=relaxed/simple;
	bh=VAKBzG0lIt6z9QuJOR/D4AyCAeLKQE/6RWPxaJMHhOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMzglW6jaEJoao1Va+fuk033hIQ9/ebYIVf9QPGPeln877tbV7brBWqm6UAhO7fktJDviCncWDwyCAF9eltq3AIE5hJPW2i65dJQUt00friGy+P/nhCWhcetj3X81p0mC5+cHwrW7PREe5q0BANDCPCaEf6QLO4aCNEeYf958Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8kNbSQd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766072973; x=1797608973;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VAKBzG0lIt6z9QuJOR/D4AyCAeLKQE/6RWPxaJMHhOA=;
  b=g8kNbSQd8WQzfn36LAehMOx3winh8HTQVYQ5iAlo9vofW1lF0GJLTNVV
   XcmYMN7u/dZE44nBUzz3JzUzj2GTG1oJ8gJ3RyJrCFvAF2QiLYpxiU462
   5VIVT2Z8d8B7Yko3p9o7DZ7n1ULIKUlA9CqXtxOWBYkcDYIZNK+cc8E4k
   Ik3CygQ+YI0Jsmw4ZotsCp7XVLontoc3UiKZ8qihAaeIFUNTqLGFa/nV1
   wSkm41X6OZ77XAWmS/fMse78Q+NLhJ9WWE0RczdoVV8LqFkQmcDs7eEI8
   ri0ve2AwOCrLxqzBwwf3Uiep2Wmoy2c9xcHVoPWB0aJNoCOwtJcqsMjjV
   Q==;
X-CSE-ConnectionGUID: OZpkmUGeRNuie6TFRUIHIw==
X-CSE-MsgGUID: rafMqHZ7SiO9xGtjhpvAog==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="70604766"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="70604766"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 07:49:33 -0800
X-CSE-ConnectionGUID: 0IF4jr0jR+OWC917xmSz1g==
X-CSE-MsgGUID: XsmppgcUQ8qwc7DhHCBerw==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.79]) ([10.245.244.79])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 07:49:31 -0800
Message-ID: <12d644fc-4d7f-41f5-8ed4-e520b422d01a@linux.intel.com>
Date: Thu, 18 Dec 2025 17:49:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: xhci: route endpoints to secondary interrupters
To: raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 michal.pecio@gmail.com, niklas.neronin@linux.intel.com, zhanjun@uniontech.com
References: <D7A2A2BD5BF19E5A+20251217094608.3848027-1-raoxu@uniontech.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <D7A2A2BD5BF19E5A+20251217094608.3848027-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xu Rao

Thanks for the updated version

On 12/17/25 11:46, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Some xHCI hosts expose multiple MSI/MSI-X vectors, but the driver
> currently routes all transfer completions through interrupter 0.
> This can lead to unnecessary contention on the primary event ring
> and IRQ vector.
> 
> If the host reports more than one interrupter, allocate secondary
> interrupters [1..max_interrupters-1] and cap the number of created
> interrupters by num_online_cpus(). Each secondary interrupter has
> its own event ring and can be requested as a separate IRQ vector.

This can lead to excessive amounts of interrupters on systems that
usually don't really use usb that much.

96 core systems would have 96 interrupters, each with an 8k event ring
to serve maybe one usb keyboard.

Lets start with something simple like 2 or 4 interrupters.

> 
> An interrupter is bound to each endpoint once at endpoint enable
> time. EP0 is always kept on interrupter 0, while all other endpoints
> are assigned in a round-robin fashion over the enabled secondary
> interrupters. Multiple endpoints may therefore share the same
> interrupter.

I think it would be better to assign a whole USB device to the same
interrupter, and set the "Interrupter Target" field in the slot
context to that interrupter.

This way special transfer events such as 'ring overrun' and 'ring underrun'
will end up on the same event ring as the rest of the transfer events for
that endpoint, and avoid some of the issues Michal pointed out.

> 
> Interrupt routing is performed by programming TRB_INTR_TARGET()
> from the endpoint's bound interrupter number when queueing TRBs.
> As a result, transfer completions are delivered to the event ring
> (and IRQ vector) of the selected interrupter instead of always
> landing on interrupter 0.
> 
> All interrupters share a common IRQ handler. STS_EINT is only
> checked and cleared for interrupter 0, as it is only meaningful
> for the primary interrupter. Secondary MSI/MSI-X vectors may fire
> independently and simply process their associated event rings.
> 
> When requesting IRQs, the usb_hcd pointer is used as the dev_id
> for both primary and secondary vectors. Although each secondary
> interrupter has its own event ring, using per-interrupter dev_id
> objects complicates teardown ordering in xhci_cleanup_msix().
> In particular, IRQs must be freed before the corresponding
> interrupter structures are removed, and the existing cleanup
> sequence imposes constraints on dev_id lifetime. Using a common
> dev_id avoids dev_id mismatches during free_irq() and keeps the
> IRQ teardown consistent with the current xHCI removal flow.
> 
> Testing on an MSI-X capable host controller shows that interrupts
> are effectively distributed across secondary vectors. For example,
> after sustained USB transfers:
> 
>    /proc/interrupts (filtered):
>      32:          0          0          0          0          0          0 \
>            0        522  IR-PCI-MSIX-0000:03:00.3  0-edge  xhci_hcd
>      33:      12297          0          0          0          0          0 \
>            0          0  IR-PCI-MSIX-0000:03:00.3  1-edge  xhci_hcd
>      34:          0      17082          0          0          0          0 \
>            0          0  IR-PCI-MSIX-0000:03:00.3  2-edge  xhci_hcd
>      35:          0          0      27567          0          0          0 \
>            0          0  IR-PCI-MSIX-0000:03:00.3  3-edge  xhci_hcd
>      36:          0          0          0      33234          0          0 \
>            0          0  IR-PCI-MSIX-0000:03:00.3  4-edge  xhci_hcd
>      37:          0          0          0          0    1519411          0 \
>            0          0  IR-PCI-MSIX-0000:03:00.3  5-edge  xhci_hcd
> 
> This demonstrates that transfer completions are no longer handled
> exclusively by interrupter 0, but are instead distributed across
> multiple MSI-X vectors.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
> Changelog:
> v1 -> v2:
>    - Bind interrupters to endpoints at enable time instead of selecting
>      per transfer.
>    - Store the selected interrupter in struct xhci_virt_ep and program
>      TRB_INTR_TARGET() from the bound interrupter.
>    - Use a single IRQ handler for both primary and secondary vectors,
>      with STS_EINT handling restricted to interrupter 0.
>    - Keep a common dev_id for IRQ registration to match the existing
>      xhci_cleanup_msix() teardown constraints and avoid dev_id
>      lifetime issues.
>    - Clarify secondary interrupter teardown to avoid double-free or
>      use-after-free during xHCI removal.
> v2 -> v3:
>    - modify commit information
> ---
>   drivers/usb/host/xhci-mem.c  | 86 +++++++++++++++++++++++++++++++++---
>   drivers/usb/host/xhci-pci.c  | 28 ++++++++++++
>   drivers/usb/host/xhci-ring.c | 79 ++++++++++++++++++++++++---------
>   drivers/usb/host/xhci.c      | 38 ++++++++++++++++
>   drivers/usb/host/xhci.h      |  7 +++
>   5 files changed, 212 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index c4a6544aa107..277d395c03b8 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1408,6 +1408,36 @@ static u32 xhci_get_max_esit_payload(struct usb_device *udev,
>   	return max_packet * max_burst;
>   }
>   
> +/* Pick an interrupter for an endpoint (EP0 always stays on interrupter 0). */
> +static struct xhci_interrupter *
> +xhci_pick_ep_interrupter(struct xhci_hcd *xhci, unsigned int ep_index)
> +{
> +	unsigned int idx;
> +
> +	/* Keep EP0 on primary interrupter */
> +	if (ep_index == 0 || !xhci->nr_xfer_interrupters)
> +		return xhci->interrupters[0];
> +
> +	/* round-robin over enabled secondary interrupters */
> +	idx = (unsigned int)atomic_inc_return(&xhci->next_xfer_intr);
> +	idx = (idx - 1) % xhci->nr_xfer_interrupters;
> +	return xhci->xfer_interrupters[idx] ?: xhci->interrupters[0];
> +}

Set same interrupter for a whole device instead of round-robin for endpoints.
Skip the atomic_inc_return and whole atomic variable and do something like:
idx = slot_id % number_of_interrupters;

> +
> +/* Bind the endpoint to one interrupter at enable time. */
> +static void xhci_bind_ep_interrupter(struct xhci_hcd *xhci,
> +		struct xhci_virt_device *virt_dev,
> +		unsigned int ep_index)
> +{
> +	struct xhci_virt_ep *xep;
> +	struct xhci_interrupter *ir;
> +
> +	xep = &virt_dev->eps[ep_index];
> +	ir = xhci_pick_ep_interrupter(xhci, ep_index);
> +
> +	xep->interrupter = ir;
> +}

This helper doesn't do much.
Can be skipped.

> +
>   /* Set up an endpoint with one ring segment.  Do not allocate stream rings.
>    * Drivers will have to call usb_alloc_streams() to do that.
>    */
> @@ -1511,6 +1541,9 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>   	ep_ctx->tx_info = cpu_to_le32(EP_MAX_ESIT_PAYLOAD_LO(max_esit_payload) |
>   				      EP_AVG_TRB_LENGTH(avg_trb_len));
>   
> +	/* bind endpoint to an interrupter once at enable time */
> +	xhci_bind_ep_interrupter(xhci, virt_dev, ep_index);
> +
>   	return 0;
>   }
>   
> @@ -1902,17 +1935,31 @@ EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
>   void xhci_mem_cleanup(struct xhci_hcd *xhci)
>   {
>   	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
> +	struct usb_hcd  *hcd = xhci_to_hcd(xhci);
>   	int i, j, num_ports;
>   
>   	cancel_delayed_work_sync(&xhci->cmd_timer);
>   
> -	for (i = 0; xhci->interrupters && i < xhci->max_interrupters; i++) {
> -		if (xhci->interrupters[i]) {
> -			xhci_remove_interrupter(xhci, xhci->interrupters[i]);
> -			xhci_free_interrupter(xhci, xhci->interrupters[i]);
> -			xhci->interrupters[i] = NULL;
> +	if (xhci->interrupters && xhci->interrupters[0]) {
> +		xhci_remove_interrupter(xhci, xhci->interrupters[0]);
> +		xhci_free_interrupter(xhci, xhci->interrupters[0]);
> +		xhci->interrupters[0] = NULL;
> +	}
> +
> +	for (i = 0; xhci->xfer_interrupters && i < xhci->xfer_irq_num; i++) {
> +		if (xhci->xfer_interrupters[i]) {
> +			xhci_remove_secondary_interrupter(hcd, xhci->xfer_interrupters[i]);
> +			xhci->xfer_interrupters[i] = NULL;
>   		}
>   	}
> +
> +	if (xhci->xfer_irq_num) {
> +		kfree(xhci->xfer_interrupters);
> +		xhci->xfer_interrupters = NULL;
> +		xhci->xfer_irq_num = 0;
> +		atomic_set(&xhci->next_xfer_intr, 0);

Hmm, so we now have two arrays of interrupters
   xhci->interrupters[]
   xhci->xfer_interripters[]

And some variables to keep track how many xhci interrupters are allocated,
and others to show how man actual interrupt vectors are in use.

I don't have a better way out of the box but it seems like
like there probably is a neater way to do this.


> +	}
> +
>   	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed interrupters");
>   
>   	if (xhci->cmd_ring)
> @@ -2412,6 +2459,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>   {
>   	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
>   	dma_addr_t	dma;
> +	int		i;
>   
>   	/*
>   	 * xHCI section 5.4.6 - Device Context array must be
> @@ -2505,6 +2553,34 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>   	if (!xhci->interrupters[0])
>   		goto fail;
>   
> +	/*
> +	 * Allocate secondary interrupters [1..max_interrupters-1].
> +	 * Cap by num_online_cpus() to avoid excessive vectors.
> +	 */
> +	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating secondary event ring");
> +	if (xhci->max_interrupters > 1) {
> +		xhci->xfer_irq_num = min(num_online_cpus(),
> +					(unsigned int)xhci->max_interrupters - 1);
> +		xhci->xfer_interrupters = kcalloc_node(xhci->xfer_irq_num,
> +				sizeof(*xhci->xfer_interrupters),
> +				flags, dev_to_node(dev));
> +
> +		if (!xhci->xfer_interrupters)
> +			goto fail;
> +	} else
> +		xhci->xfer_irq_num = 0;
> +
> +	for (i = 0; i < xhci->xfer_irq_num; i++) {
> +		struct xhci_interrupter *ir;
> +		/* Create secondary interrupter with intr_num = i + 1. */
> +		ir = xhci_create_secondary_interrupter(xhci_to_hcd(xhci),
> +				i + 1, xhci->imod_interval, 0);
> +		if (!ir)
> +			goto fail;

Don't fail completely just because we can't get a secondary interrupter.
Roll back to only using primary, or use fewer secondary interrupters

At this stage we don't yet know if hardware really can provide the actual
interrupt vectors, and if request_irq() will be successful.

xhci->nvecs could be useful here, but it is not yet set.

Could allocating the xhci secondary interrupters and call request_irq()
be done in the same loop in xhci_pci_run()?

That would simpify things.

Note, Niklas was looking at this idea recently, and pointed out is
would need changes to xhci_resume() power_lost path

Thanks
Mathias

