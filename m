Return-Path: <linux-usb+bounces-23986-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5BAB88A8
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8121BC3E3D
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72581E3775;
	Thu, 15 May 2025 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXbNkKKz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20771990CD
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317400; cv=none; b=UNvxUKVTTG8ZoQTODFtrvf7hzbyL5Gj82fhgad2PrfJvxXNCOA+AcXCuEdqS5QGbjC1Naro4ks0QIkUZ+DCBavNvWB5CWVcdzr0gX5Pgn39ayPEiNgHMchosgmtY6nt2VdVlAscP+c/13ScvoychXX39fGTDnFtI3243PBbtPC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317400; c=relaxed/simple;
	bh=QZEDhRWPpLWiESbs7p40U6GD/qNi90W6pV5/ykEMmHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YlPsFr1MY10jKvuxMp4pTE2iQsZVKuEmqmJHGE8glxyGlG6W1bTQ5SLv9gRrp98one7wtFfCwxGAjxGKd1AAGhHJaQBfOu+rVjLILmkCIFHTLvTHhzxJkWYQaa+7leQ9ige04jfqy1NCQ6HCrLOpBiESDYdcZs27zW8nXedw3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXbNkKKz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317399; x=1778853399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QZEDhRWPpLWiESbs7p40U6GD/qNi90W6pV5/ykEMmHA=;
  b=XXbNkKKzaS82ePDiUPaQm8sjFxh3KKmbEILcqMj+Z9xj1+LkJSlaVeR8
   JOqx8iodimQNVIJ2raXmkpM/IuvY3DPDDaYwdtztc/2p34OsgTH85aki+
   7HvL0OXUwtALm75zQuZP1XIjxxroX8Ev+kw67Ppubq/1vswz0Qu4OORzq
   rRDPhEV4lobZFxXFf/OuiQBzAEr5Cf2ttvaZfIFdaz1EM8KMXRJWx6fu/
   kAV7szjlFWTIy/MAK66iFtB0CBG4mqcudzOzAmV8k9QCKS1Pmlb7QD/tc
   AP+Ex1K+qM3zm4H9r0pXW3NGDD8wgyrDZ6pRsiHfnZrRWrPMnjNDesK22
   g==;
X-CSE-ConnectionGUID: kk717/0FRiS0on4T24MGJw==
X-CSE-MsgGUID: KFUeY6YrRRO3KXcWUKRQXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270009"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270009"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:39 -0700
X-CSE-ConnectionGUID: wgE1TPn9S+yh6R670BeAww==
X-CSE-MsgGUID: 3ZsPSkIZSvyAVIgvRShriw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372120"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:37 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/24] usb: xhci: refactor xhci_set_cmd_ring_deq()
Date: Thu, 15 May 2025 16:56:03 +0300
Message-ID: <20250515135621.335595-7-mathias.nyman@linux.intel.com>
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

Refactor xhci_set_cmd_ring_deq() making the code more understandable by
using more descriptive constants and separating operations logically.

- Remove 'CMD_RING_RSVD_BITS' the macro is misleading, the reserved bits
  are 5:4, yet the mask is for bits 5:0.
- Introduce masks 'CMD_RING_PTR_MASK' and 'CMD_RING_CYCLE' to clearly
  define the bits for the Command Ring pointer and Command Ring Cycle.
- Simplifying the process of setting the command ring address by separating
  the DMA address calculation and the Command Ring Control register (crcr)
  updates.
- Remove the "// " prefix from trace messages, as it is unnecessary and
  distracting.

Note: In the current implementation, the cycle bit is not cleared before
applying the OR operation. Although this hasn't caused issues so far
because the bit is '0' before reaching this function, the bit is now
cleared before being set to prevent potential future problems and simplify
the process.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 28 +++++++++++++++-------------
 drivers/usb/host/xhci.h |  8 ++++----
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 66a9106d8b31..4c9174c5c7c7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -497,19 +497,21 @@ static void xhci_enable_max_dev_slots(struct xhci_hcd *xhci)
 
 static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
 {
-	u64	val_64;
-
-	/* step 2: initialize command ring buffer */
-	val_64 = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
-	val_64 = (val_64 & (u64) CMD_RING_RSVD_BITS) |
-		(xhci_trb_virt_to_dma(xhci->cmd_ring->deq_seg,
-					xhci->cmd_ring->dequeue) &
-			(u64) ~CMD_RING_RSVD_BITS) |
-		xhci->cmd_ring->cycle_state;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Setting command ring address to 0x%llx",
-			(unsigned long long) val_64);
-	xhci_write_64(xhci, val_64, &xhci->op_regs->cmd_ring);
+	dma_addr_t deq_dma;
+	u64 crcr;
+
+	deq_dma = xhci_trb_virt_to_dma(xhci->cmd_ring->deq_seg, xhci->cmd_ring->dequeue);
+	deq_dma &= CMD_RING_PTR_MASK;
+
+	crcr = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
+	crcr &= ~CMD_RING_PTR_MASK;
+	crcr |= deq_dma;
+
+	crcr &= ~CMD_RING_CYCLE;
+	crcr |= xhci->cmd_ring->cycle_state;
+
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Setting command ring address to 0x%llx", crcr);
+	xhci_write_64(xhci, crcr, &xhci->op_regs->cmd_ring);
 }
 
 /*
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f8198ec02981..6c1758f8fd01 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -191,16 +191,16 @@ struct xhci_op_regs {
 #define	DEV_NOTE_FWAKE		ENABLE_DEV_NOTE(1)
 
 /* CRCR - Command Ring Control Register - cmd_ring bitmasks */
-/* bit 0 is the command ring cycle state */
+/* bit 0 - Cycle bit indicates the ownership of the command ring */
+#define CMD_RING_CYCLE		(1 << 0)
 /* stop ring operation after completion of the currently executing command */
 #define CMD_RING_PAUSE		(1 << 1)
 /* stop ring immediately - abort the currently executing command */
 #define CMD_RING_ABORT		(1 << 2)
 /* true: command ring is running */
 #define CMD_RING_RUNNING	(1 << 3)
-/* bits 4:5 reserved and should be preserved */
-/* Command Ring pointer - bit mask for the lower 32 bits. */
-#define CMD_RING_RSVD_BITS	(0x3f)
+/* bits 63:6 - Command Ring pointer */
+#define CMD_RING_PTR_MASK	GENMASK_ULL(63, 6)
 
 /* CONFIG - Configure Register - config_reg bitmasks */
 /* bits 0:7 - maximum number of device slots enabled (NumSlotsEn) */
-- 
2.43.0


