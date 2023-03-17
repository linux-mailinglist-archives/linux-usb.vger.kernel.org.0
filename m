Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC026BED37
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjCQPqI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjCQPqG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:06 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CA864AB1
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067964; x=1710603964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UXG+TH4CZOOcBIzCpxeqi6Y6moeoRXRa6RnDdv9mf/A=;
  b=YEO4wAoGMYyCHJUY8QLxu6HGOAjzH5d2yeNMRtBOz2oGooUQ4+3DijUT
   mGOtBHi77LcZ4AiUJEWvguIN15oU2K5NwC9185UOdNrctvubYDNWP7HMa
   0XJfKDzzPXfYUPuueEjYn3RcmxKyQG4Wp7zaHCExhWAxDVn5FSJdBrS9E
   sdSu6pyQifhtEYwK7U6sMO5wfmkuoMsWt1kKDo49V2UpTb25gwoJ5E4kj
   75Nv608lfHEC9uzdy0WiQMJ/sxP/o1QTJvzMZVRZ+En5UtGb7c6yD/NLV
   wIXr8LnX4a6M/UjgxwhLGHv03Xvw7WmR/L119p9yoWN1Rdwu8Wa7o1gWO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309746"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309746"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630311990"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630311990"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:02 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/14] xhci: mem: Use dma_poll_zalloc() instead of explicit memset()
Date:   Fri, 17 Mar 2023 17:47:03 +0200
Message-Id: <20230317154715.535523-3-mathias.nyman@linux.intel.com>
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

Use dma_poll_zalloc() instead of explicit memset() call in
xhci_alloc_stream_ctx(). Note, that dma_alloc_coherent() is
always issues zeroed memory chunk.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c385513ad00b..4ffa6495878d 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -575,10 +575,10 @@ static struct xhci_stream_ctx *xhci_alloc_stream_ctx(struct xhci_hcd *xhci,
 		return dma_alloc_coherent(dev, size,
 				dma, mem_flags);
 	else if (size <= SMALL_STREAM_ARRAY_SIZE)
-		return dma_pool_alloc(xhci->small_streams_pool,
+		return dma_pool_zalloc(xhci->small_streams_pool,
 				mem_flags, dma);
 	else
-		return dma_pool_alloc(xhci->medium_streams_pool,
+		return dma_pool_zalloc(xhci->medium_streams_pool,
 				mem_flags, dma);
 }
 
@@ -643,8 +643,6 @@ struct xhci_stream_info *xhci_alloc_stream_info(struct xhci_hcd *xhci,
 			mem_flags);
 	if (!stream_info->stream_ctx_array)
 		goto cleanup_ring_array;
-	memset(stream_info->stream_ctx_array, 0,
-			sizeof(struct xhci_stream_ctx)*num_stream_ctxs);
 
 	/* Allocate everything needed to free the stream rings later */
 	stream_info->free_streams_command =
-- 
2.25.1

