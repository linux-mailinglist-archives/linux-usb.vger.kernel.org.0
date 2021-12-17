Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8EB4781EE
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 02:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbhLQBKa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 20:10:30 -0500
Received: from mga09.intel.com ([134.134.136.24]:64450 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230183AbhLQBKa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Dec 2021 20:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639703429; x=1671239429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/bgrEJ15ffR5IaIrCAAwD5s59n4Pf0iBkvgsEeWMLaE=;
  b=P7EeVCAomwPpleifjxmjbWxQa2gWAbW7JsZWmEk7/BIEwaNk2S1eMjZs
   xzZjRNxp9GkR48LBMcv3JssiqdfFx/r1Xo+4UAJk8kXKvpmlxs0nBaXXs
   dnmMMGeVkg30vrFpP4yaGKHAyQKe9swaK0dz1VUccnQelBdq9Lqs7A6He
   tNtr/A5Xjx4/Ojz4CPedgwucCHDOXsbtGg/5dUPzCzPhKibmpbLqC9XhR
   9lKOKevI2vGXX/nYXCzehUw6VsgKRIvNxRjsiw9JaXrOMJt5lyWx5hK5l
   /YdfTok9NyFQjzILBfOmbkwAFrHAOeR55URQ5/Bcq0VH4nyS6AZgnG7ou
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239460817"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="239460817"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 17:10:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="605733683"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2021 17:10:13 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v2 1/7] thunderbolt: Add TMU unidirectional mode
Date:   Fri, 17 Dec 2021 03:16:38 +0200
Message-Id: <20211217011644.21634-2-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211217011644.21634-1-gil.fine@intel.com>
References: <20211217011644.21634-1-gil.fine@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Up until Titan Ridge (Thunderbolt 3) device, routers only supported
bidirectional mode. In this patch, we add to TMU, a unidirectional mode.
Unidirectional mode is needed for enabling of low power state of the link
(CLx).

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/tb.c      |   9 +-
 drivers/thunderbolt/tb.h      |  24 +--
 drivers/thunderbolt/tb_regs.h |   3 +
 drivers/thunderbolt/tmu.c     | 286 ++++++++++++++++++++++++++++------
 4 files changed, 267 insertions(+), 55 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index a231191b06c6..96e0a029d6c8 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -221,7 +221,7 @@ static int tb_enable_tmu(struct tb_switch *sw)
 	int ret;
 
 	/* If it is already enabled in correct mode, don't touch it */
-	if (tb_switch_tmu_is_enabled(sw))
+	if (tb_switch_tmu_hifi_is_enabled(sw, sw->tmu.unidirect_request))
 		return 0;
 
 	ret = tb_switch_tmu_disable(sw);
@@ -669,6 +669,7 @@ static void tb_scan_port(struct tb_port *port)
 	tb_switch_lane_bonding_enable(sw);
 	/* Set the link configured */
 	tb_switch_configure_link(sw);
+	tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
 
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to enable TMU\n");
@@ -1375,6 +1376,7 @@ static int tb_start(struct tb *tb)
 		return ret;
 	}
 
+	tb_switch_tmu_configure(tb->root_switch, TB_SWITCH_TMU_RATE_HIFI, false);
 	/* Enable TMU if it is off */
 	tb_switch_tmu_enable(tb->root_switch);
 	/* Full scan to discover devices added before the driver was loaded. */
@@ -1418,6 +1420,11 @@ static void tb_restore_children(struct tb_switch *sw)
 	if (sw->is_unplugged)
 		return;
 
+	/*
+	 * tb_switch_tmu_configure() was already called when the switch was
+	 * added before entering system sleep or runtime suspend,
+	 * so no need to call it again before enabling TMU.
+	 */
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to restore TMU configuration\n");
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 3fae40670b72..b57f14893f38 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -89,15 +89,24 @@ enum tb_switch_tmu_rate {
  * @cap: Offset to the TMU capability (%0 if not found)
  * @has_ucap: Does the switch support uni-directional mode
  * @rate: TMU refresh rate related to upstream switch. In case of root
- *	  switch this holds the domain rate.
+ *	  switch this holds the domain rate. Reflects the HW setting.
  * @unidirectional: Is the TMU in uni-directional or bi-directional mode
- *		    related to upstream switch. Don't case for root switch.
+ *		    related to upstream switch. Don't care for root switch.
+ *		    Reflects the HW setting.
+ * @unidirect_request: Is the new TMU mode: uni-directional or bi-directional
+ *		       that is requested to be set. Related to upstream switch.
+ *		       Don't care for root switch.
+ * @rate_request: TMU new refresh rate related to upstream switch that is
+ *		  requested to be set. In case of root switch, this holds
+ *		  the new domain rate that is requested to be set.
  */
 struct tb_switch_tmu {
 	int cap;
 	bool has_ucap;
 	enum tb_switch_tmu_rate rate;
 	bool unidirectional;
+	bool unidirect_request;
+	enum tb_switch_tmu_rate rate_request;
 };
 
 /**
@@ -891,13 +900,10 @@ int tb_switch_tmu_init(struct tb_switch *sw);
 int tb_switch_tmu_post_time(struct tb_switch *sw);
 int tb_switch_tmu_disable(struct tb_switch *sw);
 int tb_switch_tmu_enable(struct tb_switch *sw);
-
-static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw)
-{
-	return sw->tmu.rate == TB_SWITCH_TMU_RATE_HIFI &&
-	       !sw->tmu.unidirectional;
-}
-
+bool tb_switch_tmu_hifi_is_enabled(struct tb_switch *sw, bool unidirect);
+void tb_switch_tmu_configure(struct tb_switch *sw,
+			     enum tb_switch_tmu_rate rate,
+			     bool unidirectional);
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
 int tb_port_clear_counter(struct tb_port *port, int counter);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index d8ab6c820451..89a2170032bf 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -246,6 +246,7 @@ enum usb4_switch_op {
 #define TMU_RTR_CS_3_TS_PACKET_INTERVAL_SHIFT	16
 #define TMU_RTR_CS_22				0x16
 #define TMU_RTR_CS_24				0x18
+#define TMU_RTR_CS_25				0x19
 
 enum tb_port_type {
 	TB_TYPE_INACTIVE	= 0x000000,
@@ -305,6 +306,8 @@ struct tb_regs_port_header {
 /* TMU adapter registers */
 #define TMU_ADP_CS_3				0x03
 #define TMU_ADP_CS_3_UDM			BIT(29)
+#define TMU_ADP_CS_6				0x06
+#define TMU_ADP_CS_6_DTS			BIT(1)
 
 /* Lane adapter registers */
 #define LANE_ADP_CS_0				0x00
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 039c42a06000..50f528211852 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -115,6 +115,11 @@ static inline int tb_port_tmu_unidirectional_disable(struct tb_port *port)
 	return tb_port_tmu_set_unidirectional(port, false);
 }
 
+static inline int tb_port_tmu_unidirectional_enable(struct tb_port *port)
+{
+	return tb_port_tmu_set_unidirectional(port, true);
+}
+
 static bool tb_port_tmu_is_unidirectional(struct tb_port *port)
 {
 	int ret;
@@ -128,6 +133,23 @@ static bool tb_port_tmu_is_unidirectional(struct tb_port *port)
 	return val & TMU_ADP_CS_3_UDM;
 }
 
+static int tb_port_tmu_time_sync(struct tb_port *port, bool time_sync)
+{
+	u32 val = time_sync ? TMU_ADP_CS_6_DTS : 0;
+
+	return tb_port_tmu_write(port, TMU_ADP_CS_6, TMU_ADP_CS_6_DTS, val);
+}
+
+static int tb_port_tmu_time_sync_disable(struct tb_port *port)
+{
+	return tb_port_tmu_time_sync(port, true);
+}
+
+static int tb_port_tmu_time_sync_enable(struct tb_port *port)
+{
+	return tb_port_tmu_time_sync(port, false);
+}
+
 static int tb_switch_tmu_set_time_disruption(struct tb_switch *sw, bool set)
 {
 	int ret;
@@ -207,7 +229,8 @@ int tb_switch_tmu_init(struct tb_switch *sw)
  */
 int tb_switch_tmu_post_time(struct tb_switch *sw)
 {
-	unsigned int  post_local_time_offset, post_time_offset;
+	unsigned int post_time_high_offset, post_time_high = 0;
+	unsigned int post_local_time_offset, post_time_offset;
 	struct tb_switch *root_switch = sw->tb->root_switch;
 	u64 hi, mid, lo, local_time, post_time;
 	int i, ret, retries = 100;
@@ -247,6 +270,7 @@ int tb_switch_tmu_post_time(struct tb_switch *sw)
 
 	post_local_time_offset = sw->tmu.cap + TMU_RTR_CS_22;
 	post_time_offset = sw->tmu.cap + TMU_RTR_CS_24;
+	post_time_high_offset = sw->tmu.cap + TMU_RTR_CS_25;
 
 	/*
 	 * Write the Grandmaster time to the Post Local Time registers
@@ -258,17 +282,24 @@ int tb_switch_tmu_post_time(struct tb_switch *sw)
 		goto out;
 
 	/*
-	 * Have the new switch update its local time (by writing 1 to
-	 * the post_time registers) and wait for the completion of the
-	 * same (post_time register becomes 0). This means the time has
-	 * been converged properly.
+	 * Have the new switch update its local time by:
+	 * 1) writing 0x1 to the Post Time Low register and 0xFFFFFFFF to
+	 * Post Time High register.
+	 * 2) write 0 to Post Time High register and then wait for
+	 * the completion of the post_time register becomes 0.
+	 * This means the time has been converged properly.
 	 */
-	post_time = 1;
+	post_time = 0xFFFFFFFF00000001ULL;
 
 	ret = tb_sw_write(sw, &post_time, TB_CFG_SWITCH, post_time_offset, 2);
 	if (ret)
 		goto out;
 
+	ret = tb_sw_write(sw, &post_time_high, TB_CFG_SWITCH,
+			  post_time_high_offset, 1);
+	if (ret)
+		goto out;
+
 	do {
 		usleep_range(5, 10);
 		ret = tb_sw_read(sw, &post_time, TB_CFG_SWITCH,
@@ -297,7 +328,6 @@ int tb_switch_tmu_post_time(struct tb_switch *sw)
  */
 int tb_switch_tmu_disable(struct tb_switch *sw)
 {
-	int ret;
 
 	if (!tb_switch_is_usb4(sw))
 		return 0;
@@ -306,21 +336,41 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 	if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF)
 		return 0;
 
-	if (sw->tmu.unidirectional) {
+
+	if (tb_route(sw)) {
+		bool unidirect = tb_switch_tmu_hifi_is_enabled(sw, true);
 		struct tb_switch *parent = tb_switch_parent(sw);
-		struct tb_port *up, *down;
+		struct tb_port *down, *up;
+		int ret;
 
-		up = tb_upstream_port(sw);
 		down = tb_port_at(tb_route(sw), parent);
-
-		/* The switch may be unplugged so ignore any errors */
-		tb_port_tmu_unidirectional_disable(up);
-		ret = tb_port_tmu_unidirectional_disable(down);
+		up = tb_upstream_port(sw);
+		/*
+		 * In case of unidirectional time sync, TMU handshake is
+		 * initiated by upstream router. In case of bidirectional
+		 * time sync, TMU handshake is initiated by downstream router.
+		 * Therefore, we change the rate to OFF in the respective
+		 * router.
+		 */
+		if (unidirect)
+			tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_OFF);
+		else
+			tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
+		tb_port_tmu_time_sync_disable(up);
+		ret = tb_port_tmu_time_sync_disable(down);
 		if (ret)
 			return ret;
-	}
 
-	tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
+		if (unidirect) {
+			/* The switch may be unplugged so ignore any errors */
+			tb_port_tmu_unidirectional_disable(up);
+			ret = tb_port_tmu_unidirectional_disable(down);
+			if (ret)
+				return ret;
+		}
+	} else {
+		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
+	}
 
 	sw->tmu.unidirectional = false;
 	sw->tmu.rate = TB_SWITCH_TMU_RATE_OFF;
@@ -329,55 +379,201 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 	return 0;
 }
 
-/**
- * tb_switch_tmu_enable() - Enable TMU on a switch
- * @sw: Switch whose TMU to enable
- *
- * Enables TMU of a switch to be in bi-directional, HiFi mode. In this mode
- * all tunneling should work.
+static void __tb_switch_tmu_off(struct tb_switch *sw, bool unidirect)
+{
+	struct tb_switch *parent = tb_switch_parent(sw);
+	struct tb_port *down, *up;
+
+	down = tb_port_at(tb_route(sw), parent);
+	up = tb_upstream_port(sw);
+	/*
+	 * In case of any failure in one of the steps when setting BiDir or
+	 * Uni TMU mode, get back to the TMU configurations in OFF mode.
+	 * In case of additional failures in the functions below,
+	 * ignore them since the caller shall already report a failure.
+	 */
+	tb_port_tmu_time_sync_disable(down);
+	tb_port_tmu_time_sync_disable(up);
+	if (unidirect)
+		tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_OFF);
+	else
+		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
+
+	tb_port_tmu_unidirectional_disable(down);
+	tb_port_tmu_unidirectional_disable(up);
+}
+
+/*
+ * This function is called when the previous TMU mode was
+ * TB_SWITCH_TMU_RATE_OFF.
  */
-int tb_switch_tmu_enable(struct tb_switch *sw)
+static int __tb_switch_tmu_enable_bidir(struct tb_switch *sw)
 {
+	struct tb_switch *parent = tb_switch_parent(sw);
+	struct tb_port *up, *down;
 	int ret;
 
-	if (!tb_switch_is_usb4(sw))
-		return 0;
+	up = tb_upstream_port(sw);
+	down = tb_port_at(tb_route(sw), parent);
 
-	if (tb_switch_tmu_is_enabled(sw))
-		return 0;
+	ret = tb_port_tmu_unidirectional_disable(up);
+	if (ret)
+		return ret;
 
-	ret = tb_switch_tmu_set_time_disruption(sw, true);
+	ret = tb_port_tmu_unidirectional_disable(down);
+	if (ret)
+		goto out;
+
+	ret = tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_HIFI);
+	if (ret)
+		goto out;
+
+	ret = tb_port_tmu_time_sync_enable(up);
+	if (ret)
+		goto out;
+
+	ret = tb_port_tmu_time_sync_enable(down);
+	if (ret)
+		goto out;
+
+	return 0;
+out:
+	__tb_switch_tmu_off(sw, false);
+	return ret;
+}
+
+/*
+ * This function is called when the previous TMU mode was
+ * TB_SWITCH_TMU_RATE_OFF.
+ */
+static int __tb_switch_tmu_enable_uni(struct tb_switch *sw)
+{
+	struct tb_switch *parent = tb_switch_parent(sw);
+	struct tb_port *up, *down;
+	int ret;
+
+	up = tb_upstream_port(sw);
+	down = tb_port_at(tb_route(sw), parent);
+	ret = tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_HIFI);
 	if (ret)
 		return ret;
 
-	/* Change mode to bi-directional */
-	if (tb_route(sw) && sw->tmu.unidirectional) {
-		struct tb_switch *parent = tb_switch_parent(sw);
-		struct tb_port *up, *down;
+	ret = tb_port_tmu_unidirectional_enable(up);
+	if (ret)
+		goto out;
 
-		up = tb_upstream_port(sw);
-		down = tb_port_at(tb_route(sw), parent);
+	ret = tb_port_tmu_time_sync_enable(up);
+	if (ret)
+		goto out;
 
-		ret = tb_port_tmu_unidirectional_disable(down);
-		if (ret)
-			return ret;
+	ret = tb_port_tmu_unidirectional_enable(down);
+	if (ret)
+		goto out;
 
-		ret = tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_HIFI);
-		if (ret)
-			return ret;
+	ret = tb_port_tmu_time_sync_enable(down);
+	if (ret)
+		goto out;
 
-		ret = tb_port_tmu_unidirectional_disable(up);
-		if (ret)
-			return ret;
+	return 0;
+out:
+	__tb_switch_tmu_off(sw, true);
+	return ret;
+}
+
+static int tb_switch_tmu_hifi_enable(struct tb_switch *sw)
+{
+	bool unidirect = sw->tmu.unidirect_request;
+	int ret;
+
+	if (unidirect && !sw->tmu.has_ucap)
+		return -EOPNOTSUPP;
+
+	if (!tb_switch_is_usb4(sw))
+		return 0;
+
+	if (tb_switch_tmu_hifi_is_enabled(sw, sw->tmu.unidirect_request))
+		return 0;
+
+	ret = tb_switch_tmu_set_time_disruption(sw, true);
+	if (ret)
+		return ret;
+
+	if (tb_route(sw)) {
+		/* The used mode changes are from OFF to HiFi-Uni/HiFi-BiDir */
+		if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF) {
+			if (unidirect)
+				ret = __tb_switch_tmu_enable_uni(sw);
+			else
+				ret = __tb_switch_tmu_enable_bidir(sw);
+			if (ret)
+				return ret;
+		}
+		sw->tmu.unidirectional = unidirect;
 	} else {
+		/*
+		 * Host router port configurations are written as
+		 * part of configurations for downstream port of the parent
+		 * of the child node - see above.
+		 * Here only the host router' rate configuration is written.
+		 */
 		ret = tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_HIFI);
 		if (ret)
 			return ret;
 	}
 
-	sw->tmu.unidirectional = false;
 	sw->tmu.rate = TB_SWITCH_TMU_RATE_HIFI;
-	tb_sw_dbg(sw, "TMU: mode set to: %s\n", tb_switch_tmu_mode_name(sw));
 
+	tb_sw_dbg(sw, "TMU: mode set to: %s\n", tb_switch_tmu_mode_name(sw));
 	return tb_switch_tmu_set_time_disruption(sw, false);
 }
+
+/**
+ * tb_switch_tmu_enable() - Enable TMU on a switch
+ * @sw: Switch whose TMU to enable
+ *
+ * Enables TMU of a switch to be in unidirectional or bidirectional HiFi mode.
+ * Calling tb_switch_tmu_configure() is required before calling this function,
+ * to select the mode HiFi and directionality (unidirectional/bidirectional).
+ * In both modes all tunneling should work. Unidirectional mode is required for
+ * CLx (Link Low-Power) to work. LowRes mode is not used currently.
+ */
+int tb_switch_tmu_enable(struct tb_switch *sw)
+{
+	if (sw->tmu.rate_request == TB_SWITCH_TMU_RATE_NORMAL)
+		return -EOPNOTSUPP;
+
+	return tb_switch_tmu_hifi_enable(sw);
+}
+
+/**
+ * tb_switch_tmu_configure() - Configure the TMU rate and directionality
+ * @sw: Switch whose mode to change
+ * @rate: Rate to configure Off/LowRes/HiFi
+ * @unidirectional: Unidirectionality selection: Unidirectional or Bidirectional
+ *
+ * Selects the rate of the TMU (Off, LowRes, HiFi), and Directionality
+ * (Unidirectional or Bidirectional).
+ * Shall be called before tb_switch_tmu_enable().
+ */
+void tb_switch_tmu_configure(struct tb_switch *sw,
+			     enum tb_switch_tmu_rate rate, bool unidirectional)
+{
+	sw->tmu.unidirect_request = unidirectional;
+	sw->tmu.rate_request = rate;
+}
+
+/**
+ * tb_switch_tmu_hifi_is_enabled() - Checks if the specified TMU mode
+ *				     bidir/uni enabled correctly
+ * @sw: Switch whose TMU mode to check
+ * @unidirect: Select bidirectional or unidirectional mode to check
+ *
+ * Read TMU directionality and rate from HW, and return true,
+ * if matches to bidirectional/unidirectional HiFi mode settings.
+ * Otherwise returns false.
+ */
+bool tb_switch_tmu_hifi_is_enabled(struct tb_switch *sw, bool unidirect)
+{
+	return sw->tmu.rate == TB_SWITCH_TMU_RATE_HIFI &&
+			       sw->tmu.unidirectional == unidirect;
+}
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

