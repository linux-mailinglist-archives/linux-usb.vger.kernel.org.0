Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E5522B19C
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbgGWOme (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:33 -0400
IronPort-SDR: jATlXEDK2EOB5N2pJNSFImjITszCOYt4qEF98UUcVjt2NJDZf52tSp2IoJfy3nw1Z6OsbOu9yn
 tOpFNDS715/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607392"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607392"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:32 -0700
IronPort-SDR: EfJVRokKDSJ+ax4Y9IaOIaeQN7znmcu7F1V6khpXpnXCM1oIkAY3e7+TzTaBRNH3OVPQ6vVuvd
 ktUJBbCw73og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672378"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:31 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/27] xhci: dbc: Remove dbc_dma_free_coherent() wrapper
Date:   Thu, 23 Jul 2020 17:45:09 +0300
Message-Id: <20200723144530.9992-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dbc_dma_free_coherent() takes struct xhci_hcd pointer as a parameter, but
does nothing more than calls dma_free_coherent().
Remove it and call dma_free_coherent() directly instead.

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index e8a2cbda135c..5bec36ed97c6 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -14,15 +14,6 @@
 #include "xhci-trace.h"
 #include "xhci-dbgcap.h"
 
-static inline void
-dbc_dma_free_coherent(struct xhci_hcd *xhci, size_t size,
-		      void *cpu_addr, dma_addr_t dma_handle)
-{
-	if (cpu_addr)
-		dma_free_coherent(xhci_to_hcd(xhci)->self.sysdev,
-				  size, cpu_addr, dma_handle);
-}
-
 static u32 xhci_dbc_populate_strings(struct dbc_str_descs *strings)
 {
 	struct usb_string_descriptor	*s_desc;
@@ -465,9 +456,8 @@ static void xhci_dbc_mem_cleanup(struct xhci_hcd *xhci)
 	xhci_dbc_eps_exit(xhci);
 
 	if (dbc->string) {
-		dbc_dma_free_coherent(xhci,
-				      dbc->string_size,
-				      dbc->string, dbc->string_dma);
+		dma_free_coherent(dbc->dev, dbc->string_size,
+				  dbc->string, dbc->string_dma);
 		dbc->string = NULL;
 	}
 
-- 
2.17.1

