Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7B34CBB4E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 11:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbiCCK00 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 05:26:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbiCCK0Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 05:26:25 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860D8179A12
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646303139; x=1677839139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fz/1LWz1fZQyoqkzlm5wht0AXSQuG+ooIXmsbArEh/w=;
  b=JuNdLdszRXbVbD8l11AifaNfRheC0ChyQ2u/BpQDWZvSS8SOPE+U51ZB
   k1SV+0jXWI10zRobSXhXl4zskizRNwG+OreqVw7FCS95k/cQjKwv+Wlq3
   ZsrMHH5qKdSybUSQNpYgI9Xb9v/DSK72C4Hw1G5TxGkgOp1bKRjlaDQQn
   Qb5hRl7YUAwEduhq++VK58AFnHKjVtw61nVizXusl5cIT4PvPKJAAF8y3
   DebJkwahPD1I/HnTZtjGItCewJqxzpQqwfeuFDXwjvReZzKdJgtMYsYxn
   e6TS2ERNjkaMyNcUN6pBCy8rZK4p1rz61sQat6iz1CjG2LMBZ+HCl4Nll
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253567162"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="253567162"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="535773374"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2022 02:25:37 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 9/9] usb: host: xhci: Remove some unnecessary return value initializations
Date:   Thu,  3 Mar 2022 12:26:56 +0200
Message-Id: <20220303102656.1661407-10-mathias.nyman@linux.intel.com>
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

The ret/retval will be set when it used, no need to init at definition.

[modified subject line -Mathias]
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 1aa10db23fbb..642610c78f58 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -325,7 +325,7 @@ static int xhci_setup_msi(struct xhci_hcd *xhci)
  */
 static int xhci_setup_msix(struct xhci_hcd *xhci)
 {
-	int i, ret = 0;
+	int i, ret;
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 
@@ -579,7 +579,7 @@ static int xhci_all_ports_seen_u0(struct xhci_hcd *xhci)
 static int xhci_init(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	int retval = 0;
+	int retval;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xhci_init");
 	spin_lock_init(&xhci->lock);
@@ -3975,7 +3975,7 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id)
 	struct xhci_command *command;
 	unsigned long flags;
 	u32 state;
-	int ret = 0;
+	int ret;
 
 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
@@ -4011,7 +4011,7 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id)
 
 	xhci_free_command(xhci, command);
 
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.25.1

