Return-Path: <linux-usb+bounces-30568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69298C63E82
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 12:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 430E64EDFE2
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 11:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEB632BF31;
	Mon, 17 Nov 2025 11:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDfpVKfF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D8032ABD0
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379825; cv=none; b=bPJTb6ouN9WJ3w3T6f49VWre04xQ37/pSxKGCZMFiumWYGvCcfIJbs76OXe6eveXzn2RnPBa6dM9ZnVBDlHlc9+5AO6XSG5klzIw0i2yOhIUVyocmvouJ0AdqeylZkjKxtZ0iaWtgBOIupi/qpFAYkl9mcsCcPyIyxwA4flQ7AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379825; c=relaxed/simple;
	bh=Wg6RSq7c+xK5i2jNQY1q2kk+kg0GHMBJhqsuLtVlwqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5Q+r3Et/zRV0+P6gyQePvBQzppeTDgr8pAxg8FOwAWMzgKAhnC/+HuPSxjew8iEwe44m8dURhLEr308PRd830GhDGKCO2OIDVctsB8WG1jcln+wFDsroRs184LSuWsMkzyAN7PbleEH3/2yAA6LB3nAAHjvlrXSGFT2hh0kVeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDfpVKfF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763379823; x=1794915823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wg6RSq7c+xK5i2jNQY1q2kk+kg0GHMBJhqsuLtVlwqY=;
  b=fDfpVKfFq7kOF6WmL6e0IoWCBNgL7H+1GJdmqMIPDCx8Y+sizbeWeoN8
   npJCt0OrLaZ8R7GXEVsNbos5lYKccYnwIjdlq0cJ2sfvkFHnZz4Fn1To4
   pHzlpTXsmJTduM583g0p7y3Az9yJR7g8vyjYQnYuxfoQ+jZdzxjJeBY+8
   JvGqXtWF/Xi1QFWRfzrlTWDMHXr10ETBv9QFOTj3DpFpV/BQ5ZGgRsHqK
   G5wFq+bjVkmuGopdodRbbflG68c6X3CJwO6CBWtIHwvxGRvYSGkbeJQpN
   vZY906KaRNFuQEle39Rq4XjhsJaMd/z1HqlFO8bXM9ZdCaW5c+S4l9NhQ
   Q==;
X-CSE-ConnectionGUID: b3QVvgtSTpqp+rKxCZ6kyg==
X-CSE-MsgGUID: sCLyOKyoS2e8+qoS0fb6xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76726936"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="76726936"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:43:42 -0800
X-CSE-ConnectionGUID: Ys1mEI9hSgGGzbAbPTnhnQ==
X-CSE-MsgGUID: LOo1QlvlQgqJUSPHXTwVQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189729292"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2025 03:43:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 50F3D96; Mon, 17 Nov 2025 12:43:40 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH 8/9] usb: xhci: remove redundant 'xhci' pointer from endpoint struct
Date: Mon, 17 Nov 2025 12:42:40 +0100
Message-ID: <20251117114242.3507856-9-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
References: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'xhci_virt_ep' struct currently contains a pointer to its parent
'xhci_hcd' struct. Since all endpoint-related structs are contained
within 'xhci_hcd', this pointer is redundant.

Remove the 'xhci' pointer from 'xhci_virt_ep' and instead pass it
explicitly to functions that require it, as some already do it.
This change reduces unnecessary complexity and aligns the code with
the rest of the xhci driver.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/usb/host/xhci-mem.c  |  1 -
 drivers/usb/host/xhci-ring.c | 53 +++++++++++++++++-------------------
 drivers/usb/host/xhci.c      |  2 +-
 drivers/usb/host/xhci.h      |  3 +-
 4 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index e52b1f8985c2..0e7d1a174f83 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1001,7 +1001,6 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	for (i = 0; i < 31; i++) {
 		dev->eps[i].ep_index = i;
 		dev->eps[i].vdev = dev;
-		dev->eps[i].xhci = xhci;
 		INIT_LIST_HEAD(&dev->eps[i].cancelled_td_list);
 		INIT_LIST_HEAD(&dev->eps[i].bw_endpoint_list);
 	}
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5294f7bd3eab..a49043a39a4d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -920,7 +920,7 @@ static void xhci_dequeue_td(struct xhci_hcd *xhci, struct xhci_td *td, struct xh
 }
 
 /* Complete the cancelled URBs we unlinked from td_list. */
-static void xhci_giveback_invalidated_tds(struct xhci_virt_ep *ep)
+static void xhci_giveback_invalidated_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep)
 {
 	struct xhci_ring *ring;
 	struct xhci_td *td, *tmp_td;
@@ -928,17 +928,17 @@ static void xhci_giveback_invalidated_tds(struct xhci_virt_ep *ep)
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list,
 				 cancelled_td_list) {
 
-		ring = xhci_urb_to_transfer_ring(ep->xhci, td->urb);
+		ring = xhci_urb_to_transfer_ring(xhci, td->urb);
 
 		if (td->cancel_status == TD_CLEARED) {
-			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
+			xhci_dbg(xhci, "%s: Giveback cancelled URB %p TD\n",
 				 __func__, td->urb);
-			xhci_td_cleanup(ep->xhci, td, ring, td->status);
+			xhci_td_cleanup(xhci, td, ring, td->status);
 		} else {
-			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
+			xhci_dbg(xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
 				 __func__, td->urb, td->cancel_status);
 		}
-		if (ep->xhci->xhc_state & XHCI_STATE_DYING)
+		if (xhci->xhc_state & XHCI_STATE_DYING)
 			return;
 	}
 }
@@ -1017,9 +1017,8 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
  * only call this when ring is not in a running state
  */
 
-static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
+static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep)
 {
-	struct xhci_hcd		*xhci;
 	struct xhci_td		*td = NULL;
 	struct xhci_td		*tmp_td = NULL;
 	struct xhci_td		*cached_td = NULL;
@@ -1035,8 +1034,6 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 	if (ep->ep_state & SET_DEQ_PENDING)
 		return 0;
 
-	xhci = ep->xhci;
-
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			       "Removing canceled TD starting at 0x%llx (dma) in stream %u URB %p",
@@ -1131,23 +1128,23 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
  *
  * Call under xhci->lock on a stopped endpoint.
  */
-void xhci_process_cancelled_tds(struct xhci_virt_ep *ep)
+void xhci_process_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep)
 {
-	xhci_invalidate_cancelled_tds(ep);
-	xhci_giveback_invalidated_tds(ep);
+	xhci_invalidate_cancelled_tds(xhci, ep);
+	xhci_giveback_invalidated_tds(xhci, ep);
 }
 
 /*
  * Returns the TD the endpoint ring halted on.
  * Only call for non-running rings without streams.
  */
-static struct xhci_td *find_halted_td(struct xhci_virt_ep *ep)
+static struct xhci_td *find_halted_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep)
 {
 	struct xhci_td	*td;
 	u64		hw_deq;
 
 	if (!list_empty(&ep->ring->td_list)) { /* Not streams compatible */
-		hw_deq = xhci_get_hw_deq(ep->xhci, ep->vdev, ep->ep_index, 0);
+		hw_deq = xhci_get_hw_deq(xhci, ep->vdev, ep->ep_index, 0);
 		hw_deq &= TR_DEQ_PTR_MASK;
 		td = list_first_entry(&ep->ring->td_list, struct xhci_td, td_list);
 		if (trb_in_td(td, hw_deq))
@@ -1222,7 +1219,7 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 				reset_type = EP_SOFT_RESET;
 			} else {
 				reset_type = EP_HARD_RESET;
-				td = find_halted_td(ep);
+				td = find_halted_td(xhci, ep);
 				if (td)
 					td->status = -EPROTO;
 			}
@@ -1281,11 +1278,11 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 	}
 
 	/* will queue a set TR deq if stopped on a cancelled, uncleared TD */
-	xhci_invalidate_cancelled_tds(ep);
+	xhci_invalidate_cancelled_tds(xhci, ep);
 	ep->ep_state &= ~EP_STOP_CMD_PENDING;
 
 	/* Otherwise ring the doorbell(s) to restart queued transfers */
-	xhci_giveback_invalidated_tds(ep);
+	xhci_giveback_invalidated_tds(xhci, ep);
 	xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 }
 
@@ -1507,14 +1504,14 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 	/* HW cached TDs cleared from cache, give them back */
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list,
 				 cancelled_td_list) {
-		ep_ring = xhci_urb_to_transfer_ring(ep->xhci, td->urb);
+		ep_ring = xhci_urb_to_transfer_ring(xhci, td->urb);
 		if (td->cancel_status == TD_CLEARING_CACHE) {
 			td->cancel_status = TD_CLEARED;
-			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
+			xhci_dbg(xhci, "%s: Giveback cancelled URB %p TD\n",
 				 __func__, td->urb);
-			xhci_td_cleanup(ep->xhci, td, ep_ring, td->status);
+			xhci_td_cleanup(xhci, td, ep_ring, td->status);
 		} else {
-			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
+			xhci_dbg(xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
 				 __func__, td->urb, td->cancel_status);
 		}
 	}
@@ -1525,16 +1522,16 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 
 	/* Check for deferred or newly cancelled TDs */
 	if (!list_empty(&ep->cancelled_td_list)) {
-		xhci_dbg(ep->xhci, "%s: Pending TDs to clear, continuing with invalidation\n",
+		xhci_dbg(xhci, "%s: Pending TDs to clear, continuing with invalidation\n",
 			 __func__);
-		xhci_invalidate_cancelled_tds(ep);
+		xhci_invalidate_cancelled_tds(xhci, ep);
 		/* Try to restart the endpoint if all is done */
 		xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 		/* Start giving back any TDs invalidated above */
-		xhci_giveback_invalidated_tds(ep);
+		xhci_giveback_invalidated_tds(xhci, ep);
 	} else {
 		/* Restart any rings with pending URBs */
-		xhci_dbg(ep->xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
+		xhci_dbg(xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
 		xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 	}
 }
@@ -1561,12 +1558,12 @@ static void xhci_handle_cmd_reset_ep(struct xhci_hcd *xhci, int slot_id,
 		"Ignoring reset ep completion code of %u", cmd_comp_code);
 
 	/* Cleanup cancelled TDs as ep is stopped. May queue a Set TR Deq cmd */
-	xhci_invalidate_cancelled_tds(ep);
+	xhci_invalidate_cancelled_tds(xhci, ep);
 
 	/* Clear our internal halted state */
 	ep->ep_state &= ~EP_HALTED;
 
-	xhci_giveback_invalidated_tds(ep);
+	xhci_giveback_invalidated_tds(xhci, ep);
 
 	/* if this was a soft reset, then restart */
 	if ((le32_to_cpu(trb->generic.field[3])) & TRB_TSP)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 04a9e9571384..2f6cf5047d40 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1844,7 +1844,7 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		/* and cancelled TDs can be given back right away */
 		xhci_dbg(xhci, "Invalidating TDs instantly on slot %d ep %d in state 0x%x\n",
 				urb->dev->slot_id, ep_index, ep->ep_state);
-		xhci_process_cancelled_tds(ep);
+		xhci_process_cancelled_tds(xhci, ep);
 	} else {
 		/* Otherwise, queue a new Stop Endpoint command */
 		command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 58a51f09cceb..7c811f524e48 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -676,7 +676,6 @@ struct xhci_virt_ep {
 #define EP_CLEARING_TT		(1 << 8)
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
-	struct xhci_hcd		*xhci;
 	/* Dequeue pointer and dequeue segment for a submitted Set TR Dequeue
 	 * command.  We'll need to update the ring's dequeue segment and dequeue
 	 * pointer after the command completes.
@@ -1954,7 +1953,7 @@ void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
 int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    int suspend, gfp_t gfp_flags);
-void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
+void xhci_process_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep);
 void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			      struct xhci_interrupter *ir,
 			      bool clear_ehb);
-- 
2.50.1


