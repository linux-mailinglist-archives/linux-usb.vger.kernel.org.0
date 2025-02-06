Return-Path: <linux-usb+bounces-20215-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B92A2A5DC
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 11:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E64941888984
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 10:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B064D226554;
	Thu,  6 Feb 2025 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZxo89WU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959A418B03
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838076; cv=none; b=lZT+R2S4mIbvENvHAaw3Z+7DDiRM86bJ73CWB8+vy6QJc+YfvE7Opq//C69kqIbE33j6+1kKuEUov7/d1k3zAzaHbUeOxNbdxxV32K1+yhb9HAONFaS/nXS6dE0i3mSjBRvY/AjadUqSqGO8bGHqbEDAeCRWfOSk0uL5pC0mEYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838076; c=relaxed/simple;
	bh=9YLlxhx1B8B47brShJrqaxxiJwgQfGkK2dOyUtS4vPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdVi7+YpqIxkb4dZh2wK2vD5APmTFAig3XiDJYu/bFHNBUxHhWzCc9A3Zt+Ww57yx3Mw0qmNJGZQMs8tGqVUfRYl3+LIjMQJ+CsRnAR1cQZuVcTlTiuCBI8ouy4IruvM0IS+/dahcQUt7PNXEromKlbuO3sorqzFFxCN0ndzdDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZxo89WU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738838075; x=1770374075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9YLlxhx1B8B47brShJrqaxxiJwgQfGkK2dOyUtS4vPg=;
  b=mZxo89WUlCiIl8kdTmqoEfbszIx37eUZCtKAGqnAK7dkIPLxg1bLJ4or
   uVrzno8S6uYn9s92q7HFVAHipl+pyZotG2efs4xrUVh4mYA9Nq772+TVr
   HxOF6J/4fXmj67ok/KA171aCu34N27ZtFoge8Dj+ZMn+zuqYAAaWtfDEI
   5hBfrYJBsg2CKX077e9H3vHDVbiQtbeToLCqdRsUdmMHbMA/vUwPRJl1n
   x7XsvoBzhw82+ashWlTC00WFejiiGr671zjdkWI/suWugrFf5zpkjApAj
   OXmYp8UYjgyusel/U6Rl4lTCV3NyDqmPCbPqVdExMMtANGABSa8NQNXkl
   A==;
X-CSE-ConnectionGUID: /AF9ns3CR2uAc/KOnCY12g==
X-CSE-MsgGUID: nt7mVWnNQf+VDcfs02zU1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43189400"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43189400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:34:34 -0800
X-CSE-ConnectionGUID: BuDlYP1bThOJv2/4zlfmeA==
X-CSE-MsgGUID: 4Fvnl4ShTFSE5O+3wiFKOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116364489"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 02:34:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id A7C35116; Thu, 06 Feb 2025 12:34:31 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/4] usb: xhci: refactor trb_in_td() to be static
Date: Thu,  6 Feb 2025 12:34:25 +0200
Message-ID: <20250206103428.1034784-2-niklas.neronin@linux.intel.com>
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

Relocate trb_in_td() and marks it as static, as it's exclusively utilized
in xhci-ring.c. This adjustment lays the groundwork for future rework of
the function.

The function's logic remains unchanged; only its access specifier is
altered to static and a redundant "else" is removed on line 325
(due to checkpatch.pl complaining).

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 122 +++++++++++++++++------------------
 drivers/usb/host/xhci.h      |   2 -
 2 files changed, 61 insertions(+), 63 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 965bffce301e..467a3abf8f53 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -277,6 +277,67 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	}
 }
 
+/*
+ * If the suspect DMA address is a TRB in this TD, this function returns that
+ * TRB's segment. Otherwise it returns 0.
+ */
+static struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td,
+				      dma_addr_t suspect_dma, bool debug)
+{
+	dma_addr_t start_dma;
+	dma_addr_t end_seg_dma;
+	dma_addr_t end_trb_dma;
+	struct xhci_segment *cur_seg;
+
+	start_dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
+	cur_seg = td->start_seg;
+
+	do {
+		if (start_dma == 0)
+			return NULL;
+		/* We may get an event for a Link TRB in the middle of a TD */
+		end_seg_dma = xhci_trb_virt_to_dma(cur_seg,
+				&cur_seg->trbs[TRBS_PER_SEGMENT - 1]);
+		/* If the end TRB isn't in this segment, this is set to 0 */
+		end_trb_dma = xhci_trb_virt_to_dma(cur_seg, td->end_trb);
+
+		if (debug)
+			xhci_warn(xhci,
+				"Looking for event-dma %016llx trb-start %016llx trb-end %016llx seg-start %016llx seg-end %016llx\n",
+				(unsigned long long)suspect_dma,
+				(unsigned long long)start_dma,
+				(unsigned long long)end_trb_dma,
+				(unsigned long long)cur_seg->dma,
+				(unsigned long long)end_seg_dma);
+
+		if (end_trb_dma > 0) {
+			/* The end TRB is in this segment, so suspect should be here */
+			if (start_dma <= end_trb_dma) {
+				if (suspect_dma >= start_dma && suspect_dma <= end_trb_dma)
+					return cur_seg;
+			} else {
+				/* Case for one segment with
+				 * a TD wrapped around to the top
+				 */
+				if ((suspect_dma >= start_dma &&
+							suspect_dma <= end_seg_dma) ||
+						(suspect_dma >= cur_seg->dma &&
+						 suspect_dma <= end_trb_dma))
+					return cur_seg;
+			}
+			return NULL;
+		}
+		/* Might still be somewhere in this segment */
+		if (suspect_dma >= start_dma && suspect_dma <= end_seg_dma)
+			return cur_seg;
+
+		cur_seg = cur_seg->next;
+		start_dma = xhci_trb_virt_to_dma(cur_seg, &cur_seg->trbs[0]);
+	} while (cur_seg != td->start_seg);
+
+	return NULL;
+}
+
 /*
  * Return number of free normal TRBs from enqueue to dequeue pointer on ring.
  * Not counting an assumed link TRB at end of each TRBS_PER_SEGMENT sized segment.
@@ -2116,67 +2177,6 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	spin_lock(&xhci->lock);
 }
 
-/*
- * If the suspect DMA address is a TRB in this TD, this function returns that
- * TRB's segment. Otherwise it returns 0.
- */
-struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td, dma_addr_t suspect_dma,
-			       bool debug)
-{
-	dma_addr_t start_dma;
-	dma_addr_t end_seg_dma;
-	dma_addr_t end_trb_dma;
-	struct xhci_segment *cur_seg;
-
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
-		if (debug)
-			xhci_warn(xhci,
-				"Looking for event-dma %016llx trb-start %016llx trb-end %016llx seg-start %016llx seg-end %016llx\n",
-				(unsigned long long)suspect_dma,
-				(unsigned long long)start_dma,
-				(unsigned long long)end_trb_dma,
-				(unsigned long long)cur_seg->dma,
-				(unsigned long long)end_seg_dma);
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
-		} else {
-			/* Might still be somewhere in this segment */
-			if (suspect_dma >= start_dma && suspect_dma <= end_seg_dma)
-				return cur_seg;
-		}
-		cur_seg = cur_seg->next;
-		start_dma = xhci_trb_virt_to_dma(cur_seg, &cur_seg->trbs[0]);
-	} while (cur_seg != td->start_seg);
-
-	return NULL;
-}
-
 static void xhci_clear_hub_tt_buffer(struct xhci_hcd *xhci, struct xhci_td *td,
 		struct xhci_virt_ep *ep)
 {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8c164340a2c3..d66ad9bd7432 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1884,8 +1884,6 @@ int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
-struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td,
-			       dma_addr_t suspect_dma, bool debug);
 int xhci_is_vendor_info_code(struct xhci_hcd *xhci, unsigned int trb_comp_code);
 void xhci_ring_cmd_db(struct xhci_hcd *xhci);
 int xhci_queue_slot_control(struct xhci_hcd *xhci, struct xhci_command *cmd,
-- 
2.47.2


