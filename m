Return-Path: <linux-usb+bounces-1911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E417CF54A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6857A1C20E6A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FDA18C29;
	Thu, 19 Oct 2023 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMaaA07E"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03611EB27
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CBBFA
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711311; x=1729247311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2+P3tJLM/NAAvLZp3XpfjqMhA4CWAP6OzJDnqBCWwyA=;
  b=hMaaA07EUCP5irnp0NfV7M19uGg/jv+Ea2tGxxZ3Y2thPhKVNKBdpT7Z
   Mwa/e+1Yjw+lDSl36OlyGZ80mTB1UUsibBLIoeQ8ofR/1ueJHsq9Wi7z9
   gCCOMAUzWGdMSbp46spmTqVdUYdrBJ4TIuV56Uz51HpVY5D+JJR85X4q/
   HYU/Xc7UWrP8BzFq52FfDocfwlNVMlvBYoKblb1UsfjaE5qT636Svdulj
   HWr51Lx8+T9+BX/Kymw8dSe20Nu4kfotFL2uorcKJcUiePmCfDuzAiX1v
   3UDFY0w5X/arnRBh8s2V/NB62G1PliMnKs0TY1kuIHDOHqAIUZvcpFRZo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075951"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075951"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557867"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557867"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:28 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 16/19] xhci: split free interrupter into separate remove and free parts
Date: Thu, 19 Oct 2023 13:29:21 +0300
Message-Id: <20231019102924.2797346-17-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current function that both removes and frees an interrupter isn't
optimal when using several interrupters. The array of interrupters need
to be protected with a lock while removing interrupters, but the default
xhci spin lock can't be used while freeing the interrupters event ring
segment table as dma_free_coherent() should be called with IRQs enabled.

There is no need to free the interrupter under the lock, so split this
code into separate unlocked free part, and a lock protected remove part.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 4d0b1c0e61a8..62116586848b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1807,22 +1807,13 @@ static int xhci_alloc_erst(struct xhci_hcd *xhci,
 }
 
 static void
-xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
+xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
-	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
-	size_t erst_size;
 	u32 tmp;
 
 	if (!ir)
 		return;
 
-	erst_size = sizeof(struct xhci_erst_entry) * ir->erst.num_entries;
-	if (ir->erst.entries)
-		dma_free_coherent(dev, erst_size,
-				  ir->erst.entries,
-				  ir->erst.erst_dma_addr);
-	ir->erst.entries = NULL;
-
 	/*
 	 * Clean out interrupter registers except ERSTBA. Clearing either the
 	 * low or high 32 bits of ERSTBA immediately causes the controller to
@@ -1835,10 +1826,28 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 
 		xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
 	}
+}
+
+static void
+xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
+{
+	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
+	size_t erst_size;
+
+	if (!ir)
+		return;
+
+	erst_size = sizeof(struct xhci_erst_entry) * ir->erst.num_entries;
+	if (ir->erst.entries)
+		dma_free_coherent(dev, erst_size,
+				  ir->erst.entries,
+				  ir->erst.erst_dma_addr);
+	ir->erst.entries = NULL;
 
-	/* free interrrupter event ring */
+	/* free interrupter event ring */
 	if (ir->event_ring)
 		xhci_ring_free(xhci, ir->event_ring);
+
 	ir->event_ring = NULL;
 
 	kfree(ir);
@@ -1851,6 +1860,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 
 	cancel_delayed_work_sync(&xhci->cmd_timer);
 
+	xhci_remove_interrupter(xhci, xhci->interrupter);
 	xhci_free_interrupter(xhci, xhci->interrupter);
 	xhci->interrupter = NULL;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed primary event ring");
-- 
2.25.1


