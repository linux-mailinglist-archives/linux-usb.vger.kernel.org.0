Return-Path: <linux-usb+bounces-2396-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C97DCCA1
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 13:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62FE42813EF
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 12:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BE61DA34;
	Tue, 31 Oct 2023 12:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKPj8vyL"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC6D19BB1
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 12:12:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A1E9F
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 05:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698754347; x=1730290347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B963KNSUtjvbdlLPxFBxkkuWoSEYJCbSM864H9HdfMc=;
  b=ZKPj8vyLPlyd7dc7FEpf9lBaWN+mJP4LrFE+u07nY5edXyGFdsELDE1q
   2nzfD4Ns26OWiCGcWQ6A2y/5QAB+3/XJhWGhhze/jYhfkzFIoMgiQOGI3
   hwlY8zWxriW2hQ20J3ycaO6A0c9m22pNCBe7blY9ZRM9FO3pJK6wEE1tm
   7f1IeWQI9nHL/8Kdqy97jnm3EhzfIAJpSD4DcSXykVEs4dUrqf0tSttPm
   q6cH8mEAQAxRSUBoOaP5BlvS+Pk7J6P1eN+XNrQ1aRoguzIG/6czBJrd0
   BdF9asr2OSFIaIfufZMzXvBmYgiXqMpOEM1c+smUg3TgryUodideRFtFe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="385463767"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="385463767"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 05:12:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="764224610"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="764224610"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 31 Oct 2023 05:12:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 8A06B51D; Tue, 31 Oct 2023 14:12:25 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 6/7] xhci: rework 'xhci_try_enable_msi()' MSI and MSI-X setup code
Date: Tue, 31 Oct 2023 14:10:16 +0200
Message-ID: <20231031121017.41487-7-niklas.neronin@linux.intel.com>
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
---
 drivers/usb/host/xhci-pci.c | 44 +++++++++++++------------------------
 1 file changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 3ee3943db867..742dd7f026e9 100644
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
2.40.1


