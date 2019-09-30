Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1FB7C1D87
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2019 10:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730309AbfI3I6C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Sep 2019 04:58:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:38142 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730305AbfI3I6C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Sep 2019 04:58:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Sep 2019 01:58:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,565,1559545200"; 
   d="scan'208";a="194118046"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 30 Sep 2019 01:58:00 -0700
Subject: Re: [PATCH v2 1/1] usb: host: xhci: update event ring dequeue pointer
 on purpose
To:     Peter Chen <peter.chen@nxp.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <20190929060556.24182-1-peter.chen@nxp.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <befbb09e-cb05-c0dc-42ab-ad8ddedb9b49@linux.intel.com>
Date:   Mon, 30 Sep 2019 11:59:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190929060556.24182-1-peter.chen@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29.9.2019 9.07, Peter Chen wrote:
> On some situations, the software handles TRB events slower
> than adding TRBs, then xhci_handle_event can't return zero
> long time, the xHC will consider the event ring is full,
> and trigger "Event Ring Full" error, but in fact, the software
> has already finished lots of events, just no chance to
> update ERDP (event ring dequeue pointer).
> 
> In this commit, we force update ERDP if half of TRBS_PER_SEGMENT
> events have handled to avoid "Event Ring Full" error.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v2:
> - If current ERDP value is the same with intended written one,
>    give up this written.
> 
>   drivers/usb/host/xhci-ring.c | 62 ++++++++++++++++++++++++++----------
>   1 file changed, 45 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index e220bcbee173..2c0a15c3b3a7 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2737,6 +2737,44 @@ static int xhci_handle_event(struct xhci_hcd *xhci)
>   	return 1;
>   }
>   
> +/*
> + * Update Event Ring Dequeue Pointer:
> + * - When all events have finished
> + * - To avoid "Event Ring Full Error" condition
> + */
> +static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
> +		union xhci_trb *event_ring_deq)
> +{
> +	u64 temp_64;
> +	dma_addr_t deq;
> +
> +	temp_64 = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
> +	/* If necessary, update the HW's version of the event ring deq ptr. */
> +	if (event_ring_deq != xhci->event_ring->dequeue) {
> +		deq = xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
> +				xhci->event_ring->dequeue);
> +		if (deq == 0)
> +			xhci_warn(xhci, "WARN something wrong with SW event "
> +					"ring dequeue ptr.\n");
> +
> +		/*
> +		 * Per 4.9.4, Software writes to the ERDP register shall
> +		 * always advance the Event Ring Dequeue Pointer value.
> +		 */
> +		if ((temp_64 & (u64) ~ERST_PTR_MASK) ==
> +				((u64) deq & (u64) ~ERST_PTR_MASK))
> +			return;
> +
> +		/* Update HC event ring dequeue pointer */
> +		temp_64 &= ERST_PTR_MASK;
> +		temp_64 |= ((u64) deq & (u64) ~ERST_PTR_MASK);
> +	}
> +
> +	/* Clear the event handler busy flag (RW1C) */
> +	temp_64 |= ERST_EHB;
> +	xhci_write_64(xhci, temp_64, &xhci->ir_set->erst_dequeue);
> +}
> +
>   /*
>    * xHCI spec says we can get an interrupt, and if the HC has an error condition,
>    * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
> @@ -2748,9 +2786,9 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
>   	union xhci_trb *event_ring_deq;
>   	irqreturn_t ret = IRQ_NONE;
>   	unsigned long flags;
> -	dma_addr_t deq;
>   	u64 temp_64;
>   	u32 status;
> +	int event_loop = 0;
>   
>   	spin_lock_irqsave(&xhci->lock, flags);
>   	/* Check if the xHC generated the interrupt, or the irq is shared */
> @@ -2804,24 +2842,14 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
>   	/* FIXME this should be a delayed service routine
>   	 * that clears the EHB.
>   	 */
> -	while (xhci_handle_event(xhci) > 0) {}
> -
> -	temp_64 = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
> -	/* If necessary, update the HW's version of the event ring deq ptr. */
> -	if (event_ring_deq != xhci->event_ring->dequeue) {
> -		deq = xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
> -				xhci->event_ring->dequeue);
> -		if (deq == 0)
> -			xhci_warn(xhci, "WARN something wrong with SW event "
> -					"ring dequeue ptr.\n");
> -		/* Update HC event ring dequeue pointer */
> -		temp_64 &= ERST_PTR_MASK;
> -		temp_64 |= ((u64) deq & (u64) ~ERST_PTR_MASK);
> +	while (xhci_handle_event(xhci) > 0) {
> +		if (event_loop++ < TRBS_PER_SEGMENT / 2)
> +			continue;
> +		xhci_update_erst_dequeue(xhci, event_ring_deq);
> +		event_loop = 0;
>   	}
>   
> -	/* Clear the event handler busy flag (RW1C); event ring is empty. */
> -	temp_64 |= ERST_EHB;
> -	xhci_write_64(xhci, temp_64, &xhci->ir_set->erst_dequeue);
> +	xhci_update_erst_dequeue(xhci, event_ring_deq);
>   	ret = IRQ_HANDLED;
>   
>   out:
> 

This should work, adding to queue

-Mathias
