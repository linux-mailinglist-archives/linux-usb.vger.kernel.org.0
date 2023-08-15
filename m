Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDC077CD45
	for <lists+linux-usb@lfdr.de>; Tue, 15 Aug 2023 15:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbjHONSj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Aug 2023 09:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237428AbjHONSY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Aug 2023 09:18:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FEAD1
        for <linux-usb@vger.kernel.org>; Tue, 15 Aug 2023 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692105503; x=1723641503;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=bsm51loDbJ9DqIBsxkCw3qgi+WfNK45KGUNtr5kFsSs=;
  b=RfYh52Ye6BYKi/IdKTue+kl3FBe5iDEmNswAwQHnapj69O/hVoqVTe7s
   cvcF1wRxxdw2CG28UAob7FqzRFTiAAL1NGV5RJllQpwYe/c+V3LRfRx2s
   0Nj7h5+M3LW3F9NwIwBkPXAOTrG1heZfQwJrNHzhhzS0Z5sBPXx2U4AcW
   0zaWDQiMBctG2p0lrrphahuuTDqhl95eo1ZPhg2VVDEHOpre16b8VmS5m
   IwQe6Na3Zrlon8AUuThREcIITLVFBEWpcvaO6LY34trOxhvc5xU/HfvZN
   hnnYq/S+yKU0855LciSIeQu1Zz7YNm2bRYHlE33yiSWYnTaZPIZWNDoH1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436167129"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="436167129"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 06:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="727376508"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="727376508"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 15 Aug 2023 06:18:21 -0700
Message-ID: <abac0c9d-ce51-b777-c27d-96911c745cd2@linux.intel.com>
Date:   Tue, 15 Aug 2023 16:19:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To:     Lukas Wunner <lukas@wunner.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
References: <0e26fb1421216b198a89b9164ab6c4cd9e1e127a.1692049324.git.lukas@wunner.de>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] xhci: Clear EHB bit only at end of interrupt handler
In-Reply-To: <0e26fb1421216b198a89b9164ab6c4cd9e1e127a.1692049324.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15.8.2023 10.20, Lukas Wunner wrote:
> The Event Handler Busy bit shall be cleared by software when the Event
> Ring is empty.  The xHC is thereby informed that it may raise another
> interrupt once it has enqueued new events (sec 4.17.2).
> 
> However since commit dc0ffbea5729 ("usb: host: xhci: update event ring
> dequeue pointer on purpose"), the EHB bit is already cleared after half
> a segment has been processed.
> 
> As a result, spurious interrupts may occur:
> 
> - xhci_irq() processes half a segment, clears EHB, continues processing
>    remaining events.
> - xHC enqueues new events.  Because EHB has been cleared, xHC sets
>    Interrupt Pending bit.  Interrupt moderation countdown begins.
> - Meanwhile xhci_irq() continues processing events.  Interrupt
>    moderation countdown reaches zero, so an MSI interrupt is signaled.
> - xhci_irq() empties the Event Ring, clears EHB again and is done.
> - Because an MSI interrupt has been signaled, xhci_irq() is run again.
>    It discovers there's nothing to do and returns IRQ_NONE.
> 
> Avoid by clearing the EHB bit only at the end of xhci_irq().

Thanks,
Nice catch, we shouldn't clear EHB if we are in the middle of handling several
events.

> 
> Fixes: dc0ffbea5729 ("usb: host: xhci: update event ring dequeue pointer on purpose")
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Cc: stable@vger.kernel.org # v5.5+
> Cc: Peter Chen <peter.chen@nxp.com>
> ---
>   drivers/usb/host/xhci-ring.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 1dde53f..bc6280b 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2996,7 +2996,8 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
>    */
>   static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
>   				     struct xhci_interrupter *ir,
> -				     union xhci_trb *event_ring_deq)
> +				     union xhci_trb *event_ring_deq,
> +				     bool clear_ehb)
>   {
>   	u64 temp_64;
>   	dma_addr_t deq;
> @@ -3022,7 +3023,8 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
>   	}
>   
>   	/* Clear the event handler busy flag (RW1C) */
> -	temp_64 |= ERST_EHB;
> +	if (clear_ehb)
> +		temp_64 |= ERST_EHB;
>   	xhci_write_64(xhci, temp_64, &ir->ir_set->erst_dequeue);
>   }


This might still write the ERST_EHB bit even if clear_ehb is false.
  
Earlier in xhci_update_erst_dequeue() we do:
   temp_64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue)
   ...
   temp_64 &= ERST_PTR_MASK;
   temp_64 |= ((u64) deq & (u64) ~ERST_PTR_MASK);

ERST_PTR_MASK covers the ERST_EHB bit, so if it's set it will also be written back,
which clears it (RW1C)

   #define ERST_EHB                (1 << 3)
   #define ERST_PTR_MASK           (0xf)

The ERST_PTR_MASK name is really confusing as it masks everything else than the dequeue pointer.
Should probably be changed

-Mathias
