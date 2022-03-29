Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1242C4EB0E7
	for <lists+linux-usb@lfdr.de>; Tue, 29 Mar 2022 17:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238939AbiC2PqA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Mar 2022 11:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238931AbiC2Pp6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Mar 2022 11:45:58 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8401274E
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 08:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648568655; x=1680104655;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KxJxKuJsgeqrGbfaJ2vhb/XQbgw6DRQZfSA2Wg7g6V0=;
  b=hFINiDcCApkx7ymMlwsRYNVEUm3e5FO94CzgtZXK8jczeh+vPNtqoQgj
   Wli6xpA8pMz71NtYcjqQ4pBdSPj0NGxb4xEffrHCCAKRwQ0HSivrdpL3U
   L5YBqepJc+R2bfsahLfrAZOlg1UwRhpH0nT2slkWZrTgfB1OUI1juDSl1
   hC+VWXYheQrbX/VO+hXhCFRjWpZZTpQfuUIRo9PNW00+Ky4ezjX7NCnFz
   NFXK4Ip85Atj0keuGLTKxqKULE5tkte1qW+djzgl/AFSU/vw+79DioG5y
   Y98NzUdRFHzfzolNt73lBRC66ScL/eoEyBE+w4eQdexE0AqhDQBFj0l8z
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259466645"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="259466645"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:44:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="834845652"
Received: from kvenkat1-mobl.amr.corp.intel.com (HELO josuedhx-mobl1.intel.com) ([10.209.85.147])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:44:13 -0700
From:   Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     mathias.nyman@linux.intel.com,
        Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>
Subject: [PATCH 1/2] usb: host: xhci: Remove msi irq reconfigure on resume
Date:   Tue, 29 Mar 2022 09:44:05 -0600
Message-Id: <20220329154406.5485-1-josue.d.hernandez.gutierrez@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xhci_resume function is cleaning up msi irqs to avoid
conflicts when xhci_run is called, because xhci_run
is going to setup those msi irqs and it is called at
the end of xhci_resume, then creating a new start
callback for the xhci-pci driver to setup msi
irqs and removing this msi irq setup from xhci_run
reconfigure msi irqs won't be needed in xhci_resume.

This change also allows us move the msi setup code to
the correct place, that is from xhci.c to xhci-pci.c

Signed-off-by: Josue David Hernandez Gutierrez <josue.d.hernandez.gutierrez@intel.com>
---
 drivers/usb/host/xhci-pci.c   | 143 ++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-ring.c  |   1 +
 drivers/usb/host/xhci-trace.c |   1 +
 drivers/usb/host/xhci.c       | 138 --------------------------------
 4 files changed, 145 insertions(+), 138 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 5c351970cdf1..f5a942ca65fd 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -85,11 +85,154 @@ static const char hcd_name[] = "xhci_hcd";
 static struct hc_driver __read_mostly xhci_pci_hc_driver;
 
 static int xhci_pci_setup(struct usb_hcd *hcd);
+static int xhci_pci_run(struct usb_hcd *hcd);
 
 static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.reset = xhci_pci_setup,
+	.start = xhci_pci_run,
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
+static int xhci_pci_run(struct usb_hcd *hcd)
+{
+	int ret;
+
+	if (usb_hcd_is_primary_hcd(hcd)) {
+		ret = xhci_try_enable_msi(hcd);
+		if (ret)
+			return ret;
+	}
+	return xhci_run(hcd);
+}
+
 /* called after powerup, by probe or system-pm "wakeup" */
 static int xhci_pci_reinit(struct xhci_hcd *xhci, struct pci_dev *pdev)
 {
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d0b6806275e0..c682cb320a1e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3162,6 +3162,7 @@ irqreturn_t xhci_msi_irq(int irq, void *hcd)
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
index 642610c78f58..1d9cb04301bf 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -291,79 +291,6 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
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
@@ -404,68 +331,8 @@ static void __maybe_unused xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 	}
 }
 
-static int xhci_try_enable_msi(struct usb_hcd *hcd)
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
@@ -652,10 +519,6 @@ int xhci_run(struct usb_hcd *hcd)
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xhci_run");
 
-	ret = xhci_try_enable_msi(hcd);
-	if (ret)
-		return ret;
-
 	temp_64 = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
 	temp_64 &= ~ERST_PTR_MASK;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
@@ -1175,7 +1038,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		spin_unlock_irq(&xhci->lock);
 		if (retval)
 			return retval;
-		xhci_cleanup_msix(xhci);
 
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
 		temp = readl(&xhci->op_regs->status);
-- 
2.35.1

