Return-Path: <linux-usb+bounces-35782-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DcfKlgUzWmMZwYAu9opvQ
	(envelope-from <linux-usb+bounces-35782-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 14:49:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 089C337AB9F
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 14:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDA1A31E3EB9
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 12:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221F53FF89B;
	Wed,  1 Apr 2026 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FNDsTbVE"
X-Original-To: linux-usb@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A933C9EFB;
	Wed,  1 Apr 2026 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775045495; cv=none; b=tc8LtUn4OKEP8CwMAh+wfbuwnz2MWYa7dQXNEq3PZ8UCwbUsf9Dl0wAq5X0keXoy+JucNyBZ5K4VEfQDgnhIiYK1SM8DYigPsiHmHM4arebUv8fDHa65EEH/oHKy+uONbQi1eELFvqcQ2cZR9em6xbK2atHADwu5Izj5Y7cMwew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775045495; c=relaxed/simple;
	bh=BE5/nPRKaHRs63cPfmGPfBklsCc8yJVyXPy273mNLyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJDuKweb5LkCXA6YOWi+7cPQxFBOMD9aif1kPtcWtu2YoXt17PXmTdgbiU8WVkFBzIHsprRlqy3INyKcaKday1DkbfM8bOFeCZlaxBP/DydBy98Q/MmQL7T3i3pRSF8JZvbrugyDh8EB5e1qmQzpDkpL6GZZQftkK1a79AmCPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FNDsTbVE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 429D31BB0;
	Wed,  1 Apr 2026 05:11:26 -0700 (PDT)
Received: from [10.57.77.192] (unknown [10.57.77.192])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 610EF3F915;
	Wed,  1 Apr 2026 05:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775045492; bh=BE5/nPRKaHRs63cPfmGPfBklsCc8yJVyXPy273mNLyk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNDsTbVE+dEiFbJpw+3tElXCfZHMBObNS/5oxU0uSjGMnwgeMM/5I47NhEc/4WPmB
	 PnE2ghf/jR8nTm2Dhd2kAQ2b2dWvFR/wyB1eCJYRdAgCyC0HUEbNE3bbZmtG/lGOpQ
	 2XRAycjpy4vEjbPShbCiHyksZ605KXgFH187AaO4=
Message-ID: <c9ded35b-fc10-47d8-bfaa-cecb4fa91add@arm.com>
Date: Wed, 1 Apr 2026 13:11:20 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dma-debug: suppress cacheline overlap warning when
 arch has no DMA alignment requirement
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mm@kvack.org, harry@kernel.org,
 vbabka@kernel.org, akpm@linux-foundation.org, stern@rowland.harvard.edu,
 linux@roeck-us.net, andy.shevchenko@gmail.com, hch@lst.de,
 Jeff.kirsher@gmail.com, catalin.marinas@arm.com
References: <CGME20260327124211eucas1p10425a28f67736d2043e7e4dd77d58e72@eucas1p1.samsung.com>
 <20260327124156.24820-1-mikhail.v.gavrilov@gmail.com>
 <6270d4f0-85e4-496d-8db4-87ccb791ca4d@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <6270d4f0-85e4-496d-8db4-87ccb791ca4d@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35782-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[samsung.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,kvack.org,kernel.org,linux-foundation.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de,arm.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 089C337AB9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-30 8:44 am, Marek Szyprowski wrote:
> On 27.03.2026 13:41, Mikhail Gavrilov wrote:
>> When CONFIG_DMA_API_DEBUG is enabled, the DMA debug infrastructure
>> tracks active mappings per cacheline and warns if two different DMA
>> mappings share the same cacheline ("cacheline tracking EEXIST,
>> overlapping mappings aren't supported").
>>
>> On x86_64, ARCH_KMALLOC_MINALIGN defaults to 8, so small kmalloc
>> allocations (e.g. the 8-byte hub->buffer and hub->status in the USB
>> hub driver) frequently land in the same 64-byte cacheline.  When both
>> are DMA-mapped, this triggers a false positive warning.
>>
>> This has been reported repeatedly since v5.14 (when the EEXIST check
>> was added) across various USB host controllers and devices including
>> xhci_hcd with USB hubs, USB audio devices, and USB ethernet adapters.
>>
>> The cacheline overlap is only a real concern on architectures that
>> require DMA buffer alignment to cacheline boundaries (i.e. where
>> ARCH_DMA_MINALIGN >= L1_CACHE_BYTES).  On architectures like x86_64
>> where dma_get_cache_alignment() returns 1, the hardware is
>> cache-coherent and overlapping cacheline mappings are harmless.
>>
>> Suppress the EEXIST warning when dma_get_cache_alignment() is less
>> than L1_CACHE_BYTES, indicating the architecture does not require
>> cacheline-aligned DMA buffers.

Really the value of this check is for mappings of structure members or 
array elements which have no inherent guarantee of being individually 
aligned to ARCH_DMA_MINALIGN, and while x86 can also get away with that, 
it represents a genuine issue for non-coherent architectures. USB's 
mapping of a dedicated tiny allocation is, if anything, rather the 
special case.

TBH I'd be inclined to have CONFIG_DMA_DEBUG raise ARCH_DMA_MINALIGN as 
appropriate such that genuine false-positives can't happen, rather than 
effectively defeat the whole check, but I suppose that might carry a 
risk of tripping up arch code that doesn't expect it... Oh well.

Thanks,
Robin.

>> Verified with a kernel module reproducer that performs two kmalloc(8)
>> allocations back-to-back and DMA-maps both:
>>
>>    Before: allocations share a cacheline, EEXIST fires within ~50 pairs
>>    After:  same cacheline pair found, but no warning emitted
>>
>> Fixes: 2b4bbc6231d7 ("dma-debug: report -EEXIST errors in add_dma_entry")
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215740
>> Suggested-by: Harry Yoo <harry@kernel.org>
>> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> 
> Applied to dma-mapping-fixes. Thanks!
> 
>> ---
>>
>> v1 -> v2:
>>    - Moved fix from include/linux/slab.h (ARCH_KMALLOC_MINALIGN)
>>      to kernel/dma/debug.c per Harry Yoo's suggestion.
>>    - Instead of forcing cacheline-aligned allocations, suppress
>>      the warning when the architecture has no DMA alignment
>>      requirement (dma_get_cache_alignment() < L1_CACHE_BYTES).
>>
>> v1: https://lore.kernel.org/all/20260327055846.248829-1-mikhail.v.gavrilov@gmail.com/
>>
>> Reproducer module that triggers the bug reliably:
>>    https://bugzilla.kernel.org/attachment.cgi?id=309769
>>
>>   kernel/dma/debug.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
>> index 0677918f06a8..1a725edbbbf6 100644
>> --- a/kernel/dma/debug.c
>> +++ b/kernel/dma/debug.c
>> @@ -615,6 +615,7 @@ static void add_dma_entry(struct dma_debug_entry *entry, unsigned long attrs)
>>   	} else if (rc == -EEXIST &&
>>   		   !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
>>   		   !(entry->is_cache_clean && overlap_cache_clean) &&
>> +		   dma_get_cache_alignment() >= L1_CACHE_BYTES &&
>>   		   !(IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) &&
>>   		     is_swiotlb_active(entry->dev))) {
>>   		err_printk(entry->dev, entry,
> 
> Best regards


