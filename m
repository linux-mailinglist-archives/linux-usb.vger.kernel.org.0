Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 760225234C5
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 15:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244230AbiEKN43 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 09:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244385AbiEKN40 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 09:56:26 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9FA1D0F0
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 06:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652277384; x=1683813384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WLv2+svkSimJ0+/qWEmx6eCSLkOmWd84u72GjbLcEVc=;
  b=ktyJotTyqrVF/2eLRw7lipvBEn2LpY4QxoWd0P6UDrAOgzxHfrSdx9yT
   nTs1Qlamb+KLkGVOScxvaDYitHkDPn20VYcUhPRHAK36KUNG++kgmJdjk
   +2eg2bK4yeomgg4qkjft8y3lyrjQkXljIIZdBMVMmkRdTg9eN+k3wCMcV
   Ok18AIyePVWnlSSu/ApYjtxM085FkqJVBT52893/qBMNl3zLkeePRJpmI
   1Acf/ASkgK5l9lFHQEPaw+0LRaCTdrInh8Ux7YTpUbFp9JdpfszSBDjrt
   YL/5xB9mOwR4KrBXW2Az2bK08iF8hGV6JGcsDAYaA/ImTZx2md6OywGnP
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="249599721"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="249599721"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 06:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="553332032"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga002.jf.intel.com with ESMTP; 11 May 2022 06:56:22 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v3 5/6] thunderbolt: Add CL1 support for USB4 and Titan Ridge routers
Date:   Wed, 11 May 2022 17:05:48 +0300
Message-Id: <20220511140549.10571-6-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220511140549.10571-1-gil.fine@intel.com>
References: <20220511140549.10571-1-gil.fine@intel.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In this patch we add support for a second low power state of the link: CL1.
Low power states (called collectively CLx) are used to reduce
transmitter and receiver power when a high-speed lane is idle.
We enable it, if both sides of the link support it,
and only for the first hop router (i.e. the first device that connected
to the host router). This is needed for better thermal management.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c  |  89 ++++++++---------
 drivers/thunderbolt/tb.c      |  55 ++++++++---
 drivers/thunderbolt/tb.h      |  46 ++++-----
 drivers/thunderbolt/tb_regs.h |   6 ++
 drivers/thunderbolt/tmu.c     | 177 ++++++++++++++++++++++++++++------
 5 files changed, 266 insertions(+), 107 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 42b7daaf9c4d..7ce2ac96da23 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3062,10 +3062,12 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 	/*
 	 * Actually only needed for Titan Ridge but for simplicity can be
 	 * done for USB4 device too as CLx is re-enabled at resume.
+	 * CL0s and CL1 are enabled and supported together.
 	 */
-	if (tb_switch_is_clx_enabled(sw)) {
-		if (tb_switch_disable_clx(sw, TB_CL0S))
-			tb_sw_warn(sw, "failed to disable CLx on upstream port\n");
+	if (tb_switch_is_clx_enabled(sw, TB_CL1)) {
+		if (tb_switch_disable_clx(sw, TB_CL1))
+			tb_sw_warn(sw, "failed to disable %s on upstream port\n",
+				   tb_switch_clx_name(TB_CL1));
 	}
 
 	err = tb_plug_events_active(sw, false);
@@ -3357,13 +3359,12 @@ static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
 	}
 
 	switch (clx) {
-	case TB_CL0S:
-		/* CL0s support requires also CL1 support */
+	case TB_CL1:
+		/* CL0s and CL1 are enabled and supported together */
 		mask = LANE_ADP_CS_0_CL0S_SUPPORT | LANE_ADP_CS_0_CL1_SUPPORT;
 		break;
 
-	/* For now we support only CL0s. Not CL1, CL2 */
-	case TB_CL1:
+	/* For now we support only CL0s and CL1. Not CL2 */
 	case TB_CL2:
 	default:
 		return false;
@@ -3377,18 +3378,18 @@ static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
 	return !!(val & mask);
 }
 
-static inline bool tb_port_cl0s_supported(struct tb_port *port)
-{
-	return tb_port_clx_supported(port, TB_CL0S);
-}
-
-static int __tb_port_cl0s_set(struct tb_port *port, bool enable)
+static int __tb_port_clx_set(struct tb_port *port, enum tb_clx clx, bool enable)
 {
 	u32 phy, mask;
 	int ret;
 
-	/* To enable CL0s also required to enable CL1 */
-	mask = LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
+	/* CL0s and CL1 are enabled and supported together */
+	if (clx == TB_CL1)
+		mask = LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
+	else
+		/* For now we support only CL0s and CL1. Not CL2 */
+		return -EOPNOTSUPP;
+
 	ret = tb_port_read(port, &phy, TB_CFG_PORT,
 			   port->cap_phy + LANE_ADP_CS_1, 1);
 	if (ret)
@@ -3403,20 +3404,20 @@ static int __tb_port_cl0s_set(struct tb_port *port, bool enable)
 			     port->cap_phy + LANE_ADP_CS_1, 1);
 }
 
-static int tb_port_cl0s_disable(struct tb_port *port)
+static int tb_port_clx_disable(struct tb_port *port, enum tb_clx clx)
 {
-	return __tb_port_cl0s_set(port, false);
+	return __tb_port_clx_set(port, clx, false);
 }
 
-static int tb_port_cl0s_enable(struct tb_port *port)
+static int tb_port_clx_enable(struct tb_port *port, enum tb_clx clx)
 {
-	return __tb_port_cl0s_set(port, true);
+	return __tb_port_clx_set(port, clx, true);
 }
 
-static int tb_switch_enable_cl0s(struct tb_switch *sw)
+static int __tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
 {
 	struct tb_switch *parent = tb_switch_parent(sw);
-	bool up_cl0s_support, down_cl0s_support;
+	bool up_clx_support, down_clx_support;
 	struct tb_port *up, *down;
 	int ret;
 
@@ -3441,37 +3442,37 @@ static int tb_switch_enable_cl0s(struct tb_switch *sw)
 	up = tb_upstream_port(sw);
 	down = tb_port_at(tb_route(sw), parent);
 
-	up_cl0s_support = tb_port_cl0s_supported(up);
-	down_cl0s_support = tb_port_cl0s_supported(down);
+	up_clx_support = tb_port_clx_supported(up, clx);
+	down_clx_support = tb_port_clx_supported(down, clx);
 
-	tb_port_dbg(up, "CL0s %ssupported\n",
-		    up_cl0s_support ? "" : "not ");
-	tb_port_dbg(down, "CL0s %ssupported\n",
-		    down_cl0s_support ? "" : "not ");
+	tb_port_dbg(up, "%s %ssupported\n", tb_switch_clx_name(clx),
+		    up_clx_support ? "" : "not ");
+	tb_port_dbg(down, "%s %ssupported\n", tb_switch_clx_name(clx),
+		    down_clx_support ? "" : "not ");
 
-	if (!up_cl0s_support || !down_cl0s_support)
+	if (!up_clx_support || !down_clx_support)
 		return -EOPNOTSUPP;
 
-	ret = tb_port_cl0s_enable(up);
+	ret = tb_port_clx_enable(up, clx);
 	if (ret)
 		return ret;
 
-	ret = tb_port_cl0s_enable(down);
+	ret = tb_port_clx_enable(down, clx);
 	if (ret) {
-		tb_port_cl0s_disable(up);
+		tb_port_clx_disable(up, clx);
 		return ret;
 	}
 
 	ret = tb_switch_mask_clx_objections(sw);
 	if (ret) {
-		tb_port_cl0s_disable(up);
-		tb_port_cl0s_disable(down);
+		tb_port_clx_disable(up, clx);
+		tb_port_clx_disable(down, clx);
 		return ret;
 	}
 
-	sw->clx = TB_CL0S;
+	sw->clx = clx;
 
-	tb_port_dbg(up, "CL0s enabled\n");
+	tb_port_dbg(up, "%s enabled\n", tb_switch_clx_name(clx));
 	return 0;
 }
 
@@ -3504,15 +3505,16 @@ int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
 		return 0;
 
 	switch (clx) {
-	case TB_CL0S:
-		return tb_switch_enable_cl0s(sw);
+	case TB_CL1:
+		/* CL0s and CL1 are enabled and supported together */
+		return __tb_switch_enable_clx(sw, clx);
 
 	default:
 		return -EOPNOTSUPP;
 	}
 }
 
-static int tb_switch_disable_cl0s(struct tb_switch *sw)
+static int __tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
 {
 	struct tb_switch *parent = tb_switch_parent(sw);
 	struct tb_port *up, *down;
@@ -3534,17 +3536,17 @@ static int tb_switch_disable_cl0s(struct tb_switch *sw)
 
 	up = tb_upstream_port(sw);
 	down = tb_port_at(tb_route(sw), parent);
-	ret = tb_port_cl0s_disable(up);
+	ret = tb_port_clx_disable(up, clx);
 	if (ret)
 		return ret;
 
-	ret = tb_port_cl0s_disable(down);
+	ret = tb_port_clx_disable(down, clx);
 	if (ret)
 		return ret;
 
 	sw->clx = TB_CLX_DISABLE;
 
-	tb_port_dbg(up, "CL0s disabled\n");
+	tb_port_dbg(up, "%s disabled\n", tb_switch_clx_name(clx));
 	return 0;
 }
 
@@ -3561,8 +3563,9 @@ int tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
 		return 0;
 
 	switch (clx) {
-	case TB_CL0S:
-		return tb_switch_disable_cl0s(sw);
+	case TB_CL1:
+		/* CL0s and CL1 are enabled and supported together */
+		return __tb_switch_disable_clx(sw, clx);
 
 	default:
 		return -EOPNOTSUPP;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 7419cd1aefba..f512197e719b 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -221,7 +221,7 @@ static int tb_enable_tmu(struct tb_switch *sw)
 	int ret;
 
 	/* If it is already enabled in correct mode, don't touch it */
-	if (tb_switch_tmu_hifi_is_enabled(sw, sw->tmu.unidirectional_request))
+	if (tb_switch_tmu_is_enabled(sw, sw->tmu.unidirectional_request))
 		return 0;
 
 	ret = tb_switch_tmu_disable(sw);
@@ -670,13 +670,24 @@ static void tb_scan_port(struct tb_port *port)
 	tb_switch_lane_bonding_enable(sw);
 	/* Set the link configured */
 	tb_switch_configure_link(sw);
-	/* Silently ignore CLx enabling in case CLx is not supported */
-	ret = tb_switch_enable_clx(sw, TB_CL0S);
+	/*
+	 * CL0s and CL1 are enabled and supported together.
+	 * Silently ignore CLx enabling in case CLx is not supported.
+	 */
+	ret = tb_switch_enable_clx(sw, TB_CL1);
 	if (ret && ret != -EOPNOTSUPP)
-		tb_sw_warn(sw, "failed to enable CLx on upstream port\n");
+		tb_sw_warn(sw, "failed to enable %s on upstream port\n",
+			   tb_switch_clx_name(TB_CL1));
 
-	tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI,
-				tb_switch_is_clx_enabled(sw));
+	if (tb_switch_is_clx_enabled(sw, TB_CL1))
+		/*
+		 * To support highest CLx state, we set router's TMU to
+		 * Normal-Uni mode.
+		 */
+		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_NORMAL, true);
+	else
+		/* If CLx disabled, configure router's TMU to HiFi-Bidir mode*/
+		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
 
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to enable TMU\n");
@@ -1416,7 +1427,12 @@ static int tb_start(struct tb *tb)
 		return ret;
 	}
 
-	tb_switch_tmu_configure(tb->root_switch, TB_SWITCH_TMU_RATE_HIFI, false);
+	/*
+	 * To support highest CLx state, we set host router's TMU to
+	 * Normal mode.
+	 */
+	tb_switch_tmu_configure(tb->root_switch, TB_SWITCH_TMU_RATE_NORMAL,
+				false);
 	/* Enable TMU if it is off */
 	tb_switch_tmu_enable(tb->root_switch);
 	/* Full scan to discover devices added before the driver was loaded. */
@@ -1461,16 +1477,25 @@ static void tb_restore_children(struct tb_switch *sw)
 	if (sw->is_unplugged)
 		return;
 
-	/* Silently ignore CLx re-enabling in case CLx is not supported */
-	ret = tb_switch_enable_clx(sw, TB_CL0S);
-	if (ret && ret != -EOPNOTSUPP)
-		tb_sw_warn(sw, "failed to re-enable CLx on upstream port\n");
-
 	/*
-	 * tb_switch_tmu_configure() was already called when the switch was
-	 * added before entering system sleep or runtime suspend,
-	 * so no need to call it again before enabling TMU.
+	 * CL0s and CL1 are enabled and supported together.
+	 * Silently ignore CLx re-enabling in case CLx is not supported.
 	 */
+	ret = tb_switch_enable_clx(sw, TB_CL1);
+	if (ret && ret != -EOPNOTSUPP)
+		tb_sw_warn(sw, "failed to re-enable %s on upstream port\n",
+			   tb_switch_clx_name(TB_CL1));
+
+	if (tb_switch_is_clx_enabled(sw, TB_CL1))
+		/*
+		 * To support highest CLx state, we set router's TMU to
+		 * Normal-Uni mode.
+		 */
+		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_NORMAL, true);
+	else
+		/* If CLx disabled, configure router's TMU to HiFi-Bidir mode*/
+		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
+
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to restore TMU configuration\n");
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ad025ff142ba..a16fffba9dd2 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -13,6 +13,7 @@
 #include <linux/pci.h>
 #include <linux/thunderbolt.h>
 #include <linux/uuid.h>
+#include <linux/bitfield.h>
 
 #include "tb_regs.h"
 #include "ctl.h"
@@ -111,7 +112,7 @@ struct tb_switch_tmu {
 
 enum tb_clx {
 	TB_CLX_DISABLE,
-	TB_CL0S,
+	/* CL0s and CL1 are enabled and supported together */
 	TB_CL1,
 	TB_CL2,
 };
@@ -934,45 +935,46 @@ void tb_switch_tmu_configure(struct tb_switch *sw,
 			     enum tb_switch_tmu_rate rate,
 			     bool unidirectional);
 /**
- * tb_switch_tmu_hifi_is_enabled() - Checks if the specified TMU mode is enabled
+ * tb_switch_tmu_is_enabled() - Checks if the specified TMU mode is enabled
  * @sw: Router whose TMU mode to check
  * @unidirectional: If uni-directional (bi-directional otherwise)
  *
  * Return true if hardware TMU configuration matches the one passed in
- * as parameter. That is HiFi and either uni-directional or bi-directional.
+ * as parameter. That is HiFi/Normal and either uni-directional or bi-directional.
  */
-static inline bool tb_switch_tmu_hifi_is_enabled(const struct tb_switch *sw,
-						 bool unidirectional)
+static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw,
+					    bool unidirectional)
 {
-	return sw->tmu.rate == TB_SWITCH_TMU_RATE_HIFI &&
+	return sw->tmu.rate == sw->tmu.rate_request &&
 	       sw->tmu.unidirectional == unidirectional;
 }
 
+static inline const char *tb_switch_clx_name(enum tb_clx clx)
+{
+	switch (clx) {
+	/* CL0s and CL1 are enabled and supported together */
+	case TB_CL1:
+		return "CL0s/CL1";
+	default:
+		return "Unknown";
+	}
+}
+
 int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx);
 int tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx);
 
 /**
  * tb_switch_is_clx_enabled() - Checks if the CLx is enabled
- * @sw: Router to check the CLx state for
- *
- * Checks if the CLx is enabled on the router upstream link.
- * Not applicable for a host router.
- */
-static inline bool tb_switch_is_clx_enabled(const struct tb_switch *sw)
-{
-	return sw->clx != TB_CLX_DISABLE;
-}
-
-/**
- * tb_switch_is_cl0s_enabled() - Checks if the CL0s is enabled
- * @sw: Router to check for the CL0s
+ * @sw: Router to check for the CLx
+ * @clx: The CLx state to check for
  *
- * Checks if the CL0s is enabled on the router upstream link.
+ * Checks if the specified CLx is enabled on the router upstream link.
  * Not applicable for a host router.
  */
-static inline bool tb_switch_is_cl0s_enabled(const struct tb_switch *sw)
+static inline bool tb_switch_is_clx_enabled(const struct tb_switch *sw,
+					    enum tb_clx clx)
 {
-	return sw->clx == TB_CL0S;
+	return sw->clx == clx;
 }
 
 /**
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index b301eeb0c89b..dd85aac5ced3 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -234,6 +234,7 @@ enum usb4_switch_op {
 
 /* Router TMU configuration */
 #define TMU_RTR_CS_0				0x00
+#define TMU_RTR_CS_0_FREQ_WIND_MASK		GENMASK(26, 16)
 #define TMU_RTR_CS_0_TD				BIT(27)
 #define TMU_RTR_CS_0_UCAP			BIT(30)
 #define TMU_RTR_CS_1				0x01
@@ -244,6 +245,11 @@ enum usb4_switch_op {
 #define TMU_RTR_CS_3_LOCAL_TIME_NS_MASK		GENMASK(15, 0)
 #define TMU_RTR_CS_3_TS_PACKET_INTERVAL_MASK	GENMASK(31, 16)
 #define TMU_RTR_CS_3_TS_PACKET_INTERVAL_SHIFT	16
+#define TMU_RTR_CS_15				0xf
+#define TMU_RTR_CS_15_FREQ_AVG_MASK		GENMASK(5, 0)
+#define TMU_RTR_CS_15_DELAY_AVG_MASK		GENMASK(11, 6)
+#define TMU_RTR_CS_15_OFFSET_AVG_MASK		GENMASK(17, 12)
+#define TMU_RTR_CS_15_ERROR_AVG_MASK		GENMASK(23, 18)
 #define TMU_RTR_CS_22				0x16
 #define TMU_RTR_CS_24				0x18
 #define TMU_RTR_CS_25				0x19
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 985ca43b8f39..e822ab90338b 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -11,6 +11,55 @@
 
 #include "tb.h"
 
+static int tb_switch_set_tmu_mode_params(struct tb_switch *sw,
+					 enum tb_switch_tmu_rate rate)
+{
+	u32 freq_meas_wind[2] = { 30, 800 };
+	u32 avg_const[2] = { 4, 8 };
+	u32 freq, avg, val;
+	int ret;
+
+	if (rate == TB_SWITCH_TMU_RATE_NORMAL) {
+		freq = freq_meas_wind[0];
+		avg = avg_const[0];
+	} else if (rate == TB_SWITCH_TMU_RATE_HIFI) {
+		freq = freq_meas_wind[1];
+		avg = avg_const[1];
+	} else {
+		return 0;
+	}
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
+			 sw->tmu.cap + TMU_RTR_CS_0, 1);
+	if (ret)
+		return ret;
+
+	val &= ~TMU_RTR_CS_0_FREQ_WIND_MASK;
+	val |= FIELD_PREP(TMU_RTR_CS_0_FREQ_WIND_MASK, freq);
+
+	ret = tb_sw_write(sw, &val, TB_CFG_SWITCH,
+			  sw->tmu.cap + TMU_RTR_CS_0, 1);
+	if (ret)
+		return ret;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
+			 sw->tmu.cap + TMU_RTR_CS_15, 1);
+	if (ret)
+		return ret;
+
+	val &= ~TMU_RTR_CS_15_FREQ_AVG_MASK &
+		~TMU_RTR_CS_15_DELAY_AVG_MASK &
+		~TMU_RTR_CS_15_OFFSET_AVG_MASK &
+		~TMU_RTR_CS_15_ERROR_AVG_MASK;
+	val |=  FIELD_PREP(TMU_RTR_CS_15_FREQ_AVG_MASK, avg) |
+		FIELD_PREP(TMU_RTR_CS_15_DELAY_AVG_MASK, avg) |
+		FIELD_PREP(TMU_RTR_CS_15_OFFSET_AVG_MASK, avg) |
+		FIELD_PREP(TMU_RTR_CS_15_ERROR_AVG_MASK, avg);
+
+	return tb_sw_write(sw, &val, TB_CFG_SWITCH,
+			   sw->tmu.cap + TMU_RTR_CS_15, 1);
+}
+
 static const char *tb_switch_tmu_mode_name(const struct tb_switch *sw)
 {
 	bool root_switch = !tb_route(sw);
@@ -348,7 +397,7 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 
 
 	if (tb_route(sw)) {
-		bool unidirectional = tb_switch_tmu_hifi_is_enabled(sw, true);
+		bool unidirectional = sw->tmu.unidirectional;
 		struct tb_switch *parent = tb_switch_parent(sw);
 		struct tb_port *down, *up;
 		int ret;
@@ -412,6 +461,7 @@ static void __tb_switch_tmu_off(struct tb_switch *sw, bool unidirectional)
 	else
 		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
 
+	tb_switch_set_tmu_mode_params(sw, sw->tmu.rate);
 	tb_port_tmu_unidirectional_disable(down);
 	tb_port_tmu_unidirectional_disable(up);
 }
@@ -493,7 +543,11 @@ static int __tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
 
 	up = tb_upstream_port(sw);
 	down = tb_port_at(tb_route(sw), parent);
-	ret = tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_HIFI);
+	ret = tb_switch_tmu_rate_write(parent, sw->tmu.rate_request);
+	if (ret)
+		return ret;
+
+	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.rate_request);
 	if (ret)
 		return ret;
 
@@ -520,7 +574,83 @@ static int __tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
 	return ret;
 }
 
-static int tb_switch_tmu_hifi_enable(struct tb_switch *sw)
+static void __tb_switch_tmu_change_mode_prev(struct tb_switch *sw)
+{
+	struct tb_switch *parent = tb_switch_parent(sw);
+	struct tb_port *down, *up;
+
+	down = tb_port_at(tb_route(sw), parent);
+	up = tb_upstream_port(sw);
+	/*
+	 * In case of any failure in one of the steps when change mode,
+	 * get back to the TMU configurations in previous mode.
+	 * In case of additional failures in the functions below,
+	 * ignore them since the caller shall already report a failure.
+	 */
+	tb_port_tmu_set_unidirectional(down, sw->tmu.unidirectional);
+	if (sw->tmu.unidirectional_request)
+		tb_switch_tmu_rate_write(parent, sw->tmu.rate);
+	else
+		tb_switch_tmu_rate_write(sw, sw->tmu.rate);
+
+	tb_switch_set_tmu_mode_params(sw, sw->tmu.rate);
+	tb_port_tmu_set_unidirectional(up, sw->tmu.unidirectional);
+}
+
+static int __tb_switch_tmu_change_mode(struct tb_switch *sw)
+{
+	struct tb_switch *parent = tb_switch_parent(sw);
+	struct tb_port *up, *down;
+	int ret;
+
+	up = tb_upstream_port(sw);
+	down = tb_port_at(tb_route(sw), parent);
+	ret = tb_port_tmu_set_unidirectional(down, sw->tmu.unidirectional_request);
+	if (ret)
+		goto out;
+
+	if (sw->tmu.unidirectional_request)
+		ret = tb_switch_tmu_rate_write(parent, sw->tmu.rate_request);
+	else
+		ret = tb_switch_tmu_rate_write(sw, sw->tmu.rate_request);
+	if (ret)
+		return ret;
+
+	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.rate_request);
+	if (ret)
+		return ret;
+
+	ret = tb_port_tmu_set_unidirectional(up, sw->tmu.unidirectional_request);
+	if (ret)
+		goto out;
+
+	ret = tb_port_tmu_time_sync_enable(down);
+	if (ret)
+		goto out;
+
+	ret = tb_port_tmu_time_sync_enable(up);
+	if (ret)
+		goto out;
+
+	return 0;
+
+out:
+	__tb_switch_tmu_change_mode_prev(sw);
+	return ret;
+}
+
+/**
+ * tb_switch_tmu_enable() - Enable TMU on a router
+ * @sw: Router whose TMU to enable
+ *
+ * Enables TMU of a router to be in uni-directional Normal/HiFi
+ * or bi-directional HiFi mode. Calling tb_switch_tmu_configure() is required
+ * before calling this function, to select the mode Normal/HiFi and
+ * directionality (uni-directional/bi-directional).
+ * In HiFi mode all tunneling should work. In Normal mode, DP tunneling can't
+ * work. Uni-directional mode is required for CLx (Link Low-Power) to work.
+ */
+int tb_switch_tmu_enable(struct tb_switch *sw)
 {
 	bool unidirectional = sw->tmu.unidirectional_request;
 	int ret;
@@ -536,12 +666,15 @@ static int tb_switch_tmu_hifi_enable(struct tb_switch *sw)
 	if (!tb_switch_is_clx_supported(sw))
 		return 0;
 
-	if (tb_switch_tmu_hifi_is_enabled(sw, sw->tmu.unidirectional_request))
+	if (tb_switch_tmu_is_enabled(sw, sw->tmu.unidirectional_request))
 		return 0;
 
 	if (tb_switch_is_titan_ridge(sw) && unidirectional) {
-		/* Titan Ridge supports only CL0s */
-		if (!tb_switch_is_cl0s_enabled(sw))
+		/*
+		 * Titan Ridge supports CL0s and CL1 only. CL0s and CL1 are
+		 * enabled and supported together.
+		 */
+		if (!tb_switch_is_clx_enabled(sw, TB_CL1))
 			return -EOPNOTSUPP;
 
 		ret = tb_switch_tmu_objection_mask(sw);
@@ -558,7 +691,11 @@ static int tb_switch_tmu_hifi_enable(struct tb_switch *sw)
 		return ret;
 
 	if (tb_route(sw)) {
-		/* The used mode changes are from OFF to HiFi-Uni/HiFi-BiDir */
+		/*
+		 * The used mode changes are from OFF to
+		 * HiFi-Uni/HiFi-BiDir/Normal-Uni or from Normal-Uni to
+		 * HiFi-Uni.
+		 */
 		if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF) {
 			if (unidirectional)
 				ret = __tb_switch_tmu_enable_unidirectional(sw);
@@ -566,6 +703,10 @@ static int tb_switch_tmu_hifi_enable(struct tb_switch *sw)
 				ret = __tb_switch_tmu_enable_bidirectional(sw);
 			if (ret)
 				return ret;
+		} else if (sw->tmu.rate == TB_SWITCH_TMU_RATE_NORMAL) {
+			ret = __tb_switch_tmu_change_mode(sw);
+			if (ret)
+				return ret;
 		}
 		sw->tmu.unidirectional = unidirectional;
 	} else {
@@ -575,35 +716,17 @@ static int tb_switch_tmu_hifi_enable(struct tb_switch *sw)
 		 * of the child node - see above.
 		 * Here only the host router' rate configuration is written.
 		 */
-		ret = tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_HIFI);
+		ret = tb_switch_tmu_rate_write(sw, sw->tmu.rate_request);
 		if (ret)
 			return ret;
 	}
 
-	sw->tmu.rate = TB_SWITCH_TMU_RATE_HIFI;
+	sw->tmu.rate = sw->tmu.rate_request;
 
 	tb_sw_dbg(sw, "TMU: mode set to: %s\n", tb_switch_tmu_mode_name(sw));
 	return tb_switch_tmu_set_time_disruption(sw, false);
 }
 
-/**
- * tb_switch_tmu_enable() - Enable TMU on a router
- * @sw: Router whose TMU to enable
- *
- * Enables TMU of a router to be in uni-directional or bi-directional HiFi mode.
- * Calling tb_switch_tmu_configure() is required before calling this function,
- * to select the mode HiFi and directionality (uni-directional/bi-directional).
- * In both modes all tunneling should work. Uni-directional mode is required for
- * CLx (Link Low-Power) to work.
- */
-int tb_switch_tmu_enable(struct tb_switch *sw)
-{
-	if (sw->tmu.rate_request == TB_SWITCH_TMU_RATE_NORMAL)
-		return -EOPNOTSUPP;
-
-	return tb_switch_tmu_hifi_enable(sw);
-}
-
 /**
  * tb_switch_tmu_configure() - Configure the TMU rate and directionality
  * @sw: Router whose mode to change
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

