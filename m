Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB364CBC2E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 12:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbiCCLI2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 06:08:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbiCCLI2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 06:08:28 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A23D1AF1A
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 03:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646305660; x=1677841660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jJCu2kTAbizusS27kv0h56CpQN3omVI3FloLm80zRek=;
  b=S55tGkkQUe6dUv9LJE6xZRujvE/KO1wLu8rUMtB2+rYlD81SJOf1DGq9
   zXNG10KAMHaBAQzC3y0UMkbye2IgndGjpWrMxJ5c+CaW33IVrC+jLu2z4
   nDH0RXIHEfU6jx0zr6sIshUwJ1Jh2e1gb06CNKMIx04Ea5XifCJkMCefy
   GJYADyRki61H044r0qTLsiurNojFfhZkl1FpvKckkAI7ym5ADHvNKlBiP
   otisQOddchhj2IacGzc88WW7gLIWmOpU4vf4MfWXGFCsOjq78xT/vtLsm
   3d8ToatdOl+3R/UipFxi89sHWRy6I690N1Ougcqs0iv1WR4pG+coBWZ6O
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="251219894"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="251219894"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 03:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="576452387"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 03 Mar 2022 03:07:37 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 5/9] usb: host: xhci: use ffs() in xhci_mem_init()
Date:   Thu,  3 Mar 2022 13:08:59 +0200
Message-Id: <20220303110903.1662404-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303110903.1662404-1-mathias.nyman@linux.intel.com>
References: <20220303110903.1662404-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Linyu Yuan <quic_linyyuan@quicinc.com>

The for loop to find page size bit can be replaced with ffs().

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 48114a462908..938eb2b907ab 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2391,11 +2391,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	page_size = readl(&xhci->op_regs->page_size);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Supported page size register = 0x%x", page_size);
-	for (i = 0; i < 16; i++) {
-		if ((0x1 & page_size) != 0)
-			break;
-		page_size = page_size >> 1;
-	}
+	i = ffs(page_size);
 	if (i < 16)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Supported page size of %iK", (1 << (i+12)) / 1024);
-- 
2.25.1

