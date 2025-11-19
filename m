Return-Path: <linux-usb+bounces-30690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C9C6E852
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 13:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id ECB752A93D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 12:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439003612E9;
	Wed, 19 Nov 2025 12:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMnGbp+0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CAC3612DE;
	Wed, 19 Nov 2025 12:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555742; cv=none; b=eVI+3IsMPaCrJxaaizFHtxUqGtQxlgGIYdnCK7yrudKTqmV4R6N/7ad0vjD4TTIVnegdO4a+VDZyDpJc0IlYRv86LMvkTvEcPa4Kw3GdEPdYi4t24Wr6WRJODvVeRtggRhzTpltizvKK8tfUugKob7YrRDI1aB004UmeZC7YWeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555742; c=relaxed/simple;
	bh=OO6AxvN/FnQ0EtjKoW559lZqJGV4mjpBdHmjYqETTbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iklyjbglfxf69SRWNxQVDq7eE7sE4is5rrKPntU3GN6MG7opl+sP2R2qnKuaIsZGObkcu+41GDaZI4gTAdp/eZ3U78K6prFn4pn9r78X4t5FEd33LTHXgj6ccbZ89p7cQTdeQPF2gZBKaBOOmng5Kaafk1nPNq154CUqEVejdYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMnGbp+0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763555742; x=1795091742;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OO6AxvN/FnQ0EtjKoW559lZqJGV4mjpBdHmjYqETTbQ=;
  b=eMnGbp+0Fwaf22s48EfcEC/GkelipBrg+jpD+ZDeeBi+0+SXN6hHwrAp
   xAYdbHz7eRqxZqdFpVz8GFtNeQNWZfmSro182xu5hUknaqQMVk5iu9gSW
   vz54Ku6M96rupL6jXecZv2vLrUz4LcemcBhUVq4c2/cTwtDM5emVqHS/F
   S6+zwiYqImAWUH11BNcpLVQMXmEnn8ipuqAoOlSbEeoqkWa++jWzfflZo
   R6kFzNwROLEJvJxoeiEs/unY837xM6yyvmdgHrWmf31RamegN/D72Rcvb
   tVetJotYEsJSy91Op1zIsnee5Tr6PSX7+ZTzi/E5j6BHmkZWskusH7Y/O
   A==;
X-CSE-ConnectionGUID: MruyQGJnTmSTfni2ZKsZzA==
X-CSE-MsgGUID: DaAUY8NBS6CyQWxCUD5NYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="82983208"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="82983208"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 04:35:41 -0800
X-CSE-ConnectionGUID: +0Q7TLTZSSeU7OgwGEHR+w==
X-CSE-MsgGUID: h8ZPIZVkTqeeMRu1aPQhPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221963846"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.20]) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 04:35:39 -0800
Message-ID: <88841c24-ee36-421d-bbbe-74d07b0fd594@intel.com>
Date: Wed, 19 Nov 2025 14:35:37 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] xHCI: Decouple updating Dequeue from giveback
To: Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251119120208.6a025eb0.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <20251119120208.6a025eb0.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 13:02, Michal Pecio wrote:
> Hi,
> 
> This introduces unified mechanism for handling all short transfers
> and errors mid TD plus their later events, accurately and in-spec.
> I have been working on this code on and off for the last few months,
> it's dead simple conceptually and tested a lot on various hardware.
> 
> When a TD completes early, store its end_trb on ep_ring and give it
> back. Use end_trb to recognize future events for the TD. Remove the
> SPURIOUS_SUCCESS quirk and unreliable comp code guesswork.
> 
> Isochronous TDs with errors are given back instantly, which reduces
> latency and eliminates the need for error_mid_td flag and some hacks
> like handling Missed Service only to give back error_mid_td.
> 
> Dequeue will be moved in accordance with received events, never to
> the next TD right away. Previous code would do that on Short Packet,
> allowing overwriting of remaining TRBs if it happens across segment
> boundary. Rare enough that no one complained, but obviously wrong.
> 
> We will need a trb_in_range(), and I used this as an opportunity to
> smuggle some long-discussed changes and improve trb_in_td() usage.
> After converting from dma_addr_t to trb* once in handle_tx_event(),
> pass ep_trb instead ep_trb_dma to trb_in_td().
> 
> This requires a rewrite of trb_in_td(). New version is easier and
> shorter. While I'm aware it could be shorter still by using segment
> numbers, it has two advantages which I thought are neat:
> 
> * It can detect when "suspect" TRB is on a different ring than TD.
>    This means it has a loop, but common cases never enter it.
> 
>    (And yes, I've seen this warning once, but I suspect corruption -
>     DMA UAF was involved. Things improved with pdev->untrusted = 1).
> 
> * Needs only one segment pointer (suspect). Call sites are tidier
>    and I don't need to store last TD's end_seg together with end_trb.
> 
> Alternatively, segment numbers can also be used, but I really wanted
> to see if the code could be less noisy.


Looks like we both picked this up again.

I have queued up a couple patches that does basically the same trb_in_range()
changes as your patches 2/5 and 3/5, but uses segment indexes.

I'm sending all for-usb-next patches forward today for 6.19, including those
two patches. Just need to do one small test.

I'll take a closer look at the rest of the series (patches 1/5, 4/5, and 5/5)
They all seam like a good idea, but will need to be rebased on current
for-usb-next

Links to the two patches I mentioned:
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=for-usb-next&id=7cca2b801bae19bfda2e54d7187f78e8af3f3700
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=for-usb-next&id=b78fafee824b964c1db718662ef9854f9d7154dc

Link to my for-usb-next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=for-usb-next

Thanks
Mathias

