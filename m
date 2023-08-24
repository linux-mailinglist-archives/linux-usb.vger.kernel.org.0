Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3F8C7875F0
	for <lists+linux-usb@lfdr.de>; Thu, 24 Aug 2023 18:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242650AbjHXQsO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 12:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242777AbjHXQrm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 12:47:42 -0400
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E89E51
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 09:47:40 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by mailout3.hostsharing.net (Postfix) with ESMTPS id 4664E101E6B30;
        Thu, 24 Aug 2023 18:47:38 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id F294B603DADA;
        Thu, 24 Aug 2023 18:47:37 +0200 (CEST)
X-Mailbox-Line: From e81751a0fae84fc042ab422ab47da11ad4e33cdd Mon Sep 17 00:00:00 2001
Message-Id: <e81751a0fae84fc042ab422ab47da11ad4e33cdd.1692892942.git.lukas@wunner.de>
In-Reply-To: <cover.1692892942.git.lukas@wunner.de>
References: <cover.1692892942.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Thu, 24 Aug 2023 18:15:08 +0200
Subject: [PATCH v2 08/10] xhci: Clean up ERST_PTR_MASK inversion
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

Mathias notes that the ERST_PTR_MASK macro is named as if it's masking
the Event Ring Dequeue Pointer in the ERDP register, but in actuality
it's masking the inverse.

Invert the macro's value for clarity.

Migrate it to the modern GENMASK_ULL() syntax to avoid u64 casts.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/usb/host/xhci-mem.c  | 3 +--
 drivers/usb/host/xhci-ring.c | 5 ++---
 drivers/usb/host/xhci.c      | 2 +-
 drivers/usb/host/xhci.h      | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d4123e6f2549..b133817ad180 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1952,8 +1952,7 @@ static void xhci_set_hc_event_deq(struct xhci_hcd *xhci, struct xhci_interrupter
 	 */
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 		       "// Write event ring dequeue pointer, preserving EHB bit");
-	xhci_write_64(xhci, ((u64) deq & (u64) ~ERST_PTR_MASK),
-			&ir->ir_set->erst_dequeue);
+	xhci_write_64(xhci, deq & ERST_PTR_MASK, &ir->ir_set->erst_dequeue);
 }
 
 static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ca8b84816e41..c6a89c483663 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3013,13 +3013,12 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 		 * Per 4.9.4, Software writes to the ERDP register shall
 		 * always advance the Event Ring Dequeue Pointer value.
 		 */
-		if ((temp_64 & (u64) ~ERST_PTR_MASK) ==
-				((u64) deq & (u64) ~ERST_PTR_MASK))
+		if ((temp_64 & ERST_PTR_MASK) == (deq & ERST_PTR_MASK))
 			return;
 
 		/* Update HC event ring dequeue pointer */
 		temp_64 = ir->event_ring->deq_seg->num & ERST_DESI_MASK;
-		temp_64 |= ((u64) deq & (u64) ~ERST_PTR_MASK);
+		temp_64 |= deq & ERST_PTR_MASK;
 	}
 
 	/* Clear the event handler busy flag (RW1C) */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e1b1b64a0723..68920cb96044 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -520,7 +520,7 @@ int xhci_run(struct usb_hcd *hcd)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xhci_run");
 
 	temp_64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	temp_64 &= ~ERST_PTR_MASK;
+	temp_64 &= ERST_PTR_MASK;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"ERST deq = 64'h%0lx", (long unsigned int) temp_64);
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a2ca5e4e0b9f..20744e41e385 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -525,7 +525,7 @@ struct xhci_intr_reg {
  * a work queue (or delayed service routine)?
  */
 #define ERST_EHB		(1 << 3)
-#define ERST_PTR_MASK		(0xf)
+#define ERST_PTR_MASK		(GENMASK_ULL(63, 4))
 
 /**
  * struct xhci_run_regs
-- 
2.39.2

