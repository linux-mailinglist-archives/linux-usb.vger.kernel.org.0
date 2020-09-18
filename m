Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96AED26FDFA
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 15:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgIRNOj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 09:14:39 -0400
Received: from mga09.intel.com ([134.134.136.24]:46076 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgIRNOi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Sep 2020 09:14:38 -0400
IronPort-SDR: ottVCoIS71WMvDqIqdO0Lhpfd7vKpaUkSG6RhPXailHV9a3kmBi+eM88EsuEVMmgI08LNzXtO0
 MbsfKr/YSFFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160849970"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="160849970"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 06:14:38 -0700
IronPort-SDR: 86Cxok5xpr8haSRG+59vvlZFjtKgcP1nLkqAgZUUxIQyqH5q0dbcM8j7bI+AkXVA8V4w3hdSYP
 TfhVv4Thmakg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="508871208"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2020 06:14:37 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/10] xhci: Tune interrupt blocking for isochronous transfers
Date:   Fri, 18 Sep 2020 16:17:50 +0300
Message-Id: <20200918131752.16488-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
References: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

controllers with XHCI_AVOID_BEI quirk cause too frequent interrupts
and affect power management.

To avoid interrupting on every isochronous interval the BEI (Block
Event Interrupt) flag is set for all except the last Isoch TRB in a URB.
This lead to event ring filling up in case several isoc URB were
queued and cancelled rapidly, which some controllers didn't
handle well, and thus the XHCI_AVOID_BEI quirk was introduced.
see commit 227a4fd801c8 ("usb: xhci: apply XHCI_AVOID_BEI quirk to all
Intel xHCI controllers")

With the XHCI_AVOID_BEI quirk each Isoch TRB will trigger an interrupt.
This can cause up to 8000 interrupts per second for isochronous transfers
with HD USB3 cameras, affecting power saving.

The event ring fits 256 events, instead of interrupting on every
isochronous TRB if XHCI_AVOID_BEI is set we make sure at least every
8th Isochronous TRB asserts an interrupt, clearing the event ring.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a741a38a4c69..167dae117f73 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3736,6 +3736,24 @@ static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
 	return start_frame;
 }
 
+/* Check if we should generate event interrupt for a TD in an isoc URB */
+static bool trb_block_event_intr(struct xhci_hcd *xhci, int num_tds, int i)
+{
+	if (xhci->hci_version < 0x100)
+		return false;
+	/* always generate an event interrupt for the last TD */
+	if (i == num_tds - 1)
+		return false;
+	/*
+	 * If AVOID_BEI is set the host handles full event rings poorly,
+	 * generate an event at least every 8th TD to clear the event ring
+	 */
+	if (i && xhci->quirks & XHCI_AVOID_BEI)
+		return !!(i % 8);
+
+	return true;
+}
+
 /* This is for isoc transfer */
 static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		struct urb *urb, int slot_id, unsigned int ep_index)
@@ -3843,10 +3861,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				more_trbs_coming = false;
 				td->last_trb = ep_ring->enqueue;
 				field |= TRB_IOC;
-				/* set BEI, except for the last TD */
-				if (xhci->hci_version >= 0x100 &&
-				    !(xhci->quirks & XHCI_AVOID_BEI) &&
-				    i < num_tds - 1)
+				if (trb_block_event_intr(xhci, num_tds, i))
 					field |= TRB_BEI;
 			}
 			/* Calculate TRB length */
-- 
2.17.1

