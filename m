Return-Path: <linux-usb+bounces-17186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2FF9BE3DF
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D350288F4F
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD661DE2B8;
	Wed,  6 Nov 2024 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZKfVfUR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A7D1DD0DB
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887985; cv=none; b=L08Hd3H/cpY/eKrT+Xx5YsOkxJRW9XghWP8GfG7DLenqKlk4jOJQXcyG3wRr9UDUZOFTSSYErSCWBf5QSQAA1mtPh84GAeKVQcnf2ZFaeB29spAhePkwk35QN4l7L1kKgNVJeCXiu7XSfyxUFA9cR8lw0Ig7nNBfULEQhfjbwKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887985; c=relaxed/simple;
	bh=WC6/nf2BOGDDQjQsq4+ooBCWTTiErA2rmahR0Xf4ejg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nll+hirTNbuhMq2YGGKsfBea4+HRMnAkucFOZwtQ8/FKUZEnMgb0KN/WYMIAox/CN6re8z0s4GNuRoYpgiVqJ26HqpcvmjA1VW2xD0PUrZH3G6qIkzF8TYBBSpOp+fNyM8xNnjY0vU5plB2gzi0c3U3IYoiKJXC4x2PQ44u83b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZKfVfUR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887983; x=1762423983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WC6/nf2BOGDDQjQsq4+ooBCWTTiErA2rmahR0Xf4ejg=;
  b=IZKfVfUR2/3rQDw+I3dVGNblqWC8zNIxTWkn2cF/Mc0I3fPK1ZWLAg9G
   MibUnN/5g3qEunZECoX+npzmWDiR+kF/kk7d8WTxyz8dq9Bzs0Cqob31p
   sjk+zP7SJFWP/cspTQOTJkIcgwMaqlTWUx2nTIdUBruWwSxrhIXDWDWQa
   PT4euOqp4JJUmROqeYTRigs9k2cIoCGt60S3aFNMCHaIrk73HTsTHPBVk
   MIyPhGAEENoAk4L9cG80m2ZrkiDOldcjOhgNk8CJMFqA9V5sssuAtlytM
   0+8LZfGsweA6+koRbOF6bDh5vl/r3e9hrgLWZYTcwA2k5xyhmQFwq/WCx
   g==;
X-CSE-ConnectionGUID: lEeRCUJ3RGKY4DTmU3Uf3g==
X-CSE-MsgGUID: wZDmIvNrQnCf8Jdc/UfM+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059398"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059398"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:03 -0800
X-CSE-ConnectionGUID: H7gtMiElRZeHF/H/pWqS1g==
X-CSE-MsgGUID: D5BwygplR+2SIUBtvyA+Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813101"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:02 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/33] usb: xhci: remove option to change a default ring's TRB cycle bit
Date: Wed,  6 Nov 2024 12:14:37 +0200
Message-Id: <20241106101459.775897-12-mathias.nyman@linux.intel.com>
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

The TRB cycle bit indicates TRB ownership by the Host Controller (HC) or
Host Controller Driver (HCD). New rings are initialized with 'cycle_state'
equal to one, and all its TRBs' cycle bits are set to zero. When handling
ring expansion, set the source ring cycle bits to the same value as the
destination ring.

Move the cycle bit setting from xhci_segment_alloc() to xhci_link_rings(),
and remove the 'cycle_state' argument from xhci_initialize_ring_info().
The xhci_segment_alloc() function uses kzalloc_node() to allocate segments,
ensuring that all TRB cycle bits are initialized to zero.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c |  2 +-
 drivers/usb/host/xhci-mem.c    | 50 ++++++++++++++++------------------
 drivers/usb/host/xhci.c        |  2 +-
 drivers/usb/host/xhci.h        |  6 ++--
 4 files changed, 27 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 408082372be1..227e513867dd 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -472,7 +472,7 @@ xhci_dbc_ring_alloc(struct device *dev, enum xhci_ring_type type, gfp_t flags)
 		trb->link.control = cpu_to_le32(LINK_TOGGLE | TRB_TYPE(TRB_LINK));
 	}
 	INIT_LIST_HEAD(&ring->td_list);
-	xhci_initialize_ring_info(ring, 1);
+	xhci_initialize_ring_info(ring);
 	return ring;
 dma_fail:
 	kfree(seg);
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7aee76f846bc..164b22d0b475 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -27,14 +27,12 @@
  * "All components of all Command and Transfer TRBs shall be initialized to '0'"
  */
 static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
-					       unsigned int cycle_state,
 					       unsigned int max_packet,
 					       unsigned int num,
 					       gfp_t flags)
 {
 	struct xhci_segment *seg;
 	dma_addr_t	dma;
-	int		i;
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 
 	seg = kzalloc_node(sizeof(*seg), flags, dev_to_node(dev));
@@ -56,11 +54,6 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 			return NULL;
 		}
 	}
-	/* If the cycle state is 0, set the cycle bit to 1 for all the TRBs */
-	if (cycle_state == 0) {
-		for (i = 0; i < TRBS_PER_SEGMENT; i++)
-			seg->trbs[i].link.control = cpu_to_le32(TRB_CYCLE);
-	}
 	seg->num = num;
 	seg->dma = dma;
 	seg->next = NULL;
@@ -138,6 +131,14 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 
 	chain_links = xhci_link_chain_quirk(xhci, ring->type);
 
+	/* If the cycle state is 0, set the cycle bit to 1 for all the TRBs */
+	if (ring->cycle_state == 0) {
+		xhci_for_each_ring_seg(ring->first_seg, seg) {
+			for (int i = 0; i < TRBS_PER_SEGMENT; i++)
+				seg->trbs[i].link.control |= cpu_to_le32(TRB_CYCLE);
+		}
+	}
+
 	next = ring->enq_seg->next;
 	xhci_link_segments(ring->enq_seg, first, ring->type, chain_links);
 	xhci_link_segments(last, next, ring->type, chain_links);
@@ -287,8 +288,7 @@ void xhci_ring_free(struct xhci_hcd *xhci, struct xhci_ring *ring)
 	kfree(ring);
 }
 
-void xhci_initialize_ring_info(struct xhci_ring *ring,
-			       unsigned int cycle_state)
+void xhci_initialize_ring_info(struct xhci_ring *ring)
 {
 	/* The ring is empty, so the enqueue pointer == dequeue pointer */
 	ring->enqueue = ring->first_seg->trbs;
@@ -302,7 +302,7 @@ void xhci_initialize_ring_info(struct xhci_ring *ring,
 	 * New rings are initialized with cycle state equal to 1; if we are
 	 * handling ring expansion, set the cycle state equal to the old ring.
 	 */
-	ring->cycle_state = cycle_state;
+	ring->cycle_state = 1;
 
 	/*
 	 * Each segment has a link TRB, and leave an extra TRB for SW
@@ -317,7 +317,6 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 					struct xhci_segment **first,
 					struct xhci_segment **last,
 					unsigned int num_segs,
-					unsigned int cycle_state,
 					enum xhci_ring_type type,
 					unsigned int max_packet,
 					gfp_t flags)
@@ -328,7 +327,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 
 	chain_links = xhci_link_chain_quirk(xhci, type);
 
-	prev = xhci_segment_alloc(xhci, cycle_state, max_packet, num, flags);
+	prev = xhci_segment_alloc(xhci, max_packet, num, flags);
 	if (!prev)
 		return -ENOMEM;
 	num++;
@@ -337,8 +336,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 	while (num < num_segs) {
 		struct xhci_segment	*next;
 
-		next = xhci_segment_alloc(xhci, cycle_state, max_packet, num,
-					  flags);
+		next = xhci_segment_alloc(xhci, max_packet, num, flags);
 		if (!next)
 			goto free_segments;
 
@@ -363,9 +361,8 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
  * Set the end flag and the cycle toggle bit on the last segment.
  * See section 4.9.1 and figures 15 and 16.
  */
-struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci,
-		unsigned int num_segs, unsigned int cycle_state,
-		enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
+struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
+				  enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
 {
 	struct xhci_ring	*ring;
 	int ret;
@@ -383,7 +380,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci,
 		return ring;
 
 	ret = xhci_alloc_segments_for_ring(xhci, &ring->first_seg, &ring->last_seg, num_segs,
-					   cycle_state, type, max_packet, flags);
+					   type, max_packet, flags);
 	if (ret)
 		goto fail;
 
@@ -393,7 +390,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci,
 		ring->last_seg->trbs[TRBS_PER_SEGMENT - 1].link.control |=
 			cpu_to_le32(LINK_TOGGLE);
 	}
-	xhci_initialize_ring_info(ring, cycle_state);
+	xhci_initialize_ring_info(ring);
 	trace_xhci_ring_alloc(ring);
 	return ring;
 
@@ -421,8 +418,8 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	struct xhci_segment	*last;
 	int			ret;
 
-	ret = xhci_alloc_segments_for_ring(xhci, &first, &last, num_new_segs, ring->cycle_state,
-					   ring->type, ring->bounce_buf_len, flags);
+	ret = xhci_alloc_segments_for_ring(xhci, &first, &last, num_new_segs, ring->type,
+					   ring->bounce_buf_len, flags);
 	if (ret)
 		return -ENOMEM;
 
@@ -632,8 +629,7 @@ struct xhci_stream_info *xhci_alloc_stream_info(struct xhci_hcd *xhci,
 
 	for (cur_stream = 1; cur_stream < num_streams; cur_stream++) {
 		stream_info->stream_rings[cur_stream] =
-			xhci_ring_alloc(xhci, 2, 1, TYPE_STREAM, max_packet,
-					mem_flags);
+			xhci_ring_alloc(xhci, 2, TYPE_STREAM, max_packet, mem_flags);
 		cur_ring = stream_info->stream_rings[cur_stream];
 		if (!cur_ring)
 			goto cleanup_rings;
@@ -976,7 +972,7 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	}
 
 	/* Allocate endpoint 0 ring */
-	dev->eps[0].ring = xhci_ring_alloc(xhci, 2, 1, TYPE_CTRL, 0, flags);
+	dev->eps[0].ring = xhci_ring_alloc(xhci, 2, TYPE_CTRL, 0, flags);
 	if (!dev->eps[0].ring)
 		goto fail;
 
@@ -1453,7 +1449,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 
 	/* Set up the endpoint ring */
 	virt_dev->eps[ep_index].new_ring =
-		xhci_ring_alloc(xhci, 2, 1, ring_type, max_packet, mem_flags);
+		xhci_ring_alloc(xhci, 2, ring_type, max_packet, mem_flags);
 	if (!virt_dev->eps[ep_index].new_ring)
 		return -ENOMEM;
 
@@ -2263,7 +2259,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	if (!ir)
 		return NULL;
 
-	ir->event_ring = xhci_ring_alloc(xhci, segs, 1, TYPE_EVENT, 0, flags);
+	ir->event_ring = xhci_ring_alloc(xhci, segs, TYPE_EVENT, 0, flags);
 	if (!ir->event_ring) {
 		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
 		kfree(ir);
@@ -2465,7 +2461,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		goto fail;
 
 	/* Set up the command ring to have one segments for now. */
-	xhci->cmd_ring = xhci_ring_alloc(xhci, 1, 1, TYPE_COMMAND, 0, flags);
+	xhci->cmd_ring = xhci_ring_alloc(xhci, 1, TYPE_COMMAND, 0, flags);
 	if (!xhci->cmd_ring)
 		goto fail;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 44e4ae201048..aa8c877f47ac 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -790,7 +790,7 @@ static void xhci_clear_command_ring(struct xhci_hcd *xhci)
 		seg->trbs[TRBS_PER_SEGMENT - 1].link.control &= cpu_to_le32(~TRB_CYCLE);
 	}
 
-	xhci_initialize_ring_info(ring, 1);
+	xhci_initialize_ring_info(ring);
 	/*
 	 * Reset the hardware dequeue pointer.
 	 * Yes, this will need to be re-written after resume, but we're paranoid
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 753d9343a4b1..d3b250c736b8 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1795,14 +1795,12 @@ void xhci_slot_copy(struct xhci_hcd *xhci,
 int xhci_endpoint_init(struct xhci_hcd *xhci, struct xhci_virt_device *virt_dev,
 		struct usb_device *udev, struct usb_host_endpoint *ep,
 		gfp_t mem_flags);
-struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci,
-		unsigned int num_segs, unsigned int cycle_state,
+struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 		enum xhci_ring_type type, unsigned int max_packet, gfp_t flags);
 void xhci_ring_free(struct xhci_hcd *xhci, struct xhci_ring *ring);
 int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		unsigned int num_trbs, gfp_t flags);
-void xhci_initialize_ring_info(struct xhci_ring *ring,
-			unsigned int cycle_state);
+void xhci_initialize_ring_info(struct xhci_ring *ring);
 void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		unsigned int ep_index);
-- 
2.25.1


