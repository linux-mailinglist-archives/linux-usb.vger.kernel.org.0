Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA086BED39
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbjCQPqL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjCQPqJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:09 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AADDB1A49
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067967; x=1710603967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C64zO4O4Cxa4Rtn95PFvtiew17GyEeTmAL3iUgjdU9E=;
  b=V9+ptPvrpxY3/2vUewqLvblUcC5Z0qFNK2n78CQkve2sA1cy6fYCORua
   Yvi3T/qzAPRap21MUPIXmVLeDG5GgSHASt9OqXZqvM0CfYTKYiw7EvOvl
   4I6rsvhtWbE9gUImrWdzgF2+mNfYCh0XuQLPv+2AzTIK0R0AGHMgAEPP9
   7XljmAouKTBQlEjm4S28RPqptjIvHDsOxeSz6tCqtsCeuzHabYbIOKDa0
   Mbi8ahzV2pXP8pYFZZKOo35o8R2U6aRQHmbwv58GxfqiDS2D/Adg9g2on
   RPXfqC+LrUIMrCq5SvWai16ac+0qyBd3id6g3oF0qprsAdyy+pLXqDhZ1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309768"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309768"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630311997"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630311997"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:05 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/14] xhci: mem: Drop useless return:s
Date:   Fri, 17 Mar 2023 17:47:05 +0200
Message-Id: <20230317154715.535523-5-mathias.nyman@linux.intel.com>
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

When function returns void and we have if-else-if chain, there is
no need to explicitly call return. Drop them and indent lines better.

While at it, make if-chain sorted from testing bigger values to smaller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 357883256a5a..fa0c4ac2ca7f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -544,14 +544,11 @@ static void xhci_free_stream_ctx(struct xhci_hcd *xhci,
 	size_t size = sizeof(struct xhci_stream_ctx) * num_stream_ctxs;
 
 	if (size > MEDIUM_STREAM_ARRAY_SIZE)
-		dma_free_coherent(dev, size,
-				stream_ctx, dma);
-	else if (size <= SMALL_STREAM_ARRAY_SIZE)
-		return dma_pool_free(xhci->small_streams_pool,
-				stream_ctx, dma);
+		dma_free_coherent(dev, size, stream_ctx, dma);
+	else if (size > SMALL_STREAM_ARRAY_SIZE)
+		dma_pool_free(xhci->medium_streams_pool, stream_ctx, dma);
 	else
-		return dma_pool_free(xhci->medium_streams_pool,
-				stream_ctx, dma);
+		dma_pool_free(xhci->small_streams_pool, stream_ctx, dma);
 }
 
 /*
-- 
2.25.1

