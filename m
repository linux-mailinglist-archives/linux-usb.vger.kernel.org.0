Return-Path: <linux-usb+bounces-23985-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D91AB889F
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCAC24E4C00
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F5F1DED64;
	Thu, 15 May 2025 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EznvBFwj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894C1DB363
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317399; cv=none; b=EAsd4uXOYmvOKrn/qg5itYYPArs2Fz4x1us+FHnzLXxlAXTPjm2cJYepKeTdhq1UDvrwEDK94YJovPrPJvqvmbPl2cHCK0KR9klYky5gdYbfcMxV4qglbcEaGDlniuPOHNJ2kBNq3pqs1nT6pAPrwWLpmVmi+5pItwR6vwgAbnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317399; c=relaxed/simple;
	bh=b9N8R68n2gSAraT4c70RJhIwiqxAWTj9BopWmH/mwWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5YtjMFAnFPaVKH9hG36X3bUEizqpwitQ2kr2okT2lkRrSPWmiM9IXuv0J7TEZu/AZaQq542VnUhbaz5cKhyyqzFzXypyqHxQkPXiBLCwq9paDAgWHpMI9MZoOpRzEChEVgTJiyyI1okNsteerOsT15G7ioe202bYC7dsotp7QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EznvBFwj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317398; x=1778853398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b9N8R68n2gSAraT4c70RJhIwiqxAWTj9BopWmH/mwWk=;
  b=EznvBFwjEU/ZmHvYbjwYCK4akD62VSsWaPxkcxZGs9Sh/kZEea/Z9yTh
   IZQGC2XaQTtU+R6YUDqMKY8nmZHsEpuAVzXiSp1PkCXbnMoqMn3ONzEJ8
   wzplqmo9E7wsseynNiq6DcryTIzkza4mcftHc8Hb/zWBI93+W7rvkhewG
   Y1fg8yKxxH1STbGKfwQW5pEdn5eU93tJDSzlhKHAK8rXWuzEIq2ULOY4R
   dAp4B447iGK9+USy4f4CJ5t8woKmE7tyrcTzuizTBIsRL9N/zNPMyUsEI
   2WoaZZ1/CyIUCxQgoC1H8/o55XvhTlx1I0jC6MVZlnTcnOD4PAUlDcm74
   A==;
X-CSE-ConnectionGUID: GX/suECQQze6EyerBy2gBg==
X-CSE-MsgGUID: EcX77zaoSpW4ND71jdT6YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270005"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270005"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:37 -0700
X-CSE-ConnectionGUID: 2MlU1N+3Rrmj6m0fRLU6ZA==
X-CSE-MsgGUID: YTsEeSeKQJKknHWei3j+5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372107"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:35 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/24] usb: xhci: move command ring pointer write
Date: Thu, 15 May 2025 16:56:02 +0300
Message-ID: <20250515135621.335595-6-mathias.nyman@linux.intel.com>
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

Move command ring pointer write from xhci_mem_init() to xhci_init(),
and utilize the xhci_set_cmd_ring_deq() function.

The xhci_set_cmd_ring_deq() function is nearly identical to the Command
Ring Control register code in xhci_mem_init(). The only notable change is
the use of:
  xhci_trb_virt_to_dma(xhci->cmd_ring->deq_seg, xhci->cmd_ring->dequeue)
instead of:
  xhci->cmd_ring->first_seg->dma
but they are effectively the same in this context. The former represents
the exact position of the dequeue pointer, while the latter is the first
DMA in the first segment. Before use, the dequeue pointer is at the first
DMA in the first segment.

The xhci_set_cmd_ring_deq() function is moved without modification, except
for (long unsigned long) -> (unsigned long long) due to checkpatch.pl.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 10 ----------
 drivers/usb/host/xhci.c     | 37 ++++++++++++++++++++-----------------
 2 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index e03109a24a50..c4b94f7bacfb 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2420,7 +2420,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
 	unsigned int	val;
-	u64		val_64;
 	u32		temp;
 
 	/*
@@ -2492,15 +2491,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%pad",
 			&xhci->cmd_ring->first_seg->dma);
 
-	/* Set the address in the Command Ring Control register */
-	val_64 = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
-	val_64 = (val_64 & (u64) CMD_RING_RSVD_BITS) |
-		(xhci->cmd_ring->first_seg->dma & (u64) ~CMD_RING_RSVD_BITS) |
-		xhci->cmd_ring->cycle_state;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Setting command ring address to 0x%016llx", val_64);
-	xhci_write_64(xhci, val_64, &xhci->op_regs->cmd_ring);
-
 	/* Reserve one command ring TRB for disabling LPM.
 	 * Since the USB core grabs the shared usb_bus bandwidth mutex before
 	 * disabling LPM, we only need to reserve one TRB for all devices.
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ec0a2fa7d003..66a9106d8b31 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -495,6 +495,23 @@ static void xhci_enable_max_dev_slots(struct xhci_hcd *xhci)
 	writel(config_reg, &xhci->op_regs->config_reg);
 }
 
+static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
+{
+	u64	val_64;
+
+	/* step 2: initialize command ring buffer */
+	val_64 = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
+	val_64 = (val_64 & (u64) CMD_RING_RSVD_BITS) |
+		(xhci_trb_virt_to_dma(xhci->cmd_ring->deq_seg,
+					xhci->cmd_ring->dequeue) &
+			(u64) ~CMD_RING_RSVD_BITS) |
+		xhci->cmd_ring->cycle_state;
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+			"// Setting command ring address to 0x%llx",
+			(unsigned long long) val_64);
+	xhci_write_64(xhci, val_64, &xhci->op_regs->cmd_ring);
+}
+
 /*
  * Initialize memory for HCD and xHC (one-time init).
  *
@@ -523,6 +540,9 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set the Number of Device Slots Enabled to the maximum supported value */
 	xhci_enable_max_dev_slots(xhci);
 
+	/* Set the address in the Command Ring Control register */
+	xhci_set_cmd_ring_deq(xhci);
+
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
@@ -793,23 +813,6 @@ static void xhci_restore_registers(struct xhci_hcd *xhci)
 	}
 }
 
-static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
-{
-	u64	val_64;
-
-	/* step 2: initialize command ring buffer */
-	val_64 = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
-	val_64 = (val_64 & (u64) CMD_RING_RSVD_BITS) |
-		(xhci_trb_virt_to_dma(xhci->cmd_ring->deq_seg,
-				      xhci->cmd_ring->dequeue) &
-		 (u64) ~CMD_RING_RSVD_BITS) |
-		xhci->cmd_ring->cycle_state;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Setting command ring address to 0x%llx",
-			(long unsigned long) val_64);
-	xhci_write_64(xhci, val_64, &xhci->op_regs->cmd_ring);
-}
-
 /*
  * The whole command ring must be cleared to zero when we suspend the host.
  *
-- 
2.43.0


