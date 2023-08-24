Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A2B7875C9
	for <lists+linux-usb@lfdr.de>; Thu, 24 Aug 2023 18:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242581AbjHXQn6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 12:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236401AbjHXQnx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 12:43:53 -0400
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618D8198
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 09:43:51 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by mailout3.hostsharing.net (Postfix) with ESMTPS id D3251101E6B30;
        Thu, 24 Aug 2023 18:43:47 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id 8F7EB603DADA;
        Thu, 24 Aug 2023 18:43:47 +0200 (CEST)
X-Mailbox-Line: From f2849ad55385886c8c0b98bd5de04daf970eefcb Mon Sep 17 00:00:00 2001
Message-Id: <f2849ad55385886c8c0b98bd5de04daf970eefcb.1692892942.git.lukas@wunner.de>
In-Reply-To: <cover.1692892942.git.lukas@wunner.de>
References: <cover.1692892942.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Thu, 24 Aug 2023 18:15:06 +0200
Subject: [PATCH v2 06/10] xhci: Update last segment pointer after Event Ring
 expansion
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

When expanding a ring at its "end", ring->last_seg needs to be updated
for Event Rings as well, not just for all the other ring types.

This is not a fix because ring expansion currently isn't done on the
Event Ring.  It's just in preparation for when it's added.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/usb/host/xhci-mem.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 1c0f5263cf81..d4123e6f2549 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -146,11 +146,13 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	xhci_link_segments(last, next, ring->type, chain_links);
 	ring->num_segs += num_segs;
 
-	if (ring->type != TYPE_EVENT && ring->enq_seg == ring->last_seg) {
-		ring->last_seg->trbs[TRBS_PER_SEGMENT-1].link.control
-			&= ~cpu_to_le32(LINK_TOGGLE);
-		last->trbs[TRBS_PER_SEGMENT-1].link.control
-			|= cpu_to_le32(LINK_TOGGLE);
+	if (ring->enq_seg == ring->last_seg) {
+		if (ring->type != TYPE_EVENT) {
+			ring->last_seg->trbs[TRBS_PER_SEGMENT-1].link.control
+				&= ~cpu_to_le32(LINK_TOGGLE);
+			last->trbs[TRBS_PER_SEGMENT-1].link.control
+				|= cpu_to_le32(LINK_TOGGLE);
+		}
 		ring->last_seg = last;
 	}
 
-- 
2.39.2

