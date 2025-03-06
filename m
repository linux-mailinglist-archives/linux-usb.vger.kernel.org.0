Return-Path: <linux-usb+bounces-21447-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C9A54E38
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 007EB3A9889
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABDA1FCD05;
	Thu,  6 Mar 2025 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joZp3jTy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC481188012
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272591; cv=none; b=H9vIUhCgYo5PxJI7DnpclfVJYuA2FhuiTvDxWuC1UQ6pKfkfOG4BTboP+pk4viTz4FVWiN7GjmvwPeak3uvtGsW9us9537fsVVg5bVYu3NflngWSMVeZdw8GmXMG2L5616WKO9RAN1GNeKB5ApJIPQ6ISiXl32v+bPGNLcj+WMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272591; c=relaxed/simple;
	bh=QaIqd/aAOjm82oUjsmHWxXEkA2zfHO0WeYg2sFbSqJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ur6tTFIw7GUstblV7pfd24lBjbLWGUm0t87V/8i34uJ5mzfoGEUpy4ICfgsnbcl/OuiAUzfhJykCvk4XT7+pR59ylDWMqdQ4sH/0yje41/Pq0TY5puY+aWeXvnyQ67aEL9N6/m/JwrF4axjRAjZYkChL8jBvTp15QhBbilmuZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joZp3jTy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272589; x=1772808589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QaIqd/aAOjm82oUjsmHWxXEkA2zfHO0WeYg2sFbSqJY=;
  b=joZp3jTyYE31jdCiXX9pO1MvQfV3SmKe3lc1vbdKAvZwQCWyytO+mssG
   4KepBBc9zYPO2V2ygWQEeGDVqStUWfY9oYVPrjP6rwhH611n2QXyBzlt/
   NO0AK53T5bHl8J2CEjLjtwDc35e66QfaNWt6I6y+EjeoGcA6RfXNBrOOI
   O1pSnxFfOeXfJgVGHXyh0YlhBJHsTTOpobwrk0VmPIPDRKMV7T1xrmc9h
   ixJSvDiXP0oSAVMy0ttxQan9LP/NUNxFnHJGImQ8DtgV8NG4OtEbaWVt5
   Gco5QsgHN19DrbyYynhh0di9Lc/NPsdeFo+zu7287zjrwwK3MiP52HqEl
   w==;
X-CSE-ConnectionGUID: u2KE7CYfQYquvp453ixGPg==
X-CSE-MsgGUID: YWA7IdoWRZGRTkzDJmqR2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657146"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657146"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:49 -0800
X-CSE-ConnectionGUID: 7pDB5363T1KAs2/nVTF5og==
X-CSE-MsgGUID: zJyQvk/ERkO0kGhrDV+oeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954867"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:47 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/15] usb: xhci: Unify duplicate inc_enq() code
Date: Thu,  6 Mar 2025 16:49:53 +0200
Message-ID: <20250306144954.3507700-15-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
References: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

Extract a block of code copied from inc_enq() into a separate function
and call it from inc_enq() and the other function which used this code.
Remove the pointless 'next' variable which only aliases ring->enqueue.

Note: I don't know if any 0.95 xHC ever reached series production, but
"AMD 0.96 host" appears to be the "Llano" family APU. Example dmesg at
https://linux-hardware.org/?probe=79d5cfd4fd&log=dmesg

pci 0000:00:10.0: [1022:7812] type 00 class 0x0c0330
hcc params 0x014042c3 hci version 0x96 quirks 0x0000000000000608

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 130 +++++++++++++++--------------------
 1 file changed, 55 insertions(+), 75 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7643ab9ec3b4..2df94ed3152c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -204,79 +204,84 @@ void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring)
 }
 
 /*
- * See Cycle bit rules. SW is the consumer for the event ring only.
- *
- * If we've just enqueued a TRB that is in the middle of a TD (meaning the
- * chain bit is set), then set the chain bit in all the following link TRBs.
- * If we've enqueued the last TRB in a TD, make sure the following link TRBs
- * have their chain bit cleared (so that each Link TRB is a separate TD).
- *
- * Section 6.4.4.1 of the 0.95 spec says link TRBs cannot have the chain bit
- * set, but other sections talk about dealing with the chain bit set.  This was
- * fixed in the 0.96 specification errata, but we have to assume that all 0.95
- * xHCI hardware can't handle the chain bit being cleared on a link TRB.
- *
- * @more_trbs_coming:	Will you enqueue more TRBs before calling
- *			prepare_transfer()?
+ * If enqueue points at a link TRB, follow links until an ordinary TRB is reached.
+ * Toggle the cycle bit of passed link TRBs and optionally chain them.
  */
-static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
-			bool more_trbs_coming)
+static void inc_enq_past_link(struct xhci_hcd *xhci, struct xhci_ring *ring, u32 chain)
 {
-	u32 chain;
-	union xhci_trb *next;
 	unsigned int link_trb_count = 0;
 
-	chain = le32_to_cpu(ring->enqueue->generic.field[3]) & TRB_CHAIN;
-
-	if (last_trb_on_seg(ring->enq_seg, ring->enqueue)) {
-		xhci_err(xhci, "Tried to move enqueue past ring segment\n");
-		return;
-	}
-
-	next = ++(ring->enqueue);
-
-	/* Update the dequeue pointer further if that was a link TRB */
-	while (trb_is_link(next)) {
+	while (trb_is_link(ring->enqueue)) {
 
 		/*
-		 * If the caller doesn't plan on enqueueing more TDs before
-		 * ringing the doorbell, then we don't want to give the link TRB
-		 * to the hardware just yet. We'll give the link TRB back in
-		 * prepare_ring() just before we enqueue the TD at the top of
-		 * the ring.
-		 */
-		if (!chain && !more_trbs_coming)
-			break;
-
-		/* If we're not dealing with 0.95 hardware or isoc rings on
-		 * AMD 0.96 host, carry over the chain bit of the previous TRB
-		 * (which may mean the chain bit is cleared).
+		 * Section 6.4.4.1 of the 0.95 spec says link TRBs cannot have the chain bit
+		 * set, but other sections talk about dealing with the chain bit set. This was
+		 * fixed in the 0.96 specification errata, but we have to assume that all 0.95
+		 * xHCI hardware can't handle the chain bit being cleared on a link TRB.
+		 *
+		 * On 0.95 and some 0.96 HCs the chain bit is set once at segment initalization
+		 * and never changed here. On all others, modify it as requested by the caller.
 		 */
 		if (!xhci_link_chain_quirk(xhci, ring->type)) {
-			next->link.control &= cpu_to_le32(~TRB_CHAIN);
-			next->link.control |= cpu_to_le32(chain);
+			ring->enqueue->link.control &= cpu_to_le32(~TRB_CHAIN);
+			ring->enqueue->link.control |= cpu_to_le32(chain);
 		}
+
 		/* Give this link TRB to the hardware */
 		wmb();
-		next->link.control ^= cpu_to_le32(TRB_CYCLE);
+		ring->enqueue->link.control ^= cpu_to_le32(TRB_CYCLE);
 
 		/* Toggle the cycle bit after the last ring segment. */
-		if (link_trb_toggles_cycle(next))
+		if (link_trb_toggles_cycle(ring->enqueue))
 			ring->cycle_state ^= 1;
 
 		ring->enq_seg = ring->enq_seg->next;
 		ring->enqueue = ring->enq_seg->trbs;
-		next = ring->enqueue;
 
 		trace_xhci_inc_enq(ring);
 
 		if (link_trb_count++ > ring->num_segs) {
-			xhci_warn(xhci, "%s: Ring link TRB loop\n", __func__);
+			xhci_warn(xhci, "Link TRB loop at enqueue\n");
 			break;
 		}
 	}
 }
 
+/*
+ * See Cycle bit rules. SW is the consumer for the event ring only.
+ *
+ * If we've just enqueued a TRB that is in the middle of a TD (meaning the
+ * chain bit is set), then set the chain bit in all the following link TRBs.
+ * If we've enqueued the last TRB in a TD, make sure the following link TRBs
+ * have their chain bit cleared (so that each Link TRB is a separate TD).
+ *
+ * @more_trbs_coming:	Will you enqueue more TRBs before calling
+ *			prepare_transfer()?
+ */
+static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
+			bool more_trbs_coming)
+{
+	u32 chain;
+
+	chain = le32_to_cpu(ring->enqueue->generic.field[3]) & TRB_CHAIN;
+
+	if (last_trb_on_seg(ring->enq_seg, ring->enqueue)) {
+		xhci_err(xhci, "Tried to move enqueue past ring segment\n");
+		return;
+	}
+
+	ring->enqueue++;
+
+	/*
+	 * If we are in the middle of a TD or the caller plans to enqueue more
+	 * TDs as one transfer (eg. control), traverse any link TRBs right now.
+	 * Otherwise, enqueue can stay on a link until the next prepare_ring().
+	 * This avoids enqueue entering deq_seg and simplifies ring expansion.
+	 */
+	if (trb_is_link(ring->enqueue) && (chain || more_trbs_coming))
+		inc_enq_past_link(xhci, ring, chain);
+}
+
 /*
  * If the suspect DMA address is a TRB in this TD, this function returns that
  * TRB's segment. Otherwise it returns 0.
@@ -3213,7 +3218,6 @@ static void queue_trb(struct xhci_hcd *xhci, struct xhci_ring *ring,
 static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 		u32 ep_state, unsigned int num_trbs, gfp_t mem_flags)
 {
-	unsigned int link_trb_count = 0;
 	unsigned int new_segs = 0;
 
 	/* Make sure the endpoint has been added to xHC schedule */
@@ -3261,33 +3265,9 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 		}
 	}
 
-	while (trb_is_link(ep_ring->enqueue)) {
-		/* If we're not dealing with 0.95 hardware or isoc rings
-		 * on AMD 0.96 host, clear the chain bit.
-		 */
-		if (!xhci_link_chain_quirk(xhci, ep_ring->type))
-			ep_ring->enqueue->link.control &=
-				cpu_to_le32(~TRB_CHAIN);
-		else
-			ep_ring->enqueue->link.control |=
-				cpu_to_le32(TRB_CHAIN);
-
-		wmb();
-		ep_ring->enqueue->link.control ^= cpu_to_le32(TRB_CYCLE);
-
-		/* Toggle the cycle bit after the last ring segment. */
-		if (link_trb_toggles_cycle(ep_ring->enqueue))
-			ep_ring->cycle_state ^= 1;
-
-		ep_ring->enq_seg = ep_ring->enq_seg->next;
-		ep_ring->enqueue = ep_ring->enq_seg->trbs;
-
-		/* prevent infinite loop if all first trbs are link trbs */
-		if (link_trb_count++ > ep_ring->num_segs) {
-			xhci_warn(xhci, "Ring is an endless link TRB loop\n");
-			return -EINVAL;
-		}
-	}
+	/* Ensure that new TRBs won't overwrite a link */
+	if (trb_is_link(ep_ring->enqueue))
+		inc_enq_past_link(xhci, ep_ring, 0);
 
 	if (last_trb_on_seg(ep_ring->enq_seg, ep_ring->enqueue)) {
 		xhci_warn(xhci, "Missing link TRB at end of ring segment\n");
-- 
2.43.0


