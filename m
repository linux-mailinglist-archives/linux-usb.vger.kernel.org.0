Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA015A199B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 14:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfH2MJ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 08:09:56 -0400
Received: from mga05.intel.com ([192.55.52.43]:62896 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726416AbfH2MJz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 08:09:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Aug 2019 05:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; 
   d="scan'208";a="185950338"
Received: from saranya-h97m-d3h.iind.intel.com ([10.66.247.130])
  by orsmga006.jf.intel.com with ESMTP; 29 Aug 2019 05:09:52 -0700
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     hdegoede@redhat.com, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, Saranya Gopal <saranya.gopal@intel.com>,
        Balaji Manoharan <m.balaji@intel.com>
Subject: [PATCH v5 1/2] xhci-ext-caps.c: Add property to disable Intel SW switch
Date:   Thu, 29 Aug 2019 17:25:59 +0530
Message-Id: <1567079760-24822-1-git-send-email-saranya.gopal@intel.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In platforms like Cherrytrail, 'SW switch enable' bit
should not be enabled for role switch. This patch
adds a property to Intel USB Role Switch platform driver
to denote that SW switch should be disabled in
Cherrytrail devices.

Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
Signed-off-by: Balaji Manoharan <m.balaji@intel.com>
Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
changes since v4: Added Reviewed-by tag
changes since v3: none
changes since v2: Added Suggested-by tag
changes since v1: none

 drivers/usb/host/xhci-ext-caps.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/host/xhci-ext-caps.c b/drivers/usb/host/xhci-ext-caps.c
index 399113f..f498160 100644
--- a/drivers/usb/host/xhci-ext-caps.c
+++ b/drivers/usb/host/xhci-ext-caps.c
@@ -6,11 +6,20 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/pci.h>
 #include "xhci.h"
 
 #define USB_SW_DRV_NAME		"intel_xhci_usb_sw"
 #define USB_SW_RESOURCE_SIZE	0x400
 
+#define PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI	0x22b5
+
+static const struct property_entry role_switch_props[] = {
+	PROPERTY_ENTRY_BOOL("sw_switch_disable"),
+	{},
+};
+
 static void xhci_intel_unregister_pdev(void *arg)
 {
 	platform_device_unregister(arg);
@@ -21,6 +30,7 @@ static int xhci_create_intel_xhci_sw_pdev(struct xhci_hcd *xhci, u32 cap_offset)
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct device *dev = hcd->self.controller;
 	struct platform_device *pdev;
+	struct pci_dev *pci = to_pci_dev(dev);
 	struct resource	res = { 0, };
 	int ret;
 
@@ -43,6 +53,14 @@ static int xhci_create_intel_xhci_sw_pdev(struct xhci_hcd *xhci, u32 cap_offset)
 		return ret;
 	}
 
+	if (pci->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI) {
+		ret = platform_device_add_properties(pdev, role_switch_props);
+		if (ret) {
+			dev_err(dev, "failed to register device properties\n");
+			return ret;
+		}
+	}
+
 	pdev->dev.parent = dev;
 
 	ret = platform_device_add(pdev);
-- 
1.9.1

