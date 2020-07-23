Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0E222B19F
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgGWOmh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:37 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:37 -0400
IronPort-SDR: dZaeSS2pSPYt2MfBhvgomJtrsfQTDWKjJ+OO4K7qdpZ7yJPt9Imgs1TOWltigwt7rmZUeSCxVe
 BDK4fCNcqJ6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607413"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607413"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:36 -0700
IronPort-SDR: yIJIAVkCZq6dwGAzgn26XEjaR2a/TA8Sq0P1+X80Rcj2hB+3px0Vmfu4bCMFqHxEO+xKkyj10y
 eDGdrR0eR2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672397"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:35 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/27] xhci: dbc: Don't use xhci_write_64() as it takes xhci as a parameter
Date:   Thu, 23 Jul 2020 17:45:12 +0300
Message-Id: <20200723144530.9992-10-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xhci_write_64() is essentially a wrapper for lo_hi_writeq(), but it
requires struct xhci_hcd * as a parameter.
Use lo_hi_writeq() directly instead

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 3375be7ea642..3541fbbfc28b 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -101,7 +101,7 @@ static void xhci_dbc_init_contexts(struct xhci_hcd *xhci, u32 string_length)
 	ep_ctx->deq		= cpu_to_le64(deq | dbc->ring_in->cycle_state);
 
 	/* Set DbC context and info registers: */
-	xhci_write_64(xhci, dbc->ctx->dma, &dbc->regs->dccp);
+	lo_hi_writeq(dbc->ctx->dma, &dbc->regs->dccp);
 
 	dev_info = cpu_to_le32((DBC_VENDOR_ID << 16) | DBC_PROTOCOL);
 	writel(dev_info, &dbc->regs->devinfo1);
@@ -413,10 +413,11 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	/* Setup ERST register: */
 	writel(dbc->erst.erst_size, &dbc->regs->ersts);
-	xhci_write_64(xhci, dbc->erst.erst_dma_addr, &dbc->regs->erstba);
+
+	lo_hi_writeq(dbc->erst.erst_dma_addr, &dbc->regs->erstba);
 	deq = xhci_trb_virt_to_dma(dbc->ring_evt->deq_seg,
 				   dbc->ring_evt->dequeue);
-	xhci_write_64(xhci, deq, &dbc->regs->erdp);
+	lo_hi_writeq(deq, &dbc->regs->erdp);
 
 	/* Setup strings and contexts: */
 	string_length = xhci_dbc_populate_strings(dbc->string);
@@ -788,7 +789,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 	if (update_erdp) {
 		deq = xhci_trb_virt_to_dma(dbc->ring_evt->deq_seg,
 					   dbc->ring_evt->dequeue);
-		xhci_write_64(xhci, deq, &dbc->regs->erdp);
+		lo_hi_writeq(deq, &dbc->regs->erdp);
 	}
 
 	return EVT_DONE;
-- 
2.17.1

