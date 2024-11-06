Return-Path: <linux-usb+bounces-17198-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5F9BE3F1
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 324CA1F24D2F
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0B61DE4FC;
	Wed,  6 Nov 2024 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6uBclax"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969E91DE4F8
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888004; cv=none; b=sqDNMxRChWTh9MIMelTysvrnbq636bUMvP+oYREGKpX3Gqb9O7a9RNjfo7P2pNxmfvgthOSf9JKvOmBvUoCSex2aU+DMMcE/BPr2meSfGmopRGtFuVe+m3OFIHsZsWmaR8Kzyg9jkT6tY2CQn1+jaY8vWv7UCLSDFJWV2ca2Z+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888004; c=relaxed/simple;
	bh=gONpo+NQLyP8LHQvHOxi5fG67GX5lX8ClVlcHb2k/jc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EX4FfEsPQIMoOe2u+0rb56sSWuAFcJqplNtwjFYo+kW6ahN16jQTnjXWiWowHNcpmFVeATZDkYW1b/S1MJuDWzhDoEaBEE9YXsXqIaa/lD7GyHBYkDloRkmGug6vYQDpKSO0rumgHPRNlaJGQiYrKfxOYYFRQywOEvcsJqwbdYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6uBclax; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730888002; x=1762424002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gONpo+NQLyP8LHQvHOxi5fG67GX5lX8ClVlcHb2k/jc=;
  b=D6uBclaxLz3mbK1H/4foiKweFstyPm0rdiXs4SvUfJCqu3v1lUFewkqd
   2Av6uD/dA4JgLfNRJ6djXBSgNh6ArjJdnoaFQFHZw7witCCemYcYhN9Fv
   h8iAnCxY3uvaIiuKZ1FHDxNGnw/kGQWndKzQE3xlgBIVpCw7oH2M7SXtn
   pDCDSQIlrkj2t89IqddGGGSp6u4kGq7Vg66pEqqUemY1P61jcopqMWrAu
   N+KwQIwjF+E+PJgYwo5MMvlyJspojqMm4luAjYAPhnqJwpoNVmCU2dN60
   gd+w9mdh1FnUyy72dwCFoztOWQceyvzxX4qVYC1CoZBxl7cI3MmIPzvLE
   A==;
X-CSE-ConnectionGUID: tvPvIGj+T3eVn0qgxHa8rQ==
X-CSE-MsgGUID: znmPF91QRTOFU45DMJ594w==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059451"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059451"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:22 -0800
X-CSE-ConnectionGUID: 17JZI5pdTH2VQGSghYdrMA==
X-CSE-MsgGUID: AwP4/93URpC3JQh/yo1XZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813328"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:21 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 23/33] usb: xhci: simplify TDs start and end naming scheme in struct 'xhci_td'
Date: Wed,  6 Nov 2024 12:14:49 +0200
Message-Id: <20241106101459.775897-24-mathias.nyman@linux.intel.com>
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

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Old names:
 * start_seg - last_trb_seg
 * first_trb - last_trb

New names:
 * start_seg - end_seg
 * start_trb - end_trb

A Transfer Descriptor (TD) in the xhci driver is a data structure that
represents a single transaction to be performed by the USB host controller.
This transaction is defined by TRBs from 'start_trb' in 'start_seg' to
'end_trb' in 'end_seg'.

The terms "start" and "end" were chosen  over "first" and "last" for ease
of searching within the codebase. The ring structure uses 'first_seg' and
'last_seg', while the TD structure uses 'start_seg' and 'end_seg'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 68 ++++++++++++++++++------------------
 drivers/usb/host/xhci.c      |  2 +-
 drivers/usb/host/xhci.h      |  6 ++--
 3 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 517df97ef496..1b4c785c8dad 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -660,8 +660,8 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 
 	/*
 	 * We want to find the pointer, segment and cycle state of the new trb
-	 * (the one after current TD's last_trb). We know the cycle state at
-	 * hw_dequeue, so walk the ring until both hw_dequeue and last_trb are
+	 * (the one after current TD's end_trb). We know the cycle state at
+	 * hw_dequeue, so walk the ring until both hw_dequeue and end_trb are
 	 * found.
 	 */
 	do {
@@ -671,7 +671,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 			if (td_last_trb_found)
 				break;
 		}
-		if (new_deq == td->last_trb)
+		if (new_deq == td->end_trb)
 			td_last_trb_found = true;
 
 		if (cycle_found && trb_is_link(new_deq) &&
@@ -744,16 +744,16 @@ static void td_to_noop(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 		       struct xhci_td *td, bool flip_cycle)
 {
 	struct xhci_segment *seg	= td->start_seg;
-	union xhci_trb *trb		= td->first_trb;
+	union xhci_trb *trb		= td->start_trb;
 
 	while (1) {
 		trb_to_noop(trb, TRB_TR_NOOP);
 
 		/* flip cycle if asked to */
-		if (flip_cycle && trb != td->first_trb && trb != td->last_trb)
+		if (flip_cycle && trb != td->start_trb && trb != td->end_trb)
 			trb->generic.field[3] ^= cpu_to_le32(TRB_CYCLE);
 
-		if (trb == td->last_trb)
+		if (trb == td->end_trb)
 			break;
 
 		next_trb(&seg, &trb);
@@ -978,7 +978,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			       "Removing canceled TD starting at 0x%llx (dma) in stream %u URB %p",
 			       (unsigned long long)xhci_trb_virt_to_dma(
-				       td->start_seg, td->first_trb),
+				       td->start_seg, td->start_trb),
 			       td->urb->stream_id, td->urb);
 		list_del_init(&td->td_list);
 		ring = xhci_urb_to_transfer_ring(xhci, td->urb);
@@ -2078,7 +2078,7 @@ struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td, dma_ad
 	dma_addr_t end_trb_dma;
 	struct xhci_segment *cur_seg;
 
-	start_dma = xhci_trb_virt_to_dma(td->start_seg, td->first_trb);
+	start_dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
 	cur_seg = td->start_seg;
 
 	do {
@@ -2088,7 +2088,7 @@ struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td, dma_ad
 		end_seg_dma = xhci_trb_virt_to_dma(cur_seg,
 				&cur_seg->trbs[TRBS_PER_SEGMENT - 1]);
 		/* If the end TRB isn't in this segment, this is set to 0 */
-		end_trb_dma = xhci_trb_virt_to_dma(cur_seg, td->last_trb);
+		end_trb_dma = xhci_trb_virt_to_dma(cur_seg, td->end_trb);
 
 		if (debug)
 			xhci_warn(xhci,
@@ -2230,7 +2230,7 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    !list_empty(&td->cancelled_td_list)) {
 				xhci_dbg(xhci, "Already resolving halted ep for 0x%llx\n",
 					 (unsigned long long)xhci_trb_virt_to_dma(
-						 td->start_seg, td->first_trb));
+						 td->start_seg, td->start_trb));
 				return 0;
 			}
 			/* endpoint not halted, don't reset it */
@@ -2262,8 +2262,8 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	}
 
 	/* Update ring dequeue pointer */
-	ep_ring->dequeue = td->last_trb;
-	ep_ring->deq_seg = td->last_trb_seg;
+	ep_ring->dequeue = td->end_trb;
+	ep_ring->deq_seg = td->end_seg;
 	inc_deq(xhci, ep_ring);
 
 	return xhci_td_cleanup(xhci, td, ep_ring, td->status);
@@ -2273,7 +2273,7 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 static u32 sum_trb_lengths(struct xhci_td *td, union xhci_trb *stop_trb)
 {
 	u32 sum;
-	union xhci_trb *trb = td->first_trb;
+	union xhci_trb *trb = td->start_trb;
 	struct xhci_segment *seg = td->start_seg;
 
 	for (sum = 0; trb != stop_trb; next_trb(&seg, &trb)) {
@@ -2428,7 +2428,7 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		fallthrough;
 	case COMP_ISOCH_BUFFER_OVERRUN:
 		frame->status = -EOVERFLOW;
-		if (ep_trb != td->last_trb)
+		if (ep_trb != td->end_trb)
 			td->error_mid_td = true;
 		break;
 	case COMP_INCOMPATIBLE_DEVICE_ERROR:
@@ -2438,7 +2438,7 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	case COMP_USB_TRANSACTION_ERROR:
 		frame->status = -EPROTO;
 		sum_trbs_for_length = true;
-		if (ep_trb != td->last_trb)
+		if (ep_trb != td->end_trb)
 			td->error_mid_td = true;
 		break;
 	case COMP_STOPPED:
@@ -2474,7 +2474,7 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 
 finish_td:
 	/* Don't give back TD yet if we encountered an error mid TD */
-	if (td->error_mid_td && ep_trb != td->last_trb) {
+	if (td->error_mid_td && ep_trb != td->end_trb) {
 		xhci_dbg(xhci, "Error mid isoc TD, wait for final completion event\n");
 		td->urb_length_set = true;
 		return 0;
@@ -2501,8 +2501,8 @@ static int skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
 	frame->actual_length = 0;
 
 	/* Update ring dequeue pointer */
-	ep->ring->dequeue = td->last_trb;
-	ep->ring->deq_seg = td->last_trb_seg;
+	ep->ring->dequeue = td->end_trb;
+	ep->ring->deq_seg = td->end_seg;
 	inc_deq(xhci, ep->ring);
 
 	return xhci_td_cleanup(xhci, td, ep->ring, status);
@@ -2529,7 +2529,7 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	case COMP_SUCCESS:
 		ep->err_count = 0;
 		/* handle success with untransferred data as short packet */
-		if (ep_trb != td->last_trb || remaining) {
+		if (ep_trb != td->end_trb || remaining) {
 			xhci_warn(xhci, "WARN Successful completion on short TX\n");
 			xhci_dbg(xhci, "ep %#x - asked for %d bytes, %d bytes untransferred\n",
 				 td->urb->ep->desc.bEndpointAddress,
@@ -2562,7 +2562,7 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	}
 
-	if (ep_trb == td->last_trb)
+	if (ep_trb == td->end_trb)
 		td->urb->actual_length = requested - remaining;
 	else
 		td->urb->actual_length =
@@ -2795,8 +2795,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	if (td && td->error_mid_td && !trb_in_td(xhci, td, ep_trb_dma, false)) {
 		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
-		ep_ring->dequeue = td->last_trb;
-		ep_ring->deq_seg = td->last_trb_seg;
+		ep_ring->dequeue = td->end_trb;
+		ep_ring->deq_seg = td->end_seg;
 		inc_deq(xhci, ep_ring);
 		xhci_td_cleanup(xhci, td, ep_ring, td->status);
 	}
@@ -3308,7 +3308,7 @@ static int prepare_transfer(struct xhci_hcd *xhci,
 	/* Add this TD to the tail of the endpoint ring's TD list */
 	list_add_tail(&td->td_list, &ep_ring->td_list);
 	td->start_seg = ep_ring->enq_seg;
-	td->first_trb = ep_ring->enqueue;
+	td->start_trb = ep_ring->enqueue;
 
 	return 0;
 }
@@ -3647,8 +3647,8 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 			field &= ~TRB_CHAIN;
 			field |= TRB_IOC;
 			more_trbs_coming = false;
-			td->last_trb = ring->enqueue;
-			td->last_trb_seg = ring->enq_seg;
+			td->end_trb = ring->enqueue;
+			td->end_seg = ring->enq_seg;
 			if (xhci_urb_suitable_for_idt(urb)) {
 				memcpy(&send_addr, urb->transfer_buffer,
 				       trb_buff_len);
@@ -3696,8 +3696,8 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		ret = prepare_transfer(xhci, xhci->devs[slot_id],
 				       ep_index, urb->stream_id,
 				       1, urb, 1, mem_flags);
-		urb_priv->td[1].last_trb = ring->enqueue;
-		urb_priv->td[1].last_trb_seg = ring->enq_seg;
+		urb_priv->td[1].end_trb = ring->enqueue;
+		urb_priv->td[1].end_seg = ring->enq_seg;
 		field = TRB_TYPE(TRB_NORMAL) | ring->cycle_state | TRB_IOC;
 		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(0), field);
 	}
@@ -3835,8 +3835,8 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	}
 
 	/* Save the DMA address of the last TRB in the TD */
-	td->last_trb = ep_ring->enqueue;
-	td->last_trb_seg = ep_ring->enq_seg;
+	td->end_trb = ep_ring->enqueue;
+	td->end_seg = ep_ring->enq_seg;
 
 	/* Queue status TRB - see Table 7 and sections 4.11.2.2 and 6.4.1.2.3 */
 	/* If the device sent data, the status stage is an OUT transfer */
@@ -4121,8 +4121,8 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				field |= TRB_CHAIN;
 			} else {
 				more_trbs_coming = false;
-				td->last_trb = ep_ring->enqueue;
-				td->last_trb_seg = ep_ring->enq_seg;
+				td->end_trb = ep_ring->enqueue;
+				td->end_seg = ep_ring->enq_seg;
 				field |= TRB_IOC;
 				if (trb_block_event_intr(xhci, num_tds, i, ir))
 					field |= TRB_BEI;
@@ -4188,14 +4188,14 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	/* Use the first TD as a temporary variable to turn the TDs we've queued
 	 * into No-ops with a software-owned cycle bit. That way the hardware
 	 * won't accidentally start executing bogus TDs when we partially
-	 * overwrite them.  td->first_trb and td->start_seg are already set.
+	 * overwrite them.  td->start_trb and td->start_seg are already set.
 	 */
-	urb_priv->td[0].last_trb = ep_ring->enqueue;
+	urb_priv->td[0].end_trb = ep_ring->enqueue;
 	/* Every TRB except the first & last will have its cycle bit flipped. */
 	td_to_noop(xhci, ep_ring, &urb_priv->td[0], true);
 
 	/* Reset the ring enqueue back to the first TRB and its cycle bit. */
-	ep_ring->enqueue = urb_priv->td[0].first_trb;
+	ep_ring->enqueue = urb_priv->td[0].start_trb;
 	ep_ring->enq_seg = urb_priv->td[0].start_seg;
 	ep_ring->cycle_state = start_cycle;
 	usb_hcd_unlink_urb_from_ep(bus_to_hcd(urb->dev->bus), urb);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ae16253b53fb..a5ac1e01f82d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1752,7 +1752,7 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 				urb->ep->desc.bEndpointAddress,
 				(unsigned long long) xhci_trb_virt_to_dma(
 					urb_priv->td[i].start_seg,
-					urb_priv->td[i].first_trb));
+					urb_priv->td[i].start_trb));
 
 	for (; i < urb_priv->num_tds; i++) {
 		td = &urb_priv->td[i];
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a0204e10486d..a0e992c3db0d 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1294,9 +1294,9 @@ struct xhci_td {
 	enum xhci_cancelled_td_status	cancel_status;
 	struct urb		*urb;
 	struct xhci_segment	*start_seg;
-	union xhci_trb		*first_trb;
-	union xhci_trb		*last_trb;
-	struct xhci_segment	*last_trb_seg;
+	union xhci_trb		*start_trb;
+	struct xhci_segment	*end_seg;
+	union xhci_trb		*end_trb;
 	struct xhci_segment	*bounce_seg;
 	/* actual_length of the URB has already been set */
 	bool			urb_length_set;
-- 
2.25.1


