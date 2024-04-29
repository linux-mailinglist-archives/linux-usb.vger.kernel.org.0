Return-Path: <linux-usb+bounces-9907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E198B5ABE
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 027E11F21F14
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA92578B4E;
	Mon, 29 Apr 2024 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/XGLWBq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D04757F7
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399282; cv=none; b=Q//zsiujVlJnrU28XJZvxrQuAMyyL0VPyls5Y0XbIFrdBUK31vtBHRzBgB0Xo7QUdO6/QT531VjRFtecl8oQvebxfTNvXQOt99brpUVdAQeh0jYpZAPqm5wzHRTZLMPebBMdqUlxsU77+H9mfKba7c7wXX8f4ZnW+9ugt/vqoIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399282; c=relaxed/simple;
	bh=a5V+zK/1XdlyieapHpVstbqrdALLtIRPs6CDu3bU+Kw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DoPbFxYA+X5rPJmjZhTHS+fdZN5rASnHeHQMcfCMxasiwa/2Zqiz3KYdgpa/t35R0mbxmrZXb+jYapMlNiHhsCGY24ZWCWR7qUlp2rHJ7dJyBWoy/bFGMi0Ox+Yd8QBRhpjqOtL35IjL2Yy+yS+i80eKrQiWHCoYn97O/WS255c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/XGLWBq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399281; x=1745935281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a5V+zK/1XdlyieapHpVstbqrdALLtIRPs6CDu3bU+Kw=;
  b=L/XGLWBqS4d5AlZS3bHu1brF6+XHGl9/c9bOwxpeAbjS+px+9krJPMOt
   /aLXmFZtBF+gMifOZ6IXL28wl9qTXZ44Wpqb7MttirOqInspg85lavIzu
   Py/Bx7uhaKUAGZRBVdllXSOIpjTRoSbJUWYXMmMGk1Eo84FnHODL1aqOb
   kYLa6oOIz7Qcra7jAZ9f68Zi6YTcB/0O2bkGGFcyQXnioAArBOBO/BJL1
   yj3V79CKzkrBM+txyNQOTYo0FEb10dcE48k0nO6Vu/yD+WUYC/1z0x3gT
   gxhv0R4dIl3t5VWOwfL36b1tedjYeTRTG81Lr0FvX5unnB8WJrl38oBBQ
   Q==;
X-CSE-ConnectionGUID: vG2u1QDsQ/q9mKBPhZkTMg==
X-CSE-MsgGUID: bFelZL9/Sm2A27X1A8tuEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911512"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911512"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:20 -0700
X-CSE-ConnectionGUID: xYQSnqIVTTamkbkHC+oyvA==
X-CSE-MsgGUID: isRcltKPT/CcadADPHI7vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521892"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:18 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/18] xhci: pci: Use full names in PCI IDs for Intel platforms
Date: Mon, 29 Apr 2024 17:02:41 +0300
Message-Id: <20240429140245.3955523-15-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There are three out of many Intel platforms that are using TLAs
instead of the full names in the PCI IDs. Modify them accordingly.

This also fixes the logic of grouping as seemed to be by an LSB
byte of the ID.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 653b47c45591..d45c84062b61 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -45,8 +45,7 @@
 #define PCI_DEVICE_ID_INTEL_SUNRISEPOINT_LP_XHCI	0x9d2f
 #define PCI_DEVICE_ID_INTEL_BROXTON_M_XHCI		0x0aa8
 #define PCI_DEVICE_ID_INTEL_BROXTON_B_XHCI		0x1aa8
-#define PCI_DEVICE_ID_INTEL_APL_XHCI			0x5aa8
-#define PCI_DEVICE_ID_INTEL_DNV_XHCI			0x19d0
+#define PCI_DEVICE_ID_INTEL_APOLLO_LAKE_XHCI		0x5aa8
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_XHCI	0x15b5
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_XHCI	0x15b6
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_XHCI	0x15c1
@@ -55,9 +54,10 @@
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI		0x15e9
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI		0x15ec
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI		0x15f0
+#define PCI_DEVICE_ID_INTEL_DENVERTON_XHCI		0x19d0
 #define PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI		0x8a13
-#define PCI_DEVICE_ID_INTEL_CML_XHCI			0xa3af
 #define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
+#define PCI_DEVICE_ID_INTEL_COMET_LAKE_XHCI		0xa3af
 #define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI		0x51ed
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_N_PCH_XHCI	0x54ed
@@ -348,9 +348,9 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		 pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI ||
 		 pdev->device == PCI_DEVICE_ID_INTEL_BROXTON_M_XHCI ||
 		 pdev->device == PCI_DEVICE_ID_INTEL_BROXTON_B_XHCI ||
-		 pdev->device == PCI_DEVICE_ID_INTEL_APL_XHCI ||
-		 pdev->device == PCI_DEVICE_ID_INTEL_DNV_XHCI ||
-		 pdev->device == PCI_DEVICE_ID_INTEL_CML_XHCI)) {
+		 pdev->device == PCI_DEVICE_ID_INTEL_APOLLO_LAKE_XHCI ||
+		 pdev->device == PCI_DEVICE_ID_INTEL_DENVERTON_XHCI ||
+		 pdev->device == PCI_DEVICE_ID_INTEL_COMET_LAKE_XHCI)) {
 		xhci->quirks |= XHCI_PME_STUCK_QUIRK;
 	}
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
@@ -359,14 +359,14 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
 	    (pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_SUNRISEPOINT_LP_XHCI ||
-	     pdev->device == PCI_DEVICE_ID_INTEL_APL_XHCI))
+	     pdev->device == PCI_DEVICE_ID_INTEL_APOLLO_LAKE_XHCI))
 		xhci->quirks |= XHCI_INTEL_USB_ROLE_SW;
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
 	    (pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_SUNRISEPOINT_LP_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_SUNRISEPOINT_H_XHCI ||
-	     pdev->device == PCI_DEVICE_ID_INTEL_APL_XHCI ||
-	     pdev->device == PCI_DEVICE_ID_INTEL_DNV_XHCI))
+	     pdev->device == PCI_DEVICE_ID_INTEL_APOLLO_LAKE_XHCI ||
+	     pdev->device == PCI_DEVICE_ID_INTEL_DENVERTON_XHCI))
 		xhci->quirks |= XHCI_MISSING_CAS;
 
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
-- 
2.25.1


