Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA96F7147B3
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbjE2KEs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbjE2KEk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:40 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17740A7
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354678; x=1716890678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gkm6gbiGU5ztSscnmh8aKExqHfcIv6Xc00EbRV0M3us=;
  b=cMhqzZedeuDH1qFYxLMJAvLKLCiI6FiQSWQl+7oyhwQp7UMfNYLbV1j6
   XjNum0bjxG4dGdII7p1U/o3gYFX9tNai5161l3e01P+s16kbP83M2RLtx
   4DLS4Q6B7pRQfjh4oM8hhEl+7I4R/fCiH8TYbWghA2v0vEwDGy4529ris
   4pNFtvgtX6+TiitmEideO8usiPCj2/WRzdKLnp7Ciu4TQKKL4CDhwIxuL
   slnjBdWRIgVIDinEh/TCmbpCZxHHJH+O64ejhJQzSirpcVZwHNahIY6K0
   O/N11Ka/ArWtIuuupPE7Xcuk9Uk7TgCO7jMMK2kvqxcmFDZ3ouKo6vFkP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684454"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684454"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518501"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518501"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 51A2EA91; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 13/20] thunderbolt: Switch CL states from enum to a bitmask
Date:   Mon, 29 May 2023 13:04:18 +0300
Message-Id: <20230529100425.6125-14-mika.westerberg@linux.intel.com>
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

This is more natural and follows the hardware register layout better.
This makes it easier to see which CL states we enable (even though they
should be enabled together). Rename 'clx_mask' to 'clx' everywhere as
this is now always bitmask.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/clx.c    | 169 ++++++++++++++++++++---------------
 drivers/thunderbolt/switch.c |   7 +-
 drivers/thunderbolt/tb.c     |   2 +-
 drivers/thunderbolt/tb.h     |  54 ++++-------
 4 files changed, 113 insertions(+), 119 deletions(-)

diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
index d1a502525425..4601607f1901 100644
--- a/drivers/thunderbolt/clx.c
+++ b/drivers/thunderbolt/clx.c
@@ -45,7 +45,7 @@ static int tb_port_pm_secondary_disable(struct tb_port *port)
 }
 
 /* Called for USB4 or Titan Ridge routers only */
-static bool tb_port_clx_supported(struct tb_port *port, unsigned int clx_mask)
+static bool tb_port_clx_supported(struct tb_port *port, unsigned int clx)
 {
 	u32 val, mask = 0;
 	bool ret;
@@ -65,11 +65,11 @@ static bool tb_port_clx_supported(struct tb_port *port, unsigned int clx_mask)
 		return false;
 	}
 
-	if (clx_mask & TB_CL1) {
-		/* CL0s and CL1 are enabled and supported together */
-		mask |= LANE_ADP_CS_0_CL0S_SUPPORT | LANE_ADP_CS_0_CL1_SUPPORT;
-	}
-	if (clx_mask & TB_CL2)
+	if (clx & TB_CL0S)
+		mask |= LANE_ADP_CS_0_CL0S_SUPPORT;
+	if (clx & TB_CL1)
+		mask |= LANE_ADP_CS_0_CL1_SUPPORT;
+	if (clx & TB_CL2)
 		mask |= LANE_ADP_CS_0_CL2_SUPPORT;
 
 	ret = tb_port_read(port, &val, TB_CFG_PORT,
@@ -80,16 +80,17 @@ static bool tb_port_clx_supported(struct tb_port *port, unsigned int clx_mask)
 	return !!(val & mask);
 }
 
-static int tb_port_clx_set(struct tb_port *port, enum tb_clx clx, bool enable)
+static int tb_port_clx_set(struct tb_port *port, unsigned int clx, bool enable)
 {
-	u32 phy, mask;
+	u32 phy, mask = 0;
 	int ret;
 
-	/* CL0s and CL1 are enabled and supported together */
-	if (clx == TB_CL1)
-		mask = LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
-	else
-		/* For now we support only CL0s and CL1. Not CL2 */
+	if (clx & TB_CL0S)
+		mask |= LANE_ADP_CS_1_CL0S_ENABLE;
+	if (clx & TB_CL1)
+		mask |= LANE_ADP_CS_1_CL1_ENABLE;
+
+	if (!mask)
 		return -EOPNOTSUPP;
 
 	ret = tb_port_read(port, &phy, TB_CFG_PORT,
@@ -106,12 +107,12 @@ static int tb_port_clx_set(struct tb_port *port, enum tb_clx clx, bool enable)
 			     port->cap_phy + LANE_ADP_CS_1, 1);
 }
 
-static int tb_port_clx_disable(struct tb_port *port, enum tb_clx clx)
+static int tb_port_clx_disable(struct tb_port *port, unsigned int clx)
 {
 	return tb_port_clx_set(port, clx, false);
 }
 
-static int tb_port_clx_enable(struct tb_port *port, enum tb_clx clx)
+static int tb_port_clx_enable(struct tb_port *port, unsigned int clx)
 {
 	return tb_port_clx_set(port, clx, true);
 }
@@ -119,21 +120,23 @@ static int tb_port_clx_enable(struct tb_port *port, enum tb_clx clx)
 /**
  * tb_port_clx_is_enabled() - Is given CL state enabled
  * @port: USB4 port to check
- * @clx_mask: Mask of CL states to check
+ * @clx: Mask of CL states to check
  *
  * Returns true if any of the given CL states is enabled for @port.
  */
-bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx_mask)
+bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx)
 {
 	u32 val, mask = 0;
 	int ret;
 
-	if (!tb_port_clx_supported(port, clx_mask))
+	if (!tb_port_clx_supported(port, clx))
 		return false;
 
-	if (clx_mask & TB_CL1)
-		mask |= LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
-	if (clx_mask & TB_CL2)
+	if (clx & TB_CL0S)
+		mask |= LANE_ADP_CS_1_CL0S_ENABLE;
+	if (clx & TB_CL1)
+		mask |= LANE_ADP_CS_1_CL1_ENABLE;
+	if (clx & TB_CL2)
 		mask |= LANE_ADP_CS_1_CL2_ENABLE;
 
 	ret = tb_port_read(port, &val, TB_CFG_PORT,
@@ -205,6 +208,50 @@ static int tb_switch_mask_clx_objections(struct tb_switch *sw)
 			   sw->cap_lp + offset, ARRAY_SIZE(val));
 }
 
+/**
+ * tb_switch_clx_is_supported() - Is CLx supported on this type of router
+ * @sw: The router to check CLx support for
+ */
+bool tb_switch_clx_is_supported(const struct tb_switch *sw)
+{
+	if (!clx_enabled)
+		return false;
+
+	if (sw->quirks & QUIRK_NO_CLX)
+		return false;
+
+	/*
+	 * CLx is not enabled and validated on Intel USB4 platforms
+	 * before Alder Lake.
+	 */
+	if (tb_switch_is_tiger_lake(sw))
+		return false;
+
+	return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
+}
+
+static bool validate_mask(unsigned int clx)
+{
+	/* Previous states need to be enabled */
+	if (clx & TB_CL2)
+		return (clx & (TB_CL0S | TB_CL1)) == (TB_CL0S | TB_CL1);
+	if (clx & TB_CL1)
+		return (clx & TB_CL0S) == TB_CL0S;
+	return true;
+}
+
+static const char *clx_name(unsigned int clx)
+{
+	if (clx & TB_CL2)
+		return "CL0s/CL1/CL2";
+	if (clx & TB_CL1)
+		return "CL0s/CL1";
+	if (clx & TB_CL0S)
+		return "CL0s";
+
+	return "unknown";
+}
+
 /**
  * tb_switch_clx_enable() - Enable CLx on upstream port of specified router
  * @sw: Router to enable CLx for
@@ -219,46 +266,32 @@ static int tb_switch_mask_clx_objections(struct tb_switch *sw)
  *
  * Return: Returns 0 on success or an error code on failure.
  */
-int tb_switch_clx_enable(struct tb_switch *sw, enum tb_clx clx)
+int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
 {
-	struct tb_switch *root_sw = sw->tb->root_switch;
 	bool up_clx_support, down_clx_support;
+	struct tb_switch *parent_sw;
 	struct tb_port *up, *down;
 	int ret;
 
-	if (!clx_enabled)
-		return 0;
+	if (!validate_mask(clx))
+		return -EINVAL;
 
-	/*
-	 * CLx is not enabled and validated on Intel USB4 platforms before
-	 * Alder Lake.
-	 */
-	if (root_sw->generation < 4 || tb_switch_is_tiger_lake(root_sw))
+	parent_sw = tb_switch_parent(sw);
+	if (!parent_sw)
 		return 0;
 
-	switch (clx) {
-	case TB_CL1:
-		/* CL0s and CL1 are enabled and supported together */
-		break;
-
-	default:
-		return -EOPNOTSUPP;
-	}
-
-	if (!tb_switch_clx_is_supported(sw))
-		return 0;
-
-	/*
-	 * Enable CLx for host router's downstream port as part of the
-	 * downstream router enabling procedure.
-	 */
-	if (!tb_route(sw))
+	if (!tb_switch_clx_is_supported(parent_sw) ||
+	    !tb_switch_clx_is_supported(sw))
 		return 0;
 
 	/* Enable CLx only for first hop router (depth = 1) */
 	if (tb_route(tb_switch_parent(sw)))
 		return 0;
 
+	/* CL2 is not yet supported */
+	if (clx & TB_CL2)
+		return -EOPNOTSUPP;
+
 	ret = tb_switch_pm_secondary_resolve(sw);
 	if (ret)
 		return ret;
@@ -269,9 +302,9 @@ int tb_switch_clx_enable(struct tb_switch *sw, enum tb_clx clx)
 	up_clx_support = tb_port_clx_supported(up, clx);
 	down_clx_support = tb_port_clx_supported(down, clx);
 
-	tb_port_dbg(up, "%s %ssupported\n", tb_switch_clx_name(clx),
+	tb_port_dbg(up, "%s %ssupported\n", clx_name(clx),
 		    up_clx_support ? "" : "not ");
-	tb_port_dbg(down, "%s %ssupported\n", tb_switch_clx_name(clx),
+	tb_port_dbg(down, "%s %ssupported\n", clx_name(clx),
 		    down_clx_support ? "" : "not ");
 
 	if (!up_clx_support || !down_clx_support)
@@ -294,52 +327,40 @@ int tb_switch_clx_enable(struct tb_switch *sw, enum tb_clx clx)
 		return ret;
 	}
 
-	sw->clx = clx;
+	sw->clx |= clx;
 
-	tb_port_dbg(up, "%s enabled\n", tb_switch_clx_name(clx));
+	tb_port_dbg(up, "%s enabled\n", clx_name(clx));
 	return 0;
 }
 
 /**
  * tb_switch_clx_disable() - Disable CLx on upstream port of specified router
  * @sw: Router to disable CLx for
- * @clx: The CLx state to disable
+ *
+ * Disables all CL states of the given router. Can be called on any
+ * router and if the states were not enabled already does nothing.
  *
  * Return: Returns 0 on success or an error code on failure.
  */
-int tb_switch_clx_disable(struct tb_switch *sw, enum tb_clx clx)
+int tb_switch_clx_disable(struct tb_switch *sw)
 {
+	unsigned int clx = sw->clx;
 	struct tb_port *up, *down;
 	int ret;
 
-	if (!clx_enabled)
-		return 0;
-
-	switch (clx) {
-	case TB_CL1:
-		/* CL0s and CL1 are enabled and supported together */
-		break;
-
-	default:
-		return -EOPNOTSUPP;
-	}
-
 	if (!tb_switch_clx_is_supported(sw))
 		return 0;
 
-	/*
-	 * Disable CLx for host router's downstream port as part of the
-	 * downstream router enabling procedure.
-	 */
-	if (!tb_route(sw))
-		return 0;
-
 	/* Disable CLx only for first hop router (depth = 1) */
 	if (tb_route(tb_switch_parent(sw)))
 		return 0;
 
+	if (!clx)
+		return 0;
+
 	up = tb_upstream_port(sw);
 	down = tb_switch_downstream_port(sw);
+
 	ret = tb_port_clx_disable(up, clx);
 	if (ret)
 		return ret;
@@ -348,8 +369,8 @@ int tb_switch_clx_disable(struct tb_switch *sw, enum tb_clx clx)
 	if (ret)
 		return ret;
 
-	sw->clx = TB_CLX_DISABLE;
+	sw->clx = 0;
 
-	tb_port_dbg(up, "%s disabled\n", tb_switch_clx_name(clx));
+	tb_port_dbg(up, "%s disabled\n", clx_name(clx));
 	return 0;
 }
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 984b5536e143..f33a09d92c9b 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3111,13 +3111,8 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 	/*
 	 * Actually only needed for Titan Ridge but for simplicity can be
 	 * done for USB4 device too as CLx is re-enabled at resume.
-	 * CL0s and CL1 are enabled and supported together.
 	 */
-	if (tb_switch_clx_is_enabled(sw, TB_CL1)) {
-		if (tb_switch_clx_disable(sw, TB_CL1))
-			tb_sw_warn(sw, "failed to disable %s on upstream port\n",
-				   tb_switch_clx_name(TB_CL1));
-	}
+	tb_switch_clx_disable(sw);
 
 	err = tb_plug_events_active(sw, false);
 	if (err)
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index e4f1233eb958..2d360508aeeb 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -248,7 +248,7 @@ static int tb_enable_clx(struct tb_switch *sw)
 	 * CL0s and CL1 are enabled and supported together.
 	 * Silently ignore CLx enabling in case CLx is not supported.
 	 */
-	ret = tb_switch_clx_enable(sw, TB_CL1);
+	ret = tb_switch_clx_enable(sw, TB_CL0S | TB_CL1);
 	return ret == -EOPNOTSUPP ? 0 : ret;
 }
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index d29bc7eab051..72e245639eb8 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -117,13 +117,6 @@ struct tb_switch_tmu {
 	enum tb_switch_tmu_rate rate_request;
 };
 
-enum tb_clx {
-	TB_CLX_DISABLE,
-	/* CL0s and CL1 are enabled and supported together */
-	TB_CL1 = BIT(0),
-	TB_CL2 = BIT(1),
-};
-
 /**
  * struct tb_switch - a thunderbolt switch
  * @dev: Device for the switch
@@ -174,7 +167,7 @@ enum tb_clx {
  * @min_dp_main_credits: Router preferred minimum number of buffers for DP MAIN
  * @max_pcie_credits: Router preferred number of buffers for PCIe
  * @max_dma_credits: Router preferred number of buffers for DMA/P2P
- * @clx: CLx state on the upstream link of the router
+ * @clx: CLx states on the upstream link of the router
  *
  * When the switch is being added or removed to the domain (other
  * switches) you need to have domain lock held.
@@ -225,7 +218,7 @@ struct tb_switch {
 	unsigned int min_dp_main_credits;
 	unsigned int max_pcie_credits;
 	unsigned int max_dma_credits;
-	enum tb_clx clx;
+	unsigned int clx;
 };
 
 /**
@@ -455,6 +448,11 @@ struct tb_path {
 #define TB_WAKE_ON_PCIE		BIT(4)
 #define TB_WAKE_ON_DP		BIT(5)
 
+/* CL states */
+#define TB_CL0S			BIT(0)
+#define TB_CL1			BIT(1)
+#define TB_CL2			BIT(2)
+
 /**
  * struct tb_cm_ops - Connection manager specific operations vector
  * @driver_ready: Called right after control channel is started. Used by
@@ -1002,46 +1000,26 @@ static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw)
 	       sw->tmu.unidirectional == sw->tmu.unidirectional_request;
 }
 
-bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx_mask);
-
-static inline const char *tb_switch_clx_name(enum tb_clx clx)
-{
-	switch (clx) {
-	/* CL0s and CL1 are enabled and supported together */
-	case TB_CL1:
-		return "CL0s/CL1";
-	default:
-		return "unknown";
-	}
-}
+bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx);
 
-int tb_switch_clx_enable(struct tb_switch *sw, enum tb_clx clx);
-int tb_switch_clx_disable(struct tb_switch *sw, enum tb_clx clx);
+bool tb_switch_clx_is_supported(const struct tb_switch *sw);
+int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx);
+int tb_switch_clx_disable(struct tb_switch *sw);
 
 /**
  * tb_switch_clx_is_enabled() - Checks if the CLx is enabled
  * @sw: Router to check for the CLx
- * @clx: The CLx state to check for
+ * @clx: The CLx states to check for
  *
  * Checks if the specified CLx is enabled on the router upstream link.
+ * Returns true if any of the given states is enabled.
+ *
  * Not applicable for a host router.
  */
 static inline bool tb_switch_clx_is_enabled(const struct tb_switch *sw,
-					    enum tb_clx clx)
+					    unsigned int clx)
 {
-	return sw->clx == clx;
-}
-
-/**
- * tb_switch_clx_is_supported() - Is CLx supported on this type of router
- * @sw: The router to check CLx support for
- */
-static inline bool tb_switch_clx_is_supported(const struct tb_switch *sw)
-{
-	if (sw->quirks & QUIRK_NO_CLX)
-		return false;
-
-	return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
+	return sw->clx & clx;
 }
 
 int tb_switch_pcie_l1_enable(struct tb_switch *sw);
-- 
2.39.2

