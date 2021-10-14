Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D212642D8E8
	for <lists+linux-usb@lfdr.de>; Thu, 14 Oct 2021 14:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbhJNMMz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Oct 2021 08:12:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:24834 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230026AbhJNMMy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Oct 2021 08:12:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="225120144"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="225120144"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 05:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="659945530"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 14 Oct 2021 05:10:45 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 1/1] usb: xhci: Enable runtime-pm by default on AMD Yellow Carp platform
Date:   Thu, 14 Oct 2021 15:12:00 +0300
Message-Id: <20211014121200.75433-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014121200.75433-1-mathias.nyman@linux.intel.com>
References: <20211014121200.75433-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>

AMD's Yellow Carp platform supports runtime power management for
XHCI Controllers, so enable the same by default for all XHCI Controllers.

[ regrouped and aligned the PCI_DEVICE_ID definitions -Mathias]
Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---

v2: regroup and align the new PCI_DEVICE_ID definitions

drivers/usb/host/xhci-pci.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2c9f25ca8edd..57f097cdd2e5 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -64,6 +64,13 @@
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_2			0x43bb
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_1			0x43bc
+#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_1		0x161a
+#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_2		0x161b
+#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_3		0x161d
+#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_4		0x161e
+#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_5		0x15d6
+#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_6		0x15d7
+
 #define PCI_DEVICE_ID_ASMEDIA_1042_XHCI			0x1042
 #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI		0x1142
 #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI			0x1242
@@ -313,6 +320,15 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	     pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_4))
 		xhci->quirks |= XHCI_NO_SOFT_RETRY;
 
+	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
+	    (pdev->device == PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_1 ||
+	    pdev->device == PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_2 ||
+	    pdev->device == PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_3 ||
+	    pdev->device == PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_4 ||
+	    pdev->device == PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_5 ||
+	    pdev->device == PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_6))
+		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
+
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"QUIRK: Resetting on resume");
-- 
2.25.1

