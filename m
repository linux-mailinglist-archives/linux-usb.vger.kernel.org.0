Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 026CFA0637
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 17:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfH1PXc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 11:23:32 -0400
Received: from mga06.intel.com ([134.134.136.31]:7838 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbfH1PXb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 11:23:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 08:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; 
   d="scan'208";a="188251316"
Received: from saranya-h97m-d3h.iind.intel.com ([10.66.247.130])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2019 08:23:29 -0700
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     hdegoede@redhat.com, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, Saranya Gopal <saranya.gopal@intel.com>,
        Balaji Manoharan <m.balaji@intel.com>
Subject: [PATCH v2 2/2] usb: roles: intel: Enable static DRD mode for role switch
Date:   Wed, 28 Aug 2019 20:38:52 +0530
Message-Id: <1567004932-16967-3-git-send-email-saranya.gopal@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1567004932-16967-1-git-send-email-saranya.gopal@intel.com>
References: <1567004932-16967-1-git-send-email-saranya.gopal@intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable static DRD mode in Intel platforms which guarantees
successful role switch all the time. This fixes issues like
software role switch failure after cold boot and issue with
role switch when USB 3.0 cable is used. But, do not enable
static DRD mode for Cherrytrail devices which rely on firmware
for role switch.

Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
Signed-off-by: Balaji Manoharan <m.balaji@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/roles/intel-xhci-usb-role-switch.c | 28 +++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/roles/intel-xhci-usb-role-switch.c b/drivers/usb/roles/intel-xhci-usb-role-switch.c
index 277de96..a903bef 100644
--- a/drivers/usb/roles/intel-xhci-usb-role-switch.c
+++ b/drivers/usb/roles/intel-xhci-usb-role-switch.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/usb/role.h>
 
 /* register definition */
@@ -26,6 +27,12 @@
 #define SW_VBUS_VALID			BIT(24)
 #define SW_IDPIN_EN			BIT(21)
 #define SW_IDPIN			BIT(20)
+#define SW_SWITCH_EN			BIT(16)
+
+#define DRD_CONFIG_DYNAMIC		0
+#define DRD_CONFIG_STATIC_HOST		1
+#define DRD_CONFIG_STATIC_DEVICE	2
+#define DRD_CONFIG_MASK			3
 
 #define DUAL_ROLE_CFG1			0x6c
 #define HOST_MODE			BIT(29)
@@ -37,6 +44,7 @@
 struct intel_xhci_usb_data {
 	struct usb_role_switch *role_sw;
 	void __iomem *base;
+	bool enable_sw_switch;
 };
 
 static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
@@ -44,7 +52,7 @@ static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
 	struct intel_xhci_usb_data *data = dev_get_drvdata(dev);
 	unsigned long timeout;
 	acpi_status status;
-	u32 glk, val;
+	u32 glk, val, drd_config;
 
 	/*
 	 * On many CHT devices ACPI event (_AEI) handlers read / modify /
@@ -59,24 +67,35 @@ static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
 
 	pm_runtime_get_sync(dev);
 
-	/* Set idpin value as requested */
+	/*
+	 * Set idpin value as requested.
+	 * Since some devices rely on firmware setting DRD_CONFIG and
+	 * SW_SWITCH_EN bits to be zero for role switch,
+	 * do not set these bits for those devices.
+	 */
 	val = readl(data->base + DUAL_ROLE_CFG0);
 	switch (role) {
 	case USB_ROLE_NONE:
 		val |= SW_IDPIN;
 		val &= ~SW_VBUS_VALID;
+		drd_config = DRD_CONFIG_DYNAMIC;
 		break;
 	case USB_ROLE_HOST:
 		val &= ~SW_IDPIN;
 		val &= ~SW_VBUS_VALID;
+		drd_config = DRD_CONFIG_STATIC_HOST;
 		break;
 	case USB_ROLE_DEVICE:
 		val |= SW_IDPIN;
 		val |= SW_VBUS_VALID;
+		drd_config = DRD_CONFIG_STATIC_DEVICE;
 		break;
 	}
 	val |= SW_IDPIN_EN;
-
+	if (data->enable_sw_switch) {
+		val &= ~DRD_CONFIG_MASK;
+		val |= SW_SWITCH_EN | drd_config;
+	}
 	writel(val, data->base + DUAL_ROLE_CFG0);
 
 	acpi_release_global_lock(glk);
@@ -147,6 +166,9 @@ static int intel_xhci_usb_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
+	data->enable_sw_switch = !device_property_read_bool(dev,
+						"sw_switch_disable");
+
 	data->role_sw = usb_role_switch_register(dev, &sw_desc);
 	if (IS_ERR(data->role_sw))
 		return PTR_ERR(data->role_sw);
-- 
1.9.1

