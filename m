Return-Path: <linux-usb+bounces-22954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C16A857AD
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 553BE19E5B9C
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59BD2989B3;
	Fri, 11 Apr 2025 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbiraLEO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC442989A2
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362776; cv=none; b=ok5K8GgT7ZPbkJP/dAqS9iMNC+Cuut5wfWkb+/UBb3OKrPWMkQDli8qrPOrBoA/EU3RFamNYfRawGyytiRyNs3fxW/DCnpqI2+VQC79RCqqXkhbik0DowSnF0T9RgJ68RjqMMfBAA/Sjq45Yqtvf3f+wSDKLiR7zoEyhuPHAJPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362776; c=relaxed/simple;
	bh=2R+0L8t6kb8FM2xzPGLJqpSfjRKBwkFrAGU5ZdntspI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQqc3mGjOQC+c0Fg2m28KnQWZmoPpPFxOoOu6R9XlWkZXhuhnGHKBaQzOdwn/DQeCwQsPO8oyy4NT/jHS9b+jyPIIQf0t/pR4+Wu00dOgT78GSjD9uG90A9JTg0nlvvxtShKZ0gtUEPLMz0+LskcXhs7H7ItMKW/imyqmJSFDGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbiraLEO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362775; x=1775898775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2R+0L8t6kb8FM2xzPGLJqpSfjRKBwkFrAGU5ZdntspI=;
  b=XbiraLEOC66bgQ/ELVL23xG5v7cj5Faa2MXCkOmCbbXMn4/TMcsQUPQB
   BUCJNX2+P3kC3/yarA5tMteMNk4CIFgxoGi34CIbS7Yi9VzYH3+UkeUa1
   mMxEUOwdEPWeR8bGi+ss3ltW2X/c9n2ScGGY4nFwhpDXveNYcYHMTznLi
   o343hSlg95U/y7UOn+8osETD7OA0k2ODjD/3Fr6+/rlUAs7/SIBavzBlM
   OBuvqlIwIeR3fSqOf7xqS+qkDEs1vOIFE4Bi/DQTXkYizp6xW9c8V9DY7
   QDR/xWPHClJ2BFFIdz7+pi3W9Db0I1LMWn4wPKcpsHGSxKTpCTKEVaTp5
   Q==;
X-CSE-ConnectionGUID: pOgyEw1WR2+pOWAbR6JNag==
X-CSE-MsgGUID: RuFWBHAeTrC7CWbMHuZk3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45798949"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45798949"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:12:55 -0700
X-CSE-ConnectionGUID: 2Sit9EzeSX2D85LOXEehjw==
X-CSE-MsgGUID: 4Z+4tK0wTE+Ms/hI+ApBXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134008607"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 02:12:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id BF7E357F; Fri, 11 Apr 2025 12:12:52 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 04/11] usb: xhci: refactor xhci_set_cmd_ring_deq()
Date: Fri, 11 Apr 2025 12:11:48 +0300
Message-ID: <20250411091155.3386971-5-niklas.neronin@linux.intel.com>
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
---
 drivers/usb/host/xhci.c | 26 ++++++++++++++------------
 drivers/usb/host/xhci.h |  8 ++++----
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 278bd32d7b55..5f630e74b323 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -496,19 +496,21 @@ static void xhci_enable_max_dev_slots(struct xhci_hcd *xhci)
 
 static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
 {
-	u64	val_64;
+	dma_addr_t deq_dma;
+	u64 crcr;
 
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
index 37860f1e3aba..38058006f79b 100644
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
2.47.2


