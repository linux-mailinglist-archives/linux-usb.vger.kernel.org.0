Return-Path: <linux-usb+bounces-2398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A97DCCCC
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 13:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 099EE2817D2
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 12:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD101DA4E;
	Tue, 31 Oct 2023 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7uzoast"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC94E1D53B
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 12:17:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923C2BB
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 05:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698754672; x=1730290672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XSKu3NhlILhnD0kGRCHtejpj2/bd9tHd95I6BAi7F7E=;
  b=P7uzoastHFu9yFSVUH1Lh2xhGIIXe0d4ixe9gp66NVgTpcIqvZQOFMVE
   iVApyzEBUvaRheKSIpKmqKx5AWfQheYE1TqwftKFwFpcxueK82GcKbmSv
   VgIISJ7S+V/7nz/8n0p+geoPntc6TD4dKUNcXPSgvWxOoIqMr1AteMm+t
   ONhII/TZ6KSVZ7EaJpjGSbcGWb4AK9J+3P1fYouDTQG2NzbbrbnMhuVqt
   vL4WqalC0WKTIz3FPdryESeqncoDi4YlNFFz3SVQ/ryknXV+Shw9jb5hO
   befspYXYceQ9gyC+6L8cBCzwXaJElgJZar9zyCzlPt2wzvuQDyqGkclY7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="368480391"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="368480391"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 05:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="934088584"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="934088584"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 31 Oct 2023 05:17:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id ACB1052A; Tue, 31 Oct 2023 14:12:03 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 5/7] xhci: change 'msix_count' to encompass MSI or MSI-X vectors
Date: Tue, 31 Oct 2023 14:10:15 +0200
Message-ID: <20231031121017.41487-6-niklas.neronin@linux.intel.com>
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

Instead of variable 'msix_count' containing the number of MSI-X vectors,
now it can contains MSI or MSI-X vector amount. Because both interrupt
methods allow several vectors. Thus, 'msix_count' is renamed to 'nvecs'.

Additionally, instead of storing the maximum possible vector amount,
now it stores the amount of successfully allocated vectors, or negative
integer on allocation failure.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 14 +++++++-------
 drivers/usb/host/xhci.h     |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 79c4eccd7ae3..3ee3943db867 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -142,12 +142,12 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	 * - num_online_cpus: maximum MSI-X vectors per CPUs core.
 	 *   Add additional 1 vector to ensure always available interrupt.
 	 */
-	xhci->msix_count = min(num_online_cpus() + 1,
-			       HCS_MAX_INTRS(xhci->hcs_params1));
+	xhci->nvecs = min(num_online_cpus() + 1,
+			  HCS_MAX_INTRS(xhci->hcs_params1));
 
-	ret = pci_alloc_irq_vectors(pdev, xhci->msix_count, xhci->msix_count,
-				    PCI_IRQ_MSIX);
-	if (ret < 0) {
+	xhci->nvecs = pci_alloc_irq_vectors(pdev, xhci->nvecs, xhci->nvecs,
+					    PCI_IRQ_MSIX);
+	if (xhci->nvecs < 0) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Failed to enable MSI-X");
 		goto setup_msi;
 	}
@@ -166,8 +166,8 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 
 setup_msi:
 	/* TODO: Check with MSI Soc for sysdev */
-	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
-	if (ret < 0) {
+	xhci->nvecs = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
+	if (xhci->nvecs < 0) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "failed to allocate MSI entry");
 		goto legacy_irq;
 	}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 5df370482521..999914711ef5 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1790,8 +1790,8 @@ struct xhci_hcd {
 	int		page_size;
 	/* Valid values are 12 to 20, inclusive */
 	int		page_shift;
-	/* msi-x vectors */
-	int		msix_count;
+	/* MSI-X/MSI vectors */
+	int		nvecs;
 	/* optional clocks */
 	struct clk		*clk;
 	struct clk		*reg_clk;
-- 
2.40.1


