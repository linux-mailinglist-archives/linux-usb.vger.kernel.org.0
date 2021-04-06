Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E086354D33
	for <lists+linux-usb@lfdr.de>; Tue,  6 Apr 2021 09:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244123AbhDFHAc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Apr 2021 03:00:32 -0400
Received: from mga04.intel.com ([192.55.52.120]:9889 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244116AbhDFHAa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Apr 2021 03:00:30 -0400
IronPort-SDR: O+zhV4ROlp1YuYwXLG0lseMUYLfWAyzMywDjDccj+3WBOsbF3vayoFi1ohkyX+3gZiL2ZlDDlO
 XvfHxDhS9udQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="190835044"
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="190835044"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 00:00:23 -0700
IronPort-SDR: 5vk4v5aAzyQgPvo5aOpFwcidIxMO120ing4SjqI8Sn8GbMeRNoUOuWc9GOOpWKcgPcewCVlLSa
 J6Sw1xfIhYiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="448443206"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2021 00:00:22 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/4] xhci: prevent double-fetch of transfer and transfer event TRBs
Date:   Tue,  6 Apr 2021 10:02:08 +0300
Message-Id: <20210406070208.3406266-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406070208.3406266-1-mathias.nyman@linux.intel.com>
References: <20210406070208.3406266-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The same values are parsed several times from transfer and event
TRBs by different functions in the same call path, all while processing
one transfer event.

As the TRBs are in DMA memory and can be accessed by the xHC host we want
to avoid this to prevent double-fetch issues.

To resolve this pass the already parsed values to the different functions
in the path of parsing a transfer event

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 42 ++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1eee60ac518f..05c38dd3ee36 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2128,16 +2128,13 @@ int xhci_is_vendor_info_code(struct xhci_hcd *xhci, unsigned int trb_comp_code)
 	return 0;
 }
 
-static int finish_td(struct xhci_hcd *xhci, struct xhci_td *td,
-	struct xhci_transfer_event *event, struct xhci_virt_ep *ep)
+static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+		     struct xhci_ring *ep_ring, struct xhci_td *td,
+		     u32 trb_comp_code)
 {
 	struct xhci_ep_ctx *ep_ctx;
-	struct xhci_ring *ep_ring;
-	u32 trb_comp_code;
 
-	ep_ring = xhci_dma_to_transfer_ring(ep, le64_to_cpu(event->buffer));
 	ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep->ep_index);
-	trb_comp_code = GET_COMP_CODE(le32_to_cpu(event->transfer_len));
 
 	switch (trb_comp_code) {
 	case COMP_STOPPED_LENGTH_INVALID:
@@ -2233,9 +2230,9 @@ static int sum_trb_lengths(struct xhci_hcd *xhci, struct xhci_ring *ring,
 /*
  * Process control tds, update urb status and actual_length.
  */
-static int process_ctrl_td(struct xhci_hcd *xhci, struct xhci_td *td,
-	union xhci_trb *ep_trb, struct xhci_transfer_event *event,
-	struct xhci_virt_ep *ep)
+static int process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+		struct xhci_ring *ep_ring,  struct xhci_td *td,
+			   union xhci_trb *ep_trb, struct xhci_transfer_event *event)
 {
 	struct xhci_ep_ctx *ep_ctx;
 	u32 trb_comp_code;
@@ -2323,15 +2320,15 @@ static int process_ctrl_td(struct xhci_hcd *xhci, struct xhci_td *td,
 		td->urb->actual_length = requested;
 
 finish_td:
-	return finish_td(xhci, td, event, ep);
+	return finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
 /*
  * Process isochronous tds, update urb packet status and actual_length.
  */
-static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
-	union xhci_trb *ep_trb, struct xhci_transfer_event *event,
-	struct xhci_virt_ep *ep)
+static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+		struct xhci_ring *ep_ring, struct xhci_td *td,
+		union xhci_trb *ep_trb, struct xhci_transfer_event *event)
 {
 	struct urb_priv *urb_priv;
 	int idx;
@@ -2408,7 +2405,7 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
 
 	td->urb->actual_length += frame->actual_length;
 
-	return finish_td(xhci, td, event, ep);
+	return finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
 static int skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
@@ -2440,17 +2437,15 @@ static int skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
 /*
  * Process bulk and interrupt tds, update urb status and actual_length.
  */
-static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_td *td,
-	union xhci_trb *ep_trb, struct xhci_transfer_event *event,
-	struct xhci_virt_ep *ep)
+static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+		struct xhci_ring *ep_ring, struct xhci_td *td,
+		union xhci_trb *ep_trb, struct xhci_transfer_event *event)
 {
 	struct xhci_slot_ctx *slot_ctx;
-	struct xhci_ring *ep_ring;
 	u32 trb_comp_code;
 	u32 remaining, requested, ep_trb_len;
 
 	slot_ctx = xhci_get_slot_ctx(xhci, ep->vdev->out_ctx);
-	ep_ring = xhci_dma_to_transfer_ring(ep, le64_to_cpu(event->buffer));
 	trb_comp_code = GET_COMP_CODE(le32_to_cpu(event->transfer_len));
 	remaining = EVENT_TRB_LEN(le32_to_cpu(event->transfer_len));
 	ep_trb_len = TRB_LEN(le32_to_cpu(ep_trb->generic.field[2]));
@@ -2510,7 +2505,8 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_td *td,
 			  remaining);
 		td->urb->actual_length = 0;
 	}
-	return finish_td(xhci, td, event, ep);
+
+	return finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
 /*
@@ -2853,11 +2849,11 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 		/* update the urb's actual_length and give back to the core */
 		if (usb_endpoint_xfer_control(&td->urb->ep->desc))
-			process_ctrl_td(xhci, td, ep_trb, event, ep);
+			process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
 		else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
-			process_isoc_td(xhci, td, ep_trb, event, ep);
+			process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
 		else
-			process_bulk_intr_td(xhci, td, ep_trb, event, ep);
+			process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
 cleanup:
 		handling_skipped_tds = ep->skip &&
 			trb_comp_code != COMP_MISSED_SERVICE_ERROR &&
-- 
2.25.1

