Return-Path: <linux-usb+bounces-3560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F27800DF4
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33CDFB214CF
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2950F4A9BA;
	Fri,  1 Dec 2023 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fI6hmbrV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90820D6C
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443164; x=1732979164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xg5ijQ5VGn2yXTBMSUogBsQFurOInOpRuH8XgpuEKHk=;
  b=fI6hmbrVNLiyCmEj7NEl69T/lLNnmE25akifq6Lp5ACy+2Tk0h7eLoKN
   50oAxAfZ8qwMEit6oxZb8cSY49K/JvlzUrCyZzimBAoRq+3EMu4YDb/UH
   T6fieltKqnvbyWT7khWWPmt3Pv+I3bDa+8oOUHVkU0Jt0fTtcDi5USRti
   KL/b+rFR+7ipRx+7s3b8W1Ur+pXcpW1iCaKGoJhGMtkjRnh0/Jidc1CqD
   bYcfjsAlH+OZ4TnzSSSMVPveDwiD5Tv7ynQwYMA0u65VFBfWUp+Br05R2
   QxGuk9VrAfKfNQVbUWcO5KtVdeIME+aHr1kFn8Ou47+cduZLGOrOJ2liE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309754"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309754"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112622"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112622"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:06:02 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/19] xhci: refactor static MSI-X function
Date: Fri,  1 Dec 2023 17:06:41 +0200
Message-Id: <20231201150647.1307406-14-mathias.nyman@linux.intel.com>
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


