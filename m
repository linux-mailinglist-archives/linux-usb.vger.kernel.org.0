Return-Path: <linux-usb+bounces-22953-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF1A857A9
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C66573BD266
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E462989AA;
	Fri, 11 Apr 2025 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOU2bS36"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CC5298981
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362775; cv=none; b=dOJmCydz8/ZIV1wUwrqDaUDH7J86shR/lGCYQUznclT7JH/O0Tw47uXBDeMp7kS3iW5qTN5PwvGkIe5tVYowIBiCgVOMStwVq/R3YKvRjAiL/qMpEE5iH3okqv4EdQDt3aEMDb24+1lX5MXjau5qjp9sZebiHUSb3xHA62BazTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362775; c=relaxed/simple;
	bh=BYCDvvDLIUyHq/FI86zXrAuIh1pVjoLyzqFItbyHmPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2a1b6x2KwHMEz8BAiXcDcDgdpksFMKlx9GFw8zHrVWgQkwqLiet7+XhdxXcH1TNv8Zs2WxLrqhJ4TKpNL6E7n0HGVmzsTaYnVVoZ0f83yTwoM1aSfAk3SxPSniFDCzJErBFJAguXZfymhZUiPdrQDBdWOuRJuGy5wxjYH9M8xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOU2bS36; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362774; x=1775898774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BYCDvvDLIUyHq/FI86zXrAuIh1pVjoLyzqFItbyHmPg=;
  b=HOU2bS36PsjNUlvZuPltDEYvF6W9ILGz8dwNB+FFu0oucpSuCJHXZi9N
   uk+45li73kDlWYvHIyKIXVT5HWcD2y7x2XeX18z8OpZwJPfHeG+UKeVh8
   m7R3APTEiYtjdKNQ10jx3HoCNfykTQ+6riYwhVrv/Vb994NeplLle9nkx
   jqGduGxSrBKuBuqtkg5/agLo4uYGl/rx8UaHyvo8l5S1cRPCzG2LcmqvV
   hfkpHZXiWtJbkYrJDaGU8O7/hflCohcUeM33XrLem8AVS93bc41XkplZH
   lKg3AnGQLy4d7s14KLzRwypR+SKzkyiBoaTjyc0zKIcNAk06muK7Pz40m
   A==;
X-CSE-ConnectionGUID: +AZ6VUnJQIyTWxQYf2uLrA==
X-CSE-MsgGUID: g6rkZUXtTcOX5Bw0dkyMOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45798946"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45798946"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:12:53 -0700
X-CSE-ConnectionGUID: D9XvQ6LgRh+NDaaMnFDw7g==
X-CSE-MsgGUID: 90+JmPjHRT+uY9BvIzjJdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134008545"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 02:12:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id DD8F078B; Fri, 11 Apr 2025 12:12:50 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 03/11] usb: xhci: move command ring pointer write
Date: Fri, 11 Apr 2025 12:11:47 +0300
Message-ID: <20250411091155.3386971-4-niklas.neronin@linux.intel.com>
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
---
 drivers/usb/host/xhci-mem.c | 10 ----------
 drivers/usb/host/xhci.c     | 37 ++++++++++++++++++++-----------------
 2 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 5086d6108d3e..47b804aa328d 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2377,7 +2377,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
 	unsigned int	val;
-	u64		val_64;
 	u32		temp;
 
 	/*
@@ -2440,15 +2439,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
index 1e4850542a2e..278bd32d7b55 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -494,6 +494,23 @@ static void xhci_enable_max_dev_slots(struct xhci_hcd *xhci)
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
@@ -522,6 +539,9 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set the Number of Device Slots Enabled to the maximum supported value */
 	xhci_enable_max_dev_slots(xhci);
 
+	/* Set the address in the Command Ring Control register */
+	xhci_set_cmd_ring_deq(xhci);
+
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
@@ -792,23 +812,6 @@ static void xhci_restore_registers(struct xhci_hcd *xhci)
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
2.47.2


