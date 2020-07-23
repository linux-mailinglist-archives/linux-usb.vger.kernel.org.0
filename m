Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CAC22B198
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgGWOm2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:28 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728704AbgGWOm2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:28 -0400
IronPort-SDR: mTQ0A/GibHt4Cf3KZ1+HBBEVwRmQbT1tcWOigdNe+m1tAUHBAz3fJCaXycRd+86wav/Vyf7Qek
 qO5WwH8IhJOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607364"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607364"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:27 -0700
IronPort-SDR: sYKaW0kt2/o0GUUvQy0pZoDyTww9MefZY9x3H03uoJMAUxrPXcCiJIBZuUAm120Efa0eMgZuDy
 vVevS2VpbmGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672361"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:26 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/27] xhci: dbc: Don't use generic xhci inc_deq() function for dbc
Date:   Thu, 23 Jul 2020 17:45:05 +0300
Message-Id: <20200723144530.9992-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The generic inc_deq() helper takes struct xhci_hcd pointer as a parameter,
and is a lot more complex than needed for the DbC usecase.

In order to decouple xhci and DbC we have to create our own small
inc_evt_deq() helper, not relying on xhci.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 987f893e941c..424b571d6ca9 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -644,6 +644,17 @@ static void dbc_handle_xfer_event(struct xhci_hcd *xhci, union xhci_trb *event)
 	xhci_dbc_giveback(req, status);
 }
 
+static void inc_evt_deq(struct xhci_ring *ring)
+{
+	/* If on the last TRB of the segment go back to the beginning */
+	if (ring->dequeue == &ring->deq_seg->trbs[TRBS_PER_SEGMENT - 1]) {
+		ring->cycle_state ^= 1;
+		ring->dequeue = ring->deq_seg->trbs;
+		return;
+	}
+	ring->dequeue++;
+}
+
 static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 {
 	dma_addr_t		deq;
@@ -765,7 +776,8 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 			break;
 		}
 
-		inc_deq(xhci, dbc->ring_evt);
+		inc_evt_deq(dbc->ring_evt);
+
 		evt = dbc->ring_evt->dequeue;
 		update_erdp = true;
 	}
-- 
2.17.1

