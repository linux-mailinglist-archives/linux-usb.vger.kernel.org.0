Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC1049D1B2
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 16:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732504AbfHZOch (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 10:32:37 -0400
Received: from mga18.intel.com ([134.134.136.126]:18240 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfHZOch (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Aug 2019 10:32:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 07:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; 
   d="scan'208";a="197067735"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2019 07:32:34 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org, Saranya Gopal <saranya.gopal@intel.com>,
        Balaji Manoharan <m.balaji@intel.com>
Subject: [PATCH 2/2] usb: roles: intel: Enable static DRD mode for role switch
Date:   Mon, 26 Aug 2019 17:32:30 +0300
Message-Id: <20190826143230.59807-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190826143230.59807-1-heikki.krogerus@linux.intel.com>
References: <20190826143230.59807-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Saranya Gopal <saranya.gopal@intel.com>

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
 .../usb/roles/intel-xhci-usb-role-switch.c    | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/roles/intel-xhci-usb-role-switch.c b/drivers/usb/roles/intel-xhci-usb-role-switch.c
index 7325a84dd1c8..9101ff94c8d2 100644
--- a/drivers/usb/roles/intel-xhci-usb-role-switch.c
+++ b/drivers/usb/roles/intel-xhci-usb-role-switch.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/usb/role.h>
 
 /* register definition */
@@ -26,6 +27,9 @@
 #define SW_VBUS_VALID			BIT(24)
 #define SW_IDPIN_EN			BIT(21)
 #define SW_IDPIN			BIT(20)
+#define SW_SWITCH_EN_CFG0		BIT(16)
+#define SW_DRD_STATIC_HOST_CFG0		1
+#define SW_DRD_STATIC_DEV_CFG0		2
 
 #define DUAL_ROLE_CFG1			0x6c
 #define HOST_MODE			BIT(29)
@@ -37,6 +41,7 @@
 struct intel_xhci_usb_data {
 	struct usb_role_switch *role_sw;
 	void __iomem *base;
+	bool disable_sw_switch;
 };
 
 static const struct software_node intel_xhci_usb_node = {
@@ -63,23 +68,39 @@ static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
 
 	pm_runtime_get_sync(dev);
 
-	/* Set idpin value as requested */
+	/*
+	 * Set idpin value as requested.
+	 * Since some devices rely on firmware setting DRD_CONFIG and
+	 * SW_SWITCH_EN_CFG0 bits to be zero for role switch,
+	 * do not set these bits for those devices.
+	 */
 	val = readl(data->base + DUAL_ROLE_CFG0);
 	switch (role) {
 	case USB_ROLE_NONE:
 		val |= SW_IDPIN;
 		val &= ~SW_VBUS_VALID;
+		val &= ~(SW_DRD_STATIC_DEV_CFG0 | SW_DRD_STATIC_HOST_CFG0);
 		break;
 	case USB_ROLE_HOST:
 		val &= ~SW_IDPIN;
 		val &= ~SW_VBUS_VALID;
+		if (!data->disable_sw_switch) {
+			val &= ~SW_DRD_STATIC_DEV_CFG0;
+			val |= SW_DRD_STATIC_HOST_CFG0;
+		}
 		break;
 	case USB_ROLE_DEVICE:
 		val |= SW_IDPIN;
 		val |= SW_VBUS_VALID;
+		if (!data->disable_sw_switch) {
+			val &= ~SW_DRD_STATIC_HOST_CFG0;
+			val |= SW_DRD_STATIC_DEV_CFG0;
+		}
 		break;
 	}
 	val |= SW_IDPIN_EN;
+	if (!data->disable_sw_switch)
+		val |= SW_SWITCH_EN_CFG0;
 
 	writel(val, data->base + DUAL_ROLE_CFG0);
 
@@ -156,6 +177,9 @@ static int intel_xhci_usb_probe(struct platform_device *pdev)
 	sw_desc.allow_userspace_control = true,
 	sw_desc.fwnode = software_node_fwnode(&intel_xhci_usb_node);
 
+	data->disable_sw_switch = device_property_read_bool(dev,
+						"sw_switch_disable");
+
 	data->role_sw = usb_role_switch_register(dev, &sw_desc);
 	if (IS_ERR(data->role_sw)) {
 		fwnode_handle_put(sw_desc.fwnode);
-- 
2.23.0.rc1

