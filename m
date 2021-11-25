Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F9945DC7B
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 15:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347649AbhKYOlf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 09:41:35 -0500
Received: from mga09.intel.com ([134.134.136.24]:2368 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355487AbhKYOjf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 09:39:35 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235345418"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="235345418"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 06:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="741301390"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2021 06:32:35 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 6/7] thunderbolt: Enable CLx for Titan Ridge device
Date:   Thu, 25 Nov 2021 16:38:20 +0200
Message-Id: <20211125143821.16558-7-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125143821.16558-1-gil.fine@intel.com>
References: <20211125143821.16558-1-gil.fine@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In this patch we enable Low Power state (CLx) of the link for Titan Ridge
device.
Low Power states are used to reduce transmitter and receiver power
when a Lane is idle and this way to save power.
For now we only enable CL0s state. We enable it, if both sides of the link
support it and only for the first depth device.
(i.e. the first device that connected to the Host router).

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/lc.c      |  27 +++++
 drivers/thunderbolt/switch.c  | 191 +++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/tb.c      |   7 ++
 drivers/thunderbolt/tb.h      |   7 ++
 drivers/thunderbolt/tb_regs.h |  35 ++++++-
 drivers/thunderbolt/tmu.c     |  68 +++++++++++-
 6 files changed, 328 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/lc.c b/drivers/thunderbolt/lc.c
index c178f0d7beab..29ead7d75d9c 100644
--- a/drivers/thunderbolt/lc.c
+++ b/drivers/thunderbolt/lc.c
@@ -508,3 +508,30 @@ int tb_lc_force_power(struct tb_switch *sw)
 
 	return tb_sw_write(sw, &in, TB_CFG_SWITCH, TB_LC_POWER, 1);
 }
+
+/**
+ * tb_lc_clx_supported() - Check whether CLx is supported by the link
+ * @sw: Port to check
+ *
+ * TB_LC_LINK_ATTR_CPS bit reflects if the link supports CLx including
+ * active cables (if connected on the link).
+ */
+bool tb_lc_clx_supported(struct tb_port *port)
+{
+	struct tb_switch *sw = port->sw;
+	int cap, ret;
+	u32 val;
+
+	if (!tb_switch_is_titan_ridge(sw))
+		return false;
+
+	cap = find_port_lc_cap(port);
+	if (cap < 0)
+		return false;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, cap + TB_LC_LINK_ATTR, 1);
+	if (ret)
+		return false;
+
+	return !!(val & TB_LC_LINK_ATTR_CPS);
+}
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 6ff2866a4c2b..945672b8fa25 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2202,6 +2202,10 @@ struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
 	if (ret > 0)
 		sw->cap_lc = ret;
 
+	ret = tb_switch_find_vse_cap(sw, TB_VSE_CAP_CP_LP);
+	if (ret > 0)
+		sw->cap_lp = ret;
+
 	/* Root switch is always authorized */
 	if (!route)
 		sw->authorized = true;
@@ -3008,6 +3012,14 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 
 	tb_sw_dbg(sw, "suspending switch\n");
 
+	/*
+	 * Actually shall be done only for Titan Ridge,
+	 * but for simplicity can be done for USB4 device too
+	 * as CLx is re-enabled at resume.
+	 */
+	if (tb_switch_disable_clx(sw, TB_CL0S))
+		tb_sw_warn(sw, "failed to disable CLx on upstream port\n");
+
 	err = tb_plug_events_active(sw, false);
 	if (err)
 		return;
@@ -3326,8 +3338,12 @@ static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
 	if (port->xdomain)
 		return false;
 
-	if (!usb4_port_clx_supported(port))
+	if (tb_switch_is_usb4(port->sw) && !usb4_port_clx_supported(port)) {
+		return false;
+	} else if (tb_switch_is_titan_ridge(port->sw) &&
+		   !tb_lc_clx_supported(port)) {
 		return false;
+	}
 
 	switch (clx) {
 	case TB_CL0S:
@@ -3393,7 +3409,7 @@ static int tb_switch_enable_cl0s(struct tb_switch *sw)
 	struct tb_port *up, *down;
 	int ret;
 
-	if (!tb_switch_is_usb4(sw))
+	if (!tb_switch_clx_supported(sw))
 		return 0;
 
 	/*
@@ -3432,6 +3448,10 @@ static int tb_switch_enable_cl0s(struct tb_switch *sw)
 	if (ret)
 		goto out;
 
+	ret = tb_port_titan_ridge_clx_objection_mask(sw);
+	if (ret)
+		goto out;
+
 	sw->clx = TB_CL0S;
 	tb_sw_dbg(sw, "enabled CL0s on upstream port\n");
 	return 0;
@@ -3480,7 +3500,7 @@ static int tb_switch_disable_cl0s(struct tb_switch *sw)
 	struct tb_port *up, *down;
 	int ret;
 
-	if (!tb_switch_is_usb4(sw))
+	if (!tb_switch_clx_supported(sw))
 		return 0;
 
 	/*
@@ -3552,3 +3572,168 @@ bool tb_switch_is_cl0s_enabled(struct tb_switch *sw)
 {
 	return sw->clx == TB_CL0S;
 }
+
+/**
+ * tb_switch_clx_supported() - Is CLx supported on this type of switch
+ *
+ * @sw: The switch to check CLx support for
+ */
+bool tb_switch_clx_supported(struct tb_switch *sw)
+{
+	if (tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw))
+		return true;
+	return false;
+}
+
+/**
+ * tb_port_titan_ridge_clx_objection_mask() - Mask CLx objections for a switch
+ * @sw: Switch to mask objections for
+ *
+ * Mask the objections coming from the second depth routers in order
+ * to stop these objections from interfering with the CL states of the first
+ * depth link.
+ */
+int tb_port_titan_ridge_clx_objection_mask(struct tb_switch *sw)
+{
+	int up_port = sw->config.upstream_port_number;
+	u32 offset, val[2], mask_obj, unmask_obj;
+	int ret, i;
+
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
+static unsigned int tb_switch_titan_ridge_pcie_bridge_mask(unsigned int br)
+{
+
+	return BIT(br + TB_PLUG_EVENTS_PCIE_CMD_BR_SHIFT);
+}
+
+/*
+ * Can be used for read/write a specified PCIe bridge for any
+ * Thunderbolt 3 device. For now used only for Titan Ridge.
+ */
+static int tb_switch_titan_ridge_access_pcie_bridge(struct tb_switch *sw,
+						    unsigned int bridge,
+						    unsigned int pcie_offset,
+						    unsigned int *value,
+						    bool write)
+{
+	u32 offset, command, val;
+	int ret;
+
+	if (sw->generation != 3)
+		return -EOPNOTSUPP;
+
+	if (write) {
+		offset = sw->cap_plug_events + TB_PLUG_EVENTS_PCIE_WR_DATA;
+		ret = tb_sw_write(sw, value, TB_CFG_SWITCH, offset, 1);
+		if (ret)
+			return ret;
+	}
+
+	command = pcie_offset & TB_PLUG_EVENTS_PCIE_CMD_DW_OFFSET_MASK;
+	command |= tb_switch_titan_ridge_pcie_bridge_mask(bridge);
+	command |= write ? TB_PLUG_EVENTS_PCIE_CMD_RD_WR_MASK : 0;
+	command |= TB_PLUG_EVENTS_PCIE_CMD_COMMAND_VAL <<
+		   TB_PLUG_EVENTS_PCIE_CMD_COMMAND_SHIFT;
+	command |= TB_PLUG_EVENTS_PCIE_CMD_REQ_ACK_MASK;
+
+	offset = sw->cap_plug_events + TB_PLUG_EVENTS_PCIE_CMD;
+
+	ret = tb_sw_write(sw, &command, TB_CFG_SWITCH, offset, 1);
+	if (ret)
+		return ret;
+
+	ret = tb_switch_wait_for_bit(sw, offset,
+				     TB_PLUG_EVENTS_PCIE_CMD_REQ_ACK_MASK, 0, 100);
+	if (ret)
+		return ret;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, offset, 1);
+	if (ret)
+		return ret;
+
+	if (val & TB_PLUG_EVENTS_PCIE_CMD_TIMEOUT_MASK)
+		return -ETIMEDOUT;
+
+	if (!write) {
+		offset = sw->cap_plug_events + TB_PLUG_EVENTS_PCIE_CMD_RD_DATA;
+		ret = tb_sw_read(sw, value, TB_CFG_SWITCH, offset, 1);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * tb_switch_titan_ridge_pcie_l1_enable() - Enable PCIe link to enter L1 state
+ * @sw: Titan Ridge switch to enable PCIe L1 for
+ *
+ * For Titan Ridge switch to enter CLx state, its PCIe bridges
+ * shall enable entry to PCIe L1 state. Shall be called after
+ * the upstream PCIe tunnel was configured. Due to Intel platforms limitation,
+ * shall be called only for first hop switch.
+ */
+int tb_switch_titan_ridge_pcie_l1_enable(struct tb_switch *sw)
+{
+	struct tb_switch *parent = tb_switch_parent(sw);
+	unsigned int value;
+	int ret;
+
+	if (!tb_route(sw))
+		return 0;
+
+	if (!tb_switch_is_titan_ridge(sw))
+		return 0;
+
+	/* Enable PCIe L1 enable only for first hop router (depth = 1) */
+	if (tb_route(parent))
+		return 0;
+
+	/* Write to Downstream PCIe bridge #5 aka Dn4 */
+	value = 0x0C7806B1;
+	ret = tb_switch_titan_ridge_access_pcie_bridge(sw, 5, 0x143,
+						       &value, true);
+	if (ret)
+		return ret;
+
+	/* Write to Upstream PCIe bridge #0 aka Up0 */
+	value = 0x0C5806B1;
+	return tb_switch_titan_ridge_access_pcie_bridge(sw, 0, 0x143,
+							&value, true);
+}
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index f241d42c1c6e..091567235e8e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1092,6 +1092,13 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 		return -EIO;
 	}
 
+	/*
+	 * In case of Titan Ridge CLx shall be enabled, enable PCIe L1 here,
+	 * after PCIe tunnelling was enabled.
+	 */
+	if (tb_switch_titan_ridge_pcie_l1_enable(sw))
+		tb_sw_warn(sw, "failed to enable PCIe L1 for Titan Ridge\n");
+
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
 	return 0;
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 0fcc279277df..2ff3ecb6269c 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -140,6 +140,7 @@ enum tb_clx {
  * @cap_plug_events: Offset to the plug events capability (%0 if not found)
  * @cap_vsec_tmu: Offset to the TMU vendor specific capability (%0 if not found)
  * @cap_lc: Offset to the link controller capability (%0 if not found)
+ * @cap_lp: Offset to the low power (CLx for TBT) capability (%0 if not found)
  * @is_unplugged: The switch is going away
  * @drom: DROM of the switch (%NULL if not found)
  * @nvm: Pointer to the NVM if the switch has one (%NULL otherwise)
@@ -192,6 +193,7 @@ struct tb_switch {
 	int cap_plug_events;
 	int cap_vsec_tmu;
 	int cap_lc;
+	int cap_lp;
 	bool is_unplugged;
 	u8 *drom;
 	struct tb_nvm *nvm;
@@ -933,6 +935,10 @@ void tb_switch_tmu_configure(struct tb_switch *sw,
 int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx);
 int tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx);
 bool tb_switch_is_clx_enabled(struct tb_switch *sw);
+bool tb_switch_is_cl0s_enabled(struct tb_switch *sw);
+bool tb_switch_clx_supported(struct tb_switch *sw);
+int tb_switch_titan_ridge_pcie_l1_enable(struct tb_switch *sw);
+int tb_port_titan_ridge_clx_objection_mask(struct tb_switch *sw);
 
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
@@ -1034,6 +1040,7 @@ bool tb_lc_dp_sink_query(struct tb_switch *sw, struct tb_port *in);
 int tb_lc_dp_sink_alloc(struct tb_switch *sw, struct tb_port *in);
 int tb_lc_dp_sink_dealloc(struct tb_switch *sw, struct tb_port *in);
 int tb_lc_force_power(struct tb_switch *sw);
+bool tb_lc_clx_supported(struct tb_port *port);
 
 static inline int tb_route_length(u64 route)
 {
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 08f1213ea565..4786e15241c8 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -307,6 +307,10 @@ struct tb_regs_port_header {
 #define TMU_ADP_CS_3_UDM			BIT(29)
 #define TMU_ADP_CS_6				0x06
 #define TMU_ADP_CS_6_DTS			BIT(1)
+/* Used for Titan Ridge only */
+#define TMU_ADP_CS_6_DISABLE_TMU_OBJ_MASK	GENMASK(3, 2)
+#define TMU_ADP_CS_6_DISABLE_TMU_OBJ_CL1	BIT(2)
+#define TMU_ADP_CS_6_DISABLE_TMU_OBJ_CL2	BIT(3)
 
 /* Lane adapter registers */
 #define LANE_ADP_CS_0				0x00
@@ -447,8 +451,33 @@ struct tb_regs_hop {
 } __packed;
 
 /* TMU Thunderbolt 3 registers */
-#define TB_TIME_VSEC_3_CS_26		0x1a
-#define TB_TIME_VSEC_3_CS_26_TD		BIT(22)
+#define TB_TIME_VSEC_3_CS_9			0x9
+#define TB_TIME_VSEC_3_CS_9_TMU_OBJ_MASK	GENMASK(17, 16)
+#define TB_TIME_VSEC_3_CS_26			0x1a
+#define TB_TIME_VSEC_3_CS_26_TD			BIT(22)
+
+/* Plug Events registers */
+#define TB_PLUG_EVENTS_PCIE_WR_DATA		0x1b
+#define TB_PLUG_EVENTS_PCIE_CMD			0x1c
+#define TB_PLUG_EVENTS_PCIE_CMD_DW_OFFSET_MASK	GENMASK(9, 0)
+#define TB_PLUG_EVENTS_PCIE_CMD_BR_SHIFT	10
+#define TB_PLUG_EVENTS_PCIE_CMD_BR_MASK		GENMASK(17, 10)
+#define TB_PLUG_EVENTS_PCIE_CMD_RD_WR_MASK	BIT(21)
+#define TB_PLUG_EVENTS_PCIE_CMD_WR		0x1
+#define TB_PLUG_EVENTS_PCIE_CMD_COMMAND_SHIFT	22
+#define TB_PLUG_EVENTS_PCIE_CMD_COMMAND_MASK	GENMASK(24, 22)
+#define TB_PLUG_EVENTS_PCIE_CMD_COMMAND_VAL	0x2
+#define TB_PLUG_EVENTS_PCIE_CMD_REQ_ACK_MASK	BIT(30)
+#define TB_PLUG_EVENTS_PCIE_CMD_TIMEOUT_MASK	BIT(31)
+#define TB_PLUG_EVENTS_PCIE_CMD_RD_DATA		0x1d
+
+/* CP Low Power registers */
+#define TB_LOW_PWR_C1_CL1		0x1
+#define TB_LOW_PWR_C1_CL1_OBJ_MASK	GENMASK(4, 1)
+#define TB_LOW_PWR_C1_CL2_OBJ_MASK	GENMASK(4, 1)
+#define TB_LOW_PWR_C1_PORT_A_MASK	GENMASK(2, 1)
+#define TB_LOW_PWR_C0_PORT_B_MASK	GENMASK(4, 3)
+#define TB_LOW_PWR_C3_CL1		0x3
 
 /* Common link controller registers */
 #define TB_LC_DESC			0x02
@@ -484,5 +513,7 @@ struct tb_regs_hop {
 #define TB_LC_SX_CTRL_SLI		BIT(29)
 #define TB_LC_SX_CTRL_UPSTREAM		BIT(30)
 #define TB_LC_SX_CTRL_SLP		BIT(31)
+#define TB_LC_LINK_ATTR			0x97
+#define TB_LC_LINK_ATTR_CPS		BIT(18)
 
 #endif
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index bbb5b1df8409..d21a7270c535 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -332,7 +332,12 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 	struct tb_port *up, *down;
 	int ret;
 
-	if (!tb_switch_is_usb4(sw))
+	/*
+	 * No need to disable TMU on devices that don't support CLx since on
+	 * these devices e.g. Alpine Ridge and earlier, the TMU mode HiFi-BiDir
+	 * is enabled by default and we don't change it.
+	 */
+	if (!tb_switch_clx_supported(sw))
 		return 0;
 
 	/* Already disabled? */
@@ -416,6 +421,53 @@ static int __tb_switch_tmu_enable_bidir(struct tb_switch *sw)
 	return ret;
 }
 
+static int tb_switch_titan_ridge_tmu_objection_mask(struct tb_switch *sw)
+{
+	u32 val;
+	int ret;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
+			 sw->cap_vsec_tmu + TB_TIME_VSEC_3_CS_9, 1);
+	if (ret)
+		return ret;
+
+	val &= ~TB_TIME_VSEC_3_CS_9_TMU_OBJ_MASK;
+
+	return tb_sw_write(sw, &val, TB_CFG_SWITCH,
+			   sw->cap_vsec_tmu + TB_TIME_VSEC_3_CS_9, 1);
+}
+
+static int tb_switch_titan_ridge_tmu_uni_enable(struct tb_switch *sw)
+{
+	struct tb_port *up;
+
+	if (!sw->tmu.unidirect_request)
+		return 0;
+
+	up = tb_upstream_port(sw);
+	return tb_port_tmu_write(up, TMU_ADP_CS_6,
+				 TMU_ADP_CS_6_DISABLE_TMU_OBJ_MASK,
+				 TMU_ADP_CS_6_DISABLE_TMU_OBJ_MASK);
+}
+
+static int tb_switch_titan_ridge_tmu_enable(struct tb_switch *sw)
+{
+	int ret;
+
+	if (!tb_switch_is_titan_ridge(sw))
+		return 0;
+
+	/* Titan Ridge supports only CL0s */
+	if (!tb_switch_is_cl0s_enabled(sw))
+		return -EOPNOTSUPP;
+
+	ret = tb_switch_titan_ridge_tmu_objection_mask(sw);
+	if (ret)
+		return ret;
+
+	return tb_switch_titan_ridge_tmu_uni_enable(sw);
+}
+
 /*
  * This function is called when the previous TMU mode was
  * TB_SWITCH_TMU_RATE_OFF
@@ -470,7 +522,12 @@ static int tb_switch_tmu_hifi_enable(struct tb_switch *sw)
 	if (unidirect && !sw->tmu.has_ucap)
 		return -EOPNOTSUPP;
 
-	if (!tb_switch_is_usb4(sw))
+	/*
+	 * No need to enable TMU on devices that don't support CLx since on
+	 * these devices e.g. Alpine Ridge and earlier, the TMU mode HiFi-BiDir
+	 * is enabled by default.
+	 */
+	if (!tb_switch_clx_supported(sw))
 		return 0;
 
 	if (tb_switch_tmu_hifi_is_enabled(sw, sw->tmu.unidirect_request))
@@ -519,9 +576,16 @@ static int tb_switch_tmu_hifi_enable(struct tb_switch *sw)
  */
 int tb_switch_tmu_enable(struct tb_switch *sw)
 {
+	int ret;
+
 	if (sw->tmu.rate_request == TB_SWITCH_TMU_RATE_NORMAL)
 		return -EOPNOTSUPP;
 
+	/* Titan Ridge specific operations to enable CL0s */
+	ret = tb_switch_titan_ridge_tmu_enable(sw);
+	if (ret)
+		return ret;
+
 	return tb_switch_tmu_hifi_enable(sw);
 }
 
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

