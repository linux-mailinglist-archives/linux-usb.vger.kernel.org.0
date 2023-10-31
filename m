Return-Path: <linux-usb+bounces-2397-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B368F7DCCA2
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 13:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E57E281811
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 12:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B651DA3E;
	Tue, 31 Oct 2023 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGWnSfcf"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CB119BB1
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 12:12:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49E6A2
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 05:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698754354; x=1730290354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BfzqNsJ/81n9XCew6EOx1KwzUAG5X91XrMLw+53+eM0=;
  b=kGWnSfcflFnDpEROqBW8xo2Rqq60VfwQEhiK6OhJKHznpQVf/MTEd9pZ
   l67kfJ9+kcJMHTRvxFNZ+gAduMD4yj5I6tAmb4bEdVdQGnlr10cdq3Uud
   W83CFGe7EHJ2wWKvk4NN5bBy3jOd671wTuAEmQgXj1fXXxvbVgsF9Sl+X
   02+yO2Ssx2MmblOvM5vZrmGLQsHkse4WTnuEaJpWnEMwDt1PVlC05jVaB
   NLy7Pjnq2Lns+HIMhywUgmNhdLVRilE95VGVKF2RDw80rJt+3DBAuHKxd
   tAeJmwd5JU2eLw5eNNYMs4p4L9CvJ9AP1jVEvfLnXjkyLTZMH9XQrlTFB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="419383539"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="419383539"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 05:12:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="851226145"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="851226145"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2023 05:12:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id B32E552F; Tue, 31 Oct 2023 14:12:32 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 7/7] xhci: minor coding style cleanup in 'xhci_try_enable_msi()'
Date: Tue, 31 Oct 2023 14:10:17 +0200
Message-ID: <20231031121017.41487-8-niklas.neronin@linux.intel.com>
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

Remove extra spaces/indentation and add spaces where required.
This commit does not change any functionality.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 742dd7f026e9..7fc6797c17ac 100644
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
2.40.1


