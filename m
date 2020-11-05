Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 053862A7C82
	for <lists+linux-usb@lfdr.de>; Thu,  5 Nov 2020 12:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgKELAe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 06:00:34 -0500
Received: from mga12.intel.com ([192.55.52.136]:14533 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbgKELAe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Nov 2020 06:00:34 -0500
IronPort-SDR: Z8PQfEDWqwIfmu+mBPh+jUI7d+MzS2bZvur1nMo4sdlliz2UoDX9qeDKmSPq9JNotWPdwYvGB4
 Pnh1sw2ovRnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="148642538"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="148642538"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 03:00:33 -0800
IronPort-SDR: QGvzJNYN6F85Y52CIaYREDGsw01nqY+MkNTpxfTYecvOUG3446zFvZoHQGfVf+CVSH32ZuTjQi
 ohh4e2nNwaFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="358387080"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2020 03:00:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D30DD252; Thu,  5 Nov 2020 13:00:31 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Mathias Nyman <mathias.nyman@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH] xhci-pci: Allow host runtime PM as default for Intel Maple Ridge xHCI
Date:   Thu,  5 Nov 2020 14:00:31 +0300
Message-Id: <20201105110031.8691-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Intel Maple Ridge is successor of Titan Ridge Thunderbolt controller. As
Titan Ridge this one also includes xHCI host controller. In order to
safe energy we should put it to low power state by default when idle.
For this reason allow host runtime PM for Maple Ridge.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index bf89172c43ca..d17e463087df 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -55,6 +55,7 @@
 #define PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI		0x8a13
 #define PCI_DEVICE_ID_INTEL_CML_XHCI			0xa3af
 #define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
+#define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
 
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
@@ -238,7 +239,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI ||
-	     pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI))
+	     pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI ||
+	     pdev->device == PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI))
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if (pdev->vendor == PCI_VENDOR_ID_ETRON &&
-- 
2.28.0

