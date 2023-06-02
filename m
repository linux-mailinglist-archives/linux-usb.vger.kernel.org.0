Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9135B720498
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 16:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236039AbjFBOjZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 10:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235281AbjFBOjY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 10:39:24 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0AD99
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 07:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685716763; x=1717252763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1H86g8tJzazeGUBadrNF59cRnRCB8pM5IcNycbxJfhE=;
  b=XCgjRKUEeGe/R7I+bY0ASKiDW1Oh9lNE//eabnT3QICG+JbOU3Tnd3ln
   WHfFmu/bw6lwM1t7B3L7FHWokKx8koK7Gu8+gNLyP3h7LrIFjCAhgRxzx
   MhrYiZjUlvG6pGiYtK1kjWobnEtWzhQ4xEs4+Acb+Ixy0KNvzE6b+Hd8V
   ci6bel2KmBiu+QaOfYVkY7hYShotvYRg42OSGpSuFMJRq7GctqxEl1r5k
   EG8RiUoMOLu+X45q2B6VEuOAgCJjO+ZlSHjBe8eVnsn8sdruVQV6L1m9I
   SMYxgpwE3z1xNp4tC43jVYvBeBW+Sd6emkflMDw0tSmYWwgrVaKRmuKN2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358311256"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="358311256"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707877450"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="707877450"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 02 Jun 2023 07:38:59 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/11] xhci: split allocate interrupter into separate alloacte and add parts
Date:   Fri,  2 Jun 2023 17:40:03 +0300
Message-Id: <20230602144009.1225632-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
References: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current function that both allocates and adds the interrupter isn't
optimal when using several interrupters. The array of interrupters need
to be protected with a lock while adding or removing interrupters.
If memory is allocated under the default xhci spinlock then GFP_KERNEL
can't be used.

There is no need to allocate the interrupter memory under the lock, so
split this code into separate unlocked allocate part, and a lock
protected add part.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 78 +++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7e106bd804ca..2bf8121f4d36 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1831,13 +1831,15 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	 * low or high 32 bits of ERSTBA immediately causes the controller to
 	 * dereference the partially cleared 64 bit address, causing IOMMU error.
 	 */
-	tmp = readl(&ir->ir_set->erst_size);
-	tmp &= ERST_SIZE_MASK;
-	writel(tmp, &ir->ir_set->erst_size);
-
-	tmp64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	tmp64 &= (u64) ERST_PTR_MASK;
-	xhci_write_64(xhci, tmp64, &ir->ir_set->erst_dequeue);
+	if (ir->ir_set) {
+		tmp = readl(&ir->ir_set->erst_size);
+		tmp &= ERST_SIZE_MASK;
+		writel(tmp, &ir->ir_set->erst_size);
+
+		tmp64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+		tmp64 &= (u64) ERST_PTR_MASK;
+		xhci_write_64(xhci, tmp64, &ir->ir_set->erst_dequeue);
+	}
 
 	/* free interrrupter event ring */
 	if (ir->event_ring)
@@ -2227,43 +2229,50 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 }
 
 static struct xhci_interrupter *
-xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int intr_num, gfp_t flags)
+xhci_alloc_interrupter(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	struct xhci_interrupter *ir;
-	u64 erst_base;
-	u32 erst_size;
 	int ret;
 
-	if (intr_num > xhci->max_interrupters) {
-		xhci_warn(xhci, "Can't allocate interrupter %d, max interrupters %d\n",
-			  intr_num, xhci->max_interrupters);
-		return NULL;
-	}
-
-	if (xhci->interrupter) {
-		xhci_warn(xhci, "Can't allocate already set up interrupter %d\n", intr_num);
-		return NULL;
-	}
-
 	ir = kzalloc_node(sizeof(*ir), flags, dev_to_node(dev));
 	if (!ir)
 		return NULL;
 
-	ir->ir_set = &xhci->run_regs->ir_set[intr_num];
 	ir->event_ring = xhci_ring_alloc(xhci, ERST_NUM_SEGS, 1, TYPE_EVENT,
 					0, flags);
 	if (!ir->event_ring) {
-		xhci_warn(xhci, "Failed to allocate interrupter %d event ring\n", intr_num);
-		goto fail_ir;
+		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
+		kfree(ir);
+		return NULL;
 	}
 
 	ret = xhci_alloc_erst(xhci, ir->event_ring, &ir->erst, flags);
 	if (ret) {
-		xhci_warn(xhci, "Failed to allocate interrupter %d erst\n", intr_num);
-		goto fail_ev;
+		xhci_warn(xhci, "Failed to allocate interrupter erst\n");
+		xhci_ring_free(xhci, ir->event_ring);
+		kfree(ir);
+		return NULL;
+	}
+
+	return ir;
+}
+
+static int
+xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
+		     unsigned int intr_num)
+{
+	u64 erst_base;
+	u32 erst_size;
 
+	if (intr_num > xhci->max_interrupters) {
+		xhci_warn(xhci, "Can't add interrupter %d, max interrupters %d\n",
+			  intr_num, xhci->max_interrupters);
+		return -EINVAL;
 	}
+
+	ir->ir_set = &xhci->run_regs->ir_set[intr_num];
+
 	/* set ERST count with the number of entries in the segment table */
 	erst_size = readl(&ir->ir_set->erst_size);
 	erst_size &= ERST_SIZE_MASK;
@@ -2278,14 +2287,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int intr_num, gfp_t flags
 	/* Set the event ring dequeue address of this interrupter */
 	xhci_set_hc_event_deq(xhci, ir);
 
-	return ir;
-
-fail_ev:
-	xhci_ring_free(xhci, ir->event_ring);
-fail_ir:
-	kfree(ir);
-
-	return NULL;
+	return 0;
 }
 
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
@@ -2407,15 +2409,17 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		       "// Doorbell array is located at offset 0x%x from cap regs base addr",
 		       val);
 	xhci->dba = (void __iomem *) xhci->cap_regs + val;
-	/* Set ir_set to interrupt register set 0 */
 
-	/* allocate and set up primary interrupter with an event ring. */
+	/* Allocate and set up primary interrupter 0 with an event ring. */
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 		       "Allocating primary event ring");
-	xhci->interrupter = xhci_alloc_interrupter(xhci, 0, flags);
+	xhci->interrupter = xhci_alloc_interrupter(xhci, flags);
 	if (!xhci->interrupter)
 		goto fail;
 
+	if (xhci_add_interrupter(xhci, xhci->interrupter, 0))
+		goto fail;
+
 	xhci->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
 	/*
-- 
2.25.1

