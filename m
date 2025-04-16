Return-Path: <linux-usb+bounces-23136-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21147A90535
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CEC2462F0E
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618F31FCFE9;
	Wed, 16 Apr 2025 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dejtS77x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C2E221F08
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811175; cv=none; b=DRJ1Rj/37y9WDUh3mhIsQ6IPqe2vBYm616ppE7daGvaLZ5JF34+KWBWIM/jzg2rZyieVNqG642SDyPRPEC6c1eMoj/yjxcbdQkuW86psig2a0ga2IdsBvCSCFK6Btuzkp+kHtOtRr8E8BCnBJaQmqv3kiAqFjgSmFO2oFulX1Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811175; c=relaxed/simple;
	bh=tMqhvHGC+mGP7wO51UlauYDKJnp3Abykw/yyKT5N4bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCUwbdtf6dgE9rhJwtJnHE5tLPwPhxfpTF2RvJXGbdoJ67zBTskFo7P523rP+QMAAGrzIY+XUy25fZZ1EWZjlq8TsnUyqZWtrbZosMSArNEc8Hveu1uz61OqKUqQ7amAowAT15o4yrIhjlOaI6G3egFJxajiK5KL0jLxp1yiKZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dejtS77x; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811173; x=1776347173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tMqhvHGC+mGP7wO51UlauYDKJnp3Abykw/yyKT5N4bs=;
  b=dejtS77xR0K58N++vL4qfLMiOwsPjvLnC8LWrziVNBoR9f8biCyRtsW4
   HVLzy1BpVz5p8EWtLQSk4+KnznmASxYHT+gDfj808NCIQgR5WxbkGVok/
   S1fjeLj7k+eF3l9oRlOiuviMi1MgSlWT5G5KJ02DdwStIk08FcvARecno
   gjigtzFAg3fOxAIb4WA0FtYuF1l2w8K9GRPELWrbZ9N502slUHm6jJAiJ
   olgpjNl8vOssBRZARopsUoA0AzjLqw7Q3UnTwEUg3JN2K3tVZQpOeAtP5
   paBFIjhamciFRm0z9N5xsPrSVGrn0NxLFVQssdHN0ZtC1/MShUvQcCJBM
   Q==;
X-CSE-ConnectionGUID: 8nTdwaZGRNirMvJnT3qGJg==
X-CSE-MsgGUID: BI7zDBOEQpWc1dCe5rJwUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50168103"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50168103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:46:12 -0700
X-CSE-ConnectionGUID: 0EyeKj0fTxGJASmXu+AeOA==
X-CSE-MsgGUID: 9QRER1ojTeyMEjdVd7aCbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135290228"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 16 Apr 2025 06:46:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 0732478A; Wed, 16 Apr 2025 16:46:09 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 03/11] usb: xhci: move command ring pointer write
Date: Wed, 16 Apr 2025 16:45:02 +0300
Message-ID: <20250416134510.2406543-4-niklas.neronin@linux.intel.com>
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
index dbf0187086db..46156e99bbbe 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2386,7 +2386,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
 	unsigned int	val;
-	u64		val_64;
 	u32		temp;
 
 	/*
@@ -2449,15 +2448,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
index 4de51ba851d8..92c32a80acae 100644
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
2.47.2


