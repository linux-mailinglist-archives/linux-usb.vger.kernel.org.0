Return-Path: <linux-usb+bounces-3564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0360800DF8
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CDDF28270D
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44231495C7;
	Fri,  1 Dec 2023 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aD8WZdR8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E8ED6C
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443172; x=1732979172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gafGrxk/um2/83hkmZW9t1GIqfBSudbPSKJUh3zbOBo=;
  b=aD8WZdR8SFCw6FTyOt5+EOmcpV84jiBvyTDbmSn7B2DWUWl5uTfNu1N3
   lAbTh75k4mfu/1xuw8MNvtSLYQL7msRulBtClXONvUVHHl0qz2aOjFcOY
   QzPEhWortWLvvN2WHAft8fv6JHS4WKd985IZsKznfNqupfbTlL8e/zLG/
   UFWMEgdrz1i0/YxoD3k2XAkt/oNNhq1rhnAGuJS8xpreHm1yQhq5GDcGt
   owiTzhkFanTJ87rX0utgv6ylkelIobB7QxTdHmQYp2Ua7i1tyA0bXG1ld
   czAt1/lG4apJX95Z5iSj73RGify8JhkE2q5xe5jWhsovyVpH2NqQKrFPd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309768"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309768"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:06:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112658"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112658"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:06:09 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 17/19] xhci: minor coding style cleanup in 'xhci_try_enable_msi()'
Date: Fri,  1 Dec 2023 17:06:45 +0200
Message-Id: <20231201150647.1307406-18-mathias.nyman@linux.intel.com>
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


