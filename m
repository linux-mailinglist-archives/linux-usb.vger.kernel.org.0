Return-Path: <linux-usb+bounces-27507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA20B42785
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 19:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A67558088A
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 17:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262C5320CB6;
	Wed,  3 Sep 2025 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxZ1PAHD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891B31CA6B
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918915; cv=none; b=YSJ82KAP22ERod0WGD/UPm9637N8vOT2wPqXTtveR229bQq4MwKvtLAgPnCOBCmNYviEatV+FCsg5BHPxRBN0Et1aOhTfCgXhcIVawYzxWft7QpiSYw4XKqss9dQi1W22Xup0I7plbB0AW2Xo2WdVX6czHtA/obUK4sKDaNneHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918915; c=relaxed/simple;
	bh=stXkrHpXRWb8K1z+DNmt9tWlRfyop3bn5x3OVKQZvrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vs3ce/K2pSmNXLouQKetYnPvB9W6uVYhSSt+cE0jn0U526dqM5czUnQ7HT7DcMDDdm5SZCGX5jyndz+CUp0oKXygPvUMknhEmasJ+cp05DAAXIBIzuF1PKfTyYdb3d2OPiGEQrWyrDYsApoek+R6CfH+Xk/8cqTiyFOUSE7j1Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxZ1PAHD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756918914; x=1788454914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=stXkrHpXRWb8K1z+DNmt9tWlRfyop3bn5x3OVKQZvrI=;
  b=VxZ1PAHDZhG1K9eDYdYJLIv5tWfGE1sfGI9DXLMUk2oV/c2sUGiw/9KF
   6tjOsWOfY9FdI00LuRVdkt9RxSD4YN4aij4y/n1rXN+OOIyhgAKvOZSA5
   yWNHggni+YgAt8csteDGz7Jqlxl7TijFzHeUsnRG9RDfItGjPkcHz2JEE
   z/y7VLteGBoihiYCgq9NO/zT1o/kGbnBIJI+zQTy567tdEgLETdxC+8uV
   l22ZmjKaVnMVq9wUp79/2qeH6and/x9vfSz0iMcJoNkbWv1LX5HSD3kz7
   uWsCcYNo2Vw0hMA7s0jj6i18eUP9FEGmq+eLbwogpQmK9LB+UeIwwUT6B
   Q==;
X-CSE-ConnectionGUID: HKOvCbksQVSSTnThBq4Knw==
X-CSE-MsgGUID: YaQVybKkSYKMd3YjzO0yqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76687961"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="76687961"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 10:01:54 -0700
X-CSE-ConnectionGUID: tmVztyweTG+1dsUzHaRAtQ==
X-CSE-MsgGUID: gC2CJbm2SG+/Sd6EuauTFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="176007558"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2025 10:01:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 9A2BD94; Wed, 03 Sep 2025 19:01:51 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 7/7] usb: xhci: standardize address format
Date: Wed,  3 Sep 2025 19:01:27 +0200
Message-ID: <20250903170127.2190730-8-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the xHCI driver, printed hexadecimal values can be ambiguous, making it
difficult to distinguish between values and addresses. To enhance clarity,
all DMA addresses are now prefixed with the '@' symbol, ensuring immediate
recognition as addresses.

The '@' prefix is removed from '%p' specifiers, as they represent unique
address IDs rather than actual addresses. The hashing process does not
preserve any relation between addresses; for instance, if two addresses
are X bytes apart, their hashed counterparts will not reflect this
distinction.

Exceptions to the '@' prefix rule are functions xhci_ring_enqueue_show()
and xhci_ring_dequeue_show(), which exclusively print to the enqueue and
dequeue debugfs files, containing only addresses.

Standardize printing of all 64-bit addresses read from registers, using
the "0x%llx" specifier. Adding padding is unnecessary and provides no
useful information. Prefix the value with "0x" to clearly indicate that its
a hexadecimal.

$ git grep -n '0x%' | wc -l
39796
$ git grep -n '%#' | wc -l
5204

Redundant "0x" string prefix is removed from DMA addresses printed using
the '%pad' specifier, since '%pad' automatically includes the "0x" prefix.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c  |  2 +-
 drivers/usb/host/xhci-debugfs.c | 10 +++++-----
 drivers/usb/host/xhci-mem.c     | 10 +++++-----
 drivers/usb/host/xhci-ring.c    | 17 ++++++++---------
 drivers/usb/host/xhci-trace.h   | 10 +++++-----
 drivers/usb/host/xhci.c         | 12 ++++++------
 drivers/usb/host/xhci.h         |  2 +-
 7 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 2f24a3a54439..5c8f87c24fe7 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -771,7 +771,7 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 		break;
 	case COMP_STALL_ERROR:
 		deq = le64_to_cpu(ep_ctx->deq) & TR_DEQ_PTR_MASK;
-		dev_warn(dbc->dev, "Stall error at bulk TRB %llx, remaining %zu, ep deq %llx\n",
+		dev_warn(dbc->dev, "Stall error at bulk TRB 0x%llx, remaining %zu, ep deq 0x%llx\n",
 			 ep_trb, remain_length, deq);
 		status = 0;
 		dep->halted = 1;
diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 35398b95c5a2..698b9fb59630 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -204,7 +204,7 @@ static void xhci_ring_dump_segment(struct seq_file *s,
 	for (i = 0; i < TRBS_PER_SEGMENT; i++) {
 		trb = &seg->trbs[i];
 		dma = seg->dma + i * sizeof(*trb);
-		seq_printf(s, "%2u %pad: %s\n", seg->num, &dma,
+		seq_printf(s, "%2u @%pad: %s\n", seg->num, &dma,
 			   xhci_decode_trb(str, XHCI_MSG_MAX, le32_to_cpu(trb->generic.field[0]),
 					   le32_to_cpu(trb->generic.field[1]),
 					   le32_to_cpu(trb->generic.field[2]),
@@ -254,7 +254,7 @@ static int xhci_slot_context_show(struct seq_file *s, void *unused)
 
 	xhci = hcd_to_xhci(bus_to_hcd(dev->udev->bus));
 	slot_ctx = xhci_get_slot_ctx(xhci, dev->out_ctx);
-	seq_printf(s, "%pad: %s\n", &dev->out_ctx->dma,
+	seq_printf(s, "@%pad: %s\n", &dev->out_ctx->dma,
 		   xhci_decode_slot_context(str,
 					    le32_to_cpu(slot_ctx->dev_info),
 					    le32_to_cpu(slot_ctx->dev_info2),
@@ -279,7 +279,7 @@ static int xhci_endpoint_context_show(struct seq_file *s, void *unused)
 	for (ep_index = 0; ep_index < 31; ep_index++) {
 		ep_ctx = xhci_get_ep_ctx(xhci, dev->out_ctx, ep_index);
 		dma = dev->out_ctx->dma + (ep_index + 1) * CTX_SIZE(xhci->hcc_params);
-		seq_printf(s, "%pad: %s, virt_state:%#x\n", &dma,
+		seq_printf(s, "@%pad: %s, virt_state:%#x\n", &dma,
 			   xhci_decode_ep_context(str,
 						  le32_to_cpu(ep_ctx->ep_info),
 						  le32_to_cpu(ep_ctx->ep_info2),
@@ -537,11 +537,11 @@ static int xhci_stream_context_array_show(struct seq_file *s, void *unused)
 
 		if (id < epriv->stream_info->num_streams) {
 			ctx = le64_to_cpu(stream_ctx->stream_ring);
-			seq_printf(s, "%pad stream %d: deq %016llx SCT %llu cycle %llu\n",
+			seq_printf(s, "@%pad stream %d: deq 0x%llx SCT %llu cycle %llu\n",
 				   &dma, id, ctx & TR_DEQ_PTR_MASK, CTX_TO_SCT(ctx),
 				   ctx & EP_CTX_CYCLE_MASK);
 		} else {
-			seq_printf(s, "%pad stream %d: entry not used\n", &dma, id);
+			seq_printf(s, "@%pad stream %d: entry not used\n", &dma, id);
 		}
 	}
 
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 9520e7c6e774..7a4a878db1c9 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -987,14 +987,14 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	if (!dev->out_ctx)
 		goto fail;
 
-	xhci_dbg(xhci, "Slot %d output ctx = 0x%pad (dma)\n", slot_id, &dev->out_ctx->dma);
+	xhci_dbg(xhci, "Slot %d output ctx = @%pad (dma)\n", slot_id, &dev->out_ctx->dma);
 
 	/* Allocate the (input) device context for address device command */
 	dev->in_ctx = xhci_alloc_container_ctx(xhci, XHCI_CTX_TYPE_INPUT, flags);
 	if (!dev->in_ctx)
 		goto fail;
 
-	xhci_dbg(xhci, "Slot %d input ctx = 0x%pad (dma)\n", slot_id, &dev->in_ctx->dma);
+	xhci_dbg(xhci, "Slot %d input ctx = @%pad (dma)\n", slot_id, &dev->in_ctx->dma);
 
 	/* Initialize the cancellation and bandwidth list for each ep */
 	for (i = 0; i < 31; i++) {
@@ -1014,7 +1014,7 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 
 	/* Point to output device context in dcbaa. */
 	xhci->dcbaa->dev_context_ptrs[slot_id] = cpu_to_le64(dev->out_ctx->dma);
-	xhci_dbg(xhci, "Set slot id %d dcbaa entry %p to %pad\n",
+	xhci_dbg(xhci, "Set slot id %d dcbaa entry %p to @%pad\n",
 		 slot_id,
 		 &xhci->dcbaa->dev_context_ptrs[slot_id],
 		 &dev->out_ctx->dma);
@@ -2422,7 +2422,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	xhci->dcbaa->dma = dma;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-		       "Device context base array address = 0x%pad (DMA), %p (virt)",
+		       "Device context base array address = @%pad (DMA), %p (virt)",
 		       &xhci->dcbaa->dma, xhci->dcbaa);
 
 	/*
@@ -2483,7 +2483,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		goto fail;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocated command ring at %p", xhci->cmd_ring);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%pad",
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is @%pad",
 		       &xhci->cmd_ring->first_seg->dma);
 
 	/*
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7d57e2a3abf3..1e9c2024df30 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -754,15 +754,14 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	}
 
 	if ((ep->ep_state & SET_DEQ_PENDING)) {
-		xhci_warn(xhci, "Set TR Deq already pending, don't submit for 0x%pad\n",
-			  &addr);
+		xhci_warn(xhci, "Set TR Deq already pending, don't submit for @%pad\n", &addr);
 		return -EBUSY;
 	}
 
 	/* This function gets called from contexts where it cannot sleep */
 	cmd = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 	if (!cmd) {
-		xhci_warn(xhci, "Can't alloc Set TR Deq cmd 0x%pad\n", &addr);
+		xhci_warn(xhci, "Can't alloc Set TR Deq cmd @%pad\n", &addr);
 		return -ENOMEM;
 	}
 
@@ -781,7 +780,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	ep->queued_deq_ptr = new_deq;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-		       "Set TR Deq ptr %pad, cycle %u\n", &addr, new_cycle);
+		       "Set TR Deq ptr @%pad, cycle %u\n", &addr, new_cycle);
 
 	/* Stop the TD queueing code from ringing the doorbell until
 	 * this command completes.  The HC won't set the dequeue pointer
@@ -1049,7 +1048,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
 		dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-			       "Removing canceled TD starting at %pad (dma) in stream %u URB %p",
+			       "Removing canceled TD starting at @%pad (dma) in stream %u URB %p",
 			       &dma, td->urb->stream_id, td->urb);
 		list_del_init(&td->td_list);
 		ring = xhci_urb_to_transfer_ring(xhci, td->urb);
@@ -1500,7 +1499,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			deq = le64_to_cpu(ep_ctx->deq) & TR_DEQ_PTR_MASK;
 		}
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-			"Successful Set TR Deq Ptr cmd, deq = @%08llx", deq);
+			"Successful Set TR Deq Ptr cmd, deq = 0x%llx", deq);
 		if (xhci_trb_virt_to_dma(ep->queued_deq_seg,
 					 ep->queued_deq_ptr) == deq) {
 			/* Update the ring's dequeue segment and dequeue pointer
@@ -2254,7 +2253,7 @@ static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			if ((ep->ep_state & EP_HALTED) &&
 			    !list_empty(&td->cancelled_td_list)) {
 				dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
-				xhci_dbg(xhci, "Already resolving halted ep for %pad\n", &dma);
+				xhci_dbg(xhci, "Already resolving halted ep for @%pad\n", &dma);
 				return;
 			}
 			/* endpoint not halted, don't reset it */
@@ -2914,7 +2913,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			 * transfer or error on last TRB. Ignore it.
 			 */
 			if (xhci_spurious_success_tx_event(xhci, ep_ring)) {
-				xhci_dbg(xhci, "Spurious event dma %pad, comp_code %u after %u\n",
+				xhci_dbg(xhci, "Spurious event dma @%pad, comp_code %u after %u\n",
 					 &ep_trb_dma, trb_comp_code, ep_ring->old_trb_comp_code);
 				ep_ring->old_trb_comp_code = 0;
 				return 0;
@@ -2978,7 +2977,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 debug_finding_td:
 	td_start = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
 	td_end = xhci_trb_virt_to_dma(td->end_seg, td->end_trb);
-	xhci_err(xhci, "Event dma %pad for ep %d status %d not part of TD at %pad - %pad\n",
+	xhci_err(xhci, "Event dma @%pad for ep %d status %d not part of TD at @%pad - @%pad\n",
 		 &ep_trb_dma, ep_index, trb_comp_code, &td_start, &td_end);
 
 	return -ESHUTDOWN;
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index f6a2b4cedb8d..fd3ed105b5c4 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -95,7 +95,7 @@ DECLARE_EVENT_CLASS(xhci_log_ctx,
 			((HCC_64BYTE_CONTEXT(xhci->hcc_params) + 1) * 32) *
 			((ctx->type == XHCI_CTX_TYPE_INPUT) + ep_num + 1));
 	),
-	TP_printk("ctx_64=%d, ctx_type=%u, ctx_dma=@%pad, ctx_va=@%p",
+	TP_printk("ctx_64=%d, ctx_type=%u, ctx_dma=@%pad, ctx_va=%p",
 			__entry->ctx_64, __entry->ctx_type,
 			&__entry->ctx_dma, __entry->ctx_va
 	)
@@ -187,7 +187,7 @@ DECLARE_EVENT_CLASS(xhci_log_free_virt_dev,
 		__entry->slot_id = (int) vdev->slot_id;
 		__entry->current_mel = (u16) vdev->current_mel;
 		),
-	TP_printk("vdev %p slot %d ctx %pad | %pad current_mel %d",
+	TP_printk("vdev %p slot %d ctx @%pad | @%pad current_mel %d",
 		__entry->vdev, __entry->slot_id, &__entry->in_ctx,
 		&__entry->out_ctx, __entry->current_mel
 	)
@@ -223,7 +223,7 @@ DECLARE_EVENT_CLASS(xhci_log_virt_dev,
 		__entry->level = vdev->udev->level;
 		__entry->slot_id = vdev->udev->slot_id;
 	),
-	TP_printk("vdev %p ctx %pad | %pad num %d state %d speed %d port %d level %d slot %d",
+	TP_printk("vdev %p ctx @%pad | @%pad num %d state %d speed %d port %d level %d slot %d",
 		__entry->vdev, &__entry->in_ctx, &__entry->out_ctx,
 		__entry->devnum, __entry->state, __entry->speed,
 		__entry->portnum, __entry->level, __entry->slot_id
@@ -329,7 +329,7 @@ DECLARE_EVENT_CLASS(xhci_log_stream_ctx,
 		__entry->ctx_array_dma = info->ctx_array_dma + stream_id * 16;
 
 	),
-	TP_printk("stream %u ctx @%pad: SCT %llu deq %llx cycle %llu", __entry->stream_id,
+	TP_printk("stream %u ctx @%pad: SCT %llu deq 0x%llx cycle %llu", __entry->stream_id,
 		&__entry->ctx_array_dma, CTX_TO_SCT(__entry->stream_ring),
 		__entry->stream_ring & TR_DEQ_PTR_MASK,
 		__entry->stream_ring & EP_CTX_CYCLE_MASK
@@ -505,7 +505,7 @@ DECLARE_EVENT_CLASS(xhci_log_ring,
 		__entry->enq = xhci_trb_virt_to_dma(ring->enq_seg, ring->enqueue);
 		__entry->deq = xhci_trb_virt_to_dma(ring->deq_seg, ring->dequeue);
 	),
-	TP_printk("%s %p: enq %pad deq %pad segs %d stream %d bounce %d cycle %d",
+	TP_printk("%s %p: enq @%pad deq @%pad segs %d stream %d bounce %d cycle %d",
 			xhci_ring_type_string(__entry->type), __entry->ring,
 			&__entry->enq,
 			&__entry->deq,
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index c7fa82f8b853..17755a567c6c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -499,7 +499,7 @@ static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
 	crcr &= ~CMD_RING_CYCLE;
 	crcr |= xhci->cmd_ring->cycle_state;
 
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Command ring deq %pad running %u cycle %u",
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Command ring deq @%pad running %u cycle %u",
 		       &deq_dma, crcr & CMD_RING_RUNNING, xhci->cmd_ring->cycle_state);
 	xhci_write_64(xhci, crcr, &xhci->op_regs->cmd_ring);
 }
@@ -652,7 +652,7 @@ int xhci_run(struct usb_hcd *hcd)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xhci_run");
 
 	erdp = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "ERST ptr %llx DESI %llu EHB %llu",
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "ERST ptr 0x%llx DESI %llu EHB %llu",
 		       erdp & ERST_PTR_MASK, erdp & ERST_DESI_MASK, erdp & ERST_EHB);
 
 	xhci_set_interrupter_moderation(ir, xhci->imod_interval);
@@ -1822,7 +1822,7 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		dma_addr_t dma = xhci_trb_virt_to_dma(urb_priv->td[i].start_seg,
 						      urb_priv->td[i].start_trb);
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-				"Cancel URB %p, dev %s, ep 0x%x, starting at %pad",
+				"Cancel URB %p, dev %s, ep 0x%x, starting at @%pad",
 				urb, urb->dev->devpath,
 				urb->ep->desc.bEndpointAddress,
 				&dma);
@@ -4413,15 +4413,15 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 		goto out;
 	temp_64 = xhci_read_64(xhci, &xhci->op_regs->dcbaa_ptr);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
-			"Op regs DCBAA ptr = %#016llx", temp_64);
+			"Op regs DCBAA ptr = 0x%llx", temp_64);
 	dma = le64_to_cpu(xhci->dcbaa->dev_context_ptrs[udev->slot_id]);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
-		"Slot ID %d dcbaa entry @%p = %pad",
+		"Slot ID %d dcbaa entry %p = @%pad",
 		udev->slot_id,
 		&xhci->dcbaa->dev_context_ptrs[udev->slot_id],
 		&dma);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
-			"Output Context DMA address = %pad",
+			"Output Context DMA address = @%pad",
 			&virt_dev->out_ctx->dma);
 	trace_xhci_address_ctx(xhci, virt_dev->in_ctx,
 				le32_to_cpu(slot_ctx->dev_info) >> 27);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2662356d048e..f8d742695176 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2580,7 +2580,7 @@ static inline const char *xhci_decode_ep_context(char *str, u32 info,
 	ret += sprintf(str + ret, "interval %d us max ESIT payload %d CErr %d ",
 			(1 << interval) * 125, esit, cerr);
 
-	ret += sprintf(str + ret, "Type %s %sburst %d maxp %d deq %016llx cycle %llu",
+	ret += sprintf(str + ret, "Type %s %sburst %d maxp %d deq 0x%llx cycle %llu",
 			xhci_ep_type_string(ep_type), hid ? "HID" : "",
 			burst, maxp, deq & TR_DEQ_PTR_MASK, deq & EP_CTX_CYCLE_MASK);
 
-- 
2.50.1


