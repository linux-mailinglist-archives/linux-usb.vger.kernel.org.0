Return-Path: <linux-usb+bounces-3670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 720908030DB
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8C81B209F9
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803D422F09;
	Mon,  4 Dec 2023 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jdwf6xC/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B5E85
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686686; x=1733222686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=73EkWAAz+urFW0xKg9BLvqNa05xFXePwByucTE9NsiU=;
  b=Jdwf6xC/UKOimW1J8AfaZu28bOzPeShN9udNLly3Sf2S7pKoXF6Ctwgd
   5U4pC20BjBUwI2kTe5I/OBwCgWUkfky60zDAcknMF+2BGeYTjPlUal+ve
   pg4npbbazd86gVFcB/+ZXZHH0TQm2jrNg89yU3TWzlgy2YuGn3yxUGMCy
   oadYp3Gz9Y97HLjiEfnNud0BGICS6xVNeLyWKz4q4HSyt+JYUK7KjVegn
   WyvadkdLdtnInC/DB+mGJOyrMzvTOOF+xm9lcPlbUos6hpq+Gw1/yegSn
   UrMu9wcmLLjpOHE4dNfbSEvEPjtkueZxGaopQj/9qLtmlZ7Ag8pFe89NH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260675"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260675"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338973"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338973"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:43 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 13/18] xhci: refactor static MSI function
Date: Mon,  4 Dec 2023 12:45:29 +0200
Message-Id: <20231204104534.1335903-14-mathias.nyman@linux.intel.com>
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


