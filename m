Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449F749CC16
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 15:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242036AbiAZOQn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 09:16:43 -0500
Received: from mga01.intel.com ([192.55.52.88]:39082 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235509AbiAZOQm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jan 2022 09:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643206602; x=1674742602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aV5q4Ry+BalSNct/06ADjwAiiC1GpuVFVs1Q0bc01c4=;
  b=PqfKWPnqXs9hJgGos1xKkW/Na1N4UM9EHDSWkQ6Typ7dXS5qRm93Dfs4
   bUN4DjdYmG41uDdD8Qd/J3nhskxlx0BDHepSA43KVjlsxQt1X1sizIKxq
   DDDVPghnFYyS+RaVIwylV4RT4Y5INhk28SaxiJq3DCzS2ms2M9jysETUa
   N3hHfhTtm2HIHRqAGy0IuvAzk7p1XjeLJCHVxcXXHNyXF16plDQ6tbJQx
   TA8ZhMmyoZ5vMAlM/aV8Npb++3lT5ytA/7TglJ8uF6Zb6QJfqflK4e9z0
   eTn61Twwe5NdFUXsGjIaB7HfirA+LbwEzUS/tecV+aqOP+JFinu10nsJa
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="271008863"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="271008863"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 06:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="597473898"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2022 06:16:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 339F25E4; Wed, 26 Jan 2022 16:16:53 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] thunderbolt: Add internal xHCI connect flows for Thunderbolt 3 devices
Date:   Wed, 26 Jan 2022 17:16:52 +0300
Message-Id: <20220126141653.28092-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126141653.28092-1-mika.westerberg@linux.intel.com>
References: <20220126141653.28092-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Both Alpine Ridge and Titan Ridge require special flows in order to
activate the internal xHCI controller when there is USB device connected
to the downstream type-C port. This implements the missing flows for
both.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/lc.c      | 110 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c  |  71 +++++++++++++++++++++-
 drivers/thunderbolt/tb.c      |  11 ++++
 drivers/thunderbolt/tb.h      |   7 +++
 drivers/thunderbolt/tb_regs.h |   8 +++
 5 files changed, 206 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/lc.c b/drivers/thunderbolt/lc.c
index 53495a38b4eb..7f97adc4f803 100644
--- a/drivers/thunderbolt/lc.c
+++ b/drivers/thunderbolt/lc.c
@@ -217,6 +217,116 @@ bool tb_lc_is_clx_supported(struct tb_port *port)
 	return !!(val & TB_LC_LINK_ATTR_CPS);
 }
 
+/**
+ * tb_lc_is_usb_plugged() - Is there USB device connected to port
+ * @port: Device router lane 0 adapter
+ *
+ * Returns true if the @port has USB type-C device connected.
+ */
+bool tb_lc_is_usb_plugged(struct tb_port *port)
+{
+	struct tb_switch *sw = port->sw;
+	int cap, ret;
+	u32 val;
+
+	if (sw->generation != 3)
+		return false;
+
+	cap = find_port_lc_cap(port);
+	if (cap < 0)
+		return false;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, cap + TB_LC_CS_42, 1);
+	if (ret)
+		return false;
+
+	return !!(val & TB_LC_CS_42_USB_PLUGGED);
+}
+
+/**
+ * tb_lc_is_xhci_connected() - Is the internal xHCI connected
+ * @port: Device router lane 0 adapter
+ *
+ * Returns true if the internal xHCI has been connected to @port.
+ */
+bool tb_lc_is_xhci_connected(struct tb_port *port)
+{
+	struct tb_switch *sw = port->sw;
+	int cap, ret;
+	u32 val;
+
+	if (sw->generation != 3)
+		return false;
+
+	cap = find_port_lc_cap(port);
+	if (cap < 0)
+		return false;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, cap + TB_LC_LINK_REQ, 1);
+	if (ret)
+		return false;
+
+	return !!(val & TB_LC_LINK_REQ_XHCI_CONNECT);
+}
+
+static int __tb_lc_xhci_connect(struct tb_port *port, bool connect)
+{
+	struct tb_switch *sw = port->sw;
+	int cap, ret;
+	u32 val;
+
+	if (sw->generation != 3)
+		return -EINVAL;
+
+	cap = find_port_lc_cap(port);
+	if (cap < 0)
+		return cap;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, cap + TB_LC_LINK_REQ, 1);
+	if (ret)
+		return ret;
+
+	if (connect)
+		val |= TB_LC_LINK_REQ_XHCI_CONNECT;
+	else
+		val &= ~TB_LC_LINK_REQ_XHCI_CONNECT;
+
+	return tb_sw_write(sw, &val, TB_CFG_SWITCH, cap + TB_LC_LINK_REQ, 1);
+}
+
+/**
+ * tb_lc_xhci_connect() - Connect internal xHCI
+ * @port: Device router lane 0 adapter
+ *
+ * Tells LC to connect the internal xHCI to @port. Returns %0 in success
+ * and negative errno in case of failure. Can be called for Thunderbolt 3
+ * routers only.
+ */
+int tb_lc_xhci_connect(struct tb_port *port)
+{
+	int ret;
+
+	ret = __tb_lc_xhci_connect(port, true);
+	if (ret)
+		return ret;
+
+	tb_port_dbg(port, "xHCI connected\n");
+	return 0;
+}
+
+/**
+ * tb_lc_xhci_disconnect() - Disconnect internal xHCI
+ * @port: Device router lane 0 adapter
+ *
+ * Tells LC to disconnect the internal xHCI from @port. Can be called
+ * for Thunderbolt 3 routers only.
+ */
+void tb_lc_xhci_disconnect(struct tb_port *port)
+{
+	__tb_lc_xhci_connect(port, false);
+	tb_port_dbg(port, "xHCI disconnected\n");
+}
+
 static int tb_lc_set_wake_one(struct tb_switch *sw, unsigned int offset,
 			      unsigned int flags)
 {
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d026e305fe5d..b5fb3e76ed09 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1528,7 +1528,13 @@ static int tb_plug_events_active(struct tb_switch *sw, bool active)
 		case PCI_DEVICE_ID_INTEL_PORT_RIDGE:
 			break;
 		default:
-			data |= 4;
+			/*
+			 * Skip Alpine Ridge, it needs to have vendor
+			 * specific USB hotplug event enabled for the
+			 * internal xHCI to work.
+			 */
+			if (!tb_switch_is_alpine_ridge(sw))
+				data |= TB_PLUG_EVENTS_USB_DISABLE;
 		}
 	} else {
 		data = data | 0x7c;
@@ -3689,3 +3695,66 @@ int tb_switch_pcie_l1_enable(struct tb_switch *sw)
 	/* Write to Upstream PCIe bridge #0 aka Up0 */
 	return tb_switch_pcie_bridge_write(sw, 0, 0x143, 0x0c5806b1);
 }
+
+/**
+ * tb_switch_xhci_connect() - Connect internal xHCI
+ * @sw: Router whose xHCI to connect
+ *
+ * Can be called to any router. For Alpine Ridge and Titan Ridge
+ * performs special flows that bring the xHCI functional for any device
+ * connected to the type-C port. Call only after PCIe tunnel has been
+ * established. The function only does the connect if not done already
+ * so can be called several times for the same router.
+ */
+int tb_switch_xhci_connect(struct tb_switch *sw)
+{
+	bool usb_port1, usb_port3, xhci_port1, xhci_port3;
+	struct tb_port *port1, *port3;
+	int ret;
+
+	port1 = &sw->ports[1];
+	port3 = &sw->ports[3];
+
+	if (tb_switch_is_alpine_ridge(sw)) {
+		usb_port1 = tb_lc_is_usb_plugged(port1);
+		usb_port3 = tb_lc_is_usb_plugged(port3);
+		xhci_port1 = tb_lc_is_xhci_connected(port1);
+		xhci_port3 = tb_lc_is_xhci_connected(port3);
+
+		/* Figure out correct USB port to connect */
+		if (usb_port1 && !xhci_port1) {
+			ret = tb_lc_xhci_connect(port1);
+			if (ret)
+				return ret;
+		}
+		if (usb_port3 && !xhci_port3)
+			return tb_lc_xhci_connect(port3);
+	} else if (tb_switch_is_titan_ridge(sw)) {
+		ret = tb_lc_xhci_connect(port1);
+		if (ret)
+			return ret;
+		return tb_lc_xhci_connect(port3);
+	}
+
+	return 0;
+}
+
+/**
+ * tb_switch_xhci_disconnect() - Disconnect internal xHCI
+ * @sw: Router whose xHCI to disconnect
+ *
+ * The opposite of tb_switch_xhci_connect(). Disconnects xHCI on both
+ * ports.
+ */
+void tb_switch_xhci_disconnect(struct tb_switch *sw)
+{
+	if (sw->generation == 3) {
+		struct tb_port *port1 = &sw->ports[1];
+		struct tb_port *port3 = &sw->ports[3];
+
+		tb_lc_xhci_disconnect(port1);
+		tb_port_dbg(port1, "disconnected xHCI\n");
+		tb_lc_xhci_disconnect(port3);
+		tb_port_dbg(port3, "disconnected xHCI\n");
+	}
+}
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index cbd0ad85ffb1..9beb47b31c75 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1054,6 +1054,8 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
 	if (WARN_ON(!tunnel))
 		return -ENODEV;
 
+	tb_switch_xhci_disconnect(sw);
+
 	tb_tunnel_deactivate(tunnel);
 	list_del(&tunnel->list);
 	tb_tunnel_free(tunnel);
@@ -1099,6 +1101,9 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 	if (tb_switch_pcie_l1_enable(sw))
 		tb_sw_warn(sw, "failed to enable PCIe L1 for Titan Ridge\n");
 
+	if (tb_switch_xhci_connect(sw))
+		tb_sw_warn(sw, "failed to connect xHCI\n");
+
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
 	return 0;
 }
@@ -1256,12 +1261,18 @@ static void tb_handle_hotplug(struct work_struct *work)
 			tb_port_unconfigure_xdomain(port);
 		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
 			tb_dp_resource_unavailable(tb, port);
+		} else if (!port->port) {
+			tb_sw_dbg(sw, "xHCI disconnect request\n");
+			tb_switch_xhci_disconnect(sw);
 		} else {
 			tb_port_dbg(port,
 				   "got unplug event for disconnected port, ignoring\n");
 		}
 	} else if (port->remote) {
 		tb_port_dbg(port, "got plug event for connected port, ignoring\n");
+	} else if (!port->port && sw->authorized) {
+		tb_sw_dbg(sw, "xHCI connect request\n");
+		tb_switch_xhci_connect(sw);
 	} else {
 		if (tb_port_is_null(port)) {
 			tb_port_dbg(port, "hotplug: scanning\n");
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 44e36498b261..b6fcd8d45324 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -988,6 +988,9 @@ int tb_switch_mask_clx_objections(struct tb_switch *sw);
 
 int tb_switch_pcie_l1_enable(struct tb_switch *sw);
 
+int tb_switch_xhci_connect(struct tb_switch *sw);
+void tb_switch_xhci_disconnect(struct tb_switch *sw);
+
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
 int tb_port_clear_counter(struct tb_port *port, int counter);
@@ -1082,6 +1085,10 @@ int tb_lc_configure_xdomain(struct tb_port *port);
 void tb_lc_unconfigure_xdomain(struct tb_port *port);
 int tb_lc_start_lane_initialization(struct tb_port *port);
 bool tb_lc_is_clx_supported(struct tb_port *port);
+bool tb_lc_is_usb_plugged(struct tb_port *port);
+bool tb_lc_is_xhci_connected(struct tb_port *port);
+int tb_lc_xhci_connect(struct tb_port *port);
+void tb_lc_xhci_disconnect(struct tb_port *port);
 int tb_lc_set_wake(struct tb_switch *sw, unsigned int flags);
 int tb_lc_set_sleep(struct tb_switch *sw);
 bool tb_lc_lane_bonding_possible(struct tb_switch *sw);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index a74f4878d3e7..dc00cbd69d36 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -462,6 +462,8 @@ struct tb_regs_hop {
 #define TMU_ADP_CS_6_DISABLE_TMU_OBJ_CL2	BIT(3)
 
 /* Plug Events registers */
+#define TB_PLUG_EVENTS_USB_DISABLE		BIT(2)
+
 #define TB_PLUG_EVENTS_PCIE_WR_DATA		0x1b
 #define TB_PLUG_EVENTS_PCIE_CMD			0x1c
 #define TB_PLUG_EVENTS_PCIE_CMD_DW_OFFSET_MASK	GENMASK(9, 0)
@@ -501,6 +503,9 @@ struct tb_regs_hop {
 #define TB_LC_POWER				0x740
 
 /* Link controller registers */
+#define TB_LC_CS_42				0x2a
+#define TB_LC_CS_42_USB_PLUGGED			BIT(31)
+
 #define TB_LC_PORT_ATTR				0x8d
 #define TB_LC_PORT_ATTR_BE			BIT(12)
 
@@ -521,4 +526,7 @@ struct tb_regs_hop {
 #define TB_LC_LINK_ATTR				0x97
 #define TB_LC_LINK_ATTR_CPS			BIT(18)
 
+#define TB_LC_LINK_REQ				0xad
+#define TB_LC_LINK_REQ_XHCI_CONNECT		BIT(31)
+
 #endif
-- 
2.34.1

