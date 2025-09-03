Return-Path: <linux-usb+bounces-27503-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 50886B4277E
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 19:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD7E44E2AB0
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 17:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C270031DD9A;
	Wed,  3 Sep 2025 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1dj9COa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4931A06F
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 17:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918913; cv=none; b=E3aHDHaRRi8Beh3uQ8W6rL6pbfyZvWlydKjqAO5E/mqo7HNfsAGvt+gxbWyG9BmEM1c1W44Y102AtXOXs00MCAyt5+RnmK+bdlaAWSBF5n25E4OA/uDBJRgiNhyECEGs3Cp5Zm0MYPFNhYmvy1MTiSG4/0GoeBlIGadMOJG9y04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918913; c=relaxed/simple;
	bh=0boz0uehtJlCQiZbsVAGTCAzb9xSwFuKzEEyn2MMWAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lr+Kd/8I7pSckRcLnP7pb2btUJAobmtBKmWJ2vpBz7cClBtsnyPDo7UGkMY6yv3frkClZxMBEt4iXKM+idHNkWHfplAiEFJGSG07I7KsKXFJxO1GSiDtPYFt75uOvRp/162p3VbIlupNMt90/8h5M7Hu3+ZptpqQzg8YjKIW8Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1dj9COa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756918912; x=1788454912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0boz0uehtJlCQiZbsVAGTCAzb9xSwFuKzEEyn2MMWAw=;
  b=l1dj9COaBtCQTFJfo/dE9Jd5sf8EKGFhisVXI1/4KXvuLmCFDcoDAaIx
   Fpk6l0AGNyiOUXRV8N2Yz0E4SFVSvxqNnbDepFiMN9/n09bR9J7wSVzQ2
   QieUjCR54i9vswFJBFPSUjx/zPiBVN0GqGyxEaB4FGIp9NW+F0egdnt1g
   +C6eEIKzdhu05ok+MKBL+QPCHdv2d4Ps2ZM720sQAVy9+ijDKJgt0Wm3K
   4yXFehaUOgIRmGrlbgG8hUzS7sD/ZHsmluf6JmVomNhLVh2AvBrVY5Xds
   v+CgQNO7Q1drjtbzKcObdhSGERnBRUFD2FTSgNdzALvgIeqaUt9hNtmRT
   A==;
X-CSE-ConnectionGUID: +95qb5QTTHy5jnqm4lmKAA==
X-CSE-MsgGUID: cJSVsj7bQxGXot3pwZu8+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76687951"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="76687951"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 10:01:51 -0700
X-CSE-ConnectionGUID: GEpkxafZQIqH9KlEWOWZ+Q==
X-CSE-MsgGUID: jq7H1NdfSnWNi0nvaeQmKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="176007529"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2025 10:01:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 2D95895; Wed, 03 Sep 2025 19:01:48 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address printing
Date: Wed,  3 Sep 2025 19:01:22 +0200
Message-ID: <20250903170127.2190730-3-niklas.neronin@linux.intel.com>
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

Switch all printing of DMA addresses to '%pad' specifier. This specifier
ensures that the address is printed correctly, regardless of whether the
kernel is running in a 32-bit or 64-bit environment.

This patch exclusively modifies variables that are DMA addresses.
Subsequent patches will address variables that partially contain DMA
addresses.

Remove "offset" from dbg trace concerning URBs TD start addresses.
Prefix "0x" is automatically added by '%pad'.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c   |  4 ++--
 drivers/usb/host/xhci-ring.c  | 33 ++++++++++++++++-----------------
 drivers/usb/host/xhci-trace.h | 30 +++++++++++++++---------------
 drivers/usb/host/xhci.c       | 23 ++++++++++++-----------
 4 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 07289333a1e8..2a414dee7233 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1015,10 +1015,10 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 
 	/* Point to output device context in dcbaa. */
 	xhci->dcbaa->dev_context_ptrs[slot_id] = cpu_to_le64(dev->out_ctx->dma);
-	xhci_dbg(xhci, "Set slot id %d dcbaa entry %p to 0x%llx\n",
+	xhci_dbg(xhci, "Set slot id %d dcbaa entry %p to %pad\n",
 		 slot_id,
 		 &xhci->dcbaa->dev_context_ptrs[slot_id],
-		 le64_to_cpu(xhci->dcbaa->dev_context_ptrs[slot_id]));
+		 &dev->out_ctx->dma);
 
 	trace_xhci_alloc_virt_device(dev);
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d2ccf19292aa..7d57e2a3abf3 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -781,7 +781,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	ep->queued_deq_ptr = new_deq;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-		       "Set TR Deq ptr 0x%llx, cycle %u\n", addr, new_cycle);
+		       "Set TR Deq ptr %pad, cycle %u\n", &addr, new_cycle);
 
 	/* Stop the TD queueing code from ringing the doorbell until
 	 * this command completes.  The HC won't set the dequeue pointer
@@ -1035,6 +1035,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 	u64			hw_deq;
 	unsigned int		slot_id = ep->vdev->slot_id;
 	int			err;
+	dma_addr_t		dma;
 
 	/*
 	 * This is not going to work if the hardware is changing its dequeue
@@ -1046,11 +1047,10 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 	xhci = ep->xhci;
 
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
+		dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-			       "Removing canceled TD starting at 0x%llx (dma) in stream %u URB %p",
-			       (unsigned long long)xhci_trb_virt_to_dma(
-				       td->start_seg, td->start_trb),
-			       td->urb->stream_id, td->urb);
+			       "Removing canceled TD starting at %pad (dma) in stream %u URB %p",
+			       &dma, td->urb->stream_id, td->urb);
 		list_del_init(&td->td_list);
 		ring = xhci_urb_to_transfer_ring(xhci, td->urb);
 		if (!ring) {
@@ -2217,6 +2217,7 @@ static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		      u32 trb_comp_code)
 {
 	struct xhci_ep_ctx *ep_ctx;
+	dma_addr_t dma;
 
 	ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep->ep_index);
 
@@ -2252,9 +2253,8 @@ static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			 */
 			if ((ep->ep_state & EP_HALTED) &&
 			    !list_empty(&td->cancelled_td_list)) {
-				xhci_dbg(xhci, "Already resolving halted ep for 0x%llx\n",
-					 (unsigned long long)xhci_trb_virt_to_dma(
-						 td->start_seg, td->start_trb));
+				dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
+				xhci_dbg(xhci, "Already resolving halted ep for %pad\n", &dma);
 				return;
 			}
 			/* endpoint not halted, don't reset it */
@@ -2654,7 +2654,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	unsigned int slot_id;
 	int ep_index;
 	struct xhci_td *td = NULL;
-	dma_addr_t ep_trb_dma;
+	dma_addr_t ep_trb_dma, deq, td_start, td_end;
 	struct xhci_segment *ep_seg;
 	union xhci_trb *ep_trb;
 	int status = -EINPROGRESS;
@@ -2976,18 +2976,17 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	return 0;
 
 debug_finding_td:
-	xhci_err(xhci, "Event dma %pad for ep %d status %d not part of TD at %016llx - %016llx\n",
-		 &ep_trb_dma, ep_index, trb_comp_code,
-		 (unsigned long long)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
-		 (unsigned long long)xhci_trb_virt_to_dma(td->end_seg, td->end_trb));
+	td_start = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
+	td_end = xhci_trb_virt_to_dma(td->end_seg, td->end_trb);
+	xhci_err(xhci, "Event dma %pad for ep %d status %d not part of TD at %pad - %pad\n",
+		 &ep_trb_dma, ep_index, trb_comp_code, &td_start, &td_end);
 
 	return -ESHUTDOWN;
 
 err_out:
-	xhci_err(xhci, "@%016llx %08x %08x %08x %08x\n",
-		 (unsigned long long) xhci_trb_virt_to_dma(
-			 ir->event_ring->deq_seg,
-			 ir->event_ring->dequeue),
+	deq = xhci_trb_virt_to_dma(ir->event_ring->deq_seg, ir->event_ring->dequeue);
+	xhci_err(xhci, "@%pad %08x %08x %08x %08x\n",
+		 &deq,
 		 lower_32_bits(le64_to_cpu(event->buffer)),
 		 upper_32_bits(le64_to_cpu(event->buffer)),
 		 le32_to_cpu(event->transfer_len),
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index bfb5c5c17012..8451e9386aa9 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -95,9 +95,9 @@ DECLARE_EVENT_CLASS(xhci_log_ctx,
 			((HCC_64BYTE_CONTEXT(xhci->hcc_params) + 1) * 32) *
 			((ctx->type == XHCI_CTX_TYPE_INPUT) + ep_num + 1));
 	),
-	TP_printk("ctx_64=%d, ctx_type=%u, ctx_dma=@%llx, ctx_va=@%p",
+	TP_printk("ctx_64=%d, ctx_type=%u, ctx_dma=@%pad, ctx_va=@%p",
 			__entry->ctx_64, __entry->ctx_type,
-			(unsigned long long) __entry->ctx_dma, __entry->ctx_va
+			&__entry->ctx_dma, __entry->ctx_va
 	)
 );
 
@@ -174,22 +174,22 @@ DECLARE_EVENT_CLASS(xhci_log_free_virt_dev,
 	TP_ARGS(vdev),
 	TP_STRUCT__entry(
 		__field(void *, vdev)
-		__field(unsigned long long, out_ctx)
-		__field(unsigned long long, in_ctx)
+		__field(dma_addr_t, out_ctx)
+		__field(dma_addr_t, in_ctx)
 		__field(int, slot_id)
 		__field(u16, current_mel)
 
 	),
 	TP_fast_assign(
 		__entry->vdev = vdev;
-		__entry->in_ctx = (unsigned long long) vdev->in_ctx->dma;
-		__entry->out_ctx = (unsigned long long) vdev->out_ctx->dma;
+		__entry->in_ctx = vdev->in_ctx->dma;
+		__entry->out_ctx = vdev->out_ctx->dma;
 		__entry->slot_id = (int) vdev->slot_id;
 		__entry->current_mel = (u16) vdev->current_mel;
 		),
-	TP_printk("vdev %p slot %d ctx %llx | %llx current_mel %d",
-		__entry->vdev, __entry->slot_id, __entry->in_ctx,
-		__entry->out_ctx, __entry->current_mel
+	TP_printk("vdev %p slot %d ctx %pad | %pad current_mel %d",
+		__entry->vdev, __entry->slot_id, &__entry->in_ctx,
+		&__entry->out_ctx, __entry->current_mel
 	)
 );
 
@@ -203,8 +203,8 @@ DECLARE_EVENT_CLASS(xhci_log_virt_dev,
 	TP_ARGS(vdev),
 	TP_STRUCT__entry(
 		__field(void *, vdev)
-		__field(unsigned long long, out_ctx)
-		__field(unsigned long long, in_ctx)
+		__field(dma_addr_t, out_ctx)
+		__field(dma_addr_t, in_ctx)
 		__field(int, devnum)
 		__field(int, state)
 		__field(int, speed)
@@ -214,8 +214,8 @@ DECLARE_EVENT_CLASS(xhci_log_virt_dev,
 	),
 	TP_fast_assign(
 		__entry->vdev = vdev;
-		__entry->in_ctx = (unsigned long long) vdev->in_ctx->dma;
-		__entry->out_ctx = (unsigned long long) vdev->out_ctx->dma;
+		__entry->in_ctx = vdev->in_ctx->dma;
+		__entry->out_ctx = vdev->out_ctx->dma;
 		__entry->devnum = vdev->udev->devnum;
 		__entry->state = vdev->udev->state;
 		__entry->speed = vdev->udev->speed;
@@ -223,8 +223,8 @@ DECLARE_EVENT_CLASS(xhci_log_virt_dev,
 		__entry->level = vdev->udev->level;
 		__entry->slot_id = vdev->udev->slot_id;
 	),
-	TP_printk("vdev %p ctx %llx | %llx num %d state %d speed %d port %d level %d slot %d",
-		__entry->vdev, __entry->in_ctx, __entry->out_ctx,
+	TP_printk("vdev %p ctx %pad | %pad num %d state %d speed %d port %d level %d slot %d",
+		__entry->vdev, &__entry->in_ctx, &__entry->out_ctx,
 		__entry->devnum, __entry->state, __entry->speed,
 		__entry->portnum, __entry->level, __entry->slot_id
 	)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 47151ca527bf..5e5681c1eb4e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1818,15 +1818,15 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	}
 
 	i = urb_priv->num_tds_done;
-	if (i < urb_priv->num_tds)
+	if (i < urb_priv->num_tds) {
+		dma_addr_t dma = xhci_trb_virt_to_dma(urb_priv->td[i].start_seg,
+						      urb_priv->td[i].start_trb);
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-				"Cancel URB %p, dev %s, ep 0x%x, "
-				"starting at offset 0x%llx",
+				"Cancel URB %p, dev %s, ep 0x%x, starting at %pad",
 				urb, urb->dev->devpath,
 				urb->ep->desc.bEndpointAddress,
-				(unsigned long long) xhci_trb_virt_to_dma(
-					urb_priv->td[i].start_seg,
-					urb_priv->td[i].start_trb));
+				&dma);
+	}
 
 	for (; i < urb_priv->num_tds; i++) {
 		td = &urb_priv->td[i];
@@ -4273,6 +4273,7 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 	struct xhci_input_control_ctx *ctrl_ctx;
 	u64 temp_64;
 	struct xhci_command *command = NULL;
+	dma_addr_t dma;
 
 	mutex_lock(&xhci->mutex);
 
@@ -4413,15 +4414,15 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 	temp_64 = xhci_read_64(xhci, &xhci->op_regs->dcbaa_ptr);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
 			"Op regs DCBAA ptr = %#016llx", temp_64);
+	dma = le64_to_cpu(xhci->dcbaa->dev_context_ptrs[udev->slot_id]);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
-		"Slot ID %d dcbaa entry @%p = %#016llx",
+		"Slot ID %d dcbaa entry @%p = %pad",
 		udev->slot_id,
 		&xhci->dcbaa->dev_context_ptrs[udev->slot_id],
-		(unsigned long long)
-		le64_to_cpu(xhci->dcbaa->dev_context_ptrs[udev->slot_id]));
+		&dma);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
-			"Output Context DMA address = %#08llx",
-			(unsigned long long)virt_dev->out_ctx->dma);
+			"Output Context DMA address = %pad",
+			&virt_dev->out_ctx->dma);
 	trace_xhci_address_ctx(xhci, virt_dev->in_ctx,
 				le32_to_cpu(slot_ctx->dev_info) >> 27);
 	/*
-- 
2.50.1


