Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB9176E50F
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 11:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbjHCJ4M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 05:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232454AbjHCJ4L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 05:56:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A625C126
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 02:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691056569; x=1722592569;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FT5GYeCVzZJLD1WIflhrjEaraza87Xt8K3wEyR9PAEU=;
  b=M2aJ63fr1/xxtrOiEG7Q1mXQohOt3uBAVwmJd1d5FDxy6ljp1utOj1UK
   8sXuxSyJ3ixblo9KFVoYvx9g0YAFDnmllku1f56+IBUB5DsOtHVltBDJb
   y//VH7Egj78j7/VyDdkDYKjz3c/t7veRYhHYVNwHXmtu82IX9mXMUvwnV
   7gWEcXd+7HrX9pejQ6sZaTBngAZ7eR+tjjFwXtmES8UrovOsqf1iwvK+s
   9ewY0+xYb2XThwMiG2V4DM8+xhwj//GtC8ayqPKpNN5FMgw2KLM3Cp09t
   5TN4koBnckp8A6vuZUUA8c/uUqtoT61FnIpMX9dKH5/GyZk8+xYVZTkI/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="456207787"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="456207787"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 02:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="819582206"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="819582206"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2023 02:56:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7E5CF13F; Thu,  3 Aug 2023 12:56:18 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] thunderbolt: Log a warning if device links are not found
Date:   Thu,  3 Aug 2023 12:56:16 +0300
Message-Id: <20230803095618.56001-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The software connection manager needs the device links in order to
establish the tunnels before the native protocols so log a warning if
they are not found.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/acpi.c | 18 +++++++++++++-----
 drivers/thunderbolt/tb.c   | 24 +++++++++++++++++-------
 drivers/thunderbolt/tb.h   |  4 ++--
 3 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
index 38fefd0e5268..c9b6bb46111c 100644
--- a/drivers/thunderbolt/acpi.c
+++ b/drivers/thunderbolt/acpi.c
@@ -12,7 +12,7 @@
 #include "tb.h"
 
 static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
-				    void **return_value)
+				    void **ret)
 {
 	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
 	struct fwnode_handle *fwnode;
@@ -84,6 +84,7 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 		if (link) {
 			dev_dbg(&nhi->pdev->dev, "created link from %s\n",
 				dev_name(&pdev->dev));
+			*(bool *)ret = true;
 		} else {
 			dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
 				 dev_name(&pdev->dev));
@@ -104,22 +105,29 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
  * Goes over ACPI namespace finding tunneled ports that reference to
  * @nhi ACPI node. For each reference a device link is added. The link
  * is automatically removed by the driver core.
+ *
+ * Returns %true if at least one link was created.
  */
-void tb_acpi_add_links(struct tb_nhi *nhi)
+bool tb_acpi_add_links(struct tb_nhi *nhi)
 {
 	acpi_status status;
+	bool ret = false;
 
 	if (!has_acpi_companion(&nhi->pdev->dev))
-		return;
+		return false;
 
 	/*
 	 * Find all devices that have usb4-host-controller interface
 	 * property that references to this NHI.
 	 */
 	status = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 32,
-				     tb_acpi_add_link, NULL, nhi, NULL);
-	if (ACPI_FAILURE(status))
+				     tb_acpi_add_link, NULL, nhi, (void **)&ret);
+	if (ACPI_FAILURE(status)) {
 		dev_warn(&nhi->pdev->dev, "failed to enumerate tunneled ports\n");
+		return false;
+	}
+
+	return ret;
 }
 
 /**
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 3fb4553a6442..dd0a1ef8cf12 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2368,12 +2368,13 @@ static const struct tb_cm_ops tb_cm_ops = {
  * downstream ports and the NHI so that the device core will make sure
  * NHI is resumed first before the rest.
  */
-static void tb_apple_add_links(struct tb_nhi *nhi)
+static bool tb_apple_add_links(struct tb_nhi *nhi)
 {
 	struct pci_dev *upstream, *pdev;
+	bool ret;
 
 	if (!x86_apple_machine)
-		return;
+		return false;
 
 	switch (nhi->pdev->device) {
 	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
@@ -2382,26 +2383,27 @@ static void tb_apple_add_links(struct tb_nhi *nhi)
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
 		break;
 	default:
-		return;
+		return false;
 	}
 
 	upstream = pci_upstream_bridge(nhi->pdev);
 	while (upstream) {
 		if (!pci_is_pcie(upstream))
-			return;
+			return false;
 		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
 			break;
 		upstream = pci_upstream_bridge(upstream);
 	}
 
 	if (!upstream)
-		return;
+		return false;
 
 	/*
 	 * For each hotplug downstream port, create add device link
 	 * back to NHI so that PCIe tunnels can be re-established after
 	 * sleep.
 	 */
+	ret = false;
 	for_each_pci_bridge(pdev, upstream->subordinate) {
 		const struct device_link *link;
 
@@ -2417,11 +2419,14 @@ static void tb_apple_add_links(struct tb_nhi *nhi)
 		if (link) {
 			dev_dbg(&nhi->pdev->dev, "created link from %s\n",
 				dev_name(&pdev->dev));
+			ret = true;
 		} else {
 			dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
 				 dev_name(&pdev->dev));
 		}
 	}
+
+	return ret;
 }
 
 struct tb *tb_probe(struct tb_nhi *nhi)
@@ -2448,8 +2453,13 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 
 	tb_dbg(tb, "using software connection manager\n");
 
-	tb_apple_add_links(nhi);
-	tb_acpi_add_links(nhi);
+	/*
+	 * Device links are needed to make sure we establish tunnels
+	 * before the PCIe/USB stack is resumed so complain here if we
+	 * found them missing.
+	 */
+	if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
+		tb_warn(tb, "device links to tunneled native ports are missing!\n");
 
 	return tb;
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 57a9b272cb94..d2a55ad2fd3e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1333,7 +1333,7 @@ static inline bool usb4_port_device_is_offline(const struct usb4_port *usb4)
 void tb_check_quirks(struct tb_switch *sw);
 
 #ifdef CONFIG_ACPI
-void tb_acpi_add_links(struct tb_nhi *nhi);
+bool tb_acpi_add_links(struct tb_nhi *nhi);
 
 bool tb_acpi_is_native(void);
 bool tb_acpi_may_tunnel_usb3(void);
@@ -1346,7 +1346,7 @@ void tb_acpi_exit(void);
 int tb_acpi_power_on_retimers(struct tb_port *port);
 int tb_acpi_power_off_retimers(struct tb_port *port);
 #else
-static inline void tb_acpi_add_links(struct tb_nhi *nhi) { }
+static inline bool tb_acpi_add_links(struct tb_nhi *nhi) { return false; }
 
 static inline bool tb_acpi_is_native(void) { return true; }
 static inline bool tb_acpi_may_tunnel_usb3(void) { return true; }
-- 
2.40.1

