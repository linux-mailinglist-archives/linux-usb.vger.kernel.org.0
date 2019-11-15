Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47C1FFE32E
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 17:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbfKOQr4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 11:47:56 -0500
Received: from mga09.intel.com ([134.134.136.24]:15381 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727644AbfKOQr4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Nov 2019 11:47:56 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Nov 2019 08:47:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; 
   d="scan'208";a="208179203"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 15 Nov 2019 08:47:54 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/4] xhci-pci: Allow host runtime PM as default also for Intel Ice Lake xHCI
Date:   Fri, 15 Nov 2019 18:50:03 +0200
Message-Id: <1573836603-10871-5-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573836603-10871-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1573836603-10871-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

Intel Ice Lake has two xHCI controllers one on PCH and the other as part
of the CPU itself. The latter is also part of the so called Type C
Subsystem (TCSS) sharing ACPI power resources with the PCIe root ports
and the Thunderbolt controllers. In order to put the whole TCSS block
into D3cold the xHCI needs to be runtime suspended as well when idle.

For this reason allow runtime PM as default for Ice Lake TCSS xHCI
controller.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 1e0236e90687..a0025d23b257 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -48,6 +48,7 @@
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI		0x15e9
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI		0x15ec
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI		0x15f0
+#define PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI		0x8a13
 
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
@@ -212,7 +213,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	     pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI ||
-	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI))
+	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI ||
+	     pdev->device == PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI))
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if (pdev->vendor == PCI_VENDOR_ID_ETRON &&
-- 
2.7.4

