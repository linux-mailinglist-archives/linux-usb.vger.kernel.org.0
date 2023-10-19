Return-Path: <linux-usb+bounces-1899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B68887CF52E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3876D1F23C5A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED8C18C0E;
	Thu, 19 Oct 2023 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bg6hFT8T"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FA91945A
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADDD121
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711287; x=1729247287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RfAobgW+spfaRTz5pclIMhWiUTVOI4ap3mjX1cXQDBU=;
  b=bg6hFT8TkYaWZq3KGALKgvEEhL9EBlSQf/5pPQ5XShjGfWRt8xUd7580
   7aYkQ5zBruxWD6HKnjsGwOdtlVMIC5vRCv+eDpXd1qAhHnqZkw7JtgLqU
   Q0HC8Ggi9TLwtIZhQQH9RoqUYLm+XisWfSVyR3DWPkViXseUjfju0hCJ/
   jyDMO76DrWgZTveMJxCVbq2gk0DkIknnB0cHAFnc20v35g8BFRQSra4vw
   u2e1E8DJz0OQE/O9CcSdU+ynrr4rX31L9j+eM8zf/ZXROwjRV9MUSUxLg
   VrGiyjEjI+vnGrdgyuuusLjEHmtfJWnXtqMfWLGppxZg27gi4EGZOnit4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075796"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075796"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557544"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557544"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:05 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/19] xhci: Set DESI bits in ERDP register correctly
Date: Thu, 19 Oct 2023 13:29:09 +0300
Message-Id: <20231019102924.2797346-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Wunner <lukas@wunner.de>

When using more than one Event Ring segment (ERSTSZ > 1), software shall
set the DESI bits in the ERDP register to the number of the segment to
which the upper ERDP bits are pointing.  The xHC may use the DESI bits
as a shortcut to determine whether it needs to check for an Event Ring
Full condition:  If it's enqueueing events in a different segment, it
need not compare its internal Enqueue Pointer with the Dequeue Pointer
in the upper bits of the ERDP register (sec 5.5.2.3.3).

Not setting the DESI bits correctly can result in the xHC enqueueing
events past the Dequeue Pointer.  On Renesas uPD720201 host controllers,
incorrect DESI bits cause an interrupt storm.  For comparison, VIA VL805
host controllers do not exhibit such problems.  Perhaps they do not take
advantage of the optimization afforded by the DESI bits.

To fix the issue, assign the segment number to each struct xhci_segment
in xhci_segment_alloc().  When advancing the Dequeue Pointer in
xhci_update_erst_dequeue(), write the segment number to the DESI bits.

On driver probe, set the DESI bits to zero in xhci_set_hc_event_deq() as
processing starts in segment 0.  Likewise on driver teardown, clear the
DESI bits to zero in xhci_free_interrupter() when clearing the upper
bits of the ERDP register.  Previously those functions (incorrectly)
treated the DESI bits as if they're declared RsvdP.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  | 25 +++++++++++--------------
 drivers/usb/host/xhci-ring.c |  2 +-
 drivers/usb/host/xhci.h      |  1 +
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 0a37f0d511cf..17c9942010c8 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -29,6 +29,7 @@
 static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 					       unsigned int cycle_state,
 					       unsigned int max_packet,
+					       unsigned int num,
 					       gfp_t flags)
 {
 	struct xhci_segment *seg;
@@ -60,6 +61,7 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 		for (i = 0; i < TRBS_PER_SEGMENT; i++)
 			seg->trbs[i].link.control = cpu_to_le32(TRB_CYCLE);
 	}
+	seg->num = num;
 	seg->dma = dma;
 	seg->next = NULL;
 
@@ -324,6 +326,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 		enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
 {
 	struct xhci_segment *prev;
+	unsigned int num = 0;
 	bool chain_links;
 
 	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
@@ -331,16 +334,17 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 			 (type == TYPE_ISOC &&
 			  (xhci->quirks & XHCI_AMD_0x96_HOST)));
 
-	prev = xhci_segment_alloc(xhci, cycle_state, max_packet, flags);
+	prev = xhci_segment_alloc(xhci, cycle_state, max_packet, num, flags);
 	if (!prev)
 		return -ENOMEM;
-	num_segs--;
+	num++;
 
 	*first = prev;
-	while (num_segs > 0) {
+	while (num < num_segs) {
 		struct xhci_segment	*next;
 
-		next = xhci_segment_alloc(xhci, cycle_state, max_packet, flags);
+		next = xhci_segment_alloc(xhci, cycle_state, max_packet, num,
+					  flags);
 		if (!next) {
 			prev = *first;
 			while (prev) {
@@ -353,7 +357,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 		xhci_link_segments(prev, next, type, chain_links);
 
 		prev = next;
-		num_segs--;
+		num++;
 	}
 	xhci_link_segments(prev, *first, type, chain_links);
 	*last = prev;
@@ -1801,7 +1805,6 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	size_t erst_size;
-	u64 tmp64;
 	u32 tmp;
 
 	if (!ir)
@@ -1824,9 +1827,7 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		tmp &= ERST_SIZE_MASK;
 		writel(tmp, &ir->ir_set->erst_size);
 
-		tmp64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-		tmp64 &= (u64) ERST_PTR_MASK;
-		xhci_write_64(xhci, tmp64, &ir->ir_set->erst_dequeue);
+		xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
 	}
 
 	/* free interrrupter event ring */
@@ -1933,7 +1934,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 
 static void xhci_set_hc_event_deq(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
-	u64 temp;
 	dma_addr_t deq;
 
 	deq = xhci_trb_virt_to_dma(ir->event_ring->deq_seg,
@@ -1941,15 +1941,12 @@ static void xhci_set_hc_event_deq(struct xhci_hcd *xhci, struct xhci_interrupter
 	if (!deq)
 		xhci_warn(xhci, "WARN something wrong with SW event ring dequeue ptr.\n");
 	/* Update HC event ring dequeue pointer */
-	temp = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	temp &= ERST_PTR_MASK;
 	/* Don't clear the EHB bit (which is RW1C) because
 	 * there might be more events to service.
 	 */
-	temp &= ~ERST_EHB;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 		       "// Write event ring dequeue pointer, preserving EHB bit");
-	xhci_write_64(xhci, ((u64) deq & (u64) ~ERST_PTR_MASK) | temp,
+	xhci_write_64(xhci, ((u64) deq & (u64) ~ERST_PTR_MASK),
 			&ir->ir_set->erst_dequeue);
 }
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 17e37c2a14aa..173c2068eb64 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3018,7 +3018,7 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			return;
 
 		/* Update HC event ring dequeue pointer */
-		temp_64 &= ERST_DESI_MASK;
+		temp_64 = ir->event_ring->deq_seg->num & ERST_DESI_MASK;
 		temp_64 |= ((u64) deq & (u64) ~ERST_PTR_MASK);
 	}
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8342076cb309..5ddca9280ec3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1518,6 +1518,7 @@ struct xhci_segment {
 	union xhci_trb		*trbs;
 	/* private to HCD */
 	struct xhci_segment	*next;
+	unsigned int		num;
 	dma_addr_t		dma;
 	/* Max packet sized bounce buffer for td-fragmant alignment */
 	dma_addr_t		bounce_dma;
-- 
2.25.1


