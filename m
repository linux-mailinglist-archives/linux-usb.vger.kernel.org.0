Return-Path: <linux-usb+bounces-14647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3230D96C056
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 16:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE2451F26963
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 14:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A461E0082;
	Wed,  4 Sep 2024 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTPbyHSx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B534E2575F
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 14:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459866; cv=none; b=T4qn2rbPFgy+yG+snteobRKrrmwgZArTJB8NjhjGPqbRBJWfdUd33YR4x4ehhDntpx3lt/knqYwPlNYTuxSXnw05b4CBzN8qCNWt0LZ+aKelw7WMHIg3WmnDpfvXYNHWAlFulkHGwyEJQqqa3sfk+JVe8tBI/iisOFX4x8pjy/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459866; c=relaxed/simple;
	bh=gvHVolaLO+O7FIby1m4yVqGKAgb8CuN11wv6FFBagf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYdQKlQUt5KT1AMzYnRZdDQdGG8tAaiuDhNu0MySjDaLnTCT3rrqFnKfhc/b8OVmn4SoIn2xBxNgI5tni20d2TiqRcVbjmL2wabA2iJ994lmpRqZNak9jibfMo+8IVx9Z5G7REfZ/Cr18idwTqFdvUjnPR4PRrUSxLQaI9E3zXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTPbyHSx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725459865; x=1756995865;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gvHVolaLO+O7FIby1m4yVqGKAgb8CuN11wv6FFBagf8=;
  b=hTPbyHSxYbcL15vyc0X1L2tVBhWs2Rbq1N18Lnq/k2iJebeasnjzp3Ig
   s7pZBKojR5nkkmyxpLkW4F/roXKZyUC9jOSC3ayC5fhW/Z9Dqwyg6N639
   M4BmHo7umCfQDQo/qJtT2zjYd76XCaAeXzaaRArdUDLRNnrGwnkBMaNrP
   kZfaCDzcFApDyDSHHxpHFnLmeMykN5dH4udy3JuNbGFtvL9i0a5Chk60a
   17WYjhXjKnzvrk5gsMYaU5VtmXPjd8LulXDOAMlNjttxm5p10rOKlbg5a
   zLL7it+TYO8uv+clHGEJWYOn2qDvSSZTNZmE+buiCQ0UufYxIFUxGgpDZ
   A==;
X-CSE-ConnectionGUID: bSsYn5JcQ7q5AQmuCBQttw==
X-CSE-MsgGUID: sHOvRSPzRmG7qBqpcxGkbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="49529710"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="49529710"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:24:24 -0700
X-CSE-ConnectionGUID: WzfOJ2WHRF+EeoXeJ3jvlw==
X-CSE-MsgGUID: EbU5eTLCTNKOKUKL5bT+JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="70165020"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2024 07:24:23 -0700
Message-ID: <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>
Date: Wed, 4 Sep 2024 17:26:28 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange issues with UAS URB cancellation
To: Marc SCHAEFER <schaefer@alphanet.ch>,
 Micha?? Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <ZswP0+cLIqkTF0D/@alphanet.ch> <20240903094822.3ae297cb@foxbook>
 <ZtcHOlqlQMMD4LzY@alphanet.ch> <20240903152218.74393a9e@foxbook>
 <ZtcUGe0FWxpO6058@alphanet.ch> <ZtcUq37F6gqgzifm@alphanet.ch>
 <ZtcVXoI6jNM9Lqbl@alphanet.ch> <20240903174535.6e5e581b@foxbook>
 <ZtdmOiKN6hb2Y82I@alphanet.ch>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ZtdmOiKN6hb2Y82I@alphanet.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Looks like there are two cases that might be related.

One is that the device seems to send more data than host asks for.
This triggers a babble error pointing to a already returned transfer, so error
does not get properly handled.

Other issue is the "WARN Set TR Deq Ptr cmd invalid because of stream ID configuration" error.

xhci driver queues a set TR Deq Ptr command when canceling transfers.
This error shown if there is an TRB_ERROR in the actual command we queue.

I can start working on some debugging patches as well if you have the time to try
them out.

More details inlined in log below:

On 3.9.2024 22.40, Marc SCHAEFER wrote:
> Re,
> 
> On Tue, Sep 03, 2024 at 05:45:35PM +0200, Micha?? Pecio wrote:
>> Hmm, this is possibly not a coincidence, but it's also not the same
>> "ERROR Transfer event TRB DMA ptr not part of current TD" that happened
> 
> Got one:
> 
> Sep  3 21:32:58 video kernel: [11408.230466] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
Set TR Deq command completes with TRB_ERROR, meaning the command xhci driver queues was faulty.
I'm guessing we somehow mess up the stream ID when xhci driver craetes the TRB.

> Sep  3 21:32:58 video udisksd[962]: Error performing housekeeping for drive /org/freedesktop/UDisks2/drives/WDC_WD40EURX_63BMCY0_WD_WCC7K6KTRC7F: Error updating SMART data: sk_disk_smart_read_data: Operation not supported (udisks-error-quark, 0)
> Sep  3 21:32:58 video kernel: [11408.247189] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
Transfer event with comp_code 3 which is "Babble Detected Error", but the event doesn't point to a pending transfer

> Sep  3 21:32:58 video kernel: [11408.247197] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000d9911140 trb-start 00000000d9911150 trb-end 00000000d9911940 seg-start 00000000d9911000 seg-end 00000000d9911ff0
The "Babble Detected Error" event points to transfer at 0000000d9911140,
this is one transfer block before the expected trasnfer 0000000d9911150.

This means the Babble Detected Error was intended for the previous transfers, which xhci driver has
already given back to class driver.

A Babble error will halt the endpoint, but xhci driver doesn't recover the endpoint as
event doesn't map to any transfer. This needs to be fixed.

Thanks
Mathias

