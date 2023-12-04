Return-Path: <linux-usb+bounces-3671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9881D8030DC
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E8961F21141
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7460224DB;
	Mon,  4 Dec 2023 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cq5N5vA2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D0FB9
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686687; x=1733222687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AqFIhtMHT+eCGtu53Ar9DDlFeygAWhDZg93X3dF6MVM=;
  b=cq5N5vA2k5cIFhXgLcOHS9Out88CgPvypbtVWPbVTd+jtFjSS9WTjaNc
   HfMQrm160x3OQNWV0rejg6GIjM1purKG1ALGhep5+V9Irgc7+oycxcYZF
   itLcVXYiAfxNF4L4pJ9RuNdGNcBM24CzpkOfSSzfdPDQjR3AZnRdLQoT4
   KRHaUYgLzcR/oKnsm/sO8wWNOtlvoiyofI8zA9OUwzlRzy3fVDAskFkWk
   F7LXrkYh4vEH06gijTT6LLUYfvF+ChbeyurI1GA1IVY4O2LnJ3DPwUkBw
   jzkfW3XD5bS2EClvD+14i1XE/wBkUVZvePb6gsYKXP9FVDZsbtacqf7bI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260676"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260676"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338988"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338988"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:45 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 14/18] xhci: change 'msix_count' to encompass MSI or MSI-X vectors
Date: Mon,  4 Dec 2023 12:45:30 +0200
Message-Id: <20231204104534.1335903-15-mathias.nyman@linux.intel.com>
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

Instead of variable 'msix_count' containing the number of MSI-X vectors,
now it can contains MSI or MSI-X vector amount. Because both interrupt
methods allow several vectors. Thus, 'msix_count' is renamed to 'nvecs'.

Additionally, instead of storing the maximum possible vector amount,
now it stores the amount of successfully allocated vectors, or negative
integer on allocation failure.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 14 +++++++-------
 drivers/usb/host/xhci.h     |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index dbec0a315566..2307164a1e81 100644
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
index 3ea5c092bba7..b166f47e379f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1760,8 +1760,8 @@ struct xhci_hcd {
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
2.25.1


