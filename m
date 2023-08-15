Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C93377CCE3
	for <lists+linux-usb@lfdr.de>; Tue, 15 Aug 2023 14:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237248AbjHOMry (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Aug 2023 08:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbjHOMrW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Aug 2023 08:47:22 -0400
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152911B2
        for <linux-usb@vger.kernel.org>; Tue, 15 Aug 2023 05:47:19 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 283E9100D943A;
        Tue, 15 Aug 2023 14:47:18 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id EC7AE1E8279; Tue, 15 Aug 2023 14:47:17 +0200 (CEST)
Message-Id: <97f42cbb432ed38a327f02ef37348bd07765e0f5.1692085657.git.lukas@wunner.de>
In-Reply-To: <cover.1692085657.git.lukas@wunner.de>
References: <cover.1692085657.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Tue, 15 Aug 2023 14:40:39 +0200
Subject: [PATCH 2/2] xhci: Use more than one Event Ring segment
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
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jonathan Bell <jonathan@raspberrypi.com>

Users have reported log spam created by "Event Ring Full" xHC event
TRBs.  These are caused by interrupt latency in conjunction with a very
busy set of devices on the bus.  The errors are benign, but throughput
will suffer as the xHC will pause processing of transfers until the
Event Ring is drained by the kernel.

Commit dc0ffbea5729 ("usb: host: xhci: update event ring dequeue pointer
on purpose") mitigated the issue by advancing the Event Ring Dequeue
Pointer already after half a segment has been processed.  Nevertheless,
providing a larger Event Ring would be useful to cope with load peaks.

Expand the number of event TRB slots available by increasing the number
of Event Ring segments in the ERST.

Controllers have a hardware-defined limit as to the number of ERST
entries they can process, but with up to 32k it can be excessively high
(sec 5.3.4).  So cap the actual number at 8 (configurable through the
ERST_MAX_SEGS macro), which seems like a reasonable quantity.

An alternative to increasing the number of Event Ring segments would be
an increase of the segment size.  But that requires allocating multiple
contiguous pages, which may be impossible if memory is fragmented.

Link: https://forums.raspberrypi.com/viewtopic.php?t=246263
Signed-off-by: Jonathan Bell <jonathan@raspberrypi.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/usb/host/xhci-mem.c | 10 +++++++---
 drivers/usb/host/xhci.h     |  5 +++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c265425..cb50bf8 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2238,14 +2238,18 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	struct xhci_interrupter *ir;
+	unsigned int num_segs;
 	int ret;
 
 	ir = kzalloc_node(sizeof(*ir), flags, dev_to_node(dev));
 	if (!ir)
 		return NULL;
 
-	ir->event_ring = xhci_ring_alloc(xhci, ERST_NUM_SEGS, 1, TYPE_EVENT,
-					0, flags);
+	num_segs = min_t(unsigned int, 1 << HCS_ERST_MAX(xhci->hcs_params2),
+			 ERST_MAX_SEGS);
+
+	ir->event_ring = xhci_ring_alloc(xhci, num_segs, 1, TYPE_EVENT, 0,
+					 flags);
 	if (!ir->event_ring) {
 		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
 		kfree(ir);
@@ -2281,7 +2285,7 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 	/* set ERST count with the number of entries in the segment table */
 	erst_size = readl(&ir->ir_set->erst_size);
 	erst_size &= ERST_SIZE_MASK;
-	erst_size |= ERST_NUM_SEGS;
+	erst_size |= ir->event_ring->num_segs;
 	writel(erst_size, &ir->ir_set->erst_size);
 
 	erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 45c9177..0948d51 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1674,8 +1674,9 @@ struct urb_priv {
  * Each segment table entry is 4*32bits long.  1K seems like an ok size:
  * (1K bytes * 8bytes/bit) / (4*32 bits) = 64 segment entries in the table,
  * meaning 64 ring segments.
- * Initial allocated size of the ERST, in number of entries */
-#define	ERST_NUM_SEGS	1
+ *
+ * Reasonable limit for number of Event Ring segments (spec allows 32k) */
+#define	ERST_MAX_SEGS	8
 /* Poll every 60 seconds */
 #define	POLL_TIMEOUT	60
 /* Stop endpoint command timeout (secs) for URB cancellation watchdog timer */
-- 
2.39.2

