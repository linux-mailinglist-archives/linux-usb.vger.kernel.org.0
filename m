Return-Path: <linux-usb+bounces-23139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE767A9054B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD0653B7006
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1523222590;
	Wed, 16 Apr 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4jEgs0H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDCC2222C2
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811177; cv=none; b=D7SMIvS3FfQ1tO2EeF/X/CumrhaBJSqo7va+SH3w1+GNPgaD2WrjU8zUFB9V7Qp/jStbN3a/FcUee22xjH4AZ3VuOytoNkh6R21DwkATgLfiGrZ4kWKygddQYPhZtkc+UbSKQAYk4mK6Pr+IBgqWDQH9zfocg473nwvwisRWl3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811177; c=relaxed/simple;
	bh=wJnWSPeCwr/mHgLXXcu8ynzG+SzgG81JVUfuiQwdJQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0X4THCBYED3AY41w5ceB0Mg6ltw/0vZWcpO20LSx647ubdFRpWz1qrLMZJ4yr0bb057tW3z92xDsQUMURDHDzk2BnBNhEHeNyaUKdPw/9U/C8xwiBkVkUEVcRhx7gvMT4iV28ckyBKDn8G+zvWALdk/C5v9NlUMX+ZBl2UxH+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4jEgs0H; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811175; x=1776347175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wJnWSPeCwr/mHgLXXcu8ynzG+SzgG81JVUfuiQwdJQE=;
  b=E4jEgs0HVHeILkVF+dsclMqUTwM1qy1zL3KkzQ1tn+7bupUjG/udT4B9
   L9SI6ABa5vay20ze0rFc1MoAKlXbYpX56cNBUatS6IruECuextIcwBudI
   nGRgFO///MgwEBHtbodjcs9bCK93LIcTpyQlQ9nxoJlSbF053Xg8VYe6C
   SCX/GPiWMdlGQcnuBFAzp/lFRpH1gk4IIPWwG38+c2/usCdX4xXIJEwpB
   cc7bztbfbJkvYJs7pqW//y2LvWLVs3lRhiVXiHQrkLw85yGwKxD5EeDvL
   EZ/LZFe75beAZc2NXFK10VNUu9RdsnWylfDUB5MTeh7PrDGs36WKLozg9
   w==;
X-CSE-ConnectionGUID: oVSe+Ud3T7W1T5URQ3kqfA==
X-CSE-MsgGUID: b0gHmxbLTlmmPsP/eU+W7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46074455"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46074455"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:46:12 -0700
X-CSE-ConnectionGUID: rpVTDSqsT7OWchjFsG6sJw==
X-CSE-MsgGUID: mMrcdi/NTwi/5fwQIV0XGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135659158"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2025 06:46:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id C9972260; Wed, 16 Apr 2025 16:46:10 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 04/11] usb: xhci: refactor xhci_set_cmd_ring_deq()
Date: Wed, 16 Apr 2025 16:45:03 +0300
Message-ID: <20250416134510.2406543-5-niklas.neronin@linux.intel.com>
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
index 92c32a80acae..d4f3da2c074b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -497,19 +497,21 @@ static void xhci_enable_max_dev_slots(struct xhci_hcd *xhci)
 
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
index 7eaabe4f6c87..bfb02dbd9fc7 100644
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


