Return-Path: <linux-usb+bounces-28242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D59B81E42
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 23:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CB393AAA38
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 21:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496352D0C6C;
	Wed, 17 Sep 2025 21:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULStkD85"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1B72882DB
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143298; cv=none; b=gfQoA6eVtL9bSYrRrqvoMPbMtiA9rKyb5DUlOeZ/7PZwAPRkp0Szz345o6DKhSnG5C5dfu1rhNFHcOBD7OT1RVJaKsjZlhUH2Bj8WlVU30ZZJHcWQOh/CAkBgREVCsN+WcSB5Ja6tfGincixLTfgzqaGY1KfDptvXBPmpKxVLEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143298; c=relaxed/simple;
	bh=VUli3e3FvGMXPLNr600ZUrf6jOOOnjxtjgT+QJE89i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PoZu/yL9m8WthSwv/NnLhni6ioNbqyQPzzygI2RvbIm/NnVvIZUXBSl8JCTBIGKCiAiQcqEUwMphOfmNYoNz62tpMdL3hgTUhcFz79Moo4ZGyqNguZo2qTjSLuJkZJqf4DWIbyRyVF6FgKizO7C6issGfyIGPQ8I4TOikR2pUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULStkD85; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758143297; x=1789679297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VUli3e3FvGMXPLNr600ZUrf6jOOOnjxtjgT+QJE89i8=;
  b=ULStkD859IuU7ZIO9sT4lZXyuXdC4pPxnyM+L5F7mrfcSKkp0HtdsiFP
   Oh+hCIodpWUb8NhmF9ldm1GjE0X6o0ykGOF63JrQcVP69Spbykh1iufsg
   HWzjI4CtzdOaRZKEQR7y4aYROqm7sptKuOk64Fb7a/DPHGRjvFDHXeOE/
   iuMsGjfrSdDsKGeld5jy/WD2vkpoefm/1ZtFCEl/zcHXXVAGlgWfPIWvy
   7ZSKWEN5phgnpTMzpZRQDAsKni35HAie8ntx7uiW0HO+94PRGtbuPx7WZ
   1ogukmeMqSRWhKLZCfGlFziBYRzPWwPT46rG4K2zQ+FSn1D8U+D26OQ6x
   w==;
X-CSE-ConnectionGUID: BmhfXIMlSy+3F6R72uSCfQ==
X-CSE-MsgGUID: fNJcNN1WQBCQFabLcxXxzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48038218"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="48038218"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 14:08:16 -0700
X-CSE-ConnectionGUID: 63F5BVKvRjed4anxNDGPBA==
X-CSE-MsgGUID: H+I+BwgjQg2+dNTN2VMM/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175800209"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.42])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2025 14:08:15 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/6] usb: xhci: improve TR Dequeue Pointer mask
Date: Thu, 18 Sep 2025 00:07:23 +0300
Message-ID: <20250917210726.97100-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
References: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Address the naming and usage of the TR Dequeue Pointer mask in the xhci
driver. The Endpoint Context Field at offset 0x08 is defined as follows:
 Bit 0		Dequeue Cycle State (DCS)
 Bits 3:1	RsvdZ (Reserved and Zero)
 Bits 63:4	TR Dequeue Pointer

When extracting the TR Dequeue Pointer for an Endpoint without Streams,
in xhci_handle_cmd_set_deq(), the inverted Dequeue Cycle State mask
(~EP_CTX_CYCLE_MASK) is used, inadvertently including the Reserved bits.
Although bits 3:1 are typically zero, using the incorrect mask could cause
issues.

The existing mask, named "SCTX_DEQ_MASK," is misleading because "SCTX"
implies exclusivity to Stream Contexts, whereas the TR Dequeue Pointer is
applicable to both Stream and non-Stream Contexts.

Rename the mask to "TR_DEQ_PTR_MASK", utilize GENMASK_ULL() macro and use
the mask when handling the TR Dequeue Pointer field.

Function xhci_get_hw_deq() returns the Endpoint Context Field 0x08, either
directly from the Endpoint context or a Stream.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 12 ++++++------
 drivers/usb/host/xhci.h      |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e3d0e2e0312e..96c5bab9eb60 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -711,7 +711,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 		return -ENODEV;
 	}
 
-	hw_dequeue = xhci_get_hw_deq(xhci, dev, ep_index, stream_id);
+	hw_dequeue = xhci_get_hw_deq(xhci, dev, ep_index, stream_id) & TR_DEQ_PTR_MASK;
 	new_seg = ep_ring->deq_seg;
 	new_deq = ep_ring->dequeue;
 	new_cycle = le32_to_cpu(td->end_trb->generic.field[3]) & TRB_CYCLE;
@@ -723,7 +723,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	 */
 	do {
 		if (!hw_dequeue_found && xhci_trb_virt_to_dma(new_seg, new_deq)
-		    == (dma_addr_t)(hw_dequeue & ~0xf)) {
+		    == (dma_addr_t)hw_dequeue) {
 			hw_dequeue_found = true;
 			if (td_last_trb_found)
 				break;
@@ -1066,7 +1066,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 		 */
 		hw_deq = xhci_get_hw_deq(xhci, ep->vdev, ep->ep_index,
 					 td->urb->stream_id);
-		hw_deq &= ~0xf;
+		hw_deq &= TR_DEQ_PTR_MASK;
 
 		if (td->cancel_status == TD_HALTED || trb_in_td(td, hw_deq)) {
 			switch (td->cancel_status) {
@@ -1156,7 +1156,7 @@ static struct xhci_td *find_halted_td(struct xhci_virt_ep *ep)
 
 	if (!list_empty(&ep->ring->td_list)) { /* Not streams compatible */
 		hw_deq = xhci_get_hw_deq(ep->xhci, ep->vdev, ep->ep_index, 0);
-		hw_deq &= ~0xf;
+		hw_deq &= TR_DEQ_PTR_MASK;
 		td = list_first_entry(&ep->ring->td_list, struct xhci_td, td_list);
 		if (trb_in_td(td, hw_deq))
 			return td;
@@ -1479,7 +1479,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 		u64 deq;
 		/* 4.6.10 deq ptr is written to the stream ctx for streams */
 		if (ep->ep_state & EP_HAS_STREAMS) {
-			deq = le64_to_cpu(stream_ctx->stream_ring) & SCTX_DEQ_MASK;
+			deq = le64_to_cpu(stream_ctx->stream_ring) & TR_DEQ_PTR_MASK;
 
 			/*
 			 * Cadence xHCI controllers store some endpoint state
@@ -1495,7 +1495,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 				stream_ctx->reserved[1] = 0;
 			}
 		} else {
-			deq = le64_to_cpu(ep_ctx->deq) & ~EP_CTX_CYCLE_MASK;
+			deq = le64_to_cpu(ep_ctx->deq) & TR_DEQ_PTR_MASK;
 		}
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			"Successful Set TR Deq Ptr cmd, deq = @%08llx", deq);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 85d5b964bf1e..30f311d899c3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -500,7 +500,8 @@ struct xhci_ep_ctx {
 
 /* deq bitmasks */
 #define EP_CTX_CYCLE_MASK		(1 << 0)
-#define SCTX_DEQ_MASK			(~0xfL)
+/* bits 63:4 - TR Dequeue Pointer */
+#define TR_DEQ_PTR_MASK			GENMASK_ULL(63, 4)
 
 
 /**
-- 
2.43.0


