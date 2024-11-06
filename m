Return-Path: <linux-usb+bounces-17203-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF1C9BE3F6
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39AC01C2144D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365811DE8BA;
	Wed,  6 Nov 2024 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnIU3Xpt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE0A1DE8AA
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888011; cv=none; b=JDqq7Qvqb0wtyvn2hIzMD7ugUgXQBilTbqqbcQ2owyzauLDHry+h/Mpl3rs9k9r1RY+PnwRwmNb+59jmvawff3Td6Pj3pNqYXVlGeF3+Ldc55lcYrV0fSYj9vdpjK5qoh3a9xYQ9QOeEkkrYqk4mRzdEMcgsBKkXtE2pGaZng6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888011; c=relaxed/simple;
	bh=BsqcQoLz31NUGk4D30J66jxMbQhfN7Jun3SYK0RaRmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gStVEibSo+YJ4yA00bYJDYatRr44HWnP55WmakP9SZsZKwYgXNetsFESr4AXbz49yzlYvc2M0seJEJqhb0SGPlylF2SYKjCQO+aeW5fWwhrHSomXKr0vaom18EvkvsqtAk2q7iHYlPX6l9mZ7JPNGhHLWG7MmnHYc+KdNdfWWcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnIU3Xpt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730888010; x=1762424010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BsqcQoLz31NUGk4D30J66jxMbQhfN7Jun3SYK0RaRmg=;
  b=gnIU3XptlkzQwkzvJZ6c20Rqy8qJpj59IoZK6PQXs7FES93Zi/i1g6YT
   PnDiaQHqHjCeBL/Kl+iijnip6phbWbBaXExDGEa1cElRdGGW2M34Cc1NX
   jMGyfsSMCrbHRt25r6N79k9gea42QuOD9X2KbXqsK58isgq4OCje8hW8Z
   Ss+d7TmGtfouBt4kwplVgCy5mw7M4N08q+7orat5gIMSdFem1XBXe8FxD
   LLSKf/XJNu4x3lVDZlbXF5HeTd+QWOlym4J9zeq/NT4UHY5EHxALXq4/1
   gNDutR6s4ArJ8IHOpXh4FbFhw8R9s6dFri3hc25rM3cfBrqeuG8s9hlrk
   w==;
X-CSE-ConnectionGUID: 4c5Wz+/gR5qQcuAW2yYhZw==
X-CSE-MsgGUID: a1TdEZyWSUC+TIxbN6RYCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059475"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059475"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:30 -0800
X-CSE-ConnectionGUID: UvbTm1KlQNGF+EcY3uRYqg==
X-CSE-MsgGUID: oBrppINQSUeg3efkk/ekmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813443"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:29 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 28/33] usb: xhci: refactor xhci_td_cleanup() to return void
Date: Wed,  6 Nov 2024 12:14:54 +0200
Message-Id: <20241106101459.775897-29-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
References: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The function is modified to return 'void' instead of an integer since it
invariably returns '0'. Additionally, multiple functions which only
return xhci_td_cleanup() are also refactored to return void.

This change eliminates the need for callers to handle a return value that
does not convey meaningful information and improve code readability, as it
becomes immediately clear that the function does not produce a significant
output.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 59 +++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5fb3d771c429..e48ee58fdb46 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -813,8 +813,8 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
 	seg->bounce_offs = 0;
 }
 
-static int xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
-			   struct xhci_ring *ep_ring, int status)
+static void xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
+			    struct xhci_ring *ep_ring, int status)
 {
 	struct urb *urb = NULL;
 
@@ -857,8 +857,6 @@ static int xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
 			status = 0;
 		xhci_giveback_urb_in_irq(xhci, td, status);
 	}
-
-	return 0;
 }
 
 
@@ -2187,9 +2185,9 @@ int xhci_is_vendor_info_code(struct xhci_hcd *xhci, unsigned int trb_comp_code)
 	return 0;
 }
 
-static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
-		     struct xhci_ring *ep_ring, struct xhci_td *td,
-		     u32 trb_comp_code)
+static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+		      struct xhci_ring *ep_ring, struct xhci_td *td,
+		      u32 trb_comp_code)
 {
 	struct xhci_ep_ctx *ep_ctx;
 
@@ -2204,7 +2202,7 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		 * stopped TDs. A stopped TD may be restarted, so don't update
 		 * the ring dequeue pointer or take this TD off any lists yet.
 		 */
-		return 0;
+		return;
 	case COMP_USB_TRANSACTION_ERROR:
 	case COMP_BABBLE_DETECTED_ERROR:
 	case COMP_SPLIT_TRANSACTION_ERROR:
@@ -2230,7 +2228,7 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 				xhci_dbg(xhci, "Already resolving halted ep for 0x%llx\n",
 					 (unsigned long long)xhci_trb_virt_to_dma(
 						 td->start_seg, td->start_trb));
-				return 0;
+				return;
 			}
 			/* endpoint not halted, don't reset it */
 			break;
@@ -2238,7 +2236,7 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		/* Almost same procedure as for STALL_ERROR below */
 		xhci_clear_hub_tt_buffer(xhci, td, ep);
 		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
-		return 0;
+		return;
 	case COMP_STALL_ERROR:
 		/*
 		 * xhci internal endpoint state will go to a "halt" state for
@@ -2255,7 +2253,7 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 
 		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
 
-		return 0; /* xhci_handle_halted_endpoint marked td cancelled */
+		return; /* xhci_handle_halted_endpoint marked td cancelled */
 	default:
 		break;
 	}
@@ -2265,7 +2263,7 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	ep_ring->deq_seg = td->end_seg;
 	inc_deq(xhci, ep_ring);
 
-	return xhci_td_cleanup(xhci, td, ep_ring, td->status);
+	xhci_td_cleanup(xhci, td, ep_ring, td->status);
 }
 
 /* sum trb lengths from the first trb up to stop_trb, _excluding_ stop_trb */
@@ -2285,9 +2283,9 @@ static u32 sum_trb_lengths(struct xhci_td *td, union xhci_trb *stop_trb)
 /*
  * Process control tds, update urb status and actual_length.
  */
-static int process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
-		struct xhci_ring *ep_ring,  struct xhci_td *td,
-			   union xhci_trb *ep_trb, struct xhci_transfer_event *event)
+static void process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+			    struct xhci_ring *ep_ring,  struct xhci_td *td,
+			    union xhci_trb *ep_trb, struct xhci_transfer_event *event)
 {
 	struct xhci_ep_ctx *ep_ctx;
 	u32 trb_comp_code;
@@ -2366,7 +2364,7 @@ static int process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->urb_length_set = true;
 		td->urb->actual_length = requested - remaining;
 		xhci_dbg(xhci, "Waiting for status stage event\n");
-		return 0;
+		return;
 	}
 
 	/* at status stage */
@@ -2374,15 +2372,15 @@ static int process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->urb->actual_length = requested;
 
 finish_td:
-	return finish_td(xhci, ep, ep_ring, td, trb_comp_code);
+	finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
 /*
  * Process isochronous tds, update urb packet status and actual_length.
  */
-static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
-		struct xhci_ring *ep_ring, struct xhci_td *td,
-		union xhci_trb *ep_trb, struct xhci_transfer_event *event)
+static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+			    struct xhci_ring *ep_ring, struct xhci_td *td,
+			    union xhci_trb *ep_trb, struct xhci_transfer_event *event)
 {
 	struct urb_priv *urb_priv;
 	int idx;
@@ -2476,14 +2474,13 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	if (td->error_mid_td && ep_trb != td->end_trb) {
 		xhci_dbg(xhci, "Error mid isoc TD, wait for final completion event\n");
 		td->urb_length_set = true;
-		return 0;
+		return;
 	}
-
-	return finish_td(xhci, ep, ep_ring, td, trb_comp_code);
+	finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
-static int skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
-			struct xhci_virt_ep *ep, int status)
+static void skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
+			 struct xhci_virt_ep *ep, int status)
 {
 	struct urb_priv *urb_priv;
 	struct usb_iso_packet_descriptor *frame;
@@ -2504,15 +2501,15 @@ static int skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
 	ep->ring->deq_seg = td->end_seg;
 	inc_deq(xhci, ep->ring);
 
-	return xhci_td_cleanup(xhci, td, ep->ring, status);
+	xhci_td_cleanup(xhci, td, ep->ring, status);
 }
 
 /*
  * Process bulk and interrupt tds, update urb status and actual_length.
  */
-static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
-		struct xhci_ring *ep_ring, struct xhci_td *td,
-		union xhci_trb *ep_trb, struct xhci_transfer_event *event)
+static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+				 struct xhci_ring *ep_ring, struct xhci_td *td,
+				 union xhci_trb *ep_trb, struct xhci_transfer_event *event)
 {
 	struct xhci_slot_ctx *slot_ctx;
 	u32 trb_comp_code;
@@ -2555,7 +2552,7 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->status = 0;
 
 		xhci_handle_halted_endpoint(xhci, ep, td, EP_SOFT_RESET);
-		return 0;
+		return;
 	default:
 		/* do nothing */
 		break;
@@ -2574,7 +2571,7 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->urb->actual_length = 0;
 	}
 
-	return finish_td(xhci, ep, ep_ring, td, trb_comp_code);
+	finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
 /* Transfer events which don't point to a transfer TRB, see xhci 4.17.4 */
-- 
2.25.1


