Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF3045D5A5
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 08:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348589AbhKYHmw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 02:42:52 -0500
Received: from mga05.intel.com ([192.55.52.43]:8687 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233765AbhKYHkv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 02:40:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="321698286"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="321698286"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 23:37:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="571779006"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 24 Nov 2021 23:37:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1FE5F9F; Thu, 25 Nov 2021 09:37:34 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/6] thunderbolt: Runtime PM activate both ends of the device link
Date:   Thu, 25 Nov 2021 10:37:28 +0300
Message-Id: <20211125073733.74902-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If protocol tunnels are already up when the driver is loaded, for
instance if the boot firmware implements connection manager of its own,
runtime PM reference count of the consumer devices behind the tunnel
might have been increased already before the device link is created but
the supplier device runtime PM reference count is not. This leads to a
situation where the supplier (the Thunderbolt driver) can runtime
suspend even if it should not because the corresponding protocol tunnel
needs to be up causing the devices to be removed from the corresponding
native bus.

Prevent this from happening by making both sides of the link runtime PM
active briefly. The pm_runtime_put() for the consumer (PCIe
root/downstream port, xHCI) then allows it to runtime suspend again but
keeps the supplier runtime resumed the whole time it is runtime active.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/acpi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
index b67e72d5644b..7c9597a33929 100644
--- a/drivers/thunderbolt/acpi.c
+++ b/drivers/thunderbolt/acpi.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/pm_runtime.h>
 
 #include "tb.h"
 
@@ -74,8 +75,18 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 		 pci_pcie_type(pdev) == PCI_EXP_TYPE_DOWNSTREAM))) {
 		const struct device_link *link;
 
+		/*
+		 * Make them both active first to make sure the NHI does
+		 * not runtime suspend before the consumer. The
+		 * pm_runtime_put() below then allows the consumer to
+		 * runtime suspend again (which then allows NHI runtime
+		 * suspend too now that the device link is established).
+		 */
+		pm_runtime_get_sync(&pdev->dev);
+
 		link = device_link_add(&pdev->dev, &nhi->pdev->dev,
 				       DL_FLAG_AUTOREMOVE_SUPPLIER |
+				       DL_FLAG_RPM_ACTIVE |
 				       DL_FLAG_PM_RUNTIME);
 		if (link) {
 			dev_dbg(&nhi->pdev->dev, "created link from %s\n",
@@ -84,6 +95,8 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 			dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
 				 dev_name(&pdev->dev));
 		}
+
+		pm_runtime_put(&pdev->dev);
 	}
 
 out_put:
-- 
2.33.0

