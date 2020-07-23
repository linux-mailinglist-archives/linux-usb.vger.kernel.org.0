Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1344622B1A9
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbgGWOmv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:50 -0400
IronPort-SDR: on3WGeW+cotJ6xwPHTeJ12AjbxGO7YY4jw9isP8mXez/WC0YcoS6h/fuJoqYIYS+ymvM5MsR9d
 EIwbf4wYtoiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607465"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607465"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:50 -0700
IronPort-SDR: vAHkNjBaCt3SPhG5BZXfx85SYAjlVIG6crNkwaD7MxVQmBIctt5U2kERul3lReULQbLW/GZeoC
 RZSnnAJD0oqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672463"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:48 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 19/27] xhci: dbc: don't use generic xhci ring allocation functions for dbc.
Date:   Thu, 23 Jul 2020 17:45:22 +0300
Message-Id: <20200723144530.9992-20-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The generic xhci ring allocations code needs struct xhci_hcd pointer, and
it allocates memory for the rings from dma pools created for the xhci
device.

In order to decouple xhci and DbC we have to create our own ring allocation
and free routines for DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 80 +++++++++++++++++++++++++++++-----
 drivers/usb/host/xhci-mem.c    |  4 +-
 drivers/usb/host/xhci.h        |  2 +
 3 files changed, 74 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index fb56198d3aff..b00cbff5e2ca 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -22,6 +22,21 @@ static void dbc_free_ctx(struct device *dev, struct xhci_container_ctx *ctx)
 	kfree(ctx);
 }
 
+/* we use only one segment for DbC rings */
+static void dbc_ring_free(struct device *dev, struct xhci_ring *ring)
+{
+	if (!ring)
+		return;
+
+	if (ring->first_seg && ring->first_seg->trbs) {
+		dma_free_coherent(dev, TRB_SEGMENT_SIZE,
+				  ring->first_seg->trbs,
+				  ring->first_seg->dma);
+		kfree(ring->first_seg);
+	}
+	kfree(ring);
+}
+
 static u32 xhci_dbc_populate_strings(struct dbc_str_descs *strings)
 {
 	struct usb_string_descriptor	*s_desc;
@@ -391,6 +406,51 @@ dbc_alloc_ctx(struct device *dev, gfp_t flags)
 	return ctx;
 }
 
+struct xhci_ring *
+xhci_dbc_ring_alloc(struct device *dev, enum xhci_ring_type type, gfp_t flags)
+{
+	struct xhci_ring *ring;
+	struct xhci_segment *seg;
+	dma_addr_t dma;
+
+	ring = kzalloc(sizeof(*ring), flags);
+	if (!ring)
+		return NULL;
+
+	ring->num_segs = 1;
+	ring->type = type;
+
+	seg = kzalloc(sizeof(*seg), flags);
+	if (!seg)
+		goto seg_fail;
+
+	ring->first_seg = seg;
+	ring->last_seg = seg;
+	seg->next = seg;
+
+	seg->trbs = dma_alloc_coherent(dev, TRB_SEGMENT_SIZE, &dma, flags);
+	if (!seg->trbs)
+		goto dma_fail;
+
+	seg->dma = dma;
+
+	/* Only event ring does not use link TRB */
+	if (type != TYPE_EVENT) {
+		union xhci_trb *trb = &seg->trbs[TRBS_PER_SEGMENT - 1];
+
+		trb->link.segment_ptr = cpu_to_le64(dma);
+		trb->link.control = cpu_to_le32(LINK_TOGGLE | TRB_TYPE(TRB_LINK));
+	}
+	INIT_LIST_HEAD(&ring->td_list);
+	xhci_initialize_ring_info(ring, 1);
+	return ring;
+dma_fail:
+	kfree(seg);
+seg_fail:
+	kfree(ring);
+	return NULL;
+}
+
 static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	int			ret;
@@ -400,15 +460,15 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct device		*dev = xhci_to_hcd(xhci)->self.controller;
 
 	/* Allocate various rings for events and transfers: */
-	dbc->ring_evt = xhci_ring_alloc(xhci, 1, 1, TYPE_EVENT, 0, flags);
+	dbc->ring_evt = xhci_dbc_ring_alloc(dev, TYPE_EVENT, flags);
 	if (!dbc->ring_evt)
 		goto evt_fail;
 
-	dbc->ring_in = xhci_ring_alloc(xhci, 1, 1, TYPE_BULK, 0, flags);
+	dbc->ring_in = xhci_dbc_ring_alloc(dev, TYPE_BULK, flags);
 	if (!dbc->ring_in)
 		goto in_fail;
 
-	dbc->ring_out = xhci_ring_alloc(xhci, 1, 1, TYPE_BULK, 0, flags);
+	dbc->ring_out = xhci_dbc_ring_alloc(dev, TYPE_BULK, flags);
 	if (!dbc->ring_out)
 		goto out_fail;
 
@@ -452,13 +512,13 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 ctx_fail:
 	dbc_erst_free(dev, &dbc->erst);
 erst_fail:
-	xhci_ring_free(xhci, dbc->ring_out);
+	dbc_ring_free(dev, dbc->ring_out);
 	dbc->ring_out = NULL;
 out_fail:
-	xhci_ring_free(xhci, dbc->ring_in);
+	dbc_ring_free(dev, dbc->ring_in);
 	dbc->ring_in = NULL;
 in_fail:
-	xhci_ring_free(xhci, dbc->ring_evt);
+	dbc_ring_free(dev, dbc->ring_evt);
 	dbc->ring_evt = NULL;
 evt_fail:
 	return -ENOMEM;
@@ -483,10 +543,10 @@ static void xhci_dbc_mem_cleanup(struct xhci_hcd *xhci)
 	dbc_free_ctx(dbc->dev, dbc->ctx);
 	dbc->ctx = NULL;
 
-	dbc_erst_free(dev, &dbc->erst);
-	xhci_ring_free(xhci, dbc->ring_out);
-	xhci_ring_free(xhci, dbc->ring_in);
-	xhci_ring_free(xhci, dbc->ring_evt);
+	dbc_erst_free(dbc->dev, &dbc->erst);
+	dbc_ring_free(dbc->dev, dbc->ring_out);
+	dbc_ring_free(dbc->dev, dbc->ring_in);
+	dbc_ring_free(dbc->dev, dbc->ring_evt);
 	dbc->ring_in = NULL;
 	dbc->ring_out = NULL;
 	dbc->ring_evt = NULL;
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d38779e2fc84..696fad50b478 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -293,8 +293,8 @@ void xhci_ring_free(struct xhci_hcd *xhci, struct xhci_ring *ring)
 	kfree(ring);
 }
 
-static void xhci_initialize_ring_info(struct xhci_ring *ring,
-					unsigned int cycle_state)
+void xhci_initialize_ring_info(struct xhci_ring *ring,
+			       unsigned int cycle_state)
 {
 	/* The ring is empty, so the enqueue pointer == dequeue pointer */
 	ring->enqueue = ring->first_seg->trbs;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c295e8a7f5ae..ea1754f185a2 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2015,6 +2015,8 @@ int xhci_alloc_erst(struct xhci_hcd *xhci,
 		struct xhci_ring *evt_ring,
 		struct xhci_erst *erst,
 		gfp_t flags);
+void xhci_initialize_ring_info(struct xhci_ring *ring,
+			unsigned int cycle_state);
 void xhci_free_erst(struct xhci_hcd *xhci, struct xhci_erst *erst);
 void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
-- 
2.17.1

