Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE4E787563
	for <lists+linux-usb@lfdr.de>; Thu, 24 Aug 2023 18:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242351AbjHXQ31 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 12:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242588AbjHXQ3E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 12:29:04 -0400
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A158C1FD7
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 09:28:31 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by mailout3.hostsharing.net (Postfix) with ESMTPS id 20FCE101E6A3D;
        Thu, 24 Aug 2023 18:28:18 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id C52B0603DADA;
        Thu, 24 Aug 2023 18:28:17 +0200 (CEST)
X-Mailbox-Line: From 369fc112b3008bc31b16e4837a24743e685b8ca8 Mon Sep 17 00:00:00 2001
Message-Id: <369fc112b3008bc31b16e4837a24743e685b8ca8.1692892942.git.lukas@wunner.de>
In-Reply-To: <cover.1692892942.git.lukas@wunner.de>
References: <cover.1692892942.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Thu, 24 Aug 2023 18:15:02 +0200
Subject: [PATCH v2 02/10] xhci: Preserve RsvdP bits in ERSTBA register
 correctly
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

xhci_add_interrupter() erroneously preserves only the lowest 4 bits when
writing the ERSTBA register, not the lowest 6 bits.  Fix it.

Migrate the ERST_BASE_RSVDP macro to the modern GENMASK_ULL() syntax to
avoid a u64 cast.

This was previously fixed by commit 8c1cbec9db1a ("xhci: fix event ring
segment table related masks and variables in header"), but immediately
undone by commit b17a57f89f69 ("xhci: Refactor interrupter code for
initial multi interrupter support.").

Fixes: b17a57f89f69 ("xhci: Refactor interrupter code for initial multi interrupter support.")
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Cc: stable@vger.kernel.org # v6.3+
---
 drivers/usb/host/xhci-mem.c | 4 ++--
 drivers/usb/host/xhci.h     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 8714ab5bf04d..0a37f0d511cf 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2285,8 +2285,8 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 	writel(erst_size, &ir->ir_set->erst_size);
 
 	erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
-	erst_base &= ERST_PTR_MASK;
-	erst_base |= (ir->erst.erst_dma_addr & (u64) ~ERST_PTR_MASK);
+	erst_base &= ERST_BASE_RSVDP;
+	erst_base |= ir->erst.erst_dma_addr & ~ERST_BASE_RSVDP;
 	xhci_write_64(xhci, erst_base, &ir->ir_set->erst_base);
 
 	/* Set the event ring dequeue address of this interrupter */
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 7e282b4522c0..5df370482521 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -514,7 +514,7 @@ struct xhci_intr_reg {
 #define	ERST_SIZE_MASK		(0xffff << 16)
 
 /* erst_base bitmasks */
-#define ERST_BASE_RSVDP		(0x3f)
+#define ERST_BASE_RSVDP		(GENMASK_ULL(5, 0))
 
 /* erst_dequeue bitmasks */
 /* Dequeue ERST Segment Index (DESI) - Segment number (or alias)
-- 
2.39.2

