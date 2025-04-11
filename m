Return-Path: <linux-usb+bounces-22961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 778C6A857AB
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CDDD7B078F
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAC0298CBF;
	Fri, 11 Apr 2025 09:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m31NEyfs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD11298CAE
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362784; cv=none; b=aJGSvKIKwFAY6MS1RIybAxuORpq+XnZTeXXy8UD5tZrskPZfntJ6NFZFcqZAO1U87+YTsBliNdG4x0VdK6noJZajfb6voGtGtfidWaQ4BMkKsS/NCWPCDipiaKWJ/mTq/tr5+LUWD8rsjCPXDL7xD+dPPEG+pep2KsLMLi/ObXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362784; c=relaxed/simple;
	bh=eah2lxqCDe87SYlOVI0A+m91YeKZHzdW0jK9nLJkYHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qh9w6HMbL6CeX+BsupXbxNHefbzgLfNTnQ9SOcoW0Xma1K7U22XXYEfwTkGnWn9hyuxjaBWr5xU+QMlAxM5VMhYyaGlvzt4QpKcL4BoAXctm8hUxt6ulvWNaF3dUSRcs/0dQa/Cn6Kk6VdZlRW3vx6TvpgxwvRY6i8aqFIiUV2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m31NEyfs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362783; x=1775898783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eah2lxqCDe87SYlOVI0A+m91YeKZHzdW0jK9nLJkYHc=;
  b=m31NEyfsWrPcpRPVSgU6Co18Kj14blZNVesy74cFe6LQowJQlOTWv0qJ
   gDRI4jNvMC6u6D++IlTyRhVr0XT+M9cvUDh+Z8f0TYRWTL2mtOtQa5ksJ
   2OxnNQoWGgHUUxy8JrGKYu45unLX8YujiJuhysbOn7El/j+ERCiutU4uR
   qbdMkzY1jZYwFNXahe0pzfxVgpWByFZXT5AI1h6whfaOb/v0XfHXXdyJJ
   XS5702ksh1f0hGL98EOsUuy2jtc3ZtSOiHPY2Vn/RnKCjykjLB63EBT2u
   1b8OfZs86mM8lu1M0jV+Bf7bG2QZpTFtnKzfHITmQk2Fjri009yhzq9bx
   Q==;
X-CSE-ConnectionGUID: ZEAn4j+uTnCP+/5nlF1Kyw==
X-CSE-MsgGUID: lVZNx/zvRe2IjphViyPN0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45798961"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45798961"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:13:02 -0700
X-CSE-ConnectionGUID: 6cIx6iHxQnevTUjHbLY0mQ==
X-CSE-MsgGUID: M4b75oK3Q+C4WwOiDgfoOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134008717"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 02:13:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 2695A57F; Fri, 11 Apr 2025 12:13:00 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 11/11] usb: xhci: cleanup xhci_mem_init()
Date: Fri, 11 Apr 2025 12:11:55 +0300
Message-ID: <20250411091155.3386971-12-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411091155.3386971-1-niklas.neronin@linux.intel.com>
References: <20250411091155.3386971-1-niklas.neronin@linux.intel.com>
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
index a45d96a5ef5f..1066c5d8ad83 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2367,14 +2367,14 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
@@ -2394,27 +2394,26 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
 
@@ -2422,20 +2421,20 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
@@ -2447,6 +2446,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;
+
 	if (xhci_setup_port_arrays(xhci, flags))
 		goto fail;
 
-- 
2.47.2


