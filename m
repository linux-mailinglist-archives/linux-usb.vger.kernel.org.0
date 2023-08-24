Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5117875CA
	for <lists+linux-usb@lfdr.de>; Thu, 24 Aug 2023 18:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242676AbjHXQoa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 12:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242746AbjHXQoQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 12:44:16 -0400
X-Greylist: delayed 451 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 24 Aug 2023 09:44:09 PDT
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3398719B5
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 09:44:09 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by mailout2.hostsharing.net (Postfix) with ESMTPS id 82F7710189CE5;
        Thu, 24 Aug 2023 18:36:36 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id 5E009603DADA;
        Thu, 24 Aug 2023 18:36:36 +0200 (CEST)
X-Mailbox-Line: From f775835fc46bb5357c5fe857f996c7869b29adf6 Mon Sep 17 00:00:00 2001
Message-Id: <f775835fc46bb5357c5fe857f996c7869b29adf6.1692892942.git.lukas@wunner.de>
In-Reply-To: <cover.1692892942.git.lukas@wunner.de>
References: <cover.1692892942.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Thu, 24 Aug 2023 18:15:04 +0200
Subject: [PATCH v2 04/10] xhci: Use more than one Event Ring segment
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
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
(sec 5.3.4).  So cap the actual number at 2 (configurable through the
ERST_MAX_SEGS macro), which seems like a reasonable quantity.  It is
supported by any xHC because the limit in the HCSPARAMS2 register is
defined as a power of 2.  Renesas uPD720201 and VIA VL805 controllers
do not support more than 2 ERST entries.

An alternative to increasing the number of Event Ring segments would be
an increase of the segment size.  But that requires allocating multiple
contiguous pages, which may be impossible if memory is fragmented.

Signed-off-by: Jonathan Bell <jonathan@raspberrypi.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 Change v1 -> v2:
 Only use up to 2 Event Ring segments by default (instead of 8).

 drivers/usb/host/xhci-mem.c | 10 +++++++---
 drivers/usb/host/xhci.h     |  4 ++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 17c9942010c8..a8a8fc2cc4a5 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2235,14 +2235,18 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, gfp_t flags)
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
@@ -2278,7 +2282,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 	/* set ERST count with the number of entries in the segment table */
 	erst_size = readl(&ir->ir_set->erst_size);
 	erst_size &= ERST_SIZE_MASK;
-	erst_size |= ERST_NUM_SEGS;
+	erst_size |= ir->event_ring->num_segs;
 	writel(erst_size, &ir->ir_set->erst_size);
 
 	erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index dc567be207ce..a2ca5e4e0b9f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1674,8 +1674,8 @@ struct urb_priv {
  * Each segment table entry is 4*32bits long.  1K seems like an ok size:
  * (1K bytes * 8bytes/bit) / (4*32 bits) = 64 segment entries in the table,
  * meaning 64 ring segments.
- * Initial allocated size of the ERST, in number of entries */
-#define	ERST_NUM_SEGS	1
+ * Reasonable limit for number of Event Ring segments (spec allows 32k) */
+#define	ERST_MAX_SEGS	2
 /* Poll every 60 seconds */
 #define	POLL_TIMEOUT	60
 /* Stop endpoint command timeout (secs) for URB cancellation watchdog timer */
-- 
2.39.2

