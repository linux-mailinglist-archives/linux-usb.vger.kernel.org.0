Return-Path: <linux-usb+bounces-35560-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE3qBFh8xmnwKgUAu9opvQ
	(envelope-from <linux-usb+bounces-35560-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:47:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA5134486D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA61B30524FD
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9085B34DCEC;
	Fri, 27 Mar 2026 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9vKBgE0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5D586323
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615329; cv=none; b=rpeGs+4xPkYEy8b7l9aOXuHQbmOltS2YZjj8Pk35AGzh2qynwBTOS/bIaexlpmROustT0Ylk/Ys3c6U6paqFqTlc2qejclYtd6Any8dajV516YKPbe1CbB0raOSy01QRWcVVOxq2I0B2Qnw1UwWdKi5N7gmDdAw+D5HISAsKi4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615329; c=relaxed/simple;
	bh=B3tp398WNbwm1ae+gWHLUuGz3BxoORfZ1NVIHaytnAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btxP/7SnxYW6Ap4ZrnmVRxguvBjavz1uAvuDyzzppopcEdukKD/DTEGgLmPrWPvcRx2BhVPAbyXoVU0BjNXlvxaPP8IERmDekK4nvZX7A5+fweGjI9JqlfFfQSrQJzzUynKL0U8R/9AWSz2jID3MzI8ZR+X0ORA4BQ541QDKoi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9vKBgE0; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so2465499e87.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774615326; x=1775220126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnEhmrhTPA7Nd81/VP3XZfiniWMenGZwrrUyIBlvmYM=;
        b=C9vKBgE0xtvL8Jt4R7jq/jNUIy0sbgkauEQs/mBNZzAfUmhgyPSUM5Ow4bPERhwdaK
         ++ZA7ixGVWMJcW8PLQI4h0csbGtM3H5Ee9FlG6MzpX5+WLHy7zgCCKFJglqdPS0zg97o
         85TNJHLNsc+0udA/iPRUcMP6jum219wgf6HQImW1f6Lgv1oIVDfjxUcbK6xcjeBYa4PI
         NauzZ+vyzdH2DhWqZAb/pQHqHZnNx2gwQtmzdJDax0IA3Q92OqCAUyzo5c04YmpO/KQ6
         DkRLkBcft98X8VfxPN+DNfGGL+Q0S9Jg+p/5gv4vrKKlLxDxpoGtBYmBAosYaea9ywfA
         OBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615326; x=1775220126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnEhmrhTPA7Nd81/VP3XZfiniWMenGZwrrUyIBlvmYM=;
        b=hgjD3mz9iUWrKEMlvGhkij9GtMARLS0hDDFK+vecqDIsY3Q08f/Lgof8eYT3WVcsPX
         Mt3CBL29A3baWaYLDuwwq2Sk5b2FF/1NIC/Fxn5DPw+3n5FMPth/3TXK4DLMu4O3BCr1
         6xm6UxtIq7WWJw5xi7sOao8A2dmQzFnnug3OSG81LmIFw7RRteqjmxZur067LB40uUgi
         kcZjTWoFF0eJWWL3zlUpdbkpPW8TwdTw7mZJh6/JJnOAiRjLmAQVP6fnO+Qp8kBJ69DT
         ge3qiPAsfxrlBvB0vxieAY4wSmJzrqndO4P5Pe0uy9tXg9UwfJxnz28Z4fvk+nEDiFwR
         1bZg==
X-Forwarded-Encrypted: i=1; AJvYcCVUzEoz4Th6nfOpNjPb0bm3TT7zLvB5X27rnl8ly5sWT99TitfIWrFOFtYjKYhZKt/aFm1YzKTej1M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmn/9Alxl2SanrY5o03o2A+pg8LskTBRHOxFnAIOr6cF6J9ixD
	RmhKGtwCQB1HTY+Blthvy8QhT2P3rLGDNv+bAuy/AqeN85jAFy5KoMnu
X-Gm-Gg: ATEYQzz9yBHbOA+BozJ8A5RpIXCHCo1jcckYRFE8JJd2mFcXb1GDDlT1FWJ0opOYdS/
	Umg2KOub09sNA6UOpz+5gum3jZh4iCYG7nOC3vZmC0Of+aPNqOO6fBw10qbPvTmRPOQmVvF479U
	4lOcU7hPde8Jh2PSmbHSEAnrYnW5z/uvpg9VD/dAsxUEjQjCPdf72tgHKCTxyRlzao5nAAvTYeI
	ZOEGK0uF1nA5/bDfi3Hc6kX9cCnstQjyUZF1g/FxAp/3/oLcLftZytWG4cuuFEwZkNTkFNsaBPq
	3iNP+Xgt0QzgsbV75/MusD2ynmq/d6dNZPlmzx11Bf0mDhc9dngKDXYSpit/u92kZIilhlptnhk
	cNLdNkuFgAFpk2Cg8iRgNmhLlCD5N/dX471UAWOMEPO9GL93kBC93cZNQOv+EFnHl5B2fTbtQ1e
	ENqlByiuv6Hw+k/UGwFJSz3Qox1Oc1A59l+A==
X-Received: by 2002:a05:6512:6c8:b0:5a2:5b88:a8a3 with SMTP id 2adb3069b0e04-5a2ab92854fmr1015552e87.31.1774615325628;
        Fri, 27 Mar 2026 05:42:05 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a063efbasm1336127e87.14.2026.03.27.05.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:42:04 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-mm@kvack.org,
	harry@kernel.org,
	vbabka@kernel.org,
	akpm@linux-foundation.org,
	stern@rowland.harvard.edu,
	linux@roeck-us.net,
	andy.shevchenko@gmail.com,
	hch@lst.de,
	Jeff.kirsher@gmail.com,
	catalin.marinas@arm.com,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v2] dma-debug: suppress cacheline overlap warning when arch has no DMA alignment requirement
Date: Fri, 27 Mar 2026 17:41:56 +0500
Message-ID: <20260327124156.24820-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35560-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,kvack.org,kernel.org,linux-foundation.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de,arm.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DA5134486D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When CONFIG_DMA_API_DEBUG is enabled, the DMA debug infrastructure
tracks active mappings per cacheline and warns if two different DMA
mappings share the same cacheline ("cacheline tracking EEXIST,
overlapping mappings aren't supported").

On x86_64, ARCH_KMALLOC_MINALIGN defaults to 8, so small kmalloc
allocations (e.g. the 8-byte hub->buffer and hub->status in the USB
hub driver) frequently land in the same 64-byte cacheline.  When both
are DMA-mapped, this triggers a false positive warning.

This has been reported repeatedly since v5.14 (when the EEXIST check
was added) across various USB host controllers and devices including
xhci_hcd with USB hubs, USB audio devices, and USB ethernet adapters.

The cacheline overlap is only a real concern on architectures that
require DMA buffer alignment to cacheline boundaries (i.e. where
ARCH_DMA_MINALIGN >= L1_CACHE_BYTES).  On architectures like x86_64
where dma_get_cache_alignment() returns 1, the hardware is
cache-coherent and overlapping cacheline mappings are harmless.

Suppress the EEXIST warning when dma_get_cache_alignment() is less
than L1_CACHE_BYTES, indicating the architecture does not require
cacheline-aligned DMA buffers.

Verified with a kernel module reproducer that performs two kmalloc(8)
allocations back-to-back and DMA-maps both:

  Before: allocations share a cacheline, EEXIST fires within ~50 pairs
  After:  same cacheline pair found, but no warning emitted

Fixes: 2b4bbc6231d7 ("dma-debug: report -EEXIST errors in add_dma_entry")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=215740
Suggested-by: Harry Yoo <harry@kernel.org>
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

v1 -> v2:
  - Moved fix from include/linux/slab.h (ARCH_KMALLOC_MINALIGN)
    to kernel/dma/debug.c per Harry Yoo's suggestion.
  - Instead of forcing cacheline-aligned allocations, suppress
    the warning when the architecture has no DMA alignment
    requirement (dma_get_cache_alignment() < L1_CACHE_BYTES).

v1: https://lore.kernel.org/all/20260327055846.248829-1-mikhail.v.gavrilov@gmail.com/

Reproducer module that triggers the bug reliably:
  https://bugzilla.kernel.org/attachment.cgi?id=309769

 kernel/dma/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 0677918f06a8..1a725edbbbf6 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -615,6 +615,7 @@ static void add_dma_entry(struct dma_debug_entry *entry, unsigned long attrs)
 	} else if (rc == -EEXIST &&
 		   !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 		   !(entry->is_cache_clean && overlap_cache_clean) &&
+		   dma_get_cache_alignment() >= L1_CACHE_BYTES &&
 		   !(IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) &&
 		     is_swiotlb_active(entry->dev))) {
 		err_printk(entry->dev, entry,
-- 
2.53.0


