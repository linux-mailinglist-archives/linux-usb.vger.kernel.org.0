Return-Path: <linux-usb+bounces-17774-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6819D4E45
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 15:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32ED128321A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 14:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E5F1D88D5;
	Thu, 21 Nov 2024 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcNUZz4C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD66C1CD3F
	for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732197961; cv=none; b=PHWbLtNExYi/JTvCGs/IDD78k/1s6g/7wBOnPVk4FqRDoigFygBbmzfZLGJ225MpPuI5syg2jF9N8+LbuQfHIJFdN6UtsvP6QIxgcjTaSn+sad9W0Pr8FcT2xWVqfhgb07DQ670502MMjzt+GmYIkk5y4MdHfFvCd/1Kfh9QNfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732197961; c=relaxed/simple;
	bh=N+hWhe/VgGW+4Rk0pwm0nMWrFYhUoLUzeXf2EE+WeHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMe8qi9W6TMTp7ASHqKUgcqkKPg5WrKLzdbo3tkx+WvcEnAuDOxdSlN2FQ07CwhiareVt2+xQi3Sp/FiL4RlLmS6iNTc69jW/Qd6iLGUmwFAeLXxY5iQLqJUhJIWO2QJH56KPys3oHBuUEQnp3PeNvNdqHZq/A7qZ+UzH8/8CMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DcNUZz4C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732197959; x=1763733959;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=N+hWhe/VgGW+4Rk0pwm0nMWrFYhUoLUzeXf2EE+WeHk=;
  b=DcNUZz4CVhGkJvZQ3T2gtaSYyUhA5FN1CP3kLVIePZAsDSaP63xWZUww
   0yB4xDur1ztnZE5CMRezoWkc3TkXTYt/lGrxaKVQfjiENtKtSCpDA5b+7
   iW5j0rjFienkr8DFCSqJ92zrlMrxyZnH54QvEs15dM642L2Xn4zukMNer
   sGi1irI/s/UA7YpijRLUgNXxeC/fJpZnD0Rapaeej3HCPJD2jDnz5kt5e
   ADTx4StEf6mYeYVG/3C/5KYLDDSKYKaa1aZcBAYHUmdTAeVuwJJCrNeUR
   w1wWTKGhBx72cN+t3rAh+dHV2uLhoVnO2K/J5QG8Jn14isbKMA56caoJt
   A==;
X-CSE-ConnectionGUID: 9vGpCAKLSSOJZpECkPsEcw==
X-CSE-MsgGUID: L2eMZFxET5e8fF0InhbycA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42951880"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="42951880"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 06:05:59 -0800
X-CSE-ConnectionGUID: md0VWAhIQDWXzJQXvaIPEw==
X-CSE-MsgGUID: PolpmzCQTz2t5OHtWhEUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="90671333"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa007.jf.intel.com with ESMTP; 21 Nov 2024 06:05:56 -0800
Message-ID: <f5a2d3f8-b895-4617-b11e-cc134e3922c3@linux.intel.com>
Date: Thu, 21 Nov 2024 16:08:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How are halted endpoints supposed to be handled in Linux?
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20241121001138.23a45f6c@foxbook>
 <20241121000216.kif557p3p6xyahax@synopsys.com>
 <b34b5ea0-2804-4692-bede-70ba9065c86c@rowland.harvard.edu>
 <20241121112653.06ba4ee5@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241121112653.06ba4ee5@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.11.2024 12.26, Michał Pecio wrote:
> Hi Alan,
> 
> Thank you for taking the time to answer. I'm beginning to regret not
> asking this question earlier.
> 
> On Wed, 20 Nov 2024 21:31:29 -0500, Alan Stern wrote:
>>>> Linux appears to ignore this part and only reset on STALL
>>>> handshake, as advised in
>>>> Documentation/driver-api/usb/error-codes.rst and practiced by
>>>> drivers - they don't seem to bother with usb_clear_halt() on
>>>> -EPROTO.

For xhci I assumed that the device endpoint is halted when we receive
a  'Stall Error' transfer event for bulk or interrupt transfers.

Other errors such as 'Transaction Error' do halt the host side,
but does not necessarily mean whole endpoint is halted. This is based
on the info in xhci 4.6.8.1 "Soft Retry" :

"xHC shall halt an endpoint with a USB Transaction Error after CErr
retries have been performed. The USB device is not aware that the xHC
has halted the endpoint, and will be waiting for another retry, so a
Soft Retry may be used to perform additional retries and recover from
an error which has caused the xHC to halt an endpoint."

>>
>> This is generally a weakness in the drivers.  It would be nice if the
>> class specifications said what to do in these situations, but most of
>> them don't.
> 
> There is also proprietary hardware with no specification at all.
> 
>>>> On the HCD side, xHCI will:
>>>> - give back the current URB with -EPROTO/-EPIPE status
>>>> - reset the host side endpoint, clearing its toggle state
>>>> - point the HC at the next URB if one exist
>>>> - restart the endpoint without waiting for hcd->endpoint_reset()

Intention was not to restart the endpoint, but turns out we end up doing it.

Basically we should not ring the doorbell  when 'Set TR Deq' command completes
for a bulk or interrupt endpoint in case the command was queued to resolve a
Stall Error. For control endpoint we should restart the ring (xHC halts
the internal control endpoint on errors/stall)

>>>> - ignore one subsequent call to hcd->endpoint_reset()

>>
>> This behavior is not correct.  See the kerneldoc for
>> usb_unlink_urb() in drivers/usb/core/urb.c, especially the section
>> labelled "Unlinking and Endpoint Queues".
> 
> OK, let's go through it.
> 
>   * But when an URB terminates with an
>   * error its queue generally stops (see below), at least until that URB's
>   * completion routine returns.
> 
> I don't see this working after xHCI adopted bottom half giveback, which
> is asynchronous. As you are the maintainer of EHCI, which also uses BH,
> how is EHCI dealing with it?
> 
> One way I see with existing APIs is to wait until the driver submits a
> new URB, but are drivers prepared for this? Is EHCI doing the same?

Using a BH also means class driver may queue a new URB to xhci after xhci has
cleared its internal endpoint halt condition, but before class driver is
aware that endpoint halted.

> 
>   * It is guaranteed that a stopped queue
>   * will not restart until all its unlinked URBs have been fully retired,
>   * with their completion routines run
> 
> I think xHCI can currently guarantee that nothing is restarted until
> any URB unlinked for any reason is given to the BH worker, but that's
> all we have, and I just broke it in usb-next:
> 
> +               /* Try to restart the endpoint if all is done */
> +               ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
> +               /* Start giving back any TDs invalidated above */
> +               xhci_giveback_invalidated_tds(ep);
> 
> This is part of a legitimate bugfix patch tagged for stable. I should
> have insisted on keeping it a separate change, but it seemed a good idea
> at the time which would soon get implemented anyway... Maybe no more?

I don't think your patch makes the existing issue worse in any significant
way.

Thanks
Mathias


