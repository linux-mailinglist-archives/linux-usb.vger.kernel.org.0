Return-Path: <linux-usb+bounces-9911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4419F8B5AC2
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADE4A1F23168
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2557BAE4;
	Mon, 29 Apr 2024 14:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMMJ13e9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9862D7C6C8
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399289; cv=none; b=bxai18ZoMcNl8GXTBw2bxF6PmGnarLZgW6nEmkkS3ujx2KHegbaFRFaOvQui408WuFcrbxGBHhP9PhnXuaj3nzLAXm5uMFXjV6PTb+nL48C8/OxoJwnNoEvsD6dSMVOa8NF5RZgyL9SAzAoS5kGYqG8rPxEMqQeqRFDI+QFPsqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399289; c=relaxed/simple;
	bh=wJH0Mxm6yA9D40pR2pcIKMVid7B8zIpkjtcCxZdlAlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aowueoYZo53D8d9UPmLy/e3iLGg0adqwWdmqo3YhVyuIh34j9HBE51BHZmFOXc6fK9MZlfV3aDvhc5dJqPOt+vIwBgps0XplRgWOl3IqjLu6RoLDP9p9BL+6a6Mnb6cYRWYvD7XrszOZk4Am1fej6q+rqWyuiofwHyM9qsUu20k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMMJ13e9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399287; x=1745935287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wJH0Mxm6yA9D40pR2pcIKMVid7B8zIpkjtcCxZdlAlw=;
  b=KMMJ13e9xQwgvG3upOXGzg05kasLj4uv1FKaGouAQkGOQvUTjYAx9Hmz
   F4FJyMkIGBk0cjwQAFgIjBqRBcaVWlTRaoxZBlpZpCFdjb1P6HTFeIUhM
   M51TQgk7EXMPT8ZtIkitp4l1EKoAMnVzb4eOr0Py0fmSWF+A3oU/OsrX+
   ocqvRRo6mwxBiuQbhAhCDwmHMCULIEQkNA+cMTEpIBb5cBB2sN5RnMjJQ
   QsK1Kr8GbqWnjff0H4EHd7w04/9eAtMwRuWHF8DQR+KwOevlFN/OBZkz0
   OubZ7RZl0u4V5DtbrRpglvFTaeh46ICR3gcw2l0eZKvBaVE6AGEXSU62J
   g==;
X-CSE-ConnectionGUID: 2BUuQKT1TwO5oATKP+xwvA==
X-CSE-MsgGUID: Pa3kqLwJTp2izYVgKis6nA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911558"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911558"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:27 -0700
X-CSE-ConnectionGUID: K/EY4BO9RUyvH4CFCBahfw==
X-CSE-MsgGUID: SyRLAqrFTa+Nw1t1Yfu2GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521955"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:25 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 18/18] usb: xhci: compact 'trb_in_td()' arguments
Date: Mon, 29 Apr 2024 17:02:45 +0300
Message-Id: <20240429140245.3955523-19-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Pass pointer to the TD (struct xhci_td *) directly, instead of its
components separately.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 38 +++++++++++++-----------------------
 drivers/usb/host/xhci.h      |  5 ++---
 2 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a7423ed992ee..9e90d2952760 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1024,8 +1024,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 					 td->urb->stream_id);
 		hw_deq &= ~0xf;
 
-		if (td->cancel_status == TD_HALTED ||
-		    trb_in_td(xhci, td->start_seg, td->first_trb, td->last_trb, hw_deq, false)) {
+		if (td->cancel_status == TD_HALTED || trb_in_td(xhci, td, hw_deq, false)) {
 			switch (td->cancel_status) {
 			case TD_CLEARED: /* TD is already no-op */
 			case TD_CLEARING_CACHE: /* set TR deq command already queued */
@@ -1082,8 +1081,7 @@ static struct xhci_td *find_halted_td(struct xhci_virt_ep *ep)
 		hw_deq = xhci_get_hw_deq(ep->xhci, ep->vdev, ep->ep_index, 0);
 		hw_deq &= ~0xf;
 		td = list_first_entry(&ep->ring->td_list, struct xhci_td, td_list);
-		if (trb_in_td(ep->xhci, td->start_seg, td->first_trb,
-				td->last_trb, hw_deq, false))
+		if (trb_in_td(ep->xhci, td, hw_deq, false))
 			return td;
 	}
 	return NULL;
@@ -2049,25 +2047,19 @@ static void handle_port_status(struct xhci_hcd *xhci,
 }
 
 /*
- * This TD is defined by the TRBs starting at start_trb in start_seg and ending
- * at end_trb, which may be in another segment.  If the suspect DMA address is a
- * TRB in this TD, this function returns that TRB's segment.  Otherwise it
- * returns 0.
+ * If the suspect DMA address is a TRB in this TD, this function returns that
+ * TRB's segment. Otherwise it returns 0.
  */
-struct xhci_segment *trb_in_td(struct xhci_hcd *xhci,
-		struct xhci_segment *start_seg,
-		union xhci_trb	*start_trb,
-		union xhci_trb	*end_trb,
-		dma_addr_t	suspect_dma,
-		bool		debug)
+struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td, dma_addr_t suspect_dma,
+			       bool debug)
 {
 	dma_addr_t start_dma;
 	dma_addr_t end_seg_dma;
 	dma_addr_t end_trb_dma;
 	struct xhci_segment *cur_seg;
 
-	start_dma = xhci_trb_virt_to_dma(start_seg, start_trb);
-	cur_seg = start_seg;
+	start_dma = xhci_trb_virt_to_dma(td->start_seg, td->first_trb);
+	cur_seg = td->start_seg;
 
 	do {
 		if (start_dma == 0)
@@ -2076,7 +2068,7 @@ struct xhci_segment *trb_in_td(struct xhci_hcd *xhci,
 		end_seg_dma = xhci_trb_virt_to_dma(cur_seg,
 				&cur_seg->trbs[TRBS_PER_SEGMENT - 1]);
 		/* If the end TRB isn't in this segment, this is set to 0 */
-		end_trb_dma = xhci_trb_virt_to_dma(cur_seg, end_trb);
+		end_trb_dma = xhci_trb_virt_to_dma(cur_seg, td->last_trb);
 
 		if (debug)
 			xhci_warn(xhci,
@@ -2110,7 +2102,7 @@ struct xhci_segment *trb_in_td(struct xhci_hcd *xhci,
 		}
 		cur_seg = cur_seg->next;
 		start_dma = xhci_trb_virt_to_dma(cur_seg, &cur_seg->trbs[0]);
-	} while (cur_seg != start_seg);
+	} while (cur_seg != td->start_seg);
 
 	return NULL;
 }
@@ -2822,8 +2814,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			td_num--;
 
 		/* Is this a TRB in the currently executing TD? */
-		ep_seg = trb_in_td(xhci, td->start_seg, td->first_trb,
-				td->last_trb, ep_trb_dma, false);
+		ep_seg = trb_in_td(xhci, td, ep_trb_dma, false);
 
 		/*
 		 * Skip the Force Stopped Event. The event_trb(event_dma) of FSE
@@ -2870,8 +2861,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			    !list_is_last(&td->td_list, &ep_ring->td_list)) {
 				struct xhci_td *td_next = list_next_entry(td, td_list);
 
-				ep_seg = trb_in_td(xhci, td_next->start_seg, td_next->first_trb,
-						   td_next->last_trb, ep_trb_dma, false);
+				ep_seg = trb_in_td(xhci, td_next, ep_trb_dma, false);
 				if (ep_seg) {
 					/* give back previous TD, start handling new */
 					xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
@@ -2890,8 +2880,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					"part of current TD ep_index %d "
 					"comp_code %u\n", ep_index,
 					trb_comp_code);
-				trb_in_td(xhci, td->start_seg, td->first_trb,
-					  td->last_trb, ep_trb_dma, true);
+				trb_in_td(xhci, td, ep_trb_dma, true);
+
 				return -ESHUTDOWN;
 			}
 		}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 933f8a296014..30415158ed3c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1870,9 +1870,8 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
-struct xhci_segment *trb_in_td(struct xhci_hcd *xhci,
-		struct xhci_segment *start_seg, union xhci_trb *start_trb,
-		union xhci_trb *end_trb, dma_addr_t suspect_dma, bool debug);
+struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td,
+			       dma_addr_t suspect_dma, bool debug);
 int xhci_is_vendor_info_code(struct xhci_hcd *xhci, unsigned int trb_comp_code);
 void xhci_ring_cmd_db(struct xhci_hcd *xhci);
 int xhci_queue_slot_control(struct xhci_hcd *xhci, struct xhci_command *cmd,
-- 
2.25.1


