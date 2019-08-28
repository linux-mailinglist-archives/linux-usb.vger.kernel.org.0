Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15707A082A
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 19:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfH1RJf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 13:09:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:23972 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726315AbfH1RJf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 13:09:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 10:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; 
   d="scan'208";a="171611704"
Received: from saranya-h97m-d3h.iind.intel.com ([10.66.247.130])
  by orsmga007.jf.intel.com with ESMTP; 28 Aug 2019 10:09:32 -0700
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     hdegoede@redhat.com, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, Saranya Gopal <saranya.gopal@intel.com>,
        Balaji Manoharan <m.balaji@intel.com>
Subject: [PATCH v3 1/2] xhci-ext-caps.c: Add property to disable Intel SW switch
Date:   Wed, 28 Aug 2019 22:25:31 +0530
Message-Id: <1567011332-22839-1-git-send-email-saranya.gopal@intel.com>
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
---
 changes from v2: Added suggested-by tag
 changes from v1: none

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

