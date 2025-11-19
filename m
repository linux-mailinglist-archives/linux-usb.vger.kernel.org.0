Return-Path: <linux-usb+bounces-30711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6DBC6F502
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 891AA3A227A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FDF369234;
	Wed, 19 Nov 2025 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsYr0DFI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629B536996C
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562293; cv=none; b=V5YlBAjRFj/UL92sDipWrF2+oAkPN0KlX4Nj0B44gRtBBOoHf8+q2dHaMflyESAosppxx9HfvF3hFrVYZ0373hvnJOZfnRCL7QFkBHtiWH9akrOpWtHGSMIyFnp8+QuJeG6MLOQbDBtblounREUd1RdIko1x1k7naLS59FXKr7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562293; c=relaxed/simple;
	bh=Hoew8eBxr66iOekjMy7kuxBoXdNS3GHiJD8i4T+SW0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFskDwb2UiZ2+WNZsqhPNZ3fjf2j/DJvOoMKAwp1b5OCLSWu6UudXoIeUBpIxhKdFtNxTFomaAukdotvZYFnk5+n5s3e2BAKTOGi8TtZN5IbXL8sI9yFOYSCbJw/GVt1Rjlh6fWiua/M9kXEMwHZFxQAXgF8Le+o51qHmtKeHLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsYr0DFI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562292; x=1795098292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hoew8eBxr66iOekjMy7kuxBoXdNS3GHiJD8i4T+SW0k=;
  b=DsYr0DFImYqSaRgu6ge7BH1GMBVpVDtEPVMLGZeq/lc8NMdbLM4Kewim
   TFzBDUZGwsMe0nKH+fslvzO3/C+qRl+gVn0xVeSdsZ0/6zakOQCk7AJI4
   qLqUYIpO10N3OW3tuZJxEOHG4P/BIa4SxTzDh9ECuDfbofQDOrDU3b00d
   h+3qvzreBINxiBAzQRUwcLplY1Q/gKKFpzjEhmncHUNdBzis5kODSc7LI
   +fbCqNAMKJleUYS3we27GtdWjnJOMw7pDe921+K55wLV8ViYkYaqWO044
   rqHBJkYP0fOJmDR0VWDyfS8SAtQFzC334TN5q9pNlQitDQHIwKhEvdG/3
   w==;
X-CSE-ConnectionGUID: A9EFQLpxT0GK5tOS5BaKfA==
X-CSE-MsgGUID: pD3rMGrORgW3XvLlLQ9+LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645537"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645537"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:51 -0800
X-CSE-ConnectionGUID: b42XepxqQnyyKMnJZKFFig==
X-CSE-MsgGUID: 7DmNJAWET96lph9QQkcVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992057"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:50 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/23] usb: xhci: Don't unchain link TRBs on quirky HCs
Date: Wed, 19 Nov 2025 16:24:04 +0200
Message-ID: <20251119142417.2820519-11-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

Some old HCs ignore transfer ring link TRBs whose chain bit is unset.
This breaks endpoint operation and sometimes makes it execute other
ring's TDs, which may corrupt their buffers or cause unwanted device
action. We avoid this by chaining all link TRBs on affected rings.

Fix an omission which allows them to be unchained by cancelling TDs.

The patch was tested by reproducing this condition on an isochronous
endpoint (non-power-of-two TDs are sometimes split not to cross 64K)
and printing link TRBs in trb_to_noop() on good and buggy HCs.

Actual hardware malfunction is rare since it requires Missed Service
Error shortly before the unchained link TRB, at least on NEC and AMD.
I have never seen it after commit bb0ba4cb1065 ("usb: xhci: Apply the
link chain quirk on NEC isoc endpoints"), but it's Russian roulette
and I can't test all affected hosts and workloads. Fairly often MSEs
happen after cancellation because the endpoint was stopped.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 95005f9a3504..5acec9143811 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -145,11 +145,11 @@ static void inc_td_cnt(struct urb *urb)
 	urb_priv->num_tds_done++;
 }
 
-static void trb_to_noop(union xhci_trb *trb, u32 noop_type)
+static void trb_to_noop(union xhci_trb *trb, u32 noop_type, bool unchain_links)
 {
 	if (trb_is_link(trb)) {
-		/* unchain chained link TRBs */
-		trb->link.control &= cpu_to_le32(~TRB_CHAIN);
+		if (unchain_links)
+			trb->link.control &= cpu_to_le32(~TRB_CHAIN);
 	} else {
 		trb->generic.field[0] = 0;
 		trb->generic.field[1] = 0;
@@ -466,7 +466,7 @@ static void xhci_handle_stopped_cmd_ring(struct xhci_hcd *xhci,
 		xhci_dbg(xhci, "Turn aborted command %p to no-op\n",
 			 i_cmd->command_trb);
 
-		trb_to_noop(i_cmd->command_trb, TRB_CMD_NOOP);
+		trb_to_noop(i_cmd->command_trb, TRB_CMD_NOOP, false);
 
 		/*
 		 * caller waiting for completion is called when command
@@ -798,13 +798,18 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
  * (The last TRB actually points to the ring enqueue pointer, which is not part
  * of this TD.)  This is used to remove partially enqueued isoc TDs from a ring.
  */
-static void td_to_noop(struct xhci_td *td, bool flip_cycle)
+static void td_to_noop(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+			struct xhci_td *td, bool flip_cycle)
 {
+	bool unchain_links;
 	struct xhci_segment *seg	= td->start_seg;
 	union xhci_trb *trb		= td->start_trb;
 
+	/* link TRBs should now be unchained, but some old HCs expect otherwise */
+	unchain_links = !xhci_link_chain_quirk(xhci, ep->ring ? ep->ring->type : TYPE_STREAM);
+
 	while (1) {
-		trb_to_noop(trb, TRB_TR_NOOP);
+		trb_to_noop(trb, TRB_TR_NOOP, unchain_links);
 
 		/* flip cycle if asked to */
 		if (flip_cycle && trb != td->start_trb && trb != td->end_trb)
@@ -1092,16 +1097,16 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 						  "Found multiple active URBs %p and %p in stream %u?\n",
 						  td->urb, cached_td->urb,
 						  td->urb->stream_id);
-					td_to_noop(cached_td, false);
+					td_to_noop(xhci, ep, cached_td, false);
 					cached_td->cancel_status = TD_CLEARED;
 				}
-				td_to_noop(td, false);
+				td_to_noop(xhci, ep, td, false);
 				td->cancel_status = TD_CLEARING_CACHE;
 				cached_td = td;
 				break;
 			}
 		} else {
-			td_to_noop(td, false);
+			td_to_noop(xhci, ep, td, false);
 			td->cancel_status = TD_CLEARED;
 		}
 	}
@@ -1126,7 +1131,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 				continue;
 			xhci_warn(xhci, "Failed to clear cancelled cached URB %p, mark clear anyway\n",
 				  td->urb);
-			td_to_noop(td, false);
+			td_to_noop(xhci, ep, td, false);
 			td->cancel_status = TD_CLEARED;
 		}
 	}
@@ -4241,7 +4246,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	 */
 	urb_priv->td[0].end_trb = ep_ring->enqueue;
 	/* Every TRB except the first & last will have its cycle bit flipped. */
-	td_to_noop(&urb_priv->td[0], true);
+	td_to_noop(xhci, xep, &urb_priv->td[0], true);
 
 	/* Reset the ring enqueue back to the first TRB and its cycle bit. */
 	ep_ring->enqueue = urb_priv->td[0].start_trb;
-- 
2.43.0


