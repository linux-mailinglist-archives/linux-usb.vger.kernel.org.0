Return-Path: <linux-usb+bounces-35858-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Uww+H8lVzmnrmwYAu9opvQ
	(envelope-from <linux-usb+bounces-35858-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 13:40:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585938873C
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 13:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 895D0308D3F2
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 11:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63D13C345D;
	Thu,  2 Apr 2026 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IwJ+ViV3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBBF364949
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775129223; cv=none; b=FZxLK6qO5y4WjcEXmZ1jzFVtKGs0BqpThi3xY9oEpHG4Ye8MMciFrwhvdyEY3wjzwfsx2zSCMMpRADSUVxyM+8ZCCfgjgP+/e14FIalIfCn1GuWzuawbu7ddcFTLpjM3wnLrMtEYS1FVcAtAzu7Nb2LIE4SijrqeJ3HD4MC/flI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775129223; c=relaxed/simple;
	bh=5olAb5QXerM6p+khOaKaPB6OLy1SzrqXK1h9oVMNBis=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:In-Reply-To:
	 Content-Type:References; b=SQTBBmkXZOtp7EbWvrNAx9rnanJr1h63bFhEavMsW3abUFNlUqpxKj2iPPwcpmljnOKhQHmdBqPX9Xu0dc06+pyKW2hbI9wCArSMDNQE0i3c8Y9/hotG8iTn8yz4QDgK14HCmyyGk0wrLGAE9cUFtKwSnrAI1yHX1X84bTSmQS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IwJ+ViV3; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260402112649euoutp01a64b0fa070cae7f9a8a6ac03a768eb24~ihpxRCyFl2155621556euoutp01P
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 11:26:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260402112649euoutp01a64b0fa070cae7f9a8a6ac03a768eb24~ihpxRCyFl2155621556euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1775129209;
	bh=Hy/twRPYhbiir+MS1ZezR/NKFm6OHeTxxqJZFQB9PJY=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
	b=IwJ+ViV3fVn8ffILzN1+oSKTdtPlqtT21PrIkH5/BQMaj/8kI/qfGXWbxMYJDctiz
	 i+YraefNVbY5fJzfoHlOr9B8zKq8rn1DA2V//EveiyX9g3bzwvUb4VC52OoJNuQdrq
	 82Tb77fuTcDwpqFGKil3reo97r1qMVk14qCuPFk8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260402112648eucas1p2d6d3dffafe14d15bb776935b734d3e19~ihpwrX8Mr0663806638eucas1p2s;
	Thu,  2 Apr 2026 11:26:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260402112647eusmtip247f6a1ea586e1f285f816be2bae2700a~ihpvrdsMm3271332713eusmtip2X;
	Thu,  2 Apr 2026 11:26:47 +0000 (GMT)
Message-ID: <73ef4f64-498e-45a3-bea0-2a5f11e71b28@samsung.com>
Date: Thu, 2 Apr 2026 13:26:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] dma-debug: suppress cacheline overlap warning when
 arch has no DMA alignment requirement
To: Robin Murphy <robin.murphy@arm.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-mm@kvack.org,
	harry@kernel.org, vbabka@kernel.org, akpm@linux-foundation.org,
	stern@rowland.harvard.edu, linux@roeck-us.net, hch@lst.de,
	Jeff.kirsher@gmail.com, catalin.marinas@arm.com
Content-Language: en-US
In-Reply-To: <75f65aa7-4f89-4ef8-8941-51b1d54d1ad3@arm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260402112648eucas1p2d6d3dffafe14d15bb776935b734d3e19
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260327124211eucas1p10425a28f67736d2043e7e4dd77d58e72
X-EPHeader: CA
X-CMS-RootMailID: 20260327124211eucas1p10425a28f67736d2043e7e4dd77d58e72
References: <CGME20260327124211eucas1p10425a28f67736d2043e7e4dd77d58e72@eucas1p1.samsung.com>
	<20260327124156.24820-1-mikhail.v.gavrilov@gmail.com>
	<6270d4f0-85e4-496d-8db4-87ccb791ca4d@samsung.com>
	<c9ded35b-fc10-47d8-bfaa-cecb4fa91add@arm.com>
	<CAHp75VdrGk=foAzQBJNRNDZ1yfFY8p-tC_ApM8_gN4EehpmN_Q@mail.gmail.com>
	<75f65aa7-4f89-4ef8-8941-51b1d54d1ad3@arm.com>
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35858-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,vger.kernel.org,kvack.org,kernel.org,linux-foundation.org,rowland.harvard.edu,roeck-us.net,lst.de,arm.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	NEURAL_HAM(-0.00)[-0.269];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,samsung.com:dkim,samsung.com:mid]
X-Rspamd-Queue-Id: 8585938873C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 17:26, Robin Murphy wrote:
> On 2026-04-01 2:25 pm, Andy Shevchenko wrote:
>> On Wed, Apr 1, 2026 at 3:11 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>> On 2026-03-30 8:44 am, Marek Szyprowski wrote:
>>>> On 27.03.2026 13:41, Mikhail Gavrilov wrote:
>>
>> ...
>>
>>> TBH I'd be inclined to have CONFIG_DMA_DEBUG raise ARCH_DMA_MINALIGN as
>>> appropriate such that genuine false-positives can't happen, rather than
>>> effectively defeat the whole check,
>>
>> I dunno if you read v1 thread, where I proposed to unroll the check
>> and use pr_debug_once() for the cases which we expect not to panic,
>> but would be good to have a track of.
>
> I had not seen v1, as I took the last 3 days off and hadn't got that far up my inbox yet - I guess it's at least reassuring to have reached similar conclusions independently :)
>
> The fundamental issue here is that dma-debug doesn't realistically have a way to know whether the thing being mapped is intentionally a whole dedicated kmalloc allocation - where we can trust SLUB (and DMA_BOUNCE_UNALIGNED_KMALLOC if appropriate) to do the right thing across different systems - or just something which might happen to line up by coincidence on someone's development machine, but for portability they definitely do still need to take explicit care about (e.g. struct devres::data).


Right, the debug code cannot distinguish them. I'm still convinced that increasing
ARCH_DMA_MINALIGN when DEBUG is enabled is not a good idea. I also agree that the
current exceptions for DMA_BOUNCE_UNALIGNED_KMALLOC and dma_get_cache_alignment() <
L1_CACHE_BYTES are wider than really needed. What we can do about it?

For the (dma_get_cache_alignment() < L1_CACHE_BYTES) case I came up with the idea
of reducing the check only to the dma_get_cache_alignment()-size overlapping:


diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 86f87e43438c..9bf4b5c368f9 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -418,13 +418,13 @@ static void hash_bucket_del(struct dma_debug_entry *entry)
 static RADIX_TREE(dma_active_cacheline, GFP_ATOMIC | __GFP_NOWARN);
 static DEFINE_SPINLOCK(radix_lock);
 #define ACTIVE_CACHELINE_MAX_OVERLAP ((1 << RADIX_TREE_MAX_TAGS) - 1)
-#define CACHELINE_PER_PAGE_SHIFT (PAGE_SHIFT - L1_CACHE_SHIFT)
-#define CACHELINES_PER_PAGE (1 << CACHELINE_PER_PAGE_SHIFT)

 static phys_addr_t to_cacheline_number(struct dma_debug_entry *entry)
 {
-       return ((entry->paddr >> PAGE_SHIFT) << CACHELINE_PER_PAGE_SHIFT) +
-               (offset_in_page(entry->paddr) >> L1_CACHE_SHIFT);
+       if (dma_get_cache_alignment() >= L1_CACHE_BYTES)
+               return entry->paddr >> L1_CACHE_SHIFT;
+       else
+               return entry->paddr >> ilog2(dma_get_cache_alignment());
 }

 static int active_cacheline_read_overlap(phys_addr_t cln)


For the remaining cases (DMA_BOUNCE_UNALIGNED_KMALLOC mainly), based on the Catalin's
suggestion, I came up with the following idea:

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 0677918f06a8..f9b6a989ac15 100644
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
@@ -590,6 +591,14 @@ static int dump_show(struct seq_file *seq, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(dump);

+static inline void dma_debug_fixup_bounced(struct dma_debug_entry *entry)
+{
+       if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) &&
+           dma_kmalloc_needs_bounce(entry->dev, entry->size, entry->direction) &&
+           is_swiotlb_active(entry->dev))
+               entry->paddr = dma_to_phys(entry->dev, entry->dev_addr);
+}
+
 /*
  * Wrapper function for adding an entry to the hash.
  * This function takes care of locking itself.
@@ -601,6 +610,8 @@ static void add_dma_entry(struct dma_debug_entry *entry, unsigned long attrs)
        unsigned long flags;
        int rc;

+       dma_debug_fixup_bounced(entry);
+
        entry->is_cache_clean = attrs & (DMA_ATTR_DEBUGGING_IGNORE_CACHELINES |
                                         DMA_ATTR_REQUIRE_COHERENT);

@@ -614,9 +625,7 @@ static void add_dma_entry(struct dma_debug_entry *entry, unsigned long attrs)
                global_disable = true;
        } else if (rc == -EEXIST &&
                   !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
-                  !(entry->is_cache_clean && overlap_cache_clean) &&
-                  !(IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) &&
-                    is_swiotlb_active(entry->dev))) {
+                  !(entry->is_cache_clean && overlap_cache_clean)) {
                err_printk(entry->dev, entry,
                        "cacheline tracking EEXIST, overlapping mappings aren't supported\n");
        }
@@ -981,6 +990,8 @@ static void check_unmap(struct dma_debug_entry *ref)
        struct hash_bucket *bucket;
        unsigned long flags;

+       dma_debug_fixup_bounced(ref);
+
        bucket = get_hash_bucket(ref, &flags);
        entry = bucket_find_exact(bucket, ref);


What do You think about it? Both at least allows to detect errors like multiple,
incompatible mappings of the same memory.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


