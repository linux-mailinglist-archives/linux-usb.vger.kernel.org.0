Return-Path: <linux-usb+bounces-35567-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM8bMIKaxmnrMQUAu9opvQ
	(envelope-from <linux-usb+bounces-35567-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 15:56:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9C5346626
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 15:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35682302EFD0
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 14:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7714C3F99F7;
	Fri, 27 Mar 2026 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bnojqI/e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CCD3FA5EB
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774623352; cv=none; b=Cq1EcYit3xEKUsu6DwkmwxyprGa1fLXPiKa37cYc/6wOXwUyWNjzjwEdx5UwsKc8pr5E4+/7KTCAHOnIiWzBA+bQnEVf8rzJ3ULn0sL/uZJLw6H71JkmhDq8VWMtO3cQFPa+y7/+PziJVGNa1QGQ6gf33iKwEf7ZKFD+9VyoHXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774623352; c=relaxed/simple;
	bh=x7xhITfsCynT/1FyganOvh4mc/tbvcHXBz7kyIURvjs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=bYQsklid3z7RRfNp/wZ+320nmo+Bzc4jXTE6TxCdIGzgHyL4Pd8IFolTdA4t60L89b5wdMZaBwBipUHetWHTEBieUf+mQhcoVayCY5dZLBI97ixogcVjZjnBsgwM6tivgdo+S66tM4IilCxGnGdrkDG6e9LlTCzd8n3a0PEMyUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bnojqI/e; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260327145544euoutp01f2b7c11be27e275ad8338b5c9972f495~guoeINkLJ0437504375euoutp01E
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 14:55:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260327145544euoutp01f2b7c11be27e275ad8338b5c9972f495~guoeINkLJ0437504375euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774623344;
	bh=REUXe8UYNGwRNwOSyc6qufXzTOCwF72bk0Eo6/3HEGg=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=bnojqI/epEcuYRMSJKdrOewMzsAS5gYfTSJMyQ1OcYuVh307Kt4WAIJMCGhAImqNf
	 9p2XMXpUpPL2PjUBO+/6m7Z/mP5L2K5Munla/d0RozFaufulx1xdLKXIbwzSwLcrp9
	 /mrRbQDD84OjTjj5u3kdV0CRDd0tt8YcAsqqn1no=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260327145543eucas1p1ff8162bebd6e11976bf7be95ab3a2658~guodnd7MR2635526355eucas1p13;
	Fri, 27 Mar 2026 14:55:43 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260327145541eusmtip1ce5407db7b38952ac949b9394b6c8bdd~guobpmBSi0746707467eusmtip1G;
	Fri, 27 Mar 2026 14:55:41 +0000 (GMT)
Message-ID: <336a20f9-408e-49d1-9d56-60315bd01881@samsung.com>
Date: Fri, 27 Mar 2026 15:55:41 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] mm/slab: align kmalloc to cacheline when DMA API
 debugging is active
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Mikhail Gavrilov
	<mikhail.v.gavrilov@gmail.com>
Cc: vbabka@kernel.org, harry.yoo@oracle.com, akpm@linux-foundation.org,
	hao.li@linux.dev, cl@gentwo.org, rientjes@google.com,
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, linux@roeck-us.net,
	andy.shevchenko@gmail.com, hch@lst.de, Jeff.kirsher@gmail.com, Robin Murphy
	<robin.murphy@arm.com>
Content-Language: en-US
In-Reply-To: <d2ed7315-72ff-43f3-bfaa-995025cb9419@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260327145543eucas1p1ff8162bebd6e11976bf7be95ab3a2658
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260327122625eucas1p10eabcb31aada4e11b5c2ebcff4cb3c39
X-EPHeader: CA
X-CMS-RootMailID: 20260327122625eucas1p10eabcb31aada4e11b5c2ebcff4cb3c39
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
	<CGME20260327122625eucas1p10eabcb31aada4e11b5c2ebcff4cb3c39@eucas1p1.samsung.com>
	<acZ3ZUXhFHpSXzYS@arm.com>
	<d2ed7315-72ff-43f3-bfaa-995025cb9419@samsung.com>
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35567-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de,arm.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	NEURAL_HAM(-0.00)[-0.865];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D9C5346626
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 15:09, Marek Szyprowski wrote:
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
>>> hub driver) frequently land in the same 64-byte cacheline.  When both
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
>>> +#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
>>> +#elif ARCH_KMALLOC_MINALIGN < L1_CACHE_BYTES
>>> +#undef ARCH_KMALLOC_MINALIGN
>>> +#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
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
> IMHO enabling DMA_API_DEBUG should not change the kernel behavior, so I would prefer fixing this in DMA-debug code somehow.
>
>> More of a thinking out loud, we have:
>>
>> 1. Coherent architectures - alignment doesn't matter
>>
>> 2. Non-coherent architectures with:
>>     a) Sufficiently large ARCH_KMALLOC_MINALIGN
>>     b) Small ARCH_KMALLOC_MINALIGN but DMA_BOUNCE_UNALIGNED_KMALLOC
>>     c) Broken config - forgot to set ARCH_DMA_MINALIGN or bouncing
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
>>       if (!is_mmio)
>>           kmsan_handle_dma(phys, size, dir);
>>       trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
>> -    debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
>> +    debug_dma_map_phys(dev, dma_to_phys(addr), size, dir, addr, attrs);
>>
>>       return addr;
>>   }
>>
>> Anyway, this I think is unrelated to the proposed change affecting x86,
>> more of a how to make the DMA API debugging more useful when running on
>> arm64 or riscv.
>
> This is not enough, there is also a dma_map_sg_attrs() path.
>
> I've reverted 03521c892bb8 and added the following change:
>
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c index 55e7ca8ceb86..bbada41143ea 100644 --- a/kernel/dma/debug.c +++ b/kernel/dma/debug.c @@ -18,6 +18,7 @@ #include <linux/uaccess.h> #include <linux/export.h> #include <linux/device.h> +#include <linux/dma-direct.h> #include <linux/types.h> #include <linux/sched.h> #include <linux/ctype.h> @@ -1241,7 +1242,8 @@ void debug_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size, entry->dev = dev; entry->type = dma_debug_phy; - entry->paddr = phys; + entry->paddr = IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) ? + dma_to_phys(dev, dma_addr) : phys; entry->dev_addr = dma_addr; entry->size = size; entry->direction = direction; @@ -1335,7 +1337,9 @@ void debug_dma_map_sg(struct device *dev, struct scatterlist *sg, entry->type = dma_debug_sg; entry->dev = dev; - entry->paddr = sg_phys(s); + entry->paddr = + IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) ? + dma_to_phys(dev, sg_dma_address(s)) : sg_phys(s);
> entry->size = sg_dma_len(s); entry->dev_addr = sg_dma_address(s); entry->direction = direction;
>
> thenran my tests on ARM64 and RV64 boards. Only one new warning has been reported (I didn't analyze it yet), so this might be indeed a better solution than skipping overlapping cache lines warnings when DMA_BOUNCE_UNALIGNED_KMALLOC is set.
>
Huh, the diff has been malformed by my mail client. Let's try again:

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 55e7ca8ceb86..bbada41143ea 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -18,6 +18,7 @@
 #include <linux/uaccess.h>
 #include <linux/export.h>
 #include <linux/device.h>
+#include <linux/dma-direct.h>
 #include <linux/types.h>
 #include <linux/sched.h>
 #include <linux/ctype.h>
@@ -1241,7 +1242,8 @@ void debug_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,

        entry->dev       = dev;
        entry->type      = dma_debug_phy;
-       entry->paddr     = phys;
+       entry->paddr     = IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) ?
+                          dma_to_phys(dev, dma_addr) : phys;
        entry->dev_addr  = dma_addr;
        entry->size      = size;
        entry->direction = direction;
@@ -1335,7 +1337,9 @@ void debug_dma_map_sg(struct device *dev, struct scatterlist *sg,

                entry->type           = dma_debug_sg;
                entry->dev            = dev;
-               entry->paddr          = sg_phys(s);
+               entry->paddr          =
+                       IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) ?
+                       dma_to_phys(dev, sg_dma_address(s)) : sg_phys(s);
                entry->size           = sg_dma_len(s);
                entry->dev_addr       = sg_dma_address(s);
                entry->direction      = direction;


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


