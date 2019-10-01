Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 951E3C32B6
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 13:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732600AbfJALjj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 07:39:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:23131 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732606AbfJALik (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 07:38:40 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 04:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="195619888"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 01 Oct 2019 04:38:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6DE92570; Tue,  1 Oct 2019 14:38:31 +0300 (EEST)
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
Subject: [RFC PATCH 13/22] thunderbolt: Add Display Port adapter pairing and resource management
Date:   Tue,  1 Oct 2019 14:38:21 +0300
Message-Id: <20191001113830.13028-14-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To perform proper Display Port tunneling for Thunderbolt 3 devices we
need to allocate DP resources for DP IN port before they can be used.
The reason for this is that the user can also connect a monitor directly
to the Type-C ports in which case the Thunderbolt controller acts as
re-driver for Display Port (no tunneling takes place) taking the DP
sinks away from the connection manager. This allocation is done using
special sink allocation registers available through the link controller.

We can pair DP IN to DP OUT only if

 * DP IN has sink allocated via link controller
 * DP OUT port receives hotplug event

For DP IN adapters (only for the root switch) we first query whether
there is DP resource available (it may be the previous instance of the
driver for example already allocated it) and if it is we add it to the
list. We then update the list when after each plug/unplug event to a DP
IN/OUT adapter. Each time the list is updated we try to find additional
DP IN <-> DP OUT pairs for tunnel establishment. This strategy also
makes it possible to establish another tunnel in case there are 3
monitors connected and one gets unplugged releasing the DP IN adapter
for the new tunnel.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/lc.c      | 161 +++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c  |  44 ++++++++
 drivers/thunderbolt/tb.c      | 203 ++++++++++++++++++++++++++++------
 drivers/thunderbolt/tb.h      |   9 ++
 drivers/thunderbolt/tb_regs.h |   6 +
 5 files changed, 389 insertions(+), 34 deletions(-)

diff --git a/drivers/thunderbolt/lc.c b/drivers/thunderbolt/lc.c
index df56523eb822..13a5e39b0043 100644
--- a/drivers/thunderbolt/lc.c
+++ b/drivers/thunderbolt/lc.c
@@ -205,3 +205,164 @@ bool tb_lc_lane_bonding_possible(struct tb_switch *sw)
 
 	return !!(val & TB_LC_PORT_ATTR_BE);
 }
+
+static int tb_lc_dp_sink_from_port(const struct tb_switch *sw,
+				   struct tb_port *in)
+{
+	int i;
+
+	/* The first DP IN port is sink 0 and second is sink 1 */
+	tb_switch_for_each_port(sw, i) {
+		if (tb_port_is_dpin(&sw->ports[i]))
+			return in != &sw->ports[i];
+	}
+
+	return -EINVAL;
+}
+
+static int tb_lc_dp_sink_available(struct tb_switch *sw, int sink)
+{
+	u32 val, alloc;
+	int ret;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
+			 sw->cap_lc + TB_LC_SNK_ALLOCATION, 1);
+	if (ret)
+		return ret;
+
+	/*
+	 * Sink is available for CM/SW to use if the allocation valie is
+	 * either 0 or 1.
+	 */
+	if (!sink) {
+		alloc = val & TB_LC_SNK_ALLOCATION_SNK0_MASK;
+		if (!alloc || alloc == TB_LC_SNK_ALLOCATION_SNK0_CM)
+			return 0;
+	} else {
+		alloc = (val & TB_LC_SNK_ALLOCATION_SNK1_MASK) >>
+			TB_LC_SNK_ALLOCATION_SNK1_SHIFT;
+		if (!alloc || alloc == TB_LC_SNK_ALLOCATION_SNK1_CM)
+			return 0;
+	}
+
+	return -EBUSY;
+}
+
+/**
+ * tb_lc_dp_sink_query() - Is DP sink available for DP IN port
+ * @sw: Switch whose DP sink is queried
+ * @in: DP IN port to check
+ *
+ * Queries through LC SNK_ALLOCATION registers whether DP sink is available
+ * for the given DP IN port or not.
+ */
+bool tb_lc_dp_sink_query(struct tb_switch *sw, struct tb_port *in)
+{
+	int sink;
+
+	/*
+	 * For older generations sink is always available as there is no
+	 * allocation mechanism.
+	 */
+	if (sw->generation < 3)
+		return true;
+
+	sink = tb_lc_dp_sink_from_port(sw, in);
+	if (sink < 0)
+		return false;
+
+	return !tb_lc_dp_sink_available(sw, sink);
+}
+
+/**
+ * tb_lc_dp_sink_alloc() - Allocate DP sink
+ * @sw: Switch whose DP sink is allocated
+ * @in: DP IN port the DP sink is allocated for
+ *
+ * Allocate DP sink for @in via LC SNK_ALLOCATION registers. If the
+ * resource is available and allocation is successful returns %0. In all
+ * other cases returs negative errno. In particular %-EBUSY is returned if
+ * the resource was not available.
+ */
+int tb_lc_dp_sink_alloc(struct tb_switch *sw, struct tb_port *in)
+{
+	int ret, sink;
+	u32 val;
+
+	if (sw->generation < 3)
+		return 0;
+
+	sink = tb_lc_dp_sink_from_port(sw, in);
+	if (sink < 0)
+		return sink;
+
+	ret = tb_lc_dp_sink_available(sw, sink);
+	if (ret)
+		return ret;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
+			 sw->cap_lc + TB_LC_SNK_ALLOCATION, 1);
+	if (ret)
+		return ret;
+
+	if (!sink) {
+		val &= ~TB_LC_SNK_ALLOCATION_SNK0_MASK;
+		val |= TB_LC_SNK_ALLOCATION_SNK0_CM;
+	} else {
+		val &= ~TB_LC_SNK_ALLOCATION_SNK1_MASK;
+		val |= TB_LC_SNK_ALLOCATION_SNK1_CM <<
+			TB_LC_SNK_ALLOCATION_SNK1_SHIFT;
+	}
+
+	ret = tb_sw_write(sw, &val, TB_CFG_SWITCH,
+			  sw->cap_lc + TB_LC_SNK_ALLOCATION, 1);
+
+	if (ret)
+		return ret;
+
+	tb_port_dbg(in, "sink %d allocated\n", sink);
+	return 0;
+}
+
+/**
+ * tb_lc_dp_sink_dealloc() - De-allocate DP sink
+ * @sw: Switch whose DP sink is de-allocated
+ * @in: DP IN port whose DP sink is de-allocated
+ *
+ * De-allocate DP sink from @in using LC SNK_ALLOCATION registers.
+ */
+int tb_lc_dp_sink_dealloc(struct tb_switch *sw, struct tb_port *in)
+{
+	int ret, sink;
+	u32 val;
+
+	if (sw->generation < 3)
+		return 0;
+
+	sink = tb_lc_dp_sink_from_port(sw, in);
+	if (sink < 0)
+		return sink;
+
+	/* Needs to be owned by CM/SW */
+	ret = tb_lc_dp_sink_available(sw, sink);
+	if (ret)
+		return ret;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
+			 sw->cap_lc + TB_LC_SNK_ALLOCATION, 1);
+	if (ret)
+		return ret;
+
+	if (!sink)
+		val &= ~TB_LC_SNK_ALLOCATION_SNK0_MASK;
+	else
+		val &= ~TB_LC_SNK_ALLOCATION_SNK1_MASK;
+
+	ret = tb_sw_write(sw, &val, TB_CFG_SWITCH,
+			  sw->cap_lc + TB_LC_SNK_ALLOCATION, 1);
+	if (ret)
+		return ret;
+
+	tb_port_dbg(in, "sink %d de-allocated\n", sink);
+	return 0;
+}
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 604cb3ef4985..87c74c916a7c 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -645,6 +645,7 @@ static int tb_init_port(struct tb_port *port)
 		ida_init(&port->out_hopids);
 	}
 
+	INIT_LIST_HEAD(&port->list);
 	return 0;
 
 }
@@ -2292,6 +2293,49 @@ void tb_switch_suspend(struct tb_switch *sw)
 	tb_lc_set_sleep(sw);
 }
 
+/**
+ * tb_switch_query_dp_resource() - Query availability of DP resource
+ * @sw: Switch whose DP resource is queried
+ * @in: DP IN port
+ *
+ * Queries availability of DP resource for DP tunneling using switch
+ * specific means. Returns %true if resource is available.
+ */
+bool tb_switch_query_dp_resource(struct tb_switch *sw, struct tb_port *in)
+{
+	return tb_lc_dp_sink_query(sw, in);
+}
+
+/**
+ * tb_switch_alloc_dp_resource() - Allocate available DP resource
+ * @sw: Switch whose DP resource is allocated
+ * @in: DP IN port
+ *
+ * Allocates DP resource for DP tunneling. The resource must be
+ * available for this to succeed (see tb_switch_query_dp_resource()).
+ * Returns %0 in success and negative errno otherwise.
+ */
+int tb_switch_alloc_dp_resource(struct tb_switch *sw, struct tb_port *in)
+{
+	return tb_lc_dp_sink_alloc(sw, in);
+}
+
+/**
+ * tb_switch_dealloc_dp_resource() - De-allocate DP resource
+ * @sw: Switch whose DP resource is de-allocated
+ * @in: DP IN port
+ *
+ * De-allocates DP resource that was previously allocated for DP
+ * tunneling.
+ */
+void tb_switch_dealloc_dp_resource(struct tb_switch *sw, struct tb_port *in)
+{
+	if (tb_lc_dp_sink_dealloc(sw, in)) {
+		tb_sw_warn(sw, "failed to de-allocate DP resource for port %d\n",
+			   in->port);
+	}
+}
+
 struct tb_sw_lookup {
 	struct tb *tb;
 	u8 link;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 704455a4f763..5b457874e51a 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -18,6 +18,7 @@
 /**
  * struct tb_cm - Simple Thunderbolt connection manager
  * @tunnel_list: List of active tunnels
+ * @dp_resources: List of available DP resources for DP tunneling
  * @hotplug_active: tb_handle_hotplug will stop progressing plug
  *		    events and exit if this is not set (it needs to
  *		    acquire the lock one more time). Used to drain wq
@@ -25,6 +26,7 @@
  */
 struct tb_cm {
 	struct list_head tunnel_list;
+	struct list_head dp_resources;
 	bool hotplug_active;
 };
 
@@ -56,6 +58,44 @@ static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
 
 /* enumeration & hot plug handling */
 
+static void tb_add_dp_resources(struct tb_switch *sw)
+{
+	struct tb_cm *tcm = tb_priv(sw->tb);
+	struct tb_port *port;
+	int i;
+
+	tb_switch_for_each_port(sw, i) {
+		port = &sw->ports[i];
+
+		if (!tb_port_is_dpin(port))
+			continue;
+
+		if (!tb_switch_query_dp_resource(sw, port))
+			continue;
+
+		list_add_tail(&port->list, &tcm->dp_resources);
+		tb_port_dbg(port, "DP IN resource available\n");
+	}
+}
+
+static void tb_remove_dp_resources(struct tb_switch *sw)
+{
+	struct tb_cm *tcm = tb_priv(sw->tb);
+	struct tb_port *port, *tmp;
+	int i;
+
+	/* Clear children resources first */
+	tb_switch_for_each_remote_port(sw, i)
+		tb_remove_dp_resources(sw->ports[i].remote->sw);
+
+	list_for_each_entry_safe(port, tmp, &tcm->dp_resources, list) {
+		if (port->sw == sw) {
+			tb_port_dbg(port, "DP OUT resource unavailable\n");
+			list_del_init(&port->list);
+		}
+	}
+}
+
 static void tb_discover_tunnels(struct tb_switch *sw)
 {
 	struct tb *tb = sw->tb;
@@ -226,8 +266,9 @@ static void tb_scan_port(struct tb_port *port)
 	tb_scan_switch(sw);
 }
 
-static int tb_free_tunnel(struct tb *tb, enum tb_tunnel_type type,
-			  struct tb_port *src_port, struct tb_port *dst_port)
+static struct tb_tunnel *tb_find_tunnel(struct tb *tb, enum tb_tunnel_type type,
+					struct tb_port *src_port,
+					struct tb_port *dst_port)
 {
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel;
@@ -236,14 +277,32 @@ static int tb_free_tunnel(struct tb *tb, enum tb_tunnel_type type,
 		if (tunnel->type == type &&
 		    ((src_port && src_port == tunnel->src_port) ||
 		     (dst_port && dst_port == tunnel->dst_port))) {
-			tb_tunnel_deactivate(tunnel);
-			list_del(&tunnel->list);
-			tb_tunnel_free(tunnel);
-			return 0;
+			return tunnel;
 		}
 	}
 
-	return -ENODEV;
+	return NULL;
+}
+
+static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
+{
+	if (!tunnel)
+		return;
+
+	tb_tunnel_deactivate(tunnel);
+	list_del(&tunnel->list);
+
+	/*
+	 * In case of DP tunnel make sure the DP IN resource is deallocated
+	 * properly.
+	 */
+	if (tb_tunnel_is_dp(tunnel)) {
+		struct tb_port *in = tunnel->src_port;
+
+		tb_switch_dealloc_dp_resource(in->sw, in);
+	}
+
+	tb_tunnel_free(tunnel);
 }
 
 /**
@@ -256,11 +315,8 @@ static void tb_free_invalid_tunnels(struct tb *tb)
 	struct tb_tunnel *n;
 
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
-		if (tb_tunnel_is_invalid(tunnel)) {
-			tb_tunnel_deactivate(tunnel);
-			list_del(&tunnel->list);
-			tb_tunnel_free(tunnel);
-		}
+		if (tb_tunnel_is_invalid(tunnel))
+			tb_deactivate_and_free_tunnel(tunnel);
 	}
 }
 
@@ -275,6 +331,7 @@ static void tb_free_unplugged_children(struct tb_switch *sw)
 		struct tb_port *port = &sw->ports[i];
 
 		if (port->remote->sw->is_unplugged) {
+			tb_remove_dp_resources(port->remote->sw);
 			tb_switch_lane_bonding_disable(port->remote->sw);
 			tb_switch_remove(port->remote->sw);
 			port->remote = NULL;
@@ -368,42 +425,112 @@ static struct tb_port *tb_find_pcie_down(struct tb_switch *sw,
 	return tb_find_unused_port(sw, TB_TYPE_PCIE_DOWN);
 }
 
-static int tb_tunnel_dp(struct tb *tb, struct tb_port *out)
+static void tb_tunnel_dp(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
-	struct tb_switch *sw = out->sw;
+	struct tb_port *port, *in, *out;
 	struct tb_tunnel *tunnel;
-	struct tb_port *in;
 
-	if (tb_port_is_enabled(out))
-		return 0;
+	/*
+	 * Find pair of inactive DP IN and DP OUT adapters and then
+	 * establish a DP tunnel between them.
+	 */
+	tb_dbg(tb, "looking for DP IN <-> DP OUT pairs:\n");
+
+	in = NULL;
+	out = NULL;
+	list_for_each_entry(port, &tcm->dp_resources, list) {
+		if (tb_port_is_enabled(port)) {
+			tb_port_dbg(port, "in use\n");
+			continue;
+		}
+
+		tb_port_dbg(port, "available\n");
+
+		if (!in && tb_port_is_dpin(port))
+			in = port;
+		else if (!out && tb_port_is_dpout(port))
+			out = port;
+	}
+
+	if (!in) {
+		tb_dbg(tb, "no suitable DP IN adapter available, not tunneling\n");
+		return;
+	}
+	if (!out) {
+		tb_dbg(tb, "no suitable DP OUT adapter available, not tunneling\n");
+		return;
+	}
 
-	do {
-		sw = tb_to_switch(sw->dev.parent);
-		if (!sw)
-			return 0;
-		in = tb_find_unused_port(sw, TB_TYPE_DP_HDMI_IN);
-	} while (!in);
+	if (tb_switch_alloc_dp_resource(in->sw, in)) {
+		tb_port_dbg(in, "no resource available for DP IN, not tunneling\n");
+		return;
+	}
 
 	tunnel = tb_tunnel_alloc_dp(tb, in, out);
 	if (!tunnel) {
-		tb_port_dbg(out, "DP tunnel allocation failed\n");
-		return -ENOMEM;
+		tb_port_dbg(out, "could not allocate DP tunnel\n");
+		goto dealloc_dp;
 	}
 
 	if (tb_tunnel_activate(tunnel)) {
 		tb_port_info(out, "DP tunnel activation failed, aborting\n");
 		tb_tunnel_free(tunnel);
-		return -EIO;
+		goto dealloc_dp;
 	}
 
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
-	return 0;
+	return;
+
+dealloc_dp:
+	tb_switch_dealloc_dp_resource(in->sw, in);
 }
 
-static void tb_teardown_dp(struct tb *tb, struct tb_port *out)
+static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
 {
-	tb_free_tunnel(tb, TB_TUNNEL_DP, NULL, out);
+	struct tb_port *in, *out;
+	struct tb_tunnel *tunnel;
+
+	if (tb_port_is_dpin(port)) {
+		tb_port_dbg(port, "DP IN resource unavailable\n");
+		in = port;
+		out = NULL;
+	} else {
+		tb_port_dbg(port, "DP OUT resource unavailable\n");
+		in = NULL;
+		out = port;
+	}
+
+	tunnel = tb_find_tunnel(tb, TB_TUNNEL_DP, in, out);
+	tb_deactivate_and_free_tunnel(tunnel);
+	list_del_init(&port->list);
+
+	/*
+	 * See if there is another DP OUT port that can be used for
+	 * to create another tunnel.
+	 */
+	tb_tunnel_dp(tb);
+}
+
+static void tb_dp_resource_available(struct tb *tb, struct tb_port *port)
+{
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_port *p;
+
+	if (tb_port_is_enabled(port))
+		return;
+
+	list_for_each_entry(p, &tcm->dp_resources, list) {
+		if (p == port)
+			return;
+	}
+
+	tb_port_dbg(port, "DP %s resource available\n",
+		    tb_port_is_dpin(port) ? "IN" : "OUT");
+	list_add_tail(&port->list, &tcm->dp_resources);
+
+	/* Look for suitable DP IN <-> DP OUT pairs now */
+	tb_tunnel_dp(tb);
 }
 
 static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
@@ -478,6 +605,7 @@ static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
 static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
 {
 	struct tb_port *dst_port;
+	struct tb_tunnel *tunnel;
 	struct tb_switch *sw;
 
 	sw = tb_to_switch(xd->dev.parent);
@@ -488,7 +616,8 @@ static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
 	 * case of cable disconnect) so it is fine if we cannot find it
 	 * here anymore.
 	 */
-	tb_free_tunnel(tb, TB_TUNNEL_DMA, NULL, dst_port);
+	tunnel = tb_find_tunnel(tb, TB_TUNNEL_DMA, NULL, dst_port);
+	tb_deactivate_and_free_tunnel(tunnel);
 }
 
 static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
@@ -543,11 +672,14 @@ static void tb_handle_hotplug(struct work_struct *work)
 			tb_port_dbg(port, "switch unplugged\n");
 			tb_sw_set_unplugged(port->remote->sw);
 			tb_free_invalid_tunnels(tb);
+			tb_remove_dp_resources(port->remote->sw);
 			tb_switch_lane_bonding_disable(port->remote->sw);
 			tb_switch_remove(port->remote->sw);
 			port->remote = NULL;
 			if (port->dual_link_port)
 				port->dual_link_port->remote = NULL;
+			/* Maybe we can create another DP tunnel */
+			tb_tunnel_dp(tb);
 		} else if (port->xdomain) {
 			struct tb_xdomain *xd = tb_xdomain_get(port->xdomain);
 
@@ -564,8 +696,8 @@ static void tb_handle_hotplug(struct work_struct *work)
 			port->xdomain = NULL;
 			__tb_disconnect_xdomain_paths(tb, xd);
 			tb_xdomain_put(xd);
-		} else if (tb_port_is_dpout(port)) {
-			tb_teardown_dp(tb, port);
+		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
+			tb_dp_resource_unavailable(tb, port);
 		} else {
 			tb_port_dbg(port,
 				   "got unplug event for disconnected port, ignoring\n");
@@ -578,8 +710,8 @@ static void tb_handle_hotplug(struct work_struct *work)
 			tb_scan_port(port);
 			if (!port->remote)
 				tb_port_dbg(port, "hotplug: no switch found\n");
-		} else if (tb_port_is_dpout(port)) {
-			tb_tunnel_dp(tb, port);
+		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
+			tb_dp_resource_available(tb, port);
 		}
 	}
 
@@ -692,6 +824,8 @@ static int tb_start(struct tb *tb)
 	tb_scan_switch(tb->root_switch);
 	/* Find out tunnels created by the boot firmware */
 	tb_discover_tunnels(tb->root_switch);
+	/* Add DP IN resources for the root switch */
+	tb_add_dp_resources(tb->root_switch);
 	/* Make the discovered switches available to the userspace */
 	device_for_each_child(&tb->root_switch->dev, NULL,
 			      tb_scan_finalize_switch);
@@ -821,6 +955,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 
 	tcm = tb_priv(tb);
 	INIT_LIST_HEAD(&tcm->tunnel_list);
+	INIT_LIST_HEAD(&tcm->dp_resources);
 
 	return tb;
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index dbab06551eaa..48f3725249a9 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -137,6 +137,7 @@ struct tb_switch {
  * @link_nr: Is this primary or secondary port on the dual_link.
  * @in_hopids: Currently allocated input HopIDs
  * @out_hopids: Currently allocated output HopIDs
+ * @list: Used to link ports to DP resources list
  */
 struct tb_port {
 	struct tb_regs_port_header config;
@@ -152,6 +153,7 @@ struct tb_port {
 	u8 link_nr:1;
 	struct ida in_hopids;
 	struct ida out_hopids;
+	struct list_head list;
 };
 
 /**
@@ -674,6 +676,10 @@ static inline bool tb_switch_is_icm(const struct tb_switch *sw)
 int tb_switch_lane_bonding_enable(struct tb_switch *sw);
 void tb_switch_lane_bonding_disable(struct tb_switch *sw);
 
+bool tb_switch_query_dp_resource(struct tb_switch *sw, struct tb_port *in);
+int tb_switch_alloc_dp_resource(struct tb_switch *sw, struct tb_port *in);
+void tb_switch_dealloc_dp_resource(struct tb_switch *sw, struct tb_port *in);
+
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
 int tb_port_set_initial_credits(struct tb_port *port, u32 credits);
@@ -718,6 +724,9 @@ int tb_lc_configure_link(struct tb_switch *sw);
 void tb_lc_unconfigure_link(struct tb_switch *sw);
 int tb_lc_set_sleep(struct tb_switch *sw);
 bool tb_lc_lane_bonding_possible(struct tb_switch *sw);
+bool tb_lc_dp_sink_query(struct tb_switch *sw, struct tb_port *in);
+int tb_lc_dp_sink_alloc(struct tb_switch *sw, struct tb_port *in);
+int tb_lc_dp_sink_dealloc(struct tb_switch *sw, struct tb_port *in);
 
 static inline int tb_route_length(u64 route)
 {
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 8d11b4a2d552..aec35e61cc14 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -295,6 +295,12 @@ struct tb_regs_hop {
 #define TB_LC_DESC_PORT_SIZE_SHIFT	16
 #define TB_LC_DESC_PORT_SIZE_MASK	GENMASK(27, 16)
 #define TB_LC_FUSE			0x03
+#define TB_LC_SNK_ALLOCATION		0x10
+#define TB_LC_SNK_ALLOCATION_SNK0_MASK	GENMASK(3, 0)
+#define TB_LC_SNK_ALLOCATION_SNK0_CM	0x1
+#define TB_LC_SNK_ALLOCATION_SNK1_SHIFT	4
+#define TB_LC_SNK_ALLOCATION_SNK1_MASK	GENMASK(7, 4)
+#define TB_LC_SNK_ALLOCATION_SNK1_CM	0x1
 
 /* Link controller registers */
 #define TB_LC_PORT_ATTR			0x8d
-- 
2.23.0

