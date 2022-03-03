Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327CB4CBC2F
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 12:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbiCCLId (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 06:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbiCCLIb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 06:08:31 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A1F25C6E
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 03:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646305666; x=1677841666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fz/1LWz1fZQyoqkzlm5wht0AXSQuG+ooIXmsbArEh/w=;
  b=jRUsHDzicNkYCkm9VHfc8lRHoCNCwIQKNsiEKLw9AMmU3a18SN1q/KQS
   X+nRcbjUdw1AteVaG5oa/HO8mbXK4KJgddK0Lw8AuWRJHFIwXmoUJAznP
   jwKmRSdpBI6IAZgy5RTnMP2iRucvS52wOXqoxecYDLDnFsS8zbYB5UOl0
   TvR17csBB640ff+s9NGqGImSGJ9looIp0pXG4cg3HWTjfcLvoy6dX3bJJ
   fxTj4Mf+4PpWXUZ3zZle7fkLGEniOoRJSvt5EYLSy/L0Fn+Pod2/uhgLC
   XX+lOnl6/QcooPFvUMo9P9HgcH8e9JQqQFJvgExQS5ioofvcVi9oXDJns
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="251219927"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="251219927"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 03:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="576452426"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 03 Mar 2022 03:07:44 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 9/9] usb: host: xhci: Remove some unnecessary return value initializations
Date:   Thu,  3 Mar 2022 13:09:03 +0200
Message-Id: <20220303110903.1662404-10-mathias.nyman@linux.intel.com>
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

