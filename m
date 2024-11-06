Return-Path: <linux-usb+bounces-17191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 913679BE3E4
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 062B6B2408D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9271DE3AC;
	Wed,  6 Nov 2024 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Um445cZB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EC41DD537
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887992; cv=none; b=kWfbj3RRFnortc7zhnGHqE17hy3PjxQ/y9mPbD8PlULEtG/qTvXHX98R6Fx6sUjKo3lgc8pC7y4Pf7cJweU72olidogjvMOHnPC1KOVTAq3C3daX68mEoqYxM2wmjxZ35D9vtNrjO7VeKu+s3lzzEiVR+wMFj7od1lDKKNdN3/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887992; c=relaxed/simple;
	bh=kkHWmyXJy0HdUsS/++nlJ0JmFvVwf5miCIM3dcybubk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZrrfnrOkRTenEKoMnd6USrgAfAKhQdr8IiL60sfijB5RSEkSsv/D7W3tJQL89G+hEsi2fr/oEGDubydLExQhpnLFI7tIrbPji1X7YZY8VKOGxN3dM2gSrRXlyj6ZaWr1gDKMtvbNWvsP0xEVIA2DwSc416ZWIYVhY45g2yCkO2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Um445cZB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887990; x=1762423990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kkHWmyXJy0HdUsS/++nlJ0JmFvVwf5miCIM3dcybubk=;
  b=Um445cZBKm23LAfCZsI2C8donBNqXB4qXqXiwAb34iOQW7WIoqQDA9Fx
   WMS8FaykgxcIkVtfomjfwDPE3fz1zJel47SoCOZK/lkE9B3QhBhgVHIgD
   QcpHqUTNdYwUjZARTglD+3A+HxkbdtZoXLKnEv5D93UldXhxqg5K5rZ4C
   oLWGAO2xWMHuzK8HsR7anPWROw10XkcB1HKu5nSB+2jPJMR35/hJ/xQLj
   2IJ1tzwKGtbF8fdbi8A5HwJKQKU8Gjt1mD0DVwC6ghkKVkf1N3PMgaoAr
   rloyt9TzNu5AQlSxTXdyc0t5Xu+94uGURS4qSb8dO52z2+/Mzx5qU1h3f
   Q==;
X-CSE-ConnectionGUID: 7cSQ3wS/RCOjXZZeRo9b8g==
X-CSE-MsgGUID: JNHl0439RP68FZQe879XJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059414"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059414"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:10 -0800
X-CSE-ConnectionGUID: 9OhLQKgoR1GJo69GE1NuWQ==
X-CSE-MsgGUID: Hnj9PPuRSoCLG9TPepa7aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813200"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:09 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 16/33] usb: xhci: add xhci_initialize_ring_segments()
Date: Wed,  6 Nov 2024 12:14:42 +0200
Message-Id: <20241106101459.775897-17-mathias.nyman@linux.intel.com>
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

A ring consists of a list of segments, each containing a specific number of
TRBs. The xhci driver allocates and initializes ring segments and TRBs in
the same functions. This combined allocation and initialization process
leads to an issue where, after hibernation (S4 state), the xhci driver
frees all its memory and re-creates the rings, segments, and TRBs from
scratch.

Move all default ring segment initialization into function
xhci_initialize_ring_segments(). This function can be called to
reinitialize a ring without freeing and reallocating it.

Since xhci_alloc_segments_for_ring() no longer initializes segment TRBs,
xhci_initialize_ring_segments() is added to xhci_ring_expansion(). This
results in the last segment of the source ring having the 'LINK_TOGGLE'
bit set. Therefore, if the last source ring segment is not the last in
the destination ring, the 'LINK_TOGGLE' bit must be cleared.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 41 +++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 41a5e67e1c4f..4295e9a4de50 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -113,6 +113,22 @@ static void xhci_set_link_trb(struct xhci_segment *seg, bool chain_links)
 	trb->link.segment_ptr = cpu_to_le64(seg->next->dma);
 }
 
+static void xhci_initialize_ring_segments(struct xhci_hcd *xhci, struct xhci_ring *ring)
+{
+	struct xhci_segment *seg;
+	bool chain_links;
+
+	if (ring->type == TYPE_EVENT)
+		return;
+
+	chain_links = xhci_link_chain_quirk(xhci, ring->type);
+	xhci_for_each_ring_seg(ring->first_seg, seg)
+		xhci_set_link_trb(seg, chain_links);
+
+	/* See section 4.9.2.1 and 6.4.4.1 */
+	ring->last_seg->trbs[TRBS_PER_SEGMENT - 1].link.control |= cpu_to_le32(LINK_TOGGLE);
+}
+
 /*
  * Link the src ring segments to the dst ring.
  * Set Toggle Cycle for the new ring if needed.
@@ -143,13 +159,13 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *src, struct
 	dst->num_segs += src->num_segs;
 
 	if (dst->enq_seg == dst->last_seg) {
-		if (dst->type != TYPE_EVENT) {
+		if (dst->type != TYPE_EVENT)
 			dst->last_seg->trbs[TRBS_PER_SEGMENT-1].link.control
 				&= ~cpu_to_le32(LINK_TOGGLE);
-			src->last_seg->trbs[TRBS_PER_SEGMENT-1].link.control
-				|= cpu_to_le32(LINK_TOGGLE);
-		}
+
 		dst->last_seg = src->last_seg;
+	} else if (dst->type != TYPE_EVENT) {
+		src->last_seg->trbs[TRBS_PER_SEGMENT-1].link.control &= ~cpu_to_le32(LINK_TOGGLE);
 	}
 
 	for (seg = dst->enq_seg; seg != dst->last_seg; seg = seg->next)
@@ -315,9 +331,6 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 {
 	struct xhci_segment *prev;
 	unsigned int num = 0;
-	bool chain_links;
-
-	chain_links = xhci_link_chain_quirk(xhci, ring->type);
 
 	prev = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
 	if (!prev)
@@ -333,17 +346,12 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 			goto free_segments;
 
 		prev->next = next;
-		if (ring->type != TYPE_EVENT)
-			xhci_set_link_trb(prev, chain_links);
 		prev = next;
 		num++;
 	}
 	ring->last_seg = prev;
 
 	ring->last_seg->next = ring->first_seg;
-	if (ring->type != TYPE_EVENT)
-		xhci_set_link_trb(prev, chain_links);
-
 	return 0;
 
 free_segments:
@@ -381,12 +389,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 	if (ret)
 		goto fail;
 
-	/* Only event ring does not use link TRB */
-	if (type != TYPE_EVENT) {
-		/* See section 4.9.2.1 and 6.4.4.1 */
-		ring->last_seg->trbs[TRBS_PER_SEGMENT - 1].link.control |=
-			cpu_to_le32(LINK_TOGGLE);
-	}
+	xhci_initialize_ring_segments(xhci, ring);
 	xhci_initialize_ring_info(ring);
 	trace_xhci_ring_alloc(ring);
 	return ring;
@@ -424,6 +427,8 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	if (ret)
 		return -ENOMEM;
 
+	xhci_initialize_ring_segments(xhci, &new_ring);
+
 	if (ring->type == TYPE_STREAM) {
 		ret = xhci_update_stream_segment_mapping(ring->trb_address_map, ring,
 							 new_ring.first_seg, flags);
-- 
2.25.1


