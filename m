Return-Path: <linux-usb+bounces-20216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6159FA2A5DD
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 11:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A681888A7C
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 10:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B2A227572;
	Thu,  6 Feb 2025 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2U44Ekh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B750322686A
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838078; cv=none; b=Z4u6+NMx0P+rXjgwxd/VJsqSmWkBX8C0y4pEQow0WuhyCVVcFcjfaSRNrXqFxmcvVUzFtOm3lXQjZg2vghyBIMC4tPK25jlhfJxH+fzNtbr++WiLeaj2kNcYeiK/vZnMHWxtIKZkAzXn6NtgLWKVrGubWqjmiqsSBz3HIyajXNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838078; c=relaxed/simple;
	bh=60CRDsEvulNbEfbNZnNV5/PmKL+pRLbW8uMZClyl60U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byL8cjZDpuWdnR0OszileH5Jey9OcTVxR1aIsrJZ5Ck8eI0qH5Mamkg75FtDPfpM8tjWT/3l9roeNrFy1WmN8VO7NUB5vOQ4/+XujQcbQiAQjA+Fu2UlfrC1mSaR7XOKPNjUk+r7y8oZQQ/7eQF2XJ50LB/O38d7XFZA7MdhT+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2U44Ekh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738838077; x=1770374077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=60CRDsEvulNbEfbNZnNV5/PmKL+pRLbW8uMZClyl60U=;
  b=d2U44EkhBouZSySWM3kYmdu9KM4L1Gr2KdLwSYIGNDfrqAF4U9SP+COP
   5oxxdMJL3HcLKpNB2FBwz22V486ijFNehuV/r8cggQLc3eq4zj6P670Pr
   CJvQZ13x2xuj7l3IAqWSVqlnrBzlGmmhVzlMNxLzx2oCdOSyxQ9BsOiY3
   0KCv0DiotD4QlpRzl67KHn2zvsNNjZtbCSnPcJP6KbPFUmbJwgQtf+7rf
   L5UFl0iBcIBDZXCLN5lpiX3diVGnnCzAk16zmmJZodhJ9O+EnAcvZrX//
   AKJdfSjpQZHzti2G69nHHNB2sLjhMVQsPReDZ8iQWDAJu9WmbBZcYc6pA
   A==;
X-CSE-ConnectionGUID: Q+JXVaL8TUCCnZLKNqgPZQ==
X-CSE-MsgGUID: 1kjQDfiiTmqmlahSBRbQOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43189409"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43189409"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:34:37 -0800
X-CSE-ConnectionGUID: 7mMLFSe1TfyZcKF+ppglNA==
X-CSE-MsgGUID: rLKTPg5DTsuQDAB7MHKMoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116364495"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 02:34:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 68963EE; Thu, 06 Feb 2025 12:34:34 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/4] usb: xhci: move debug capabilities from trb_in_td() to handle_tx_event()
Date: Thu,  6 Feb 2025 12:34:26 +0200
Message-ID: <20250206103428.1034784-3-niklas.neronin@linux.intel.com>
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

Function trb_in_td() currently includes debug capabilities that are
triggered when its debug argument is set to true. The only consumer of
these debug capabilities is handle_tx_event(), which calls trb_in_td()
twice, once for its primary functionality and a second time solely for
debugging purposes if the first call returns 'NULL'.

This approach is inefficient and can lead to confusion, as trb_in_td()
executes the same code with identical arguments twice, differing only in
the debug output during the second execution.

To enhance clarity and efficiency, move the debug capabilities out of
trb_in_td() and integrates them directly into handle_tx_event().
This change reduces the argument count of trb_in_td() and ensures that
debug steps are executed only when necessary, streamlining the function's
operation.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 40 +++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 467a3abf8f53..a69972cc400c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -281,8 +281,7 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
  * If the suspect DMA address is a TRB in this TD, this function returns that
  * TRB's segment. Otherwise it returns 0.
  */
-static struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td,
-				      dma_addr_t suspect_dma, bool debug)
+static struct xhci_segment *trb_in_td(struct xhci_td *td, dma_addr_t suspect_dma)
 {
 	dma_addr_t start_dma;
 	dma_addr_t end_seg_dma;
@@ -301,15 +300,6 @@ static struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td,
 		/* If the end TRB isn't in this segment, this is set to 0 */
 		end_trb_dma = xhci_trb_virt_to_dma(cur_seg, td->end_trb);
 
-		if (debug)
-			xhci_warn(xhci,
-				"Looking for event-dma %016llx trb-start %016llx trb-end %016llx seg-start %016llx seg-end %016llx\n",
-				(unsigned long long)suspect_dma,
-				(unsigned long long)start_dma,
-				(unsigned long long)end_trb_dma,
-				(unsigned long long)cur_seg->dma,
-				(unsigned long long)end_seg_dma);
-
 		if (end_trb_dma > 0) {
 			/* The end TRB is in this segment, so suspect should be here */
 			if (start_dma <= end_trb_dma) {
@@ -1075,7 +1065,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 					 td->urb->stream_id);
 		hw_deq &= ~0xf;
 
-		if (td->cancel_status == TD_HALTED || trb_in_td(xhci, td, hw_deq, false)) {
+		if (td->cancel_status == TD_HALTED || trb_in_td(td, hw_deq)) {
 			switch (td->cancel_status) {
 			case TD_CLEARED: /* TD is already no-op */
 			case TD_CLEARING_CACHE: /* set TR deq command already queued */
@@ -1165,7 +1155,7 @@ static struct xhci_td *find_halted_td(struct xhci_virt_ep *ep)
 		hw_deq = xhci_get_hw_deq(ep->xhci, ep->vdev, ep->ep_index, 0);
 		hw_deq &= ~0xf;
 		td = list_first_entry(&ep->ring->td_list, struct xhci_td, td_list);
-		if (trb_in_td(ep->xhci, td, hw_deq, false))
+		if (trb_in_td(td, hw_deq))
 			return td;
 	}
 	return NULL;
@@ -2832,7 +2822,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 */
 	td = list_first_entry_or_null(&ep_ring->td_list, struct xhci_td, td_list);
 
-	if (td && td->error_mid_td && !trb_in_td(xhci, td, ep_trb_dma, false)) {
+	if (td && td->error_mid_td && !trb_in_td(td, ep_trb_dma)) {
 		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
@@ -2860,7 +2850,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				      td_list);
 
 		/* Is this a TRB in the currently executing TD? */
-		ep_seg = trb_in_td(xhci, td, ep_trb_dma, false);
+		ep_seg = trb_in_td(td, ep_trb_dma);
 
 		if (!ep_seg) {
 
@@ -2899,12 +2889,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			}
 
 			/* HC is busted, give up! */
-			xhci_err(xhci,
-				 "ERROR Transfer event TRB DMA ptr not part of current TD ep_index %d comp_code %u\n",
-				 ep_index, trb_comp_code);
-			trb_in_td(xhci, td, ep_trb_dma, true);
-
-			return -ESHUTDOWN;
+			goto debug_finding_td;
 		}
 
 		if (ep->skip) {
@@ -2957,6 +2942,19 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	return 0;
 
+debug_finding_td:
+	xhci_err(xhci, "Transfer event %u ep %d dma %016llx not part of current TD start %016llx end %016llx\n",
+		 trb_comp_code, ep_index, (unsigned long long)ep_trb_dma,
+		 (unsigned long long)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
+		 (unsigned long long)xhci_trb_virt_to_dma(td->end_seg, td->end_trb));
+
+	xhci_for_each_ring_seg(ep_ring->first_seg, ep_seg) {
+		xhci_warn(xhci, "Ring seg %u trb start %016llx end %016llx\n", ep_seg->num,
+			  (unsigned long long)ep_seg->dma,
+			  (unsigned long long)(ep_seg->dma + TRB_SEGMENT_SIZE));
+	}
+	return -ESHUTDOWN;
+
 err_out:
 	xhci_err(xhci, "@%016llx %08x %08x %08x %08x\n",
 		 (unsigned long long) xhci_trb_virt_to_dma(
-- 
2.47.2


