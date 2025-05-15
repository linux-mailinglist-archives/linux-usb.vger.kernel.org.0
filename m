Return-Path: <linux-usb+bounces-23993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 295A4AB88B1
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25CA0A0235B
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C50C19CC27;
	Thu, 15 May 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dl6D2yDD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282431A2557
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317411; cv=none; b=bu5Y4OR7UsqyqZbCqC2mCI3QFwrsqa1N/s/9TjRy3mOtfZdNT3tQ+RrZY8kGcC9k0w4ZqtNNnPaMHvQtKm3zP6LxZuNTg0zudbneFTot0nBAKBped90MidnydCJBqfA0A5kX4yROdt16whlTp/5fO/DqM6zY274a9+SBGwisDjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317411; c=relaxed/simple;
	bh=+OYHLXnnZ8oWDQqUhk9kc18xUGV79y4C3n2wGzzm69k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHu9T40rxhPYXN17Jq7Kih8xUwYyI6FkQUJxzshcXl37rca2PC3VHUll5FP2l+3hF4zRSjOxg2TluBDtwInfqVNHKmMWwTcZ4cH7dq/lJ/ZFLYpUWPtdwGmRqINvzXG7818RpuAu4qYaW7XfTpa22rXhDN8CAoBT+Q2s9b9UT6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dl6D2yDD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317411; x=1778853411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+OYHLXnnZ8oWDQqUhk9kc18xUGV79y4C3n2wGzzm69k=;
  b=dl6D2yDD8SHuSBlf8/OkHZMbzAyhL5Bb+VkL1fCLR7YkeZb9COpkI4wN
   2a9DoCWjp9UufgjTzL9nCaWsSzRHSbUhJBgACX/PrRQtrJdbx1FCqgWpe
   UNGzqJhjFj5o2VvNHQtMVPeB7K6wvo125s6ZgYiHSZelxFd+BR1aSUhY1
   gwsmXxGsK04m1tTkxS4Q4p059UA7AnG/HXqrRD7pt7r6CuRgrv+7nDsXx
   vDeB8vQiOBqdx+MqvaPzYjrYMoOOxZFxETCfYl+DOqmZdZy8QB+HqIvAh
   4dbYWN+5k85a7y5HYjhOGRLV4SRJuyz8Vjhr2nVuDqQQaSOqriECAqEGL
   Q==;
X-CSE-ConnectionGUID: gGl6NlwASBmaFOfnXLy0aw==
X-CSE-MsgGUID: IUimQOyWT26wHFHCJQVgXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270047"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270047"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:50 -0700
X-CSE-ConnectionGUID: y+0UwViMSreANGS1N4M2gQ==
X-CSE-MsgGUID: A9Jug/sTQAG72Rw1Ib0DrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372257"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:48 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/24] usb: xhci: cleanup xhci_mem_init()
Date: Thu, 15 May 2025 16:56:10 +0300
Message-ID: <20250515135621.335595-14-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Cleanup indentation, spacing and comment formats.

Remove the "// " prefix from trace messages, as it is unnecessary and
distracting.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 52 +++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 8cadd785ac0e..08513e5d321a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2414,14 +2414,14 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
@@ -2441,36 +2441,37 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
+
+	xhci->medium_streams_pool = dma_pool_create("xHCI 1KB stream ctx arrays",
+						    dev, MEDIUM_STREAM_ARRAY_SIZE, 16, 0);
 	if (!xhci->medium_streams_pool)
 		goto fail;
 
-	/* refer to xhci rev1_2 protocol 5.3.3 max ports is 255.
+	/*
+	 * refer to xhci rev1_2 protocol 5.3.3 max ports is 255.
 	 * refer to xhci rev1_2 protocol 6.4.3.14 port bandwidth buffer need
 	 * to be 16-byte aligned.
 	 */
-	xhci->port_bw_pool =
-		dma_pool_create("xHCI 256 port bw ctx arrays",
-			dev, GET_PORT_BW_ARRAY_SIZE, 16, 0);
+	xhci->port_bw_pool = dma_pool_create("xHCI 256 port bw ctx arrays",
+					     dev, GET_PORT_BW_ARRAY_SIZE, 16, 0);
 	if (!xhci->port_bw_pool)
 		goto fail;
 
@@ -2478,20 +2479,20 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci->cmd_ring = xhci_ring_alloc(xhci, 1, TYPE_COMMAND, 0, flags);
 	if (!xhci->cmd_ring)
 		goto fail;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Allocated command ring at %p", xhci->cmd_ring);
+
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocated command ring at %p", xhci->cmd_ring);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%pad",
-			&xhci->cmd_ring->first_seg->dma);
+		       &xhci->cmd_ring->first_seg->dma);
 
-	/* Reserve one command ring TRB for disabling LPM.
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
@@ -2503,6 +2504,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;
+
 	if (xhci_setup_port_arrays(xhci, flags))
 		goto fail;
 
-- 
2.43.0


