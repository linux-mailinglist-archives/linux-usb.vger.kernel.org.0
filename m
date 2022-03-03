Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9954CBC2C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 12:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbiCCLI3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 06:08:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbiCCLI2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 06:08:28 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28EF54FA3
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 03:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646305662; x=1677841662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eascq1DeoR3EyUxnIuH7kjEiV86srJGQixov3nOLtQA=;
  b=II/QPshN2HePtb0XNlsMLU2CZBQgbo73jM6Dk65pPNZhx4YsRi0h4Adz
   HhiWsPRbGQxrobRrf8U4EjSKDvOfiymnEMkZu7IJnqS2L9EP6M0GuTc1Z
   jr2D1BSgoiU/2dDce3MdPif0mR54rd0rJ6Y4RsjgMjiZwWVGxzolLHlGv
   uovd5GtuWNs5vOyNgnYdN1ZxA8SzXUeF5kGEZ8/FHdkesB6nFIGGub9og
   yzZcgVRKPFv32c1PjgIqH1+ITisMMWE4ttTyn8ynv5qQcztr5gfNtRMpR
   eCJR3ILV6CbziWxMtjoOTJpgIoeGA/WR4un1Y5fP1Aus9nguBOhC9aKIs
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="251219913"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="251219913"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 03:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="576452403"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 03 Mar 2022 03:07:40 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 7/9] usb: host: xhci: update hci_version operation in xhci_gen_setup()
Date:   Thu,  3 Mar 2022 13:09:01 +0200
Message-Id: <20220303110903.1662404-8-mathias.nyman@linux.intel.com>
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

