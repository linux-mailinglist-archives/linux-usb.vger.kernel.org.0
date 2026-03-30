Return-Path: <linux-usb+bounces-35642-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJv4HZEsymkA6AUAu9opvQ
	(envelope-from <linux-usb+bounces-35642-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:56:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE9C356BF2
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B63163094248
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 07:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE363A9014;
	Mon, 30 Mar 2026 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YJrGmy8G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1C633D4E9
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857037; cv=none; b=QaeegfD0NzO21CYZ6Ix9eU4F6D0AlI6+rLpl5jppEvaWa5mUrHMWElKpFpQZFVZ169vkHg93qQ+wiS0MMODSp0UOfEWpJVfDAPrS+XBWyIuX778GZJqYPcSRakOGFkY9Wm4MFb85IEiUdI9a+Hbg2ZPJR42yVC6Q8E7W3dM2mfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857037; c=relaxed/simple;
	bh=W+Xq3uqQfC7cWNV6p0E+iHO/A0FKPjAynrOVyWdSkLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ZC76z55dcycoBLCfeH09JARsWb3SVE0Ic3CeqNiiMxdNxzebFR1oH7XZwYFStBqmy7xBbtHHNEZnfRRGONvLLYMaJqz04+u83vnh9MRj2Al4DgnjVtJfDVKicek+iaPFQuBgTmJ7Fk+C6+p0h6y2x80SbnTRa4MpEpA4qJYKwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YJrGmy8G; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260330074420euoutp026b4013c5868f514edbcb40be6dafeb01~hjrqW96DX2726227262euoutp02Z
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 07:44:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260330074420euoutp026b4013c5868f514edbcb40be6dafeb01~hjrqW96DX2726227262euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774856660;
	bh=9QPMkW/TQgAobnAcPDNit13NRu4FKkyV5RCLsq0khvk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YJrGmy8GvOM3mmyK9kws4zdWGH1dA1A5Md3L+uoa7kf5NvPELnf3Rt57mYaxlDG6t
	 2ozhEK1FoWFGq1mvVoca4CpOlr/ImI6n+8NjrlUk96uadGEUy3tWeR/tKpv7Ran/pu
	 T8if3cS6Q8XI76uQgyu+XJnrqBi9AtDPw/6mAUHY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260330074419eucas1p1cb351a1eec598b99842de25cb754e135~hjrqEFclI3155331553eucas1p1k;
	Mon, 30 Mar 2026 07:44:19 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260330074418eusmtip14412bd6a1082ddac8ec5e8950d587f4f~hjrpFeoW32902829028eusmtip1T;
	Mon, 30 Mar 2026 07:44:18 +0000 (GMT)
Message-ID: <6270d4f0-85e4-496d-8db4-87ccb791ca4d@samsung.com>
Date: Mon, 30 Mar 2026 09:44:18 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] dma-debug: suppress cacheline overlap warning when
 arch has no DMA alignment requirement
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, robin.murphy@arm.com
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-mm@kvack.org, harry@kernel.org,
	vbabka@kernel.org, akpm@linux-foundation.org, stern@rowland.harvard.edu,
	linux@roeck-us.net, andy.shevchenko@gmail.com, hch@lst.de,
	Jeff.kirsher@gmail.com, catalin.marinas@arm.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260327124156.24820-1-mikhail.v.gavrilov@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260330074419eucas1p1cb351a1eec598b99842de25cb754e135
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260327124211eucas1p10425a28f67736d2043e7e4dd77d58e72
X-EPHeader: CA
X-CMS-RootMailID: 20260327124211eucas1p10425a28f67736d2043e7e4dd77d58e72
References: <CGME20260327124211eucas1p10425a28f67736d2043e7e4dd77d58e72@eucas1p1.samsung.com>
	<20260327124156.24820-1-mikhail.v.gavrilov@gmail.com>
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35642-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,kvack.org,kernel.org,linux-foundation.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de,arm.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,arm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	NEURAL_HAM(-0.00)[-0.667];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,samsung.com:dkim,samsung.com:mid]
X-Rspamd-Queue-Id: DEE9C356BF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 13:41, Mikhail Gavrilov wrote:
> When CONFIG_DMA_API_DEBUG is enabled, the DMA debug infrastructure
> tracks active mappings per cacheline and warns if two different DMA
> mappings share the same cacheline ("cacheline tracking EEXIST,
> overlapping mappings aren't supported").
>
> On x86_64, ARCH_KMALLOC_MINALIGN defaults to 8, so small kmalloc
> allocations (e.g. the 8-byte hub->buffer and hub->status in the USB
> hub driver) frequently land in the same 64-byte cacheline.  When both
> are DMA-mapped, this triggers a false positive warning.
>
> This has been reported repeatedly since v5.14 (when the EEXIST check
> was added) across various USB host controllers and devices including
> xhci_hcd with USB hubs, USB audio devices, and USB ethernet adapters.
>
> The cacheline overlap is only a real concern on architectures that
> require DMA buffer alignment to cacheline boundaries (i.e. where
> ARCH_DMA_MINALIGN >= L1_CACHE_BYTES).  On architectures like x86_64
> where dma_get_cache_alignment() returns 1, the hardware is
> cache-coherent and overlapping cacheline mappings are harmless.
>
> Suppress the EEXIST warning when dma_get_cache_alignment() is less
> than L1_CACHE_BYTES, indicating the architecture does not require
> cacheline-aligned DMA buffers.
>
> Verified with a kernel module reproducer that performs two kmalloc(8)
> allocations back-to-back and DMA-maps both:
>
>   Before: allocations share a cacheline, EEXIST fires within ~50 pairs
>   After:  same cacheline pair found, but no warning emitted
>
> Fixes: 2b4bbc6231d7 ("dma-debug: report -EEXIST errors in add_dma_entry")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215740
> Suggested-by: Harry Yoo <harry@kernel.org>
> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

Applied to dma-mapping-fixes. Thanks!

> ---
>
> v1 -> v2:
>   - Moved fix from include/linux/slab.h (ARCH_KMALLOC_MINALIGN)
>     to kernel/dma/debug.c per Harry Yoo's suggestion.
>   - Instead of forcing cacheline-aligned allocations, suppress
>     the warning when the architecture has no DMA alignment
>     requirement (dma_get_cache_alignment() < L1_CACHE_BYTES).
>
> v1: https://lore.kernel.org/all/20260327055846.248829-1-mikhail.v.gavrilov@gmail.com/
>
> Reproducer module that triggers the bug reliably:
>   https://bugzilla.kernel.org/attachment.cgi?id=309769
>
>  kernel/dma/debug.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> index 0677918f06a8..1a725edbbbf6 100644
> --- a/kernel/dma/debug.c
> +++ b/kernel/dma/debug.c
> @@ -615,6 +615,7 @@ static void add_dma_entry(struct dma_debug_entry *entry, unsigned long attrs)
>  	} else if (rc == -EEXIST &&
>  		   !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
>  		   !(entry->is_cache_clean && overlap_cache_clean) &&
> +		   dma_get_cache_alignment() >= L1_CACHE_BYTES &&
>  		   !(IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) &&
>  		     is_swiotlb_active(entry->dev))) {
>  		err_printk(entry->dev, entry,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


