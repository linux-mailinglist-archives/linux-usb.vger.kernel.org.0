Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA54A6BED3E
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbjCQPqX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjCQPqV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:21 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CE6B6D25
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067976; x=1710603976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GBiU0DmXL/xgfTVQkpfA85x1MZCDbZiCtIgCmBVK9RQ=;
  b=f12iNM6MxU4KOwXBOmtBKAQG6a0UD+X7zUjmb98pU6gCHGC+Zcx7/81h
   7L7UsiZ4bcbQdujE/8XSv45YQftyPeD6PGhTT1IOdeNPUNzkS4Ga6iRaa
   qdbfZ4doO5FsCAmSIsPXDzAOg24FNGJ3rSCKUUis1o13Qz6dg5SKSlVkd
   me+EidvNCyXEtD3fstSFTqWiwFSPTrMmT6rrdsod5Z1aOK4Gkinazd7a/
   8ACGUf/10NiCBjw8FuME7ExPjJJbsVWw2FYK5QSaBn1fsSpMYsgnPqLI0
   sqA93ygaBplUUakPIKdkCOZCm2Uj4M4bI7/AP/zdi+WqN0Sj98GNR2Q5j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309840"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309840"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630312010"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630312010"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:14 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/14] xhci: Avoid PCI MSI/MSIX interrupt reinitialization at resume
Date:   Fri, 17 Mar 2023 17:47:10 +0200
Message-Id: <20230317154715.535523-10-mathias.nyman@linux.intel.com>
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

xhci MSI setup is currently done at the same time as xHC host is started
in xhci_run(). This couples the generic xhci code with PCI, and will
reconfigure MSI/MSIX interrupts every time xHC is started.

Decouple MSI/MSIX configuration from generic xhci code by moving MSI/MSIX
part to a PCI specific xhci_pci_run() function overriding xhci_run().

This allows us to remove unnecessay MSI/MSIX reconfiguration done every
time PCI xhci resumes from suspend. i.e. remove the xhci_cleanup_msix()
call from xhci_resume() and the xhci_try_enale_msi() call in xhci_run()
called a bit later by xhci_resume()

[minor changes and commit message rewrite -Mathias]

Signed-off-by: Josue David Hernandez Gutierrez <josue.d.hernandez.gutierrez@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 15 +++++++++++++++
 drivers/usb/host/xhci.c     |  8 ++------
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index fb988e4ea924..5f006d199cd6 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -78,14 +78,29 @@ static const char hcd_name[] = "xhci_hcd";
 static struct hc_driver __read_mostly xhci_pci_hc_driver;
 
 static int xhci_pci_setup(struct usb_hcd *hcd);
+static int xhci_pci_run(struct usb_hcd *hcd);
 static int xhci_pci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hdev,
 				      struct usb_tt *tt, gfp_t mem_flags);
 
 static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.reset = xhci_pci_setup,
+	.start = xhci_pci_run,
 	.update_hub_device = xhci_pci_update_hub_device,
 };
 
+static int xhci_pci_run(struct usb_hcd *hcd)
+{
+	int ret;
+
+	if (usb_hcd_is_primary_hcd(hcd)) {
+		ret = xhci_try_enable_msi(hcd);
+		if (ret)
+			return ret;
+	}
+
+	return xhci_run(hcd);
+}
+
 /* called after powerup, by probe or system-pm "wakeup" */
 static int xhci_pci_reinit(struct xhci_hcd *xhci, struct pci_dev *pdev)
 {
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6183ce8574b1..d08e2ba744f8 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -432,7 +432,7 @@ static void __maybe_unused xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 	}
 }
 
-static int xhci_try_enable_msi(struct usb_hcd *hcd)
+int xhci_try_enable_msi(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct pci_dev  *pdev;
@@ -486,6 +486,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	hcd->irq = pdev->irq;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(xhci_try_enable_msi);
 
 #else
 
@@ -701,10 +702,6 @@ int xhci_run(struct usb_hcd *hcd)
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xhci_run");
 
-	ret = xhci_try_enable_msi(hcd);
-	if (ret)
-		return ret;
-
 	temp_64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
 	temp_64 &= ~ERST_PTR_MASK;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
@@ -1246,7 +1243,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		spin_unlock_irq(&xhci->lock);
 		if (retval)
 			return retval;
-		xhci_cleanup_msix(xhci);
 
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
 		temp = readl(&xhci->op_regs->status);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 786002bb35db..26fccc8d9055 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2143,6 +2143,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated);
 
 irqreturn_t xhci_irq(struct usb_hcd *hcd);
 irqreturn_t xhci_msi_irq(int irq, void *hcd);
+int xhci_try_enable_msi(struct usb_hcd *hcd);
 int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev);
 int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
-- 
2.25.1

