Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53221396BF9
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 05:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbhFAD6S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 23:58:18 -0400
Received: from mga03.intel.com ([134.134.136.65]:8779 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232516AbhFAD6P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 May 2021 23:58:15 -0400
IronPort-SDR: Yz2y0wiMSdTdok1+wVUMdT4vvHGj0xDixo2UeFdwn99jhC7zIMeCTKVsdXe2JO5L3FQwjIQhQv
 DzBnv0NYz7jw==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203500346"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; 
   d="scan'208";a="203500346"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2021 20:56:34 -0700
IronPort-SDR: cL5qE+7uZ/vSzO1xldngoS1kyAn3LvCDruHlGHTNLPh/tev1QCaLGdNKHsgRLTu/Sl5gO6DES6
 Q0PnIbkjhNyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; 
   d="scan'208";a="632732921"
Received: from otc-chromeosbuild-1.jf.intel.com ([10.54.30.83])
  by fmsmga006.fm.intel.com with ESMTP; 31 May 2021 20:56:33 -0700
From:   Azhar Shaikh <azhar.shaikh@intel.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        azhar.shaikh@intel.com
Subject: [PATCH v2] usb: typec: intel_pmc_mux: Update IOM port status offset for AlderLake
Date:   Mon, 31 May 2021 20:58:43 -0700
Message-Id: <20210601035843.71150-1-azhar.shaikh@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Intel AlderLake(ADL) IOM has a different IOM port status offset than
Intel TigerLake.
Add a new ACPI ID for ADL and use the IOM port status offset as per
the platform.

Signed-off-by: Azhar Shaikh <azhar.shaikh@intel.com>
---
Changes in v2:
- Passed acpi_device_id->id to acpi_dev_present() and
  acpi_dev_get_first_match_dev()

 drivers/usb/typec/mux/intel_pmc_mux.c | 28 ++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 46a25b8db72e..dc8689db0100 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -83,8 +83,6 @@ enum {
 /*
  * Input Output Manager (IOM) PORT STATUS
  */
-#define IOM_PORT_STATUS_OFFSET				0x560
-
 #define IOM_PORT_STATUS_ACTIVITY_TYPE_MASK		GENMASK(9, 6)
 #define IOM_PORT_STATUS_ACTIVITY_TYPE_SHIFT		6
 #define IOM_PORT_STATUS_ACTIVITY_TYPE_USB		0x03
@@ -144,6 +142,7 @@ struct pmc_usb {
 	struct pmc_usb_port *port;
 	struct acpi_device *iom_adev;
 	void __iomem *iom_base;
+	u32 iom_port_status_offset;
 };
 
 static void update_port_status(struct pmc_usb_port *port)
@@ -153,7 +152,8 @@ static void update_port_status(struct pmc_usb_port *port)
 	/* SoC expects the USB Type-C port numbers to start with 0 */
 	port_num = port->usb3_port - 1;
 
-	port->iom_status = readl(port->pmc->iom_base + IOM_PORT_STATUS_OFFSET +
+	port->iom_status = readl(port->pmc->iom_base +
+				 port->pmc->iom_port_status_offset +
 				 port_num * sizeof(u32));
 }
 
@@ -559,14 +559,32 @@ static int is_memory(struct acpi_resource *res, void *data)
 	return !acpi_dev_resource_memory(res, &r);
 }
 
+/* IOM ACPI IDs and IOM_PORT_STATUS_OFFSET */
+static const struct acpi_device_id iom_acpi_ids[] = {
+	/* TigerLake */
+	{ "INTC1072", 0x560, },
+
+	/* AlderLake */
+	{ "INTC1079", 0x160, },
+	{}
+};
+
 static int pmc_usb_probe_iom(struct pmc_usb *pmc)
 {
 	struct list_head resource_list;
 	struct resource_entry *rentry;
-	struct acpi_device *adev;
+	static const struct acpi_device_id *dev_id;
+	struct acpi_device *adev = NULL;
 	int ret;
 
-	adev = acpi_dev_get_first_match_dev("INTC1072", NULL, -1);
+	for (dev_id = &iom_acpi_ids[0]; dev_id->id[0]; dev_id++) {
+		if (acpi_dev_present(dev_id->id, NULL, -1)) {
+			pmc->iom_port_status_offset = (u32)dev_id->driver_data;
+			adev = acpi_dev_get_first_match_dev(dev_id->id, NULL, -1);
+			break;
+		}
+	}
+
 	if (!adev)
 		return -ENODEV;
 
-- 
2.17.1

