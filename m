Return-Path: <linux-usb+bounces-17189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 058419BE3E2
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD7FA288DCD
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BC21DE2D6;
	Wed,  6 Nov 2024 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Es7U3Mpp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380531DE2CE
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887989; cv=none; b=PGbt1jvE3SXPBBeaDDWrwb7F7KJosLEYc3Qd1af9QUfl101Tro9jc1f3EdxMjSYkW8+TLModcB3194tpiqjHzYZO84UznYzfly/12XY+7tHxwB+UXAQUciKq/banG9wVUW3ixbyQefo9aMzYWGv6zJ7qZyL5C3oWjtA+Jd1rzkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887989; c=relaxed/simple;
	bh=eR9pmUpBhVx8M9XsTa01F8PlrKft7ELS7RikpxpVPL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e9TFA+Oisc22m9H0YOm9MtdwkOYSZ6MZ8OOGCHETKu+R6i2sX6Hqp1Vb44ZdUXdk4I82eOMO4x1+QksOvlqea2NDgGBIRyRnvemKraJOP0st3EPiw0jie/op3dLsTkrOu4cfIkbRZ1cTut2p7B+xIWNjVEcuzBeocptiLZEXZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Es7U3Mpp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887988; x=1762423988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eR9pmUpBhVx8M9XsTa01F8PlrKft7ELS7RikpxpVPL0=;
  b=Es7U3Mppbuzsu/alDtOYSSHHosczuda93QACUzkUNG3mMB2BcVwTWJR/
   mJeBzqNFMcQrFBWqtyBnvxCWZ5fmanuMCWsf2nvGapBZOkp9ITiNSlJpW
   3y2knVtjC9T12W2n47gkm++TJ2EqP0P5w6PUwD4+yKcHED4pCdhfeGdPR
   NkNWiQPL6bwmpRnON4B0fZBxWMs3wU5AsPuMREexbW/2ozRmWhwOFYsWZ
   2icVo68YaMVcPavdj05Q5v/+SM1Gkg4j82/H8FfrZiHvZ4lg1dv7HTasI
   +1Hx47VMhp/CNURly0QoytRtBjNT3W4iGpSoCUDQueCpHbQEYo2SxsxUB
   g==;
X-CSE-ConnectionGUID: S+lQsZngR5idzX2xwExLQg==
X-CSE-MsgGUID: SdIE8KOuSHG83lvrA+GZSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059406"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059406"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:07 -0800
X-CSE-ConnectionGUID: KhlALhZ4TwSSuirzPUBWAg==
X-CSE-MsgGUID: xIJKpqFBQw2JEBhiU/CoUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813155"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:06 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/33] usb: xhci: refactor xhci_link_rings() to use source and destination rings
Date: Wed,  6 Nov 2024 12:14:40 +0200
Message-Id: <20241106101459.775897-15-mathias.nyman@linux.intel.com>
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

Refactor the xhci_link_rings() function to accept two rings: a source ring
and a destination ring. Previously, the function accepted a ring and a
segment list as arguments, now the function splices the source ring segment
list into the destination ring. This new approach reduces the number of
arguments and simplifies the code, making it easier to follow.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 40 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index e46be4c49b2f..feeaafc59a39 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -116,45 +116,42 @@ static void xhci_link_segments(struct xhci_segment *prev,
 }
 
 /*
- * Link the ring to the new segments.
+ * Link the src ring segments to the dst ring.
  * Set Toggle Cycle for the new ring if needed.
  */
-static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
-		struct xhci_segment *first, struct xhci_segment *last,
-		unsigned int num_segs)
+static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *src, struct xhci_ring *dst)
 {
-	struct xhci_segment *next, *seg;
+	struct xhci_segment *seg;
 	bool chain_links;
 
-	if (!ring || !first || !last)
+	if (!src || !dst)
 		return;
 
-	chain_links = xhci_link_chain_quirk(xhci, ring->type);
+	chain_links = xhci_link_chain_quirk(xhci, dst->type);
 
 	/* If the cycle state is 0, set the cycle bit to 1 for all the TRBs */
-	if (ring->cycle_state == 0) {
-		xhci_for_each_ring_seg(ring->first_seg, seg) {
+	if (dst->cycle_state == 0) {
+		xhci_for_each_ring_seg(src->first_seg, seg) {
 			for (int i = 0; i < TRBS_PER_SEGMENT; i++)
 				seg->trbs[i].link.control |= cpu_to_le32(TRB_CYCLE);
 		}
 	}
 
-	next = ring->enq_seg->next;
-	xhci_link_segments(ring->enq_seg, first, ring->type, chain_links);
-	xhci_link_segments(last, next, ring->type, chain_links);
-	ring->num_segs += num_segs;
+	xhci_link_segments(src->last_seg, dst->enq_seg->next, dst->type, chain_links);
+	xhci_link_segments(dst->enq_seg, src->first_seg, dst->type, chain_links);
+	dst->num_segs += src->num_segs;
 
-	if (ring->enq_seg == ring->last_seg) {
-		if (ring->type != TYPE_EVENT) {
-			ring->last_seg->trbs[TRBS_PER_SEGMENT-1].link.control
+	if (dst->enq_seg == dst->last_seg) {
+		if (dst->type != TYPE_EVENT) {
+			dst->last_seg->trbs[TRBS_PER_SEGMENT-1].link.control
 				&= ~cpu_to_le32(LINK_TOGGLE);
-			last->trbs[TRBS_PER_SEGMENT-1].link.control
+			src->last_seg->trbs[TRBS_PER_SEGMENT-1].link.control
 				|= cpu_to_le32(LINK_TOGGLE);
 		}
-		ring->last_seg = last;
+		dst->last_seg = src->last_seg;
 	}
 
-	for (seg = ring->enq_seg; seg != ring->last_seg; seg = seg->next)
+	for (seg = dst->enq_seg; seg != dst->last_seg; seg = seg->next)
 		seg->next->num = seg->num + 1;
 }
 
@@ -411,6 +408,9 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	struct xhci_ring new_ring;
 	int ret;
 
+	if (num_new_segs == 0)
+		return 0;
+
 	new_ring.num_segs = num_new_segs;
 	new_ring.bounce_buf_len = ring->bounce_buf_len;
 	new_ring.type = ring->type;
@@ -425,7 +425,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 			goto free_segments;
 	}
 
-	xhci_link_rings(xhci, ring, new_ring.first_seg, new_ring.last_seg, num_new_segs);
+	xhci_link_rings(xhci, ring, &new_ring);
 	trace_xhci_ring_expansion(ring);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_ring_expansion,
 			"ring expansion succeed, now has %d segments",
-- 
2.25.1


