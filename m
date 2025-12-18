Return-Path: <linux-usb+bounces-31607-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8EFCCCF51
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 18:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 206C130C5C6E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 17:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3E927F16C;
	Thu, 18 Dec 2025 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="V1vwffaC"
X-Original-To: linux-usb@vger.kernel.org
Received: from l2mail1.panix.com (l2mail1.panix.com [166.84.1.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CCD185955
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 17:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766078519; cv=none; b=nePmt9kCX4GuhJjbx+vd8h3G1vlWsN8mo8tMKI+EFT5LDR9Bj4MrLPQpVOo9ldV9q2jDgsh8BPY7lOxMhZrMYqFB+rbOkRTiUpvOEhkEPS/+/hXRuMo2SEnapHZz3azwpP2SODNEPuzyMEZPLA9sH4WIQrb/KCvLgtH8O8S+5e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766078519; c=relaxed/simple;
	bh=cQDsdpLddDhubO5aUEULdR8epzafLYwWV1IGtcvLhxU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mFh6YAY23QCah9TOdG2RpjBn6hZHgNoy32JDK+G7MglO+vKa9JUjvLaEmeG+VcbcDJGzHo3v59p57nydhJbTxylaiS49Vd8FH/h/osP3KB8mEvm2acCmbun7UKWT2gwUxME8+mzhdiEjuWGAPuMJdhWaUuBezLX1YCDf2r0wmVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=V1vwffaC; arc=none smtp.client-ip=166.84.1.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (1024 bits) server-digest SHA256)
	(No client certificate requested)
	by l2mail1.panix.com (Postfix) with ESMTPS id 4dXH5G3g6hzDVk
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 12:01:54 -0500 (EST)
Received: from [10.50.4.39] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4dXH556BzGz42yn;
	Thu, 18 Dec 2025 12:01:45 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1766077306; bh=cQDsdpLddDhubO5aUEULdR8epzafLYwWV1IGtcvLhxU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=V1vwffaCTaX+fferWQXAwqtq5Rs2aZ5wKElhDaFXwwfmjVADoX81nMe0M5pf5RSZz
	 qfqClPSdKfkLxl25KBbjKgGSPU+wq7zzILsYHzNNRy1OsXI1X/nvqHN23VaQ1OeQxV
	 kwQFtj+JNoctmjmk2ZE3Bi2I2R0/GoIA2F+tarn8=
Message-ID: <8cfadd23-e1ee-4691-bfbd-9177d883899f@panix.com>
Date: Thu, 18 Dec 2025 09:01:44 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kenneth Crudup <kenny@panix.com>
Subject: Re: [PATCH v3] usb: xhci: route endpoints to secondary interrupters
To: Mathias Nyman <mathias.nyman@linux.intel.com>, raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 michal.pecio@gmail.com, niklas.neronin@linux.intel.com,
 zhanjun@uniontech.com, Kenneth C <kenny@panix.com>
References: <D7A2A2BD5BF19E5A+20251217094608.3848027-1-raoxu@uniontech.com>
 <12d644fc-4d7f-41f5-8ed4-e520b422d01a@linux.intel.com>
Content-Language: en-US
In-Reply-To: <12d644fc-4d7f-41f5-8ed4-e520b422d01a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


FWIW, I rebased this (perhaps the previous spin?) for v.19-rc1 (see 
attached) and tried it out, before I saw you guys' objections ... whoops 
... but FWIW, it seems to be working here OK (that being said, I haven't 
had any USB errors so not sure what'll happen then, based on the 
followup comments).

If nothing else, I'll run it 'till my next reboot at least and see if 
there's any anomalies, but I guess you can put a "Tested-By" here?

Before, e.g.,:

----
  178:     675913          0          0          0          0          0 
   12944781          0          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:0d.0    0-edge      xhci_hcd
  186:    3286163          0          0          0          0          0 
          0          0          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:14.0    0-edge      xhci_hcd
----

... after (and after a couple of "Bonnie" runs):

----
  178:          0          0          0          0          0          0 
       1470          0          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:0d.0    0-edge      xhci_hcd
  179:          0          0          0          0          0          0 
          0     369210          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:0d.0    1-edge      xhci_hcd
  180:          0          0          0          0          0          0 
          0          0     264964          0          0          0    0 
         0 IR-PCI-MSI-0000:00:0d.0    2-edge      xhci_hcd
  181:          0          0          0          0          0          0 
          0          0          0     632289          0          0    0 
         0 IR-PCI-MSI-0000:00:0d.0    3-edge      xhci_hcd
  182:          0          0          0          0          0          0 
          0          0          0          0     557895          0    0 
         0 IR-PCI-MSI-0000:00:0d.0    4-edge      xhci_hcd
  183:          0          0          0          0          0          0 
          0          0          0          0          0      75643    0 
         0 IR-PCI-MSI-0000:00:0d.0    5-edge      xhci_hcd
  184:          0          0          0          0          0          0 
          0          0          0          0          0          0 9806 
         0 IR-PCI-MSI-0000:00:0d.0    6-edge      xhci_hcd
  185:          0          0          0          0          0          0 
          0          0          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:0d.0    7-edge      xhci_hcd
  186:        935          0          0          0          0          0 
          0          0          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:14.0    0-edge      xhci_hcd
  187:          0      48742          0          0          0          0 
          0          0          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:14.0    1-edge      xhci_hcd
  188:          0          0      30631          0          0          0 
          0          0          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:14.0    2-edge      xhci_hcd
  189:          0          0          0          0          0          0 
          0          0          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:14.0    3-edge      xhci_hcd
  190:          0          0          0          0          0          0 
          0          0          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:14.0    4-edge      xhci_hcd
  191:          0          0          0          0          0        157 
          0          0          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:14.0    5-edge      xhci_hcd
  192:          0          0          0          0          0          0 
       4820          0          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:14.0    6-edge      xhci_hcd
  193:          0          0          0          0          0          0 
          0       2915          0          0          0          0    0 
         0 IR-PCI-MSI-0000:00:14.0    7-edge      xhci_hcd
----

-K

On 12/18/25 07:49, Mathias Nyman wrote:
> Hi Xu Rao
> 
> Thanks for the updated version
> 
> On 12/17/25 11:46, raoxu wrote:
>> From: Xu Rao <raoxu@uniontech.com>
>>
>> Some xHCI hosts expose multiple MSI/MSI-X vectors, but the driver
>> currently routes all transfer completions through interrupter 0.
>> This can lead to unnecessary contention on the primary event ring
>> and IRQ vector.
>>
>> If the host reports more than one interrupter, allocate secondary
>> interrupters [1..max_interrupters-1] and cap the number of created
>> interrupters by num_online_cpus(). Each secondary interrupter has
>> its own event ring and can be requested as a separate IRQ vector.
> 
> This can lead to excessive amounts of interrupters on systems that
> usually don't really use usb that much.
> 
> 96 core systems would have 96 interrupters, each with an 8k event ring
> to serve maybe one usb keyboard.
> 
> Lets start with something simple like 2 or 4 interrupters.
> 
>>
>> An interrupter is bound to each endpoint once at endpoint enable
>> time. EP0 is always kept on interrupter 0, while all other endpoints
>> are assigned in a round-robin fashion over the enabled secondary
>> interrupters. Multiple endpoints may therefore share the same
>> interrupter.
> 
> I think it would be better to assign a whole USB device to the same
> interrupter, and set the "Interrupter Target" field in the slot
> context to that interrupter.
> 
> This way special transfer events such as 'ring overrun' and 'ring underrun'
> will end up on the same event ring as the rest of the transfer events for
> that endpoint, and avoid some of the issues Michal pointed out.
> 
>>
>> Interrupt routing is performed by programming TRB_INTR_TARGET()
>> from the endpoint's bound interrupter number when queueing TRBs.
>> As a result, transfer completions are delivered to the event ring
>> (and IRQ vector) of the selected interrupter instead of always
>> landing on interrupter 0.
>>
>> All interrupters share a common IRQ handler. STS_EINT is only
>> checked and cleared for interrupter 0, as it is only meaningful
>> for the primary interrupter. Secondary MSI/MSI-X vectors may fire
>> independently and simply process their associated event rings.
>>
>> When requesting IRQs, the usb_hcd pointer is used as the dev_id
>> for both primary and secondary vectors. Although each secondary
>> interrupter has its own event ring, using per-interrupter dev_id
>> objects complicates teardown ordering in xhci_cleanup_msix().
>> In particular, IRQs must be freed before the corresponding
>> interrupter structures are removed, and the existing cleanup
>> sequence imposes constraints on dev_id lifetime. Using a common
>> dev_id avoids dev_id mismatches during free_irq() and keeps the
>> IRQ teardown consistent with the current xHCI removal flow.
>>
>> Testing on an MSI-X capable host controller shows that interrupts
>> are effectively distributed across secondary vectors. For example,
>> after sustained USB transfers:
>>
>>    /proc/interrupts (filtered):
>>      32:          0          0          0          0          
>> 0          0 \
>>            0        522  IR-PCI-MSIX-0000:03:00.3  0-edge  xhci_hcd
>>      33:      12297          0          0          0          
>> 0          0 \
>>            0          0  IR-PCI-MSIX-0000:03:00.3  1-edge  xhci_hcd
>>      34:          0      17082          0          0          
>> 0          0 \
>>            0          0  IR-PCI-MSIX-0000:03:00.3  2-edge  xhci_hcd
>>      35:          0          0      27567          0          
>> 0          0 \
>>            0          0  IR-PCI-MSIX-0000:03:00.3  3-edge  xhci_hcd
>>      36:          0          0          0      33234          
>> 0          0 \
>>            0          0  IR-PCI-MSIX-0000:03:00.3  4-edge  xhci_hcd
>>      37:          0          0          0          0    
>> 1519411          0 \
>>            0          0  IR-PCI-MSIX-0000:03:00.3  5-edge  xhci_hcd
>>
>> This demonstrates that transfer completions are no longer handled
>> exclusively by interrupter 0, but are instead distributed across
>> multiple MSI-X vectors.
>>
>> Signed-off-by: Xu Rao <raoxu@uniontech.com>
>> ---
>> Changelog:
>> v1 -> v2:
>>    - Bind interrupters to endpoints at enable time instead of selecting
>>      per transfer.
>>    - Store the selected interrupter in struct xhci_virt_ep and program
>>      TRB_INTR_TARGET() from the bound interrupter.
>>    - Use a single IRQ handler for both primary and secondary vectors,
>>      with STS_EINT handling restricted to interrupter 0.
>>    - Keep a common dev_id for IRQ registration to match the existing
>>      xhci_cleanup_msix() teardown constraints and avoid dev_id
>>      lifetime issues.
>>    - Clarify secondary interrupter teardown to avoid double-free or
>>      use-after-free during xHCI removal.
>> v2 -> v3:
>>    - modify commit information
>> ---
>>   drivers/usb/host/xhci-mem.c  | 86 +++++++++++++++++++++++++++++++++---
>>   drivers/usb/host/xhci-pci.c  | 28 ++++++++++++
>>   drivers/usb/host/xhci-ring.c | 79 ++++++++++++++++++++++++---------
>>   drivers/usb/host/xhci.c      | 38 ++++++++++++++++
>>   drivers/usb/host/xhci.h      |  7 +++
>>   5 files changed, 212 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
>> index c4a6544aa107..277d395c03b8 100644
>> --- a/drivers/usb/host/xhci-mem.c
>> +++ b/drivers/usb/host/xhci-mem.c
>> @@ -1408,6 +1408,36 @@ static u32 xhci_get_max_esit_payload(struct 
>> usb_device *udev,
>>       return max_packet * max_burst;
>>   }
>> +/* Pick an interrupter for an endpoint (EP0 always stays on 
>> interrupter 0). */
>> +static struct xhci_interrupter *
>> +xhci_pick_ep_interrupter(struct xhci_hcd *xhci, unsigned int ep_index)
>> +{
>> +    unsigned int idx;
>> +
>> +    /* Keep EP0 on primary interrupter */
>> +    if (ep_index == 0 || !xhci->nr_xfer_interrupters)
>> +        return xhci->interrupters[0];
>> +
>> +    /* round-robin over enabled secondary interrupters */
>> +    idx = (unsigned int)atomic_inc_return(&xhci->next_xfer_intr);
>> +    idx = (idx - 1) % xhci->nr_xfer_interrupters;
>> +    return xhci->xfer_interrupters[idx] ?: xhci->interrupters[0];
>> +}
> 
> Set same interrupter for a whole device instead of round-robin for 
> endpoints.
> Skip the atomic_inc_return and whole atomic variable and do something like:
> idx = slot_id % number_of_interrupters;
> 
>> +
>> +/* Bind the endpoint to one interrupter at enable time. */
>> +static void xhci_bind_ep_interrupter(struct xhci_hcd *xhci,
>> +        struct xhci_virt_device *virt_dev,
>> +        unsigned int ep_index)
>> +{
>> +    struct xhci_virt_ep *xep;
>> +    struct xhci_interrupter *ir;
>> +
>> +    xep = &virt_dev->eps[ep_index];
>> +    ir = xhci_pick_ep_interrupter(xhci, ep_index);
>> +
>> +    xep->interrupter = ir;
>> +}
> 
> This helper doesn't do much.
> Can be skipped.
> 
>> +
>>   /* Set up an endpoint with one ring segment.  Do not allocate stream 
>> rings.
>>    * Drivers will have to call usb_alloc_streams() to do that.
>>    */
>> @@ -1511,6 +1541,9 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>>       ep_ctx->tx_info = 
>> cpu_to_le32(EP_MAX_ESIT_PAYLOAD_LO(max_esit_payload) |
>>                         EP_AVG_TRB_LENGTH(avg_trb_len));
>> +    /* bind endpoint to an interrupter once at enable time */
>> +    xhci_bind_ep_interrupter(xhci, virt_dev, ep_index);
>> +
>>       return 0;
>>   }
>> @@ -1902,17 +1935,31 @@ 
>> EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
>>   void xhci_mem_cleanup(struct xhci_hcd *xhci)
>>   {
>>       struct device    *dev = xhci_to_hcd(xhci)->self.sysdev;
>> +    struct usb_hcd  *hcd = xhci_to_hcd(xhci);
>>       int i, j, num_ports;
>>       cancel_delayed_work_sync(&xhci->cmd_timer);
>> -    for (i = 0; xhci->interrupters && i < xhci->max_interrupters; i++) {
>> -        if (xhci->interrupters[i]) {
>> -            xhci_remove_interrupter(xhci, xhci->interrupters[i]);
>> -            xhci_free_interrupter(xhci, xhci->interrupters[i]);
>> -            xhci->interrupters[i] = NULL;
>> +    if (xhci->interrupters && xhci->interrupters[0]) {
>> +        xhci_remove_interrupter(xhci, xhci->interrupters[0]);
>> +        xhci_free_interrupter(xhci, xhci->interrupters[0]);
>> +        xhci->interrupters[0] = NULL;
>> +    }
>> +
>> +    for (i = 0; xhci->xfer_interrupters && i < xhci->xfer_irq_num; i+ 
>> +) {
>> +        if (xhci->xfer_interrupters[i]) {
>> +            xhci_remove_secondary_interrupter(hcd, xhci- 
>> >xfer_interrupters[i]);
>> +            xhci->xfer_interrupters[i] = NULL;
>>           }
>>       }
>> +
>> +    if (xhci->xfer_irq_num) {
>> +        kfree(xhci->xfer_interrupters);
>> +        xhci->xfer_interrupters = NULL;
>> +        xhci->xfer_irq_num = 0;
>> +        atomic_set(&xhci->next_xfer_intr, 0);
> 
> Hmm, so we now have two arrays of interrupters
>    xhci->interrupters[]
>    xhci->xfer_interripters[]
> 
> And some variables to keep track how many xhci interrupters are allocated,
> and others to show how man actual interrupt vectors are in use.
> 
> I don't have a better way out of the box but it seems like
> like there probably is a neater way to do this.
> 
> 
>> +    }
>> +
>>       xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed interrupters");
>>       if (xhci->cmd_ring)
>> @@ -2412,6 +2459,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t 
>> flags)
>>   {
>>       struct device    *dev = xhci_to_hcd(xhci)->self.sysdev;
>>       dma_addr_t    dma;
>> +    int        i;
>>       /*
>>        * xHCI section 5.4.6 - Device Context array must be
>> @@ -2505,6 +2553,34 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t 
>> flags)
>>       if (!xhci->interrupters[0])
>>           goto fail;
>> +    /*
>> +     * Allocate secondary interrupters [1..max_interrupters-1].
>> +     * Cap by num_online_cpus() to avoid excessive vectors.
>> +     */
>> +    xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating secondary 
>> event ring");
>> +    if (xhci->max_interrupters > 1) {
>> +        xhci->xfer_irq_num = min(num_online_cpus(),
>> +                    (unsigned int)xhci->max_interrupters - 1);
>> +        xhci->xfer_interrupters = kcalloc_node(xhci->xfer_irq_num,
>> +                sizeof(*xhci->xfer_interrupters),
>> +                flags, dev_to_node(dev));
>> +
>> +        if (!xhci->xfer_interrupters)
>> +            goto fail;
>> +    } else
>> +        xhci->xfer_irq_num = 0;
>> +
>> +    for (i = 0; i < xhci->xfer_irq_num; i++) {
>> +        struct xhci_interrupter *ir;
>> +        /* Create secondary interrupter with intr_num = i + 1. */
>> +        ir = xhci_create_secondary_interrupter(xhci_to_hcd(xhci),
>> +                i + 1, xhci->imod_interval, 0);
>> +        if (!ir)
>> +            goto fail;
> 
> Don't fail completely just because we can't get a secondary interrupter.
> Roll back to only using primary, or use fewer secondary interrupters
> 
> At this stage we don't yet know if hardware really can provide the actual
> interrupt vectors, and if request_irq() will be successful.
> 
> xhci->nvecs could be useful here, but it is not yet set.
> 
> Could allocating the xhci secondary interrupters and call request_irq()
> be done in the same loop in xhci_pci_run()?
> 
> That would simpify things.
> 
> Note, Niklas was looking at this idea recently, and pointed out is
> would need changes to xhci_resume() power_lost path
> 
> Thanks
> Mathias
> 

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


