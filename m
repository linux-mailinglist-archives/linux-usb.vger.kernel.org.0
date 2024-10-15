Return-Path: <linux-usb+bounces-16226-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD63599E4F2
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 13:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC56CB2345C
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 11:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119C419F104;
	Tue, 15 Oct 2024 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjDrSnxt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6B140E50
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728990194; cv=none; b=AMhEI/i8YNBeNMZPXdyBugXY5tqXsoUcBYtyHdV4A2edLHrS1TJEG0rDIx2DPD93CtBd1BHqiYdnpuyDKvOMXd7D1u0g5IgRb3KcgO/BuKlQ8GsRP4n6lrltF/RMUtF316m2FAfRac6TG1YFvT4qfAooYYOCZBPO54h5+AEE6FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728990194; c=relaxed/simple;
	bh=2FsryPqKTdr9CeyvOTzzJVsXoqLyyKoO82J9Hf3vudE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jyDa11xiGF0FXdeWflmfh2ZSF3XvUUrV4FDbubNxQW3kySvhutjQkJM3+2E6tdGlIOrYSjEQMc+RWXO39j1BLd4Hakes4uclqWzJfe6EPN7HeEpQ0yY+V2zHOo44y3ql11Bfx9HSNO1V1GxPKxSTdbwvBpy4JNOkC9ElKIY+SVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjDrSnxt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728990193; x=1760526193;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2FsryPqKTdr9CeyvOTzzJVsXoqLyyKoO82J9Hf3vudE=;
  b=SjDrSnxtfb+rOqEvJaJcOis71EbfnJjgwNJvw0C9qKWLBzIW1bydMLsp
   wLO1M8qet3/7M2R5iq+LAwf33veHfF1eKnde9v7v58Pz0EwYkKEW5YHUE
   vRhfRa6NujV+uCELomiQiT+242A+o6u3OTyVUN38O/c2zTfNzLf1wJGpc
   euMxD1ner+NVt69muqiQFoQZRjdcc6afSzxNBG9UtkjdDl/v4zn15Fi68
   K07bReUz3xXlNFD3ltbA+1npanoN1k63Dp6sbsV4KEX5FBByIm8fOTsiT
   tNmolRa6yEe5pAbk6RdlqO4V8gRhXKnd/v8B4LD+3MJe1UJoAOadGwJVs
   g==;
X-CSE-ConnectionGUID: lpMSgx3ASM28I+DOZeF6jw==
X-CSE-MsgGUID: ZP6PVzgKRqGuUW1bD1CcnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39007239"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="39007239"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:03:12 -0700
X-CSE-ConnectionGUID: furm48CKSO6m/PrOBeZWLw==
X-CSE-MsgGUID: cj0F1z37SSW1cOardv1znQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="78678858"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2024 04:03:11 -0700
Message-ID: <033e1f4e-c64c-4e8e-b249-02303e75baa8@linux.intel.com>
Date: Tue, 15 Oct 2024 14:05:22 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: xhci: Fix the NEC stop bug workaround
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
References: <20241014210840.5941d336@foxbook>
 <20241014211005.07562933@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241014211005.07562933@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.10.2024 22.10, Michal Pecio wrote:
> The NEC uPD720200 has a bug, which prevents reliably stopping
> an endpoint shortly after it has been restarted. This usually
> happens when a driver kills many URBs in quick succession and
> it results in concurrent execution and cancellation of TDs.
> 
> This is handled by stopping the endpoint again if in doubt.
> 
> This "doubt" turns out to be a problem, because Stop Endpoint
> may be queued when the EP is already Stopped (for Set TR Deq
> execution, for example) or becomes Stopped concurrently (by
> Reset Endpoint, for example). If the EP is truly Stopped, the
> command fails and further retries just keep failing forever.
> 
> This is easily triggered by modifying uvcvideo to unlink its
> isochronous URBs in 100us intervals instead of poisoning them.
> Any driver that unlinks URBs asynchronously may trigger this,
> and any URB unlink during ongoing halt recovery also can.
> 
> Fix the problem by tracking redundant Stop Endpoint commands
> which are sure to fail, and by not retrying them. It's easy,
> because xhci_urb_dequeue() is the only user ever queuing the
> command with the default handler and without ensuring that
> the endpoint is Running and will not Halt before it Stops.
> For this case, we assume that an endpoint with pending URBs
> is always Running, unless certain operations are pending on
> it which indicate known exceptions.
> 
> Note that we need to catch those exceptions when they occur,
> because their flags may be cleared before our handler runs.
> 
> It's possible that other HCs have similar bugs (see also the
> related "Running" case below), but the workaround is limited
> to NEC because no such chips are currently known and tested.
> 
> Fixes: fd9d55d190c0 ("xhci: retry Stop Endpoint on buggy NEC controllers")
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
>   drivers/usb/host/xhci-ring.c | 44 +++++++++++++++++++++++++++++++++---
>   drivers/usb/host/xhci.h      |  2 ++
>   2 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 4d664ba53fe9..c0efb4d34ab9 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -911,6 +911,21 @@ static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
>   	return ret;
>   }
>   
> +/*
> + * A Stop Endpoint command is redundant if the EP is not in the Running state.
> + * It will fail with Context State Error. We sometimes queue redundant Stop EP
> + * commands when the EP is held Stopped for Set TR Deq execution, or Halted.
> + * A pending Stop Endpoint command *becomes* redundant if the EP halts before
> + * its completion, and this flag needs to be updated in those cases too.
> + */
> +static void xhci_update_stop_cmd_redundant(struct xhci_virt_ep *ep)
> +{
> +	if (ep->ep_state & (SET_DEQ_PENDING | EP_HALTED | EP_CLEARING_TT))
> +		ep->ep_state |= EP_STOP_CMD_REDUNDANT;
> +	else
> +		ep->ep_state &= ~EP_STOP_CMD_REDUNDANT;
> +}
> +
>   static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
>   				struct xhci_virt_ep *ep,
>   				struct xhci_td *td,
> @@ -946,6 +961,7 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
>   		return err;
>   
>   	ep->ep_state |= EP_HALTED;
> +	xhci_update_stop_cmd_redundant(ep);
>   
>   	xhci_ring_cmd_db(xhci);
>   
> @@ -1149,15 +1165,31 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
>   				break;
>   			ep->ep_state &= ~EP_STOP_CMD_PENDING;
>   			return;
> +
>   		case EP_STATE_STOPPED:
>   			/*
> -			 * NEC uPD720200 sometimes sets this state and fails with
> -			 * Context Error while continuing to process TRBs.
> -			 * Be conservative and trust EP_CTX_STATE on other chips.
> +			 * Per xHCI 4.6.9, Stop Endpoint command on a Stopped
> +			 * EP is a Context State Error, and EP stays Stopped.
> +			 * The EP could be stopped by some concurrent job, so
> +			 * ignore this error when that's the case.
> +			 */
> +			if (ep->ep_state & EP_STOP_CMD_REDUNDANT)
> +				break;

Can we skip the new flag and just check for the correct flags here directly?

if (ep->ep_state & (SET_DEQ_PENDING | EP_HALTED | EP_CLEARING_TT)
	break;

Thanks
Mathias

