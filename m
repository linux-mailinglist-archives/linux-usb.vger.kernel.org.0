Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFB8A6BED3F
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjCQPq2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjCQPq1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:27 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851FBB5FF7
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067978; x=1710603978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Asbffi6CWrmPDY6KpwyliGzV7NpZETs5OHT7ahZVgw=;
  b=VXmzBbLv3Dza+I819OxrkSz5NJtjKs/mUSqjGOnzsDsbaBNwgpViRrHt
   SflF+woN5ggXtrX+W0RrOhm7D62DXN6v9SOcHmcg14BOezok+Lgbt97tV
   YKIdd8dLodZc7pBEHaScwCw2Yvj44UFiWtm6wAIdKATrYPgSMpQoSUSsu
   6ew5KZrqTNF6Vi1LKC4ms8av86nc4NKSwvaeFCrEEutsLExnymGOLJiAo
   38IAHDOMfsRV6QV4i1zUyAwEGBboiDsqbaBJzVgztnO3eWKe9ra5VPyRJ
   vBcv4/i18Nc1JgV9R7yaYP+Q1ZuX3M1tp2Hzim8Wb1w4u544OVUKSngbp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309856"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309856"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630312013"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630312013"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:16 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/14] xhci: Move functions to setup msi to xhci-pci
Date:   Fri, 17 Mar 2023 17:47:11 +0200
Message-Id: <20230317154715.535523-11-mathias.nyman@linux.intel.com>
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

Move functions to setup msi from xhci.c to xhci-pci.c to decouple
PCI specific code from generic xhci code.

No functional changes, functions are an exact copy

[commit message rewording -Mathias]
Signed-off-by: Josue David Hernandez Gutierrez <josue.d.hernandez.gutierrez@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c   | 129 ++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-ring.c  |   1 +
 drivers/usb/host/xhci-trace.c |   1 +
 drivers/usb/host/xhci.c       | 134 ----------------------------------
 drivers/usb/host/xhci.h       |   1 -
 5 files changed, 131 insertions(+), 135 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 5f006d199cd6..2d56b7477fcd 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -88,6 +88,135 @@ static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.update_hub_device = xhci_pci_update_hub_device,
 };
 
+/*
+ * Set up MSI
+ */
+static int xhci_setup_msi(struct xhci_hcd *xhci)
+{
+	int ret;
+	/*
+	 * TODO:Check with MSI Soc for sysdev
+	 */
+	struct pci_dev  *pdev = to_pci_dev(xhci_to_hcd(xhci)->self.controller);
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
+	if (ret < 0) {
+		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+				"failed to allocate MSI entry");
+		return ret;
+	}
+
+	ret = request_irq(pdev->irq, xhci_msi_irq,
+				0, "xhci_hcd", xhci_to_hcd(xhci));
+	if (ret) {
+		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+				"disable MSI interrupt");
+		pci_free_irq_vectors(pdev);
+	}
+
+	return ret;
+}
+
+/*
+ * Set up MSI-X
+ */
+static int xhci_setup_msix(struct xhci_hcd *xhci)
+{
+	int i, ret;
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+
+	/*
+	 * calculate number of msi-x vectors supported.
+	 * - HCS_MAX_INTRS: the max number of interrupts the host can handle,
+	 *   with max number of interrupters based on the xhci HCSPARAMS1.
+	 * - num_online_cpus: maximum msi-x vectors per CPUs core.
+	 *   Add additional 1 vector to ensure always available interrupt.
+	 */
+	xhci->msix_count = min(num_online_cpus() + 1,
+				HCS_MAX_INTRS(xhci->hcs_params1));
+
+	ret = pci_alloc_irq_vectors(pdev, xhci->msix_count, xhci->msix_count,
+			PCI_IRQ_MSIX);
+	if (ret < 0) {
+		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+				"Failed to enable MSI-X");
+		return ret;
+	}
+
+	for (i = 0; i < xhci->msix_count; i++) {
+		ret = request_irq(pci_irq_vector(pdev, i), xhci_msi_irq, 0,
+				"xhci_hcd", xhci_to_hcd(xhci));
+		if (ret)
+			goto disable_msix;
+	}
+
+	hcd->msix_enabled = 1;
+	return ret;
+
+disable_msix:
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable MSI-X interrupt");
+	while (--i >= 0)
+		free_irq(pci_irq_vector(pdev, i), xhci_to_hcd(xhci));
+	pci_free_irq_vectors(pdev);
+	return ret;
+}
+
+static int xhci_try_enable_msi(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct pci_dev  *pdev;
+	int ret;
+
+	/* The xhci platform device has set up IRQs through usb_add_hcd. */
+	if (xhci->quirks & XHCI_PLAT)
+		return 0;
+
+	pdev = to_pci_dev(xhci_to_hcd(xhci)->self.controller);
+	/*
+	 * Some Fresco Logic host controllers advertise MSI, but fail to
+	 * generate interrupts.  Don't even try to enable MSI.
+	 */
+	if (xhci->quirks & XHCI_BROKEN_MSI)
+		goto legacy_irq;
+
+	/* unregister the legacy interrupt */
+	if (hcd->irq)
+		free_irq(hcd->irq, hcd);
+	hcd->irq = 0;
+
+	ret = xhci_setup_msix(xhci);
+	if (ret)
+		/* fall back to msi*/
+		ret = xhci_setup_msi(xhci);
+
+	if (!ret) {
+		hcd->msi_enabled = 1;
+		return 0;
+	}
+
+	if (!pdev->irq) {
+		xhci_err(xhci, "No msi-x/msi found and no IRQ in BIOS\n");
+		return -EINVAL;
+	}
+
+ legacy_irq:
+	if (!strlen(hcd->irq_descr))
+		snprintf(hcd->irq_descr, sizeof(hcd->irq_descr), "%s:usb%d",
+			 hcd->driver->description, hcd->self.busnum);
+
+	/* fall back to legacy interrupt*/
+	ret = request_irq(pdev->irq, &usb_hcd_irq, IRQF_SHARED,
+			hcd->irq_descr, hcd);
+	if (ret) {
+		xhci_err(xhci, "request interrupt %d failed\n",
+				pdev->irq);
+		return ret;
+	}
+	hcd->irq = pdev->irq;
+	return 0;
+}
+
 static int xhci_pci_run(struct usb_hcd *hcd)
 {
 	int ret;
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index eb788c60c1c0..1ad12d5a4857 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3106,6 +3106,7 @@ irqreturn_t xhci_msi_irq(int irq, void *hcd)
 {
 	return xhci_irq(hcd);
 }
+EXPORT_SYMBOL_GPL(xhci_msi_irq);
 
 /****		Endpoint Ring Operations	****/
 
diff --git a/drivers/usb/host/xhci-trace.c b/drivers/usb/host/xhci-trace.c
index d0070814d1ea..062662d23241 100644
--- a/drivers/usb/host/xhci-trace.c
+++ b/drivers/usb/host/xhci-trace.c
@@ -12,3 +12,4 @@
 #include "xhci-trace.h"
 
 EXPORT_TRACEPOINT_SYMBOL_GPL(xhci_dbg_quirks);
+EXPORT_TRACEPOINT_SYMBOL_GPL(xhci_dbg_init);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index d08e2ba744f8..9be84e635e1b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -319,79 +319,6 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 }
 
 #ifdef CONFIG_USB_PCI
-/*
- * Set up MSI
- */
-static int xhci_setup_msi(struct xhci_hcd *xhci)
-{
-	int ret;
-	/*
-	 * TODO:Check with MSI Soc for sysdev
-	 */
-	struct pci_dev  *pdev = to_pci_dev(xhci_to_hcd(xhci)->self.controller);
-
-	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
-	if (ret < 0) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-				"failed to allocate MSI entry");
-		return ret;
-	}
-
-	ret = request_irq(pdev->irq, xhci_msi_irq,
-				0, "xhci_hcd", xhci_to_hcd(xhci));
-	if (ret) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-				"disable MSI interrupt");
-		pci_free_irq_vectors(pdev);
-	}
-
-	return ret;
-}
-
-/*
- * Set up MSI-X
- */
-static int xhci_setup_msix(struct xhci_hcd *xhci)
-{
-	int i, ret;
-	struct usb_hcd *hcd = xhci_to_hcd(xhci);
-	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
-
-	/*
-	 * calculate number of msi-x vectors supported.
-	 * - HCS_MAX_INTRS: the max number of interrupts the host can handle,
-	 *   with max number of interrupters based on the xhci HCSPARAMS1.
-	 * - num_online_cpus: maximum msi-x vectors per CPUs core.
-	 *   Add additional 1 vector to ensure always available interrupt.
-	 */
-	xhci->msix_count = min(num_online_cpus() + 1,
-				HCS_MAX_INTRS(xhci->hcs_params1));
-
-	ret = pci_alloc_irq_vectors(pdev, xhci->msix_count, xhci->msix_count,
-			PCI_IRQ_MSIX);
-	if (ret < 0) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-				"Failed to enable MSI-X");
-		return ret;
-	}
-
-	for (i = 0; i < xhci->msix_count; i++) {
-		ret = request_irq(pci_irq_vector(pdev, i), xhci_msi_irq, 0,
-				"xhci_hcd", xhci_to_hcd(xhci));
-		if (ret)
-			goto disable_msix;
-	}
-
-	hcd->msix_enabled = 1;
-	return ret;
-
-disable_msix:
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable MSI-X interrupt");
-	while (--i >= 0)
-		free_irq(pci_irq_vector(pdev, i), xhci_to_hcd(xhci));
-	pci_free_irq_vectors(pdev);
-	return ret;
-}
 
 /* Free any IRQs and disable MSI-X */
 static void xhci_cleanup_msix(struct xhci_hcd *xhci)
@@ -432,69 +359,8 @@ static void __maybe_unused xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 	}
 }
 
-int xhci_try_enable_msi(struct usb_hcd *hcd)
-{
-	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct pci_dev  *pdev;
-	int ret;
-
-	/* The xhci platform device has set up IRQs through usb_add_hcd. */
-	if (xhci->quirks & XHCI_PLAT)
-		return 0;
-
-	pdev = to_pci_dev(xhci_to_hcd(xhci)->self.controller);
-	/*
-	 * Some Fresco Logic host controllers advertise MSI, but fail to
-	 * generate interrupts.  Don't even try to enable MSI.
-	 */
-	if (xhci->quirks & XHCI_BROKEN_MSI)
-		goto legacy_irq;
-
-	/* unregister the legacy interrupt */
-	if (hcd->irq)
-		free_irq(hcd->irq, hcd);
-	hcd->irq = 0;
-
-	ret = xhci_setup_msix(xhci);
-	if (ret)
-		/* fall back to msi*/
-		ret = xhci_setup_msi(xhci);
-
-	if (!ret) {
-		hcd->msi_enabled = 1;
-		return 0;
-	}
-
-	if (!pdev->irq) {
-		xhci_err(xhci, "No msi-x/msi found and no IRQ in BIOS\n");
-		return -EINVAL;
-	}
-
- legacy_irq:
-	if (!strlen(hcd->irq_descr))
-		snprintf(hcd->irq_descr, sizeof(hcd->irq_descr), "%s:usb%d",
-			 hcd->driver->description, hcd->self.busnum);
-
-	/* fall back to legacy interrupt*/
-	ret = request_irq(pdev->irq, &usb_hcd_irq, IRQF_SHARED,
-			hcd->irq_descr, hcd);
-	if (ret) {
-		xhci_err(xhci, "request interrupt %d failed\n",
-				pdev->irq);
-		return ret;
-	}
-	hcd->irq = pdev->irq;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(xhci_try_enable_msi);
-
 #else
 
-static inline int xhci_try_enable_msi(struct usb_hcd *hcd)
-{
-	return 0;
-}
-
 static inline void xhci_cleanup_msix(struct xhci_hcd *xhci)
 {
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 26fccc8d9055..786002bb35db 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2143,7 +2143,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated);
 
 irqreturn_t xhci_irq(struct usb_hcd *hcd);
 irqreturn_t xhci_msi_irq(int irq, void *hcd);
-int xhci_try_enable_msi(struct usb_hcd *hcd);
 int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev);
 int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
-- 
2.25.1

