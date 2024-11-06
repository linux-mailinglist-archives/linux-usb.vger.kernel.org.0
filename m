Return-Path: <linux-usb+bounces-17190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6909BE3E3
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6332B240AD
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238ED1DDC24;
	Wed,  6 Nov 2024 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deLVDVYb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5381DDC14
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887990; cv=none; b=Kk7Ej4SjnV5yC/nwMBuggZbQUIiOGAQH1L+rI25K4H6dDhXSlwPgGDAys6V9gBe2X4cGAPqX6/OqOLs/rZi8i8qmPznvE5UZ+kmjhHO1OmkYG6mw0zmnBR18OR2aGC4Ve9YMhmr3OcC/BxKz6ewzofc2a6rxSuBa6YQ+X9MvoaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887990; c=relaxed/simple;
	bh=MWEbtlNk+V1RcX++gdHwtGcECRqEjmn9l8e1/UkhEeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WrpamBOXo50SXakpNSViulVYu0E1/CURTfYBXgO/Ilh5Iz8MFKWKh1eW2yaQ7feNnCxhXXs63RnqG0lesOTnVrlcxnDakQfhkbFxJM5KRczAfdPw1XS48Yeu9tV9okK9Mjx2H43FEHgmFQHsCG9WLicoLSJNDzpzcytGkfL8XEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deLVDVYb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887989; x=1762423989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MWEbtlNk+V1RcX++gdHwtGcECRqEjmn9l8e1/UkhEeQ=;
  b=deLVDVYbA1Rre6eg5aqdIRpqp21L0mfzXwFlNUU4IlOWN6xQpZkqokup
   5YmR2tdNS+QJvtllJZcSb0w1Wug3RJHPGm0Am3LjrOjH9jlgHkKsKmrfI
   nzmmemzpJTi+yXb6Bg0CGCvvRKyDwpevg/DK6ex/FEt9sze7XqlsBmX6a
   trOTZRXUdu0XXxgJPXXJ/OlK2G7ecoSPJpFQCag0wnff0SyT2oFwK7pem
   jqxtQErX2oEn6XauXBSVWAAhJz+Xg5DV2Zlj7iNMYU9tKEYPZIcMm/pCb
   dippNhi2lRr0zTTuiHoqQN56htO05s7SxliwgNnkf4PsTxeExzzPvc1Bb
   w==;
X-CSE-ConnectionGUID: x2WPy/CHTHGpjUwPP7haiQ==
X-CSE-MsgGUID: 1zsYDEGHSQ+59a4ntgG06w==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059410"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059410"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:09 -0800
X-CSE-ConnectionGUID: jRzEHzSeRFW7ufpo4MwXUA==
X-CSE-MsgGUID: P5YlzJieQEucnPgfdi7rfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813185"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:08 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 15/33] usb: xhci: rework xhci_link_segments()
Date: Wed,  6 Nov 2024 12:14:41 +0200
Message-Id: <20241106101459.775897-16-mathias.nyman@linux.intel.com>
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

Prepare for splitting ring segments allocation and initialization by
reworking the xhci_link_segments() function. Segment linking and ring type
checks are moved out of xhci_link_segments(), and the function is renamed
to "xhci_set_link_trb()".

The goal is to keep ring linking within xhci_alloc_segments_for_ring() and
move initialization into a separate function.

Additionally, reorder and simplify xhci_set_link_trb() for better
readability.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 54 ++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index feeaafc59a39..41a5e67e1c4f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -86,33 +86,31 @@ static void xhci_ring_segments_free(struct xhci_hcd *xhci, struct xhci_ring *rin
 }
 
 /*
- * Make the prev segment point to the next segment.
+ * Only for transfer and command rings where driver is the producer, not for
+ * event rings.
  *
- * Change the last TRB in the prev segment to be a Link TRB which points to the
+ * Change the last TRB in the segment to be a Link TRB which points to the
  * DMA address of the next segment.  The caller needs to set any Link TRB
  * related flags, such as End TRB, Toggle Cycle, and no snoop.
  */
-static void xhci_link_segments(struct xhci_segment *prev,
-			       struct xhci_segment *next,
-			       enum xhci_ring_type type, bool chain_links)
+static void xhci_set_link_trb(struct xhci_segment *seg, bool chain_links)
 {
+	union xhci_trb *trb;
 	u32 val;
 
-	if (!prev || !next)
+	if (!seg || !seg->next)
 		return;
-	prev->next = next;
-	if (type != TYPE_EVENT) {
-		prev->trbs[TRBS_PER_SEGMENT-1].link.segment_ptr =
-			cpu_to_le64(next->dma);
 
-		/* Set the last TRB in the segment to have a TRB type ID of Link TRB */
-		val = le32_to_cpu(prev->trbs[TRBS_PER_SEGMENT-1].link.control);
-		val &= ~TRB_TYPE_BITMASK;
-		val |= TRB_TYPE(TRB_LINK);
-		if (chain_links)
-			val |= TRB_CHAIN;
-		prev->trbs[TRBS_PER_SEGMENT-1].link.control = cpu_to_le32(val);
-	}
+	trb = &seg->trbs[TRBS_PER_SEGMENT - 1];
+
+	/* Set the last TRB in the segment to have a TRB type ID of Link TRB */
+	val = le32_to_cpu(trb->link.control);
+	val &= ~TRB_TYPE_BITMASK;
+	val |= TRB_TYPE(TRB_LINK);
+	if (chain_links)
+		val |= TRB_CHAIN;
+	trb->link.control = cpu_to_le32(val);
+	trb->link.segment_ptr = cpu_to_le64(seg->next->dma);
 }
 
 /*
@@ -127,8 +125,6 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *src, struct
 	if (!src || !dst)
 		return;
 
-	chain_links = xhci_link_chain_quirk(xhci, dst->type);
-
 	/* If the cycle state is 0, set the cycle bit to 1 for all the TRBs */
 	if (dst->cycle_state == 0) {
 		xhci_for_each_ring_seg(src->first_seg, seg) {
@@ -137,8 +133,13 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *src, struct
 		}
 	}
 
-	xhci_link_segments(src->last_seg, dst->enq_seg->next, dst->type, chain_links);
-	xhci_link_segments(dst->enq_seg, src->first_seg, dst->type, chain_links);
+	src->last_seg->next = dst->enq_seg->next;
+	dst->enq_seg->next = src->first_seg;
+	if (dst->type != TYPE_EVENT) {
+		chain_links = xhci_link_chain_quirk(xhci, dst->type);
+		xhci_set_link_trb(dst->enq_seg, chain_links);
+		xhci_set_link_trb(src->last_seg, chain_links);
+	}
 	dst->num_segs += src->num_segs;
 
 	if (dst->enq_seg == dst->last_seg) {
@@ -331,13 +332,18 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 		if (!next)
 			goto free_segments;
 
-		xhci_link_segments(prev, next, ring->type, chain_links);
+		prev->next = next;
+		if (ring->type != TYPE_EVENT)
+			xhci_set_link_trb(prev, chain_links);
 		prev = next;
 		num++;
 	}
-	xhci_link_segments(prev, ring->first_seg, ring->type, chain_links);
 	ring->last_seg = prev;
 
+	ring->last_seg->next = ring->first_seg;
+	if (ring->type != TYPE_EVENT)
+		xhci_set_link_trb(prev, chain_links);
+
 	return 0;
 
 free_segments:
-- 
2.25.1


