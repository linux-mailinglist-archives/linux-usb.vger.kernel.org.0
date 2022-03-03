Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09E84CBB4C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 11:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbiCCK0W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 05:26:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbiCCK0U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 05:26:20 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00720179A12
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 02:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646303135; x=1677839135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eascq1DeoR3EyUxnIuH7kjEiV86srJGQixov3nOLtQA=;
  b=M86BG/0mL92EHml+TE58YshDmhiHUjjQAaCTd/Xv3iS9Qn2TutLnsX0/
   7qMGlnnZB8IdxPGZwTKpkW2o+qcfjlnITXLVQhsZwPLPzDb+1Oidlx8u+
   Eu6Aawhd5le7Wy5iUV0+Jzs286lO+CMqqS+omv3erJhZb1m4swVpVg+LG
   RwVs31NpBP0C+qZuT5OpQPC+DqkevA6QswmARb49oeMByFYcX4uxYjtXh
   vRRKOTmUgITZ6mLzxKWWJnnC4B3g0yiYky2K9OiEazKxVndP3TSw0iU6s
   k6XF/3VMQxwxgodiACAzPyMQ5QUQlohNZ7tJhltpkuK3GVJm8OvEnYu0o
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253567150"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="253567150"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="535773341"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2022 02:25:34 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 7/9] usb: host: xhci: update hci_version operation in xhci_gen_setup()
Date:   Thu,  3 Mar 2022 12:26:54 +0200
Message-Id: <20220303102656.1661407-8-mathias.nyman@linux.intel.com>
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

There is no need to store temperary value in hcc_params.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6b32f7e65d4c..e17eef88e5d7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5279,8 +5279,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	xhci->hcs_params1 = readl(&xhci->cap_regs->hcs_params1);
 	xhci->hcs_params2 = readl(&xhci->cap_regs->hcs_params2);
 	xhci->hcs_params3 = readl(&xhci->cap_regs->hcs_params3);
-	xhci->hcc_params = readl(&xhci->cap_regs->hc_capbase);
-	xhci->hci_version = HC_VERSION(xhci->hcc_params);
+	xhci->hci_version = HC_VERSION(readl(&xhci->cap_regs->hc_capbase));
 	xhci->hcc_params = readl(&xhci->cap_regs->hcc_params);
 	if (xhci->hci_version > 0x100)
 		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
-- 
2.25.1

