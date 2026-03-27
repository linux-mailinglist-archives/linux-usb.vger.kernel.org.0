Return-Path: <linux-usb+bounces-35548-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA0aA/h3xmnwKgUAu9opvQ
	(envelope-from <linux-usb+bounces-35548-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:28:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77558344322
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4E2530B241D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1105738910D;
	Fri, 27 Mar 2026 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q8Uvnk/M"
X-Original-To: linux-usb@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0723737AA91;
	Fri, 27 Mar 2026 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614384; cv=none; b=GDLvZh9zn5YGJFnyLzMFv4C20o3XJXqgMvOBpXUoKrBIAKFkZ622+NZ20kAewqY4jOGyI9snzzQAgsxOWha1IhEN8MaYsImipvdzCQhUfCALWxfKBJl0or40RNerVDCM6acKimoGDqyhwiwhzYmq/lnGoZP9YouFKzpnKeV4UF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614384; c=relaxed/simple;
	bh=3b/hWGfyYHUW6app5fUiIeJn8/Q3oXHdpndPl/twz4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeCHV5gpdOhe12Bnc8G9Sj86FKa76qGoo1KoA0cQQlyynAsChDwBbLQ/AFlkDlMpFrtjDwUhiLZXiNIsyYQhWxMlSbM1pMjSVQ9x/IjVitsQk/KO9v8OJMqCrq0TcOXBM58ZSDMgrD+c6XEJnihmlw+w3rdc8PXc4wwAy/KUNmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q8Uvnk/M; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 773232BC0;
	Fri, 27 Mar 2026 05:26:16 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21A223F641;
	Fri, 27 Mar 2026 05:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774614382; bh=3b/hWGfyYHUW6app5fUiIeJn8/Q3oXHdpndPl/twz4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8Uvnk/MiNqXPUx5lsc6/r4nOTgcGl6iLl/9H20jXWBrMBxpzGv8KQv/uJ3e8M9QQ
	 VavljMayMpegvZLFdL1PgADtsO2tBFFZnYVwUJxKMy767ZRvS+3AQRS0ruN8tPy3qe
	 Sgsf8LReOo2OMWkjyoBMlFChAbMBx6rv1uGrBG4s=
Date: Fri, 27 Mar 2026 12:26:13 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: vbabka@kernel.org, harry.yoo@oracle.com, akpm@linux-foundation.org,
	hao.li@linux.dev, cl@gentwo.org, rientjes@google.com,
	roman.gushchin@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu, linux@roeck-us.net,
	andy.shevchenko@gmail.com, hch@lst.de, Jeff.kirsher@gmail.com,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] mm/slab: align kmalloc to cacheline when DMA API
 debugging is active
Message-ID: <acZ3ZUXhFHpSXzYS@arm.com>
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de,samsung.com,arm.com];
	TAGGED_FROM(0.00)[bounces-35548-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 77558344322
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+ Marek, Robin

On Fri, Mar 27, 2026 at 10:58:46AM +0500, Mikhail Gavrilov wrote:
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

This indeed has come up regularly in the past years.

> +/*
> + * Align memory allocations to cache lines if DMA API debugging is active
> + * to avoid false positive DMA overlapping error messages.
> + */
> +#ifdef CONFIG_DMA_API_DEBUG
> +#ifndef ARCH_KMALLOC_MINALIGN
> +#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
> +#elif ARCH_KMALLOC_MINALIGN < L1_CACHE_BYTES
> +#undef ARCH_KMALLOC_MINALIGN
> +#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
> +#endif
> +#endif

TL;DR: I think this is fine:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

I'm not sure that's the best way to hide the warning but there
are no great solutions either. On one hand, we want the DMA debug to
capture potential problems on architectures it's not running on. OTOH,
we also want to avoid false positives on coherent architectures/devices.
I don't think reconciling the two requirements is easy.

When DMA_API_DEBUG is enabled, the above will change the x86 behaviour
that could have implications beyond DMA (e.g. may not catch some buffer
overflow because it's within L1_CACHE_BYTES). Similarly for non-coherent
architectures that select DMA_BOUNCE_UNALIGNED_KMALLOC (arm64 and riscv
currently). arm64 defines ARCH_DMA_MINALIGN to 128 but
ARCH_KMALLOC_MINALIGN to 8 (why 128 is larger than L1_CACHE_BYTES is
another matter but let's ignore it for now).

More of a thinking out loud, we have:

1. Coherent architectures - alignment doesn't matter

2. Non-coherent architectures with:
   a) Sufficiently large ARCH_KMALLOC_MINALIGN
   b) Small ARCH_KMALLOC_MINALIGN but DMA_BOUNCE_UNALIGNED_KMALLOC
   c) Broken config - forgot to set ARCH_DMA_MINALIGN or bouncing

We can ignore (2.c), the aim of the DMA debug is to catch wrong uses in
drivers. If drivers is the only goal, the above change will do when
running on (1) or (2.a) hardware - it will catch sub-L1_CACHE_BYTES
buffers from drivers while assuming kmalloc() machinery is safe.
However, if running on (2.b) it won't catch anything that may be
problematic on (2.a) since the DMA debug ignores the overlap.

We could make DMA_BOUNCE_UNALIGNED_KMALLOC dependent on !DMA_API_DEBUG
but it would be nice to be able to sanity-check the bouncing logic.
Well, it wasn't checking it before and with commit 03521c892bb8
("dma-debug: don't report false positives with
DMA_BOUNCE_UNALIGNED_KMALLOC"), we made this clear that overlapping will
be ignored.

Irrespective of whether we disable bouncing with DMA_API_DEBUG, maybe we
could replace the above commit with:

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 3928a509c44c..488045ef6245 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -175,7 +175,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 	if (!is_mmio)
 		kmsan_handle_dma(phys, size, dir);
 	trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
-	debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
+	debug_dma_map_phys(dev, dma_to_phys(addr), size, dir, addr, attrs);

 	return addr;
 }

Anyway, this I think is unrelated to the proposed change affecting x86,
more of a how to make the DMA API debugging more useful when running on
arm64 or riscv.

-- 
Catalin

