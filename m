Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB71357E12
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 10:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhDHIbp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 04:31:45 -0400
Received: from mga04.intel.com ([192.55.52.120]:55530 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229554AbhDHIbk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Apr 2021 04:31:40 -0400
IronPort-SDR: z3W1hmNVasopQiENwElJapKhyARicgvpZ8TsezWcEWGP9NLG1i/YzLtICmHDwXblxE+CfyCup7
 oryvg2G0QsSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="191333097"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; 
   d="scan'208";a="191333097"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 01:31:29 -0700
IronPort-SDR: WWU9AKY8NzDwksFU68+R3bgy/nFgDNnazOC2Tb3wS9dc0UZ+1NykzOgaGRb9M+ZDdDjVb7tCiJ
 8d0SXJefquQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; 
   d="scan'208";a="519767925"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2021 01:31:28 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: add support for the Intel Alder Lake-M
Date:   Thu,  8 Apr 2021 11:31:44 +0300
Message-Id: <20210408083144.69350-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds the necessary PCI ID for Intel Alder Lake-M
devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 4c5c6972124a4..95f954a1d7be9 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -41,6 +41,7 @@
 #define PCI_DEVICE_ID_INTEL_TGPH		0x43ee
 #define PCI_DEVICE_ID_INTEL_JSP			0x4dee
 #define PCI_DEVICE_ID_INTEL_ADLP		0x51ee
+#define PCI_DEVICE_ID_INTEL_ADLM		0x54ee
 #define PCI_DEVICE_ID_INTEL_ADLS		0x7ae1
 #define PCI_DEVICE_ID_INTEL_TGL			0x9a15
 
@@ -388,6 +389,9 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADLP),
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADLM),
+	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
+
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADLS),
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
-- 
2.30.2

