Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F04F6BED41
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbjCQPqa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjCQPq3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:29 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5ECBBB02
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067982; x=1710603982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i/UOX+LH2UfvdwIlRAkAHch1OmXZ4x/IIRdh61YLfjs=;
  b=YiZI912eUOxTm7aLFHYZbnHcKaEbiP442T1uk0JvdhPIbw+73i1/eRHA
   64xdm93tHmZZCcyTIIdzkZPFwZKZNIalimvgjcnSDvVghsOj1QmZZl+KW
   R86SXa69YHaFU1DzrPv8QpZqOmRyvkwfdJkkTMegLiKSipoFd4oqtkui0
   4p1Kj2dyns9VJcp1qsqSW4zDr3PV97M3zJmtNYsCgSeqvzQ81jyeJE9Sk
   S2oVNjvf/x5kghpMqkUHq1ay0m4XH5z+WSSkT8+xvQee4qx4KgypPsf2+
   URszw6v1Ax7mQq1dwOvzKD+KC3YJ70X004tBnzO6BfJPwVbuu9nayyNq+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309895"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309895"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630312024"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630312024"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:20 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/14] xhci: Move functions to cleanup MSI to xhci-pci
Date:   Fri, 17 Mar 2023 17:47:13 +0200
Message-Id: <20230317154715.535523-13-mathias.nyman@linux.intel.com>
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

Move function to cleanup MSI from xhci.c to xhci-pci.c
This is to decouple PCI specific code from generic xhci code.

No functional changes, function is an exact copy

Signed-off-by: Josue David Hernandez Gutierrez <josue.d.hernandez.gutierrez@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 26 ++++++++++++++++++++++++++
 drivers/usb/host/xhci.c     | 31 -------------------------------
 drivers/usb/host/xhci.h     |  1 -
 3 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b6cfc028f8f7..1e84a842e2a9 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -88,6 +88,32 @@ static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.update_hub_device = xhci_pci_update_hub_device,
 };
 
+/* Free any IRQs and disable MSI-X */
+static void xhci_cleanup_msix(struct xhci_hcd *xhci)
+{
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+
+	if (xhci->quirks & XHCI_PLAT)
+		return;
+
+	/* return if using legacy interrupt */
+	if (hcd->irq > 0)
+		return;
+
+	if (hcd->msix_enabled) {
+		int i;
+
+		for (i = 0; i < xhci->msix_count; i++)
+			free_irq(pci_irq_vector(pdev, i), xhci_to_hcd(xhci));
+	} else {
+		free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
+	}
+
+	pci_free_irq_vectors(pdev);
+	hcd->msix_enabled = 0;
+}
+
 /*
  * Set up MSI
  */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index cf90751125ed..874dca6dec69 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -320,33 +320,6 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 
 #ifdef CONFIG_USB_PCI
 
-/* Free any IRQs and disable MSI-X */
-void xhci_cleanup_msix(struct xhci_hcd *xhci)
-{
-	struct usb_hcd *hcd = xhci_to_hcd(xhci);
-	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
-
-	if (xhci->quirks & XHCI_PLAT)
-		return;
-
-	/* return if using legacy interrupt */
-	if (hcd->irq > 0)
-		return;
-
-	if (hcd->msix_enabled) {
-		int i;
-
-		for (i = 0; i < xhci->msix_count; i++)
-			free_irq(pci_irq_vector(pdev, i), xhci_to_hcd(xhci));
-	} else {
-		free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
-	}
-
-	pci_free_irq_vectors(pdev);
-	hcd->msix_enabled = 0;
-}
-EXPORT_SYMBOL_GPL(xhci_cleanup_msix);
-
 static void __maybe_unused xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
@@ -362,10 +335,6 @@ static void __maybe_unused xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 
 #else
 
-static inline void xhci_cleanup_msix(struct xhci_hcd *xhci)
-{
-}
-
 static inline void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 {
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a9111260632c..08d721921b7b 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2144,7 +2144,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated);
 
 irqreturn_t xhci_irq(struct usb_hcd *hcd);
 irqreturn_t xhci_msi_irq(int irq, void *hcd);
-void xhci_cleanup_msix(struct xhci_hcd *xhci);
 int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev);
 int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
-- 
2.25.1

