Return-Path: <linux-usb+bounces-16372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B889A2303
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 15:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D79D1C224B6
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 13:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90731DE2B2;
	Thu, 17 Oct 2024 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uvc+MswO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F61DDC23
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170449; cv=none; b=Bfl7v10yHCnilCai7L+MOQq+7BQMBv2foh/aKd0PCExYo9zgDuA0BmlLAHYPZMH6h1/J74GGRaGI/t4KSLkMle7gMGBLRFIkXXgCv7Ssz4XxmAEL49SShI6/npwvYynC4J/2e/+tjvFF1Vsf8eRcwBdWRen9BC7ZaYnXd/66EH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170449; c=relaxed/simple;
	bh=+yKwzp8zmeEWPUGogpPmzgX6GaQlsSAaDknlIJFpnUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BKqEZG/VsrCRm5YpE4GaHxpOMFX5W8d8cHSH1ZAkHlSPtjIDG59gt44nIgpNeAU7FNqIF5GpBwKvo3lcQhu56v2x8yfYtZA91M10qa6OWEEGWPh68TMt4L1LsMLIT/1J5AC9E7FCRUGRvOnPPEvYFKdZo0C9E8dT9HSUGO5l2A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uvc+MswO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729170446; x=1760706446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+yKwzp8zmeEWPUGogpPmzgX6GaQlsSAaDknlIJFpnUU=;
  b=Uvc+MswOiogyxc0d428NXQV2+5xqXzco/vd93YBmrpMJgbQNg3KGgj2R
   tMGPT/5d9QgQJdYlKYUpYOZ7nvw0hPeqSbX9V53eNz2QazFqXsv7rRhaQ
   nVzdrAFTnSoprD8YRrcER4TCcwzuTWqEQ6VzDKMqcrFh/mCnAv5pRLxcq
   TwFrQ3UAMhdN0Oh1T0cvCC7NE4K1AD0Jtw5hqyHyR9expiROT0oV1wWdu
   vySRas4HBuXfKEM0uyH0JYF7Co2EoRVnOl0wXqnCVYSnrsu13FUb1B8mq
   9IoMpVSf2mjK9qwwI5A2+bzFvgxUG4vBtiROLVYgK1y2JhqZGiebmguJs
   Q==;
X-CSE-ConnectionGUID: RI4X1te2RVOqCfN1+Pcygg==
X-CSE-MsgGUID: klFI0tZ1TZ68mAsDzBjwpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="32452112"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="32452112"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 06:07:24 -0700
X-CSE-ConnectionGUID: Z0mKS/RHQ3Orh4BiBgELQA==
X-CSE-MsgGUID: PoeRRwekSw+8JOqc5OH71g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="109354610"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 17 Oct 2024 06:07:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 46B3B3D2; Thu, 17 Oct 2024 16:07:22 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 6/8] usb: xhci: refactor xhci_td_cleanup() to return void
Date: Thu, 17 Oct 2024 16:05:06 +0300
Message-ID: <20241017130508.1293021-7-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
References: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is modified to return 'void' instead of an integer since it
invariably returns '0'. Additionally, multiple functions which only
return xhci_td_cleanup() are also refactored to return void.

This change eliminates the need for callers to handle a return value that
does not convey meaningful information and improve code readability, as it
becomes immediately clear that the function does not produce a significant
output.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 59 +++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e2e20ae424ad..13eadee89839 100644
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
2.45.2


