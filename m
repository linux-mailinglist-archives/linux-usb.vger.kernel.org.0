Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED65D6BED38
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjCQPqK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjCQPqJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:09 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7335983F
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067966; x=1710603966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bt9zUtURnxMZaacvJuIAVbbKuRznX23LQg8BeJB6iGs=;
  b=URLNiqxj3D8tziYObxJVvngS+8pLJSD/4HkkhzhKWoSEdVrmtSQzwWuv
   0M5ZyCBkytNFzSpcmHe3Msm6ofFSoQ6h/Tsng+7zJ3XwOVICzn7rtc74/
   iD2SHneldt+7XcpMlXa1mp306e7W9Huux0MSIWwLx7gQyWpCHgEBsPoYO
   +vcY/Q7M+vGQDoyYv3DwIJRbr8Gla8VF8mUbntbk4K1FHFvClBYzNMbCY
   R3ixGZ0NVVyKSadpfzZfq6smr4uh7GW2gpIwyaanfo150ZVfRZ3L+j39Q
   r1vSiJ3m3muPEZGG95gqf6nYntIf50ftjecJr6pV6QxoheFlDGClsVku7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309760"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309760"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630311995"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630311995"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:03 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/14] xhci: mem: Get rid of redundant 'else'
Date:   Fri, 17 Mar 2023 17:47:04 +0200
Message-Id: <20230317154715.535523-4-mathias.nyman@linux.intel.com>
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

In the snippets like the following

	if (...)
		return / goto / break / continue ...;
	else
		...

the 'else' is redundant. Get rid of it.

While at it, make if-chain sorted from testing bigger values to smaller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 4ffa6495878d..357883256a5a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -572,14 +572,11 @@ static struct xhci_stream_ctx *xhci_alloc_stream_ctx(struct xhci_hcd *xhci,
 	size_t size = size_mul(sizeof(struct xhci_stream_ctx), num_stream_ctxs);
 
 	if (size > MEDIUM_STREAM_ARRAY_SIZE)
-		return dma_alloc_coherent(dev, size,
-				dma, mem_flags);
-	else if (size <= SMALL_STREAM_ARRAY_SIZE)
-		return dma_pool_zalloc(xhci->small_streams_pool,
-				mem_flags, dma);
+		return dma_alloc_coherent(dev, size, dma, mem_flags);
+	if (size > SMALL_STREAM_ARRAY_SIZE)
+		return dma_pool_zalloc(xhci->medium_streams_pool, mem_flags, dma);
 	else
-		return dma_pool_zalloc(xhci->medium_streams_pool,
-				mem_flags, dma);
+		return dma_pool_zalloc(xhci->small_streams_pool, mem_flags, dma);
 }
 
 struct xhci_ring *xhci_dma_to_transfer_ring(
@@ -1399,8 +1396,9 @@ static u32 xhci_get_max_esit_payload(struct usb_device *udev,
 	if ((udev->speed >= USB_SPEED_SUPER_PLUS) &&
 	    USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
 		return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
+
 	/* SuperSpeed or SuperSpeedPlus Isoc ep with less than 48k per esit */
-	else if (udev->speed >= USB_SPEED_SUPER)
+	if (udev->speed >= USB_SPEED_SUPER)
 		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
 
 	max_packet = usb_endpoint_maxp(&ep->desc);
-- 
2.25.1

