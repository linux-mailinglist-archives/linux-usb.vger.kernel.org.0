Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90B506D085B
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 16:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232493AbjC3OaF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 10:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232251AbjC3OaD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 10:30:03 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D25351732
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680186601; x=1711722601;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MMDAVcDFo6/QQcdlj3DTrQwtZPY9SuZ1TBG0sLiBIQo=;
  b=Pn+/8EaaiXnaedD6MOPIiu7soJ7Kj/meGbbnzq2LoEWvelFR2E3VB+Cc
   f0o0BCaRY+lkrhS5J8obyWbxjc53PpjwzLie00MoxxAh3gYgRvi7BzOut
   Iv6/qadxkg1aBCdWcN8BVaPuHhIrrGn6nbgT0M+94To8CFGGYzoHkQX+V
   bcK+KuqUmHImbUyUw4y86XKugNOykIIDtOvzDA/ls+tTouPNuF8U2W0i4
   Z/YooLWBIknXG/HBQGd2FtMSOYtjTpdZ+C2EQ4uddY3g0jpOUYyU6jLPp
   dVUIk4puM3fTk08Mgrdi+WuS5f30soZoR4dLWYt+BXhkys/l+/8HVUJU6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="406172553"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406172553"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 07:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="774021093"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="774021093"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Mar 2023 07:29:47 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        D Scott Phillips <scott@os.amperecomputing.com>,
        Marc Zyngier <maz@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/3] xhci: also avoid the XHCI_ZERO_64B_REGS quirk with a passthrough iommu
Date:   Thu, 30 Mar 2023 17:30:54 +0300
Message-Id: <20230330143056.1390020-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330143056.1390020-1-mathias.nyman@linux.intel.com>
References: <20230330143056.1390020-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: D Scott Phillips <scott@os.amperecomputing.com>

Previously the quirk was skipped when no iommu was present. The same
rationale for skipping the quirk also applies in the iommu.passthrough=1
case.

Skip applying the XHCI_ZERO_64B_REGS quirk if the device's iommu domain is
passthrough.

Fixes: 12de0a35c996 ("xhci: Add quirk to zero 64bit registers on Renesas PCIe controllers")
Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6183ce8574b1..bdb6dd819a3b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/pci.h>
+#include <linux/iommu.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/log2.h>
@@ -228,6 +229,7 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
 static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
+	struct iommu_domain *domain;
 	int err, i;
 	u64 val;
 	u32 intrs;
@@ -246,7 +248,9 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 	 * an iommu. Doing anything when there is no iommu is definitely
 	 * unsafe...
 	 */
-	if (!(xhci->quirks & XHCI_ZERO_64B_REGS) || !device_iommu_mapped(dev))
+	domain = iommu_get_domain_for_dev(dev);
+	if (!(xhci->quirks & XHCI_ZERO_64B_REGS) || !domain ||
+	    domain->type == IOMMU_DOMAIN_IDENTITY)
 		return;
 
 	xhci_info(xhci, "Zeroing 64bit base registers, expecting fault\n");
-- 
2.25.1

