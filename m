Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131CF787598
	for <lists+linux-usb@lfdr.de>; Thu, 24 Aug 2023 18:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242288AbjHXQkN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 12:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242337AbjHXQjp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 12:39:45 -0400
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D59B199D
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 09:39:43 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by mailout3.hostsharing.net (Postfix) with ESMTPS id 0BCCD101E6B30;
        Thu, 24 Aug 2023 18:39:42 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id A28B8603DADA;
        Thu, 24 Aug 2023 18:39:41 +0200 (CEST)
X-Mailbox-Line: From 8ddf91a065a3f5ee493abdc17b37a27c034786fa Mon Sep 17 00:00:00 2001
Message-Id: <8ddf91a065a3f5ee493abdc17b37a27c034786fa.1692892942.git.lukas@wunner.de>
In-Reply-To: <cover.1692892942.git.lukas@wunner.de>
References: <cover.1692892942.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Thu, 24 Aug 2023 18:15:05 +0200
Subject: [PATCH v2 05/10] xhci: Adjust segment numbers after ring expansion
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Jonathan Bell <jonathan@raspberrypi.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Initial xhci_ring allocation has just been amended to assign a
monotonically increasing number to each ring segment.

However rings may be expanded after initial allocation.

So number newly inserted segments starting from the preceding segment in
the ring and renumber all segments succeeding the newly inserted ones.

This is not a fix because ring expansion currently isn't done on the
Event Ring and that's the only ring type using the segment number.
It's just in preparation for when either Event Ring expansion is added
or when other ring types start making use of the segment number.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/usb/host/xhci-mem.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index a8a8fc2cc4a5..1c0f5263cf81 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -130,7 +130,7 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		struct xhci_segment *first, struct xhci_segment *last,
 		unsigned int num_segs)
 {
-	struct xhci_segment *next;
+	struct xhci_segment *next, *seg;
 	bool chain_links;
 
 	if (!ring || !first || !last)
@@ -153,6 +153,9 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 			|= cpu_to_le32(LINK_TOGGLE);
 		ring->last_seg = last;
 	}
+
+	for (seg = last; seg != ring->last_seg; seg = seg->next)
+		seg->next->num = seg->num + 1;
 }
 
 /*
@@ -322,11 +325,11 @@ void xhci_initialize_ring_info(struct xhci_ring *ring,
 /* Allocate segments and link them for a ring */
 static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 		struct xhci_segment **first, struct xhci_segment **last,
-		unsigned int num_segs, unsigned int cycle_state,
-		enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
+		unsigned int num_segs, unsigned int num,
+		unsigned int cycle_state, enum xhci_ring_type type,
+		unsigned int max_packet, gfp_t flags)
 {
 	struct xhci_segment *prev;
-	unsigned int num = 0;
 	bool chain_links;
 
 	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
@@ -392,7 +395,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci,
 		return ring;
 
 	ret = xhci_alloc_segments_for_ring(xhci, &ring->first_seg,
-			&ring->last_seg, num_segs, cycle_state, type,
+			&ring->last_seg, num_segs, 0, cycle_state, type,
 			max_packet, flags);
 	if (ret)
 		goto fail;
@@ -432,7 +435,8 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	int			ret;
 
 	ret = xhci_alloc_segments_for_ring(xhci, &first, &last,
-			num_new_segs, ring->cycle_state, ring->type,
+			num_new_segs, ring->enq_seg->num + 1,
+			ring->cycle_state, ring->type,
 			ring->bounce_buf_len, flags);
 	if (ret)
 		return -ENOMEM;
-- 
2.39.2

