Return-Path: <linux-usb+bounces-21444-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27226A54E34
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A70C3A8833
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C1C18F2FB;
	Thu,  6 Mar 2025 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiIwYXZe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEB817C224
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272585; cv=none; b=F4EJP9EZQGQz7PID366k0s4ZSFeSOLo7cWs3gcJ0fNcQWxZkCSzep6b00cX5ZcVHR7zWc9CLrCaE4m9/lfX9689vWRoYi+n3uILUih3Q+4SAuXUPd9xRDXbQ0DwGDELqwB8qpVuZGZyAapCdoFmMEh4uNBfaonbqoYwkl4qMgLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272585; c=relaxed/simple;
	bh=kxR/DT4MfNB17dS4SWdmQTxXcMxvQTwz25wUAJt7Wiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKHID+tqtgbjEKcRt9Ec+5BmGOV/S7cWNAxcBAr7+e30VbEKLtL4byZrbJLXLPxrycfNTxKbukE85y174/NNYME3ZmZXXkBq8Aoq3mJrXK/Ypy7Uq8curVF1kCJqvoChAQpDY4LC1CsviyWpV5kGtrE2gVTTWEU0d5cgoaK6jtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiIwYXZe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272584; x=1772808584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kxR/DT4MfNB17dS4SWdmQTxXcMxvQTwz25wUAJt7Wiw=;
  b=aiIwYXZeSBow8Zsqn/PTdSnapVWC7G5Ifk+RUHm6hvCTIvxUQRC2HssQ
   huAkIEdNXP3252Azw3oqZHoH/671xU+5thueKXYwuDJgeO00b8omdD/oO
   9bd04g/S9oPK79zs3uI/KAeF3KQnlFgYDWn3xPdXWYsqMxOMhXAbaIRjS
   2CoUoOW+xeluoOv8TYop7h8pjhzrgkfikVu2HHS+zvDqkSFv5IcYTyERk
   DBitTtv/JH+d+3QtvVnTZPa/vZfx7+55iRB7wEj97QeCfKDI8oqd4lzdQ
   l5WNBWadWMtfDY+UN+K+e3BbCmpUH/wQeqMcPZ8oJ1bvny7bssHg3jxPn
   Q==;
X-CSE-ConnectionGUID: TxQZI1ogSJiDbBKX7V0+bQ==
X-CSE-MsgGUID: xsm91THNStSnE4L/pH3jMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657119"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657119"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:44 -0800
X-CSE-ConnectionGUID: rG3rYfTnRsC7sz/SmMc/EQ==
X-CSE-MsgGUID: l5zJpqi/SGaD0+6mv+Rz2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954852"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:42 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/15] usb: xhci: move debug capabilities from trb_in_td() to handle_tx_event()
Date: Thu,  6 Mar 2025 16:49:50 +0200
Message-ID: <20250306144954.3507700-12-mathias.nyman@linux.intel.com>
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

From: Niklas Neronin <niklas.neronin@linux.intel.com>

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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 38 ++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8c7258afb6bf..c2e15a27338b 100644
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
@@ -2800,7 +2790,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 */
 	td = list_first_entry_or_null(&ep_ring->td_list, struct xhci_td, td_list);
 
-	if (td && td->error_mid_td && !trb_in_td(xhci, td, ep_trb_dma, false)) {
+	if (td && td->error_mid_td && !trb_in_td(td, ep_trb_dma)) {
 		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
@@ -2833,7 +2823,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				      td_list);
 
 		/* Is this a TRB in the currently executing TD? */
-		ep_seg = trb_in_td(xhci, td, ep_trb_dma, false);
+		ep_seg = trb_in_td(td, ep_trb_dma);
 
 		if (!ep_seg) {
 
@@ -2893,12 +2883,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
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
@@ -2955,6 +2940,17 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	return 0;
 
+debug_finding_td:
+	xhci_err(xhci, "Event dma %pad for ep %d status %d not part of TD at %016llx - %016llx\n",
+		 &ep_trb_dma, ep_index, trb_comp_code,
+		 (unsigned long long)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
+		 (unsigned long long)xhci_trb_virt_to_dma(td->end_seg, td->end_trb));
+
+	xhci_for_each_ring_seg(ep_ring->first_seg, ep_seg)
+		xhci_warn(xhci, "Ring seg %u dma %pad\n", ep_seg->num, &ep_seg->dma);
+
+	return -ESHUTDOWN;
+
 err_out:
 	xhci_err(xhci, "@%016llx %08x %08x %08x %08x\n",
 		 (unsigned long long) xhci_trb_virt_to_dma(
-- 
2.43.0


