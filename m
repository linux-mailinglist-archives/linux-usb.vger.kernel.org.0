Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4954781F0
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 02:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbhLQBKb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 20:10:31 -0500
Received: from mga09.intel.com ([134.134.136.24]:64450 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230183AbhLQBKa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Dec 2021 20:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639703430; x=1671239430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Y/gY/WRAdijNcsafpZlZXaSvAmph6spdj+cRKlv++3A=;
  b=FY9HwhjeUruhhnNn+q1fimFI+8mRQMIp84WiTwZ9sr5EFSxh81sD0qiz
   fbKR0cvXYHn9CdVlVOv3vKOSNLz+hG9IFmITeE8p74eKhH90BuvBWHlmI
   iwz5hAKyhE2wLH/tSKLt/LliPrvauEnJmOavcWIbjnPATV6kp7vONLPp/
   YA9o7h3FVzm21FsfXWkUCNOaNtXxfEhqdFOmMlCDB9D89/E+9iwn3QWnr
   Bwv4El5ngHighBpY0ieI6S3I00zEKpo22mbIUo8clDHZ2cjk4OBYqWtQ4
   2vglnA1ImiB0aiSV/n3jmSH/61tcDXU7WVuzyhn6zXT2l9i8ZzirUudKL
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239460834"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="239460834"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 17:10:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="605733699"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2021 17:10:15 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v2 2/7] thunderbolt: Add CL0s support for USB4
Date:   Fri, 17 Dec 2021 03:16:39 +0200
Message-Id: <20211217011644.21634-3-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211217011644.21634-1-gil.fine@intel.com>
References: <20211217011644.21634-1-gil.fine@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In this patch we add enabling of CL0s - low power state of the link.
Low power states (called collectively CLx) are used to reduce
transmitter and receiver power when a high-speed lane is idle.
For now, we add support only for first low power state - CL0s.
We enable it, if both sides of the link support it,
and only for the first hop router.
(i.e. the first device that connected to the host router).
That is the most common use-case, that is intended for
better thermal management, and so helps to improve performance.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c  | 289 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.c      |   9 +-
 drivers/thunderbolt/tb.h      |  29 ++++
 drivers/thunderbolt/tb_regs.h |   6 +
 drivers/thunderbolt/usb4.c    |  20 +++
 5 files changed, 352 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 13f9230104d7..2e8cb4acdf72 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3223,3 +3223,292 @@ struct tb_port *tb_switch_find_port(struct tb_switch *sw,
 
 	return NULL;
 }
+
+static int __tb_port_pm_secondary_set(struct tb_port *port, bool secondary)
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
+	return __tb_port_pm_secondary_set(port, true);
+}
+
+static int tb_port_pm_secondary_disable(struct tb_port *port)
+{
+	return __tb_port_pm_secondary_set(port, false);
+}
+
+static int tb_switch_pm_secondary_resolve(struct tb_switch *sw)
+{
+	struct tb_switch *parent = tb_switch_parent(sw);
+	struct tb_port *up, *down;
+	int ret;
+
+	if (!tb_route(sw))
+		return 0;
+
+	up = tb_upstream_port(sw);
+	down = tb_port_at(tb_route(sw), parent);
+	ret = tb_port_pm_secondary_enable(up);
+	if (ret)
+		return ret;
+
+	ret = tb_port_pm_secondary_disable(down);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
+{
+	u32 mask, val;
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
+	if (!usb4_port_clx_supported(port))
+		return false;
+
+	switch (clx) {
+	case TB_CL0S:
+		/* CL0s support requires also CL1 support */
+		mask = LANE_ADP_CS_0_CL0S_SUPPORT | LANE_ADP_CS_0_CL1_SUPPORT;
+		break;
+
+	/* For now we support only CL0s. Not CL1, CL2 */
+	case TB_CL1:
+	case TB_CL2:
+	default:
+		return false;
+	}
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_0, 1);
+	if (ret)
+		return false;
+
+	return !!(val & mask);
+}
+
+static inline bool tb_port_cl0s_supported(struct tb_port *port)
+{
+	return tb_port_clx_supported(port, TB_CL0S);
+}
+
+static int __tb_port_cl0s_set(struct tb_port *port, bool enable)
+{
+	u32 phy, mask;
+	int ret;
+
+	/* To enable CL0s, also required to enable CL1 */
+	mask = LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
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
+static int tb_port_cl0s_disable(struct tb_port *port)
+{
+	return __tb_port_cl0s_set(port, false);
+}
+
+static int tb_port_cl0s_enable(struct tb_port *port)
+{
+	return __tb_port_cl0s_set(port, true);
+}
+
+static int tb_switch_enable_cl0s(struct tb_switch *sw)
+{
+	struct tb_switch *parent = tb_switch_parent(sw);
+	bool up_cl0s_support, down_cl0s_support;
+	struct tb_port *up, *down;
+	int ret;
+
+	if (!tb_switch_is_usb4(sw))
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
+	if (tb_route(parent))
+		return 0;
+
+	if (tb_switch_pm_secondary_resolve(sw))
+		return -EINVAL;
+
+	up = tb_upstream_port(sw);
+	down = tb_port_at(tb_route(sw), parent);
+
+	up_cl0s_support = tb_port_cl0s_supported(up);
+	down_cl0s_support = tb_port_cl0s_supported(down);
+
+	tb_port_dbg(up, "CL0s %ssupported\n",
+		    up_cl0s_support ? "" : "not ");
+	tb_port_dbg(down, "CL0s %ssupported\n",
+		    down_cl0s_support ? "" : "not ");
+
+	if (!up_cl0s_support || !down_cl0s_support)
+		return -EOPNOTSUPP;
+
+	ret = tb_port_cl0s_enable(up);
+	if (ret)
+		return ret;
+
+	ret = tb_port_cl0s_enable(down);
+	if (ret) {
+		tb_port_cl0s_disable(up);
+		return ret;
+	}
+
+	sw->clx = TB_CL0S;
+
+	tb_sw_dbg(sw, "enabled CL0s on upstream port\n");
+	return 0;
+}
+
+/**
+ * tb_switch_enable_clx() - Enable CLx on upstream port of specified router
+ * @sw: The switch to enable CLx for
+ * @clx: The CLx state to enable
+ *
+ * Enable CLx state only for first hop router. That is the most common
+ * use-case, that is intended for better thermal management, and so helps to
+ * improve performance.
+ * CLx is enabled only if both sides of the link support CLx, and if
+ * both sides of the link are not configured as two single lane links
+ * and only if the link is not inter-domain link.
+ * The complete set of conditions is descibed in CM Guide 1.0 section 8.1.
+ *
+ * Return: Returns 0 on success or an error code on failure.
+ */
+int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
+{
+	struct tb_switch *root_sw = sw->tb->root_switch;
+
+	/* CLx is not enabled and validated on USB4 platforms before ADL */
+	if (root_sw->generation < 4 ||
+	    tb_switch_is_tiger_lake(root_sw))
+		return 0;
+
+	switch (clx) {
+	case TB_CL0S:
+		return tb_switch_enable_cl0s(sw);
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int tb_switch_disable_cl0s(struct tb_switch *sw)
+{
+	struct tb_switch *parent = tb_switch_parent(sw);
+	struct tb_port *up, *down;
+	int ret;
+
+	if (!tb_switch_is_usb4(sw))
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
+	if (tb_route(parent))
+		return 0;
+
+	up = tb_upstream_port(sw);
+	down = tb_port_at(tb_route(sw), parent);
+	ret = tb_port_cl0s_disable(up);
+	if (ret)
+		return ret;
+
+	ret = tb_port_cl0s_disable(down);
+	if (ret)
+		return ret;
+
+	sw->clx = TB_CLX_DISABLE;
+
+	tb_sw_dbg(sw, "disabled CL0s on upstream port\n");
+	return 0;
+}
+
+/**
+ * tb_switch_disable_clx() - Disable CLx on upstream port of specified router
+ * @sw: The switch to disable CLx for
+ * @clx: The CLx state to disable
+ *
+ * Return: Returns 0 on success or an error code on failure.
+ */
+int tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
+{
+	switch (clx) {
+	case TB_CL0S:
+		return tb_switch_disable_cl0s(sw);
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+/**
+ * tb_switch_is_clx_enabled() - Checks if the CLx is enabled
+ * @sw: Router to check the CLx state for
+ *
+ * Checks if the CLx is enabled on the router upstream link.
+ * Not applicable for a host router.
+ */
+bool tb_switch_is_clx_enabled(struct tb_switch *sw)
+{
+	return sw->clx != TB_CLX_DISABLE;
+}
+
+/**
+ * tb_switch_is_cl0s_enabled() - Checks if the CL0s is enabled
+ * @sw: Router to check the CLx state for
+ *
+ * Checks if the CL0s is enabled on the router upstream link.
+ * Not applicable for a host router.
+ */
+bool tb_switch_is_cl0s_enabled(struct tb_switch *sw)
+{
+	return sw->clx == TB_CL0S;
+}
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 96e0a029d6c8..2d3c8c5baf9f 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -669,7 +669,11 @@ static void tb_scan_port(struct tb_port *port)
 	tb_switch_lane_bonding_enable(sw);
 	/* Set the link configured */
 	tb_switch_configure_link(sw);
-	tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
+	if (tb_switch_enable_clx(sw, TB_CL0S))
+		tb_sw_warn(sw, "failed to enable CLx on upstream port\n");
+
+	tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI,
+				tb_switch_is_clx_enabled(sw));
 
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to enable TMU\n");
@@ -1420,6 +1424,9 @@ static void tb_restore_children(struct tb_switch *sw)
 	if (sw->is_unplugged)
 		return;
 
+	if (tb_switch_enable_clx(sw, TB_CL0S))
+		tb_sw_warn(sw, "failed to re-enable CLx on upstream port\n");
+
 	/*
 	 * tb_switch_tmu_configure() was already called when the switch was
 	 * added before entering system sleep or runtime suspend,
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index b57f14893f38..527b461a5c49 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -109,6 +109,13 @@ struct tb_switch_tmu {
 	enum tb_switch_tmu_rate rate_request;
 };
 
+enum tb_clx {
+	TB_CLX_DISABLE,
+	TB_CL0S,
+	TB_CL1,
+	TB_CL2,
+};
+
 /**
  * struct tb_switch - a thunderbolt switch
  * @dev: Device for the switch
@@ -157,6 +164,7 @@ struct tb_switch_tmu {
  * @min_dp_main_credits: Router preferred minimum number of buffers for DP MAIN
  * @max_pcie_credits: Router preferred number of buffers for PCIe
  * @max_dma_credits: Router preferred number of buffers for DMA/P2P
+ * @clx: CLx state on the upstream link of the switch
  *
  * When the switch is being added or removed to the domain (other
  * switches) you need to have domain lock held.
@@ -205,6 +213,7 @@ struct tb_switch {
 	unsigned int min_dp_main_credits;
 	unsigned int max_pcie_credits;
 	unsigned int max_dma_credits;
+	enum tb_clx clx;
 };
 
 /**
@@ -862,6 +871,20 @@ static inline bool tb_switch_is_titan_ridge(const struct tb_switch *sw)
 	return false;
 }
 
+static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
+{
+	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
+		switch (sw->config.device_id) {
+		case PCI_DEVICE_ID_INTEL_TGL_NHI0:
+		case PCI_DEVICE_ID_INTEL_TGL_NHI1:
+		case PCI_DEVICE_ID_INTEL_TGL_H_NHI0:
+		case PCI_DEVICE_ID_INTEL_TGL_H_NHI1:
+			return true;
+		}
+	}
+	return false;
+}
+
 /**
  * tb_switch_is_usb4() - Is the switch USB4 compliant
  * @sw: Switch to check
@@ -904,6 +927,11 @@ bool tb_switch_tmu_hifi_is_enabled(struct tb_switch *sw, bool unidirect);
 void tb_switch_tmu_configure(struct tb_switch *sw,
 			     enum tb_switch_tmu_rate rate,
 			     bool unidirectional);
+
+int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx);
+int tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx);
+bool tb_switch_is_clx_enabled(struct tb_switch *sw);
+
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
 int tb_port_clear_counter(struct tb_port *port, int counter);
@@ -1126,6 +1154,7 @@ static inline struct usb4_port *tb_to_usb4_port_device(struct device *dev)
 struct usb4_port *usb4_port_device_add(struct tb_port *port);
 void usb4_port_device_remove(struct usb4_port *usb4);
 int usb4_port_device_resume(struct usb4_port *usb4);
+bool usb4_port_clx_supported(struct tb_port *port);
 
 /* Keep link controller awake during update */
 #define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 89a2170032bf..1af822934f82 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -313,11 +313,15 @@ struct tb_regs_port_header {
 #define LANE_ADP_CS_0				0x00
 #define LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK	GENMASK(25, 20)
 #define LANE_ADP_CS_0_SUPPORTED_WIDTH_SHIFT	20
+#define LANE_ADP_CS_0_CL0S_SUPPORT		BIT(26)
+#define LANE_ADP_CS_0_CL1_SUPPORT		BIT(27)
 #define LANE_ADP_CS_1				0x01
 #define LANE_ADP_CS_1_TARGET_WIDTH_MASK		GENMASK(9, 4)
 #define LANE_ADP_CS_1_TARGET_WIDTH_SHIFT	4
 #define LANE_ADP_CS_1_TARGET_WIDTH_SINGLE	0x1
 #define LANE_ADP_CS_1_TARGET_WIDTH_DUAL		0x3
+#define LANE_ADP_CS_1_CL0S_ENABLE		BIT(10)
+#define LANE_ADP_CS_1_CL1_ENABLE		BIT(11)
 #define LANE_ADP_CS_1_LD			BIT(14)
 #define LANE_ADP_CS_1_LB			BIT(15)
 #define LANE_ADP_CS_1_CURRENT_SPEED_MASK	GENMASK(19, 16)
@@ -326,6 +330,7 @@ struct tb_regs_port_header {
 #define LANE_ADP_CS_1_CURRENT_SPEED_GEN3	0x4
 #define LANE_ADP_CS_1_CURRENT_WIDTH_MASK	GENMASK(25, 20)
 #define LANE_ADP_CS_1_CURRENT_WIDTH_SHIFT	20
+#define LANE_ADP_CS_1_PMS			BIT(30)
 
 /* USB4 port registers */
 #define PORT_CS_1				0x01
@@ -341,6 +346,7 @@ struct tb_regs_port_header {
 #define PORT_CS_18				0x12
 #define PORT_CS_18_BE				BIT(8)
 #define PORT_CS_18_TCM				BIT(9)
+#define PORT_CS_18_CPS				BIT(10)
 #define PORT_CS_18_WOU4S			BIT(18)
 #define PORT_CS_19				0x13
 #define PORT_CS_19_PC				BIT(3)
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index ceddbe7e9f93..704820c9a042 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -2029,3 +2029,23 @@ int usb4_usb3_port_release_bandwidth(struct tb_port *port, int *upstream_bw,
 	usb4_usb3_port_clear_cm_request(port);
 	return ret;
 }
+
+/**
+ * usb4_port_clx_supported() - Check if CLx is supported by the link
+ * @port: Port to check for CLx support for
+ *
+ * PORT_CS_18_CPS bit reflects if the link supports CLx including
+ * active cables (if connected on the link).
+ */
+bool usb4_port_clx_supported(struct tb_port *port)
+{
+	int ret;
+	u32 val;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_usb4 + PORT_CS_18, 1);
+	if (ret)
+		return false;
+
+	return !!(val & PORT_CS_18_CPS);
+}
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

