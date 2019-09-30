Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCB2C1C8B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2019 10:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbfI3IIv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Sep 2019 04:08:51 -0400
Received: from mga03.intel.com ([134.134.136.65]:46366 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbfI3IIu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Sep 2019 04:08:50 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Sep 2019 01:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,565,1559545200"; 
   d="scan'208";a="194107700"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 30 Sep 2019 01:08:48 -0700
Subject: Re: [PATCH 1/1] usb: host: xhci: update event ring dequeue pointer on
 purpose
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <20190924083727.22260-1-peter.chen@nxp.com>
 <0e024b5e-8cc4-438f-920b-6a3523c241ae@linux.intel.com>
 <20190927070531.GA2609@b29397-desktop>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <1fee8ee8-ea27-b4e2-5e7e-5b8c5b04c4cb@linux.intel.com>
Date:   Mon, 30 Sep 2019 11:10:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927070531.GA2609@b29397-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27.9.2019 10.03, Peter Chen wrote:
> On 19-09-26 13:25:39, Mathias Nyman wrote:
>> On 24.9.2019 11.35, Peter Chen wrote:
>>> On some situations, the software handles TRB events slower
>>> than adding TRBs, then xhci_handle_event can't return zero
>>> long time, the xHC will consider the event ring is full,
>>> and trigger "Event Ring Full" error, but in fact, the software
>>> has already finished lots of events, just no chance to
>>> update ERDP (event ring dequeue pointer).
>>>
>>> In this commit, we force update ERDP if half of TRBS_PER_SEGMENT
>>> events have handled to avoid "Event Ring Full" error.
>>>
>>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
>>> ---
>>>    drivers/usb/host/xhci-ring.c | 53 ++++++++++++++++++++++++------------
>>>    1 file changed, 36 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>>> index e220bcbee173..92b6b07cf33d 100644
>>> --- a/drivers/usb/host/xhci-ring.c
>>> +++ b/drivers/usb/host/xhci-ring.c
>>> @@ -2737,6 +2737,35 @@ static int xhci_handle_event(struct xhci_hcd *xhci)
>>>    	return 1;
>>>    }
>>> +/*
>>> + * Update Event Ring Dequeue Pointer:
>>> + * - When all events have finished
>>> + * - To avoid "Event Ring Full Error" condition
>>> + */
>>> +static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
>>> +		union xhci_trb *event_ring_deq)
>>> +{
>>> +	u64 temp_64;
>>> +	dma_addr_t deq;
>>> +
>>> +	temp_64 = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
>>> +	/* If necessary, update the HW's version of the event ring deq ptr. */
>>> +	if (event_ring_deq != xhci->event_ring->dequeue) {
>>> +		deq = xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
>>> +				xhci->event_ring->dequeue);
>>> +		if (deq == 0)
>>> +			xhci_warn(xhci, "WARN something wrong with SW event "
>>> +					"ring dequeue ptr.\n");
>>> +		/* Update HC event ring dequeue pointer */
>>> +		temp_64 &= ERST_PTR_MASK;
>>> +		temp_64 |= ((u64) deq & (u64) ~ERST_PTR_MASK);
>>> +	}
>>> +
>>> +	/* Clear the event handler busy flag (RW1C) */
>>> +	temp_64 |= ERST_EHB;
>>> +	xhci_write_64(xhci, temp_64, &xhci->ir_set->erst_dequeue);
>>> +}
>>> +
>>>    /*
>>>     * xHCI spec says we can get an interrupt, and if the HC has an error condition,
>>>     * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
>>> @@ -2748,9 +2777,9 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
>>>    	union xhci_trb *event_ring_deq;
>>>    	irqreturn_t ret = IRQ_NONE;
>>>    	unsigned long flags;
>>> -	dma_addr_t deq;
>>>    	u64 temp_64;
>>>    	u32 status;
>>> +	int event_loop = 0;
>>>    	spin_lock_irqsave(&xhci->lock, flags);
>>>    	/* Check if the xHC generated the interrupt, or the irq is shared */
>>> @@ -2804,24 +2833,14 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
>>>    	/* FIXME this should be a delayed service routine
>>>    	 * that clears the EHB.
>>>    	 */
>>> -	while (xhci_handle_event(xhci) > 0) {}
>>> -
>>> -	temp_64 = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
>>> -	/* If necessary, update the HW's version of the event ring deq ptr. */
>>> -	if (event_ring_deq != xhci->event_ring->dequeue) {
>>> -		deq = xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
>>> -				xhci->event_ring->dequeue);
>>> -		if (deq == 0)
>>> -			xhci_warn(xhci, "WARN something wrong with SW event "
>>> -					"ring dequeue ptr.\n");
>>> -		/* Update HC event ring dequeue pointer */
>>> -		temp_64 &= ERST_PTR_MASK;
>>> -		temp_64 |= ((u64) deq & (u64) ~ERST_PTR_MASK);
>>> +	while (xhci_handle_event(xhci) > 0) {
>>> +		if (event_loop++ < TRBS_PER_SEGMENT / 2)
>>> +			continue;
>>> +		xhci_update_erst_dequeue(xhci, event_ring_deq);
>>> +		event_loop = 0;
>>>    	}
>>> -	/* Clear the event handler busy flag (RW1C); event ring is empty. */
>>> -	temp_64 |= ERST_EHB;
>>> -	xhci_write_64(xhci, temp_64, &xhci->ir_set->erst_dequeue);
>>> +	xhci_update_erst_dequeue(xhci, event_ring_deq);
>>
>> Otherwise looks good, but in rare cases when we handle  TRBS_PER_SEGMENT/2 events
>> we might write the ERST twice in a row with the same dequeue value.
>>
>> xHCI specification section 4.9.4 forbids this:
>>
>> "Note: Software writes to the ERDP register shall always advance the Event Ring
>> Dequeue Pointer value, i.e. software shall not write the same value to the ERDP
>> register on two consecutive write operations."
>>
> 
> Thanks Mathias.
> 
> I am evaluating the change that compares value reading from register
> xhci->ir_set->erst_dequeue and the software dequeue pointer at my
> two xHCI platforms, some changes like below:
> 
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
> 
> Regarding the comments you raised, I have a question, what's the
> situation the xHC ERDP is not updated after calling xhci_handle_event
> (event_ring_deq == xhci->event_ring->dequeue)?
> 
> If this condition is existed, then software will write the same value
> twice at ERDP register?

Yes, that is the current case, if event ring dequeue was not updated then
the same ERPD would be written back. So far this hasn't caused any issues.

Maybe the important part of the spec limitation is the "on two consecutive write
operations". Currently we always do other things before wring back the same ERDP.
we're handling a new interrupt, writing the STS_EINT bit to status register,
and reading a bunch of registers in between writing ERDP.

-Mathias
