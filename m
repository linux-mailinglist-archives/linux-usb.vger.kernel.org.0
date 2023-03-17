Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17AE56BED3A
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjCQPqM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbjCQPqK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:10 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3B6B5B73
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067969; x=1710603969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=URQ4fpvdjpjiGpGRYEMz/o4Gnh8WHuBbpMuxG1Wz2t4=;
  b=iPNrmoYNMSsHcTWpzveTM3zHRqmYb96l6jbRkfLEZLPFPQw13w9uk859
   KfM3s/SOgYfvI4LhcwjTP7t/4CUBsT0eis6SYmDwHN91rB0uS3IX1uFlt
   mO+n9zbOvX+XAzWdKEKhHDz3gcntwGq5/wrT+elvzENTmiPReankXu/NM
   bPjKsLzADFvoDcoRGptLAdl5MXwm05l4OwVwRXZo8jrChdZ8HgCRCpkQu
   yKYZBZRhIPYWan93W8E69NIV6ZqFcgjSQSVCfCikmkFY+vYiSEp3RCP8S
   OoZmrOmIBHWrJUN7qEKxpDapduqJH+5PKq0K30FCUje5Z958aMYJGU2HQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309783"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309783"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630312000"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630312000"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:07 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/14] xhci: mem: Use while (i--) pattern to clean up
Date:   Fri, 17 Mar 2023 17:47:06 +0200
Message-Id: <20230317154715.535523-6-mathias.nyman@linux.intel.com>
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

Use more natural while (i--) patter to clean up allocated resources.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index fa0c4ac2ca7f..b8c1465f8d23 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1679,11 +1679,10 @@ static int scratchpad_alloc(struct xhci_hcd *xhci, gfp_t flags)
 	return 0;
 
  fail_sp4:
-	for (i = i - 1; i >= 0; i--) {
+	while (i--)
 		dma_free_coherent(dev, xhci->page_size,
 				    xhci->scratchpad->sp_buffers[i],
 				    xhci->scratchpad->sp_array[i]);
-	}
 
 	kfree(xhci->scratchpad->sp_buffers);
 
-- 
2.25.1

