Return-Path: <linux-usb+bounces-3563-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC22800DF7
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 863D6281DE9
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A014AF6E;
	Fri,  1 Dec 2023 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHkVurb9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8C6B9
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443169; x=1732979169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BzZX8mVwMZ+17PYg6+Il/Vdf8JbFDsYY4TKdkMaw3hQ=;
  b=LHkVurb9ByrKJECn9fP0jzYQddhMtdJrabdUpKgpzCeeLdmZlsUNdjr1
   xmxtyT7LYJx7s6K0xf8KcHLtuaHOHmDxfmkBHBe7XZY/ghPiw0jb6l2wI
   Did4LDVTA0b2norRGHFvfalWLtBFOs6buNjzWu78q5AzjErgoDwI742JG
   R39bOX1txMLzEjuFy0joWSMh7B34HG/AzVLv6eTVVd+M1zewkBtfyjLwA
   skedeVfdCFTu0rNdZhQTNyFVQ8MWA+UkBUtjlo6p0BCupR0fB846kIXZX
   aTTbSZyDOt8mIOnwPa1C8fnF4Bd1iX2uIWvxtH4Mw/vFgkrLlQ9XmpoUL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309766"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309766"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:06:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112649"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112649"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:06:07 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 16/19] xhci: rework 'xhci_try_enable_msi()' MSI and MSI-X setup code
Date: Fri,  1 Dec 2023 17:06:44 +0200
Message-Id: <20231201150647.1307406-17-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
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


