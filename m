Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1797A78756F
	for <lists+linux-usb@lfdr.de>; Thu, 24 Aug 2023 18:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242572AbjHXQdP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 12:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242573AbjHXQdK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 12:33:10 -0400
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AF9E5E
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 09:33:07 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by mailout1.hostsharing.net (Postfix) with ESMTPS id 5A94C101920CC;
        Thu, 24 Aug 2023 18:33:06 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id 34F99603DADA;
        Thu, 24 Aug 2023 18:33:06 +0200 (CEST)
X-Mailbox-Line: From f48daf6c36eed754ff5e4f16e075399f4fa480c6 Mon Sep 17 00:00:00 2001
Message-Id: <f48daf6c36eed754ff5e4f16e075399f4fa480c6.1692892942.git.lukas@wunner.de>
In-Reply-To: <cover.1692892942.git.lukas@wunner.de>
References: <cover.1692892942.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Thu, 24 Aug 2023 18:15:03 +0200
Subject: [PATCH v2 03/10] xhci: Set DESI bits in ERDP register correctly
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Jonathan Bell <jonathan@raspberrypi.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When using more than one Event Ring segment (ERSTSZ > 1), software shall
set the DESI bits in the ERDP register to the number of the segment to
which the upper ERDP bits are pointing.  The xHC may use the DESI bits
as a shortcut to determine whether it needs to check for an Event Ring
Full condition:  If it's enqueueing events in a different segment, it
need not compare its internal Enqueue Pointer with the Dequeue Pointer
in the upper bits of the ERDP register (sec 5.5.2.3.3).

Not setting the DESI bits correctly can result in the xHC enqueueing
events past the Dequeue Pointer.  On Renesas uPD720201 host controllers,
incorrect DESI bits cause an interrupt storm.  For comparison, VIA VL805
host controllers do not exhibit such problems.  Perhaps they do not take
advantage of the optimization afforded by the DESI bits.

To fix the issue, assign the segment number to each struct xhci_segment
in xhci_segment_alloc().  When advancing the Dequeue Pointer in
xhci_update_erst_dequeue(), write the segment number to the DESI bits.

On driver probe, set the DESI bits to zero in xhci_set_hc_event_deq() as
processing starts in segment 0.  Likewise on driver teardown, clear the
DESI bits to zero in xhci_free_interrupter() when clearing the upper
bits of the ERDP register.  Previously those functions (incorrectly)
treated the DESI bits as if they're declared RsvdP.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/usb/host/xhci-mem.c  | 25 +++++++++++--------------
 drivers/usb/host/xhci-ring.c |  2 +-
 drivers/usb/host/xhci.h      |  1 +
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 0a37f0d511cf..17c9942010c8 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -29,6 +29,7 @@
 static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 					       unsigned int cycle_state,
 					       unsigned int max_packet,
+					       unsigned int num,
 					       gfp_t flags)
 {
 	struct xhci_segment *seg;
@@ -60,6 +61,7 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 		for (i = 0; i < TRBS_PER_SEGMENT; i++)
 			seg->trbs[i].link.control = cpu_to_le32(TRB_CYCLE);
 	}
+	seg->num = num;
 	seg->dma = dma;
 	seg->next = NULL;
 
@@ -324,6 +326,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 		enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
 {
 	struct xhci_segment *prev;
+	unsigned int num = 0;
 	bool chain_links;
 
 	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
@@ -331,16 +334,17 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 			 (type == TYPE_ISOC &&
 			  (xhci->quirks & XHCI_AMD_0x96_HOST)));
 
-	prev = xhci_segment_alloc(xhci, cycle_state, max_packet, flags);
+	prev = xhci_segment_alloc(xhci, cycle_state, max_packet, num, flags);
 	if (!prev)
 		return -ENOMEM;
-	num_segs--;
+	num++;
 
 	*first = prev;
-	while (num_segs > 0) {
+	while (num < num_segs) {
 		struct xhci_segment	*next;
 
-		next = xhci_segment_alloc(xhci, cycle_state, max_packet, flags);
+		next = xhci_segment_alloc(xhci, cycle_state, max_packet, num,
+					  flags);
 		if (!next) {
 			prev = *first;
 			while (prev) {
@@ -353,7 +357,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 		xhci_link_segments(prev, next, type, chain_links);
 
 		prev = next;
-		num_segs--;
+		num++;
 	}
 	xhci_link_segments(prev, *first, type, chain_links);
 	*last = prev;
@@ -1801,7 +1805,6 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	size_t erst_size;
-	u64 tmp64;
 	u32 tmp;
 
 	if (!ir)
@@ -1824,9 +1827,7 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		tmp &= ERST_SIZE_MASK;
 		writel(tmp, &ir->ir_set->erst_size);
 
-		tmp64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-		tmp64 &= (u64) ERST_PTR_MASK;
-		xhci_write_64(xhci, tmp64, &ir->ir_set->erst_dequeue);
+		xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
 	}
 
 	/* free interrrupter event ring */
@@ -1933,7 +1934,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 
 static void xhci_set_hc_event_deq(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
-	u64 temp;
 	dma_addr_t deq;
 
 	deq = xhci_trb_virt_to_dma(ir->event_ring->deq_seg,
@@ -1941,15 +1941,12 @@ static void xhci_set_hc_event_deq(struct xhci_hcd *xhci, struct xhci_interrupter
 	if (!deq)
 		xhci_warn(xhci, "WARN something wrong with SW event ring dequeue ptr.\n");
 	/* Update HC event ring dequeue pointer */
-	temp = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	temp &= ERST_PTR_MASK;
 	/* Don't clear the EHB bit (which is RW1C) because
 	 * there might be more events to service.
 	 */
-	temp &= ~ERST_EHB;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 		       "// Write event ring dequeue pointer, preserving EHB bit");
-	xhci_write_64(xhci, ((u64) deq & (u64) ~ERST_PTR_MASK) | temp,
+	xhci_write_64(xhci, ((u64) deq & (u64) ~ERST_PTR_MASK),
 			&ir->ir_set->erst_dequeue);
 }
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 21f50d25157f..ca8b84816e41 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3018,7 +3018,7 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			return;
 
 		/* Update HC event ring dequeue pointer */
-		temp_64 &= ERST_DESI_MASK;
+		temp_64 = ir->event_ring->deq_seg->num & ERST_DESI_MASK;
 		temp_64 |= ((u64) deq & (u64) ~ERST_PTR_MASK);
 	}
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 5df370482521..dc567be207ce 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1545,6 +1545,7 @@ struct xhci_segment {
 	union xhci_trb		*trbs;
 	/* private to HCD */
 	struct xhci_segment	*next;
+	unsigned int		num;
 	dma_addr_t		dma;
 	/* Max packet sized bounce buffer for td-fragmant alignment */
 	dma_addr_t		bounce_dma;
-- 
2.39.2

