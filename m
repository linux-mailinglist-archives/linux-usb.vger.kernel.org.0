Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F132477C884
	for <lists+linux-usb@lfdr.de>; Tue, 15 Aug 2023 09:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234860AbjHOH1Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Aug 2023 03:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235433AbjHOH03 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Aug 2023 03:26:29 -0400
X-Greylist: delayed 329 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Aug 2023 00:26:27 PDT
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301E31999
        for <linux-usb@vger.kernel.org>; Tue, 15 Aug 2023 00:26:26 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id CD6AD100DA1A2;
        Tue, 15 Aug 2023 09:20:53 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 82ECD2E9C31; Tue, 15 Aug 2023 09:20:53 +0200 (CEST)
Message-Id: <0e26fb1421216b198a89b9164ab6c4cd9e1e127a.1692049324.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Tue, 15 Aug 2023 09:20:53 +0200
Subject: [PATCH] xhci: Clear EHB bit only at end of interrupt handler
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Event Handler Busy bit shall be cleared by software when the Event
Ring is empty.  The xHC is thereby informed that it may raise another
interrupt once it has enqueued new events (sec 4.17.2).

However since commit dc0ffbea5729 ("usb: host: xhci: update event ring
dequeue pointer on purpose"), the EHB bit is already cleared after half
a segment has been processed.

As a result, spurious interrupts may occur:

- xhci_irq() processes half a segment, clears EHB, continues processing
  remaining events.
- xHC enqueues new events.  Because EHB has been cleared, xHC sets
  Interrupt Pending bit.  Interrupt moderation countdown begins.
- Meanwhile xhci_irq() continues processing events.  Interrupt
  moderation countdown reaches zero, so an MSI interrupt is signaled.
- xhci_irq() empties the Event Ring, clears EHB again and is done.
- Because an MSI interrupt has been signaled, xhci_irq() is run again.
  It discovers there's nothing to do and returns IRQ_NONE.

Avoid by clearing the EHB bit only at the end of xhci_irq().

Fixes: dc0ffbea5729 ("usb: host: xhci: update event ring dequeue pointer on purpose")
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Cc: stable@vger.kernel.org # v5.5+
Cc: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-ring.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1dde53f..bc6280b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2996,7 +2996,8 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
  */
 static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 				     struct xhci_interrupter *ir,
-				     union xhci_trb *event_ring_deq)
+				     union xhci_trb *event_ring_deq,
+				     bool clear_ehb)
 {
 	u64 temp_64;
 	dma_addr_t deq;
@@ -3022,7 +3023,8 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 	}
 
 	/* Clear the event handler busy flag (RW1C) */
-	temp_64 |= ERST_EHB;
+	if (clear_ehb)
+		temp_64 |= ERST_EHB;
 	xhci_write_64(xhci, temp_64, &ir->ir_set->erst_dequeue);
 }
 
@@ -3103,7 +3105,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	while (xhci_handle_event(xhci, ir) > 0) {
 		if (event_loop++ < TRBS_PER_SEGMENT / 2)
 			continue;
-		xhci_update_erst_dequeue(xhci, ir, event_ring_deq);
+		xhci_update_erst_dequeue(xhci, ir, event_ring_deq, false);
 		event_ring_deq = ir->event_ring->dequeue;
 
 		/* ring is half-full, force isoc trbs to interrupt more often */
@@ -3113,7 +3115,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		event_loop = 0;
 	}
 
-	xhci_update_erst_dequeue(xhci, ir, event_ring_deq);
+	xhci_update_erst_dequeue(xhci, ir, event_ring_deq, true);
 	ret = IRQ_HANDLED;
 
 out:
-- 
2.39.2

