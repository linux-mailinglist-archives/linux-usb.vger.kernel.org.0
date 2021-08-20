Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE113F2C20
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 14:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240260AbhHTMdX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 08:33:23 -0400
Received: from mga03.intel.com ([134.134.136.65]:32166 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240405AbhHTMdW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Aug 2021 08:33:22 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="216799529"
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="216799529"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 05:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="680077975"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 20 Aug 2021 05:32:43 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/6] xhci: Add additional dynamic debug to follow URBs in cancel and error cases.
Date:   Fri, 20 Aug 2021 15:35:02 +0300
Message-Id: <20210820123503.2605901-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820123503.2605901-1-mathias.nyman@linux.intel.com>
References: <20210820123503.2605901-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add more debugging messages to follow what happends to a URB internally
in special cases like URB cancel, halted endpoints and endpoint reset.

Helps tracking issues like URB never given back by host.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9017986241f5..8be4ba3758b1 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -830,9 +830,14 @@ static void xhci_giveback_invalidated_tds(struct xhci_virt_ep *ep)
 
 		ring = xhci_urb_to_transfer_ring(ep->xhci, td->urb);
 
-		if (td->cancel_status == TD_CLEARED)
+		if (td->cancel_status == TD_CLEARED) {
+			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
+				 __func__, td->urb);
 			xhci_td_cleanup(ep->xhci, td, ring, td->status);
-
+		} else {
+			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
+				 __func__, td->urb, td->cancel_status);
+		}
 		if (ep->xhci->xhc_state & XHCI_STATE_DYING)
 			return;
 	}
@@ -850,6 +855,10 @@ static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
 		goto done;
 	}
 
+	xhci_dbg(xhci, "%s-reset ep %u, slot %u\n",
+		 (reset_type == EP_HARD_RESET) ? "Hard" : "Soft",
+		 ep_index, slot_id);
+
 	ret = xhci_queue_reset_ep(xhci, command, slot_id, ep_index, reset_type);
 done:
 	if (ret)
@@ -883,7 +892,8 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	}
 
 	if (ep->ep_state & EP_HALTED) {
-		xhci_dbg(xhci, "Reset ep command already pending\n");
+		xhci_dbg(xhci, "Reset ep command for ep_index %d already pending\n",
+			 ep->ep_index);
 		return 0;
 	}
 
@@ -922,9 +932,10 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-				"Removing canceled TD starting at 0x%llx (dma).",
-				(unsigned long long)xhci_trb_virt_to_dma(
-					td->start_seg, td->first_trb));
+			       "Removing canceled TD starting at 0x%llx (dma) in stream %u URB %p",
+			       (unsigned long long)xhci_trb_virt_to_dma(
+				       td->start_seg, td->first_trb),
+			       td->urb->stream_id, td->urb);
 		list_del_init(&td->td_list);
 		ring = xhci_urb_to_transfer_ring(xhci, td->urb);
 		if (!ring) {
@@ -1079,6 +1090,8 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 			return;
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
+			xhci_dbg(xhci, "Stop ep completion ctx error, ep is running\n");
+
 			command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 			if (!command)
 				xhci_stop_watchdog_timer_in_irq(xhci, ep);
@@ -1400,7 +1413,12 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 		ep_ring = xhci_urb_to_transfer_ring(ep->xhci, td->urb);
 		if (td->cancel_status == TD_CLEARING_CACHE) {
 			td->cancel_status = TD_CLEARED;
+			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
+				 __func__, td->urb);
 			xhci_td_cleanup(ep->xhci, td, ep_ring, td->status);
+		} else {
+			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
+				 __func__, td->urb, td->cancel_status);
 		}
 	}
 cleanup:
-- 
2.25.1

