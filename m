Return-Path: <linux-usb+bounces-3673-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B168030DE
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 096961F2102B
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC789224ED;
	Mon,  4 Dec 2023 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpoUNasu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82116B9
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686691; x=1733222691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gafGrxk/um2/83hkmZW9t1GIqfBSudbPSKJUh3zbOBo=;
  b=PpoUNasuLtsvnqFDwnu4CNrmy0udozgXgNTfgksN48Ce3IFyDiurq9FA
   Gm7siFkdmG+M8oioPLkk8xqn3YCDCwRtkVCCHjCMAxt0blmxSHREAURvy
   PZzktX4GPY3++RNshbSocx37uLqFCbLQpdPGDPM95yqLtWfgJI0fVEBb3
   9QDpiUaW10hibILIH0sR10Sa+gxNtpoqZzlatMEQOSM5k+lt7ciqOYI/B
   oM7iUhy/TuDyJpfdTyQgbYNQPMGtfpuN6bIkXzvGYnWF03b1D9klnAEy1
   f6tNEuY5TQR/qI9PG9Vfw3ODKjZ+x6ylFguHs7M/qjbnMQsYTc8VHHHdX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260684"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260684"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861339002"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861339002"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:48 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 16/18] xhci: minor coding style cleanup in 'xhci_try_enable_msi()'
Date: Mon,  4 Dec 2023 12:45:32 +0200
Message-Id: <20231204104534.1335903-17-mathias.nyman@linux.intel.com>
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

Remove extra spaces/indentation and add spaces where required.
This commit does not change any functionality.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 398f81b0500b..dfeca3cbac8b 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -178,12 +178,10 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 		snprintf(hcd->irq_descr, sizeof(hcd->irq_descr), "%s:usb%d",
 			 hcd->driver->description, hcd->self.busnum);
 
-	/* fall back to legacy interrupt*/
-	ret = request_irq(pdev->irq, &usb_hcd_irq, IRQF_SHARED,
-			hcd->irq_descr, hcd);
+	/* fall back to legacy interrupt */
+	ret = request_irq(pdev->irq, &usb_hcd_irq, IRQF_SHARED, hcd->irq_descr, hcd);
 	if (ret) {
-		xhci_err(xhci, "request interrupt %d failed\n",
-				pdev->irq);
+		xhci_err(xhci, "request interrupt %d failed\n", pdev->irq);
 		return ret;
 	}
 	hcd->irq = pdev->irq;
-- 
2.25.1


