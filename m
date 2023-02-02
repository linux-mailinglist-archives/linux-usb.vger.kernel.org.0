Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF36A68810D
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbjBBPGP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:06:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbjBBPGG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:06:06 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF4D92182
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350348; x=1706886348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xh1rByowrObl9GnnP9c9gjSP0LhJFXFU7s1VDddIhyg=;
  b=KU9lGbLu+O1NVFgkbt70XJPoREBKJW87cgFWs0idMJV+inzvdvJnolTN
   ItfJZzmjLI7XEnBpUofcXy9HQEHKvrGAHMl/TZmfQ9G4U68C2GcDwug9x
   kU2LuxKzfZwd/NRjxWZVJy/mYrGqL5idCqbo8fM8sLStFv7y/3rxoK9C0
   8ATKZl97lG/zlUPCyc/y8AO+LDBDsRSS2zFXDegAhfJ04Y+xg3kD7VePk
   Bej0gDLcLcN8LrC3XPCch4k5kvR4jn1/pqz0nMPc83aAbDAxxmFhZ2hJM
   1kOJlbBCS6SqWpBgjYNyx/mbRih3/ajHYNihtgdIlMD9XkVsVqg00+EkD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327113984"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327113984"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728905691"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728905691"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:03:52 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/11] xhci: Refactor interrupter code for initial multi interrupter support.
Date:   Thu,  2 Feb 2023 17:04:57 +0200
Message-Id: <20230202150505.618915-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202150505.618915-1-mathias.nyman@linux.intel.com>
References: <20230202150505.618915-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xHC supports several interrupters, each with its own mmio register set,
event ring and MSI/MSI-X vector. Transfers can be assigned different
interrupters when queued. See xhci 4.17 for details.
Current driver only supports one interrupter.

Create a xhci_interrupter structure containing an event ring, pointer to
mmio registers for this interrupter, variables to store registers over s3
suspend, erst, etc. Add functions to create and free an interrupter, and
pass an interrupter pointer to functions that deal with events.

Secondary interrupters are also useful without having an interrupt vector.
One use case is the xHCI audio sideband offloading where a DSP can take
care of specific audio endpoints.

When all transfer events of an offloaded endpoint can be mapped to a
separate interrupter event ring the DSP can poll this ring, and we can mask
these events preventing waking up the CPU.

Only minor functional changes such as clearing some of the interrupter
registers when freeing the interrupter.

Still create only one primary interrupter.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c |   2 +-
 drivers/usb/host/xhci-mem.c     | 168 +++++++++++++++++++++-----------
 drivers/usb/host/xhci-ring.c    |  68 +++++++------
 drivers/usb/host/xhci.c         |  54 ++++++----
 drivers/usb/host/xhci.h         |  24 +++--
 5 files changed, 196 insertions(+), 120 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index dc832ddf7033..0bc7fe11f749 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -692,7 +692,7 @@ void xhci_debugfs_init(struct xhci_hcd *xhci)
 				     "command-ring",
 				     xhci->debugfs_root);
 
-	xhci_debugfs_create_ring_dir(xhci, &xhci->event_ring,
+	xhci_debugfs_create_ring_dir(xhci, &xhci->interrupter->event_ring,
 				     "event-ring",
 				     xhci->debugfs_root);
 
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index bf9bb29f924b..6b83c5c35cf8 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1819,17 +1819,43 @@ int xhci_alloc_erst(struct xhci_hcd *xhci,
 	return 0;
 }
 
-void xhci_free_erst(struct xhci_hcd *xhci, struct xhci_erst *erst)
+static void
+xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
-	size_t size;
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
+	size_t erst_size;
+	u64 tmp64;
+	u32 tmp;
 
-	size = sizeof(struct xhci_erst_entry) * (erst->num_entries);
-	if (erst->entries)
-		dma_free_coherent(dev, size,
-				erst->entries,
-				erst->erst_dma_addr);
-	erst->entries = NULL;
+	if (!ir)
+		return;
+
+	erst_size = sizeof(struct xhci_erst_entry) * (ir->erst.num_entries);
+	if (ir->erst.entries)
+		dma_free_coherent(dev, erst_size,
+				  ir->erst.entries,
+				  ir->erst.erst_dma_addr);
+	ir->erst.entries = NULL;
+
+	/*
+	 * Clean out interrupter registers except ERSTBA. Clearing either the
+	 * low or high 32 bits of ERSTBA immediately causes the controller to
+	 * dereference the partially cleared 64 bit address, causing IOMMU error.
+	 */
+	tmp = readl(&ir->ir_set->erst_size);
+	tmp &= ERST_SIZE_MASK;
+	writel(tmp, &ir->ir_set->erst_size);
+
+	tmp64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+	tmp64 &= (u64) ERST_PTR_MASK;
+	xhci_write_64(xhci, tmp64, &ir->ir_set->erst_dequeue);
+
+	/* free interrrupter event ring */
+	if (ir->event_ring)
+		xhci_ring_free(xhci, ir->event_ring);
+	ir->event_ring = NULL;
+
+	kfree(ir);
 }
 
 void xhci_mem_cleanup(struct xhci_hcd *xhci)
@@ -1839,12 +1865,9 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 
 	cancel_delayed_work_sync(&xhci->cmd_timer);
 
-	xhci_free_erst(xhci, &xhci->erst);
-
-	if (xhci->event_ring)
-		xhci_ring_free(xhci, xhci->event_ring);
-	xhci->event_ring = NULL;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed event ring");
+	xhci_free_interrupter(xhci, xhci->interrupter);
+	xhci->interrupter = NULL;
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed primary event ring");
 
 	if (xhci->cmd_ring)
 		xhci_ring_free(xhci, xhci->cmd_ring);
@@ -1929,18 +1952,18 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->usb3_rhub.bus_state.bus_suspended = 0;
 }
 
-static void xhci_set_hc_event_deq(struct xhci_hcd *xhci)
+static void xhci_set_hc_event_deq(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
 	u64 temp;
 	dma_addr_t deq;
 
-	deq = xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
-			xhci->event_ring->dequeue);
+	deq = xhci_trb_virt_to_dma(ir->event_ring->deq_seg,
+			ir->event_ring->dequeue);
 	if (!deq)
 		xhci_warn(xhci, "WARN something wrong with SW event ring "
 				"dequeue ptr.\n");
 	/* Update HC event ring dequeue pointer */
-	temp = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
+	temp = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
 	temp &= ERST_PTR_MASK;
 	/* Don't clear the EHB bit (which is RW1C) because
 	 * there might be more events to service.
@@ -1950,7 +1973,7 @@ static void xhci_set_hc_event_deq(struct xhci_hcd *xhci)
 			"// Write event ring dequeue pointer, "
 			"preserving EHB bit");
 	xhci_write_64(xhci, ((u64) deq & (u64) ~ERST_PTR_MASK) | temp,
-			&xhci->ir_set->erst_dequeue);
+			&ir->ir_set->erst_dequeue);
 }
 
 static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
@@ -2217,6 +2240,68 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 	return 0;
 }
 
+static struct xhci_interrupter *
+xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int intr_num, gfp_t flags)
+{
+	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
+	struct xhci_interrupter *ir;
+	u64 erst_base;
+	u32 erst_size;
+	int ret;
+
+	if (intr_num > xhci->max_interrupters) {
+		xhci_warn(xhci, "Can't allocate interrupter %d, max interrupters %d\n",
+			  intr_num, xhci->max_interrupters);
+		return NULL;
+	}
+
+	if (xhci->interrupter) {
+		xhci_warn(xhci, "Can't allocate already set up interrupter %d\n", intr_num);
+		return NULL;
+	}
+
+	ir = kzalloc_node(sizeof(*ir), flags, dev_to_node(dev));
+	if (!ir)
+		return NULL;
+
+	ir->ir_set = &xhci->run_regs->ir_set[intr_num];
+	ir->event_ring = xhci_ring_alloc(xhci, ERST_NUM_SEGS, 1, TYPE_EVENT,
+					0, flags);
+	if (!ir->event_ring) {
+		xhci_warn(xhci, "Failed to allocate interrupter %d event ring\n", intr_num);
+		goto fail_ir;
+	}
+
+	ret = xhci_alloc_erst(xhci, ir->event_ring, &ir->erst, flags);
+	if (ret) {
+		xhci_warn(xhci, "Failed to allocate interrupter %d erst\n", intr_num);
+		goto fail_ev;
+
+	}
+	/* set ERST count with the number of entries in the segment table */
+	erst_size = readl(&ir->ir_set->erst_size);
+	erst_size &= ERST_SIZE_MASK;
+	erst_size |= ERST_NUM_SEGS;
+	writel(erst_size, &ir->ir_set->erst_size);
+
+	erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
+	erst_base &= ERST_PTR_MASK;
+	erst_base |= (ir->erst.erst_dma_addr & (u64) ~ERST_PTR_MASK);
+	xhci_write_64(xhci, erst_base, &ir->ir_set->erst_base);
+
+	/* Set the event ring dequeue address of this interrupter */
+	xhci_set_hc_event_deq(xhci, ir);
+
+	return ir;
+
+fail_ev:
+	xhci_ring_free(xhci, ir->event_ring);
+fail_ir:
+	kfree(ir);
+
+	return NULL;
+}
+
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	dma_addr_t	dma;
@@ -2224,7 +2309,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	unsigned int	val, val2;
 	u64		val_64;
 	u32		page_size, temp;
-	int		i, ret;
+	int		i;
 
 	INIT_LIST_HEAD(&xhci->cmd_list);
 
@@ -2337,46 +2422,13 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 			" from cap regs base addr", val);
 	xhci->dba = (void __iomem *) xhci->cap_regs + val;
 	/* Set ir_set to interrupt register set 0 */
-	xhci->ir_set = &xhci->run_regs->ir_set[0];
-
-	/*
-	 * Event ring setup: Allocate a normal ring, but also setup
-	 * the event ring segment table (ERST).  Section 4.9.3.
-	 */
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "// Allocating event ring");
-	xhci->event_ring = xhci_ring_alloc(xhci, ERST_NUM_SEGS, 1, TYPE_EVENT,
-					0, flags);
-	if (!xhci->event_ring)
-		goto fail;
-
-	ret = xhci_alloc_erst(xhci, xhci->event_ring, &xhci->erst, flags);
-	if (ret)
-		goto fail;
-
-	/* set ERST count with the number of entries in the segment table */
-	val = readl(&xhci->ir_set->erst_size);
-	val &= ERST_SIZE_MASK;
-	val |= ERST_NUM_SEGS;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Write ERST size = %i to ir_set 0 (some bits preserved)",
-			val);
-	writel(val, &xhci->ir_set->erst_size);
 
+	/* allocate and set up primary interrupter with an event ring. */
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Set ERST entries to point to event ring.");
-	/* set the segment table base address */
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Set ERST base address for ir_set 0 = 0x%llx",
-			(unsigned long long)xhci->erst.erst_dma_addr);
-	val_64 = xhci_read_64(xhci, &xhci->ir_set->erst_base);
-	val_64 &= ERST_BASE_RSVDP;
-	val_64 |= (xhci->erst.erst_dma_addr & (u64) ~ERST_BASE_RSVDP);
-	xhci_write_64(xhci, val_64, &xhci->ir_set->erst_base);
-
-	/* Set the event ring dequeue address */
-	xhci_set_hc_event_deq(xhci);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Wrote ERST address to ir_set 0.");
+		       "Allocating primary event ring");
+	xhci->interrupter = xhci_alloc_interrupter(xhci, 0, flags);
+	if (!xhci->interrupter)
+		goto fail;
 
 	xhci->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5f1ecdee2c1c..451d48b87cf7 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1833,7 +1833,8 @@ static void xhci_cavium_reset_phy_quirk(struct xhci_hcd *xhci)
 }
 
 static void handle_port_status(struct xhci_hcd *xhci,
-		union xhci_trb *event)
+			       struct xhci_interrupter *ir,
+			       union xhci_trb *event)
 {
 	struct usb_hcd *hcd;
 	u32 port_id;
@@ -1856,7 +1857,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	if ((port_id <= 0) || (port_id > max_ports)) {
 		xhci_warn(xhci, "Port change event with invalid port ID %d\n",
 			  port_id);
-		inc_deq(xhci, xhci->event_ring);
+		inc_deq(xhci, ir->event_ring);
 		return;
 	}
 
@@ -1986,7 +1987,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 
 cleanup:
 	/* Update event ring dequeue pointer before dropping the lock */
-	inc_deq(xhci, xhci->event_ring);
+	inc_deq(xhci, ir->event_ring);
 
 	/* Don't make the USB core poll the roothub if we got a bad port status
 	 * change event.  Besides, at that point we can't tell which roothub
@@ -2519,7 +2520,8 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
  * At this point, the host controller is probably hosed and should be reset.
  */
 static int handle_tx_event(struct xhci_hcd *xhci,
-		struct xhci_transfer_event *event)
+			   struct xhci_interrupter *ir,
+			   struct xhci_transfer_event *event)
 {
 	struct xhci_virt_ep *ep;
 	struct xhci_ring *ep_ring;
@@ -2868,7 +2870,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * processing missed tds.
 		 */
 		if (!handling_skipped_tds)
-			inc_deq(xhci, xhci->event_ring);
+			inc_deq(xhci, ir->event_ring);
 
 	/*
 	 * If ep->skip is set, it means there are missed tds on the
@@ -2883,8 +2885,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 err_out:
 	xhci_err(xhci, "@%016llx %08x %08x %08x %08x\n",
 		 (unsigned long long) xhci_trb_virt_to_dma(
-			 xhci->event_ring->deq_seg,
-			 xhci->event_ring->dequeue),
+			 ir->event_ring->deq_seg,
+			 ir->event_ring->dequeue),
 		 lower_32_bits(le64_to_cpu(event->buffer)),
 		 upper_32_bits(le64_to_cpu(event->buffer)),
 		 le32_to_cpu(event->transfer_len),
@@ -2898,7 +2900,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
  * Returns >0 for "possibly more events to process" (caller should call again),
  * otherwise 0 if done.  In future, <0 returns should indicate error code.
  */
-static int xhci_handle_event(struct xhci_hcd *xhci)
+static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
 	union xhci_trb *event;
 	int update_ptrs = 1;
@@ -2906,18 +2908,18 @@ static int xhci_handle_event(struct xhci_hcd *xhci)
 	int ret;
 
 	/* Event ring hasn't been allocated yet. */
-	if (!xhci->event_ring || !xhci->event_ring->dequeue) {
-		xhci_err(xhci, "ERROR event ring not ready\n");
+	if (!ir || !ir->event_ring || !ir->event_ring->dequeue) {
+		xhci_err(xhci, "ERROR interrupter not ready\n");
 		return -ENOMEM;
 	}
 
-	event = xhci->event_ring->dequeue;
+	event = ir->event_ring->dequeue;
 	/* Does the HC or OS own the TRB? */
 	if ((le32_to_cpu(event->event_cmd.flags) & TRB_CYCLE) !=
-	    xhci->event_ring->cycle_state)
+	    ir->event_ring->cycle_state)
 		return 0;
 
-	trace_xhci_handle_event(xhci->event_ring, &event->generic);
+	trace_xhci_handle_event(ir->event_ring, &event->generic);
 
 	/*
 	 * Barrier between reading the TRB_CYCLE (valid) flag above and any
@@ -2932,11 +2934,11 @@ static int xhci_handle_event(struct xhci_hcd *xhci)
 		handle_cmd_completion(xhci, &event->event_cmd);
 		break;
 	case TRB_PORT_STATUS:
-		handle_port_status(xhci, event);
+		handle_port_status(xhci, ir, event);
 		update_ptrs = 0;
 		break;
 	case TRB_TRANSFER:
-		ret = handle_tx_event(xhci, &event->trans_event);
+		ret = handle_tx_event(xhci, ir, &event->trans_event);
 		if (ret >= 0)
 			update_ptrs = 0;
 		break;
@@ -2960,7 +2962,7 @@ static int xhci_handle_event(struct xhci_hcd *xhci)
 
 	if (update_ptrs)
 		/* Update SW event ring dequeue pointer */
-		inc_deq(xhci, xhci->event_ring);
+		inc_deq(xhci, ir->event_ring);
 
 	/* Are there more items on the event ring?  Caller will call us again to
 	 * check.
@@ -2974,16 +2976,17 @@ static int xhci_handle_event(struct xhci_hcd *xhci)
  * - To avoid "Event Ring Full Error" condition
  */
 static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
-		union xhci_trb *event_ring_deq)
+				     struct xhci_interrupter *ir,
+				     union xhci_trb *event_ring_deq)
 {
 	u64 temp_64;
 	dma_addr_t deq;
 
-	temp_64 = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
+	temp_64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
 	/* If necessary, update the HW's version of the event ring deq ptr. */
-	if (event_ring_deq != xhci->event_ring->dequeue) {
-		deq = xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
-				xhci->event_ring->dequeue);
+	if (event_ring_deq != ir->event_ring->dequeue) {
+		deq = xhci_trb_virt_to_dma(ir->event_ring->deq_seg,
+				ir->event_ring->dequeue);
 		if (deq == 0)
 			xhci_warn(xhci, "WARN something wrong with SW event ring dequeue ptr\n");
 		/*
@@ -3001,7 +3004,7 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 
 	/* Clear the event handler busy flag (RW1C) */
 	temp_64 |= ERST_EHB;
-	xhci_write_64(xhci, temp_64, &xhci->ir_set->erst_dequeue);
+	xhci_write_64(xhci, temp_64, &ir->ir_set->erst_dequeue);
 }
 
 /*
@@ -3013,6 +3016,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	union xhci_trb *event_ring_deq;
+	struct xhci_interrupter *ir;
 	irqreturn_t ret = IRQ_NONE;
 	u64 temp_64;
 	u32 status;
@@ -3050,11 +3054,13 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	status |= STS_EINT;
 	writel(status, &xhci->op_regs->status);
 
+	/* This is the handler of the primary interrupter */
+	ir = xhci->interrupter;
 	if (!hcd->msi_enabled) {
 		u32 irq_pending;
-		irq_pending = readl(&xhci->ir_set->irq_pending);
+		irq_pending = readl(&ir->ir_set->irq_pending);
 		irq_pending |= IMAN_IP;
-		writel(irq_pending, &xhci->ir_set->irq_pending);
+		writel(irq_pending, &ir->ir_set->irq_pending);
 	}
 
 	if (xhci->xhc_state & XHCI_STATE_DYING ||
@@ -3064,22 +3070,22 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		/* Clear the event handler busy flag (RW1C);
 		 * the event ring should be empty.
 		 */
-		temp_64 = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
+		temp_64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
 		xhci_write_64(xhci, temp_64 | ERST_EHB,
-				&xhci->ir_set->erst_dequeue);
+				&ir->ir_set->erst_dequeue);
 		ret = IRQ_HANDLED;
 		goto out;
 	}
 
-	event_ring_deq = xhci->event_ring->dequeue;
+	event_ring_deq = ir->event_ring->dequeue;
 	/* FIXME this should be a delayed service routine
 	 * that clears the EHB.
 	 */
-	while (xhci_handle_event(xhci) > 0) {
+	while (xhci_handle_event(xhci, ir) > 0) {
 		if (event_loop++ < TRBS_PER_SEGMENT / 2)
 			continue;
-		xhci_update_erst_dequeue(xhci, event_ring_deq);
-		event_ring_deq = xhci->event_ring->dequeue;
+		xhci_update_erst_dequeue(xhci, ir, event_ring_deq);
+		event_ring_deq = ir->event_ring->dequeue;
 
 		/* ring is half-full, force isoc trbs to interrupt more often */
 		if (xhci->isoc_bei_interval > AVOID_BEI_INTERVAL_MIN)
@@ -3088,7 +3094,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		event_loop = 0;
 	}
 
-	xhci_update_erst_dequeue(xhci, event_ring_deq);
+	xhci_update_erst_dequeue(xhci, ir, event_ring_deq);
 	ret = IRQ_HANDLED;
 
 out:
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index f61fda4715cc..8dc3f2c00577 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -613,6 +613,7 @@ static int xhci_init(struct usb_hcd *hcd)
 
 static int xhci_run_finished(struct xhci_hcd *xhci)
 {
+	struct xhci_interrupter *ir = xhci->interrupter;
 	unsigned long	flags;
 	u32		temp;
 
@@ -628,8 +629,8 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 	writel(temp, &xhci->op_regs->command);
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Enable primary interrupter");
-	temp = readl(&xhci->ir_set->irq_pending);
-	writel(ER_IRQ_ENABLE(temp), &xhci->ir_set->irq_pending);
+	temp = readl(&ir->ir_set->irq_pending);
+	writel(ER_IRQ_ENABLE(temp), &ir->ir_set->irq_pending);
 
 	if (xhci_start(xhci)) {
 		xhci_halt(xhci);
@@ -665,7 +666,7 @@ int xhci_run(struct usb_hcd *hcd)
 	u64 temp_64;
 	int ret;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-
+	struct xhci_interrupter *ir = xhci->interrupter;
 	/* Start the xHCI host controller running only after the USB 2.0 roothub
 	 * is setup.
 	 */
@@ -680,17 +681,17 @@ int xhci_run(struct usb_hcd *hcd)
 	if (ret)
 		return ret;
 
-	temp_64 = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
+	temp_64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
 	temp_64 &= ~ERST_PTR_MASK;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"ERST deq = 64'h%0lx", (long unsigned int) temp_64);
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"// Set the interrupt modulation register");
-	temp = readl(&xhci->ir_set->irq_control);
+	temp = readl(&ir->ir_set->irq_control);
 	temp &= ~ER_IRQ_INTERVAL_MASK;
 	temp |= (xhci->imod_interval / 250) & ER_IRQ_INTERVAL_MASK;
-	writel(temp, &xhci->ir_set->irq_control);
+	writel(temp, &ir->ir_set->irq_control);
 
 	if (xhci->quirks & XHCI_NEC_HOST) {
 		struct xhci_command *command;
@@ -769,8 +770,8 @@ static void xhci_stop(struct usb_hcd *hcd)
 			"// Disabling event ring interrupts");
 	temp = readl(&xhci->op_regs->status);
 	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-	temp = readl(&xhci->ir_set->irq_pending);
-	writel(ER_IRQ_DISABLE(temp), &xhci->ir_set->irq_pending);
+	temp = readl(&xhci->interrupter->ir_set->irq_pending);
+	writel(ER_IRQ_DISABLE(temp), &xhci->interrupter->ir_set->irq_pending);
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
 	xhci_mem_cleanup(xhci);
@@ -832,28 +833,36 @@ EXPORT_SYMBOL_GPL(xhci_shutdown);
 #ifdef CONFIG_PM
 static void xhci_save_registers(struct xhci_hcd *xhci)
 {
+	struct xhci_interrupter *ir = xhci->interrupter;
+
 	xhci->s3.command = readl(&xhci->op_regs->command);
 	xhci->s3.dev_nt = readl(&xhci->op_regs->dev_notification);
 	xhci->s3.dcbaa_ptr = xhci_read_64(xhci, &xhci->op_regs->dcbaa_ptr);
 	xhci->s3.config_reg = readl(&xhci->op_regs->config_reg);
-	xhci->s3.erst_size = readl(&xhci->ir_set->erst_size);
-	xhci->s3.erst_base = xhci_read_64(xhci, &xhci->ir_set->erst_base);
-	xhci->s3.erst_dequeue = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
-	xhci->s3.irq_pending = readl(&xhci->ir_set->irq_pending);
-	xhci->s3.irq_control = readl(&xhci->ir_set->irq_control);
+
+	if (!ir)
+		return;
+
+	ir->s3_erst_size = readl(&ir->ir_set->erst_size);
+	ir->s3_erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
+	ir->s3_erst_dequeue = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+	ir->s3_irq_pending = readl(&ir->ir_set->irq_pending);
+	ir->s3_irq_control = readl(&ir->ir_set->irq_control);
 }
 
 static void xhci_restore_registers(struct xhci_hcd *xhci)
 {
+	struct xhci_interrupter *ir = xhci->interrupter;
+
 	writel(xhci->s3.command, &xhci->op_regs->command);
 	writel(xhci->s3.dev_nt, &xhci->op_regs->dev_notification);
 	xhci_write_64(xhci, xhci->s3.dcbaa_ptr, &xhci->op_regs->dcbaa_ptr);
 	writel(xhci->s3.config_reg, &xhci->op_regs->config_reg);
-	writel(xhci->s3.erst_size, &xhci->ir_set->erst_size);
-	xhci_write_64(xhci, xhci->s3.erst_base, &xhci->ir_set->erst_base);
-	xhci_write_64(xhci, xhci->s3.erst_dequeue, &xhci->ir_set->erst_dequeue);
-	writel(xhci->s3.irq_pending, &xhci->ir_set->irq_pending);
-	writel(xhci->s3.irq_control, &xhci->ir_set->irq_control);
+	writel(ir->s3_erst_size, &ir->ir_set->erst_size);
+	xhci_write_64(xhci, ir->s3_erst_base, &ir->ir_set->erst_base);
+	xhci_write_64(xhci, ir->s3_erst_dequeue, &ir->ir_set->erst_dequeue);
+	writel(ir->s3_irq_pending, &ir->ir_set->irq_pending);
+	writel(ir->s3_irq_control, &ir->ir_set->irq_control);
 }
 
 static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
@@ -1218,8 +1227,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
 		temp = readl(&xhci->op_regs->status);
 		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-		temp = readl(&xhci->ir_set->irq_pending);
-		writel(ER_IRQ_DISABLE(temp), &xhci->ir_set->irq_pending);
+		temp = readl(&xhci->interrupter->ir_set->irq_pending);
+		writel(ER_IRQ_DISABLE(temp), &xhci->interrupter->ir_set->irq_pending);
 
 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
@@ -5334,6 +5343,11 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	if (xhci->hci_version > 0x100)
 		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
 
+	/* xhci-plat or xhci-pci might have set max_interrupters already */
+	if ((!xhci->max_interrupters) ||
+	    xhci->max_interrupters > HCS_MAX_INTRS(xhci->hcs_params1))
+		xhci->max_interrupters = HCS_MAX_INTRS(xhci->hcs_params1);
+
 	xhci->quirks |= quirks;
 
 	get_quirks(dev, xhci);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 0dd92f9089fe..95eb235d1f70 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1687,11 +1687,6 @@ struct s3_save {
 	u32	dev_nt;
 	u64	dcbaa_ptr;
 	u32	config_reg;
-	u32	irq_pending;
-	u32	irq_control;
-	u32	erst_size;
-	u64	erst_base;
-	u64	erst_dequeue;
 };
 
 /* Use for lpm */
@@ -1718,7 +1713,18 @@ struct xhci_bus_state {
 	struct completion	u3exit_done[USB_MAXCHILDREN];
 };
 
-
+struct xhci_interrupter {
+	struct xhci_ring	*event_ring;
+	struct xhci_erst	erst;
+	struct xhci_intr_reg __iomem *ir_set;
+	unsigned int		intr_num;
+	/* For interrupter registers save and restore over suspend/resume */
+	u32	s3_irq_pending;
+	u32	s3_irq_control;
+	u32	s3_erst_size;
+	u64	s3_erst_base;
+	u64	s3_erst_dequeue;
+};
 /*
  * It can take up to 20 ms to transition from RExit to U0 on the
  * Intel Lynx Point LP xHCI host.
@@ -1761,8 +1767,6 @@ struct xhci_hcd {
 	struct xhci_op_regs __iomem *op_regs;
 	struct xhci_run_regs __iomem *run_regs;
 	struct xhci_doorbell_array __iomem *dba;
-	/* Our HCD's current interrupter register set */
-	struct	xhci_intr_reg __iomem *ir_set;
 
 	/* Cached register copies of read-only HC data */
 	__u32		hcs_params1;
@@ -1797,6 +1801,7 @@ struct xhci_hcd {
 	struct reset_control *reset;
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
+	struct xhci_interrupter *interrupter;
 	struct xhci_ring	*cmd_ring;
 	unsigned int            cmd_ring_state;
 #define CMD_RING_STATE_RUNNING         (1 << 0)
@@ -1807,8 +1812,7 @@ struct xhci_hcd {
 	struct delayed_work	cmd_timer;
 	struct completion	cmd_ring_stop_completion;
 	struct xhci_command	*current_cmd;
-	struct xhci_ring	*event_ring;
-	struct xhci_erst	erst;
+
 	/* Scratchpad */
 	struct xhci_scratchpad  *scratchpad;
 
-- 
2.25.1

