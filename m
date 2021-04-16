Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F38D361DA3
	for <lists+linux-usb@lfdr.de>; Fri, 16 Apr 2021 12:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235270AbhDPJnt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Apr 2021 05:43:49 -0400
Received: from salscheider.org ([202.61.254.1]:47846 "EHLO
        mail.salscheider.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235027AbhDPJns (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Apr 2021 05:43:48 -0400
X-Greylist: delayed 330 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Apr 2021 05:43:48 EDT
Received: from OleDesktop.lan (200116b822e918003e0dbbbf473b6aef.dip.versatel-1u1.de [IPv6:2001:16b8:22e9:1800:3e0d:bbbf:473b:6aef])
        by mail.salscheider.org (Postfix) with ESMTPSA id 6510917DB4F;
        Fri, 16 Apr 2021 11:37:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salscheider.org;
        s=dkim; t=1618565873;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3gPQJHhm5RZayIpjThnxivw+xJ8tO5oz8PHQ7Yt/qIA=;
        b=fGWCOfER8B2dL5Dbh3pQICydtbhTqZVsEJkVuN9n1DfmrBs+z1mUHNWkeodqVZRBaRsYXN
        vry2+EMJmbrAJu4PvykBpLhSBqHPpiyBvI4S4Hm2WVoO9arjHC2eEnTzwh8r2xCq/8/f99
        f9LeGlanp9P8X567pSnUYYv1yg8bcXQ=
From:   Ole Salscheider <ole@salscheider.org>
To:     linux-usb@vger.kernel.org
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Ole Salscheider <ole@salscheider.org>
Subject: [PATCH] [RFC] xhci: Add Link TRB sync quirk for ASM3142
Date:   Fri, 16 Apr 2021 11:37:29 +0200
Message-Id: <20210416093729.41865-1-ole@salscheider.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a quirk to the xhci driver so that link TRBs are only
given to the host controller once it has processed all previous TRBs on
this segment.

This quirk is necessary for me on an ASMedia ASM3142 host controller.
Without it, I get the following errors when accessing a SuperSpeed UVC
camera:

Transfer event TRB DMA ptr not part of current TD ep_index XX comp_code XX

You can find more details in my previous mail about the problem:
https://lkml.org/lkml/2021/3/31/355

This patch fixes my problem, but it is probably terribly wrong. I am not
even sure if I can rely on handle_tx_event being called before each link
TRB in the segment. Some feedback would be very welcome.
---
 drivers/usb/host/xhci-pci.c  |  4 +++-
 drivers/usb/host/xhci-ring.c | 34 ++++++++++++++++++++++++++++++----
 drivers/usb/host/xhci.h      |  1 +
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 5bbccc9a0179..4b02ac34934e 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -284,8 +284,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
 	    (pdev->device == PCI_DEVICE_ID_ASMEDIA_1142_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_ASMEDIA_2142_XHCI ||
-	     pdev->device == PCI_DEVICE_ID_ASMEDIA_3242_XHCI))
+	     pdev->device == PCI_DEVICE_ID_ASMEDIA_3242_XHCI)) {
 		xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
+		xhci->quirks |= XHCI_SYNC_ON_LINK_TRB;
+	}
 
 	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
 		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ce38076901e2..17f9484f1b0d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -257,8 +257,13 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 			next->link.control |= cpu_to_le32(chain);
 		}
 		/* Give this link TRB to the hardware */
-		wmb();
-		next->link.control ^= cpu_to_le32(TRB_CYCLE);
+		if (!(xhci->quirks & XHCI_SYNC_ON_LINK_TRB) ||
+				(ring->type != TYPE_BULK &&
+				 ring->type != TYPE_STREAM &&
+				 ring->type != TYPE_COMMAND)) {
+			wmb();
+			next->link.control ^= cpu_to_le32(TRB_CYCLE);
+		}
 
 		/* Toggle the cycle bit after the last ring segment. */
 		if (link_trb_toggles_cycle(next))
@@ -2530,6 +2535,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	dma_addr_t ep_trb_dma;
 	struct xhci_segment *ep_seg;
 	union xhci_trb *ep_trb;
+	union xhci_trb *next_ep_trb;
+	int next_ep_trb_idx;
 	int status = -EINPROGRESS;
 	struct xhci_ep_ctx *ep_ctx;
 	struct list_head *tmp;
@@ -2860,6 +2867,20 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		else
 			process_bulk_intr_td(xhci, td, ep_trb, event, ep);
 cleanup:
+		if (xhci->quirks & XHCI_SYNC_ON_LINK_TRB &&
+				(ep_ring->type == TYPE_BULK ||
+				 ep_ring->type == TYPE_STREAM ||
+				 ep_ring->type == TYPE_COMMAND)) {
+			next_ep_trb_idx = (ep_trb_dma - ep_seg->dma) /
+				sizeof(*ep_trb) + 1;
+			next_ep_trb = ep_trb = &ep_seg->trbs[next_ep_trb_idx];
+			if (next_ep_trb_idx < TRBS_PER_SEGMENT &&
+					trb_is_link(next_ep_trb)) {
+				wmb();
+				next_ep_trb->link.control ^= cpu_to_le32(TRB_CYCLE);
+			}
+		}
+
 		handling_skipped_tds = ep->skip &&
 			trb_comp_code != COMP_MISSED_SERVICE_ERROR &&
 			trb_comp_code != COMP_NO_PING_RESPONSE_ERROR;
@@ -3192,8 +3213,13 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 			ep_ring->enqueue->link.control |=
 				cpu_to_le32(TRB_CHAIN);
 
-		wmb();
-		ep_ring->enqueue->link.control ^= cpu_to_le32(TRB_CYCLE);
+		if (!(xhci->quirks & XHCI_SYNC_ON_LINK_TRB) ||
+				(ep_ring->type != TYPE_BULK &&
+				 ep_ring->type != TYPE_STREAM &&
+				 ep_ring->type != TYPE_COMMAND)) {
+			wmb();
+			ep_ring->enqueue->link.control ^= cpu_to_le32(TRB_CYCLE);
+		}
 
 		/* Toggle the cycle bit after the last ring segment. */
 		if (link_trb_toggles_cycle(ep_ring->enqueue))
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ca822ad3b65b..fd98f86cde37 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1892,6 +1892,7 @@ struct xhci_hcd {
 #define XHCI_DISABLE_SPARSE	BIT_ULL(38)
 #define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
 #define XHCI_NO_SOFT_RETRY	BIT_ULL(40)
+#define XHCI_SYNC_ON_LINK_TRB	BIT_ULL(41)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.25.1

