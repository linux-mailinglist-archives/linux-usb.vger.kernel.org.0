Return-Path: <linux-usb+bounces-20826-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9EEA3C20F
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 15:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC060188166F
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 14:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D3F1DFE32;
	Wed, 19 Feb 2025 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WN84pfbQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF3D1EA7F0
	for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739975075; cv=none; b=Luq9tc2wA+YcY/KsnEVqm+9gRXhilZ6or5ibyNMykX9CfsJzC4t4GWpFC4Av1n81NBuqkkl7ItCsGlEbAZNzWUFCQLynKMvDHVzV7BCkE4qxtERcgqdNr4RDepIP9PNBVB6oFLxmbyISIWZQy7x3oMWrq0Vrd7zKh7OwM7TSoxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739975075; c=relaxed/simple;
	bh=Enj+AVS7bQnBgblHL6lvEo5F+/rw4RF3qY3AwbRnljQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMB0hVwfH2aydSTJ6sS/1FWBXpqwlI1odwC7nnBdJufKlSDHUfay5B8iM8eoXeZ9x7aeuwUFrUcUp9/w+holsRjjCHfUMxaPhIfqCvrv4xxjGUoiUAfhfHFFlPFt+hUosm6/lHdtIfziMBw/Zk9n/yHfGL+bKJP99R4jo01uudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WN84pfbQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739975074; x=1771511074;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Enj+AVS7bQnBgblHL6lvEo5F+/rw4RF3qY3AwbRnljQ=;
  b=WN84pfbQVM5mmv8pOI927SbJPL0DxZrvlp5Vj8DldmjqCiWF+GxGpz6v
   R8adCzmChyLIcJx/G6fr6M7H1hPYSeV0u7IxMrX5qUW2y3zjDTYh7+j4i
   76X06cbAta/olIHOHQk57vz59uWK8nADc/YMgfphzH81DSdpRyUcpabMF
   Kv+Ov++1woD4yX+9j/yPKTz884cQPexDxMAzK3n4YYYMLLuPmmqZH6e4L
   d5QaineRqB60NLy0oEl3aHnIHdqf0biSQbAThDFg/eU6ic9eJUHVRmxgD
   jblqwpR1JSC/80/fwhf7/zveSTiBYa4XwHQ4YHSl+s6LkO5dhVNp9l1l6
   w==;
X-CSE-ConnectionGUID: IQjxa8DYRqilYAsVZtIonw==
X-CSE-MsgGUID: 329/09FBSfalCppcsiPgIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="28309107"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="28309107"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 06:24:33 -0800
X-CSE-ConnectionGUID: /KF4vOHtQq+PJXerIfU5Fw==
X-CSE-MsgGUID: vnoYerpoSNSyVSiPDACBwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="114652648"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 19 Feb 2025 06:24:32 -0800
Message-ID: <fc3be972-6e28-4942-b37d-4f2e39bb866b@linux.intel.com>
Date: Wed, 19 Feb 2025 16:25:31 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] usb: xhci: rework and simplify trb_in_td()
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 niklas.neronin@linux.intel.com
Cc: linux-usb@vger.kernel.org
References: <20250219095637.5bd6e9e4@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250219095637.5bd6e9e4@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19.2.2025 10.56, Michał Pecio wrote:
> Hi,
> 
>> +		/* Edge case, the TD wrapped around to the start segment. */
>> +		if (xhci_trb_virt_to_dma(td->end_seg, td->end_trb) < dma &&
>> +		    dma < xhci_trb_virt_to_dma(td->start_seg, td->start_trb))
>> +			return NULL;
>> +		if (seg->dma <= dma && dma <= (seg->dma + TRB_SEGMENT_SIZE))
> 
> It should be strict inequality for the upper bound here.
> 
> Note that this wraparound case souldn't be happening (the driver avoids
> moving enqueue into deq_seg to simplify ring expansion) so no amount of
> testing will catch problems here, until maybe something changes one day.
> 
>> +			return seg;
>> +		seg = seg->next;
>> +	}
> 
> The situation is tricky now, because we are either in start_seg and
> end_seg is elsewhere or in start_seg->next and wraparound. But it looks
> like the loop below will work OK for either case.
> 
>> +	/* Loop through segment which don't contain the DMA address. */
>> +	while (dma < seg->dma || (seg->dma + TRB_SEGMENT_SIZE) <= dma) {
> 
> This condition looks like it could use the in_range() macro.
> 
>> +		if (seg == td->end_seg)
>> +			return NULL;
>> +
>> +		seg = seg->next;
>> +		if (seg == td->start_seg)
>> +			return NULL;
> 
> I suppose this only happens if end_seg is not on the ring, fair enough.
> 
>> +	}
> 
> Maybe a comment here? Something like:

> 
> * At this point seg contains the dma and either:
> * a. start_seg != end_seg and seg can be anywhere
> * b. start_seg == end_seg in wraparound case and seg != start_seg

Agreed, a comment here would help.

> 
>> +	if (seg == td->start_seg) {
>> +		if (dma < xhci_trb_virt_to_dma(td->start_seg, td->start_trb))
>> +			return NULL;
>> +	} else if (seg == td->end_seg) {
>> +		if (xhci_trb_virt_to_dma(td->end_seg, td->end_trb) < dma)
>> +			return NULL;
>> +	}
>> +	return seg;
> 
> This should be corrent, but it's not something immediately obvious.
> 
> Not sure if this new implementation is really simpler than the old one.
> I wonder if it wouldn't make sense to reorder this after the API change
> (patch 4/4) to allow emergency revert if something unexpected shows up.

Had to draw several cases on paper to go through this new version.
But I might just be used to the old one

> 
> As for efficiency, those virt_to_dma translations aren't exactly free
> and there are two. Maybe it could be faster to translate dma to virt
> once and then compare. Sometimes also sizeof(*) < sizeof(dma_addr_t).

Agreed

dma_addr_t start_dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
dma_addr_t end_dma = xhci_trb_virt_to_dma(td->end_seg, td->end_trb);

comparisons will then be a lot easier to read with start_dma and end_dma

-Mathias


