Return-Path: <linux-usb+bounces-5265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FE83283D
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 11:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 763271C22890
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 10:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961B43C493;
	Fri, 19 Jan 2024 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGDF8LAb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0CB4C602
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705661847; cv=none; b=VqliwiYBfIL8kbTmH5AY8Ys8nkxJ1drOISZkXhv/ZWLXaWoXTdyMkgQlOQJ4WqYzWy9CGYh9C+tmAm0E5Rv7gdlrENsZL/jlsIWoUcnixvOk7pFhrYJifsFpcOYwcGQPAuTk2rTdO4+Brw5Nbr2xcwhyihhJGitxbxWStdVte94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705661847; c=relaxed/simple;
	bh=0eNB9JBlujBDzeQttlV9jSomkuDem7WZ0wcgyCCqDVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OpfsjqIaZfJTA+Axcx41ewwY4itXAvgSokHcL5f4OjHDAuCULsdycHTQjErzO8rHT2gTk86bQ7KkvhPODA55LY/m+eyT0jwM3YScEkJCx7TDTv+ZNqtAMe+xIKUxxWP3KiCNJcT/7GO9vvcil+2VZwBZdQAQj2+703tD/Hl1SOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGDF8LAb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705661846; x=1737197846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0eNB9JBlujBDzeQttlV9jSomkuDem7WZ0wcgyCCqDVU=;
  b=mGDF8LAbYIL2/gh2O313GMTnz4IzheajT1qGnf9E+IxQZyMKHI7JOIZ3
   QZMu+14pnaITlZq4iQFkNFVtEhVPeOL6NbfSdKEhLzXy9O3FX+ANadqH7
   8C5Za8V+mP4iEteAR+/9esqdfxuduNKM8nNSSPAzJeSnKC0XTgdHwdZVC
   XLCOAhqHOdsD0xq83TAd79BhCxn4vk8gfBmdS70fO7+beigg8WlFf+pLb
   I6k12gJwZLyUIxEjOB0+hMi0uYkUrVAaELHZapa4/fmTuVSOzOy8QFERd
   ADv7Y14EtTir5Tci6DskNpOAX07pA+cPdWDBnNaNDWvN38P+rxWjywnAE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="8121065"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="8121065"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 02:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="819038933"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="819038933"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2024 02:57:09 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: michal.pecio@gmail.com
Cc: linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RTF PATCH v3] xhci: process isoc TD properly when there was an error mid TD.
Date: Fri, 19 Jan 2024 12:58:35 +0200
Message-Id: <20240119105835.2637358-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2c2d8711-3d2b-e943-a2a0-75637e725dc3@linux.intel.com>
References: <2c2d8711-3d2b-e943-a2a0-75637e725dc3@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The last TRB of a isoc TD might not trigger an event if there was
an error event for a TRB mid TD. This is seen on a NEC Corporation
uPD720200 USB 3.0 Host

After an error mid a multi-TRB TD the xHC should according to xhci 4.9.1
generate events for passed TRBs with IOC flag set if it proceeds to the
next TD. This event is either a copy of the original error, or a
"success" transfer event.

If that event is missing then the driver and xHC host get out of sync as
the driver is still expecting a transfer event for that first TD, while
xHC host is already sending events for the next TD in the list.
This leads to
"Transfer event TRB DMA ptr not part of current TD" messages.

As a solution we tag the isoc TDs that get error events mid TD.
If an event doesn't match the first TD, then check if the tag is
set, and event points to the next TD.
In that case give back the fist TD and process the next TD normally

Make sure TD status and transferred length stay valid in both cases
with and without final TD completion event.

Reported-by: Michał Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
  v2 -> v3
  - Rework and fix setting TD transfer lengt issue in v2
  - Minor commit message tuning 

  v1 -> v2:
  - Check for empty TD list, suggested by Michał
  - Don't overwrite error status, suggested by Michał
  - Add a debug print for missed TD completion event, suggested by Michał
  - Reword commit message and code comments
  - Set correct TD transfer length in isoc error case


drivers/usb/host/xhci-ring.c | 74 +++++++++++++++++++++++++++++-------
 drivers/usb/host/xhci.h      |  1 +
 2 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 33806ae966f9..41be7d31a36e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2376,6 +2376,9 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	/* handle completion code */
 	switch (trb_comp_code) {
 	case COMP_SUCCESS:
+		/* Don't overwrite status if TD had an error, see xHCI 4.9.1 */
+		if (td->error_mid_td)
+			break;
 		if (remaining) {
 			frame->status = short_framestatus;
 			if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
@@ -2401,8 +2404,9 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	case COMP_USB_TRANSACTION_ERROR:
 		frame->status = -EPROTO;
+		sum_trbs_for_length = true;
 		if (ep_trb != td->last_trb)
-			return 0;
+			td->error_mid_td = true;
 		break;
 	case COMP_STOPPED:
 		sum_trbs_for_length = true;
@@ -2422,6 +2426,9 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	}
 
+	if (td->urb_length_set)
+		goto finish_td;
+
 	if (sum_trbs_for_length)
 		frame->actual_length = sum_trb_lengths(xhci, ep->ring, ep_trb) +
 			ep_trb_len - remaining;
@@ -2430,6 +2437,14 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 
 	td->urb->actual_length += frame->actual_length;
 
+finish_td:
+	/* Don't give back TD yet if we encountered an error mid TD */
+	if (td->error_mid_td && ep_trb != td->last_trb) {
+		xhci_dbg(xhci, "Error mid isoc TD, wait for final completion event\n");
+		td->urb_length_set = true;
+		return 0;
+	}
+
 	return finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
@@ -2808,17 +2823,51 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		}
 
 		if (!ep_seg) {
-			if (!ep->skip ||
-			    !usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
-				/* Some host controllers give a spurious
-				 * successful event after a short transfer.
-				 * Ignore it.
-				 */
-				if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
-						ep_ring->last_td_was_short) {
-					ep_ring->last_td_was_short = false;
-					goto cleanup;
+
+			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
+				skip_isoc_td(xhci, td, ep, status);
+				goto cleanup;
+			}
+
+			/*
+			 * Some hosts give a spurious success event after a short
+			 * transfer. Ignore it.
+			 */
+			if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
+			    ep_ring->last_td_was_short) {
+				ep_ring->last_td_was_short = false;
+				goto cleanup;
+			}
+
+			/*
+			 * xhci 4.10.2 states isoc endpoints should continue
+			 * processing the next TD if there was an error mid TD.
+			 * So host like NEC don't generate an event for the last
+			 * isoc TRB even if the IOC flag is set.
+			 * xhci 4.9.1 states that if there are errors in mult-TRB
+			 * TDs xHC should generate an error for that TRB, and if xHC
+			 * proceeds to the next TD it should genete an event for
+			 * any TRB with IOC flag on the way. Other host follow this.
+			 * So this event might be for the next TD.
+			 */
+			if (td->error_mid_td &&
+			    !list_is_last(&td->td_list, &ep_ring->td_list)) {
+				struct xhci_td *td_next = list_next_entry(td, td_list);
+
+				ep_seg = trb_in_td(xhci, td_next->start_seg, td_next->first_trb,
+						   td_next->last_trb, ep_trb_dma, false);
+				if (ep_seg) {
+					/* give back previous TD, start handling new */
+					xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
+					ep_ring->dequeue = td->last_trb;
+					ep_ring->deq_seg = td->last_trb_seg;
+					inc_deq(xhci, ep_ring);
+					xhci_td_cleanup(xhci, td, ep_ring, td->status);
+					td = td_next;
 				}
+			}
+
+			if (!ep_seg) {
 				/* HC is busted, give up! */
 				xhci_err(xhci,
 					"ERROR Transfer event TRB DMA ptr not "
@@ -2830,9 +2879,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					  ep_trb_dma, true);
 				return -ESHUTDOWN;
 			}
-
-			skip_isoc_td(xhci, td, ep, status);
-			goto cleanup;
 		}
 		if (trb_comp_code == COMP_SHORT_PACKET)
 			ep_ring->last_td_was_short = true;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a5c72a634e6a..6f82d404883f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1549,6 +1549,7 @@ struct xhci_td {
 	struct xhci_segment	*bounce_seg;
 	/* actual_length of the URB has already been set */
 	bool			urb_length_set;
+	bool			error_mid_td;
 	unsigned int		num_trbs;
 };
 
-- 
2.25.1


