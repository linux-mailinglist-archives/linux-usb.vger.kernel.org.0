Return-Path: <linux-usb+bounces-3672-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D708030DD
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3AEE1C20A34
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0792122EFE;
	Mon,  4 Dec 2023 10:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtBvBjz7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E149485
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686689; x=1733222689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BzZX8mVwMZ+17PYg6+Il/Vdf8JbFDsYY4TKdkMaw3hQ=;
  b=KtBvBjz7GCe/Dpx1HrrXgeYUoHd3hNwpc2LcHTX1RHiAAfK0L+CMGmoI
   9EJk6E1PIf1PpR1U8u4q+rLYDW/azSC9M9oPnrhLOhGzeGDgP22szUdqK
   KHyjOWTiLPckJ6Nx8WwkPEx9ZHAx8IDndWA9IlV1st30LMoxqkRuA38lX
   lCgX1+SI30AQiL+fPQDpKCfE4bQQOmiGopeeAvqHinPZRLpD73E8SBUPs
   M9Q12kOGV1ZSu4z7NOCffbHz1BSEsgmpJQFODOpHUixo3c9hSB79ffPRj
   fnIez+F9A+owE4o02S6P2eYIElifjBOCkZZ6M8d16YmL2y/Fa/5moOzhK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260680"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260680"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338995"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338995"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:47 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 15/18] xhci: rework 'xhci_try_enable_msi()' MSI and MSI-X setup code
Date: Mon,  4 Dec 2023 12:45:31 +0200
Message-Id: <20231204104534.1335903-16-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
References: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Simplify 'xhci_try_enable_msi()' and reduce unnecessary function calls.

xHCI driver first tries to allocate 'num_online_cpu()' number of MSI-X
vectors, if that fails it falls back to a single MSI vector. There is no
good reason for this, we currently only support a primary interrupter.
However, we are still interested in knowing if there are more vectors
available, which will be utilized once we get secondary interrupter
support.

Call 'pci_alloc_irq_vectors()' once (with MSI-X and MSI flag), instead
of separately for MSI-X and MSI. And accept any number of MSI-X or MSI
vectors between 1 and 'num_online_cpu()'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 44 +++++++++++++------------------------
 1 file changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2307164a1e81..398f81b0500b 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -116,13 +116,13 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 	hcd->msix_enabled = 0;
 }
 
+/* Try enabling MSI-X with MSI and legacy IRQ as fallback */
 static int xhci_try_enable_msi(struct usb_hcd *hcd)
 {
+	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct pci_dev  *pdev;
 	int ret;
 
-	pdev = to_pci_dev(xhci_to_hcd(xhci)->self.controller);
 	/*
 	 * Some Fresco Logic host controllers advertise MSI, but fail to
 	 * generate interrupts.  Don't even try to enable MSI.
@@ -145,42 +145,28 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	xhci->nvecs = min(num_online_cpus() + 1,
 			  HCS_MAX_INTRS(xhci->hcs_params1));
 
-	xhci->nvecs = pci_alloc_irq_vectors(pdev, xhci->nvecs, xhci->nvecs,
-					    PCI_IRQ_MSIX);
+	/* TODO: Check with MSI Soc for sysdev */
+	xhci->nvecs = pci_alloc_irq_vectors(pdev, 1, xhci->nvecs,
+					    PCI_IRQ_MSIX | PCI_IRQ_MSI);
 	if (xhci->nvecs < 0) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Failed to enable MSI-X");
-		goto setup_msi;
+		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+			       "failed to allocate IRQ vectors");
+		goto legacy_irq;
 	}
 
 	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
 			  xhci_to_hcd(xhci));
-	if (ret) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable MSI-X interrupt");
-		pci_free_irq_vectors(pdev);
-		goto setup_msi;
-	}
+	if (ret)
+		goto free_irq_vectors;
 
 	hcd->msi_enabled = 1;
-	hcd->msix_enabled = 1;
+	hcd->msix_enabled = pdev->msix_enabled;
 	return 0;
 
-setup_msi:
-	/* TODO: Check with MSI Soc for sysdev */
-	xhci->nvecs = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
-	if (xhci->nvecs < 0) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "failed to allocate MSI entry");
-		goto legacy_irq;
-	}
-
-	ret = request_irq(pdev->irq, xhci_msi_irq, 0, "xhci_hcd", xhci_to_hcd(xhci));
-	if (ret) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable MSI interrupt");
-		pci_free_irq_vectors(pdev);
-		goto legacy_irq;
-	}
-
-	hcd->msi_enabled = 1;
-	return 0;
+free_irq_vectors:
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable %s interrupt",
+		       pdev->msix_enabled ? "MSI-X" : "MSI");
+	pci_free_irq_vectors(pdev);
 
 legacy_irq:
 	if (!pdev->irq) {
-- 
2.25.1


