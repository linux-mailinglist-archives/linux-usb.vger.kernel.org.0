Return-Path: <linux-usb+bounces-23144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4B6A9053B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B3F61652FD
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B182236F0;
	Wed, 16 Apr 2025 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1Q7wxzo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDC8223311
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811179; cv=none; b=YyK+qvfPA4FCqUX5An8qjd1dM7e1haGF47z6JFiujFiWRdhLPXn5G+XjYR1sPvUiNeXlMdrRqO2zRMgF9YBk1va5qtdASvBFuLKMeaiKH1fZ7460Qy6pMv/jDgx2zwaE+YM+Fq5t2jXqwvEeLaXdwjjTeUb8zQHhCMexL5Pdl4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811179; c=relaxed/simple;
	bh=Ko1i9bR/AX90oO/5GzzEgrmGcrLh31IMN/9kk9InFxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qD/KeXzYkuUz2blHGa1AAbs+xPQB+p0Y9a0djvFqRFkZOdfuHW2NoXdB+DkyaHC8jVLJEZXTJJLXb/w+uPX2jjJL49Yww/vgDsMlLFVsji9nRpLrAGa85Wj8gSbbgZzDTs/XB6WtS2A+mNSQrpXfizQqmWDFiYJWFqtjk5mspL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1Q7wxzo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811178; x=1776347178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ko1i9bR/AX90oO/5GzzEgrmGcrLh31IMN/9kk9InFxE=;
  b=Q1Q7wxzoHSdWDiCeZ3uOcTxQMbcD4Uee+1ocxhWXiIg31fF+yN5KuuOd
   rvZUhjYneCuS42nRA8EhmqpXUkq1fiGhBOsTRON6wJ/wgVrf0mVklbKeI
   A7hLx7x+mxsG2ibQGOYNK6IpdDGUr/1ySF82biafb7PdyQqOD5Z252lsF
   TZoxymn9LpquyV7s8KiXc4JMXQcBYmV1TeTj6Jvm+ZDgfzhuXBZUSqv6C
   GIOkaHcveT9SkjTdmpKz3FAc10TqtR01oUWRybUxLkN2Eb9moOaWxKeAx
   2qnz4BkBJQ5tdi0RbLqhwcVWfR9OLvY1zpOEUN+WuRm4rpFwPCnzWgQ4B
   A==;
X-CSE-ConnectionGUID: 8kfr0S75RnyHh0y7f1ysBQ==
X-CSE-MsgGUID: KlIjapdqSi+ocNJIymXVJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46074472"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46074472"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:46:17 -0700
X-CSE-ConnectionGUID: wlkYcjXHTUiWTme1aig0Sg==
X-CSE-MsgGUID: 5lFR31FWTJSeAEnpgNN/Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135659187"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2025 06:46:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 5674578A; Wed, 16 Apr 2025 16:46:15 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 11/11] usb: xhci: cleanup xhci_mem_init()
Date: Wed, 16 Apr 2025 16:45:10 +0300
Message-ID: <20250416134510.2406543-12-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416134510.2406543-1-niklas.neronin@linux.intel.com>
References: <20250416134510.2406543-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup indentation, spacing and comment formats.

Remove the "// " prefix from trace messages, as it is unnecessary and
distracting.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 46 ++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 3edb231af199..8945329e064d 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2380,14 +2380,14 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 * xHCI section 5.4.6 - Device Context array must be
 	 * "physically contiguous and 64-byte (cache line) aligned".
 	 */
-	xhci->dcbaa = dma_alloc_coherent(dev, sizeof(*xhci->dcbaa), &dma,
-			flags);
+	xhci->dcbaa = dma_alloc_coherent(dev, sizeof(*xhci->dcbaa), &dma, flags);
 	if (!xhci->dcbaa)
 		goto fail;
+
 	xhci->dcbaa->dma = dma;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Device context base array address = 0x%pad (DMA), %p (virt)",
-			&xhci->dcbaa->dma, xhci->dcbaa);
+		       "Device context base array address = 0x%pad (DMA), %p (virt)",
+		       &xhci->dcbaa->dma, xhci->dcbaa);
 
 	/*
 	 * Initialize the ring segment pool.  The ring must be a contiguous
@@ -2407,27 +2407,26 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		goto fail;
 
 	/* See Table 46 and Note on Figure 55 */
-	xhci->device_pool = dma_pool_create("xHCI input/output contexts", dev,
-			2112, 64, xhci->page_size);
+	xhci->device_pool = dma_pool_create("xHCI input/output contexts", dev, 2112, 64,
+					    xhci->page_size);
 	if (!xhci->device_pool)
 		goto fail;
 
-	/* Linear stream context arrays don't have any boundary restrictions,
+	/*
+	 * Linear stream context arrays don't have any boundary restrictions,
 	 * and only need to be 16-byte aligned.
 	 */
-	xhci->small_streams_pool =
-		dma_pool_create("xHCI 256 byte stream ctx arrays",
-			dev, SMALL_STREAM_ARRAY_SIZE, 16, 0);
+	xhci->small_streams_pool = dma_pool_create("xHCI 256 byte stream ctx arrays",
+						   dev, SMALL_STREAM_ARRAY_SIZE, 16, 0);
 	if (!xhci->small_streams_pool)
 		goto fail;
 
-	xhci->medium_streams_pool =
-		dma_pool_create("xHCI 1KB stream ctx arrays",
-			dev, MEDIUM_STREAM_ARRAY_SIZE, 16, 0);
-	/* Any stream context array bigger than MEDIUM_STREAM_ARRAY_SIZE
-	 * will be allocated with dma_alloc_coherent()
+	/*
+	 * Any stream context array bigger than MEDIUM_STREAM_ARRAY_SIZE will be
+	 * allocated with dma_alloc_coherent().
 	 */
-
+	xhci->medium_streams_pool = dma_pool_create("xHCI 1KB stream ctx arrays",
+						    dev, MEDIUM_STREAM_ARRAY_SIZE, 16, 0);
 	if (!xhci->medium_streams_pool)
 		goto fail;
 
@@ -2435,20 +2434,20 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci->cmd_ring = xhci_ring_alloc(xhci, 1, TYPE_COMMAND, 0, flags);
 	if (!xhci->cmd_ring)
 		goto fail;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Allocated command ring at %p", xhci->cmd_ring);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%pad",
-			&xhci->cmd_ring->first_seg->dma);
 
-	/* Reserve one command ring TRB for disabling LPM.
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocated command ring at %p", xhci->cmd_ring);
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%pad",
+		       &xhci->cmd_ring->first_seg->dma);
+
+	/*
+	 * Reserve one command ring TRB for disabling LPM.
 	 * Since the USB core grabs the shared usb_bus bandwidth mutex before
 	 * disabling LPM, we only need to reserve one TRB for all devices.
 	 */
 	xhci->cmd_ring_reserved_trbs++;
 
 	/* Allocate and set up primary interrupter 0 with an event ring. */
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-		       "Allocating primary event ring");
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating primary event ring");
 	xhci->interrupters = kcalloc_node(xhci->max_interrupters, sizeof(*xhci->interrupters),
 					  flags, dev_to_node(dev));
 	if (!xhci->interrupters)
@@ -2460,6 +2459,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;
+
 	if (xhci_setup_port_arrays(xhci, flags))
 		goto fail;
 
-- 
2.47.2


