Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01136A0636
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 17:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfH1PX1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 11:23:27 -0400
Received: from mga06.intel.com ([134.134.136.31]:7838 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbfH1PX0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 11:23:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 08:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; 
   d="scan'208";a="188251301"
Received: from saranya-h97m-d3h.iind.intel.com ([10.66.247.130])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2019 08:23:23 -0700
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     hdegoede@redhat.com, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, Saranya Gopal <saranya.gopal@intel.com>,
        Balaji Manoharan <m.balaji@intel.com>
Subject: [PATCH v2 1/2] xhci-ext-caps.c: Add property to disable Intel SW switch
Date:   Wed, 28 Aug 2019 20:38:51 +0530
Message-Id: <1567004932-16967-2-git-send-email-saranya.gopal@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1567004932-16967-1-git-send-email-saranya.gopal@intel.com>
References: <1567004932-16967-1-git-send-email-saranya.gopal@intel.com>
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
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
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

