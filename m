Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5BDB7875F9
	for <lists+linux-usb@lfdr.de>; Thu, 24 Aug 2023 18:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242674AbjHXQtw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 12:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242712AbjHXQtl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 12:49:41 -0400
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5A11B9
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 09:49:39 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by mailout3.hostsharing.net (Postfix) with ESMTPS id A3684101E6B30;
        Thu, 24 Aug 2023 18:49:37 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id 5B052603DADA;
        Thu, 24 Aug 2023 18:49:37 +0200 (CEST)
X-Mailbox-Line: From f9632fa607cc0f83993547494e2fe640e3e9da24 Mon Sep 17 00:00:00 2001
Message-Id: <f9632fa607cc0f83993547494e2fe640e3e9da24.1692892942.git.lukas@wunner.de>
In-Reply-To: <cover.1692892942.git.lukas@wunner.de>
References: <cover.1692892942.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Thu, 24 Aug 2023 18:15:09 +0200
Subject: [PATCH v2 09/10] xhci: Clean up stale comment on ERST_SIZE macro
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

Commit ebd88cf50729 ("xhci: Remove unused defines for ERST_SIZE and
ERST_ENTRIES") removed the ERST_SIZE macro but retained a code comment
explaining the quantity chosen in the macro.

Remove the code comment as well.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/usb/host/xhci.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 20744e41e385..effc80eb8fa9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1670,11 +1670,7 @@ struct urb_priv {
 	struct	xhci_td	td[];
 };
 
-/*
- * Each segment table entry is 4*32bits long.  1K seems like an ok size:
- * (1K bytes * 8bytes/bit) / (4*32 bits) = 64 segment entries in the table,
- * meaning 64 ring segments.
- * Reasonable limit for number of Event Ring segments (spec allows 32k) */
+/* Reasonable limit for number of Event Ring segments (spec allows 32k) */
 #define	ERST_MAX_SEGS	2
 /* Poll every 60 seconds */
 #define	POLL_TIMEOUT	60
-- 
2.39.2

