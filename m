Return-Path: <linux-usb+bounces-3561-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 815CE800DF5
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C93A282582
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFE24174A;
	Fri,  1 Dec 2023 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqmGws/I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431491707
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443166; x=1732979166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=73EkWAAz+urFW0xKg9BLvqNa05xFXePwByucTE9NsiU=;
  b=VqmGws/ICoRWJoQTkQkH4Jndq10KgxV8pYoGcbLiLAjBTiimnDYDW/Rd
   cSoZtoeVm+86eVwnjBuqY6yo8pDlmIty0uM80ir7SwaBIO8Ill6WiSZVf
   G44QQ+IXPlCh5IwmTqhFXx5OAHgcb+TAyQ5ZYy4+kyv4qs4vp79wg3mhF
   j3t6uVU+xUqjkbr0FZrbSdD8Y8EMOwxTHx+hN2T8oSsH3pTj+ueoRTTUq
   9Ip3KCg8uSgGINajhiEQKKAaUfs++1yllcKDswjk1ZqhjVbq6vDb4VY38
   SClO2KYlw9+j5XJq34YLU5bwmwH85EFeKV00Dh1gSfPQiWZ7Qezy8mDDT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309761"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309761"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112634"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112634"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:06:04 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/19] xhci: refactor static MSI function
Date: Fri,  1 Dec 2023 17:06:42 +0200
Message-Id: <20231201150647.1307406-15-mathias.nyman@linux.intel.com>
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

The current way the xhci driver sets up MSI interrupts is overly complex
and messy. The whole MSI setup can be done in one simple function.

Continue refactoring MSI/MSI-X setup by incorporating 'xhci_setup_msi()'
into 'xhci_try_enable_msi()'. Now all interrupt enabling is contained in
one function, which should make it easier to rework.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 49 ++++++++++++-------------------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 370943c04881..dbec0a315566 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -116,35 +116,6 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 	hcd->msix_enabled = 0;
 }
 
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
 static int xhci_try_enable_msi(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
@@ -194,13 +165,23 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	return 0;
 
 setup_msi:
-	/* fall back to MSI */
-	ret = xhci_setup_msi(xhci);
-	if (!ret) {
-		hcd->msi_enabled = 1;
-		return 0;
+	/* TODO: Check with MSI Soc for sysdev */
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
+	if (ret < 0) {
+		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "failed to allocate MSI entry");
+		goto legacy_irq;
 	}
 
+	ret = request_irq(pdev->irq, xhci_msi_irq, 0, "xhci_hcd", xhci_to_hcd(xhci));
+	if (ret) {
+		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable MSI interrupt");
+		pci_free_irq_vectors(pdev);
+		goto legacy_irq;
+	}
+
+	hcd->msi_enabled = 1;
+	return 0;
+
 legacy_irq:
 	if (!pdev->irq) {
 		xhci_err(xhci, "No msi-x/msi found and no IRQ in BIOS\n");
-- 
2.25.1


