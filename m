Return-Path: <linux-usb+bounces-9900-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B818B5AB7
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99CFB1F211C9
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9BD7867D;
	Mon, 29 Apr 2024 14:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsh2S9M5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305137580B
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399270; cv=none; b=IAsCgg/gBbvOwAw5o0e+hfMeB7Dpp7KmzoUY5zJCU0CKahIi4LFa9R4mQjJzRNezbAxp7l8EdZQzAnAYoIjzFQgzPZ48aO/mn371k5naU5h9FQX4wkw/YapbCKVySaHkNuGxq+5r4Y+mocAuJflAEZqDqbmU/8uqhVRSRxajVEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399270; c=relaxed/simple;
	bh=l1F38xgqcSgczXjmSKwDFuOllZLOa+rHxLYHeJOrwVY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s4GHEcW5qtWDCJiUMiEPSDRn5NgHXTBRv3+vs80Aq/1q+j9PGiRpAJEomeBM4Fnmxw+4733gXC/wYwOjty/TJP9nprGfCa9+hdBZz0q3ACjoLbAL0kiC7Yj16t/7c6PoQherHEEs3eNlB9gCkSe2TX1P1QAdn88RbLjwidjwdQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsh2S9M5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399269; x=1745935269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l1F38xgqcSgczXjmSKwDFuOllZLOa+rHxLYHeJOrwVY=;
  b=lsh2S9M5s1ON/KjdwjoNA14g2MLSuoAhTUBjB9AjGd8Z0UxEbXJxKT/U
   IF4tGIX08SFI/1ugqEQ0jCLu1gkCiu0VwswX47M5yL++rsQTZiwEt9cyc
   GyZzd6cdITK4/TZ9GUwG0iDfoA6FulOZUy5meIfnms0FaQr692jUN8+mf
   YA1HN0/VPo27kIUJgOiGDzj1Xm2yhG0hxxOMZyTxe4RTNEAjhJnPVm0Vb
   P0N1gRjzsgoNccXs7jR+6IRv+M+UcVMv4RMFWNfAlhhV6uwoUtM8u6nAs
   GJUUPvIjqmDsm/DAlgfeAGydpjC7TviEiM5cFQgRqW9mDdFV4rWTdOQF2
   w==;
X-CSE-ConnectionGUID: OmUDmKD1RwGgN91QHbqVsQ==
X-CSE-MsgGUID: oYdk1l5ST7K7c2z60BIefQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911438"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911438"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:08 -0700
X-CSE-ConnectionGUID: XdglHEObT5WMH9AOvgzNRw==
X-CSE-MsgGUID: Hdiob1waQtqVTkN6LFs1uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521782"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:06 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/18] usb: xhci: use array_size() when allocating and freeing memory
Date: Mon, 29 Apr 2024 17:02:34 +0300
Message-Id: <20240429140245.3955523-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Replace size_mul() with array_size() in memory allocation and freeing
processes, it fits better semantically.

Macro array_size() is identical to size_mult(), which clamps the max size,
so it's imperative that array_size() is used when freeing said memory.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 1a16b44506da..3100219d6496 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -536,7 +536,7 @@ static void xhci_free_stream_ctx(struct xhci_hcd *xhci,
 		struct xhci_stream_ctx *stream_ctx, dma_addr_t dma)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
-	size_t size = sizeof(struct xhci_stream_ctx) * num_stream_ctxs;
+	size_t size = array_size(sizeof(struct xhci_stream_ctx), num_stream_ctxs);
 
 	if (size > MEDIUM_STREAM_ARRAY_SIZE)
 		dma_free_coherent(dev, size, stream_ctx, dma);
@@ -561,7 +561,7 @@ static struct xhci_stream_ctx *xhci_alloc_stream_ctx(struct xhci_hcd *xhci,
 		gfp_t mem_flags)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
-	size_t size = size_mul(sizeof(struct xhci_stream_ctx), num_stream_ctxs);
+	size_t size = array_size(sizeof(struct xhci_stream_ctx), num_stream_ctxs);
 
 	if (size > MEDIUM_STREAM_ARRAY_SIZE)
 		return dma_alloc_coherent(dev, size, dma, mem_flags);
@@ -1638,7 +1638,7 @@ static int scratchpad_alloc(struct xhci_hcd *xhci, gfp_t flags)
 		goto fail_sp;
 
 	xhci->scratchpad->sp_array = dma_alloc_coherent(dev,
-				     size_mul(sizeof(u64), num_sp),
+				     array_size(sizeof(u64), num_sp),
 				     &xhci->scratchpad->sp_dma, flags);
 	if (!xhci->scratchpad->sp_array)
 		goto fail_sp2;
@@ -1671,7 +1671,7 @@ static int scratchpad_alloc(struct xhci_hcd *xhci, gfp_t flags)
 	kfree(xhci->scratchpad->sp_buffers);
 
  fail_sp3:
-	dma_free_coherent(dev, num_sp * sizeof(u64),
+	dma_free_coherent(dev, array_size(sizeof(u64), num_sp),
 			    xhci->scratchpad->sp_array,
 			    xhci->scratchpad->sp_dma);
 
@@ -1700,7 +1700,7 @@ static void scratchpad_free(struct xhci_hcd *xhci)
 				    xhci->scratchpad->sp_array[i]);
 	}
 	kfree(xhci->scratchpad->sp_buffers);
-	dma_free_coherent(dev, num_sp * sizeof(u64),
+	dma_free_coherent(dev, array_size(sizeof(u64), num_sp),
 			    xhci->scratchpad->sp_array,
 			    xhci->scratchpad->sp_dma);
 	kfree(xhci->scratchpad);
@@ -1778,7 +1778,7 @@ static int xhci_alloc_erst(struct xhci_hcd *xhci,
 	struct xhci_segment *seg;
 	struct xhci_erst_entry *entry;
 
-	size = size_mul(sizeof(struct xhci_erst_entry), evt_ring->num_segs);
+	size = array_size(sizeof(struct xhci_erst_entry), evt_ring->num_segs);
 	erst->entries = dma_alloc_coherent(xhci_to_hcd(xhci)->self.sysdev,
 					   size, &erst->erst_dma_addr, flags);
 	if (!erst->entries)
@@ -1829,7 +1829,7 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	if (!ir)
 		return;
 
-	erst_size = sizeof(struct xhci_erst_entry) * ir->erst.num_entries;
+	erst_size = array_size(sizeof(struct xhci_erst_entry), ir->erst.num_entries);
 	if (ir->erst.entries)
 		dma_free_coherent(dev, erst_size,
 				  ir->erst.entries,
-- 
2.25.1


