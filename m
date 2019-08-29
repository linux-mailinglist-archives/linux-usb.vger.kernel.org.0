Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30103A199D
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 14:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfH2MKB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 08:10:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:34525 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725990AbfH2MKB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 08:10:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Aug 2019 05:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; 
   d="scan'208";a="185950356"
Received: from saranya-h97m-d3h.iind.intel.com ([10.66.247.130])
  by orsmga006.jf.intel.com with ESMTP; 29 Aug 2019 05:09:58 -0700
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     hdegoede@redhat.com, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, Saranya Gopal <saranya.gopal@intel.com>,
        Balaji Manoharan <m.balaji@intel.com>
Subject: [PATCH v5 2/2] usb: roles: intel: Enable static DRD mode for role switch
Date:   Thu, 29 Aug 2019 17:26:00 +0530
Message-Id: <1567079760-24822-2-git-send-email-saranya.gopal@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1567079760-24822-1-git-send-email-saranya.gopal@intel.com>
References: <1567079760-24822-1-git-send-email-saranya.gopal@intel.com>
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
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>
---
changes since v4: Rebased on top of devprop branch in linux-pm.git
		  Added Reviewed-by and Tested-by tags
changes since v3: Initialized drd_config variable to fix warning
changes since v2: Revised SoB tags
changes since v1: Added drd_config to avoid multiple if checks
                  Other minor changes suggested by Hans

 drivers/usb/roles/intel-xhci-usb-role-switch.c | 27 ++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/roles/intel-xhci-usb-role-switch.c b/drivers/usb/roles/intel-xhci-usb-role-switch.c
index 7325a84..4098513 100644
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
 
 static const struct software_node intel_xhci_usb_node = {
@@ -49,6 +57,7 @@ static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
 	unsigned long timeout;
 	acpi_status status;
 	u32 glk, val;
+	u32 drd_config = DRD_CONFIG_DYNAMIC;
 
 	/*
 	 * On many CHT devices ACPI event (_AEI) handlers read / modify /
@@ -63,24 +72,35 @@ static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
 
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
@@ -156,6 +176,9 @@ static int intel_xhci_usb_probe(struct platform_device *pdev)
 	sw_desc.allow_userspace_control = true,
 	sw_desc.fwnode = software_node_fwnode(&intel_xhci_usb_node);
 
+	data->enable_sw_switch = !device_property_read_bool(dev,
+						"sw_switch_disable");
+
 	data->role_sw = usb_role_switch_register(dev, &sw_desc);
 	if (IS_ERR(data->role_sw)) {
 		fwnode_handle_put(sw_desc.fwnode);
-- 
1.9.1

