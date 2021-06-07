Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2276D39DA71
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 13:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhFGLCB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 07:02:01 -0400
Received: from mga14.intel.com ([192.55.52.115]:36794 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230139AbhFGLCA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 07:02:00 -0400
IronPort-SDR: cSH0MPg7zQIPsH6kHEU7mVIiZ6VhD2YQb9Q4KW5+d/tN6NzKB5a+/3HA8hIVU0mA80CB8y/4eS
 bJl9XmDQC24Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="204414442"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="204414442"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 04:00:09 -0700
IronPort-SDR: VeMnx+xCN+2KFoEsIr5HGdA4a5sgdqk+c78juRIAwI2Ja7pWL1fKHz+CCi2AVzANDqgopDFurX
 DtPf8CA7B6mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="469046621"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2021 04:00:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 628AC147; Mon,  7 Jun 2021 14:00:30 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kernel test robot <lkp@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Azhar Shaikh <azhar.shaikh@intel.com>
Subject: [PATCH 2/5] thunderbolt: Add device links only when software connection manager is used
Date:   Mon,  7 Jun 2021 14:00:27 +0300
Message-Id: <20210607110030.38664-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
References: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We only need to set up the device links when software connection manager
path is used. The firmware connection manager does not need them and if
they are present they may even cause problems.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 67 ---------------------------------------
 drivers/thunderbolt/tb.c  | 67 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index a0386d1e3fc9..478bf6701145 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -17,7 +17,6 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/property.h>
-#include <linux/platform_data/x86/apple.h>
 
 #include "nhi.h"
 #include "nhi_regs.h"
@@ -1127,69 +1126,6 @@ static bool nhi_imr_valid(struct pci_dev *pdev)
 	return true;
 }
 
-/*
- * During suspend the Thunderbolt controller is reset and all PCIe
- * tunnels are lost. The NHI driver will try to reestablish all tunnels
- * during resume. This adds device links between the tunneled PCIe
- * downstream ports and the NHI so that the device core will make sure
- * NHI is resumed first before the rest.
- */
-static void tb_apple_add_links(struct tb_nhi *nhi)
-{
-	struct pci_dev *upstream, *pdev;
-
-	if (!x86_apple_machine)
-		return;
-
-	switch (nhi->pdev->device) {
-	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
-	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
-		break;
-	default:
-		return;
-	}
-
-	upstream = pci_upstream_bridge(nhi->pdev);
-	while (upstream) {
-		if (!pci_is_pcie(upstream))
-			return;
-		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
-			break;
-		upstream = pci_upstream_bridge(upstream);
-	}
-
-	if (!upstream)
-		return;
-
-	/*
-	 * For each hotplug downstream port, create add device link
-	 * back to NHI so that PCIe tunnels can be re-established after
-	 * sleep.
-	 */
-	for_each_pci_bridge(pdev, upstream->subordinate) {
-		const struct device_link *link;
-
-		if (!pci_is_pcie(pdev))
-			continue;
-		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
-		    !pdev->is_hotplug_bridge)
-			continue;
-
-		link = device_link_add(&pdev->dev, &nhi->pdev->dev,
-				       DL_FLAG_AUTOREMOVE_SUPPLIER |
-				       DL_FLAG_PM_RUNTIME);
-		if (link) {
-			dev_dbg(&nhi->pdev->dev, "created link from %s\n",
-				dev_name(&pdev->dev));
-		} else {
-			dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
-				 dev_name(&pdev->dev));
-		}
-	}
-}
-
 static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 {
 	struct tb *tb;
@@ -1278,9 +1214,6 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			return res;
 	}
 
-	tb_apple_add_links(nhi);
-	tb_acpi_add_links(nhi);
-
 	tb = nhi_select_cm(nhi);
 	if (!tb) {
 		dev_err(&nhi->pdev->dev,
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index bc6d568dbb89..2897a77d44c3 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "tb.h"
 #include "tb_regs.h"
@@ -1571,6 +1572,69 @@ static const struct tb_cm_ops tb_cm_ops = {
 	.disconnect_xdomain_paths = tb_disconnect_xdomain_paths,
 };
 
+/*
+ * During suspend the Thunderbolt controller is reset and all PCIe
+ * tunnels are lost. The NHI driver will try to reestablish all tunnels
+ * during resume. This adds device links between the tunneled PCIe
+ * downstream ports and the NHI so that the device core will make sure
+ * NHI is resumed first before the rest.
+ */
+static void tb_apple_add_links(struct tb_nhi *nhi)
+{
+	struct pci_dev *upstream, *pdev;
+
+	if (!x86_apple_machine)
+		return;
+
+	switch (nhi->pdev->device) {
+	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
+	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+		break;
+	default:
+		return;
+	}
+
+	upstream = pci_upstream_bridge(nhi->pdev);
+	while (upstream) {
+		if (!pci_is_pcie(upstream))
+			return;
+		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
+			break;
+		upstream = pci_upstream_bridge(upstream);
+	}
+
+	if (!upstream)
+		return;
+
+	/*
+	 * For each hotplug downstream port, create add device link
+	 * back to NHI so that PCIe tunnels can be re-established after
+	 * sleep.
+	 */
+	for_each_pci_bridge(pdev, upstream->subordinate) {
+		const struct device_link *link;
+
+		if (!pci_is_pcie(pdev))
+			continue;
+		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
+		    !pdev->is_hotplug_bridge)
+			continue;
+
+		link = device_link_add(&pdev->dev, &nhi->pdev->dev,
+				       DL_FLAG_AUTOREMOVE_SUPPLIER |
+				       DL_FLAG_PM_RUNTIME);
+		if (link) {
+			dev_dbg(&nhi->pdev->dev, "created link from %s\n",
+				dev_name(&pdev->dev));
+		} else {
+			dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
+				 dev_name(&pdev->dev));
+		}
+	}
+}
+
 struct tb *tb_probe(struct tb_nhi *nhi)
 {
 	struct tb_cm *tcm;
@@ -1594,5 +1658,8 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 
 	tb_dbg(tb, "using software connection manager\n");
 
+	tb_apple_add_links(nhi);
+	tb_acpi_add_links(nhi);
+
 	return tb;
 }
-- 
2.30.2

