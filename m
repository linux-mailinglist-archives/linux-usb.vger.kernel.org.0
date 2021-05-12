Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946D037BF08
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 15:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhELN7v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 09:59:51 -0400
Received: from mga09.intel.com ([134.134.136.24]:48062 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230037AbhELN7u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 May 2021 09:59:50 -0400
IronPort-SDR: ydDbOzYDUXMF4jUjGk+2u4xep2EthKTJGWrq0so712qvP7cg0IRkZAs4TJ4ur8RwHCGphg1crQ
 Wqbas0JAmwmw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199764915"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="199764915"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 06:58:42 -0700
IronPort-SDR: SlzwjbCGEM35ra7IR2fXPXbxx+60F3yVNMozFSPvq05PM8vRnTt9EXtuJcjoBUwpsHCID+lxG4
 G9xHdvlJ8eeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="537693206"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 May 2021 06:58:40 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: Fix DEFINE for Intel Elkhart Lake
Date:   Wed, 12 May 2021 16:59:01 +0300
Message-Id: <20210512135901.28495-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Raymond Tan <raymond.tan@intel.com>

There's no separate low power (LP) version of Elkhart Lake, thus
this patch updates the PCI Device ID DEFINE to indicate this.

Signed-off-by: Raymond Tan <raymond.tan@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index e7b932dcbf820..8f43ca1c1c4b7 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -36,7 +36,7 @@
 #define PCI_DEVICE_ID_INTEL_CNPH		0xa36e
 #define PCI_DEVICE_ID_INTEL_CNPV		0xa3b0
 #define PCI_DEVICE_ID_INTEL_ICLLP		0x34ee
-#define PCI_DEVICE_ID_INTEL_EHLLP		0x4b7e
+#define PCI_DEVICE_ID_INTEL_EHL			0x4b7e
 #define PCI_DEVICE_ID_INTEL_TGPLP		0xa0ee
 #define PCI_DEVICE_ID_INTEL_TGPH		0x43ee
 #define PCI_DEVICE_ID_INTEL_JSP			0x4dee
@@ -166,7 +166,7 @@ static int dwc3_pci_quirks(struct dwc3_pci *dwc)
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
 		if (pdev->device == PCI_DEVICE_ID_INTEL_BXT ||
 		    pdev->device == PCI_DEVICE_ID_INTEL_BXT_M ||
-		    pdev->device == PCI_DEVICE_ID_INTEL_EHLLP) {
+		    pdev->device == PCI_DEVICE_ID_INTEL_EHL) {
 			guid_parse(PCI_INTEL_BXT_DSM_GUID, &dwc->guid);
 			dwc->has_dsm_for_pm = true;
 		}
@@ -374,8 +374,8 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ICLLP),
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_EHLLP),
-	  (kernel_ulong_t) &dwc3_pci_intel_swnode },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_EHL),
+	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGPLP),
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
-- 
2.30.2

