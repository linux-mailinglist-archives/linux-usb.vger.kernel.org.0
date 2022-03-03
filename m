Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60694CBB4B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 11:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbiCCK0V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 05:26:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbiCCK0T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 05:26:19 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A31179A20
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 02:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646303134; x=1677839134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qjgwhxrUkCs2Av9ADpFnLBwAeCuSk5H7PEXy1mrTLDI=;
  b=ZUk1eUlMFMGKSxVYg3TlE8wi39j2AdMoHXhvQVTsQ8dIxNBRi/xdzwm9
   T5Hz0mwLMfEAhlWLhWKxgdVJ/KPU83m3ureDrjay4PVy+ethu51s/eKVY
   QiA92gT977n/mrIQgWOp50uGc2xLrMSsvi+b+uxeZkyf4v2WdeLpVO0ED
   twQ6LimRiYFkN9N7dNz0s0JztIpRI3416IPoL48yWQ4fDxjL1rt1SQAn1
   1AOgkZHBNfCIKOdO6NP3dMcXN7KyBCro+IXRdZ6FIm5IyMMZWDmNJZk6M
   Q58S/mfK/7U7DBr+FrBEq7WRlzEQOIgH36jRlNsikIggiXUp2TN3059ne
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253567149"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="253567149"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:25:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="535773335"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2022 02:25:32 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 6/9] usb: host: xhci: fix a comment typo in xhci_mem_init()
Date:   Thu,  3 Mar 2022 12:26:53 +0200
Message-Id: <20220303102656.1661407-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303102656.1661407-1-mathias.nyman@linux.intel.com>
References: <20220303102656.1661407-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Linyu Yuan <quic_linyyuan@quicinc.com>

It should be Device Context, not doorbell.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 938eb2b907ab..bbb27ee2c6a3 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2417,7 +2417,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	writel(val, &xhci->op_regs->config_reg);
 
 	/*
-	 * xHCI section 5.4.6 - doorbell array must be
+	 * xHCI section 5.4.6 - Device Context array must be
 	 * "physically contiguous and 64-byte (cache line) aligned".
 	 */
 	xhci->dcbaa = dma_alloc_coherent(dev, sizeof(*xhci->dcbaa), &dma,
-- 
2.25.1

