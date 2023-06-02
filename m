Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0060720499
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 16:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236049AbjFBOj1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 10:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236040AbjFBOj0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 10:39:26 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A57399
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685716765; x=1717252765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KhW0va3LtHxC/RvB0/3Af4CpPZzZ7ffK25zEqzJxRYI=;
  b=RssZMAPX7xrG8zvl8uyRofTfFSKCjJE+tOBpAgcZgLu9MK1FbeAHh3IS
   5ZXjQqJkaxS2KwT9zEEe4BoY1qFVa+ao5HDTcv028DAZIJeQpo5j18BDU
   qmn53dtaVn196kBMtYIE81HhruVFbtNymAIBf6BdfP7BL92QhErcYpuu5
   SKRUAN58fqmad4JVuqv5FpUeIQ7CS8hVytuV2n/gBWKQWwa35vAJKntzM
   5/2L+ZLs1QhirqyCK4DoeHI4tyugpri2uKK+SciE/5yB4wJdNA4lj9AZe
   KW3mXpuGCR0IQHiemhx3LGYm4CPpubUSPBiNoCJhGboA/Q+14kOI9R2cg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358311273"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="358311273"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707877455"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="707877455"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 02 Jun 2023 07:39:01 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        chao zeng <chao.zengup@gmail.com>,
        Miller Hunter <MillerH@hearthnhome.com>
Subject: [PATCH 06/11] xhci: Fix transfer ring expansion size calculation
Date:   Fri,  2 Jun 2023 17:40:04 +0300
Message-Id: <20230602144009.1225632-7-mathias.nyman@linux.intel.com>
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

The amount of new TRBs needed is calculated incorrectly when expanding a
transfer ring.

The room_on_ring() helper will correctly report that the ring needs
expansion if the enqueue pointer is about to reach the dequeue segment.
If enqueue reaches the dequeue segment then there is no easy way
to expand the ring by adding new segments between enqueue and dequeue.

This leads to ring expansion even if num_trbs_free is larger than
num_trbs we are queueing.

As a result we try to store a negative number in a unsigned int, leading
to a huge percieved trb need, and doubling of ring size.

Rework and rename the room_on_ring() to a helper that checks if ring
needs expansion, and return number of new segments needed. Don't rely on
the tracked ring->num_trbs_free value as turns out it has been unreliable.
Use ring enqueue and dequeue positions to determine expansion need.

The unsigned int issue was first reported first Chao zeng, and a bit
later seen in a real world bug.

Reported-by: chao zeng <chao.zengup@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217242
Tested-by: Miller Hunter <MillerH@hearthnhome.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  | 14 ++------
 drivers/usb/host/xhci-ring.c | 64 +++++++++++++++++++++++-------------
 2 files changed, 45 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 2bf8121f4d36..c6f3ef2334a3 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -422,22 +422,14 @@ void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
  * Allocate a new ring which has same segment numbers and link the two rings.
  */
 int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
-				unsigned int num_trbs, gfp_t flags)
+				unsigned int num_new_segs, gfp_t flags)
 {
 	struct xhci_segment	*first;
 	struct xhci_segment	*last;
-	unsigned int		num_segs;
-	unsigned int		num_segs_needed;
 	int			ret;
 
-	num_segs_needed = (num_trbs + (TRBS_PER_SEGMENT - 1) - 1) /
-				(TRBS_PER_SEGMENT - 1);
-
-	/* Allocate number of segments we needed, or double the ring size */
-	num_segs = max(ring->num_segs, num_segs_needed);
-
 	ret = xhci_alloc_segments_for_ring(xhci, &first, &last,
-			num_segs, ring->cycle_state, ring->type,
+			num_new_segs, ring->cycle_state, ring->type,
 			ring->bounce_buf_len, flags);
 	if (ret)
 		return -ENOMEM;
@@ -457,7 +449,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		return ret;
 	}
 
-	xhci_link_rings(xhci, ring, first, last, num_segs);
+	xhci_link_rings(xhci, ring, first, last, num_new_segs);
 	trace_xhci_ring_expansion(ring);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_ring_expansion,
 			"ring expansion succeed, now has %d segments",
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 2bc82b3a2f98..2722dca6218e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -299,22 +299,45 @@ static int xhci_num_trbs_to(struct xhci_segment *start_seg, union xhci_trb *star
 /*
  * Check to see if there's room to enqueue num_trbs on the ring and make sure
  * enqueue pointer will not advance into dequeue segment. See rules above.
+ * return number of new segments needed to ensure this.
  */
-static inline int room_on_ring(struct xhci_hcd *xhci, struct xhci_ring *ring,
-		unsigned int num_trbs)
+
+static unsigned int xhci_ring_expansion_needed(struct xhci_hcd *xhci, struct xhci_ring *ring,
+					       unsigned int num_trbs)
 {
-	int num_trbs_in_deq_seg;
+	struct xhci_segment *seg;
+	int trbs_past_seg;
+	int enq_used;
+	int new_segs;
+
+	enq_used = ring->enqueue - ring->enq_seg->trbs;
 
-	if (ring->num_trbs_free < num_trbs)
+	/* how many trbs will be queued past the enqueue segment? */
+	trbs_past_seg = enq_used + num_trbs - (TRBS_PER_SEGMENT - 1);
+
+	if (trbs_past_seg <= 0)
 		return 0;
 
-	if (ring->type != TYPE_COMMAND && ring->type != TYPE_EVENT) {
-		num_trbs_in_deq_seg = ring->dequeue - ring->deq_seg->trbs;
-		if (ring->num_trbs_free < num_trbs + num_trbs_in_deq_seg)
-			return 0;
+	/* Empty ring special case, enqueue stuck on link trb while dequeue advanced */
+	if (trb_is_link(ring->enqueue) && ring->enq_seg->next->trbs == ring->dequeue)
+		return 0;
+
+	new_segs = 1 + (trbs_past_seg / (TRBS_PER_SEGMENT - 1));
+	seg = ring->enq_seg;
+
+	while (new_segs > 0) {
+		seg = seg->next;
+		if (seg == ring->deq_seg) {
+			xhci_dbg(xhci, "Ring expansion by %d segments needed\n",
+				 new_segs);
+			xhci_dbg(xhci, "Adding %d trbs moves enq %d trbs into deq seg\n",
+				 num_trbs, trbs_past_seg % TRBS_PER_SEGMENT);
+			return new_segs;
+		}
+		new_segs--;
 	}
 
-	return 1;
+	return 0;
 }
 
 /* Ring the host controller doorbell after placing a command on the ring */
@@ -3165,13 +3188,13 @@ static void queue_trb(struct xhci_hcd *xhci, struct xhci_ring *ring,
 
 /*
  * Does various checks on the endpoint ring, and makes it ready to queue num_trbs.
- * FIXME allocate segments if the ring is full.
+ * expand ring if it start to be full.
  */
 static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 		u32 ep_state, unsigned int num_trbs, gfp_t mem_flags)
 {
-	unsigned int num_trbs_needed;
 	unsigned int link_trb_count = 0;
+	unsigned int new_segs = 0;
 
 	/* Make sure the endpoint has been added to xHC schedule */
 	switch (ep_state) {
@@ -3202,20 +3225,17 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 		return -EINVAL;
 	}
 
-	while (1) {
-		if (room_on_ring(xhci, ep_ring, num_trbs))
-			break;
-
-		if (ep_ring == xhci->cmd_ring) {
-			xhci_err(xhci, "Do not support expand command ring\n");
-			return -ENOMEM;
-		}
+	if (ep_ring != xhci->cmd_ring) {
+		new_segs = xhci_ring_expansion_needed(xhci, ep_ring, num_trbs);
+	} else if (ep_ring->num_trbs_free <= num_trbs) {
+		xhci_err(xhci, "Do not support expand command ring\n");
+		return -ENOMEM;
+	}
 
+	if (new_segs) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_ring_expansion,
 				"ERROR no room on ep ring, try ring expansion");
-		num_trbs_needed = num_trbs - ep_ring->num_trbs_free;
-		if (xhci_ring_expansion(xhci, ep_ring, num_trbs_needed,
-					mem_flags)) {
+		if (xhci_ring_expansion(xhci, ep_ring, new_segs, mem_flags)) {
 			xhci_err(xhci, "Ring expansion failed\n");
 			return -ENOMEM;
 		}
-- 
2.25.1

