Return-Path: <linux-usb+bounces-30704-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74326C6F617
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 60E5B4FFA86
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276E836829C;
	Wed, 19 Nov 2025 14:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XceDNDlO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAC836827E
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562282; cv=none; b=OHlrPrCHfVX5kfQ7UEndPbtJR7ns/8YfUoC4BYMt00qllHaCCR5TZ3at5Mp+BK0/4Ii+kCXNUW0Bw736/eTYrVBNXTLcXfcdJ16SPDALW/VwkXLDnGeiz4cIrB3RoCNLXEJHUBR8E6Bm9P3LlXTbRmb14qtNTMljD+PAH/Ah3wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562282; c=relaxed/simple;
	bh=oobHCuddKSlzsZDkpjRpoRvXOG59fZjo+g4S5UugxzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0w4MkZkcSEW6U57cXgfHVap7cwjk3DyGDMVeNqVThfWCjsVuXT7t1u8Klw9/qqhBHo4W8Xtc4lzIjsIY6Y2VIYZ9kFRgPGvqQ6UiePNoR2Fq+to55oG0QyYI6YjcwyytwWjT70tDUEPl6Qtfv67DUwOWN08zyVfDPfWrAUJ3+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XceDNDlO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562281; x=1795098281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oobHCuddKSlzsZDkpjRpoRvXOG59fZjo+g4S5UugxzQ=;
  b=XceDNDlOp86iJ8SUoLvrNJsYn1Tj7RxEp40nlTLSz+R2b8Tj4skUj3Ds
   vhgaMc1K7Eif/QXuHZz6e2h27qyt4aPKFSoRuty6h52bCt3aNX10RNzJp
   MPwv8tU7rUznRCkQTdzUPlzYa1Sh7WRpr0IKQYgGa/qYpX4plGHvG7j+3
   SHyOg63cn8JI0hkXKcLUUfJv+Ulf42OzwV0CQwAbzHC3WhNFQrXHCIbAt
   PJkJRtMWv8rdBMbzbHLtE8bZEGWdEBKXF1U9sdV6OAdiThIU2vfiwMi/F
   GS8qM/sliG3ll9Lp4/IUKOIQOtJ6n+b1tcnCcJLPSsKEnghlQ+yeaAywC
   g==;
X-CSE-ConnectionGUID: /sI2LIeHShanyWuafn8TEg==
X-CSE-MsgGUID: BQrnzVBrSi6iq024jYn+Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645500"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645500"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:40 -0800
X-CSE-ConnectionGUID: cjj5aVJ4Q2+ZFuA1pcwgEA==
X-CSE-MsgGUID: XDoACKmWTI2toZvOnNGtRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221991986"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:39 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/23] xhci: simplify and rework trb_in_td()
Date: Wed, 19 Nov 2025 16:23:57 +0200
Message-ID: <20251119142417.2820519-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trb_in_td() checking is quite complex, especially when checking for
TRBs in ranges that can span several segments.

Simplify the search by creating a position index for each TRB on the
ring, and just compare the position indexes.
Add a more generic dma_in_range() helper that checks if a trb dma
address is in the range between a start and end trb and call it from
trb_in_td()

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 72 ++++++++++++++----------------------
 1 file changed, 28 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7fccca7e1c62..aa7fc4d6f97c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -160,6 +160,11 @@ static void trb_to_noop(union xhci_trb *trb, u32 noop_type)
 	}
 }
 
+static unsigned int trb_to_pos(struct xhci_segment *seg, union xhci_trb *trb)
+{
+	return seg->num * TRBS_PER_SEGMENT + (trb - seg->trbs);
+}
+
 /* Updates trb to point to the next TRB in the ring, and updates seg if the next
  * TRB is in a new segment.  This does not skip over link TRBs, and it does not
  * effect the ring dequeue or enqueue pointers.
@@ -299,55 +304,34 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		inc_enq_past_link(xhci, ring, chain);
 }
 
-/*
- * If the suspect DMA address is a TRB in this TD, this function returns that
- * TRB's segment. Otherwise it returns 0.
- */
-static struct xhci_segment *trb_in_td(struct xhci_td *td, dma_addr_t suspect_dma)
+static bool dma_in_range(dma_addr_t dma,
+			 struct xhci_segment *start_seg, union xhci_trb *start_trb,
+			 struct xhci_segment *end_seg, union xhci_trb *end_trb)
 {
-	dma_addr_t start_dma;
-	dma_addr_t end_seg_dma;
-	dma_addr_t end_trb_dma;
-	struct xhci_segment *cur_seg;
+	unsigned int pos, start, end;
+	struct xhci_segment *pos_seg;
+	union xhci_trb *pos_trb = xhci_dma_to_trb(start_seg, dma, &pos_seg);
 
-	start_dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
-	cur_seg = td->start_seg;
+	/* Is the trb dma address even part of the whole ring? */
+	if (!pos_trb)
+		return false;
 
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
-			return NULL;
-		}
-		/* Might still be somewhere in this segment */
-		if (suspect_dma >= start_dma && suspect_dma <= end_seg_dma)
-			return cur_seg;
+	pos = trb_to_pos(pos_seg, pos_trb);
+	start = trb_to_pos(start_seg, start_trb);
+	end = trb_to_pos(end_seg, end_trb);
 
-		cur_seg = cur_seg->next;
-		start_dma = xhci_trb_virt_to_dma(cur_seg, &cur_seg->trbs[0]);
-	} while (cur_seg != td->start_seg);
+	/* end position is smaller than start, search range wraps around */
+	if (end < start)
+		return !(pos > end && pos < start);
 
-	return NULL;
+	return (pos >= start && pos <= end);
+}
+
+/* If the suspect DMA address is a TRB in this TD, this function returns true */
+static bool trb_in_td(struct xhci_td *td, dma_addr_t suspect_dma)
+{
+	return dma_in_range(suspect_dma, td->start_seg, td->start_trb,
+			    td->end_seg, td->end_trb);
 }
 
 /*
-- 
2.43.0


