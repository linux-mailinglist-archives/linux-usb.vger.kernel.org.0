Return-Path: <linux-usb+bounces-37900-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHr5Ewc5D2rUHwYAu9opvQ
	(envelope-from <linux-usb+bounces-37900-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 18:55:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCF15A9AFF
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 18:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1F6E319C2FF
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 15:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA2F357D0C;
	Thu, 21 May 2026 15:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dv3VYTOJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF90A35675E
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377253; cv=none; b=tXQRgBuWi/WgNcxD28JQ+B3/kYRx0CKMXcapNcIPK3Su8cxTvOeDcMpwTKJjTwyWpn2OkUBeLNNXNZHdCpQ1iS1V1Bw0R51tYoF2d1BIvbcDtGr+PNf8ZtBluwNOISv0PEQBOkqbnPZ1nG+QCF3rAy+no4LBsqTzsHcy8vdKFR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377253; c=relaxed/simple;
	bh=HCudP5A8SfwP0SWk8LeUFmnETxsIut1DFlSxhOx/boo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPp7TzQxxwrRCA3vrKmPnueqSXZWYn+zllhy1dn/K/pdXYgwnoA8yJgEG4p3GZFeUL7Of6WbCaQKH/hsZrP4M3HE7wZcHJaIucK2laMAx2SdKFhWFVJ3gEEsDx99+F2HsAj2Az8GlNROjPZUmmMHs8q3FAFs+/oN6ky2u83EHGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dv3VYTOJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779377251; x=1810913251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HCudP5A8SfwP0SWk8LeUFmnETxsIut1DFlSxhOx/boo=;
  b=dv3VYTOJbHr1hj8tnRBiOyZ4XHXsbWJURNxuvSWomjZHF2/lP2c39eqW
   HmeaFvH8vc01bPpW5ddJLPioCUqI6OZTWXsCbJKPbxNxlhuKAz9SMVIGR
   TxoP1RBUzjhUJ4BHfiXm0REFihd5alUmY8hx/16oq9KU1CTVNvzBm4PKO
   0WnBNOEUoS175h23AX6OCL6EhxsLLCmtni5HmSAQZVLL1YtBzPAuesz9f
   6yhlS4GIvyomGFzQRfCDI4bMn4AZxZH2GHJ3ryriArWuGN9ITwRawF48L
   hMnWneoyZUCuNdqzwf6plU5o4kSMCV7k2m8N4AYVmkRqOJdncEypnPKjS
   g==;
X-CSE-ConnectionGUID: az4qj6JSTn66MjohbPTZpQ==
X-CSE-MsgGUID: MOXvpkL/SaeeUDf6sjtP4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91406267"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="91406267"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:27:31 -0700
X-CSE-ConnectionGUID: mksR42egT1+zlzbzekwXIg==
X-CSE-MsgGUID: 6OwYAtXWRLyEtvOECoDf5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="236306693"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.42])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:27:30 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: dylan_robinson@motu.com,
	michal.pecio@gmail.com
Cc: mathias.nyman@linux.intel.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	stern@rowland.harvard.edu
Subject: [RFT PATCHv3 3/3] xhci: tune urb->start_frame in ring overrun and underrun cases
Date: Thu, 21 May 2026 18:27:14 +0300
Message-ID: <20260521152715.288995-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521152715.288995-1-mathias.nyman@linux.intel.com>
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
 <20260521152715.288995-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37900-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[motu.com,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: BCCF15A9AFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make sure a new urb->start_frame is calculated for isoc URBs submitted late
mid stream, i.e. isoc URB is submitted to an empty ring after a ring
underrun or overrun event.

If URB was queud late, but before xhci driver handles the ring
underrun/overrun event then kick the urb->start_frame forward by one
ESIT for that delayed URB.

the gap in urb->start_frame allows class drivers to detect the glitch
in isochronous transfers.

if xHCI uses Contiguous Frame ID Capability (CFC) then xHC will
synchronize each TD to its frame ID, and the late TDs of the URB
will be skipped instead of lagging the transfer, so don't touch
urb->start_frame or ep->next_uframe in CFC cases

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 76 ++++++++++++++++++++++--------------
 drivers/usb/host/xhci.h      |  1 +
 2 files changed, 48 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 55a10d1e70cb..fa431640861d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2624,6 +2624,40 @@ static bool xhci_spurious_success_tx_event(struct xhci_hcd *xhci,
 		return false;
 	}
 }
+/* called for isoc enpoints to handle overrun and underrun transfer events */
+static int handle_tx_event_overunderrun(struct xhci_virt_ep *ep)
+{
+	struct xhci_td *td;
+	struct urb *urb;
+	u32 uinterval;
+
+	/* don't touch ep->next_uframe and urb->start_frame if CFC frame sync is used */
+	if (!ep->last_td_used_sia)
+		return 0;   // what about skip??
+
+	/* re-calculate urb->start_frame on next urb enqueue */
+	if (list_empty(&ep->ring->td_list)) {
+		ep->next_uframe = -2; // FIXME define something, or use suitable -EXXX
+		ep->skip = false;  // maybe, or is it the wrong place?
+		return 0;
+	}
+
+	/* ep has tds, but queued late for its ESIT, adjust start_frame and next_uframe */
+	/* FIXME may have several URBs queued (unlikely) */
+	td = list_first_entry(&ep->ring->td_list, struct xhci_td, td_list);
+	urb = td->urb;
+	uinterval = urb->interval;
+
+	if (urb->dev->speed == USB_SPEED_LOW || urb->dev->speed == USB_SPEED_FULL)
+		uinterval *= 8;
+
+	ep->next_uframe += uinterval;
+	urb->start_frame += urb->interval;
+
+	return 0;
+	/* FIXME: ep_ring->old_trb_comp_code = trb_comp_code; */
+	/* FIXME: if (ep->skip) */
+}
 
 /*
  * If this function returns an error condition, it means it got a Transfer
@@ -2644,7 +2678,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	int status = -EINPROGRESS;
 	struct xhci_ep_ctx *ep_ctx;
 	u32 trb_comp_code;
-	bool ring_xrun_event = false;
 
 	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
 	ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
@@ -2754,11 +2787,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * Underrun Event for OUT Isoch endpoint.
 		 */
 		xhci_dbg(xhci, "Underrun event on slot %u ep %u\n", slot_id, ep_index);
-		ring_xrun_event = true;
 		break;
 	case COMP_RING_OVERRUN:
 		xhci_dbg(xhci, "Overrun event on slot %u ep %u\n", slot_id, ep_index);
-		ring_xrun_event = true;
 		break;
 	case COMP_MISSED_SERVICE_ERROR:
 		/*
@@ -2823,6 +2854,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !ep_trb_dma)
 		return 0;
 
+	if (trb_comp_code == COMP_RING_UNDERRUN || trb_comp_code == COMP_RING_OVERRUN)
+		return handle_tx_event_overunderrun(ep);
+
 	if (list_empty(&ep_ring->td_list)) {
 		/*
 		 * Don't print wanings if ring is empty due to a stopped endpoint generating an
@@ -2832,7 +2866,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 */
 		if (trb_comp_code != COMP_STOPPED &&
 		    trb_comp_code != COMP_STOPPED_LENGTH_INVALID &&
-		    !ring_xrun_event &&
 		    !xhci_spurious_success_tx_event(xhci, ep_ring)) {
 			xhci_warn(xhci, "Event TRB for slot %u ep %u with no TDs queued\n",
 				  slot_id, ep_index);
@@ -2856,20 +2889,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 				skip_isoc_td(xhci, td, ep, status);
 
-				if (!list_empty(&ep_ring->td_list)) {
-					if (ring_xrun_event) {
-						/*
-						 * If we are here, we are on xHCI 1.0 host with no
-						 * idea how many TDs were missed or where the xrun
-						 * occurred. New TDs may have been added after the
-						 * xrun, so skip only one TD to be safe.
-						 */
-						xhci_dbg(xhci, "Skipped one TD for slot %u ep %u",
-								slot_id, ep_index);
-						return 0;
-					}
+				if (!list_empty(&ep_ring->td_list))
 					continue;
-				}
 
 				xhci_dbg(xhci, "All TDs skipped for slot %u ep %u. Clear skip flag.\n",
 					 slot_id, ep_index);
@@ -2878,10 +2899,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				goto check_endpoint_halted;
 			}
 
-			/* TD was queued after xrun, maybe xrun was on a link, don't panic yet */
-			if (ring_xrun_event)
-				return 0;
-
 			/*
 			 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
 			 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
@@ -2926,10 +2943,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	ep_ring->old_trb_comp_code = trb_comp_code;
 
-	/* Get out if a TD was queued at enqueue after the xrun occurred */
-	if (ring_xrun_event)
-		return 0;
-
 	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb, ep_trb_dma);
 
 	/*
@@ -4042,11 +4055,14 @@ static int xhci_get_isoc_start_frame(struct xhci_hcd *xhci, struct urb *urb,
 
 	// FIXME, used to check if !list_empty(&ep_ring->td_list)), is that reliable
 
-	/* Is this the first URB starting the whole isoc transfer */
+	/*  first URB starting the whole isoc transfer, or restart after over/under-run */
 	if (ep->next_uframe < 0) {
-		/* align first URB to next interval boundary, or at last to full frame */
-		start_uframe = mfindex + ist + XHCI_CFC_DELAY;
-		start_uframe = roundup(start_uframe, 8);
+		start_uframe = mfindex + ist;
+		/* if first URB then add additinal delay and align to full frame */
+		if (ep->next_uframe == -1) {
+			start_uframe += XHCI_CFC_DELAY;
+			start_uframe = roundup(start_uframe, 8);
+		}
 		start_uframe = roundup(start_uframe, uinterval) % MAX_UFRAMES;
 	} else {
 		/* URB is mid stream and expected to handle the next frame */
@@ -4166,8 +4182,10 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		if (xhci_isoc_td_uses_frame_id(xhci, urb, xep, i)) {
 			sia_frame_id = (start_uframe + i * uinterval) / 8;
 			sia_frame_id = TRB_FRAME_ID(sia_frame_id % MAX_FRAMES);
+			xep->last_td_used_sia = false;
 		} else {
 			sia_frame_id = TRB_SIA;
+			xep->last_td_used_sia = true;
 		}
 
 		/*
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index bcb7b8c877db..19d6f3104a15 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -702,6 +702,7 @@ struct xhci_virt_ep {
 	unsigned long		stop_time;
 	/* Isoch Frame ID checking storage */
 	int			next_uframe;
+	bool			last_td_used_sia;
 	/* Use new Isoch TRB layout needed for extended TBC support */
 	bool			use_extended_tbc;
 	/* set if this endpoint is controlled via sideband access*/
-- 
2.43.0


