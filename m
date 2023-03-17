Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51DE26BED43
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbjCQPqm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbjCQPqk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:40 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E83BB5FF7
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067988; x=1710603988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fznN6AVIXmJ3QFcaOBloxyejGmpOJgLON+ZN1Gqz7xY=;
  b=H45xGyUqgejyWYIylC/ZAKflXjf69Wd3+gx8MoVzYsu+BmxLrZ2OIb8T
   /KjYsGIx0bKDz7mX5Hi4hs3A4XJ5iw9/nZ45Jxp6oeLeNt4F7v9jkivV9
   AvThA/vgOeVyNF6IExOjfV/6WPn5WjSxrxHd5Fnq/CvRtQE1ZMnd3C3YY
   K2eJZkM+OPEtKsYFD/d8ir9moykgkihvdH8ok9WTULeye95Vt6m1pnos7
   ujLndQiXxcUx6k7JZO8q7ZdY8F7rvK0iCdOgG0isLkIa4/9DyFKXL47LH
   UsW6Bkfb4/jn2PoqUqOiKlf7dMozv2vvLai29PrM+fFXvfjuoBVD6PrZ9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309910"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309910"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630312030"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630312030"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:23 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/14] xhci: Move xhci MSI sync function to to xhci-pci
Date:   Fri, 17 Mar 2023 17:47:15 +0200
Message-Id: <20230317154715.535523-15-mathias.nyman@linux.intel.com>
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

From: Josue David Hernandez Gutierrez <josue.d.hernandez.gutierrez@intel.com>

Move function to sync MSI from xhci.c to xhci-pci.c to decouple PCI
specific code from generic xhci code.

No functional changes, function is an exact copy

[commit message rewording -Mathias]
Signed-off-by: Josue David Hernandez Gutierrez <josue.d.hernandez.gutierrez@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 14 +++++++++++++-
 drivers/usb/host/xhci.c     | 24 ------------------------
 2 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index ef55cadc8d14..a53ecc8ff8c5 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -88,6 +88,19 @@ static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.update_hub_device = xhci_pci_update_hub_device,
 };
 
+static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
+{
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+
+	if (hcd->msix_enabled) {
+		struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+		int i;
+
+		for (i = 0; i < xhci->msix_count; i++)
+			synchronize_irq(pci_irq_vector(pdev, i));
+	}
+}
+
 /* Free any IRQs and disable MSI-X */
 static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 {
@@ -779,7 +792,6 @@ static void xhci_sparse_control_quirk(struct usb_hcd *hcd)
 	writel(reg, hcd->regs + SPARSE_CNTL_ENABLE);
 }
 
-extern void xhci_msix_sync_irqs(struct xhci_hcd *xhci);
 static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 {
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index c0fb34ccd187..cc9fde8cba78 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -318,30 +318,6 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 	return 0;
 }
 
-#ifdef CONFIG_USB_PCI
-
-void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
-{
-	struct usb_hcd *hcd = xhci_to_hcd(xhci);
-
-	if (hcd->msix_enabled) {
-		struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
-		int i;
-
-		for (i = 0; i < xhci->msix_count; i++)
-			synchronize_irq(pci_irq_vector(pdev, i));
-	}
-}
-EXPORT_SYMBOL_GPL(xhci_msix_sync_irqs);
-
-#else
-
-static inline void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
-{
-}
-
-#endif
-
 static void compliance_mode_recovery(struct timer_list *t)
 {
 	struct xhci_hcd *xhci;
-- 
2.25.1

