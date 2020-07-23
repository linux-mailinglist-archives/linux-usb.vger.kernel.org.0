Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A3622B19B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbgGWOmc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:32 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:32 -0400
IronPort-SDR: vghImXARG0pkl4t4PBTkK5F9r1WvVLRo9BX3UUYA8y2EX3Xg45r/pehrdQ68vsquKiM1sLiX0l
 fYSCqCLYLpug==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607382"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607382"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:31 -0700
IronPort-SDR: Yc3PyV1YxYGnqb3ZtII4rMEQSRoJ5aHNsdCKYt8nMdL9r1sEbwxR/3pMjjzEAAnVSgbTsD0J2L
 +Ets1ZYgL3kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672371"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:29 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/27] xhci: dbc: Remove dbc_dma_alloc_coherent() wrapper
Date:   Thu, 23 Jul 2020 17:45:08 +0300
Message-Id: <20200723144530.9992-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dbc_dma_alloc_coherent() takes struct xhci_hcd pointer as an parameter, but
does nothing more than calls dma_alloc_coherent().
Remove it and call dma_alloc_coherent() directly instead.

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 138b0c994ad2..e8a2cbda135c 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -14,17 +14,6 @@
 #include "xhci-trace.h"
 #include "xhci-dbgcap.h"
 
-static inline void *
-dbc_dma_alloc_coherent(struct xhci_hcd *xhci, size_t size,
-		       dma_addr_t *dma_handle, gfp_t flags)
-{
-	void		*vaddr;
-
-	vaddr = dma_alloc_coherent(xhci_to_hcd(xhci)->self.sysdev,
-				   size, dma_handle, flags);
-	return vaddr;
-}
-
 static inline void
 dbc_dma_free_coherent(struct xhci_hcd *xhci, size_t size,
 		      void *cpu_addr, dma_addr_t dma_handle)
@@ -426,10 +415,8 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	/* Allocate the string table: */
 	dbc->string_size = sizeof(struct dbc_str_descs);
-	dbc->string = dbc_dma_alloc_coherent(xhci,
-					     dbc->string_size,
-					     &dbc->string_dma,
-					     flags);
+	dbc->string = dma_alloc_coherent(dev, dbc->string_size,
+					 &dbc->string_dma, flags);
 	if (!dbc->string)
 		goto string_fail;
 
-- 
2.17.1

