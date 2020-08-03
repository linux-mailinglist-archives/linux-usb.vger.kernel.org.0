Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4783B23AC2E
	for <lists+linux-usb@lfdr.de>; Mon,  3 Aug 2020 20:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgHCSNW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Aug 2020 14:13:22 -0400
Received: from mga06.intel.com ([134.134.136.31]:52749 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgHCSNV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Aug 2020 14:13:21 -0400
IronPort-SDR: UbW3/MdaP77GWuZvOrORHYDtbSobF6waWWJNGvoC4i1qvUovCxslXb1WIJQ5TaO0rK8yhUCi7s
 HDCauZAykVCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="213714900"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="213714900"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 11:13:21 -0700
IronPort-SDR: sOazMXIfDBWzsyJOQmnr7rSfIFeoxqfTOunlRtBZ//1Wc7cqgqq5VCI5MYUtwrOp8+Ke/WKPCW
 kiBHt0Xfdhcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="324226595"
Received: from swbkc-rack4.png.intel.com ([172.30.249.178])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2020 11:13:20 -0700
From:   Raymond Tan <raymond.tan@intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Raymond Tan <raymond.tan@intel.com>
Subject: [PATCH 1/2] usb: dwc3: pci: Fix DEFINE for Intel Elkhart Lake
Date:   Tue,  4 Aug 2020 02:11:23 +0800
Message-Id: <1596478284-69661-2-git-send-email-raymond.tan@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478284-69661-1-git-send-email-raymond.tan@intel.com>
References: <1596478284-69661-1-git-send-email-raymond.tan@intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There's no separate low power (LP) version of Elkhart Lake, thus
this patch updates the PCI Device ID DEFINE to indicate this.

Signed-off-by: Raymond Tan <raymond.tan@intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index f420d7d..4f436b3 100644
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
@@ -356,7 +356,7 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ICLLP),
 	  (kernel_ulong_t) &dwc3_pci_intel_properties, },
 
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_EHLLP),
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_EHL),
 	  (kernel_ulong_t) &dwc3_pci_intel_properties, },
 
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGPLP),
-- 
2.7.4

