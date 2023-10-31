Return-Path: <linux-usb+bounces-2394-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F67DCC9C
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 13:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 009DA1C20C19
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 12:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE271DA30;
	Tue, 31 Oct 2023 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G39hKvCq"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0646A110E
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 12:11:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC7F98
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 05:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698754294; x=1730290294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uMefFzni53TdKdaKjoHykOffFo4wQcDKogaptJNXwPo=;
  b=G39hKvCqKZr5Vz7Z9xCi2mBaCTw1xfw6yv2asdW1W2lYFYA5u0M48lvG
   PKM5mNNGQtUAVDq0voP5DtmONkvasJn65T7esgdyuO2vQF4hAcA2RVEAZ
   kU3e0G7hnsEsbJctBHUANJtLlnk/ST/UEZF0Zwwp/DsLLljWIgGn9nyYw
   n3FTkTM1WD4iW/+FMQNDGH6/U9m8x4mBtlhZ9RrzdxopEOP9lPxnhyCMb
   wRCbRf1RVRN7jc1eGfa93NjzyYR0C6t2idv4DV596aSY6571e1de1nDMy
   wSHPwupgahEjkrdppKoLY5z0JcN/UXhHTprhEq1LtnLRxWkR9Gze/U3at
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1163626"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1163626"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 05:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="754120551"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="754120551"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 31 Oct 2023 05:11:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 594164A0; Tue, 31 Oct 2023 14:11:31 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 2/7] xhci: add handler for only one interrupt line
Date: Tue, 31 Oct 2023 14:10:12 +0200
Message-ID: <20231031121017.41487-3-niklas.neronin@linux.intel.com>
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

Current xHCI driver only supports one "interrupter", meaning we will
only use one MSI/MSI-X interrupt line. Thus, add handler only to the
first interrupt line.

Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index afbee93d1cf8..d37463a80a5d 100644
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
2.40.1


