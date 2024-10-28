Return-Path: <linux-usb+bounces-16764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 048A49B2C08
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 10:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECD73282B41
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 09:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589CB198836;
	Mon, 28 Oct 2024 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hokBepFq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5925C19067C
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 09:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730109149; cv=none; b=M1bzqQCy+2FaSKPQyyrMN0tonCBQWijXL/ZTzFw3AfDQh/p9VkjRbXEqq6A5+OBLcrIZIYnVCBL5RzZeUW1wOnZTm365hcgjim/PI7r0sppFThgsydKrEdbqEfOxRcp9SzvX57oa8UzfGCISRAA+PZU1rW6T+Nqt3926moLG68Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730109149; c=relaxed/simple;
	bh=+BDJpNDGvNYlhNYBODhfvBiZNs8BEmEGcfEBZGGrkqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=beBsyaIdbF3O97olGVAsWr0fC8OHgOV/BmLOXdZnlWWD0PjGcSDZoobu0vMKpZosl6NZJrifxtcGqXJRgMFeEkgsYd8Ssgg1fd4vvtwAtmvZPTlCZxvvMR/IVwkUxCNGn+CC40I/qJ4RgG2s56sgHV70h3jEj+ktY9ZFz9qlZaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hokBepFq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730109148; x=1761645148;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=+BDJpNDGvNYlhNYBODhfvBiZNs8BEmEGcfEBZGGrkqs=;
  b=hokBepFqmgAGrqMWYJCFm1d22DsoahaqK2ROmfW7R7Ktrm8BVeu+HhSC
   nYERPID+oCgFLTL6HCR6Y+2VOp/l8OD9+khnBHhxGQcrxCf8m+zMipjSR
   ZwTLeIyY8lW4a+mL3D7WuowIAdo34B9Pvdyr+D2VeSrOSa/MmuBtm+ksz
   9YDUVr5AFOeQN1r5bI8rOYQZ4Bo9Kqx8WcmZOR39fNvFFSWIarBxWfMjh
   P/OehgHv1ZgT44tg2SzGk9fvFCYwJVR8N2kmoysnW47hnNsvzPaUJOtZR
   9uNT/2CSfip68Itmtxh4m2nZ7voEwDm0BloOD1mrzW6z60QU9L50yXf/j
   A==;
X-CSE-ConnectionGUID: JpTWBSJ+ToeXxSD9KcPFaw==
X-CSE-MsgGUID: aF8uj1+NTAe5TRhVSEToow==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29803658"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="29803658"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 02:52:27 -0700
X-CSE-ConnectionGUID: 26NZURsBTPmMMs3SWkx/UQ==
X-CSE-MsgGUID: lpAb6xS4SyKak2zS12ZUxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="104890192"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2024 02:52:26 -0700
Message-ID: <f6dcf205-e8eb-4ba8-91d9-24fa0f769739@intel.com>
Date: Mon, 28 Oct 2024 11:54:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xhci: Fix the NEC stop bug workaround
To: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
References: <20241025121806.628e32c0@foxbook>
 <20241028083351.655d54cf@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <20241028083351.655d54cf@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.10.2024 9.33, Michal Pecio wrote:
> Hi Mathias,
> 
> I would be grateful if you could take a look at patch 2/2 and tell if
> there is anything obviously wrong with this approach. As far as I see,
> it should be OK to just call those invalidation and giveback functions
> directly from xhci_urb_dequeue(), and it works for me in practice.

Adding EP_HALTED case to xhci_urb_deqeue() should work fine, we
will both invalidate and give back the invalidated TDs in the completion
handler.

> 
> Regarding the probem with xhci_invalidate_cancelled_tds() being called
> while Set TR Dequeue is already pending, I found that it is much easier
> to handle it by looking at SET_DEQ_PENDING and simply setting all TDs
> to TD_CLEARING_CACHE_DEFERRED if that's the case. So this is solved.
>

The SET_DEQ_PENDING case is trickier. We would read the dequeue pointer
from hardware while we know hardware is processing a command to move the
dequeue pointer. Result may be old dequeue, or new dequeue,
possible unknown.

We are turning an already difficult issue even more complex

> 
> However, these patches still don't solve the issue of infinite retries
> completely. There is one more annoying case caused by halts. It is very
> poorly defined what happens when a halted EP is hard-reset. Usually Set
> TR Dequeue executes afterwards and it restarts the EP when done. But if
> it doesn't, the EP stays stopped until a new URB is submitted, if ever.
> 
> There is the EP_HARD_CLEAR_TOGGLE flag which is set until the class
> driver calls usb_clear_halt(), but it's neither the case that the EP is
> guaranteed to be stopped until usb_clear_halt() is called nor that it
> is guaranteed to restart afterwards.
> 
> Actually, I think it might be a bug? What if Set TR Dequeue restarts an
> EP before the class driver clears the device side of the halt?

Ok, I need to take some time to dig into this.

> 
> 
> I'm starting to think that it may not be realistic to quickly solve all
> those (and possibly other not known yet) problems now. Maybe just slap
> a 100ms timeout on those retries, add quirks for ASMedia/Intel and call
> it a day for now?

There are some mitigations that could be done.

As many of these issues are related to slow enpoint slow start causing
next stop endpoint command to complete with context error as endpoint is
still stopped.

We could ring the doorbell before giving back the invalidated tds in
xhci_handle_cmd_stop_ep(), and possibly xhci_handle_cmd_set_deq().
This gives hardware a bit more time to start the endpoint.

We could also track pending ring starts.
Set a "EP_START_PENDING flag when doorbell is rung on a stopped endpoint.
clear the flag when firt transfer event is received on that endpoint.

If a stop endpoint command fails with context error due to still being
stopped queue a new stop endpoint command, but only if flag was set:

xhci_handle_cmd_stop_ep()
	if (comp_code == COMP_CONTEXT_STATE_ERROR) {
		switch (GET_EP_CTX_STATE(ep_ctx))
		case EP_STATE_STOPPED:
			if (!(ep->ep_state & EP_START_PENDING)
				break;
			ep->ep_state &= ~EP_START_PENDING;
			xhci_queue_stop_endpoint();

Thanks
Mathias


