Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9419746B33
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jul 2023 09:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbjGDHyc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jul 2023 03:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbjGDHyZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jul 2023 03:54:25 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C3D1706
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 00:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688457237; x=1719993237;
  h=from:to:cc:subject:date:message-id;
  bh=9EOWlc/AH5fuUntGfkNSQKzbcO8Aw7axTIH7B6GsJt4=;
  b=hGmH866DB/wTQIgbZ2eVthW9DBF8NvvVZFxvR1XsTzA7TweOg3KomDJs
   d1oyrdMXRHLOllsU2tguc91fvbfSJzQ7VBAcOkF4HpOEH5S9TD/E1P7eq
   IQT01F/AEyqTZxlaxyxQw3kS2e4RhBhUFB6kt9KuNWkJXis3stBZkjrNi
   PGTiZtMBEE8JL1Tt32ecp/zUZCUTdy9hvCutcZf5sTvvAtptzPm8IaTxe
   QPNRqhi31ePil0jaX6VvfbAOEAmMY5K2dn5qZnFU7/xZWQFean3LT1bls
   W4W34CIHysgFdNSILikSpH6Fth5NK6rgSEE14i6vSf7x4XUc+5WTb9hrv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="426746894"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="426746894"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 00:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712807447"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="712807447"
Received: from unknown (HELO localhost.localdomain) ([10.223.165.44])
  by orsmga007.jf.intel.com with ESMTP; 04 Jul 2023 00:52:19 -0700
From:   madhu.m@intel.com
To:     gregkh@linuxfoundation.org
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, madhu.m@intel.com
Subject: [PATCH usb-next] usb: typec: intel_pmc_mux: Add new ACPI ID for Lunar Lake IOM device
Date:   Tue,  4 Jul 2023 13:35:09 +0530
Message-Id: <20230704080509.14251-1-madhu.m@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Madhu M <madhu.m@intel.com>

Intel Lunar Lake IOM has a different IOM port status offset and size
than Intel MTL.

Intel Lunar Lake is the first platform to extend IOM port status
from 32bit to 64bit by adding DDI port number into IOM port status.

Added IOM_PORT_STATUS_REGS macro for using platform specific IOM port
status offset and size.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Madhu M <madhu.m@intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 5e8edf3881c0..61a88f68b458 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -117,6 +117,16 @@ enum {
 	  IOM_PORT_STATUS_DHPD_HPD_STATUS_SHIFT) &			\
 	 IOM_PORT_STATUS_DHPD_HPD_STATUS_ASSERT)
 
+/* IOM port status register */
+#define IOM_PORT_STATUS_REGS(_offset_, _size_)	((_offset_) | (_size_))
+#define IOM_PORT_STATUS_REGS_SZ_MASK		BIT(0)
+#define IOM_PORT_STATUS_REGS_SZ_4		0
+#define IOM_PORT_STATUS_REGS_SZ_8		1
+#define IOM_PORT_STATUS_REGS_OFFSET(_d_)				\
+	((_d_) & ~IOM_PORT_STATUS_REGS_SZ_MASK)
+#define IOM_PORT_STATUS_REGS_SIZE(_d_)					\
+	(4 << ((_d_) & IOM_PORT_STATUS_REGS_SZ_MASK))
+
 struct pmc_usb;
 
 struct pmc_usb_port {
@@ -145,6 +155,7 @@ struct pmc_usb {
 	struct acpi_device *iom_adev;
 	void __iomem *iom_base;
 	u32 iom_port_status_offset;
+	u8 iom_port_status_size;
 
 	struct dentry *dentry;
 };
@@ -160,7 +171,7 @@ static void update_port_status(struct pmc_usb_port *port)
 
 	port->iom_status = readl(port->pmc->iom_base +
 				 port->pmc->iom_port_status_offset +
-				 port_num * sizeof(u32));
+				 port_num * port->pmc->iom_port_status_size);
 }
 
 static int sbu_orientation(struct pmc_usb_port *port)
@@ -589,13 +600,16 @@ static int pmc_usb_register_port(struct pmc_usb *pmc, int index,
 /* IOM ACPI IDs and IOM_PORT_STATUS_OFFSET */
 static const struct acpi_device_id iom_acpi_ids[] = {
 	/* TigerLake */
-	{ "INTC1072", 0x560, },
+	{ "INTC1072", IOM_PORT_STATUS_REGS(0x560, IOM_PORT_STATUS_REGS_SZ_4) },
 
 	/* AlderLake */
-	{ "INTC1079", 0x160, },
+	{ "INTC1079", IOM_PORT_STATUS_REGS(0x160, IOM_PORT_STATUS_REGS_SZ_4) },
 
 	/* Meteor Lake */
-	{ "INTC107A", 0x160, },
+	{ "INTC107A", IOM_PORT_STATUS_REGS(0x160, IOM_PORT_STATUS_REGS_SZ_4) },
+
+	/* Lunar Lake */
+	{ "INTC10EA", IOM_PORT_STATUS_REGS(0x150, IOM_PORT_STATUS_REGS_SZ_8) },
 	{}
 };
 
@@ -615,7 +629,8 @@ static int pmc_usb_probe_iom(struct pmc_usb *pmc)
 	if (!adev)
 		return -ENODEV;
 
-	pmc->iom_port_status_offset = (u32)dev_id->driver_data;
+	pmc->iom_port_status_offset = IOM_PORT_STATUS_REGS_OFFSET(dev_id->driver_data);
+	pmc->iom_port_status_size = IOM_PORT_STATUS_REGS_SIZE(dev_id->driver_data);
 
 	INIT_LIST_HEAD(&resource_list);
 	ret = acpi_dev_get_memory_resources(adev, &resource_list);
-- 
2.17.1

