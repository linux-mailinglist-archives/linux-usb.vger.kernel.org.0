Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182782D27B1
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 10:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbgLHJbL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 04:31:11 -0500
Received: from mga06.intel.com ([134.134.136.31]:9880 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727647AbgLHJbJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Dec 2020 04:31:09 -0500
IronPort-SDR: EpuG0Is5mpxz04LUMxvuNPg59oPi5mfayyu3HbtnQ/YESagqJ3XE4X5LwxuV54FKHhwPHoVe+Q
 /vgF5fFs1Giw==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="235460690"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="235460690"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 01:28:05 -0800
IronPort-SDR: WxvaFur0yDIiDmMlYGy9Zgfon1C4YclRnrikl+aJzSNBGdUudJhgcNpXnXYd6bfpdo5FIiLjHI
 VnwGSkWX+04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="552165906"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2020 01:28:04 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/5] xhci-pci: Allow host runtime PM as default for Intel Maple Ridge xHCI
Date:   Tue,  8 Dec 2020 11:29:11 +0200
Message-Id: <20201208092912.1773650-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208092912.1773650-1-mathias.nyman@linux.intel.com>
References: <20201208092912.1773650-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

Intel Maple Ridge is successor of Titan Ridge Thunderbolt controller. As
Titan Ridge this one also includes xHCI host controller. In order to
safe energy we should put it to low power state by default when idle.
For this reason allow host runtime PM for Maple Ridge.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 5f94d7edeb37..84da8406d5b4 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -56,6 +56,7 @@
 #define PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI		0x8a13
 #define PCI_DEVICE_ID_INTEL_CML_XHCI			0xa3af
 #define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
+#define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
 
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
@@ -240,7 +241,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI ||
-	     pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI))
+	     pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI ||
+	     pdev->device == PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI))
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if (pdev->vendor == PCI_VENDOR_ID_ETRON &&
-- 
2.25.1

