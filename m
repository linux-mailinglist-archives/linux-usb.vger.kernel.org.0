Return-Path: <linux-usb+bounces-3669-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6538030D9
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686731F211FA
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0789D22F0A;
	Mon,  4 Dec 2023 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZGkEsDm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DFFC3
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686684; x=1733222684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xg5ijQ5VGn2yXTBMSUogBsQFurOInOpRuH8XgpuEKHk=;
  b=AZGkEsDm794T8q3eyRwDP1cuqwMrqVWjzm7uTDMhGctuPu2ubcDTSlp/
   2Jod1MvGx+0nyIfNCbLpqkhb93EKvMluV8c+RlIyxMZ07czjbZWIf6PeK
   HddaJp0MijLz246lB9y+Csp1As33tJ+TCwZ22zCMVe9QtELUhJEADgzo5
   O2DkJrpodBsL+gDPs/V/PQJaLH0i95FLSzEYiKiF+PYBEfuqeFeVUzaaa
   IQ3JCMEGo5qBuQMx4nepDnirzdSrYeakGgNN0gwgqJFyV+seSrrYj9K5l
   MTqsmPHYSpfifkE4M82hhkVH+md2eBuGjclXlhCsKGIPgVA1Y+bsxnrh/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260673"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260673"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338964"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338964"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:41 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 12/18] xhci: refactor static MSI-X function
Date: Mon,  4 Dec 2023 12:45:28 +0200
Message-Id: <20231204104534.1335903-13-mathias.nyman@linux.intel.com>
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

The current way the xhci driver sets up MSI/MSI-X interrupts is overly
complex and messy. The whole MSI/MSI-X setup can be done in one simple
function.

Start refactoring this by incorporating 'xhci_setup_msix()' into
'xhci_try_enable_msi()'. 'xhci_setup_msix()' is a static function which
is only called by 'xhci_try_enable_msi()'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 68 +++++++++++++++----------------------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 59bbae69f97c..370943c04881 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -145,31 +145,40 @@ static int xhci_setup_msi(struct xhci_hcd *xhci)
 	return ret;
 }
 
-/*
- * Set up MSI-X
- */
-static int xhci_setup_msix(struct xhci_hcd *xhci)
+static int xhci_try_enable_msi(struct usb_hcd *hcd)
 {
-	struct usb_hcd *hcd = xhci_to_hcd(xhci);
-	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct pci_dev  *pdev;
 	int ret;
 
+	pdev = to_pci_dev(xhci_to_hcd(xhci)->self.controller);
 	/*
-	 * calculate number of msi-x vectors supported.
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
+	/*
+	 * calculate number of MSI-X vectors supported.
 	 * - HCS_MAX_INTRS: the max number of interrupts the host can handle,
 	 *   with max number of interrupters based on the xhci HCSPARAMS1.
-	 * - num_online_cpus: maximum msi-x vectors per CPUs core.
+	 * - num_online_cpus: maximum MSI-X vectors per CPUs core.
 	 *   Add additional 1 vector to ensure always available interrupt.
 	 */
 	xhci->msix_count = min(num_online_cpus() + 1,
-				HCS_MAX_INTRS(xhci->hcs_params1));
+			       HCS_MAX_INTRS(xhci->hcs_params1));
 
 	ret = pci_alloc_irq_vectors(pdev, xhci->msix_count, xhci->msix_count,
-			PCI_IRQ_MSIX);
+				    PCI_IRQ_MSIX);
 	if (ret < 0) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-				"Failed to enable MSI-X");
-		return ret;
+		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Failed to enable MSI-X");
+		goto setup_msi;
 	}
 
 	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
@@ -177,37 +186,16 @@ static int xhci_setup_msix(struct xhci_hcd *xhci)
 	if (ret) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable MSI-X interrupt");
 		pci_free_irq_vectors(pdev);
-		return ret;
+		goto setup_msi;
 	}
 
+	hcd->msi_enabled = 1;
 	hcd->msix_enabled = 1;
-	return ret;
-}
-
-static int xhci_try_enable_msi(struct usb_hcd *hcd)
-{
-	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct pci_dev  *pdev;
-	int ret;
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
+	return 0;
 
+setup_msi:
+	/* fall back to MSI */
+	ret = xhci_setup_msi(xhci);
 	if (!ret) {
 		hcd->msi_enabled = 1;
 		return 0;
-- 
2.25.1


