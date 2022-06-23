Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F40F3557892
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 13:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbiFWLS1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 07:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbiFWLSZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 07:18:25 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E1F1AD8E
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655983104; x=1687519104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BWEHcB1IUCv1Za21i193V07oeASw8SWjmrA8N62qFtY=;
  b=LbZTQ+/z97VOvR96Yei2B9xh3LWDQTqMCmr3uSnU01XhrE2P7qic90G7
   UJhTTJS4TTXRz6iM7AeKubYoY8J51kC9iLjJF+zFctjkahpXQCPG6LJJ1
   5qpShBcehzGqy5ZfxsNg1uYWk2eOI/5rYC3zi1vSzVYvBcBxsxzq4yuRV
   YpO2cWl2THkrPIVFdDA6b3TX3yTLMplLJZurdJ6Rmq7zieyP5GdsUzMNe
   QcDSTwpm0VH8eidU1Qv7ZCy/QurU1HUJn+pZd5hApiujcYeGszuSqCZPR
   zBgrjhSAPUhsrK7O7abHKCadP9/BDo1f2AMjh6boKjMlfHCPfNACv67+z
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="367010658"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="367010658"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 04:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="915148749"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jun 2022 04:18:22 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Tanveer Alam <tanveer1.alam@intel.com>, stable@kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/4] xhci-pci: Allow host runtime PM as default for Intel Raptor Lake xHCI
Date:   Thu, 23 Jun 2022 14:19:44 +0300
Message-Id: <20220623111945.1557702-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623111945.1557702-1-mathias.nyman@linux.intel.com>
References: <20220623111945.1557702-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tanveer Alam <tanveer1.alam@intel.com>

In the same way as Intel Alder Lake TCSS (Type-C Subsystem) the Raptor
Lake TCSS xHCI needs to be runtime suspended whenever possible to
allow the TCSS hardware block to enter D3cold and thus save energy.

Cc: stable@kernel.org
Signed-off-by: Tanveer Alam <tanveer1.alam@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index fac9492a8bda..d66ea276ccec 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -61,6 +61,7 @@
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_XHCI		0x461e
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_N_XHCI		0x464e
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI	0x51ed
+#define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_XHCI		0xa71e
 
 #define PCI_DEVICE_ID_AMD_RENOIR_XHCI			0x1639
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
@@ -269,7 +270,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	     pdev->device == PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_N_XHCI ||
-	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI))
+	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI ||
+	     pdev->device == PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_XHCI))
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if (pdev->vendor == PCI_VENDOR_ID_ETRON &&
-- 
2.25.1

