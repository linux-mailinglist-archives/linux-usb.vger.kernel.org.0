Return-Path: <linux-usb+bounces-35333-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPnOH3UzwWm7RQQAu9opvQ
	(envelope-from <linux-usb+bounces-35333-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 13:35:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F07982F1F9E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 13:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 344933073AA5
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 12:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BEA39FCB4;
	Mon, 23 Mar 2026 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWV5uH06"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93CD39DBC0
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268892; cv=none; b=DXNcGivI3gX5cPWFrXiSgVxqkDSbka0+wlKkUoHk43VvaDMOrE88GwP8V2nqQVuS4lg9GE0SsSrrbHVoA4PtTRjZuYMMQdD1gWnZRPYcxPWSmbviBS4oY6N80wY1fb0W0LahEiuFk5nX3sRc5n3tojij9zYUwXaKIMpHRnvK61E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268892; c=relaxed/simple;
	bh=4kxRuDsvpwhzarJAo79YZ7yQIS6oL6aRiHXEjehuoGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9s9wsQT6L0Dedd0WOIvVhIjoHe4yIiuJJH0xrVlXwNLvaXUkxo14REiDxjJ1hP/B0E4tiw4yLaKC6w4h8BWjinuHW55P6NvSyt88OCM0k8FTrwRRyp4mr7m9psQkTGdByV+8P0L5o3J4m+DqrY/SYexOnZ/MyeEES50FqKVnCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWV5uH06; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774268891; x=1805804891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4kxRuDsvpwhzarJAo79YZ7yQIS6oL6aRiHXEjehuoGM=;
  b=SWV5uH06xeOOtvDZAMiMhbalcJ99h1i7RSNYHslnJDvDhrFE+gAwxydD
   PNuB0tzOH68k6pOSeWbhIrDvR1Y+G5crm+pVFXDBcc6NlsngOpS9LsCSF
   QfZKe4Y9mhHk3tf0WgBZ1VMWhBvFLd3hu1EKFMgSjQXJCY7v9PIj/0cHT
   dauKdfowUS0ZbwLG4BNKrYXB/4fefYi0H4pUoKXT6cKI3vAZhjrGu2E9g
   PT4J19D5J1S01cz0EGSkBaOAU0IrgQGvAee8Ar2QIjyxXt+OUMnOMQfj+
   FhFY/DyYNxpIalMSYTb41oe11gEwpbDVz5xIU7u+1qMuhWuQf/ZcCU/NF
   A==;
X-CSE-ConnectionGUID: BcVfIHO6R0W4VOAcDopYSA==
X-CSE-MsgGUID: EJ7fcSjpQh2ke4RMMjUt+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75151939"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75151939"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:28:11 -0700
X-CSE-ConnectionGUID: wurhZDl2SEGMszONRiBtTA==
X-CSE-MsgGUID: BV6h0LrMRZOwYaiS7YdOUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223083607"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.40])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:28:09 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>
Cc: <stern@rowland.harvard.edu>,
	Thinh.Nguyen@synopsys.com,
	michal.pecio@gmail.com,
	oneukum@suse.com,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after stall or error
Date: Mon, 23 Mar 2026 14:25:11 +0200
Message-ID: <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-35333-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,synopsys.com,gmail.com,suse.com,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F07982F1F9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Avoid automatically restarting bulk or interrupt transfers after a
URB is given back due to stall or error.

Introduce a 'TD_TAINTED' state for pending TDs queued on a endpoint when
it halted. The actual TD the endpoint halted on is marked TD_HALTED,
and its URB is given back with proper EPROTO or EPIPE error code.

Don't automatically restart an endpoint if the next queued TD after
the TD_HALTED one is marked tainted.

class driver is expected to cancel all those pending URBs before
submitting more URBs, or before clearing halt, but is not forced to.
Always start the endpoint when a new URB is queued, but print a debug
message if there are still tainted URBs left uncancelled.

The same code is used for clearing up cached TDs from xHC in both
the URB stall/error case as when a class driver cancels URBs.
In the cancel case endpoint is restarted after removing the cancelled
URB.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 48 ++++++++++++++++++++++++++++++------
 drivers/usb/host/xhci.c      |  7 ++++++
 drivers/usb/host/xhci.h      |  4 ++-
 3 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1cbefee3c4ca..f01f343a7e37 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -981,6 +981,31 @@ static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
 	return ret;
 }
 
+/*
+ * Mark the TD the endpoint halted on as TD_HALTED and add it to the cancelled
+ * td list, ensuring invalidate_cancelled_tds() clears the TD from xHC cache.
+ * Mark the other TDs on that bulk or interrupt endpoint as TD_TAINTED to
+ * prevent the ring from being restarted too early.
+ */
+
+static void xhci_cancel_halted_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+				   struct xhci_td *td)
+{
+	struct xhci_ring *ring;
+	struct xhci_td *tdi;
+
+	ring = xhci_urb_to_transfer_ring(xhci, td->urb);
+
+	td->cancel_status = TD_HALTED;
+	if (list_empty(&td->cancelled_td_list))
+		list_add_tail(&td->cancelled_td_list, &ep->cancelled_td_list);
+
+	list_for_each_entry(tdi, &ring->td_list, td_list) {
+		if (!tdi->cancel_status && ring->type != TYPE_CTRL)
+			tdi->cancel_status = TD_TAINTED;
+	}
+}
+
 static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 				struct xhci_virt_ep *ep,
 				struct xhci_td *td,
@@ -999,10 +1024,8 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	/* add td to cancelled list and let reset ep handler take care of it */
 	if (reset_type == EP_HARD_RESET) {
 		ep->ep_state |= EP_HARD_CLEAR_TOGGLE;
-		if (td && list_empty(&td->cancelled_td_list)) {
-			list_add_tail(&td->cancelled_td_list, &ep->cancelled_td_list);
-			td->cancel_status = TD_HALTED;
-		}
+		if (td)
+			xhci_cancel_halted_tds(xhci, ep, td);
 	}
 
 	if (ep->ep_state & EP_HALTED) {
@@ -1079,6 +1102,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 			case TD_CLEARED: /* TD is already no-op */
 			case TD_CLEARING_CACHE: /* set TR deq command already queued */
 				break;
+			case TD_TAINTED:
 			case TD_DIRTY: /* TD is cached, clear it */
 			case TD_HALTED:
 			case TD_CLEARING_CACHE_DEFERRED:
@@ -1406,6 +1430,14 @@ void xhci_hc_died(struct xhci_hcd *xhci)
 		usb_hc_died(xhci_to_hcd(xhci));
 }
 
+bool next_td_is_tainted(struct xhci_ring *ring)
+{
+	struct xhci_td *td;
+
+	td = list_first_entry_or_null(&ring->td_list, struct xhci_td, td_list);
+	return td && td->cancel_status == TD_TAINTED;
+}
+
 /*
  * When we get a completion for a Set Transfer Ring Dequeue Pointer command,
  * we need to clear the set deq pending flag in the endpoint ring state, so that
@@ -1543,13 +1575,15 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			 __func__);
 		xhci_invalidate_cancelled_tds(ep);
 		/* Try to restart the endpoint if all is done */
-		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+		if (!next_td_is_tainted(ep_ring))
+			ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 		/* Start giving back any TDs invalidated above */
 		xhci_giveback_invalidated_tds(ep);
 	} else {
 		/* Restart any rings with pending URBs */
-		xhci_dbg(ep->xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
-		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+		xhci_dbg(ep->xhci, "%s: All cancelled TDs cleared\n", __func__);
+		if (!next_td_is_tainted(ep_ring))
+			ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 	}
 }
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ef6d8662adec..8f417836ae1f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1625,6 +1625,7 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	unsigned long flags;
 	int ret = 0;
 	unsigned int slot_id, ep_index;
+	struct xhci_ring *ring;
 	unsigned int *ep_state;
 	struct urb_priv	*urb_priv;
 	int num_tds;
@@ -1661,6 +1662,7 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	}
 
 	slot_id = urb->dev->slot_id;
+	ring = xhci_urb_to_transfer_ring(xhci, urb);
 
 	if (!HCD_HW_ACCESSIBLE(hcd)) {
 		ret = -ESHUTDOWN;
@@ -1694,6 +1696,10 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		goto free_priv;
 	}
 
+	ring = xhci_urb_to_transfer_ring(xhci, urb);
+	if (ring && next_td_is_tainted(ring))
+		xhci_dbg(xhci, "WARN, enqueue URB without canceling old tainted URBs\n");
+
 	switch (usb_endpoint_type(&urb->ep->desc)) {
 
 	case USB_ENDPOINT_XFER_CONTROL:
@@ -3354,6 +3360,7 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 
 	/* Bail out if toggle is already being cleared by a endpoint reset */
 	spin_lock_irqsave(&xhci->lock, flags);
+
 	if (ep->ep_state & EP_HARD_CLEAR_TOGGLE) {
 		ep->ep_state &= ~EP_HARD_CLEAR_TOGGLE;
 		spin_unlock_irqrestore(&xhci->lock, flags);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2b0796f6d00e..0be040f87abf 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1292,7 +1292,8 @@ struct xhci_segment {
 };
 
 enum xhci_cancelled_td_status {
-	TD_DIRTY = 0,
+	TD_TAINTED = 1,
+	TD_DIRTY,
 	TD_HALTED,
 	TD_CLEARING_CACHE,
 	TD_CLEARING_CACHE_DEFERRED,
@@ -1951,6 +1952,7 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
 void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
+bool next_td_is_tainted(struct xhci_ring *ring);
 int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    int suspend, gfp_t gfp_flags);
 void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
-- 
2.43.0


