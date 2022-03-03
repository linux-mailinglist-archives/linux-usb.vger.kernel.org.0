Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 628604CBB4A
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 11:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbiCCK0S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 05:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbiCCK0R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 05:26:17 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF60B179A11
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 02:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646303132; x=1677839132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jJCu2kTAbizusS27kv0h56CpQN3omVI3FloLm80zRek=;
  b=e78m7341Sa0dNqkCSu0I1fOZudVD1QuNdUDSK/zJvtt5ApKUBfQi3CGY
   lCfIa2FGPu4laS3X8OO/njMq95vBCQCjU7i6QQzPsD63SznDsYViXhro4
   FK1YAPdL3p0vkbyvPht7LKW68jv3QlYetS5KBGi8NI5vITQEGWShc8lfr
   RRzK924ukBG35mf9jEaW9fEB6VZjUebo9OzERcb3sQER9jUhN/q5tX95a
   lGECA+lI2g9JumrgAp0Tq6kosE3hiBFjxhkrbvYPJxTb6TD6TCT88wFJ5
   6pavmDiI4uB6dCZGG5MC3Dv9AOXsiGSe3ZFRQ4yrkMSVNVCSHtGyiO5b2
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253567143"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="253567143"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="535773328"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2022 02:25:30 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/9] usb: host: xhci: use ffs() in xhci_mem_init()
Date:   Thu,  3 Mar 2022 12:26:52 +0200
Message-Id: <20220303102656.1661407-6-mathias.nyman@linux.intel.com>
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

