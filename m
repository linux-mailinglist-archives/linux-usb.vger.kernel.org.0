Return-Path: <linux-usb+bounces-16899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CD89B7C35
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 14:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6329281630
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 13:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B886B19F135;
	Thu, 31 Oct 2024 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="me9XZrHJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BAA19C56F
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730383008; cv=none; b=Iz5p55EHDKNyi0czhOG6WePub+cyzBkQxdTzXWli2gzN8iHdHwBguS/kaz4R2o1ji2Wx726qIEHbLkqzxwMwAvQMmS8LMy1UdWiT4AZd90H47bsqo7v5MCP8kw0QBTsyzK5xne55J4ygDgPpYoCctQfQ1K9Maeo0nmuSMbNI8b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730383008; c=relaxed/simple;
	bh=s5DKTO8Ipe7bkSP+8Q2uEie45UyHo7U7vdq1dA6UwP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LIGylPjhlHQryOE7AT/rKqJ2hszcO1/2W3M2jcP1GiLM52dfqvOW63Kxdn3YylJIemjay67LPOpfkXtXB3+IFQEvehFxcuYDiFH8NWOZUs9kXYQRmLMvt88XzN5Iy63rX15O23ks7XiFIxXl6eKytbSL38t1BaxtQiVkLXJc3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=me9XZrHJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730383005; x=1761919005;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=s5DKTO8Ipe7bkSP+8Q2uEie45UyHo7U7vdq1dA6UwP8=;
  b=me9XZrHJ30UDct/4e/aA87/sTpzeRQ4/wgmyFXU7nXKKe/efIjtcXewZ
   Nvnebfw7trsyFONrIOAvt8ROt1ZXI5Eq1c0BZlMkR+GH3q16qu8dxhaPE
   MHAvPjHy8ioCyh4xiDLy+13NbPvZTwk+CFmdOY6X19Yh5S0Dpj5p9YDcz
   t7jvUv/3D3jWe3OJ3eaFHzmne0lNvqKBIMqp7vDwc8WqnYT18b1YFgmlK
   7GCE9/mZwD4AnMrcxPhLDYmUXi/rgu29xoDPDK5t4Ept5tAqSKD9YHPYD
   c3Okmn+UVDX8cZ0Rzx74SMBRwP/IKRJQbCkFkIXxZfTJOD+XwuzJLZ0Pj
   Q==;
X-CSE-ConnectionGUID: /FUmLh19ToyYC9NVA1rj4g==
X-CSE-MsgGUID: Ywghhq0QTZOSllWHa5+b3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30333855"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="30333855"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 06:55:03 -0700
X-CSE-ConnectionGUID: PKP6IoOIRXuk85WkNg6Vtg==
X-CSE-MsgGUID: 3py3/sQ/SC+O9sd9qjUj7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87429702"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 31 Oct 2024 06:55:02 -0700
Message-ID: <e2570c87-17c4-4d3c-af9a-ca45cd20f02f@intel.com>
Date: Thu, 31 Oct 2024 15:57:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] usb: xhci: Fix TD invalidation under pending Set
 TR Dequeue
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <20241031104159.25f9ff70@foxbook>
 <20241031104401.22a80b14@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <20241031104401.22a80b14@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.10.2024 11.44, Michal Pecio wrote:
> xhci_invalidate_cancelled_tds() may work incorrectly if the hardware
> is modifying some Endpoint or Stream Context by executing a Set TR
> Dequeue command at the same time. And even if it worked, it couldn't
> queue another Set TR Dequeue if required, failing to clear xHC cache.
> 
> Yet this function is called by completion handlers of commands like Stop
> Endpoint and Reset Endpoint without any testing for SET_DEQ_PENDING. The
> problem remained undetected for long time because the UAS driver rarely
> cancels URBs, but it does cancel them sometimes, e.g. on I/O errors.
> 
> Make it legal to call xhci_invalidate_cancelled_tds() under a pending
> Set TR Dequeue. Bail out of the function when SET_DEQ_PENDING is set,
> then make the completion handler call the function again and also call
> xhci_giveback_invalidated_tds(), which typically must be called next.
> 
> Clean up some code which duplicates functionality of these functions.
> 
> Fixes: 5ceac4402f5d ("xhci: Handle TD clearing for multiple streams case")
> CC: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
>   drivers/usb/host/xhci-ring.c | 45 ++++++++++++------------------------
>   1 file changed, 15 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 98e12267bbf6..52eb3ee1d7bf 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -959,7 +959,7 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
>    * We're also in the event handler, so we can't get re-interrupted if another
>    * Stop Endpoint command completes.
>    *
> - * only call this when ring is not in a running state
> + * only call this on a ring in Stopped state (we may need to queue Set TR Deq)
>    */
>   
>   static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
> @@ -973,6 +973,13 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
>   	unsigned int		slot_id = ep->vdev->slot_id;
>   	int			err;
>   
> +	/*
> +	 * This is not going to work if the hardware is changing its dequeue
> +	 * pointers as we look at them. Completion handler will call us later.
> +	 */
> +	if (ep->ep_state & SET_DEQ_PENDING)
> +		return 0;
> +
>   	xhci = ep->xhci;
>   
>   	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
> @@ -1001,7 +1008,9 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
>   		if (td->cancel_status == TD_HALTED || trb_in_td(xhci, td, hw_deq, false)) {
>   			switch (td->cancel_status) {
>   			case TD_CLEARED: /* TD is already no-op */
> -			case TD_CLEARING_CACHE: /* set TR deq command already queued */
> +				break;
> +			case TD_CLEARING_CACHE: /* set TR deq command completed */
> +				td->cancel_status = TD_CLEARED;

This should only happen if 'Set TR Deq' fails as in success cases the hw_deq is moved past this TD.
when it fails the cache may not be cleared. i.e. rd is not TD_CLEARED

We do have the same problem in current code, but moving it here makes that even harder to fix.

>   				break;
>   			case TD_DIRTY: /* TD is cached, clear it */
>   			case TD_HALTED:
> @@ -1358,8 +1367,6 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
>   	struct xhci_virt_ep *ep;
>   	struct xhci_ep_ctx *ep_ctx;
>   	struct xhci_slot_ctx *slot_ctx;
> -	struct xhci_td *td, *tmp_td;
> -	bool deferred = false;
>   
>   	ep_index = TRB_TO_EP_INDEX(le32_to_cpu(trb->generic.field[3]));
>   	stream_id = TRB_TO_STREAM_ID(le32_to_cpu(trb->generic.field[2]));
> @@ -1451,37 +1458,15 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
>   				  ep->queued_deq_seg, ep->queued_deq_ptr);
>   		}
>   	}
> -	/* HW cached TDs cleared from cache, give them back */
> -	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list,
> -				 cancelled_td_list) {
> -		ep_ring = xhci_urb_to_transfer_ring(ep->xhci, td->urb);
> -		if (td->cancel_status == TD_CLEARING_CACHE) {
> -			td->cancel_status = TD_CLEARED;
> -			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
> -				 __func__, td->urb);
> -			xhci_td_cleanup(ep->xhci, td, ep_ring, td->status);
> -		} else if (td->cancel_status == TD_CLEARING_CACHE_DEFERRED) {
> -			deferred = true;
> -		} else {
> -			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
> -				 __func__, td->urb, td->cancel_status);
> -		}
> -	}
>   cleanup:
>   	ep->ep_state &= ~SET_DEQ_PENDING;
>   	ep->queued_deq_seg = NULL;
>   	ep->queued_deq_ptr = NULL;
>   
> -	if (deferred) {
> -		/* We have more streams to clear */
> -		xhci_dbg(ep->xhci, "%s: Pending TDs to clear, continuing with invalidation\n",
> -			 __func__);
> -		xhci_invalidate_cancelled_tds(ep);
> -	} else {
> -		/* Restart any rings with pending URBs */
> -		xhci_dbg(ep->xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
> -		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
> -	}
> +	/* Continue cancellations or restart the ring if done */
> +	xhci_invalidate_cancelled_tds(ep);

xhci_invalidate_cancelled_tds() now gets a secondary purpose which is not obvious from
reading the code.
its repurposed here mainly to turn cancelled tds from TD_CLEARING_CACHE to
TD_CLEARED in cases where hw_deq is _NOT_ in the td.

xhci_invalidate_cancelled_tds() will now also perform some extra work on each
already cleared td that is still in the ep->cancelled_td_list

I think its clearer to run though the cancelled td list above, and only
call xhci_invalidate_cancelled_tds() if needed.

i.e.

list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
	switch (td->cancel_status) {
	case TD_CLEARING_CACHE:
		td->cancel_status = TD_CLEARED;
		break;
	case TD_CLEARING_CACHE_DEFERRED:
	case TD_DIRTY:
		pending_td_cancels = true;
		break;
	default:
		break;
	}
}
...
if (pending_td_cancels)
	xhci_invalidate_cancelled_tds(ep);

Thanks
Mathias


