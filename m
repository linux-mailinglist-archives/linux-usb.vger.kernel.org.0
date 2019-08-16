Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1294B8FDF7
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2019 10:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbfHPIg5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 16 Aug 2019 04:36:57 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:53808 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIg5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Aug 2019 04:36:57 -0400
IronPort-SDR: TRyk/VF6jvmqzP9E/nx4luuXoDWuJxfLgDgjqHBUa/oJvjQz+Zs0JFl2q5zkRN01r+z56IHMCe
 DCXfo1RKopNeH+8Yf/+OYnky6bL2ZJZcdxVL+tWavE4zDQ/zdcIy+EBO2SwIGjVMUDFuRp31m8
 uPvHIa1BCP0MYvyyd9k2kMHLoPCX5Gy61md7DJr21fdyxgoIvl9+CMykUg9EBwueLeVttVSGP7
 sk3vdUHtz6/fLsqbUXnQMC8We8Pja+tqNcOg7KLQq+qsFF+rsulW/NwpqshAu8RuyNuQWstd+W
 WxU=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="42311325"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:36:56 -0800
IronPort-SDR: 4Hbe1dKx3w5LEQDoF+Fk6znAM7hhzZ6P1riknYvshPIEj8jTrODkBybPG6po1lbqGPVB74ww4U
 33QceHDi0FJyxfNKF0QzBEKgRM7pkvPQQ8kI9UkBmhmK8PAbmg3sqMcxMP89uJSGPJ9BgAma6E
 DoU3OyIrC3PH6ji8Yb7lJGAPeohta5l9ljXJZ5aCCrjCRE4YLkWXdlBxr1AkKkMCZNc71aoaye
 K75u5Si5CXMYTJbhOPwzlE8AtQB/FwV8lbw9Oxjtv+pW/CEl5A46r0G1yFvSZj90BwwZ+UQVDt
 2DE=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH v3] usb: xhci-pci: reorder removal to avoid use-after-free
Thread-Topic: [PATCH v3] usb: xhci-pci: reorder removal to avoid
 use-after-free
Thread-Index: AQHVVA0wFGLzc3brcEWCOIA9H/QeDQ==
Date:   Fri, 16 Aug 2019 08:36:51 +0000
Message-ID: <1565944612083.89953@mentor.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On driver removal, the platform_device_unregister call
attached through devm_add_action_or_reset was executed
after usb_hcd_pci_remove.
This lead to a use-after-free for the iomem resource of
the xhci-ext-caps driver in the platform removal
because the parent of the resource was freed earlier.

Fix this by reordering of the removal sequence.

Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Carsten Schmid <carsten_schmid@mentor.com>
---
Rationale:
Use-after-free was reproduced on 4.14.102 and 4.14.129 kernel
using unbind mechanism.
echo 0000:00:15.0 > /sys/bus/pci/drivers/xhci_hcd/unbind

Upstream version of driver is identical in the affected code.
Fix was tested successfully on 4.14.102 and 4.14.129.
Provided patch applies and compiles on v5.2.7 stable.
As this is a bugfix, please consider it to go to stable trees too.
---
v2:
   - more speaking name for private data element
   - consider failure in driver init sequence
   - fix minor issues found by checkpatch.pl
v3:
   - corrected typo: resorce -> resource
   - added Reviewed by and Tested-by
---
 drivers/usb/host/xhci-ext-caps.c | 25 +++++++++++++++----------
 drivers/usb/host/xhci-pci.c      |  8 +++++++-
 drivers/usb/host/xhci-pci.h      | 20 ++++++++++++++++++++
 drivers/usb/host/xhci.h          |  1 +
 4 files changed, 43 insertions(+), 11 deletions(-)
 create mode 100644 drivers/usb/host/xhci-pci.h

diff --git a/drivers/usb/host/xhci-ext-caps.c b/drivers/usb/host/xhci-ext-caps.c
index 399113f9fc5c..28a7d53ecf2c 100644
--- a/drivers/usb/host/xhci-ext-caps.c
+++ b/drivers/usb/host/xhci-ext-caps.c
@@ -7,21 +7,19 @@
 
 #include <linux/platform_device.h>
 #include "xhci.h"
+#include "xhci-pci.h"
 
 #define USB_SW_DRV_NAME		"intel_xhci_usb_sw"
 #define USB_SW_RESOURCE_SIZE	0x400
 
-static void xhci_intel_unregister_pdev(void *arg)
-{
-	platform_device_unregister(arg);
-}
-
 static int xhci_create_intel_xhci_sw_pdev(struct xhci_hcd *xhci, u32 cap_offset)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct device *dev = hcd->self.controller;
 	struct platform_device *pdev;
 	struct resource	res = { 0, };
+	struct xhci_pci_priv *priv = (struct xhci_pci_priv *)xhci->priv;
+
 	int ret;
 
 	pdev = platform_device_alloc(USB_SW_DRV_NAME, PLATFORM_DEVID_NONE);
@@ -52,11 +50,7 @@ static int xhci_create_intel_xhci_sw_pdev(struct xhci_hcd *xhci, u32 cap_offset)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev, xhci_intel_unregister_pdev, pdev);
-	if (ret) {
-		dev_err(dev, "couldn't add unregister action for intel_xhci_usb_sw pdev\n");
-		return ret;
-	}
+	priv->role_switch_pdev = pdev;
 
 	return 0;
 }
@@ -88,3 +82,14 @@ int xhci_ext_cap_init(struct xhci_hcd *xhci)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_ext_cap_init);
+
+void xhci_ext_cap_remove(struct xhci_hcd *xhci)
+{
+	struct xhci_pci_priv *priv = (struct xhci_pci_priv *)xhci->priv;
+
+	if (priv->role_switch_pdev) {
+		platform_device_unregister(priv->role_switch_pdev);
+		priv->role_switch_pdev = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(xhci_ext_cap_remove);
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index c2fe218e051f..f2201f380c17 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 
 #include "xhci.h"
+#include "xhci-pci.h"
 #include "xhci-trace.h"
 
 #define SSIC_PORT_NUM		2
@@ -62,6 +63,7 @@ static struct hc_driver __read_mostly xhci_pci_hc_driver;
 static int xhci_pci_setup(struct usb_hcd *hcd);
 
 static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
+	.extra_priv_size = sizeof(struct xhci_pci_priv),
 	.reset = xhci_pci_setup,
 };
 
@@ -350,7 +352,7 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	retval = usb_add_hcd(xhci->shared_hcd, dev->irq,
 			IRQF_SHARED);
 	if (retval)
-		goto put_usb3_hcd;
+		goto remove_ext_cap;
 	/* Roothub already marked as USB 3.0 speed */
 
 	if (!(xhci->quirks & XHCI_BROKEN_STREAMS) &&
@@ -368,6 +370,8 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	return 0;
 
+remove_ext_cap:
+	xhci_ext_cap_remove(xhci);
 put_usb3_hcd:
 	usb_put_hcd(xhci->shared_hcd);
 dealloc_usb2_hcd:
@@ -393,6 +397,8 @@ static void xhci_pci_remove(struct pci_dev *dev)
 		xhci->shared_hcd = NULL;
 	}
 
+	xhci_ext_cap_remove(xhci);
+
 	/* Workaround for spurious wakeups at shutdown with HSW */
 	if (xhci->quirks & XHCI_SPURIOUS_WAKEUP)
 		pci_set_power_state(dev, PCI_D3hot);
diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
new file mode 100644
index 000000000000..fc0cde231679
--- /dev/null
+++ b/drivers/usb/host/xhci-pci.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * xhci-pci.h - xHCI extended capability handling platform Glue.
+ *
+ * Copyright (C) 2019 Mentor Graphics (Deutschland) GmbH
+ * Derived from xhci-plat.h
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ */
+
+#ifndef _XHCI_PCI_H
+#define _XHCI_PCI_H
+
+struct xhci_pci_priv {
+	struct platform_device *role_switch_pdev;
+};
+
+#endif	/* _XHCI_PCI_H */
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index fabbce1c542a..847d2021fc2c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2052,6 +2052,7 @@ void xhci_init_driver(struct hc_driver *drv,
 		      const struct xhci_driver_overrides *over);
 int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id);
 int xhci_ext_cap_init(struct xhci_hcd *xhci);
+void xhci_ext_cap_remove(struct xhci_hcd *xhci);
 
 int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup);
 int xhci_resume(struct xhci_hcd *xhci, bool hibernated);
-- 
2.17.1

