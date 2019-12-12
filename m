Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF0F11C946
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 10:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbfLLJhR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 04:37:17 -0500
Received: from mga09.intel.com ([134.134.136.24]:52409 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728282AbfLLJhR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Dec 2019 04:37:17 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 01:37:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; 
   d="scan'208";a="220655372"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2019 01:37:14 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: add ID for the Intel Comet Lake -H variant
Date:   Thu, 12 Dec 2019 12:37:13 +0300
Message-Id: <20191212093713.60614-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The original ID that was added for Comet Lake PCH was
actually for the -LP (low power) variant even though the
constant for it said CMLH. Changing that while at it.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 023f0357efd7..294276f7deb9 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -29,7 +29,8 @@
 #define PCI_DEVICE_ID_INTEL_BXT_M		0x1aaa
 #define PCI_DEVICE_ID_INTEL_APL			0x5aaa
 #define PCI_DEVICE_ID_INTEL_KBP			0xa2b0
-#define PCI_DEVICE_ID_INTEL_CMLH		0x02ee
+#define PCI_DEVICE_ID_INTEL_CMLLP		0x02ee
+#define PCI_DEVICE_ID_INTEL_CMLH		0x06ee
 #define PCI_DEVICE_ID_INTEL_GLK			0x31aa
 #define PCI_DEVICE_ID_INTEL_CNPLP		0x9dee
 #define PCI_DEVICE_ID_INTEL_CNPH		0xa36e
@@ -308,6 +309,9 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MRFLD),
 	  (kernel_ulong_t) &dwc3_pci_mrfld_properties, },
 
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_CMLLP),
+	  (kernel_ulong_t) &dwc3_pci_intel_properties, },
+
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_CMLH),
 	  (kernel_ulong_t) &dwc3_pci_intel_properties, },
 
-- 
2.24.0

