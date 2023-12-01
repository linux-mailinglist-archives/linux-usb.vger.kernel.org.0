Return-Path: <linux-usb+bounces-3559-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F50D800DF3
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D124B282487
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625B04A9AA;
	Fri,  1 Dec 2023 15:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivLsxZ2A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5ABA8
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443162; x=1732979162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BhxgGSaRsl0kU3oOHLL+iHhfeLczK+ueNAmrBhgOslY=;
  b=ivLsxZ2Avi/0hW39h1teV9Tt7IohH99lGvaX/jCWV6sG9ZS8S/B+VuD9
   y4nEjD9PUzVSFJ2iB0rHyC9fWLIXB6RCkcqCST8thtquh6bdTOpEC0p5K
   RKKGeBETam10BWqum1JMtaz7Kdzjbx8o3gjGnYTXbRhY/pPbBMXXnqoqJ
   YaC2D59pmDpGCJX+6odJ+AHpQvQHcQBAT5ur5IV+jG5/108M3u4WH2gq8
   vR+jV/un5qcXJmOCv7CQsloZ/Wr/HNw9qMBfGrfECL4QmB5eckPouy4P6
   6VTAkhqp/c45sk37/f2oK4htcOZG7APZmNc/D3+Vzb/eudPXujRDT6Mw9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309751"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309751"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:06:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112606"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112606"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:06:00 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/19] xhci: add handler for only one interrupt line
Date: Fri,  1 Dec 2023 17:06:40 +0200
Message-Id: <20231201150647.1307406-13-mathias.nyman@linux.intel.com>
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

Current xHCI driver only supports one "interrupter", meaning we will
only use one MSI/MSI-X interrupt line. Thus, add handler only to the
first interrupt line.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 7f2b1312e943..59bbae69f97c 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -95,10 +95,9 @@ static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 
 	if (hcd->msix_enabled) {
 		struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
-		int i;
 
-		for (i = 0; i < xhci->msix_count; i++)
-			synchronize_irq(pci_irq_vector(pdev, i));
+		/* for now, the driver only supports one primary interrupter */
+		synchronize_irq(pci_irq_vector(pdev, 0));
 	}
 }
 
@@ -112,15 +111,7 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 	if (hcd->irq > 0)
 		return;
 
-	if (hcd->msix_enabled) {
-		int i;
-
-		for (i = 0; i < xhci->msix_count; i++)
-			free_irq(pci_irq_vector(pdev, i), xhci_to_hcd(xhci));
-	} else {
-		free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
-	}
-
+	free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
 	pci_free_irq_vectors(pdev);
 	hcd->msix_enabled = 0;
 }
@@ -159,9 +150,9 @@ static int xhci_setup_msi(struct xhci_hcd *xhci)
  */
 static int xhci_setup_msix(struct xhci_hcd *xhci)
 {
-	int i, ret;
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+	int ret;
 
 	/*
 	 * calculate number of msi-x vectors supported.
@@ -181,22 +172,16 @@ static int xhci_setup_msix(struct xhci_hcd *xhci)
 		return ret;
 	}
 
-	for (i = 0; i < xhci->msix_count; i++) {
-		ret = request_irq(pci_irq_vector(pdev, i), xhci_msi_irq, 0,
-				"xhci_hcd", xhci_to_hcd(xhci));
-		if (ret)
-			goto disable_msix;
+	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
+			  xhci_to_hcd(xhci));
+	if (ret) {
+		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable MSI-X interrupt");
+		pci_free_irq_vectors(pdev);
+		return ret;
 	}
 
 	hcd->msix_enabled = 1;
 	return ret;
-
-disable_msix:
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable MSI-X interrupt");
-	while (--i >= 0)
-		free_irq(pci_irq_vector(pdev, i), xhci_to_hcd(xhci));
-	pci_free_irq_vectors(pdev);
-	return ret;
 }
 
 static int xhci_try_enable_msi(struct usb_hcd *hcd)
-- 
2.25.1


