Return-Path: <linux-usb+bounces-2395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7F87DCCA0
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 13:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70D7C1C20B4F
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 12:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645B41DA34;
	Tue, 31 Oct 2023 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T384LMPT"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622B61DA4B
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 12:12:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE389A2
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 05:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698754330; x=1730290330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L0Gl+BPtK71pToNy+mDYRg/VUg72GFnzuZVfY4iT3TY=;
  b=T384LMPTJUfwYCRxgnO05vMG2soF2CEkMcsi5STtAC1CZPtuFt3Ylu81
   xVyAu7OaJAyEwT9ySCBQFigiwLzGDZQj7414fkXhPpvVWVxaZArBDUFvs
   r9AxZMbd3TggLG3lgLbPkwaFjsR4R5WXLZMC1T3yHAuqirQiZMHcJ0zvN
   iRecJAPDj8InllvYZEQEQ0qkPm+/F7QAxWTY+qvpI8AEBnBcePxas5yAR
   F+B7ZCl8Ph0/7rqCl3athzP+kS/9MtGbdXTD0JHwWwKZykA7MLUT0W8ub
   XuWCIBqLFMqG08/OhZK33TnGRtCr5/5G9Iprkw7e2g0ziqIfghxxs+Wd8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="385463739"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="385463739"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 05:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="764224539"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="764224539"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 31 Oct 2023 05:12:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 96EB651D; Tue, 31 Oct 2023 14:12:02 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 4/7] xhci: refactor static MSI function
Date: Tue, 31 Oct 2023 14:10:14 +0200
Message-ID: <20231031121017.41487-5-niklas.neronin@linux.intel.com>
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

The current way the xhci driver sets up MSI interrupts is overly complex
and messy. The whole MSI setup can be done in one simple function.

Continue refactoring MSI/MSI-X setup by incorporating 'xhci_setup_msi()'
into 'xhci_try_enable_msi()'. Now all interrupt enabling is contained in
one function, which should make it easier to rework.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 49 ++++++++++++-------------------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 9e8ee737c2f1..79c4eccd7ae3 100644
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
2.40.1


