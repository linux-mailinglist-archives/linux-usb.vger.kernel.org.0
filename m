Return-Path: <linux-usb+bounces-2399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5457DCCCD
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 13:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDB022817F9
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 12:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF441D53B;
	Tue, 31 Oct 2023 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRTqgAsP"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF64A1DA41
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 12:17:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3D197
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698754673; x=1730290673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eP5nuDPuXi7utfCvqljL1DyfvnpqqLeSl14ReboOCy4=;
  b=VRTqgAsPcvdjRRKxSNvgAe6quTW/x/I5NIWfBGPEymasZczczvo4p3Ga
   B+Lw0WdSOIR8aJoPzP/dzHnf7ewRBXppMDPhw2uhZlTSQSRW3fg+SFG/0
   YJDSIEYPF+Vk0+MKp+f+5lcG2PyLhaglay7dxXYhJseyLdvO8XnVUbLhw
   wqAU1qgTLxyNlj4WD9oDWNiB7IhNNFI27WdGpWhYziyMFGRlhal/76Etc
   cwVJVW/Eq7UmEJl7pc+u6aQ+ydJeq255eNGA1bf1ar1WBn0kfR/k4xEX9
   RvnaQovRPHKP4FkwqgC7+6YTjV4it5lX53hRAtXX0t7VLS8nEnccV5U9y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="368480392"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="368480392"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 05:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="934088585"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="934088585"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 31 Oct 2023 05:17:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id A18274A0; Tue, 31 Oct 2023 14:11:58 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 3/7] xhci: refactor static MSI-X function
Date: Tue, 31 Oct 2023 14:10:13 +0200
Message-ID: <20231031121017.41487-4-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031121017.41487-2-niklas.neronin@linux.intel.com>
References: <20231031121017.41487-2-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current way the xhci driver sets up MSI/MSI-X interrupts is overly
complex and messy. The whole MSI/MSI-X setup can be done in one simple
function.

Start refactoring this by incorporating 'xhci_setup_msix()' into
'xhci_try_enable_msi()'. 'xhci_setup_msix()' is a static function which
is only called by 'xhci_try_enable_msi()'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 68 +++++++++++++++----------------------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index d37463a80a5d..9e8ee737c2f1 100644
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
2.40.1


