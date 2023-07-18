Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C31E75735A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jul 2023 07:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbjGRFsv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jul 2023 01:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGRFsp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jul 2023 01:48:45 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5B2E51
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 22:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689659324; x=1721195324;
  h=from:to:cc:subject:date:message-id;
  bh=9EOWlc/AH5fuUntGfkNSQKzbcO8Aw7axTIH7B6GsJt4=;
  b=Wq6Xaeuj+UIai+6nsXKBu3Cu4NpQBalC/Y8BlwAYLm4OSBC4KjvxpChE
   Z6I6g9UUVN7WQ04UE/lAAcOdXYe2zoL27w6b8ClseCvWpSnzL2GlkM3Bi
   AccqKfYH4aVWa1MVNGUiYQS2dYnAkG3XZV8bGCd23GuTGSRmsYt18BhyG
   YMTP0P8skofBtfqRP8u2+CNV9UeNhWgJ6waMQlnnTgbmiQ+UbTGG1xfev
   r2Z9OHwaADwVwzrWMxbmqeEv0x5s4S86OfTtGgSus6xkgpyYxquBbgHgS
   msaG9aQdLJuw/8iekvyxUoHpdb3zoXAaPgC0VlD4Xw3zVWqQ7cKID7/Z/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432297981"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="432297981"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 22:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="1054167155"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="1054167155"
Received: from unknown (HELO localhost.localdomain) ([10.223.165.44])
  by fmsmga005.fm.intel.com with ESMTP; 17 Jul 2023 22:43:33 -0700
From:   madhu.m@intel.com
To:     gregkh@linuxfoundation.org
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        andriy.shevchenko@linux.intel.com
Subject: [PATCH usb-next] usb: typec: intel_pmc_mux: Add new ACPI ID for Lunar Lake IOM device
Date:   Tue, 18 Jul 2023 11:26:50 +0530
Message-Id: <20230718055650.30490-1-madhu.m@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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

