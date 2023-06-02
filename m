Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12DB47204A3
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 16:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236066AbjFBOj3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 10:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236054AbjFBOj1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 10:39:27 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D16D1B3
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685716765; x=1717252765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IcvkshRp7Dbv/hartovyXleQlB+aS6huoPOOayPH+r4=;
  b=JfFdn/frMHCEYolbnfniLT8mmZydl9acUATtekRQb0LSnCP56xtnuGrk
   XBSdz9TkhjTejSCVS4vUZH1ttkF1TJSY9jaRIPRzA0brKXVNnv+V9XrMS
   ViINnrJpXUYvFyIHTe18seVdfvMO8mhIjhLFfK6Aax0o3yWOfumJlyBKm
   LRVMpxY7azsExp2i3YxQUB6WIZUjvp6kmEMxQUAL1w4LP2AsPWLcEukWT
   A8ftHm2BY8zqx21io2jC+oHELUrebKjCzl0fhp8wIFF3OGz3LgG1vixHm
   meoMmnEfaaPrs8Ez3o4Vh6VwNXXGThFZjZV3bNBq44oDUv+g+JZlPF1L5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358311282"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="358311282"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707877458"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="707877458"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 02 Jun 2023 07:39:03 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Miller Hunter <MillerH@hearthnhome.com>
Subject: [PATCH 07/11] xhci: Stop unnecessary tracking of free trbs in a ring
Date:   Fri,  2 Jun 2023 17:40:05 +0300
Message-Id: <20230602144009.1225632-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
References: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Trying to keep track of free trbs in a ring by adding and subtracting
deltas each time a enqueue or dequeue is increased or moved has proven to
be buggy and complicated, especially over long periods of time.

Recently a bug in counting free trbs was fixed, now taking into account
cancelled URBs that were turned into no-ops, preventing free_trbs to
slowly wander off causing unnecessary ring expansion. See
commit fe82f16aafda ("xhci: Fix incorrect tracking of free space on
transfer rings")

Turns out its a lot easier to just calculate the numer of free TRB
based on ring size and the current enqueue and dequeue pointer values.
This is currently only needed for the command ring as multi segment
transfer rings already ensures there is enough room the ring during
the ring expansion check.

We could get rid of the ring->num_trbs_free entry completely, but as
the xhci DbC code also uses it we don't clean that up in this patch.

Reported-by: Miller Hunter <MillerH@hearthnhome.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217242
Tested-by: Miller Hunter <MillerH@hearthnhome.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c   |  1 -
 drivers/usb/host/xhci-ring.c  | 75 +++++++++++++++--------------------
 drivers/usb/host/xhci-trace.h |  5 +--
 drivers/usb/host/xhci.h       |  3 +-
 4 files changed, 35 insertions(+), 49 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c6f3ef2334a3..a8e9a4bb1537 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -143,7 +143,6 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	xhci_link_segments(ring->enq_seg, first, ring->type, chain_links);
 	xhci_link_segments(last, next, ring->type, chain_links);
 	ring->num_segs += num_segs;
-	ring->num_trbs_free += (TRBS_PER_SEGMENT - 1) * num_segs;
 
 	if (ring->type != TYPE_EVENT && ring->enq_seg == ring->last_seg) {
 		ring->last_seg->trbs[TRBS_PER_SEGMENT-1].link.control
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 2722dca6218e..646ff125def5 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -174,12 +174,10 @@ void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring)
 
 	/* All other rings have link trbs */
 	if (!trb_is_link(ring->dequeue)) {
-		if (last_trb_on_seg(ring->deq_seg, ring->dequeue)) {
+		if (last_trb_on_seg(ring->deq_seg, ring->dequeue))
 			xhci_warn(xhci, "Missing link TRB at end of segment\n");
-		} else {
+		else
 			ring->dequeue++;
-			ring->num_trbs_free++;
-		}
 	}
 
 	while (trb_is_link(ring->dequeue)) {
@@ -221,9 +219,6 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	unsigned int link_trb_count = 0;
 
 	chain = le32_to_cpu(ring->enqueue->generic.field[3]) & TRB_CHAIN;
-	/* If this is not event ring, there is one less usable TRB */
-	if (!trb_is_link(ring->enqueue))
-		ring->num_trbs_free--;
 
 	if (last_trb_on_seg(ring->enq_seg, ring->enqueue)) {
 		xhci_err(xhci, "Tried to move enqueue past ring segment\n");
@@ -276,24 +271,40 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	trace_xhci_inc_enq(ring);
 }
 
-static int xhci_num_trbs_to(struct xhci_segment *start_seg, union xhci_trb *start,
-			    struct xhci_segment *end_seg, union xhci_trb *end,
-			    unsigned int num_segs)
+/*
+ * Return number of free normal TRBs from enqueue to dequeue pointer on ring.
+ * Not counting an assumed link TRB at end of each TRBS_PER_SEGMENT sized segment.
+ * Only for transfer and command rings where driver is the producer, not for
+ * event rings.
+ */
+static unsigned int xhci_num_trbs_free(struct xhci_hcd *xhci, struct xhci_ring *ring)
 {
+	struct xhci_segment *enq_seg = ring->enq_seg;
+	union xhci_trb *enq = ring->enqueue;
 	union xhci_trb *last_on_seg;
-	int num = 0;
+	unsigned int free = 0;
 	int i = 0;
 
+	/* Ring might be empty even if enq != deq if enq is left on a link trb */
+	if (trb_is_link(enq)) {
+		enq_seg = enq_seg->next;
+		enq = enq_seg->trbs;
+	}
+
+	/* Empty ring, common case, don't walk the segments */
+	if (enq == ring->dequeue)
+		return ring->num_segs * (TRBS_PER_SEGMENT - 1);
+
 	do {
-		if (start_seg == end_seg && end >= start)
-			return num + (end - start);
-		last_on_seg = &start_seg->trbs[TRBS_PER_SEGMENT - 1];
-		num += last_on_seg - start;
-		start_seg = start_seg->next;
-		start = start_seg->trbs;
-	} while (i++ <= num_segs);
-
-	return -EINVAL;
+		if (ring->deq_seg == enq_seg && ring->dequeue >= enq)
+			return free + (ring->dequeue - enq);
+		last_on_seg = &enq_seg->trbs[TRBS_PER_SEGMENT - 1];
+		free += last_on_seg - enq;
+		enq_seg = enq_seg->next;
+		enq = enq_seg->trbs;
+	} while (i++ <= ring->num_segs);
+
+	return free;
 }
 
 /*
@@ -1291,10 +1302,7 @@ static void update_ring_for_set_deq_completion(struct xhci_hcd *xhci,
 		unsigned int ep_index)
 {
 	union xhci_trb *dequeue_temp;
-	int num_trbs_free_temp;
-	bool revert = false;
 
-	num_trbs_free_temp = ep_ring->num_trbs_free;
 	dequeue_temp = ep_ring->dequeue;
 
 	/* If we get two back-to-back stalls, and the first stalled transfer
@@ -1310,7 +1318,6 @@ static void update_ring_for_set_deq_completion(struct xhci_hcd *xhci,
 
 	while (ep_ring->dequeue != dev->eps[ep_index].queued_deq_ptr) {
 		/* We have more usable TRBs */
-		ep_ring->num_trbs_free++;
 		ep_ring->dequeue++;
 		if (trb_is_link(ep_ring->dequeue)) {
 			if (ep_ring->dequeue ==
@@ -1320,15 +1327,10 @@ static void update_ring_for_set_deq_completion(struct xhci_hcd *xhci,
 			ep_ring->dequeue = ep_ring->deq_seg->trbs;
 		}
 		if (ep_ring->dequeue == dequeue_temp) {
-			revert = true;
+			xhci_dbg(xhci, "Unable to find new dequeue pointer\n");
 			break;
 		}
 	}
-
-	if (revert) {
-		xhci_dbg(xhci, "Unable to find new dequeue pointer\n");
-		ep_ring->num_trbs_free = num_trbs_free_temp;
-	}
 }
 
 /*
@@ -2183,7 +2185,6 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		     u32 trb_comp_code)
 {
 	struct xhci_ep_ctx *ep_ctx;
-	int trbs_freed;
 
 	ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep->ep_index);
 
@@ -2253,13 +2254,6 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	}
 
 	/* Update ring dequeue pointer */
-	trbs_freed = xhci_num_trbs_to(ep_ring->deq_seg, ep_ring->dequeue,
-				      td->last_trb_seg, td->last_trb,
-				      ep_ring->num_segs);
-	if (trbs_freed < 0)
-		xhci_dbg(xhci, "Failed to count freed trbs at TD finish\n");
-	else
-		ep_ring->num_trbs_free += trbs_freed;
 	ep_ring->dequeue = td->last_trb;
 	ep_ring->deq_seg = td->last_trb_seg;
 	inc_deq(xhci, ep_ring);
@@ -2483,7 +2477,6 @@ static int skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
 	/* Update ring dequeue pointer */
 	ep->ring->dequeue = td->last_trb;
 	ep->ring->deq_seg = td->last_trb_seg;
-	ep->ring->num_trbs_free += td->num_trbs - 1;
 	inc_deq(xhci, ep->ring);
 
 	return xhci_td_cleanup(xhci, td, ep->ring, status);
@@ -3227,7 +3220,7 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 
 	if (ep_ring != xhci->cmd_ring) {
 		new_segs = xhci_ring_expansion_needed(xhci, ep_ring, num_trbs);
-	} else if (ep_ring->num_trbs_free <= num_trbs) {
+	} else if (xhci_num_trbs_free(xhci, ep_ring) <= num_trbs) {
 		xhci_err(xhci, "Do not support expand command ring\n");
 		return -ENOMEM;
 	}
@@ -4205,7 +4198,6 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	ep_ring->enqueue = urb_priv->td[0].first_trb;
 	ep_ring->enq_seg = urb_priv->td[0].start_seg;
 	ep_ring->cycle_state = start_cycle;
-	ep_ring->num_trbs_free = ep_ring->num_trbs_free_temp;
 	usb_hcd_unlink_urb_from_ep(bus_to_hcd(urb->dev->bus), urb);
 	return ret;
 }
@@ -4287,7 +4279,6 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	}
 
 skip_start_over:
-	ep_ring->num_trbs_free_temp = ep_ring->num_trbs_free;
 
 	return xhci_queue_isoc_tx(xhci, mem_flags, urb, slot_id, ep_index);
 }
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 7555c4ea7c4b..d6b32f2ad90e 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -458,7 +458,6 @@ DECLARE_EVENT_CLASS(xhci_log_ring,
 		__field(unsigned int, num_segs)
 		__field(unsigned int, stream_id)
 		__field(unsigned int, cycle_state)
-		__field(unsigned int, num_trbs_free)
 		__field(unsigned int, bounce_buf_len)
 	),
 	TP_fast_assign(
@@ -469,18 +468,16 @@ DECLARE_EVENT_CLASS(xhci_log_ring,
 		__entry->enq_seg = ring->enq_seg->dma;
 		__entry->deq_seg = ring->deq_seg->dma;
 		__entry->cycle_state = ring->cycle_state;
-		__entry->num_trbs_free = ring->num_trbs_free;
 		__entry->bounce_buf_len = ring->bounce_buf_len;
 		__entry->enq = xhci_trb_virt_to_dma(ring->enq_seg, ring->enqueue);
 		__entry->deq = xhci_trb_virt_to_dma(ring->deq_seg, ring->dequeue);
 	),
-	TP_printk("%s %p: enq %pad(%pad) deq %pad(%pad) segs %d stream %d free_trbs %d bounce %d cycle %d",
+	TP_printk("%s %p: enq %pad(%pad) deq %pad(%pad) segs %d stream %d bounce %d cycle %d",
 			xhci_ring_type_string(__entry->type), __entry->ring,
 			&__entry->enq, &__entry->enq_seg,
 			&__entry->deq, &__entry->deq_seg,
 			__entry->num_segs,
 			__entry->stream_id,
-			__entry->num_trbs_free,
 			__entry->bounce_buf_len,
 			__entry->cycle_state
 		)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 56e318c384ff..456e1c8ca005 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1633,8 +1633,7 @@ struct xhci_ring {
 	u32			cycle_state;
 	unsigned int		stream_id;
 	unsigned int		num_segs;
-	unsigned int		num_trbs_free;
-	unsigned int		num_trbs_free_temp;
+	unsigned int		num_trbs_free; /* used only by xhci DbC */
 	unsigned int		bounce_buf_len;
 	enum xhci_ring_type	type;
 	bool			last_td_was_short;
-- 
2.25.1

