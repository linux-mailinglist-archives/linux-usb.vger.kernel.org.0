Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234427147B1
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbjE2KEq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbjE2KEk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:40 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B99B5
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354676; x=1716890676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RnZffdERIkXZDQaKdSVAUpVg1t+EAGalLtwqytNQjpQ=;
  b=K9x7wpfMFvNRRr89xFAaUKOpwtV4GBxn8U2Yc3HDuCxWnF8rDhb1zKuu
   hVAmKV3IqaQ4VnMmK+TFDl6H2CxiUCFKvlO9VIxHswIlhJpV+FOcDBDtS
   BQYc4nYcrLpOr+gd+MaM942wt2hlaOfiKu3Hw4NR5YB4XIo+HlPsAW3sh
   oc0YgI7Vi6X6vO+4s9DzK1p5AaX8dCE3l1RpBhr0ojJwEGtjLPufazsgS
   bmezyfsV+DTFiwFj+oNBQrdWeTPbBZ+iMPoPo1hwG3iJOcF7CNr+W/q/1
   /1qrSWo3E4K5axhnlHyFM2n/Goj8RyuIofhvqUC1QWfYrDwhhJGBKSeFY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684443"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684443"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518466"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518466"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 3B3DA916; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 10/20] thunderbolt: Move CLx support functions into clx.c
Date:   Mon, 29 May 2023 13:04:15 +0300
Message-Id: <20230529100425.6125-11-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
References: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There really don't belong to switch.c so move them into their own file.
As we do this rename the functions to match the conventions used
elsewhere in the driver.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/Makefile  |   2 +-
 drivers/thunderbolt/clx.c     | 362 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/debugfs.c |   2 +-
 drivers/thunderbolt/switch.c  | 362 +---------------------------------
 drivers/thunderbolt/tb.c      |   8 +-
 drivers/thunderbolt/tb.h      |  17 +-
 drivers/thunderbolt/tmu.c     |   6 +-
 7 files changed, 381 insertions(+), 378 deletions(-)
 create mode 100644 drivers/thunderbolt/clx.c

diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index 78fd365893c1..c8b3d7b78098 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -2,7 +2,7 @@
 obj-${CONFIG_USB4} := thunderbolt.o
 thunderbolt-objs := nhi.o nhi_ops.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
 thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
-thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o
+thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
 
 thunderbolt-${CONFIG_ACPI} += acpi.o
 thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
new file mode 100644
index 000000000000..d5b46a8e57c9
--- /dev/null
+++ b/drivers/thunderbolt/clx.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CLx support
+ *
+ * Copyright (C) 2020 - 2023, Intel Corporation
+ * Authors: Gil Fine <gil.fine@intel.com>
+ *	    Mika Westerberg <mika.westerberg@linux.intel.com>
+ */
+
+#include <linux/module.h>
+
+#include "tb.h"
+
+static bool clx_enabled = true;
+module_param_named(clx, clx_enabled, bool, 0444);
+MODULE_PARM_DESC(clx, "allow low power states on the high-speed lanes (default: true)");
+
+static int tb_port_pm_secondary_set(struct tb_port *port, bool secondary)
+{
+	u32 phy;
+	int ret;
+
+	ret = tb_port_read(port, &phy, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return ret;
+
+	if (secondary)
+		phy |= LANE_ADP_CS_1_PMS;
+	else
+		phy &= ~LANE_ADP_CS_1_PMS;
+
+	return tb_port_write(port, &phy, TB_CFG_PORT,
+			     port->cap_phy + LANE_ADP_CS_1, 1);
+}
+
+static int tb_port_pm_secondary_enable(struct tb_port *port)
+{
+	return tb_port_pm_secondary_set(port, true);
+}
+
+static int tb_port_pm_secondary_disable(struct tb_port *port)
+{
+	return tb_port_pm_secondary_set(port, false);
+}
+
+/* Called for USB4 or Titan Ridge routers only */
+static bool tb_port_clx_supported(struct tb_port *port, unsigned int clx_mask)
+{
+	u32 val, mask = 0;
+	bool ret;
+
+	/* Don't enable CLx in case of two single-lane links */
+	if (!port->bonded && port->dual_link_port)
+		return false;
+
+	/* Don't enable CLx in case of inter-domain link */
+	if (port->xdomain)
+		return false;
+
+	if (tb_switch_is_usb4(port->sw)) {
+		if (!usb4_port_clx_supported(port))
+			return false;
+	} else if (!tb_lc_is_clx_supported(port)) {
+		return false;
+	}
+
+	if (clx_mask & TB_CL1) {
+		/* CL0s and CL1 are enabled and supported together */
+		mask |= LANE_ADP_CS_0_CL0S_SUPPORT | LANE_ADP_CS_0_CL1_SUPPORT;
+	}
+	if (clx_mask & TB_CL2)
+		mask |= LANE_ADP_CS_0_CL2_SUPPORT;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_0, 1);
+	if (ret)
+		return false;
+
+	return !!(val & mask);
+}
+
+static int tb_port_clx_set(struct tb_port *port, enum tb_clx clx, bool enable)
+{
+	u32 phy, mask;
+	int ret;
+
+	/* CL0s and CL1 are enabled and supported together */
+	if (clx == TB_CL1)
+		mask = LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
+	else
+		/* For now we support only CL0s and CL1. Not CL2 */
+		return -EOPNOTSUPP;
+
+	ret = tb_port_read(port, &phy, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return ret;
+
+	if (enable)
+		phy |= mask;
+	else
+		phy &= ~mask;
+
+	return tb_port_write(port, &phy, TB_CFG_PORT,
+			     port->cap_phy + LANE_ADP_CS_1, 1);
+}
+
+static int tb_port_clx_disable(struct tb_port *port, enum tb_clx clx)
+{
+	return tb_port_clx_set(port, clx, false);
+}
+
+static int tb_port_clx_enable(struct tb_port *port, enum tb_clx clx)
+{
+	return tb_port_clx_set(port, clx, true);
+}
+
+/**
+ * tb_port_clx_is_enabled() - Is given CL state enabled
+ * @port: USB4 port to check
+ * @clx_mask: Mask of CL states to check
+ *
+ * Returns true if any of the given CL states is enabled for @port.
+ */
+bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx_mask)
+{
+	u32 val, mask = 0;
+	int ret;
+
+	if (!tb_port_clx_supported(port, clx_mask))
+		return false;
+
+	if (clx_mask & TB_CL1)
+		mask |= LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
+	if (clx_mask & TB_CL2)
+		mask |= LANE_ADP_CS_1_CL2_ENABLE;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return false;
+
+	return !!(val & mask);
+}
+
+static int tb_switch_pm_secondary_resolve(struct tb_switch *sw)
+{
+	struct tb_port *up, *down;
+	int ret;
+
+	if (!tb_route(sw))
+		return 0;
+
+	up = tb_upstream_port(sw);
+	down = tb_switch_downstream_port(sw);
+	ret = tb_port_pm_secondary_enable(up);
+	if (ret)
+		return ret;
+
+	return tb_port_pm_secondary_disable(down);
+}
+
+static int tb_switch_mask_clx_objections(struct tb_switch *sw)
+{
+	int up_port = sw->config.upstream_port_number;
+	u32 offset, val[2], mask_obj, unmask_obj;
+	int ret, i;
+
+	/* Only Titan Ridge of pre-USB4 devices support CLx states */
+	if (!tb_switch_is_titan_ridge(sw))
+		return 0;
+
+	if (!tb_route(sw))
+		return 0;
+
+	/*
+	 * In Titan Ridge there are only 2 dual-lane Thunderbolt ports:
+	 * Port A consists of lane adapters 1,2 and
+	 * Port B consists of lane adapters 3,4
+	 * If upstream port is A, (lanes are 1,2), we mask objections from
+	 * port B (lanes 3,4) and unmask objections from Port A and vice-versa.
+	 */
+	if (up_port == 1) {
+		mask_obj = TB_LOW_PWR_C0_PORT_B_MASK;
+		unmask_obj = TB_LOW_PWR_C1_PORT_A_MASK;
+		offset = TB_LOW_PWR_C1_CL1;
+	} else {
+		mask_obj = TB_LOW_PWR_C1_PORT_A_MASK;
+		unmask_obj = TB_LOW_PWR_C0_PORT_B_MASK;
+		offset = TB_LOW_PWR_C3_CL1;
+	}
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
+			 sw->cap_lp + offset, ARRAY_SIZE(val));
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(val); i++) {
+		val[i] |= mask_obj;
+		val[i] &= ~unmask_obj;
+	}
+
+	return tb_sw_write(sw, &val, TB_CFG_SWITCH,
+			   sw->cap_lp + offset, ARRAY_SIZE(val));
+}
+
+static int __tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
+{
+	bool up_clx_support, down_clx_support;
+	struct tb_port *up, *down;
+	int ret;
+
+	if (!tb_switch_clx_is_supported(sw))
+		return 0;
+
+	/*
+	 * Enable CLx for host router's downstream port as part of the
+	 * downstream router enabling procedure.
+	 */
+	if (!tb_route(sw))
+		return 0;
+
+	/* Enable CLx only for first hop router (depth = 1) */
+	if (tb_route(tb_switch_parent(sw)))
+		return 0;
+
+	ret = tb_switch_pm_secondary_resolve(sw);
+	if (ret)
+		return ret;
+
+	up = tb_upstream_port(sw);
+	down = tb_switch_downstream_port(sw);
+
+	up_clx_support = tb_port_clx_supported(up, clx);
+	down_clx_support = tb_port_clx_supported(down, clx);
+
+	tb_port_dbg(up, "%s %ssupported\n", tb_switch_clx_name(clx),
+		    up_clx_support ? "" : "not ");
+	tb_port_dbg(down, "%s %ssupported\n", tb_switch_clx_name(clx),
+		    down_clx_support ? "" : "not ");
+
+	if (!up_clx_support || !down_clx_support)
+		return -EOPNOTSUPP;
+
+	ret = tb_port_clx_enable(up, clx);
+	if (ret)
+		return ret;
+
+	ret = tb_port_clx_enable(down, clx);
+	if (ret) {
+		tb_port_clx_disable(up, clx);
+		return ret;
+	}
+
+	ret = tb_switch_mask_clx_objections(sw);
+	if (ret) {
+		tb_port_clx_disable(up, clx);
+		tb_port_clx_disable(down, clx);
+		return ret;
+	}
+
+	sw->clx = clx;
+
+	tb_port_dbg(up, "%s enabled\n", tb_switch_clx_name(clx));
+	return 0;
+}
+
+/**
+ * tb_switch_clx_enable() - Enable CLx on upstream port of specified router
+ * @sw: Router to enable CLx for
+ * @clx: The CLx state to enable
+ *
+ * Enable CLx state only for first hop router. That is the most common
+ * use-case, that is intended for better thermal management, and so helps
+ * to improve performance. CLx is enabled only if both sides of the link
+ * support CLx, and if both sides of the link are not configured as two
+ * single lane links and only if the link is not inter-domain link. The
+ * complete set of conditions is described in CM Guide 1.0 section 8.1.
+ *
+ * Return: Returns 0 on success or an error code on failure.
+ */
+int tb_switch_clx_enable(struct tb_switch *sw, enum tb_clx clx)
+{
+	struct tb_switch *root_sw = sw->tb->root_switch;
+
+	if (!clx_enabled)
+		return 0;
+
+	/*
+	 * CLx is not enabled and validated on Intel USB4 platforms before
+	 * Alder Lake.
+	 */
+	if (root_sw->generation < 4 || tb_switch_is_tiger_lake(root_sw))
+		return 0;
+
+	switch (clx) {
+	case TB_CL1:
+		/* CL0s and CL1 are enabled and supported together */
+		return __tb_switch_enable_clx(sw, clx);
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int __tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
+{
+	struct tb_port *up, *down;
+	int ret;
+
+	if (!tb_switch_clx_is_supported(sw))
+		return 0;
+
+	/*
+	 * Disable CLx for host router's downstream port as part of the
+	 * downstream router enabling procedure.
+	 */
+	if (!tb_route(sw))
+		return 0;
+
+	/* Disable CLx only for first hop router (depth = 1) */
+	if (tb_route(tb_switch_parent(sw)))
+		return 0;
+
+	up = tb_upstream_port(sw);
+	down = tb_switch_downstream_port(sw);
+	ret = tb_port_clx_disable(up, clx);
+	if (ret)
+		return ret;
+
+	ret = tb_port_clx_disable(down, clx);
+	if (ret)
+		return ret;
+
+	sw->clx = TB_CLX_DISABLE;
+
+	tb_port_dbg(up, "%s disabled\n", tb_switch_clx_name(clx));
+	return 0;
+}
+
+/**
+ * tb_switch_cls_disable() - Disable CLx on upstream port of specified router
+ * @sw: Router to disable CLx for
+ * @clx: The CLx state to disable
+ *
+ * Return: Returns 0 on success or an error code on failure.
+ */
+int tb_switch_clx_disable(struct tb_switch *sw, enum tb_clx clx)
+{
+	if (!clx_enabled)
+		return 0;
+
+	switch (clx) {
+	case TB_CL1:
+		/* CL0s and CL1 are enabled and supported together */
+		return __tb_switch_disable_clx(sw, clx);
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index f92ad71ef983..e376ad25bf60 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -570,7 +570,7 @@ static int margining_run_write(void *data, u64 val)
 	 * CL states may interfere with lane margining so inform the user know
 	 * and bail out.
 	 */
-	if (tb_port_is_clx_enabled(port, TB_CL1 | TB_CL2)) {
+	if (tb_port_clx_is_enabled(port, TB_CL1 | TB_CL2)) {
 		tb_port_warn(port,
 			     "CL states are enabled, Disable them with clx=0 and re-connect\n");
 		ret = -EINVAL;
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 4f3d02c58c9e..984b5536e143 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -26,10 +26,6 @@ struct nvm_auth_status {
 	u32 status;
 };
 
-static bool clx_enabled = true;
-module_param_named(clx, clx_enabled, bool, 0444);
-MODULE_PARM_DESC(clx, "allow low power states on the high-speed lanes (default: true)");
-
 /*
  * Hold NVM authentication failure status per switch This information
  * needs to stay around even when the switch gets power cycled so we
@@ -1183,135 +1179,6 @@ int tb_port_update_credits(struct tb_port *port)
 	return tb_port_do_update_credits(port->dual_link_port);
 }
 
-static int __tb_port_pm_secondary_set(struct tb_port *port, bool secondary)
-{
-	u32 phy;
-	int ret;
-
-	ret = tb_port_read(port, &phy, TB_CFG_PORT,
-			   port->cap_phy + LANE_ADP_CS_1, 1);
-	if (ret)
-		return ret;
-
-	if (secondary)
-		phy |= LANE_ADP_CS_1_PMS;
-	else
-		phy &= ~LANE_ADP_CS_1_PMS;
-
-	return tb_port_write(port, &phy, TB_CFG_PORT,
-			     port->cap_phy + LANE_ADP_CS_1, 1);
-}
-
-static int tb_port_pm_secondary_enable(struct tb_port *port)
-{
-	return __tb_port_pm_secondary_set(port, true);
-}
-
-static int tb_port_pm_secondary_disable(struct tb_port *port)
-{
-	return __tb_port_pm_secondary_set(port, false);
-}
-
-/* Called for USB4 or Titan Ridge routers only */
-static bool tb_port_clx_supported(struct tb_port *port, unsigned int clx_mask)
-{
-	u32 val, mask = 0;
-	bool ret;
-
-	/* Don't enable CLx in case of two single-lane links */
-	if (!port->bonded && port->dual_link_port)
-		return false;
-
-	/* Don't enable CLx in case of inter-domain link */
-	if (port->xdomain)
-		return false;
-
-	if (tb_switch_is_usb4(port->sw)) {
-		if (!usb4_port_clx_supported(port))
-			return false;
-	} else if (!tb_lc_is_clx_supported(port)) {
-		return false;
-	}
-
-	if (clx_mask & TB_CL1) {
-		/* CL0s and CL1 are enabled and supported together */
-		mask |= LANE_ADP_CS_0_CL0S_SUPPORT | LANE_ADP_CS_0_CL1_SUPPORT;
-	}
-	if (clx_mask & TB_CL2)
-		mask |= LANE_ADP_CS_0_CL2_SUPPORT;
-
-	ret = tb_port_read(port, &val, TB_CFG_PORT,
-			   port->cap_phy + LANE_ADP_CS_0, 1);
-	if (ret)
-		return false;
-
-	return !!(val & mask);
-}
-
-static int __tb_port_clx_set(struct tb_port *port, enum tb_clx clx, bool enable)
-{
-	u32 phy, mask;
-	int ret;
-
-	/* CL0s and CL1 are enabled and supported together */
-	if (clx == TB_CL1)
-		mask = LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
-	else
-		/* For now we support only CL0s and CL1. Not CL2 */
-		return -EOPNOTSUPP;
-
-	ret = tb_port_read(port, &phy, TB_CFG_PORT,
-			   port->cap_phy + LANE_ADP_CS_1, 1);
-	if (ret)
-		return ret;
-
-	if (enable)
-		phy |= mask;
-	else
-		phy &= ~mask;
-
-	return tb_port_write(port, &phy, TB_CFG_PORT,
-			     port->cap_phy + LANE_ADP_CS_1, 1);
-}
-
-static int tb_port_clx_disable(struct tb_port *port, enum tb_clx clx)
-{
-	return __tb_port_clx_set(port, clx, false);
-}
-
-static int tb_port_clx_enable(struct tb_port *port, enum tb_clx clx)
-{
-	return __tb_port_clx_set(port, clx, true);
-}
-
-/**
- * tb_port_is_clx_enabled() - Is given CL state enabled
- * @port: USB4 port to check
- * @clx_mask: Mask of CL states to check
- *
- * Returns true if any of the given CL states is enabled for @port.
- */
-bool tb_port_is_clx_enabled(struct tb_port *port, unsigned int clx_mask)
-{
-	u32 val, mask = 0;
-	int ret;
-
-	if (!tb_port_clx_supported(port, clx_mask))
-		return false;
-
-	if (clx_mask & TB_CL1)
-		mask |= LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
-	if (clx_mask & TB_CL2)
-		mask |= LANE_ADP_CS_1_CL2_ENABLE;
-
-	ret = tb_port_read(port, &val, TB_CFG_PORT,
-			   port->cap_phy + LANE_ADP_CS_1, 1);
-	if (ret)
-		return false;
-
-	return !!(val & mask);
-}
-
 static int tb_port_start_lane_initialization(struct tb_port *port)
 {
 	int ret;
@@ -3246,8 +3113,8 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 	 * done for USB4 device too as CLx is re-enabled at resume.
 	 * CL0s and CL1 are enabled and supported together.
 	 */
-	if (tb_switch_is_clx_enabled(sw, TB_CL1)) {
-		if (tb_switch_disable_clx(sw, TB_CL1))
+	if (tb_switch_clx_is_enabled(sw, TB_CL1)) {
+		if (tb_switch_clx_disable(sw, TB_CL1))
 			tb_sw_warn(sw, "failed to disable %s on upstream port\n",
 				   tb_switch_clx_name(TB_CL1));
 	}
@@ -3472,231 +3339,6 @@ struct tb_port *tb_switch_find_port(struct tb_switch *sw,
 	return NULL;
 }
 
-static int tb_switch_pm_secondary_resolve(struct tb_switch *sw)
-{
-	struct tb_port *up, *down;
-	int ret;
-
-	if (!tb_route(sw))
-		return 0;
-
-	up = tb_upstream_port(sw);
-	down = tb_switch_downstream_port(sw);
-	ret = tb_port_pm_secondary_enable(up);
-	if (ret)
-		return ret;
-
-	return tb_port_pm_secondary_disable(down);
-}
-
-static int __tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
-{
-	bool up_clx_support, down_clx_support;
-	struct tb_port *up, *down;
-	int ret;
-
-	if (!tb_switch_is_clx_supported(sw))
-		return 0;
-
-	/*
-	 * Enable CLx for host router's downstream port as part of the
-	 * downstream router enabling procedure.
-	 */
-	if (!tb_route(sw))
-		return 0;
-
-	/* Enable CLx only for first hop router (depth = 1) */
-	if (tb_route(tb_switch_parent(sw)))
-		return 0;
-
-	ret = tb_switch_pm_secondary_resolve(sw);
-	if (ret)
-		return ret;
-
-	up = tb_upstream_port(sw);
-	down = tb_switch_downstream_port(sw);
-
-	up_clx_support = tb_port_clx_supported(up, clx);
-	down_clx_support = tb_port_clx_supported(down, clx);
-
-	tb_port_dbg(up, "%s %ssupported\n", tb_switch_clx_name(clx),
-		    up_clx_support ? "" : "not ");
-	tb_port_dbg(down, "%s %ssupported\n", tb_switch_clx_name(clx),
-		    down_clx_support ? "" : "not ");
-
-	if (!up_clx_support || !down_clx_support)
-		return -EOPNOTSUPP;
-
-	ret = tb_port_clx_enable(up, clx);
-	if (ret)
-		return ret;
-
-	ret = tb_port_clx_enable(down, clx);
-	if (ret) {
-		tb_port_clx_disable(up, clx);
-		return ret;
-	}
-
-	ret = tb_switch_mask_clx_objections(sw);
-	if (ret) {
-		tb_port_clx_disable(up, clx);
-		tb_port_clx_disable(down, clx);
-		return ret;
-	}
-
-	sw->clx = clx;
-
-	tb_port_dbg(up, "%s enabled\n", tb_switch_clx_name(clx));
-	return 0;
-}
-
-/**
- * tb_switch_enable_clx() - Enable CLx on upstream port of specified router
- * @sw: Router to enable CLx for
- * @clx: The CLx state to enable
- *
- * Enable CLx state only for first hop router. That is the most common
- * use-case, that is intended for better thermal management, and so helps
- * to improve performance. CLx is enabled only if both sides of the link
- * support CLx, and if both sides of the link are not configured as two
- * single lane links and only if the link is not inter-domain link. The
- * complete set of conditions is described in CM Guide 1.0 section 8.1.
- *
- * Return: Returns 0 on success or an error code on failure.
- */
-int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
-{
-	struct tb_switch *root_sw = sw->tb->root_switch;
-
-	if (!clx_enabled)
-		return 0;
-
-	/*
-	 * CLx is not enabled and validated on Intel USB4 platforms before
-	 * Alder Lake.
-	 */
-	if (root_sw->generation < 4 || tb_switch_is_tiger_lake(root_sw))
-		return 0;
-
-	switch (clx) {
-	case TB_CL1:
-		/* CL0s and CL1 are enabled and supported together */
-		return __tb_switch_enable_clx(sw, clx);
-
-	default:
-		return -EOPNOTSUPP;
-	}
-}
-
-static int __tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
-{
-	struct tb_port *up, *down;
-	int ret;
-
-	if (!tb_switch_is_clx_supported(sw))
-		return 0;
-
-	/*
-	 * Disable CLx for host router's downstream port as part of the
-	 * downstream router enabling procedure.
-	 */
-	if (!tb_route(sw))
-		return 0;
-
-	/* Disable CLx only for first hop router (depth = 1) */
-	if (tb_route(tb_switch_parent(sw)))
-		return 0;
-
-	up = tb_upstream_port(sw);
-	down = tb_switch_downstream_port(sw);
-	ret = tb_port_clx_disable(up, clx);
-	if (ret)
-		return ret;
-
-	ret = tb_port_clx_disable(down, clx);
-	if (ret)
-		return ret;
-
-	sw->clx = TB_CLX_DISABLE;
-
-	tb_port_dbg(up, "%s disabled\n", tb_switch_clx_name(clx));
-	return 0;
-}
-
-/**
- * tb_switch_disable_clx() - Disable CLx on upstream port of specified router
- * @sw: Router to disable CLx for
- * @clx: The CLx state to disable
- *
- * Return: Returns 0 on success or an error code on failure.
- */
-int tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
-{
-	if (!clx_enabled)
-		return 0;
-
-	switch (clx) {
-	case TB_CL1:
-		/* CL0s and CL1 are enabled and supported together */
-		return __tb_switch_disable_clx(sw, clx);
-
-	default:
-		return -EOPNOTSUPP;
-	}
-}
-
-/**
- * tb_switch_mask_clx_objections() - Mask CLx objections for a router
- * @sw: Router to mask objections for
- *
- * Mask the objections coming from the second depth routers in order to
- * stop these objections from interfering with the CLx states of the first
- * depth link.
- */
-int tb_switch_mask_clx_objections(struct tb_switch *sw)
-{
-	int up_port = sw->config.upstream_port_number;
-	u32 offset, val[2], mask_obj, unmask_obj;
-	int ret, i;
-
-	/* Only Titan Ridge of pre-USB4 devices support CLx states */
-	if (!tb_switch_is_titan_ridge(sw))
-		return 0;
-
-	if (!tb_route(sw))
-		return 0;
-
-	/*
-	 * In Titan Ridge there are only 2 dual-lane Thunderbolt ports:
-	 * Port A consists of lane adapters 1,2 and
-	 * Port B consists of lane adapters 3,4
-	 * If upstream port is A, (lanes are 1,2), we mask objections from
-	 * port B (lanes 3,4) and unmask objections from Port A and vice-versa.
-	 */
-	if (up_port == 1) {
-		mask_obj = TB_LOW_PWR_C0_PORT_B_MASK;
-		unmask_obj = TB_LOW_PWR_C1_PORT_A_MASK;
-		offset = TB_LOW_PWR_C1_CL1;
-	} else {
-		mask_obj = TB_LOW_PWR_C1_PORT_A_MASK;
-		unmask_obj = TB_LOW_PWR_C0_PORT_B_MASK;
-		offset = TB_LOW_PWR_C3_CL1;
-	}
-
-	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
-			 sw->cap_lp + offset, ARRAY_SIZE(val));
-	if (ret)
-		return ret;
-
-	for (i = 0; i < ARRAY_SIZE(val); i++) {
-		val[i] |= mask_obj;
-		val[i] &= ~unmask_obj;
-	}
-
-	return tb_sw_write(sw, &val, TB_CFG_SWITCH,
-			   sw->cap_lp + offset, ARRAY_SIZE(val));
-}
-
 /*
  * Can be used for read/write a specified PCIe bridge for any Thunderbolt 3
  * device. For now used only for Titan Ridge.
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 91459bf2fd0f..c7cfd740520a 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -247,7 +247,7 @@ static int tb_increase_switch_tmu_accuracy(struct device *dev, void *data)
 	sw = tb_to_switch(dev);
 	if (sw) {
 		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI,
-					tb_switch_is_clx_enabled(sw, TB_CL1));
+					tb_switch_clx_is_enabled(sw, TB_CL1));
 		if (tb_switch_tmu_enable(sw))
 			tb_sw_warn(sw, "failed to increase TMU rate\n");
 	}
@@ -281,7 +281,7 @@ static int tb_enable_tmu(struct tb_switch *sw)
 	 * level to normal. Otherwise we keep the TMU running at the
 	 * highest accuracy.
 	 */
-	if (tb_switch_is_clx_enabled(sw, TB_CL1))
+	if (tb_switch_clx_is_enabled(sw, TB_CL1))
 		ret = tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_NORMAL, true);
 	else
 		ret = tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
@@ -879,7 +879,7 @@ static void tb_scan_port(struct tb_port *port)
 	if (discovery) {
 		tb_sw_dbg(sw, "discovery, not touching CL states\n");
 	} else {
-		ret = tb_switch_enable_clx(sw, TB_CL1);
+		ret = tb_switch_clx_enable(sw, TB_CL1);
 		if (ret && ret != -EOPNOTSUPP)
 			tb_sw_warn(sw, "failed to enable %s on upstream port\n",
 				   tb_switch_clx_name(TB_CL1));
@@ -2032,7 +2032,7 @@ static void tb_restore_children(struct tb_switch *sw)
 	 * CL0s and CL1 are enabled and supported together.
 	 * Silently ignore CLx re-enabling in case CLx is not supported.
 	 */
-	ret = tb_switch_enable_clx(sw, TB_CL1);
+	ret = tb_switch_clx_enable(sw, TB_CL1);
 	if (ret && ret != -EOPNOTSUPP)
 		tb_sw_warn(sw, "failed to re-enable %s on upstream port\n",
 			   tb_switch_clx_name(TB_CL1));
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 07e4e7b37f13..d29bc7eab051 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1002,6 +1002,8 @@ static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw)
 	       sw->tmu.unidirectional == sw->tmu.unidirectional_request;
 }
 
+bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx_mask);
+
 static inline const char *tb_switch_clx_name(enum tb_clx clx)
 {
 	switch (clx) {
@@ -1013,28 +1015,28 @@ static inline const char *tb_switch_clx_name(enum tb_clx clx)
 	}
 }
 
-int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx);
-int tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx);
+int tb_switch_clx_enable(struct tb_switch *sw, enum tb_clx clx);
+int tb_switch_clx_disable(struct tb_switch *sw, enum tb_clx clx);
 
 /**
- * tb_switch_is_clx_enabled() - Checks if the CLx is enabled
+ * tb_switch_clx_is_enabled() - Checks if the CLx is enabled
  * @sw: Router to check for the CLx
  * @clx: The CLx state to check for
  *
  * Checks if the specified CLx is enabled on the router upstream link.
  * Not applicable for a host router.
  */
-static inline bool tb_switch_is_clx_enabled(const struct tb_switch *sw,
+static inline bool tb_switch_clx_is_enabled(const struct tb_switch *sw,
 					    enum tb_clx clx)
 {
 	return sw->clx == clx;
 }
 
 /**
- * tb_switch_is_clx_supported() - Is CLx supported on this type of router
+ * tb_switch_clx_is_supported() - Is CLx supported on this type of router
  * @sw: The router to check CLx support for
  */
-static inline bool tb_switch_is_clx_supported(const struct tb_switch *sw)
+static inline bool tb_switch_clx_is_supported(const struct tb_switch *sw)
 {
 	if (sw->quirks & QUIRK_NO_CLX)
 		return false;
@@ -1042,8 +1044,6 @@ static inline bool tb_switch_is_clx_supported(const struct tb_switch *sw)
 	return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
 }
 
-int tb_switch_mask_clx_objections(struct tb_switch *sw);
-
 int tb_switch_pcie_l1_enable(struct tb_switch *sw);
 
 int tb_switch_xhci_connect(struct tb_switch *sw);
@@ -1089,7 +1089,6 @@ void tb_port_lane_bonding_disable(struct tb_port *port);
 int tb_port_wait_for_link_width(struct tb_port *port, int width,
 				int timeout_msec);
 int tb_port_update_credits(struct tb_port *port);
-bool tb_port_is_clx_enabled(struct tb_port *port, unsigned int clx);
 
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec);
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap);
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index be310d97ea7b..6988704c845c 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -388,7 +388,7 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 	 * on these devices e.g. Alpine Ridge and earlier, the TMU mode
 	 * HiFi bi-directional is enabled by default and we don't change it.
 	 */
-	if (!tb_switch_is_clx_supported(sw))
+	if (!tb_switch_clx_is_supported(sw))
 		return 0;
 
 	/* Already disabled? */
@@ -653,7 +653,7 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 	 * these devices e.g. Alpine Ridge and earlier, the TMU mode HiFi
 	 * bi-directional is enabled by default.
 	 */
-	if (!tb_switch_is_clx_supported(sw))
+	if (!tb_switch_clx_is_supported(sw))
 		return 0;
 
 	if (tb_switch_tmu_is_enabled(sw))
@@ -664,7 +664,7 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 		 * Titan Ridge supports CL0s and CL1 only. CL0s and CL1 are
 		 * enabled and supported together.
 		 */
-		if (!tb_switch_is_clx_enabled(sw, TB_CL1))
+		if (!tb_switch_clx_is_enabled(sw, TB_CL1))
 			return -EOPNOTSUPP;
 
 		ret = tb_switch_tmu_disable_objections(sw);
-- 
2.39.2

