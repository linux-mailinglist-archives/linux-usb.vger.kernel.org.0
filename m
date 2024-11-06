Return-Path: <linux-usb+bounces-17180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F81A9BE3D7
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C9B5B24060
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A04C1DDC1D;
	Wed,  6 Nov 2024 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRq83RB5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B071D5CFA
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887975; cv=none; b=tDlEZPgJ6r+AuG5kDQt8cKptQ8bcI++48R4YsAbp6p8ubaEc/IIsZMUUrZAmTM4o/iv99I/cWO28E/wEudUTc2YTaN5zXRvbt2cUtbFkpp18F1usnOu3jCAYAWA7VLNFZUwJR1Urol8V47UEEMTbuZAq8iLm2yoCG5FmiJO/3aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887975; c=relaxed/simple;
	bh=YwNTSmCBJIhCKRvabu2AlIea+OD0lW7NV+J3yN/BtBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MX2AQCHC3o7wMvCDJpV1HTOVgce0yP6PGlTHCkv3VSLxH9wvR7E3shVaXIVnLszBAJ6moE+t0wf28jO8SzdEjjVCYe3B1uZevHa3C2IhRQQ3nZ1pVB+itGx0fjfC+9WTgcmqaT1Y9GeIEpKzJ9LBiel5QOpdt+UUd1YLBM5sGyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRq83RB5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887973; x=1762423973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YwNTSmCBJIhCKRvabu2AlIea+OD0lW7NV+J3yN/BtBs=;
  b=mRq83RB5VazYVgfqFZqKNHPiR1EwbTqeoB/Zya9OSlj9dOZYjU5jnIcJ
   Op4LzhOt0bchlOXPaw5twciwxQvhoua5ARmeh4FpFrFMJx5Twal48siC5
   A7MtqEVSR2njuY1zkuhNcA3k02OFUmCbNFJ0sSrw/G3JZvxl7vYoeNtqs
   MwXLY1wkNJV/w3heMc6o6wNxjEsXBF+MICccsltyprVnnD8Vp+WHCjOPd
   71PzTUyDTioRvUIYf/qm9uprYEtVcgjtcPxH3Yx4/sh+XLeKqXI5RumL0
   nfH2lHnRK+s0bRbTXYRTmMDYfhC9uIYPvr91DJjVMBUAAy15iWwq3USls
   A==;
X-CSE-ConnectionGUID: nWGK4roaQHSce3D/MzpTYw==
X-CSE-MsgGUID: vSTSnYfqSRCpNGLJrYMkuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059383"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059383"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:12:53 -0800
X-CSE-ConnectionGUID: WbDlIzZQQD6QCul+r28TdA==
X-CSE-MsgGUID: VXQC7AqiSOyITEFSKVHPAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84812955"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:12:52 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/33] xhci: show DMA address of TRB when tracing TRBs
Date: Wed,  6 Nov 2024 12:14:31 +0200
Message-Id: <20241106101459.775897-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
References: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA address of a queued TRB is essential when looking at traces as
both transfer events and command completion events refer to the command
or transfer based on its DMA address.

Previously the TRB address was figured out from xhci_inc_enq and
xhci_inc_deq trace entries seen after queuing or handlong a TRB.

Now that DMA address is shown in TRB tracing we can get rid of most of the
xhci_inc_enq and xhci_inc_deq traces thus decreasing trace size.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 11 ++++++----
 drivers/usb/host/xhci-ring.c   | 11 ++++++----
 drivers/usb/host/xhci-trace.h  | 38 +++++++++++++++++++---------------
 3 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 241d7aa1fbc2..408082372be1 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -248,8 +248,9 @@ xhci_dbc_queue_trb(struct xhci_ring *ring, u32 field1,
 	trb->generic.field[2]	= cpu_to_le32(field3);
 	trb->generic.field[3]	= cpu_to_le32(field4);
 
-	trace_xhci_dbc_gadget_ep_queue(ring, &trb->generic);
-
+	trace_xhci_dbc_gadget_ep_queue(ring, &trb->generic,
+				       xhci_trb_virt_to_dma(ring->enq_seg,
+							    ring->enqueue));
 	ring->num_trbs_free--;
 	next = ++(ring->enqueue);
 	if (TRB_TYPE_LINK_LE32(next->link.control)) {
@@ -747,7 +748,7 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 		return;
 	}
 
-	trace_xhci_dbc_handle_transfer(ring, &req->trb->generic);
+	trace_xhci_dbc_handle_transfer(ring, &req->trb->generic, req->trb_dma);
 
 	switch (comp_code) {
 	case COMP_SUCCESS:
@@ -898,7 +899,9 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 		 */
 		rmb();
 
-		trace_xhci_dbc_handle_event(dbc->ring_evt, &evt->generic);
+		trace_xhci_dbc_handle_event(dbc->ring_evt, &evt->generic,
+					    xhci_trb_virt_to_dma(dbc->ring_evt->deq_seg,
+								 dbc->ring_evt->dequeue));
 
 		switch (le32_to_cpu(evt->event_cmd.flags) & TRB_TYPE_BITMASK) {
 		case TRB_TYPE(TRB_PORT_STATUS):
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f1176c270c43..3c19f58fcefd 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1714,7 +1714,7 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 	cmd_dma = le64_to_cpu(event->cmd_trb);
 	cmd_trb = xhci->cmd_ring->dequeue;
 
-	trace_xhci_handle_command(xhci->cmd_ring, &cmd_trb->generic);
+	trace_xhci_handle_command(xhci->cmd_ring, &cmd_trb->generic, cmd_dma);
 
 	cmd_comp_code = GET_COMP_CODE(le32_to_cpu(event->status));
 
@@ -2886,7 +2886,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		ep_ring->last_td_was_short = false;
 
 	ep_trb = &ep_seg->trbs[(ep_trb_dma - ep_seg->dma) / sizeof(*ep_trb)];
-	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb);
+	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb, ep_trb_dma);
 
 	/*
 	 * No-op TRB could trigger interrupts in a case where a URB was killed
@@ -2936,7 +2936,9 @@ static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter
 {
 	u32 trb_type;
 
-	trace_xhci_handle_event(ir->event_ring, &event->generic);
+	trace_xhci_handle_event(ir->event_ring, &event->generic,
+				xhci_trb_virt_to_dma(ir->event_ring->deq_seg,
+						     ir->event_ring->dequeue));
 
 	/*
 	 * Barrier between reading the TRB_CYCLE (valid) flag before, and any
@@ -3159,7 +3161,8 @@ static void queue_trb(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	wmb();
 	trb->field[3] = cpu_to_le32(field4);
 
-	trace_xhci_queue_trb(ring, trb);
+	trace_xhci_queue_trb(ring, trb,
+			     xhci_trb_virt_to_dma(ring->enq_seg, ring->enqueue));
 
 	inc_enq(xhci, ring, more_trbs_coming);
 }
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 24405315ffe6..cc916e58a329 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -108,9 +108,10 @@ DEFINE_EVENT(xhci_log_ctx, xhci_address_ctx,
 );
 
 DECLARE_EVENT_CLASS(xhci_log_trb,
-	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb),
-	TP_ARGS(ring, trb),
+	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb, dma_addr_t dma),
+	TP_ARGS(ring, trb, dma),
 	TP_STRUCT__entry(
+		__field(dma_addr_t, dma)
 		__field(u32, type)
 		__field(u32, field0)
 		__field(u32, field1)
@@ -118,51 +119,54 @@ DECLARE_EVENT_CLASS(xhci_log_trb,
 		__field(u32, field3)
 	),
 	TP_fast_assign(
+		__entry->dma = dma;
 		__entry->type = ring->type;
 		__entry->field0 = le32_to_cpu(trb->field[0]);
 		__entry->field1 = le32_to_cpu(trb->field[1]);
 		__entry->field2 = le32_to_cpu(trb->field[2]);
 		__entry->field3 = le32_to_cpu(trb->field[3]);
 	),
-	TP_printk("%s: %s", xhci_ring_type_string(__entry->type),
+	TP_printk("%s: @%pad %s",
+		  xhci_ring_type_string(__entry->type), &__entry->dma,
 		  xhci_decode_trb(__get_buf(XHCI_MSG_MAX), XHCI_MSG_MAX, __entry->field0,
 				  __entry->field1, __entry->field2, __entry->field3)
 	)
 );
 
 DEFINE_EVENT(xhci_log_trb, xhci_handle_event,
-	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb),
-	TP_ARGS(ring, trb)
+	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb, dma_addr_t dma),
+	TP_ARGS(ring, trb, dma)
 );
 
 DEFINE_EVENT(xhci_log_trb, xhci_handle_command,
-	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb),
-	TP_ARGS(ring, trb)
+	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb, dma_addr_t dma),
+	TP_ARGS(ring, trb, dma)
 );
 
 DEFINE_EVENT(xhci_log_trb, xhci_handle_transfer,
-	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb),
-	TP_ARGS(ring, trb)
+	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb, dma_addr_t dma),
+	TP_ARGS(ring, trb, dma)
 );
 
 DEFINE_EVENT(xhci_log_trb, xhci_queue_trb,
-	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb),
-	TP_ARGS(ring, trb)
+	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb, dma_addr_t dma),
+	TP_ARGS(ring, trb, dma)
+
 );
 
 DEFINE_EVENT(xhci_log_trb, xhci_dbc_handle_event,
-	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb),
-	TP_ARGS(ring, trb)
+	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb, dma_addr_t dma),
+	TP_ARGS(ring, trb, dma)
 );
 
 DEFINE_EVENT(xhci_log_trb, xhci_dbc_handle_transfer,
-	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb),
-	TP_ARGS(ring, trb)
+	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb, dma_addr_t dma),
+	TP_ARGS(ring, trb, dma)
 );
 
 DEFINE_EVENT(xhci_log_trb, xhci_dbc_gadget_ep_queue,
-	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb),
-	TP_ARGS(ring, trb)
+	TP_PROTO(struct xhci_ring *ring, struct xhci_generic_trb *trb, dma_addr_t dma),
+	TP_ARGS(ring, trb, dma)
 );
 
 DECLARE_EVENT_CLASS(xhci_log_free_virt_dev,
-- 
2.25.1


