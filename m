Return-Path: <linux-usb+bounces-35564-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIuCMeOVxmnrMQUAu9opvQ
	(envelope-from <linux-usb+bounces-35564-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 15:36:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4FB3462D9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 15:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 758BC30CA374
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 14:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949883F54CC;
	Fri, 27 Mar 2026 14:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIurt8od"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2149F1B87C0;
	Fri, 27 Mar 2026 14:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621849; cv=none; b=ra8u8/0GPRS0XkJpFvybvQTUXMeIQ34HrF09wa+1y5lal7KL3XlhNzv9lsM/MExjmsy7OkG6NIytCUL/MRdg7KolEaUqmYfpVEJ1/s57URLpOturjQEWwuZ5g9D6Ih8B4dz6Di+Oj462vCQ7fG3GUDlwoN9ifEteEbXBpvBBqp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621849; c=relaxed/simple;
	bh=A3AG32T8PZTrNpV/U9zA1qs90v1zn+nJ4caUsIzeMTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6NQsVc2j/Y72FhJP+LTNppSAmXr6EWiMEgkn7bFSNscEA2a8puDzPhMc+oUbw37cAZEjr4okYeK4J9vDAkxFpP7gJRUZzE1j/8TGuNZEnS9e6ET+fPBLvZLOGi3cTsxEJ02TaWGBHvxj3kpw+fAiVEtX5jVTbkJ+05CuxlM7uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIurt8od; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501EBC19423;
	Fri, 27 Mar 2026 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774621848;
	bh=A3AG32T8PZTrNpV/U9zA1qs90v1zn+nJ4caUsIzeMTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mIurt8odGENyMqk+aru8b/p2hCFuJlzO4y2pzcHa2jAPpDU3vsr+KOBlXNNq3MHIa
	 qFGjoQKkzkMocHAi6e0YyimGd0aGEMtsjRo0mkRH9+DgzEh+j2HhQTgzhkdhT1DOk8
	 RGl5xrQKvHtVvQTMkVCTnbSk81jlCPOk9aqUZd2Q96aLl3vitS2kYigHWfhGaD66cm
	 ZMBBGXmqeQSKcZJnvOjZBzQ1nfFSOE3WR7EVDkZ6qxkjtw914YgDydXvA/n90whQHP
	 PqkKZJEomam6mN3luXKZadiaWhqyuUGYaR3kLwi5cmvXZTGQB6n8RNYy3AelqoRu3F
	 myD4+DsrqUV9w==
Message-ID: <bfa5ff0a-8ef9-46cb-8881-396f71ed5be0@kernel.org>
Date: Fri, 27 Mar 2026 15:30:43 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/slab: align kmalloc to cacheline when DMA API
 debugging is active
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: harry.yoo@oracle.com, akpm@linux-foundation.org, hao.li@linux.dev,
 cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 stern@rowland.harvard.edu, linux@roeck-us.net, andy.shevchenko@gmail.com,
 hch@lst.de, Jeff.kirsher@gmail.com, Robin Murphy <robin.murphy@arm.com>
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
 <CGME20260327122625eucas1p10eabcb31aada4e11b5c2ebcff4cb3c39@eucas1p1.samsung.com>
 <acZ3ZUXhFHpSXzYS@arm.com> <d2ed7315-72ff-43f3-bfaa-995025cb9419@samsung.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <d2ed7315-72ff-43f3-bfaa-995025cb9419@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35564-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[samsung.com,arm.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oracle.com,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 2A4FB3462D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 15:09, Marek Szyprowski wrote:
> Hi
> 
> On 27.03.2026 13:26, Catalin Marinas wrote:
>> + Marek, Robin
> 
> Thanks for adding me to the loop.
> 
>> On Fri, Mar 27, 2026 at 10:58:46AM +0500, Mikhail Gavrilov wrote:
>>> When CONFIG_DMA_API_DEBUG is enabled, the DMA debug infrastructure
>>> tracks active mappings per cacheline and warns if two different DMA
>>> mappings share the same cacheline ("cacheline tracking EEXIST,
>>> overlapping mappings aren't supported").
>>>
>>> On x86_64, ARCH_KMALLOC_MINALIGN defaults to 8, so small kmalloc
>>> allocations (e.g. the 8-byte hub->buffer and hub->status in the USB
>>> hub driver) frequently land in the same 64-byte cacheline.  When both
>>> are DMA-mapped, this triggers a false positive warning.
>>>
>>> This has been reported repeatedly since v5.14 (when the EEXIST check
>>> was added) across various USB host controllers and devices including
>>> xhci_hcd with USB hubs, USB audio devices, and USB ethernet adapters.
>> This indeed has come up regularly in the past years.
>>
>>> +/*
>>> + * Align memory allocations to cache lines if DMA API debugging is active
>>> + * to avoid false positive DMA overlapping error messages.
>>> + */
>>> +#ifdef CONFIG_DMA_API_DEBUG
>>> +#ifndef ARCH_KMALLOC_MINALIGN
>>> +#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
>>> +#elif ARCH_KMALLOC_MINALIGN < L1_CACHE_BYTES
>>> +#undef ARCH_KMALLOC_MINALIGN
>>> +#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
>>> +#endif
>>> +#endif
>> TL;DR: I think this is fine:
>>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>
>> I'm not sure that's the best way to hide the warning but there
>> are no great solutions either. On one hand, we want the DMA debug to
>> capture potential problems on architectures it's not running on. OTOH,
>> we also want to avoid false positives on coherent architectures/devices.
>> I don't think reconciling the two requirements is easy.
>>
>> When DMA_API_DEBUG is enabled, the above will change the x86 behaviour
>> that could have implications beyond DMA (e.g. may not catch some buffer
>> overflow because it's within L1_CACHE_BYTES). Similarly for non-coherent
>> architectures that select DMA_BOUNCE_UNALIGNED_KMALLOC (arm64 and riscv
>> currently). arm64 defines ARCH_DMA_MINALIGN to 128 but
>> ARCH_KMALLOC_MINALIGN to 8 (why 128 is larger than L1_CACHE_BYTES is
>> another matter but let's ignore it for now).
> 
> IMHO enabling DMA_API_DEBUG should not change the kernel behavior, so I 
> would prefer fixing this in DMA-debug code somehow.

So what about Harry's proposal [1]? Mikhail seems to be on board? [2]

It seems it would achieve the goal that enabling DMA_API_DEBUG doesn't
change the kernel behavior? But I don't know this area too well so
maybe there's a catch.

[1] https://lore.kernel.org/all/acYlxRBhSMcwBnja@hyeyoo/
[2] https://lore.kernel.org/all/CABXGCsO_C8%2B%2B4%2BoPfZ%2BbQyrBnEGy5JFpXHkGNpfy%2B8%3D5BvVNfg@mail.gmail.com/

> 
>> More of a thinking out loud, we have:
>>
>> 1. Coherent architectures - alignment doesn't matter
>>
>> 2. Non-coherent architectures with:
>>     a) Sufficiently large ARCH_KMALLOC_MINALIGN
>>     b) Small ARCH_KMALLOC_MINALIGN but DMA_BOUNCE_UNALIGNED_KMALLOC
>>     c) Broken config - forgot to set ARCH_DMA_MINALIGN or bouncing
>>
>> We can ignore (2.c), the aim of the DMA debug is to catch wrong uses in
>> drivers. If drivers is the only goal, the above change will do when
>> running on (1) or (2.a) hardware - it will catch sub-L1_CACHE_BYTES
>> buffers from drivers while assuming kmalloc() machinery is safe.
>> However, if running on (2.b) it won't catch anything that may be
>> problematic on (2.a) since the DMA debug ignores the overlap.
>>
>> We could make DMA_BOUNCE_UNALIGNED_KMALLOC dependent on !DMA_API_DEBUG
>> but it would be nice to be able to sanity-check the bouncing logic.
>> Well, it wasn't checking it before and with commit 03521c892bb8
>> ("dma-debug: don't report false positives with
>> DMA_BOUNCE_UNALIGNED_KMALLOC"), we made this clear that overlapping will
>> be ignored.
>>
>> Irrespective of whether we disable bouncing with DMA_API_DEBUG, maybe we
>> could replace the above commit with:
>>
>> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
>> index 3928a509c44c..488045ef6245 100644
>> --- a/kernel/dma/mapping.c
>> +++ b/kernel/dma/mapping.c
>> @@ -175,7 +175,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
>>   	if (!is_mmio)
>>   		kmsan_handle_dma(phys, size, dir);
>>   	trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
>> -	debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
>> +	debug_dma_map_phys(dev, dma_to_phys(addr), size, dir, addr, attrs);
>>
>>   	return addr;
>>   }
>>
>> Anyway, this I think is unrelated to the proposed change affecting x86,
>> more of a how to make the DMA API debugging more useful when running on
>> arm64 or riscv.
> 
> This is not enough, there is also a dma_map_sg_attrs() path.
> 
> I've reverted 03521c892bb8 and added the following change:
> 
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c index 
> 55e7ca8ceb86..bbada41143ea 100644 --- a/kernel/dma/debug.c +++ 
> b/kernel/dma/debug.c @@ -18,6 +18,7 @@ #include <linux/uaccess.h> 
> #include <linux/export.h> #include <linux/device.h> +#include 
> <linux/dma-direct.h> #include <linux/types.h> #include <linux/sched.h> 
> #include <linux/ctype.h> @@ -1241,7 +1242,8 @@ void 
> debug_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size, 
> entry->dev = dev; entry->type = dma_debug_phy; - entry->paddr = phys; + 
> entry->paddr = IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) ? + 
> dma_to_phys(dev, dma_addr) : phys; entry->dev_addr = dma_addr; 
> entry->size = size; entry->direction = direction; @@ -1335,7 +1337,9 @@ 
> void debug_dma_map_sg(struct device *dev, struct scatterlist *sg, 
> entry->type = dma_debug_sg; entry->dev = dev; - entry->paddr = 
> sg_phys(s); + entry->paddr = + 
> IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) ? + dma_to_phys(dev, 
> sg_dma_address(s)) : sg_phys(s); entry->size = sg_dma_len(s); 
> entry->dev_addr = sg_dma_address(s); entry->direction = direction;
> 
> thenran my tests on ARM64 and RV64 boards. Only one new warning has been 
> reported (I didn't analyze it yet), so this might be indeed a better 
> solution than skipping overlapping cache lines warnings when 
> DMA_BOUNCE_UNALIGNED_KMALLOC is set.
> 
> Best regards


