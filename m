Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC26E787616
	for <lists+linux-usb@lfdr.de>; Thu, 24 Aug 2023 18:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242318AbjHXQxm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 12:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242731AbjHXQxL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 12:53:11 -0400
X-Greylist: delayed 559 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 24 Aug 2023 09:53:08 PDT
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f236:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEA01707
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 09:53:08 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by mailout3.hostsharing.net (Postfix) with ESMTPS id 84540101E6B30;
        Thu, 24 Aug 2023 18:53:06 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id F35C3603DADA;
        Thu, 24 Aug 2023 18:53:05 +0200 (CEST)
X-Mailbox-Line: From e47eee6551e5866d586fa8d223e3d81323f81fdc Mon Sep 17 00:00:00 2001
Message-Id: <e47eee6551e5866d586fa8d223e3d81323f81fdc.1692892942.git.lukas@wunner.de>
In-Reply-To: <cover.1692892942.git.lukas@wunner.de>
References: <cover.1692892942.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Thu, 24 Aug 2023 18:15:10 +0200
Subject: [PATCH v2 10/10] xhci: Clean up xhci_{alloc,free}_erst() declarations
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

xhci_alloc_erst() has global scope even though it's only used in
xhci-mem.c.  Declare it static.

xhci_free_erst() was removed by commit b17a57f89f69 ("xhci: Refactor
interrupter code for initial multi interrupter support."), but a
declaration in xhci.h still remains.  Drop it.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 drivers/usb/host/xhci.h     | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index b133817ad180..4d0b1c0e61a8 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1776,7 +1776,7 @@ void xhci_free_command(struct xhci_hcd *xhci,
 	kfree(command);
 }
 
-int xhci_alloc_erst(struct xhci_hcd *xhci,
+static int xhci_alloc_erst(struct xhci_hcd *xhci,
 		    struct xhci_ring *evt_ring,
 		    struct xhci_erst *erst,
 		    gfp_t flags)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index effc80eb8fa9..7749499ed32a 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2075,13 +2075,8 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci,
 void xhci_ring_free(struct xhci_hcd *xhci, struct xhci_ring *ring);
 int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		unsigned int num_trbs, gfp_t flags);
-int xhci_alloc_erst(struct xhci_hcd *xhci,
-		struct xhci_ring *evt_ring,
-		struct xhci_erst *erst,
-		gfp_t flags);
 void xhci_initialize_ring_info(struct xhci_ring *ring,
 			unsigned int cycle_state);
-void xhci_free_erst(struct xhci_hcd *xhci, struct xhci_erst *erst);
 void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		unsigned int ep_index);
-- 
2.39.2

