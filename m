Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE00717B4C
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235370AbjEaJIG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235345AbjEaJHq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:46 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C7C198
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524059; x=1717060059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vUGo18jfxDZBQen8Yr5qw3xHBYdDm6ue4VXaEriJdsM=;
  b=WGfzKVxgFoWGeMsjYHTFY08Ud18kujsXrqHniW2JkvFZV1YrWxTar61J
   BaDio/rimx5du+TNGXFppXX1kkOv7B0a9DYh4KuITohV0n8qkRRprlCrS
   hamXeGSEyLQ4Sbe/nm4dhrBg/aM/V8P3fqEsfcrm4fZ316dUIsF5pHZTC
   bZS4FApe2NNursZNfkNyvSoK9a1Va+CmHNqqOMj1700MkZznFktNRW9r/
   sBxChK8LkuG/fyfSwLuMCoSYnyBRfgbJ9j5IuVa42WCLfc7SXozCCpHDV
   9/33h/gOIkShqnITj0A71P7iDYv0124MJ4nlfnIrsxiTwY8T941LYbNnS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027718"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027718"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247283"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247283"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 853D211A3; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 16/20] thunderbolt: Add support for enhanced uni-directional TMU mode
Date:   Wed, 31 May 2023 12:06:41 +0300
Message-Id: <20230531090645.5573-17-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
References: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is new TMU mode introduced with the USB4 v2. This mode is simpler
than the existing ones and allows all CL states as well. Enable this for
all links where both side routers are v2 and keep the existing
functionality for the v1 and earlier links.

Currently only support the MedRes rate. We can add the HiFi rate later
too if it turns out to be useful.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  |  16 +
 drivers/thunderbolt/tb.c      |  58 +++-
 drivers/thunderbolt/tb.h      |  75 +++--
 drivers/thunderbolt/tb_regs.h |  12 +-
 drivers/thunderbolt/tmu.c     | 591 +++++++++++++++++++++++++++-------
 drivers/thunderbolt/usb4.c    |  31 +-
 6 files changed, 610 insertions(+), 173 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ebe9559c8c79..7ea63bb31714 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2466,6 +2466,22 @@ int tb_switch_configure(struct tb_switch *sw)
 	return tb_plug_events_active(sw, true);
 }
 
+/**
+ * tb_switch_configuration_valid() - Set the tunneling configuration to be valid
+ * @sw: Router to configure
+ *
+ * Needs to be called before any tunnels can be setup through the
+ * router. Can be called to any router.
+ *
+ * Returns %0 in success and negative errno otherwise.
+ */
+int tb_switch_configuration_valid(struct tb_switch *sw)
+{
+	if (tb_switch_is_usb4(sw))
+		return usb4_switch_configuration_valid(sw);
+	return 0;
+}
+
 static int tb_switch_set_uuid(struct tb_switch *sw)
 {
 	bool uid = false;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index f18cb5a52f0b..ff034975a87e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -297,11 +297,23 @@ static int tb_increase_switch_tmu_accuracy(struct device *dev, void *data)
 	struct tb_switch *sw;
 
 	sw = tb_to_switch(dev);
-	if (sw) {
-		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI,
-					tb_switch_clx_is_enabled(sw, TB_CL1));
-		if (tb_switch_tmu_enable(sw))
-			tb_sw_warn(sw, "failed to increase TMU rate\n");
+	if (!sw)
+		return 0;
+
+	if (tb_switch_tmu_is_configured(sw, TB_SWITCH_TMU_MODE_LOWRES)) {
+		enum tb_switch_tmu_mode mode;
+		int ret;
+
+		if (tb_switch_clx_is_enabled(sw, TB_CL1))
+			mode = TB_SWITCH_TMU_MODE_HIFI_UNI;
+		else
+			mode = TB_SWITCH_TMU_MODE_HIFI_BI;
+
+		ret = tb_switch_tmu_configure(sw, mode);
+		if (ret)
+			return ret;
+
+		return tb_switch_tmu_enable(sw);
 	}
 
 	return 0;
@@ -319,6 +331,9 @@ static void tb_increase_tmu_accuracy(struct tb_tunnel *tunnel)
 	 * accuracy of first depth child routers (and the host router)
 	 * to the highest. This is needed for the DP tunneling to work
 	 * but also allows CL0s.
+	 *
+	 * If both routers are v2 then we don't need to do anything as
+	 * they are using enhanced TMU mode that allows all CLx.
 	 */
 	sw = tunnel->tb->root_switch;
 	device_for_each_child(&sw->dev, NULL, tb_increase_switch_tmu_accuracy);
@@ -329,14 +344,22 @@ static int tb_enable_tmu(struct tb_switch *sw)
 	int ret;
 
 	/*
-	 * If CL1 is enabled then we need to configure the TMU accuracy
-	 * level to normal. Otherwise we keep the TMU running at the
-	 * highest accuracy.
+	 * If both routers at the end of the link are v2 we simply
+	 * enable the enhanched uni-directional mode. That covers all
+	 * the CL states. For v1 and before we need to use the normal
+	 * rate to allow CL1 (when supported). Otherwise we keep the TMU
+	 * running at the highest accuracy.
 	 */
-	if (tb_switch_clx_is_enabled(sw, TB_CL1))
-		ret = tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_NORMAL, true);
-	else
-		ret = tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
+	ret = tb_switch_tmu_configure(sw,
+			TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI);
+	if (ret == -EOPNOTSUPP) {
+		if (tb_switch_clx_is_enabled(sw, TB_CL1))
+			ret = tb_switch_tmu_configure(sw,
+					TB_SWITCH_TMU_MODE_LOWRES);
+		else
+			ret = tb_switch_tmu_configure(sw,
+					TB_SWITCH_TMU_MODE_HIFI_BI);
+	}
 	if (ret)
 		return ret;
 
@@ -963,6 +986,12 @@ static void tb_scan_port(struct tb_port *port)
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to enable TMU\n");
 
+	/*
+	 * Configuration valid needs to be set after the TMU has been
+	 * enabled for the upstream port of the router so we do it here.
+	 */
+	tb_switch_configuration_valid(sw);
+
 	/* Scan upstream retimers */
 	tb_retimer_scan(upstream_port, true);
 
@@ -2086,8 +2115,7 @@ static int tb_start(struct tb *tb)
 	 * To support highest CLx state, we set host router's TMU to
 	 * Normal mode.
 	 */
-	tb_switch_tmu_configure(tb->root_switch, TB_SWITCH_TMU_RATE_NORMAL,
-				false);
+	tb_switch_tmu_configure(tb->root_switch, TB_SWITCH_TMU_MODE_LOWRES);
 	/* Enable TMU if it is off */
 	tb_switch_tmu_enable(tb->root_switch);
 	/* Full scan to discover devices added before the driver was loaded. */
@@ -2139,6 +2167,8 @@ static void tb_restore_children(struct tb_switch *sw)
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to restore TMU configuration\n");
 
+	tb_switch_configuration_valid(sw);
+
 	tb_switch_for_each_port(sw, port) {
 		if (!tb_port_has_remote(port) && !port->xdomain)
 			continue;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 516f9d3341c1..5e14baed0d5c 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -73,44 +73,37 @@ enum tb_nvm_write_ops {
 #define USB4_SWITCH_MAX_DEPTH		5
 
 /**
- * enum tb_switch_tmu_rate - TMU refresh rate
- * @TB_SWITCH_TMU_RATE_OFF: %0 (Disable Time Sync handshake)
- * @TB_SWITCH_TMU_RATE_HIFI: %16 us time interval between successive
- *			     transmission of the Delay Request TSNOS
- *			     (Time Sync Notification Ordered Set) on a Link
- * @TB_SWITCH_TMU_RATE_NORMAL: %1 ms time interval between successive
- *			       transmission of the Delay Request TSNOS on
- *			       a Link
+ * enum tb_switch_tmu_mode - TMU mode
+ * @TB_SWITCH_TMU_MODE_OFF: TMU is off
+ * @TB_SWITCH_TMU_MODE_LOWRES: Uni-directional, normal mode
+ * @TB_SWITCH_TMU_MODE_HIFI_UNI: Uni-directional, HiFi mode
+ * @TB_SWITCH_TMU_MODE_HIFI_BI: Bi-directional, HiFi mode
+ * @TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI: Enhanced Uni-directional, MedRes mode
+ *
+ * Ordering is based on TMU accuracy level (highest last).
  */
-enum tb_switch_tmu_rate {
-	TB_SWITCH_TMU_RATE_OFF = 0,
-	TB_SWITCH_TMU_RATE_HIFI = 16,
-	TB_SWITCH_TMU_RATE_NORMAL = 1000,
+enum tb_switch_tmu_mode {
+	TB_SWITCH_TMU_MODE_OFF,
+	TB_SWITCH_TMU_MODE_LOWRES,
+	TB_SWITCH_TMU_MODE_HIFI_UNI,
+	TB_SWITCH_TMU_MODE_HIFI_BI,
+	TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI,
 };
 
 /**
- * struct tb_switch_tmu - Structure holding switch TMU configuration
+ * struct tb_switch_tmu - Structure holding router TMU configuration
  * @cap: Offset to the TMU capability (%0 if not found)
  * @has_ucap: Does the switch support uni-directional mode
- * @rate: TMU refresh rate related to upstream switch. In case of root
- *	  switch this holds the domain rate. Reflects the HW setting.
- * @unidirectional: Is the TMU in uni-directional or bi-directional mode
- *		    related to upstream switch. Don't care for root switch.
- *		    Reflects the HW setting.
- * @unidirectional_request: Is the new TMU mode: uni-directional or bi-directional
- *			    that is requested to be set. Related to upstream switch.
- *			    Don't care for root switch.
- * @rate_request: TMU new refresh rate related to upstream switch that is
- *		  requested to be set. In case of root switch, this holds
- *		  the new domain rate that is requested to be set.
+ * @mode: TMU mode related to the upstream router. Reflects the HW
+ *	  setting. Don't care for host router.
+ * @mode_request: TMU mode requested to set. Related to upstream router.
+ *		   Don't care for host router.
  */
 struct tb_switch_tmu {
 	int cap;
 	bool has_ucap;
-	enum tb_switch_tmu_rate rate;
-	bool unidirectional;
-	bool unidirectional_request;
-	enum tb_switch_tmu_rate rate_request;
+	enum tb_switch_tmu_mode mode;
+	enum tb_switch_tmu_mode mode_request;
 };
 
 /**
@@ -801,6 +794,7 @@ struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
 struct tb_switch *tb_switch_alloc_safe_mode(struct tb *tb,
 			struct device *parent, u64 route);
 int tb_switch_configure(struct tb_switch *sw);
+int tb_switch_configuration_valid(struct tb_switch *sw);
 int tb_switch_add(struct tb_switch *sw);
 void tb_switch_remove(struct tb_switch *sw);
 void tb_switch_suspend(struct tb_switch *sw, bool runtime);
@@ -987,19 +981,33 @@ int tb_switch_tmu_init(struct tb_switch *sw);
 int tb_switch_tmu_post_time(struct tb_switch *sw);
 int tb_switch_tmu_disable(struct tb_switch *sw);
 int tb_switch_tmu_enable(struct tb_switch *sw);
-int tb_switch_tmu_configure(struct tb_switch *sw, enum tb_switch_tmu_rate rate,
-			    bool unidirectional);
+int tb_switch_tmu_configure(struct tb_switch *sw, enum tb_switch_tmu_mode mode);
+
+/**
+ * tb_switch_tmu_is_configured() - Is given TMU mode configured
+ * @sw: Router whose mode to check
+ * @mode: Mode to check
+ *
+ * Checks if given router TMU mode is configured to @mode. Note the
+ * router TMU might not be enabled to this mode.
+ */
+static inline bool tb_switch_tmu_is_configured(const struct tb_switch *sw,
+					       enum tb_switch_tmu_mode mode)
+{
+	return sw->tmu.mode_request == mode;
+}
+
 /**
  * tb_switch_tmu_is_enabled() - Checks if the specified TMU mode is enabled
  * @sw: Router whose TMU mode to check
  *
  * Return true if hardware TMU configuration matches the requested
- * configuration.
+ * configuration (and is not %TB_SWITCH_TMU_MODE_OFF).
  */
 static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw)
 {
-	return sw->tmu.rate == sw->tmu.rate_request &&
-	       sw->tmu.unidirectional == sw->tmu.unidirectional_request;
+	return sw->tmu.mode != TB_SWITCH_TMU_MODE_OFF &&
+	       sw->tmu.mode == sw->tmu.mode_request;
 }
 
 bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx);
@@ -1212,6 +1220,7 @@ static inline unsigned int usb4_switch_version(const struct tb_switch *sw)
 }
 
 int usb4_switch_setup(struct tb_switch *sw);
+int usb4_switch_configuration_valid(struct tb_switch *sw);
 int usb4_switch_read_uid(struct tb_switch *sw, u64 *uid);
 int usb4_switch_drom_read(struct tb_switch *sw, unsigned int address, void *buf,
 			  size_t size);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 549cc79c7313..c95fc7fe7adf 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -252,11 +252,13 @@ enum usb4_switch_op {
 #define TMU_RTR_CS_3_LOCAL_TIME_NS_MASK		GENMASK(15, 0)
 #define TMU_RTR_CS_3_TS_PACKET_INTERVAL_MASK	GENMASK(31, 16)
 #define TMU_RTR_CS_3_TS_PACKET_INTERVAL_SHIFT	16
-#define TMU_RTR_CS_15				0xf
+#define TMU_RTR_CS_15				0x0f
 #define TMU_RTR_CS_15_FREQ_AVG_MASK		GENMASK(5, 0)
 #define TMU_RTR_CS_15_DELAY_AVG_MASK		GENMASK(11, 6)
 #define TMU_RTR_CS_15_OFFSET_AVG_MASK		GENMASK(17, 12)
 #define TMU_RTR_CS_15_ERROR_AVG_MASK		GENMASK(23, 18)
+#define TMU_RTR_CS_18				0x12
+#define TMU_RTR_CS_18_DELTA_AVG_CONST_MASK	GENMASK(23, 16)
 #define TMU_RTR_CS_22				0x16
 #define TMU_RTR_CS_24				0x18
 #define TMU_RTR_CS_25				0x19
@@ -322,6 +324,14 @@ struct tb_regs_port_header {
 #define TMU_ADP_CS_3_UDM			BIT(29)
 #define TMU_ADP_CS_6				0x06
 #define TMU_ADP_CS_6_DTS			BIT(1)
+#define TMU_ADP_CS_8				0x08
+#define TMU_ADP_CS_8_REPL_TIMEOUT_MASK		GENMASK(14, 0)
+#define TMU_ADP_CS_8_EUDM			BIT(15)
+#define TMU_ADP_CS_8_REPL_THRESHOLD_MASK	GENMASK(25, 16)
+#define TMU_ADP_CS_9				0x09
+#define TMU_ADP_CS_9_REPL_N_MASK		GENMASK(7, 0)
+#define TMU_ADP_CS_9_DIRSWITCH_N_MASK		GENMASK(15, 8)
+#define TMU_ADP_CS_9_ADP_TS_INTERVAL_MASK	GENMASK(31, 16)
 
 /* Lane adapter registers */
 #define LANE_ADP_CS_0				0x00
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index c926fb71c43d..42cf4a2e9920 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -11,23 +11,63 @@
 
 #include "tb.h"
 
+static const unsigned int tmu_rates[] = {
+	[TB_SWITCH_TMU_MODE_OFF] = 0,
+	[TB_SWITCH_TMU_MODE_LOWRES] = 1000,
+	[TB_SWITCH_TMU_MODE_HIFI_UNI] = 16,
+	[TB_SWITCH_TMU_MODE_HIFI_BI] = 16,
+	[TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI] = 16,
+};
+
+const struct {
+	unsigned int freq_meas_window;
+	unsigned int avg_const;
+	unsigned int delta_avg_const;
+	unsigned int repl_timeout;
+	unsigned int repl_threshold;
+	unsigned int repl_n;
+	unsigned int dirswitch_n;
+} tmu_params[] = {
+	[TB_SWITCH_TMU_MODE_OFF] = { },
+	[TB_SWITCH_TMU_MODE_LOWRES] = { 30, 4, },
+	[TB_SWITCH_TMU_MODE_HIFI_UNI] = { 800, 8, },
+	[TB_SWITCH_TMU_MODE_HIFI_BI] = { 800, 8, },
+	[TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI] = {
+		800, 4, 0, 3125, 25, 128, 255,
+	},
+};
+
+static const char *tmu_mode_name(enum tb_switch_tmu_mode mode)
+{
+	switch (mode) {
+	case TB_SWITCH_TMU_MODE_OFF:
+		return "off";
+	case TB_SWITCH_TMU_MODE_LOWRES:
+		return "uni-directional, LowRes";
+	case TB_SWITCH_TMU_MODE_HIFI_UNI:
+		return "uni-directional, HiFi";
+	case TB_SWITCH_TMU_MODE_HIFI_BI:
+		return "bi-directional, HiFi";
+	case TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI:
+		return "enhanced uni-directional, MedRes";
+	default:
+		return "unknown";
+	}
+}
+
+static bool tb_switch_tmu_enhanced_is_supported(const struct tb_switch *sw)
+{
+	return usb4_switch_version(sw) > 1;
+}
+
 static int tb_switch_set_tmu_mode_params(struct tb_switch *sw,
-					 enum tb_switch_tmu_rate rate)
+					 enum tb_switch_tmu_mode mode)
 {
-	u32 freq_meas_wind[2] = { 30, 800 };
-	u32 avg_const[2] = { 4, 8 };
 	u32 freq, avg, val;
 	int ret;
 
-	if (rate == TB_SWITCH_TMU_RATE_NORMAL) {
-		freq = freq_meas_wind[0];
-		avg = avg_const[0];
-	} else if (rate == TB_SWITCH_TMU_RATE_HIFI) {
-		freq = freq_meas_wind[1];
-		avg = avg_const[1];
-	} else {
-		return 0;
-	}
+	freq = tmu_params[mode].freq_meas_window;
+	avg = tmu_params[mode].avg_const;
 
 	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
 			 sw->tmu.cap + TMU_RTR_CS_0, 1);
@@ -56,37 +96,30 @@ static int tb_switch_set_tmu_mode_params(struct tb_switch *sw,
 		FIELD_PREP(TMU_RTR_CS_15_OFFSET_AVG_MASK, avg) |
 		FIELD_PREP(TMU_RTR_CS_15_ERROR_AVG_MASK, avg);
 
-	return tb_sw_write(sw, &val, TB_CFG_SWITCH,
-			   sw->tmu.cap + TMU_RTR_CS_15, 1);
-}
-
-static const char *tb_switch_tmu_mode_name(const struct tb_switch *sw)
-{
-	bool root_switch = !tb_route(sw);
+	ret = tb_sw_write(sw, &val, TB_CFG_SWITCH,
+			 sw->tmu.cap + TMU_RTR_CS_15, 1);
+	if (ret)
+		return ret;
 
-	switch (sw->tmu.rate) {
-	case TB_SWITCH_TMU_RATE_OFF:
-		return "off";
+	if (tb_switch_tmu_enhanced_is_supported(sw)) {
+		u32 delta_avg = tmu_params[mode].delta_avg_const;
 
-	case TB_SWITCH_TMU_RATE_HIFI:
-		/* Root switch does not have upstream directionality */
-		if (root_switch)
-			return "HiFi";
-		if (sw->tmu.unidirectional)
-			return "uni-directional, HiFi";
-		return "bi-directional, HiFi";
+		ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
+				 sw->tmu.cap + TMU_RTR_CS_18, 1);
+		if (ret)
+			return ret;
 
-	case TB_SWITCH_TMU_RATE_NORMAL:
-		if (root_switch)
-			return "normal";
-		return "uni-directional, normal";
+		val &= ~TMU_RTR_CS_18_DELTA_AVG_CONST_MASK;
+		val |= FIELD_PREP(TMU_RTR_CS_18_DELTA_AVG_CONST_MASK, delta_avg);
 
-	default:
-		return "unknown";
+		ret = tb_sw_write(sw, &val, TB_CFG_SWITCH,
+				  sw->tmu.cap + TMU_RTR_CS_18, 1);
 	}
+
+	return ret;
 }
 
-static bool tb_switch_tmu_ucap_supported(struct tb_switch *sw)
+static bool tb_switch_tmu_ucap_is_supported(struct tb_switch *sw)
 {
 	int ret;
 	u32 val;
@@ -182,6 +215,103 @@ static bool tb_port_tmu_is_unidirectional(struct tb_port *port)
 	return val & TMU_ADP_CS_3_UDM;
 }
 
+static bool tb_port_tmu_is_enhanced(struct tb_port *port)
+{
+	int ret;
+	u32 val;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_tmu + TMU_ADP_CS_8, 1);
+	if (ret)
+		return false;
+
+	return val & TMU_ADP_CS_8_EUDM;
+}
+
+/* Can be called to non-v2 lane adapters too */
+static int tb_port_tmu_enhanced_enable(struct tb_port *port, bool enable)
+{
+	int ret;
+	u32 val;
+
+	if (!tb_switch_tmu_enhanced_is_supported(port->sw))
+		return 0;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_tmu + TMU_ADP_CS_8, 1);
+	if (ret)
+		return ret;
+
+	if (enable)
+		val |= TMU_ADP_CS_8_EUDM;
+	else
+		val &= ~TMU_ADP_CS_8_EUDM;
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_tmu + TMU_ADP_CS_8, 1);
+}
+
+static int tb_port_set_tmu_mode_params(struct tb_port *port,
+				       enum tb_switch_tmu_mode mode)
+{
+	u32 repl_timeout, repl_threshold, repl_n, dirswitch_n, val;
+	int ret;
+
+	repl_timeout = tmu_params[mode].repl_timeout;
+	repl_threshold = tmu_params[mode].repl_threshold;
+	repl_n = tmu_params[mode].repl_n;
+	dirswitch_n = tmu_params[mode].dirswitch_n;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_tmu + TMU_ADP_CS_8, 1);
+	if (ret)
+		return ret;
+
+	val &= ~TMU_ADP_CS_8_REPL_TIMEOUT_MASK;
+	val &= ~TMU_ADP_CS_8_REPL_THRESHOLD_MASK;
+	val |= FIELD_PREP(TMU_ADP_CS_8_REPL_TIMEOUT_MASK, repl_timeout);
+	val |= FIELD_PREP(TMU_ADP_CS_8_REPL_THRESHOLD_MASK, repl_threshold);
+
+	ret = tb_port_write(port, &val, TB_CFG_PORT,
+			    port->cap_tmu + TMU_ADP_CS_8, 1);
+	if (ret)
+		return ret;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_tmu + TMU_ADP_CS_9, 1);
+	if (ret)
+		return ret;
+
+	val &= ~TMU_ADP_CS_9_REPL_N_MASK;
+	val &= ~TMU_ADP_CS_9_DIRSWITCH_N_MASK;
+	val |= FIELD_PREP(TMU_ADP_CS_9_REPL_N_MASK, repl_n);
+	val |= FIELD_PREP(TMU_ADP_CS_9_DIRSWITCH_N_MASK, dirswitch_n);
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_tmu + TMU_ADP_CS_9, 1);
+}
+
+/* Can be called to non-v2 lane adapters too */
+static int tb_port_tmu_rate_write(struct tb_port *port, int rate)
+{
+	int ret;
+	u32 val;
+
+	if (!tb_switch_tmu_enhanced_is_supported(port->sw))
+		return 0;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_tmu + TMU_ADP_CS_9, 1);
+	if (ret)
+		return ret;
+
+	val &= ~TMU_ADP_CS_9_ADP_TS_INTERVAL_MASK;
+	val |= FIELD_PREP(TMU_ADP_CS_9_ADP_TS_INTERVAL_MASK, rate);
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_tmu + TMU_ADP_CS_9, 1);
+}
+
 static int tb_port_tmu_time_sync(struct tb_port *port, bool time_sync)
 {
 	u32 val = time_sync ? TMU_ADP_CS_6_DTS : 0;
@@ -224,6 +354,48 @@ static int tb_switch_tmu_set_time_disruption(struct tb_switch *sw, bool set)
 	return tb_sw_write(sw, &val, TB_CFG_SWITCH, offset, 1);
 }
 
+static int tmu_mode_init(struct tb_switch *sw)
+{
+	bool enhanced, ucap;
+	int ret, rate;
+
+	ucap = tb_switch_tmu_ucap_is_supported(sw);
+	if (ucap)
+		tb_sw_dbg(sw, "TMU: supports uni-directional mode\n");
+	enhanced = tb_switch_tmu_enhanced_is_supported(sw);
+	if (enhanced)
+		tb_sw_dbg(sw, "TMU: supports enhanced uni-directional mode\n");
+
+	ret = tb_switch_tmu_rate_read(sw);
+	if (ret < 0)
+		return ret;
+	rate = ret;
+
+	if (tb_route(sw)) {
+		struct tb_port *up = tb_upstream_port(sw);
+
+		if (enhanced && tb_port_tmu_is_enhanced(up)) {
+			sw->tmu.mode = TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI;
+		} else if (ucap && tb_port_tmu_is_unidirectional(up)) {
+			if (tmu_rates[TB_SWITCH_TMU_MODE_LOWRES] == rate)
+				sw->tmu.mode = TB_SWITCH_TMU_MODE_LOWRES;
+			else if (tmu_rates[TB_SWITCH_TMU_MODE_LOWRES] == rate)
+				sw->tmu.mode = TB_SWITCH_TMU_MODE_HIFI_UNI;
+		} else if (rate) {
+			sw->tmu.mode = TB_SWITCH_TMU_MODE_HIFI_BI;
+		}
+		/* Otherwise it is off */
+	} else if (rate) {
+		sw->tmu.mode = TB_SWITCH_TMU_MODE_HIFI_BI;
+	}
+
+	/* Update the initial request to match the current mode */
+	sw->tmu.mode_request = sw->tmu.mode;
+	sw->tmu.has_ucap = ucap;
+
+	return 0;
+}
+
 /**
  * tb_switch_tmu_init() - Initialize switch TMU structures
  * @sw: Switch to initialized
@@ -252,27 +424,11 @@ int tb_switch_tmu_init(struct tb_switch *sw)
 			port->cap_tmu = cap;
 	}
 
-	ret = tb_switch_tmu_rate_read(sw);
-	if (ret < 0)
+	ret = tmu_mode_init(sw);
+	if (ret)
 		return ret;
 
-	sw->tmu.rate = ret;
-
-	sw->tmu.has_ucap = tb_switch_tmu_ucap_supported(sw);
-	if (sw->tmu.has_ucap) {
-		tb_sw_dbg(sw, "TMU: supports uni-directional mode\n");
-
-		if (tb_route(sw)) {
-			struct tb_port *up = tb_upstream_port(sw);
-
-			sw->tmu.unidirectional =
-				tb_port_tmu_is_unidirectional(up);
-		}
-	} else {
-		sw->tmu.unidirectional = false;
-	}
-
-	tb_sw_dbg(sw, "TMU: current mode: %s\n", tb_switch_tmu_mode_name(sw));
+	tb_sw_dbg(sw, "TMU: current mode: %s\n", tmu_mode_name(sw->tmu.mode));
 	return 0;
 }
 
@@ -375,6 +531,23 @@ int tb_switch_tmu_post_time(struct tb_switch *sw)
 	return ret;
 }
 
+static int disable_enhanced(struct tb_port *up, struct tb_port *down)
+{
+	int ret;
+
+	/*
+	 * Router may already been disconnected so ignore errors on the
+	 * upstream port.
+	 */
+	tb_port_tmu_rate_write(up, 0);
+	tb_port_tmu_enhanced_enable(up, false);
+
+	ret = tb_port_tmu_rate_write(down, 0);
+	if (ret)
+		return ret;
+	return tb_port_tmu_enhanced_enable(down, false);
+}
+
 /**
  * tb_switch_tmu_disable() - Disable TMU of a switch
  * @sw: Switch whose TMU to disable
@@ -384,11 +557,10 @@ int tb_switch_tmu_post_time(struct tb_switch *sw)
 int tb_switch_tmu_disable(struct tb_switch *sw)
 {
 	/* Already disabled? */
-	if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF)
+	if (sw->tmu.mode == TB_SWITCH_TMU_MODE_OFF)
 		return 0;
 
 	if (tb_route(sw)) {
-		bool unidirectional = sw->tmu.unidirectional;
 		struct tb_port *down, *up;
 		int ret;
 
@@ -405,33 +577,46 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 		 * uni-directional mode and we don't want to change it's TMU
 		 * mode.
 		 */
-		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
+		tb_switch_tmu_rate_write(sw, tmu_rates[TB_SWITCH_TMU_MODE_OFF]);
 
 		tb_port_tmu_time_sync_disable(up);
 		ret = tb_port_tmu_time_sync_disable(down);
 		if (ret)
 			return ret;
 
-		if (unidirectional) {
+		switch (sw->tmu.mode) {
+		case TB_SWITCH_TMU_MODE_LOWRES:
+		case TB_SWITCH_TMU_MODE_HIFI_UNI:
 			/* The switch may be unplugged so ignore any errors */
 			tb_port_tmu_unidirectional_disable(up);
 			ret = tb_port_tmu_unidirectional_disable(down);
 			if (ret)
 				return ret;
+			break;
+
+		case TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI:
+			ret = disable_enhanced(up, down);
+			if (ret)
+				return ret;
+			break;
+
+		default:
+			break;
 		}
 	} else {
-		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
+		tb_switch_tmu_rate_write(sw, tmu_rates[TB_SWITCH_TMU_MODE_OFF]);
 	}
 
-	sw->tmu.unidirectional = false;
-	sw->tmu.rate = TB_SWITCH_TMU_RATE_OFF;
+	sw->tmu.mode = TB_SWITCH_TMU_MODE_OFF;
 
 	tb_sw_dbg(sw, "TMU: disabled\n");
 	return 0;
 }
 
-static void tb_switch_tmu_off(struct tb_switch *sw, bool unidirectional)
+/* Called only when there is failure enabling requested mode */
+static void tb_switch_tmu_off(struct tb_switch *sw)
 {
+	unsigned int rate = tmu_rates[TB_SWITCH_TMU_MODE_OFF];
 	struct tb_port *down, *up;
 
 	down = tb_switch_downstream_port(sw);
@@ -445,20 +630,30 @@ static void tb_switch_tmu_off(struct tb_switch *sw, bool unidirectional)
 	 */
 	tb_port_tmu_time_sync_disable(down);
 	tb_port_tmu_time_sync_disable(up);
-	if (unidirectional)
-		tb_switch_tmu_rate_write(tb_switch_parent(sw),
-					 TB_SWITCH_TMU_RATE_OFF);
-	else
-		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
 
-	tb_switch_set_tmu_mode_params(sw, sw->tmu.rate);
+	switch (sw->tmu.mode_request) {
+	case TB_SWITCH_TMU_MODE_LOWRES:
+	case TB_SWITCH_TMU_MODE_HIFI_UNI:
+		tb_switch_tmu_rate_write(tb_switch_parent(sw), rate);
+		break;
+	case TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI:
+		disable_enhanced(up, down);
+		break;
+	default:
+		break;
+	}
+
+	/* Always set the rate to 0 */
+	tb_switch_tmu_rate_write(sw, rate);
+
+	tb_switch_set_tmu_mode_params(sw, sw->tmu.mode);
 	tb_port_tmu_unidirectional_disable(down);
 	tb_port_tmu_unidirectional_disable(up);
 }
 
 /*
  * This function is called when the previous TMU mode was
- * TB_SWITCH_TMU_RATE_OFF.
+ * TB_SWITCH_TMU_MODE_OFF.
  */
 static int tb_switch_tmu_enable_bidirectional(struct tb_switch *sw)
 {
@@ -476,7 +671,7 @@ static int tb_switch_tmu_enable_bidirectional(struct tb_switch *sw)
 	if (ret)
 		goto out;
 
-	ret = tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_HIFI);
+	ret = tb_switch_tmu_rate_write(sw, tmu_rates[TB_SWITCH_TMU_MODE_HIFI_BI]);
 	if (ret)
 		goto out;
 
@@ -491,7 +686,7 @@ static int tb_switch_tmu_enable_bidirectional(struct tb_switch *sw)
 	return 0;
 
 out:
-	tb_switch_tmu_off(sw, false);
+	tb_switch_tmu_off(sw);
 	return ret;
 }
 
@@ -522,7 +717,7 @@ static int tb_switch_tmu_disable_objections(struct tb_switch *sw)
 
 /*
  * This function is called when the previous TMU mode was
- * TB_SWITCH_TMU_RATE_OFF.
+ * TB_SWITCH_TMU_MODE_OFF.
  */
 static int tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
 {
@@ -532,11 +727,11 @@ static int tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
 	up = tb_upstream_port(sw);
 	down = tb_switch_downstream_port(sw);
 	ret = tb_switch_tmu_rate_write(tb_switch_parent(sw),
-				       sw->tmu.rate_request);
+				       tmu_rates[sw->tmu.mode_request]);
 	if (ret)
 		return ret;
 
-	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.rate_request);
+	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.mode_request);
 	if (ret)
 		return ret;
 
@@ -559,12 +754,62 @@ static int tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
 	return 0;
 
 out:
-	tb_switch_tmu_off(sw, true);
+	tb_switch_tmu_off(sw);
+	return ret;
+}
+
+/*
+ * This function is called when the previous TMU mode was
+ * TB_SWITCH_TMU_RATE_OFF.
+ */
+static int tb_switch_tmu_enable_enhanced(struct tb_switch *sw)
+{
+	unsigned int rate = tmu_rates[sw->tmu.mode_request];
+	struct tb_port *up, *down;
+	int ret;
+
+	/* Router specific parameters first */
+	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.mode_request);
+	if (ret)
+		return ret;
+
+	up = tb_upstream_port(sw);
+	down = tb_switch_downstream_port(sw);
+
+	ret = tb_port_set_tmu_mode_params(up, sw->tmu.mode_request);
+	if (ret)
+		goto out;
+
+	ret = tb_port_tmu_rate_write(up, rate);
+	if (ret)
+		goto out;
+
+	ret = tb_port_tmu_enhanced_enable(up, true);
+	if (ret)
+		goto out;
+
+	ret = tb_port_set_tmu_mode_params(down, sw->tmu.mode_request);
+	if (ret)
+		goto out;
+
+	ret = tb_port_tmu_rate_write(down, rate);
+	if (ret)
+		goto out;
+
+	ret = tb_port_tmu_enhanced_enable(down, true);
+	if (ret)
+		goto out;
+
+	return 0;
+
+out:
+	tb_switch_tmu_off(sw);
 	return ret;
 }
 
 static void tb_switch_tmu_change_mode_prev(struct tb_switch *sw)
 {
+	unsigned int rate = tmu_rates[sw->tmu.mode];
 	struct tb_port *down, *up;
 
 	down = tb_switch_downstream_port(sw);
@@ -575,42 +820,97 @@ static void tb_switch_tmu_change_mode_prev(struct tb_switch *sw)
 	 * In case of additional failures in the functions below,
 	 * ignore them since the caller shall already report a failure.
 	 */
-	tb_port_tmu_set_unidirectional(down, sw->tmu.unidirectional);
-	if (sw->tmu.unidirectional_request)
-		tb_switch_tmu_rate_write(tb_switch_parent(sw), sw->tmu.rate);
-	else
-		tb_switch_tmu_rate_write(sw, sw->tmu.rate);
+	switch (sw->tmu.mode) {
+	case TB_SWITCH_TMU_MODE_LOWRES:
+	case TB_SWITCH_TMU_MODE_HIFI_UNI:
+		tb_port_tmu_set_unidirectional(down, true);
+		tb_switch_tmu_rate_write(tb_switch_parent(sw), rate);
+		break;
+
+	case TB_SWITCH_TMU_MODE_HIFI_BI:
+		tb_port_tmu_set_unidirectional(down, false);
+		tb_switch_tmu_rate_write(sw, rate);
+		break;
+
+	default:
+		break;
+	}
 
-	tb_switch_set_tmu_mode_params(sw, sw->tmu.rate);
-	tb_port_tmu_set_unidirectional(up, sw->tmu.unidirectional);
+	tb_switch_set_tmu_mode_params(sw, sw->tmu.mode);
+
+	switch (sw->tmu.mode) {
+	case TB_SWITCH_TMU_MODE_LOWRES:
+	case TB_SWITCH_TMU_MODE_HIFI_UNI:
+		tb_port_tmu_set_unidirectional(up, true);
+		break;
+
+	case TB_SWITCH_TMU_MODE_HIFI_BI:
+		tb_port_tmu_set_unidirectional(up, false);
+		break;
+
+	default:
+		break;
+	}
 }
 
 static int tb_switch_tmu_change_mode(struct tb_switch *sw)
 {
+	unsigned int rate = tmu_rates[sw->tmu.mode_request];
 	struct tb_port *up, *down;
 	int ret;
 
 	up = tb_upstream_port(sw);
 	down = tb_switch_downstream_port(sw);
-	ret = tb_port_tmu_set_unidirectional(down, sw->tmu.unidirectional_request);
-	if (ret)
-		goto out;
 
-	if (sw->tmu.unidirectional_request)
-		ret = tb_switch_tmu_rate_write(tb_switch_parent(sw),
-					       sw->tmu.rate_request);
-	else
-		ret = tb_switch_tmu_rate_write(sw, sw->tmu.rate_request);
-	if (ret)
-		return ret;
+	/* Program the upstream router downstream facing lane adapter */
+	switch (sw->tmu.mode_request) {
+	case TB_SWITCH_TMU_MODE_LOWRES:
+	case TB_SWITCH_TMU_MODE_HIFI_UNI:
+		ret = tb_port_tmu_set_unidirectional(down, true);
+		if (ret)
+			goto out;
+		ret = tb_switch_tmu_rate_write(tb_switch_parent(sw), rate);
+		if (ret)
+			goto out;
+		break;
+
+	case TB_SWITCH_TMU_MODE_HIFI_BI:
+		ret = tb_port_tmu_set_unidirectional(down, false);
+		if (ret)
+			goto out;
+		ret = tb_switch_tmu_rate_write(sw, rate);
+		if (ret)
+			goto out;
+		break;
 
-	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.rate_request);
+	default:
+		/* Not allowed to change modes from other than above */
+		return -EINVAL;
+	}
+
+	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.mode_request);
 	if (ret)
 		return ret;
 
-	ret = tb_port_tmu_set_unidirectional(up, sw->tmu.unidirectional_request);
-	if (ret)
-		goto out;
+	/* Program the new mode and the downstream router lane adapter */
+	switch (sw->tmu.mode_request) {
+	case TB_SWITCH_TMU_MODE_LOWRES:
+	case TB_SWITCH_TMU_MODE_HIFI_UNI:
+		ret = tb_port_tmu_set_unidirectional(up, true);
+		if (ret)
+			goto out;
+		break;
+
+	case TB_SWITCH_TMU_MODE_HIFI_BI:
+		ret = tb_port_tmu_set_unidirectional(up, false);
+		if (ret)
+			goto out;
+		break;
+
+	default:
+		/* Not allowed to change modes from other than above */
+		return -EINVAL;
+	}
 
 	ret = tb_port_tmu_time_sync_enable(down);
 	if (ret)
@@ -637,13 +937,14 @@ static int tb_switch_tmu_change_mode(struct tb_switch *sw)
  */
 int tb_switch_tmu_enable(struct tb_switch *sw)
 {
-	bool unidirectional = sw->tmu.unidirectional_request;
 	int ret;
 
 	if (tb_switch_tmu_is_enabled(sw))
 		return 0;
 
-	if (tb_switch_is_titan_ridge(sw) && unidirectional) {
+	if (tb_switch_is_titan_ridge(sw) &&
+	    (sw->tmu.mode_request == TB_SWITCH_TMU_MODE_LOWRES ||
+	     sw->tmu.mode_request == TB_SWITCH_TMU_MODE_HIFI_UNI)) {
 		ret = tb_switch_tmu_disable_objections(sw);
 		if (ret)
 			return ret;
@@ -659,19 +960,30 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 		 * HiFi-Uni/HiFi-BiDir/Normal-Uni or from Normal-Uni to
 		 * HiFi-Uni.
 		 */
-		if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF) {
-			if (unidirectional)
+		if (sw->tmu.mode == TB_SWITCH_TMU_MODE_OFF) {
+			switch (sw->tmu.mode_request) {
+			case TB_SWITCH_TMU_MODE_LOWRES:
+			case TB_SWITCH_TMU_MODE_HIFI_UNI:
 				ret = tb_switch_tmu_enable_unidirectional(sw);
-			else
+				break;
+
+			case TB_SWITCH_TMU_MODE_HIFI_BI:
 				ret = tb_switch_tmu_enable_bidirectional(sw);
-			if (ret)
-				return ret;
-		} else if (sw->tmu.rate == TB_SWITCH_TMU_RATE_NORMAL) {
+				break;
+			case TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI:
+				ret = tb_switch_tmu_enable_enhanced(sw);
+				break;
+			default:
+				ret = -EINVAL;
+				break;
+			}
+		} else if (sw->tmu.mode == TB_SWITCH_TMU_MODE_LOWRES ||
+			   sw->tmu.mode == TB_SWITCH_TMU_MODE_HIFI_UNI ||
+			   sw->tmu.mode == TB_SWITCH_TMU_MODE_HIFI_BI) {
 			ret = tb_switch_tmu_change_mode(sw);
-			if (ret)
-				return ret;
+		} else {
+			ret = -EINVAL;
 		}
-		sw->tmu.unidirectional = unidirectional;
 	} else {
 		/*
 		 * Host router port configurations are written as
@@ -679,35 +991,66 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 		 * of the child node - see above.
 		 * Here only the host router' rate configuration is written.
 		 */
-		ret = tb_switch_tmu_rate_write(sw, sw->tmu.rate_request);
-		if (ret)
-			return ret;
+		ret = tb_switch_tmu_rate_write(sw, tmu_rates[sw->tmu.mode_request]);
 	}
 
-	sw->tmu.rate = sw->tmu.rate_request;
+	if (ret) {
+		tb_sw_warn(sw, "TMU: failed to enable mode %s: %d\n",
+			   tmu_mode_name(sw->tmu.mode_request), ret);
+	} else {
+		sw->tmu.mode = sw->tmu.mode_request;
+		tb_sw_dbg(sw, "TMU: mode set to: %s\n", tmu_mode_name(sw->tmu.mode));
+	}
 
-	tb_sw_dbg(sw, "TMU: mode set to: %s\n", tb_switch_tmu_mode_name(sw));
 	return tb_switch_tmu_set_time_disruption(sw, false);
 }
 
 /**
- * tb_switch_tmu_configure() - Configure the TMU rate and directionality
+ * tb_switch_tmu_configure() - Configure the TMU mode
  * @sw: Router whose mode to change
- * @rate: Rate to configure Off/Normal/HiFi
- * @unidirectional: If uni-directional (bi-directional otherwise)
+ * @mode: Mode to configure
  *
- * Selects the rate of the TMU and directionality (uni-directional or
- * bi-directional). Must be called before tb_switch_tmu_enable().
+ * Selects the TMU mode that is enabled when tb_switch_tmu_enable() is
+ * next called.
  *
- * Returns %0 in success and negative errno otherwise.
+ * Returns %0 in success and negative errno otherwise. Specifically
+ * returns %-EOPNOTSUPP if the requested mode is not possible (not
+ * supported by the router and/or topology).
  */
-int tb_switch_tmu_configure(struct tb_switch *sw, enum tb_switch_tmu_rate rate,
-			    bool unidirectional)
+int tb_switch_tmu_configure(struct tb_switch *sw, enum tb_switch_tmu_mode mode)
 {
-	if (unidirectional && !sw->tmu.has_ucap)
+	switch (mode) {
+	case TB_SWITCH_TMU_MODE_OFF:
+		break;
+
+	case TB_SWITCH_TMU_MODE_LOWRES:
+	case TB_SWITCH_TMU_MODE_HIFI_UNI:
+		if (!sw->tmu.has_ucap)
+			return -EOPNOTSUPP;
+		break;
+
+	case TB_SWITCH_TMU_MODE_HIFI_BI:
+		break;
+
+	case TB_SWITCH_TMU_MODE_MEDRES_ENHANCED_UNI: {
+		const struct tb_switch *parent_sw = tb_switch_parent(sw);
+
+		if (!parent_sw || !tb_switch_tmu_enhanced_is_supported(parent_sw))
+			return -EOPNOTSUPP;
+		if (!tb_switch_tmu_enhanced_is_supported(sw))
+			return -EOPNOTSUPP;
+
+		break;
+	}
+
+	default:
+		tb_sw_warn(sw, "TMU: unsupported mode %u\n", mode);
 		return -EINVAL;
+	}
+
+	tb_sw_dbg(sw, "TMU: mode change %s -> %s requested\n",
+		  tmu_mode_name(sw->tmu.mode), tmu_mode_name(mode));
 
-	sw->tmu.unidirectional_request = unidirectional;
-	sw->tmu.rate_request = rate;
+	sw->tmu.mode_request = mode;
 	return 0;
 }
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 2da43b5fc840..2d84a53996fa 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -232,6 +232,9 @@ static bool link_is_usb4(struct tb_port *port)
  * is not available for some reason (like that there is Thunderbolt 3
  * switch upstream) then the internal xHCI controller is enabled
  * instead.
+ *
+ * This does not set the configuration valid bit of the router. To do
+ * that call usb4_switch_configuration_valid().
  */
 int usb4_switch_setup(struct tb_switch *sw)
 {
@@ -288,7 +291,33 @@ int usb4_switch_setup(struct tb_switch *sw)
 
 	/* TBT3 supported by the CM */
 	val |= ROUTER_CS_5_C3S;
-	/* Tunneling configuration is ready now */
+
+	return tb_sw_write(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
+}
+
+/**
+ * usb4_switch_configuration_valid() - Set tunneling configuration to be valid
+ * @sw: USB4 router
+ *
+ * Sets configuration valid bit for the router. Must be called before
+ * any tunnels can be set through the router and after
+ * usb4_switch_setup() has been called. Can be called to host and device
+ * routers (does nothing for the latter).
+ *
+ * Returns %0 in success and negative errno otherwise.
+ */
+int usb4_switch_configuration_valid(struct tb_switch *sw)
+{
+	u32 val;
+	int ret;
+
+	if (!tb_route(sw))
+		return 0;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
+	if (ret)
+		return ret;
+
 	val |= ROUTER_CS_5_CV;
 
 	ret = tb_sw_write(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
-- 
2.39.2

