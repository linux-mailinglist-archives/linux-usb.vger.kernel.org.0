Return-Path: <linux-usb+bounces-20217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F953A2A5DE
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 11:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3343016663F
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 10:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912C022757F;
	Thu,  6 Feb 2025 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZ+1BpkB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09DD22686F
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838079; cv=none; b=O1ukBASrnvpC1IDnSYbBTQh9QvW43K1CdEBlGbNlb4p0lmlr8lBl87umbjFjEWTDEa3ox6I1QnFFpHV0lPGZBphuR1vuhQq6VPuGQJRiMmTw97kNiQR59jDGzWlyHqjCmm12xyPfeLWv+KtEkofIhw/X9UwxlIe163tmgeCmzI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838079; c=relaxed/simple;
	bh=/9z8Nv9ZTXK6tqRRjUNzhzIB0pig0+b/v8x3NAaZ0CM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8P4AYbBx3i2nRS21zYveparRgM9kRae5PMRZn25hVIaOpog7SWafT+hsxmbUaAziSQCoecxZEPTN43fV2F33dXcOQaHEwE7lZ1FwKUFPhv9KCa4g4jnJUmZ1MBqXN6u2v7HADS1nfzItGcwPy4R6jKHUv/0Pk4pvczWgWu5H2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZ+1BpkB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738838078; x=1770374078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/9z8Nv9ZTXK6tqRRjUNzhzIB0pig0+b/v8x3NAaZ0CM=;
  b=FZ+1BpkBvtg00e/OsbAu0aZYXekJ+fOJDxax3TR0lBZu52qDLdyZi14p
   8L4SACml3QeYhZbFWhg64dpdMqsn2Z80wlYGNNa5cy+yGcPCi8vy2HWRE
   pah3nWpdwVCRsSPgI+bWf2khOih6uk0bcaiZyKsu45/g3pIEGsknYBJeg
   m5aV+p5K71gWm8CXK9t7desZpDli6RHchlPUAM4JBaOMCkYbt5jZ5q931
   9LTFHdBLD1T7irIEAOkvhpGajrR4VKSmSSEoosoIvkvQ2OfFE+jblDUlh
   95X8Ij/oCtlMYZplSZoLa+1AxlIFHHnn8qznq61UBUdfXpZarOu8Lse5y
   A==;
X-CSE-ConnectionGUID: 1A3W9FrvQoahPAPepHd6fg==
X-CSE-MsgGUID: zPDP3yEzTZa7D6pPz2JLYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43189413"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43189413"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:34:37 -0800
X-CSE-ConnectionGUID: 5j25/+2uSva7S/cNuezaIA==
X-CSE-MsgGUID: cMG+6ukuQQSEQ7UmwLyxEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116364498"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 02:34:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 4B46E116; Thu, 06 Feb 2025 12:34:35 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 3/4] usb: xhci: rework and simplify trb_in_td()
Date: Thu,  6 Feb 2025 12:34:27 +0200
Message-ID: <20250206103428.1034784-4-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206103428.1034784-1-niklas.neronin@linux.intel.com>
References: <20250206103428.1034784-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function trb_in_td() searches for a DMA address within a segment ring,
starting from 'start_seg'. If the DMA address is found within a segment
and is positioned between 'start_trb' and 'end_trb', the function returns
the segment. If not, it returns 'NULL'. See ring example at the end.

The original implementation is overly complex and suboptimal.

Key enhancements include:

- Utilize 'end_seg' pointer as counterpart to 'start_seg', narrowing the
  search scope from start to end segment, improving efficiency.

- Prioritizing the most frequent scenario where the start and end
  segments are identical, and 'start_trb' precedes end_trb', by
  checking this case first for quicker resolution.

- Clarifying the handling of TD wrap-around cases, where a TD spans
  back to the start segment, making start and end segments equal,
  but with 'end_trb' preceding 'start_trb', for better readability
  and maintainability.

============================= Example ====================================

Segment ring, consisting of 3 segments (A,B,C) each containing 3 TRBs
(1,2,3). Any segment can be start/end seg, and any TRB inside start seg
can be start TRB, vise versa.

      +---+   +---+   +---+
C --> | A |-->| B |-->| C |--> A
      +---+   +---+   +---+
        |       |       |
      +---+   +---+   +---+
      | 1 |   | 1 |   | 1 |
      | 2 |   | 2 |   | 2 |
      | 3 |   | 3 |   | 3 |
      +---+   +---+   +---+

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 72 +++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a69972cc400c..23337c9d34c1 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -281,51 +281,45 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
  * If the suspect DMA address is a TRB in this TD, this function returns that
  * TRB's segment. Otherwise it returns 0.
  */
-static struct xhci_segment *trb_in_td(struct xhci_td *td, dma_addr_t suspect_dma)
+static struct xhci_segment *trb_in_td(struct xhci_td *td, dma_addr_t dma)
 {
-	dma_addr_t start_dma;
-	dma_addr_t end_seg_dma;
-	dma_addr_t end_trb_dma;
-	struct xhci_segment *cur_seg;
+	struct xhci_segment *seg = td->start_seg;
 
-	start_dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
-	cur_seg = td->start_seg;
-
-	do {
-		if (start_dma == 0)
-			return NULL;
-		/* We may get an event for a Link TRB in the middle of a TD */
-		end_seg_dma = xhci_trb_virt_to_dma(cur_seg,
-				&cur_seg->trbs[TRBS_PER_SEGMENT - 1]);
-		/* If the end TRB isn't in this segment, this is set to 0 */
-		end_trb_dma = xhci_trb_virt_to_dma(cur_seg, td->end_trb);
-
-		if (end_trb_dma > 0) {
-			/* The end TRB is in this segment, so suspect should be here */
-			if (start_dma <= end_trb_dma) {
-				if (suspect_dma >= start_dma && suspect_dma <= end_trb_dma)
-					return cur_seg;
-			} else {
-				/* Case for one segment with
-				 * a TD wrapped around to the top
-				 */
-				if ((suspect_dma >= start_dma &&
-							suspect_dma <= end_seg_dma) ||
-						(suspect_dma >= cur_seg->dma &&
-						 suspect_dma <= end_trb_dma))
-					return cur_seg;
-			}
+	if (td->start_seg == td->end_seg) {
+		if (td->start_trb <= td->end_trb) {
+			if (xhci_trb_virt_to_dma(td->start_seg, td->start_trb) <= dma &&
+			    dma <= xhci_trb_virt_to_dma(td->end_seg, td->end_trb))
+				return seg;
 			return NULL;
 		}
-		/* Might still be somewhere in this segment */
-		if (suspect_dma >= start_dma && suspect_dma <= end_seg_dma)
-			return cur_seg;
 
-		cur_seg = cur_seg->next;
-		start_dma = xhci_trb_virt_to_dma(cur_seg, &cur_seg->trbs[0]);
-	} while (cur_seg != td->start_seg);
+		/* Edge case, the TD wrapped around to the start segment. */
+		if (xhci_trb_virt_to_dma(td->end_seg, td->end_trb) < dma &&
+		    dma < xhci_trb_virt_to_dma(td->start_seg, td->start_trb))
+			return NULL;
+		if (seg->dma <= dma && dma <= (seg->dma + TRB_SEGMENT_SIZE))
+			return seg;
+		seg = seg->next;
+	}
 
-	return NULL;
+	/* Loop through segment which don't contain the DMA address. */
+	while (dma < seg->dma || (seg->dma + TRB_SEGMENT_SIZE) <= dma) {
+		if (seg == td->end_seg)
+			return NULL;
+
+		seg = seg->next;
+		if (seg == td->start_seg)
+			return NULL;
+	}
+
+	if (seg == td->start_seg) {
+		if (dma < xhci_trb_virt_to_dma(td->start_seg, td->start_trb))
+			return NULL;
+	} else if (seg == td->end_seg) {
+		if (xhci_trb_virt_to_dma(td->end_seg, td->end_trb) < dma)
+			return NULL;
+	}
+	return seg;
 }
 
 /*
-- 
2.47.2


