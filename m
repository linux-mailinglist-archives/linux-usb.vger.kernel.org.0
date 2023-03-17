Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79A86BED36
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbjCQPqH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjCQPqF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:05 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC20A2C2E
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067962; x=1710603962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=14Etewq/BpkNjjyzFwvd6BpiLLMLtLbyktYv6HVVuuE=;
  b=mvpMS2yzDNcTEQ7f1sfELhv8dVBI/aFbTQ95w/KSyd1FROa0bLUGtHlL
   MiawlgXc0mGdbg/ycfZlUuSGNr9iZfLu1UqBlowmJRze6sXYmCkr9mzCB
   +fIeJjLPkiP0tEC/gY0uoUxMks+R61ayz+d93Z7i4rM8Ccx1jU3U3ttMv
   RRbkoIUEHNaAKPL3z/IgnI0ERuMTXGKRIU19mDxP2KtRtiIaK6NrN7dgf
   ctLa0AsCzl1ltmae4l9hkTMBMdR49WWVl8iA9DF2igNk8Og1jgmrZ4nNU
   R3eIDbZBQ1kP8x0phjequQdG9WyKwz/IrdHLYGM/zyAvfsyXZ5YqFUJpU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309732"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309732"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630311983"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630311983"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:00 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/14] xhci: mem: Carefully calculate size for memory allocations
Date:   Fri, 17 Mar 2023 17:47:02 +0200
Message-Id: <20230317154715.535523-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230317154715.535523-1-mathias.nyman@linux.intel.com>
References: <20230317154715.535523-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Carefully calculate size for memory allocations, i.e. with help
of size_mul() macro from overflow.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d0a9467aa5fc..c385513ad00b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/usb.h>
+#include <linux/overflow.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/dmapool.h>
@@ -568,7 +569,7 @@ static struct xhci_stream_ctx *xhci_alloc_stream_ctx(struct xhci_hcd *xhci,
 		gfp_t mem_flags)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
-	size_t size = sizeof(struct xhci_stream_ctx) * num_stream_ctxs;
+	size_t size = size_mul(sizeof(struct xhci_stream_ctx), num_stream_ctxs);
 
 	if (size > MEDIUM_STREAM_ARRAY_SIZE)
 		return dma_alloc_coherent(dev, size,
@@ -1660,7 +1661,7 @@ static int scratchpad_alloc(struct xhci_hcd *xhci, gfp_t flags)
 		goto fail_sp;
 
 	xhci->scratchpad->sp_array = dma_alloc_coherent(dev,
-				     num_sp * sizeof(u64),
+				     size_mul(sizeof(u64), num_sp),
 				     &xhci->scratchpad->sp_dma, flags);
 	if (!xhci->scratchpad->sp_array)
 		goto fail_sp2;
@@ -1799,7 +1800,7 @@ int xhci_alloc_erst(struct xhci_hcd *xhci,
 	struct xhci_segment *seg;
 	struct xhci_erst_entry *entry;
 
-	size = sizeof(struct xhci_erst_entry) * evt_ring->num_segs;
+	size = size_mul(sizeof(struct xhci_erst_entry), evt_ring->num_segs);
 	erst->entries = dma_alloc_coherent(xhci_to_hcd(xhci)->self.sysdev,
 					   size, &erst->erst_dma_addr, flags);
 	if (!erst->entries)
@@ -1830,7 +1831,7 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	if (!ir)
 		return;
 
-	erst_size = sizeof(struct xhci_erst_entry) * (ir->erst.num_entries);
+	erst_size = sizeof(struct xhci_erst_entry) * ir->erst.num_entries;
 	if (ir->erst.entries)
 		dma_free_coherent(dev, erst_size,
 				  ir->erst.entries,
-- 
2.25.1

