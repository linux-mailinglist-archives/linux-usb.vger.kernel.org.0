Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A87DC32AE
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 13:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733034AbfJALjV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 07:39:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:17385 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732670AbfJALim (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 07:38:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 04:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="220968933"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2019 04:38:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id BFB996D2; Tue,  1 Oct 2019 14:38:31 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 20/22] thunderbolt: Add support for USB tunnels
Date:   Tue,  1 Oct 2019 14:38:28 +0300
Message-Id: <20191001113830.13028-21-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Rajmohan Mani <rajmohan.mani@intel.com>

USB4 added a capability to tunnel USB 3.x protocol over the USB4
fabric. USB4 device routers may include integrated SuperSpeed HUB or a
function or both. USB tunneling follows PCIe so that the tunnel is
created between the parent and the child router from USB downstream
adapter port to USB upstream adapter port over a single USB4 link.

This adds support for USB tunneling and also capability to discover
existing USB tunnels (for example created by connection manager in boot
firmware).

Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
Co-developed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  |  35 ++++++++
 drivers/thunderbolt/tb.c      | 153 ++++++++++++++++++++++++++------
 drivers/thunderbolt/tb.h      |  15 ++++
 drivers/thunderbolt/tb_regs.h |   9 +-
 drivers/thunderbolt/tunnel.c  | 158 +++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/tunnel.h  |   9 ++
 drivers/thunderbolt/usb4.c    |  41 ++++++++-
 7 files changed, 393 insertions(+), 27 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 58e3f54ddbb9..5a3236fefb76 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1025,11 +1025,46 @@ bool tb_port_is_enabled(struct tb_port *port)
 	case TB_TYPE_DP_HDMI_OUT:
 		return tb_dp_port_is_enabled(port);
 
+	case TB_TYPE_USB_UP:
+	case TB_TYPE_USB_DOWN:
+		return tb_usb_port_is_enabled(port);
+
 	default:
 		return false;
 	}
 }
 
+/**
+ * tb_usb_port_is_enabled() - Is the USB adapter port enabled
+ * @port: USB port to check
+ */
+bool tb_usb_port_is_enabled(struct tb_port *port)
+{
+	u32 data;
+
+	if (tb_port_read(port, &data, TB_CFG_PORT,
+			 port->cap_adap + ADP_USB3_CS_0, 1))
+		return false;
+
+	return !!(data & ADP_USB3_CS_0_PE);
+}
+
+/**
+ * tb_usb_port_enable() - Enable USB adapter port
+ * @port: USB port to enable
+ * @enable: Enable/disable the USB adapter
+ */
+int tb_usb_port_enable(struct tb_port *port, bool enable)
+{
+	u32 word = enable ? (ADP_USB3_CS_0_PE | ADP_USB3_CS_0_V)
+			  : ADP_USB3_CS_0_V;
+
+	if (!port->cap_adap)
+		return -ENXIO;
+	return tb_port_write(port, &word, TB_CFG_PORT,
+			     port->cap_adap + ADP_USB3_CS_0, 1);
+}
+
 /**
  * tb_pci_port_is_enabled() - Is the PCIe adapter port enabled
  * @port: PCIe port to check
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index f2868c125637..6c468ba96e9a 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -116,6 +116,10 @@ static void tb_discover_tunnels(struct tb_switch *sw)
 			tunnel = tb_tunnel_discover_pci(tb, port);
 			break;
 
+		case TB_TYPE_USB_DOWN:
+			tunnel = tb_tunnel_discover_usb(tb, port);
+			break;
+
 		default:
 			break;
 		}
@@ -180,6 +184,117 @@ static int tb_enable_tmu(struct tb_switch *sw)
 	return tb_switch_tmu_enable(sw);
 }
 
+/**
+ * tb_find_unused_port() - return the first inactive port on @sw
+ * @sw: Switch to find the port on
+ * @type: Port type to look for
+ */
+static struct tb_port *tb_find_unused_port(struct tb_switch *sw,
+					   enum tb_port_type type)
+{
+	int i;
+
+	tb_switch_for_each_port(sw, i) {
+		if (tb_is_upstream_port(&sw->ports[i]))
+			continue;
+		if (sw->ports[i].config.type != type)
+			continue;
+		if (!sw->ports[i].cap_adap)
+			continue;
+		if (tb_port_is_enabled(&sw->ports[i]))
+			continue;
+		return &sw->ports[i];
+	}
+	return NULL;
+}
+
+static struct tb_port *tb_find_usb_down(struct tb_switch *sw,
+					const struct tb_port *port)
+{
+	struct tb_port *down;
+
+	down = usb4_switch_map_usb_down(sw, port);
+	if (down) {
+		if (WARN_ON(!tb_port_is_usb_down(down)))
+			goto out;
+		if (WARN_ON(tb_usb_port_is_enabled(down)))
+			goto out;
+
+		return down;
+	}
+
+out:
+	return tb_find_unused_port(sw, TB_TYPE_USB_DOWN);
+}
+
+static int tb_tunnel_usb(struct tb *tb, struct tb_switch *sw)
+{
+	struct tb_switch *parent = tb_switch_parent(sw);
+	struct tb_port *up, *down, *port;
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_tunnel *tunnel;
+
+	up = tb_switch_find_port(sw, TB_TYPE_USB_UP);
+	if (!up)
+		return 0;
+
+	/*
+	 * Look up available down port. Since we are chaining it should
+	 * be found right above this switch.
+	 */
+	port = tb_port_at(tb_route(sw), parent);
+	down = tb_find_usb_down(parent, port);
+	if (!down)
+		return 0;
+
+	if (tb_route(parent)) {
+		struct tb_port *parent_up;
+		/*
+		 * Check first that the parent switch has its upstream
+		 * USB port enabled. Otherwise the chain is not complete
+		 * and there is no point setting up a new tunnel.
+		 */
+		parent_up = tb_switch_find_port(parent, TB_TYPE_USB_UP);
+		if (!parent_up || !tb_port_is_enabled(parent_up))
+			return 0;
+	}
+
+	tunnel = tb_tunnel_alloc_usb(tb, up, down);
+	if (!tunnel)
+		return -ENOMEM;
+
+	if (tb_tunnel_activate(tunnel)) {
+		tb_port_info(up,
+			     "USB tunnel activation failed, aborting\n");
+		tb_tunnel_free(tunnel);
+		return -EIO;
+	}
+
+	list_add_tail(&tunnel->list, &tcm->tunnel_list);
+	return 0;
+}
+
+static int tb_create_usb_tunnels(struct tb_switch *sw)
+{
+	int i, ret;
+
+	if (tb_route(sw)) {
+		ret = tb_tunnel_usb(sw->tb, sw);
+		if (ret)
+			return ret;
+	}
+
+	tb_switch_for_each_remote_port(sw, i) {
+		struct tb_port *port = &sw->ports[i];
+
+		ret = tb_create_usb_tunnels(port->remote->sw);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void tb_scan_port(struct tb_port *port);
 
 /**
@@ -285,6 +400,15 @@ static void tb_scan_port(struct tb_port *port)
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to enable TMU\n");
 
+	/*
+	 * Create USB tunnels only when the switch is plugged to the
+	 * domain. This is because we scan the domain also during
+	 * discovery and want to discover existing USB tunnels before we
+	 * create any new.
+	 */
+	if (tcm->hotplug_active && tb_tunnel_usb(sw->tb, sw))
+		tb_sw_warn(sw, "USB tunnel creation failed\n");
+
 	tb_scan_switch(sw);
 }
 
@@ -365,30 +489,6 @@ static void tb_free_unplugged_children(struct tb_switch *sw)
 	}
 }
 
-/**
- * tb_find_unused_port() - return the first inactive port on @sw
- * @sw: Switch to find the port on
- * @type: Port type to look for
- */
-static struct tb_port *tb_find_unused_port(struct tb_switch *sw,
-					   enum tb_port_type type)
-{
-	int i;
-
-	tb_switch_for_each_port(sw, i) {
-		if (tb_is_upstream_port(&sw->ports[i]))
-			continue;
-		if (sw->ports[i].config.type != type)
-			continue;
-		if (!sw->ports[i].cap_adap)
-			continue;
-		if (tb_port_is_enabled(&sw->ports[i]))
-			continue;
-		return &sw->ports[i];
-	}
-	return NULL;
-}
-
 static struct tb_port *tb_find_pcie_down(struct tb_switch *sw,
 					 const struct tb_port *port)
 {
@@ -890,6 +990,11 @@ static int tb_start(struct tb *tb)
 	tb_scan_switch(tb->root_switch);
 	/* Find out tunnels created by the boot firmware */
 	tb_discover_tunnels(tb->root_switch);
+	/*
+	 * If the boot firmware did not create USB tunnels create them
+	 * now for the whole topology.
+	 */
+	tb_create_usb_tunnels(tb->root_switch);
 	/* Add DP IN resources for the root switch */
 	tb_add_dp_resources(tb->root_switch);
 	/* Make the discovered switches available to the userspace */
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 087fd6d6ef9a..fbeb8bab77e5 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -432,6 +432,16 @@ static inline bool tb_port_is_dpout(const struct tb_port *port)
 	return port && port->config.type == TB_TYPE_DP_HDMI_OUT;
 }
 
+static inline bool tb_port_is_usb_down(const struct tb_port *port)
+{
+	return port && port->config.type == TB_TYPE_USB_DOWN;
+}
+
+static inline bool tb_port_is_usb_up(const struct tb_port *port)
+{
+	return port && port->config.type == TB_TYPE_USB_UP;
+}
+
 static inline int tb_sw_read(struct tb_switch *sw, void *buffer,
 			     enum tb_cfg_space space, u32 offset, u32 length)
 {
@@ -760,6 +770,9 @@ int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap);
 int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap);
 bool tb_port_is_enabled(struct tb_port *port);
 
+bool tb_usb_port_is_enabled(struct tb_port *port);
+int tb_usb_port_enable(struct tb_port *port, bool enable);
+
 bool tb_pci_port_is_enabled(struct tb_port *port);
 int tb_pci_port_enable(struct tb_port *port, bool enable);
 
@@ -842,6 +855,8 @@ int usb4_switch_alloc_dp_resource(struct tb_switch *sw, struct tb_port *in);
 int usb4_switch_dealloc_dp_resource(struct tb_switch *sw, struct tb_port *in);
 struct tb_port *usb4_switch_map_pcie_down(struct tb_switch *sw,
 					  const struct tb_port *port);
+struct tb_port *usb4_switch_map_usb_down(struct tb_switch *sw,
+					 const struct tb_port *port);
 
 int usb4_port_unlock(struct tb_port *port);
 #endif
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index ec1a5d1f7c94..062676229ac1 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -180,6 +180,7 @@ struct tb_regs_switch_header {
 #define ROUTER_CS_5_SLP				BIT(0)
 #define ROUTER_CS_5_C3S				BIT(23)
 #define ROUTER_CS_5_PTO				BIT(24)
+#define ROUTER_CS_5_UTO				BIT(25)
 #define ROUTER_CS_5_HCO				BIT(26)
 #define ROUTER_CS_5_CV				BIT(31)
 #define ROUTER_CS_6				0x06
@@ -221,7 +222,8 @@ enum tb_port_type {
 	TB_TYPE_DP_HDMI_OUT	= 0x0e0102,
 	TB_TYPE_PCIE_DOWN	= 0x100101,
 	TB_TYPE_PCIE_UP		= 0x100102,
-	/* TB_TYPE_USB		= 0x200000, lower order bits are not known */
+	TB_TYPE_USB_DOWN	= 0x200101,
+	TB_TYPE_USB_UP		= 0x200102,
 };
 
 /* Present on every port in TB_CF_PORT at address zero. */
@@ -331,6 +333,11 @@ struct tb_regs_port_header {
 #define ADP_PCIE_CS_0				0x00
 #define ADP_PCIE_CS_0_PE			BIT(31)
 
+/* USB adapter registers */
+#define ADP_USB3_CS_0				0x00
+#define ADP_USB3_CS_0_V				BIT(30)
+#define ADP_USB3_CS_0_PE			BIT(31)
+
 /* Hop register from TB_CFG_HOPS. 8 byte per entry. */
 struct tb_regs_hop {
 	/* DWORD 0 */
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index e8e387c4211f..299b77665d83 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -19,6 +19,12 @@
 #define TB_PCI_PATH_DOWN		0
 #define TB_PCI_PATH_UP			1
 
+/* USB adapters use always HopID of 8 for both directions */
+#define TB_USB_HOPID			8
+
+#define TB_USB_PATH_DOWN		0
+#define TB_USB_PATH_UP			1
+
 /* DP adapters use HopID 8 for AUX and 9 for Video */
 #define TB_DP_AUX_TX_HOPID		8
 #define TB_DP_AUX_RX_HOPID		8
@@ -31,7 +37,7 @@
 #define TB_DMA_PATH_OUT			0
 #define TB_DMA_PATH_IN			1
 
-static const char * const tb_tunnel_names[] = { "PCI", "DP", "DMA" };
+static const char * const tb_tunnel_names[] = { "PCI", "DP", "DMA", "USB"};
 
 #define __TB_TUNNEL_PRINT(level, tunnel, fmt, arg...)                   \
 	do {                                                            \
@@ -838,6 +844,156 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 	return tunnel;
 }
 
+static int tb_usb_activate(struct tb_tunnel *tunnel, bool activate)
+{
+	int res;
+
+	res = tb_usb_port_enable(tunnel->src_port, activate);
+	if (res)
+		return res;
+
+	if (tb_port_is_usb_up(tunnel->dst_port))
+		return tb_usb_port_enable(tunnel->dst_port, activate);
+
+	return 0;
+}
+
+static void tb_usb_init_path(struct tb_path *path)
+{
+	path->egress_fc_enable = TB_PATH_SOURCE | TB_PATH_INTERNAL;
+	path->egress_shared_buffer = TB_PATH_NONE;
+	path->ingress_fc_enable = TB_PATH_ALL;
+	path->ingress_shared_buffer = TB_PATH_NONE;
+	path->priority = 3;
+	path->weight = 3;
+	path->drop_packages = 0;
+	path->nfc_credits = 0;
+	path->hops[0].initial_credits = 7;
+	path->hops[1].initial_credits =
+		tb_initial_credits(path->hops[1].in_port->sw);
+}
+
+/**
+ * tb_tunnel_discover_usb() - Discover existing USB tunnels
+ * @tb: Pointer to the domain structure
+ * @down: USB downstream adapter
+ *
+ * If @down adapter is active, follows the tunnel to the USB upstream
+ * adapter and back. Returns the discovered tunnel or %NULL if there was
+ * no tunnel.
+ */
+struct tb_tunnel *tb_tunnel_discover_usb(struct tb *tb, struct tb_port *down)
+{
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	if (!tb_usb_port_is_enabled(down))
+		return NULL;
+
+	tunnel = tb_tunnel_alloc(tb, 2, TB_TUNNEL_USB);
+	if (!tunnel)
+		return NULL;
+
+	tunnel->activate = tb_usb_activate;
+	tunnel->src_port = down;
+
+	/*
+	 * Discover both paths even if they are not complete. We will
+	 * clean them up by calling tb_tunnel_deactivate() below in that
+	 * case.
+	 */
+	path = tb_path_discover(down, TB_USB_HOPID, NULL, -1,
+				&tunnel->dst_port, "USB Up");
+	if (!path) {
+		/* Just disable the downstream port */
+		tb_usb_port_enable(down, false);
+		goto err_free;
+	}
+	tunnel->paths[TB_USB_PATH_UP] = path;
+	tb_usb_init_path(tunnel->paths[TB_USB_PATH_UP]);
+
+	path = tb_path_discover(tunnel->dst_port, -1, down, TB_USB_HOPID, NULL,
+				"USB Down");
+	if (!path)
+		goto err_deactivate;
+	tunnel->paths[TB_USB_PATH_DOWN] = path;
+	tb_usb_init_path(tunnel->paths[TB_USB_PATH_DOWN]);
+
+	/* Validate that the tunnel is complete */
+	if (!tb_port_is_usb_up(tunnel->dst_port)) {
+		tb_port_warn(tunnel->dst_port,
+			     "path does not end on an USB adapter, cleaning up\n");
+		goto err_deactivate;
+	}
+
+	if (down != tunnel->src_port) {
+		tb_tunnel_warn(tunnel, "path is not complete, cleaning up\n");
+		goto err_deactivate;
+	}
+
+	if (!tb_usb_port_is_enabled(tunnel->dst_port)) {
+		tb_tunnel_warn(tunnel,
+			       "tunnel is not fully activated, cleaning up\n");
+		goto err_deactivate;
+	}
+
+	tb_tunnel_dbg(tunnel, "discovered\n");
+	return tunnel;
+
+err_deactivate:
+	tb_tunnel_deactivate(tunnel);
+err_free:
+	tb_tunnel_free(tunnel);
+
+	return NULL;
+}
+
+/**
+ * tb_tunnel_alloc_usb() - allocate a USB tunnel
+ * @tb: Pointer to the domain structure
+ * @up: USB upstream adapter port
+ * @down: USB downstream adapter port
+ *
+ * Allocate an USB tunnel. The ports must be of type @TB_TYPE_USB_UP and
+ * @TB_TYPE_USB_DOWN.
+ *
+ * Return: Returns a tb_tunnel on success or %NULL on failure.
+ */
+struct tb_tunnel *tb_tunnel_alloc_usb(struct tb *tb, struct tb_port *up,
+				      struct tb_port *down)
+{
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	tunnel = tb_tunnel_alloc(tb, 2, TB_TUNNEL_USB);
+	if (!tunnel)
+		return NULL;
+
+	tunnel->activate = tb_usb_activate;
+	tunnel->src_port = down;
+	tunnel->dst_port = up;
+
+	path = tb_path_alloc(tb, down, TB_USB_HOPID, up, TB_USB_HOPID, 0,
+			     "USB Down");
+	if (!path) {
+		tb_tunnel_free(tunnel);
+		return NULL;
+	}
+	tb_usb_init_path(path);
+	tunnel->paths[TB_USB_PATH_DOWN] = path;
+
+	path = tb_path_alloc(tb, up, TB_USB_HOPID, down, TB_USB_HOPID, 0,
+			     "USB Up");
+	if (!path) {
+		tb_tunnel_free(tunnel);
+		return NULL;
+	}
+	tb_usb_init_path(path);
+	tunnel->paths[TB_USB_PATH_UP] = path;
+
+	return tunnel;
+}
+
 /**
  * tb_tunnel_free() - free a tunnel
  * @tunnel: Tunnel to be freed
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index ba888da005f5..83c6723fe8d8 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -15,6 +15,7 @@ enum tb_tunnel_type {
 	TB_TUNNEL_PCI,
 	TB_TUNNEL_DP,
 	TB_TUNNEL_DMA,
+	TB_TUNNEL_USB,
 };
 
 /**
@@ -57,6 +58,9 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 				      struct tb_port *dst, int transmit_ring,
 				      int transmit_path, int receive_ring,
 				      int receive_path);
+struct tb_tunnel *tb_tunnel_discover_usb(struct tb *tb, struct tb_port *down);
+struct tb_tunnel *tb_tunnel_alloc_usb(struct tb *tb, struct tb_port *up,
+				      struct tb_port *down);
 
 void tb_tunnel_free(struct tb_tunnel *tunnel);
 int tb_tunnel_activate(struct tb_tunnel *tunnel);
@@ -82,5 +86,10 @@ static inline bool tb_tunnel_is_dma(const struct tb_tunnel *tunnel)
 	return tunnel->type == TB_TUNNEL_DMA;
 }
 
+static inline bool tb_tunnel_is_usb(const struct tb_tunnel *tunnel)
+{
+	return tunnel->type == TB_TUNNEL_USB;
+}
+
 #endif
 
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 4b0997292b43..24f60f7523b8 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -226,10 +226,19 @@ int usb4_switch_setup(struct tb_switch *sw)
 
 	parent = tb_switch_parent(sw);
 
+	if (tb_switch_find_port(parent, TB_TYPE_USB_DOWN)) {
+		val |= ROUTER_CS_5_UTO;
+		xhci = false;
+	}
+
 	/* Only enable PCIe tunneling if the parent router supports it */
 	if (tb_switch_find_port(parent, TB_TYPE_PCIE_DOWN)) {
 		val |= ROUTER_CS_5_PTO;
-		/* xHCI can be enabled if PCIe tunneling is supported */
+		/*
+		 * xHCI can be enabled if PCIe tunneling is supported
+		 * and the parent does not have any USB dowstream
+		 * adapters (so we cannot do USB tunneling).
+		 */
 		if (xhci & ROUTER_CS_6_HCI)
 			val |= ROUTER_CS_5_HCO;
 	}
@@ -701,6 +710,36 @@ struct tb_port *usb4_switch_map_pcie_down(struct tb_switch *sw,
 	return NULL;
 }
 
+/**
+ * usb4_switch_map_usb_down() - Map USB4 port to a USB downstream adapter
+ * @sw: USB4 router
+ * @port: USB4 port
+ *
+ * USB4 routers have direct mapping between USB4 ports and USB 3.x
+ * downstream adapters where the USB 3.x topology is extended. This
+ * function returns the corresponding downstream USB 3.x adapter or
+ * %NULL if no such mapping was possible.
+ */
+struct tb_port *usb4_switch_map_usb_down(struct tb_switch *sw,
+					 const struct tb_port *port)
+{
+	int usb4_idx = usb4_port_idx(sw, port);
+	int i, usb_idx = 0;
+
+	/* Find USB down port matching usb4_port */
+	tb_switch_for_each_port(sw, i) {
+		if (tb_port_is_usb_down(&sw->ports[i])) {
+			if (usb_idx == usb4_idx &&
+			    !tb_usb_port_is_enabled(&sw->ports[i])) {
+				return &sw->ports[i];
+			}
+			usb_idx++;
+		}
+	}
+
+	return NULL;
+}
+
 /**
  * usb4_port_unlock() - Unlock USB4 downstream port
  * @port: USB4 port to unlock
-- 
2.23.0

