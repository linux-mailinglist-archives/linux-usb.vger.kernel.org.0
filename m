Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90CAE6BED3B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjCQPqN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbjCQPqM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:12 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595C4B1B04
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067971; x=1710603971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y8PgoJqo9tO+JiVTXozF53kIaa0DGgOnWqjLHThS124=;
  b=e++9Hu5tt5+DFvrx0A7zgl1XFLC27kYF4IUAGZ+lynD+1G1pCVzyBTmi
   IGDd0ThIxM7CIoiab1Ui+wQP/0arrjvH85w/UUlsLyEehbWVvK1huH2Ci
   y/vUyHw3MkvoV1w0yh6Tdc3A1jT8/1mGM0uu9IjYeC4w2tJ1mrioJl9g/
   amMQBb63t+/HPUyRnUzo1rbC1W0LYi3auxPDzAb/GgsxayzO48FtEgMdB
   OH5dYVBhMrHhnoXjf5g57IGk9nP3Flr7ZVvNmqwwTXlhi3oNh72RNjuYn
   A1klSOVO7DDLXyKS+AJHqmisWnhvO3EQsbGhVjn9jOd7JKQJl3D/z3RYC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309790"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309790"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630312001"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630312001"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:09 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/14] xhci: mem: Replace explicit castings with appropriate specifiers
Date:   Fri, 17 Mar 2023 17:47:07 +0200
Message-Id: <20230317154715.535523-7-mathias.nyman@linux.intel.com>
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

There is no need to have explicit castings when we have specific pointer
extensions. Replace the explicit castings with appropriate specifiers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index b8c1465f8d23..67ac02d177b5 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -666,8 +666,7 @@ struct xhci_stream_info *xhci_alloc_stream_info(struct xhci_hcd *xhci,
 			cur_ring->cycle_state;
 		stream_info->stream_ctx_array[cur_stream].stream_ring =
 			cpu_to_le64(addr);
-		xhci_dbg(xhci, "Setting stream %d ring ptr to 0x%08llx\n",
-				cur_stream, (unsigned long long) addr);
+		xhci_dbg(xhci, "Setting stream %d ring ptr to 0x%08llx\n", cur_stream, addr);
 
 		ret = xhci_update_stream_mapping(cur_ring, mem_flags);
 		if (ret) {
@@ -977,16 +976,14 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	if (!dev->out_ctx)
 		goto fail;
 
-	xhci_dbg(xhci, "Slot %d output ctx = 0x%llx (dma)\n", slot_id,
-			(unsigned long long)dev->out_ctx->dma);
+	xhci_dbg(xhci, "Slot %d output ctx = 0x%pad (dma)\n", slot_id, &dev->out_ctx->dma);
 
 	/* Allocate the (input) device context for address device command */
 	dev->in_ctx = xhci_alloc_container_ctx(xhci, XHCI_CTX_TYPE_INPUT, flags);
 	if (!dev->in_ctx)
 		goto fail;
 
-	xhci_dbg(xhci, "Slot %d input ctx = 0x%llx (dma)\n", slot_id,
-			(unsigned long long)dev->in_ctx->dma);
+	xhci_dbg(xhci, "Slot %d input ctx = 0x%pad (dma)\n", slot_id, &dev->in_ctx->dma);
 
 	/* Initialize the cancellation and bandwidth list for each ep */
 	for (i = 0; i < 31; i++) {
@@ -2351,8 +2348,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		goto fail;
 	xhci->dcbaa->dma = dma;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Device context base array address = 0x%llx (DMA), %p (virt)",
-			(unsigned long long)xhci->dcbaa->dma, xhci->dcbaa);
+			"// Device context base array address = 0x%pad (DMA), %p (virt)",
+			&xhci->dcbaa->dma, xhci->dcbaa);
 	xhci_write_64(xhci, dma, &xhci->op_regs->dcbaa_ptr);
 
 	/*
@@ -2393,8 +2390,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		goto fail;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Allocated command ring at %p", xhci->cmd_ring);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%llx",
-			(unsigned long long)xhci->cmd_ring->first_seg->dma);
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%pad",
+			&xhci->cmd_ring->first_seg->dma);
 
 	/* Set the address in the Command Ring Control register */
 	val_64 = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
-- 
2.25.1

