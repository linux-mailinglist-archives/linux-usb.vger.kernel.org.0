Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868956BED42
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjCQPql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbjCQPqk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:40 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EF5BBB0C
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067988; x=1710603988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pQHYr+tOxhhfXlz0P0X5nsy2dzKIDS2EilxqiphUniM=;
  b=e/Bhs70sMl5MguybEkxFbdYqOEYPEtRKujGzw06nCjZV1yKtfNJ4zAev
   Mw8py2sRjhRF2qCaRUIx450s3omkWTklaijFZ0/vT1qeIE/66IzCeUsXf
   5ga5EwcCtamYRZmAyiSJNBN35WY4yR5PHUf7hAr3zHymEeyY/y4vPvTrv
   XyOuEqzLHMpaZ7gZG/k5j7V3azsCh2BPzoN7R1yr3a4wmFjHWb8zYyJ2r
   ZYp9Wv+3L2d0XkGl6M1j4P5mXaxtuh1vmBMhIxvIzxRcCc9jhKXymAXv6
   G4/lzFuRntQYDm8R+DbttIatJO6MdBhmdsrrJ5OHvxNWgPvdpBMDFtLdd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309902"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309902"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630312027"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630312027"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:22 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/14] xhci: Call MSI sync function from xhci-pci instead of generic xhci code
Date:   Fri, 17 Mar 2023 17:47:14 +0200
Message-Id: <20230317154715.535523-14-mathias.nyman@linux.intel.com>
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

Call function to sync MSI interrupts from pci specific xhci_pci_suspend()
function in xhci-pci.c instead of from generic xhci_suspend()

[commit message rewording -Mathias]
Signed-off-by: Josue David Hernandez Gutierrez <josue.d.hernandez.gutierrez@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 5 +++++
 drivers/usb/host/xhci.c     | 7 ++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 1e84a842e2a9..ef55cadc8d14 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -779,6 +779,7 @@ static void xhci_sparse_control_quirk(struct usb_hcd *hcd)
 	writel(reg, hcd->regs + SPARSE_CNTL_ENABLE);
 }
 
+extern void xhci_msix_sync_irqs(struct xhci_hcd *xhci);
 static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 {
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -802,6 +803,10 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 		xhci_sparse_control_quirk(hcd);
 
 	ret = xhci_suspend(xhci, do_wakeup);
+
+	/* synchronize irq when using MSI-X */
+	xhci_msix_sync_irqs(xhci);
+
 	if (ret && (xhci->quirks & XHCI_SSIC_PORT_UNUSED))
 		xhci_ssic_port_unused_quirk(hcd, false);
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 874dca6dec69..c0fb34ccd187 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -320,7 +320,7 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 
 #ifdef CONFIG_USB_PCI
 
-static void __maybe_unused xhci_msix_sync_irqs(struct xhci_hcd *xhci)
+void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 
@@ -332,6 +332,7 @@ static void __maybe_unused xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 			synchronize_irq(pci_irq_vector(pdev, i));
 	}
 }
+EXPORT_SYMBOL_GPL(xhci_msix_sync_irqs);
 
 #else
 
@@ -969,10 +970,6 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 				__func__);
 	}
 
-	/* step 5: remove core well power */
-	/* synchronize irq when using MSI-X */
-	xhci_msix_sync_irqs(xhci);
-
 	return rc;
 }
 EXPORT_SYMBOL_GPL(xhci_suspend);
-- 
2.25.1

