Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE3222B199
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgGWOma (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:30 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOm3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:29 -0400
IronPort-SDR: 9KMpT43gUpYgR2TyIFM2NPC2ZRKgRnuHFgTec3LfazHkhJFj/p5UeQpk96AkuvseGl1fnIV6xb
 winolLiPxqNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607370"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607370"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:28 -0700
IronPort-SDR: pkE36pJgIl1BRe2Sf0A5R4yy9GSWsiQ50L1PxwjsLWj7S3ZRDUS4nQNebI/gK+8gPLAxLxezit
 SEM8GbKelxqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672365"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:27 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/27] xhci: Don't pass struct xhci_hcd pointer to xhci_link_seg()
Date:   Thu, 23 Jul 2020 17:45:06 +0300
Message-Id: <20200723144530.9992-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It's only used to dig out if we need to set a chain flag for specific
hosts. Pass the flag directly as a parameter instead.

No functional changes.

xhci_link_seg() is also used by DbC code, this change helps decoupling
xhci and DbC.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index fb221c091478..d38779e2fc84 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -96,8 +96,9 @@ static void xhci_free_segments_for_ring(struct xhci_hcd *xhci,
  * DMA address of the next segment.  The caller needs to set any Link TRB
  * related flags, such as End TRB, Toggle Cycle, and no snoop.
  */
-static void xhci_link_segments(struct xhci_hcd *xhci, struct xhci_segment *prev,
-		struct xhci_segment *next, enum xhci_ring_type type)
+static void xhci_link_segments(struct xhci_segment *prev,
+			       struct xhci_segment *next,
+			       enum xhci_ring_type type, bool chain_links)
 {
 	u32 val;
 
@@ -112,11 +113,7 @@ static void xhci_link_segments(struct xhci_hcd *xhci, struct xhci_segment *prev,
 		val = le32_to_cpu(prev->trbs[TRBS_PER_SEGMENT-1].link.control);
 		val &= ~TRB_TYPE_BITMASK;
 		val |= TRB_TYPE(TRB_LINK);
-		/* Always set the chain bit with 0.95 hardware */
-		/* Set chain bit for isoc rings on AMD 0.96 host */
-		if (xhci_link_trb_quirk(xhci) ||
-				(type == TYPE_ISOC &&
-				 (xhci->quirks & XHCI_AMD_0x96_HOST)))
+		if (chain_links)
 			val |= TRB_CHAIN;
 		prev->trbs[TRBS_PER_SEGMENT-1].link.control = cpu_to_le32(val);
 	}
@@ -131,13 +128,19 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		unsigned int num_segs)
 {
 	struct xhci_segment *next;
+	bool chain_links;
 
 	if (!ring || !first || !last)
 		return;
 
+	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
+	chain_links = !!(xhci_link_trb_quirk(xhci) ||
+			 (ring->type == TYPE_ISOC &&
+			  (xhci->quirks & XHCI_AMD_0x96_HOST)));
+
 	next = ring->enq_seg->next;
-	xhci_link_segments(xhci, ring->enq_seg, first, ring->type);
-	xhci_link_segments(xhci, last, next, ring->type);
+	xhci_link_segments(ring->enq_seg, first, ring->type, chain_links);
+	xhci_link_segments(last, next, ring->type, chain_links);
 	ring->num_segs += num_segs;
 	ring->num_trbs_free += (TRBS_PER_SEGMENT - 1) * num_segs;
 
@@ -321,6 +324,12 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 		enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
 {
 	struct xhci_segment *prev;
+	bool chain_links;
+
+	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
+	chain_links = !!(xhci_link_trb_quirk(xhci) ||
+			 (type == TYPE_ISOC &&
+			  (xhci->quirks & XHCI_AMD_0x96_HOST)));
 
 	prev = xhci_segment_alloc(xhci, cycle_state, max_packet, flags);
 	if (!prev)
@@ -341,12 +350,12 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 			}
 			return -ENOMEM;
 		}
-		xhci_link_segments(xhci, prev, next, type);
+		xhci_link_segments(prev, next, type, chain_links);
 
 		prev = next;
 		num_segs--;
 	}
-	xhci_link_segments(xhci, prev, *first, type);
+	xhci_link_segments(prev, *first, type, chain_links);
 	*last = prev;
 
 	return 0;
-- 
2.17.1

