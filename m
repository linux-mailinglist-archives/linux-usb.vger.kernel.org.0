Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829DF65EA0B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 12:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbjAELf7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 06:35:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbjAELff (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 06:35:35 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553BD4FD67
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 03:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672918532; x=1704454532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dgc/F/1i7LCl/7FM0uHGqbSgnLhwWhFDY633OdehQnU=;
  b=O0MotQR3EVMEoq7lbSvD6u4CAsUYXIzXpnLA771maDrEhThsFQwsVUWd
   505XRvqBLBMsbdd6KfZOB7Fti+cHoGEgLIIGZht6bHjRERLu/Ti49TlMd
   WsNOXdJFhS8gRI2+baHcAvjhI9FVdT+FvSwW+wF2YKMLxFLfpeH7wOwOJ
   0oXpjQNeSkSCY78iKjo372YxBprhFBW0fWJVyPUvQca0HaernjE8FL6g6
   fb8wp7j7Vg/lWQo6i+03LtGIDo7F2LAixFO/D/92gRjdlVUEIZcAY2VSO
   JN9YJP4xgAiZvreT4m3M1F6q7ENSk5YX+GxgAqtzpJKvSJMbCPaiBsL/S
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319888884"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="319888884"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 03:35:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829527674"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="829527674"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2023 03:35:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D9A723BC; Thu,  5 Jan 2023 13:35:59 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 8/8] thunderbolt: Add support for DisplayPort bandwidth allocation mode
Date:   Thu,  5 Jan 2023 13:35:59 +0200
Message-Id: <20230105113559.68531-9-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
References: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB4 spec defines an optional feature that allows the connection
manager to negotiate with the graphics through DPCD registers changes in
the bandwidth allocation dynamically. This is referred as "bandwidth
allocation mode" in the spec. The connection manager uses DP IN adapters
registers to communicate with the graphics, and also gets notifications
from these adapters when the graphics wants to change the bandwidth
allocation. Both the connection manager and the graphics driver needs to
support this.

We check if the DP IN adapter supports this and if it does enable it
before establishing a DP tunnel. Then we react on DP_BW notifications
coming from the DP IN adapter and update the bandwidth allocation
accordingly (within the maximum common capabilities the DP IN/OUT
support).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c     |  50 +++-
 drivers/thunderbolt/ctl.h     |   2 +
 drivers/thunderbolt/tb.c      | 493 +++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/tb.h      |  22 ++
 drivers/thunderbolt/tb_msgs.h |  11 +-
 drivers/thunderbolt/tunnel.c  | 483 ++++++++++++++++++++++++++++++---
 drivers/thunderbolt/tunnel.h  |  18 ++
 7 files changed, 1023 insertions(+), 56 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 25f7868257de..6e7d28e8d81a 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -230,7 +230,6 @@ static int check_config_address(struct tb_cfg_address addr,
 static struct tb_cfg_result decode_error(const struct ctl_pkg *response)
 {
 	struct cfg_error_pkg *pkg = response->buffer;
-	struct tb_ctl *ctl = response->ctl;
 	struct tb_cfg_result res = { 0 };
 	res.response_route = tb_cfg_get_route(&pkg->header);
 	res.response_port = 0;
@@ -239,13 +238,6 @@ static struct tb_cfg_result decode_error(const struct ctl_pkg *response)
 	if (res.err)
 		return res;
 
-	if (pkg->zero1)
-		tb_ctl_warn(ctl, "pkg->zero1 is %#x\n", pkg->zero1);
-	if (pkg->zero2)
-		tb_ctl_warn(ctl, "pkg->zero2 is %#x\n", pkg->zero2);
-	if (pkg->zero3)
-		tb_ctl_warn(ctl, "pkg->zero3 is %#x\n", pkg->zero3);
-
 	res.err = 1;
 	res.tb_error = pkg->error;
 	res.response_port = pkg->port;
@@ -416,6 +408,7 @@ static int tb_async_error(const struct ctl_pkg *pkg)
 	case TB_CFG_ERROR_LINK_ERROR:
 	case TB_CFG_ERROR_HEC_ERROR_DETECTED:
 	case TB_CFG_ERROR_FLOW_CONTROL_ERROR:
+	case TB_CFG_ERROR_DP_BW:
 		return true;
 
 	default:
@@ -735,6 +728,47 @@ void tb_ctl_stop(struct tb_ctl *ctl)
 
 /* public interface, commands */
 
+/**
+ * tb_cfg_ack_notification() - Ack notification
+ * @ctl: Control channel to use
+ * @route: Router that originated the event
+ * @error: Pointer to the notification package
+ *
+ * Call this as response for non-plug notification to ack it. Returns
+ * %0 on success or an error code on failure.
+ */
+int tb_cfg_ack_notification(struct tb_ctl *ctl, u64 route,
+			    const struct cfg_error_pkg *error)
+{
+	struct cfg_ack_pkg pkg = {
+		.header = tb_cfg_make_header(route),
+	};
+	const char *name;
+
+	switch (error->error) {
+	case TB_CFG_ERROR_LINK_ERROR:
+		name = "link error";
+		break;
+	case TB_CFG_ERROR_HEC_ERROR_DETECTED:
+		name = "HEC error";
+		break;
+	case TB_CFG_ERROR_FLOW_CONTROL_ERROR:
+		name = "flow control error";
+		break;
+	case TB_CFG_ERROR_DP_BW:
+		name = "DP_BW";
+		break;
+	default:
+		name = "unknown";
+		break;
+	}
+
+	tb_ctl_dbg(ctl, "acking %s (%#x) notification on %llx\n", name,
+		   error->error, route);
+
+	return tb_ctl_tx(ctl, &pkg, sizeof(pkg), TB_CFG_PKG_NOTIFY_ACK);
+}
+
 /**
  * tb_cfg_ack_plug() - Ack hot plug/unplug event
  * @ctl: Control channel to use
diff --git a/drivers/thunderbolt/ctl.h b/drivers/thunderbolt/ctl.h
index 7c7d80f96c0c..eec5c953c743 100644
--- a/drivers/thunderbolt/ctl.h
+++ b/drivers/thunderbolt/ctl.h
@@ -122,6 +122,8 @@ static inline struct tb_cfg_header tb_cfg_make_header(u64 route)
 	return header;
 }
 
+int tb_cfg_ack_notification(struct tb_ctl *ctl, u64 route,
+			    const struct cfg_error_pkg *error);
 int tb_cfg_ack_plug(struct tb_ctl *ctl, u64 route, u32 port, bool unplug);
 struct tb_cfg_result tb_cfg_reset(struct tb_ctl *ctl, u64 route);
 struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index cebbb3660c68..0b891d749a96 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -16,7 +16,8 @@
 #include "tb_regs.h"
 #include "tunnel.h"
 
-#define TB_TIMEOUT	100 /* ms */
+#define TB_TIMEOUT	100	/* ms */
+#define MAX_GROUPS	7	/* max Group_ID is 7 */
 
 /**
  * struct tb_cm - Simple Thunderbolt connection manager
@@ -28,12 +29,14 @@
  *		    after cfg has been paused.
  * @remove_work: Work used to remove any unplugged routers after
  *		 runtime resume
+ * @groups: Bandwidth groups used in this domain.
  */
 struct tb_cm {
 	struct list_head tunnel_list;
 	struct list_head dp_resources;
 	bool hotplug_active;
 	struct delayed_work remove_work;
+	struct tb_bandwidth_group groups[MAX_GROUPS];
 };
 
 static inline struct tb *tcm_to_tb(struct tb_cm *tcm)
@@ -49,6 +52,112 @@ struct tb_hotplug_event {
 	bool unplug;
 };
 
+static void tb_init_bandwidth_groups(struct tb_cm *tcm)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
+		struct tb_bandwidth_group *group = &tcm->groups[i];
+
+		group->tb = tcm_to_tb(tcm);
+		group->index = i + 1;
+		INIT_LIST_HEAD(&group->ports);
+	}
+}
+
+static void tb_bandwidth_group_attach_port(struct tb_bandwidth_group *group,
+					   struct tb_port *in)
+{
+	if (!group || WARN_ON(in->group))
+		return;
+
+	in->group = group;
+	list_add_tail(&in->group_list, &group->ports);
+
+	tb_port_dbg(in, "attached to bandwidth group %d\n", group->index);
+}
+
+static struct tb_bandwidth_group *tb_find_free_bandwidth_group(struct tb_cm *tcm)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
+		struct tb_bandwidth_group *group = &tcm->groups[i];
+
+		if (list_empty(&group->ports))
+			return group;
+	}
+
+	return NULL;
+}
+
+static struct tb_bandwidth_group *
+tb_attach_bandwidth_group(struct tb_cm *tcm, struct tb_port *in,
+			  struct tb_port *out)
+{
+	struct tb_bandwidth_group *group;
+	struct tb_tunnel *tunnel;
+
+	/*
+	 * Find all DP tunnels that go through all the same USB4 links
+	 * as this one. Because we always setup tunnels the same way we
+	 * can just check for the routers at both ends of the tunnels
+	 * and if they are the same we have a match.
+	 */
+	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
+		if (!tb_tunnel_is_dp(tunnel))
+			continue;
+
+		if (tunnel->src_port->sw == in->sw &&
+		    tunnel->dst_port->sw == out->sw) {
+			group = tunnel->src_port->group;
+			if (group) {
+				tb_bandwidth_group_attach_port(group, in);
+				return group;
+			}
+		}
+	}
+
+	/* Pick up next available group then */
+	group = tb_find_free_bandwidth_group(tcm);
+	if (group)
+		tb_bandwidth_group_attach_port(group, in);
+	else
+		tb_port_warn(in, "no available bandwidth groups\n");
+
+	return group;
+}
+
+static void tb_discover_bandwidth_group(struct tb_cm *tcm, struct tb_port *in,
+					struct tb_port *out)
+{
+	if (usb4_dp_port_bw_mode_enabled(in)) {
+		int index, i;
+
+		index = usb4_dp_port_group_id(in);
+		for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
+			if (tcm->groups[i].index == index) {
+				tb_bandwidth_group_attach_port(&tcm->groups[i], in);
+				return;
+			}
+		}
+	}
+
+	tb_attach_bandwidth_group(tcm, in, out);
+}
+
+static void tb_detach_bandwidth_group(struct tb_port *in)
+{
+	struct tb_bandwidth_group *group = in->group;
+
+	if (group) {
+		in->group = NULL;
+		list_del_init(&in->group_list);
+
+		tb_port_dbg(in, "detached from bandwidth group %d\n", group->index);
+	}
+}
+
 static void tb_handle_hotplug(struct work_struct *work);
 
 static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
@@ -193,9 +302,14 @@ static void tb_discover_tunnels(struct tb *tb)
 				parent = tb_switch_parent(parent);
 			}
 		} else if (tb_tunnel_is_dp(tunnel)) {
+			struct tb_port *in = tunnel->src_port;
+			struct tb_port *out = tunnel->dst_port;
+
 			/* Keep the domain from powering down */
-			pm_runtime_get_sync(&tunnel->src_port->sw->dev);
-			pm_runtime_get_sync(&tunnel->dst_port->sw->dev);
+			pm_runtime_get_sync(&in->sw->dev);
+			pm_runtime_get_sync(&out->sw->dev);
+
+			tb_discover_bandwidth_group(tcm, in, out);
 		}
 	}
 }
@@ -355,7 +469,8 @@ static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
 	       dst_port->port);
 
 	tunnel = tb_find_first_usb3_tunnel(tb, src_port, dst_port);
-	if (tunnel) {
+	if (tunnel && tunnel->src_port != src_port &&
+	    tunnel->dst_port != dst_port) {
 		ret = tb_tunnel_consumed_bandwidth(tunnel, &usb3_consumed_up,
 						   &usb3_consumed_down);
 		if (ret)
@@ -399,12 +514,24 @@ static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
 		list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
 			int dp_consumed_up, dp_consumed_down;
 
+			if (tb_tunnel_is_invalid(tunnel))
+				continue;
+
 			if (!tb_tunnel_is_dp(tunnel))
 				continue;
 
 			if (!tb_tunnel_port_on_path(tunnel, port))
 				continue;
 
+			/*
+			 * Ignore the DP tunnel between src_port and
+			 * dst_port because it is the same tunnel and we
+			 * may be re-calculating estimated bandwidth.
+			 */
+			if (tunnel->src_port == src_port &&
+			    tunnel->dst_port == dst_port)
+				continue;
+
 			ret = tb_tunnel_consumed_bandwidth(tunnel,
 							   &dp_consumed_up,
 							   &dp_consumed_down);
@@ -765,6 +892,7 @@ static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
 
 	switch (tunnel->type) {
 	case TB_TUNNEL_DP:
+		tb_detach_bandwidth_group(src_port);
 		/*
 		 * In case of DP tunnel make sure the DP IN resource is
 		 * deallocated properly.
@@ -882,6 +1010,99 @@ static struct tb_port *tb_find_pcie_down(struct tb_switch *sw,
 	return tb_find_unused_port(sw, TB_TYPE_PCIE_DOWN);
 }
 
+static void
+tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
+{
+	struct tb_tunnel *first_tunnel;
+	struct tb *tb = group->tb;
+	struct tb_port *in;
+	int ret;
+
+	tb_dbg(tb, "re-calculating bandwidth estimation for group %u\n",
+	       group->index);
+
+	first_tunnel = NULL;
+	list_for_each_entry(in, &group->ports, group_list) {
+		int estimated_bw, estimated_up, estimated_down;
+		struct tb_tunnel *tunnel;
+		struct tb_port *out;
+
+		if (!usb4_dp_port_bw_mode_enabled(in))
+			continue;
+
+		tunnel = tb_find_tunnel(tb, TB_TUNNEL_DP, in, NULL);
+		if (WARN_ON(!tunnel))
+			break;
+
+		if (!first_tunnel) {
+			/*
+			 * Since USB3 bandwidth is shared by all DP
+			 * tunnels under the host router USB4 port, even
+			 * if they do not begin from the host router, we
+			 * can release USB3 bandwidth just once and not
+			 * for each tunnel separately.
+			 */
+			first_tunnel = tunnel;
+			ret = tb_release_unused_usb3_bandwidth(tb,
+				first_tunnel->src_port, first_tunnel->dst_port);
+			if (ret) {
+				tb_port_warn(in,
+					"failed to release unused bandwidth\n");
+				break;
+			}
+		}
+
+		out = tunnel->dst_port;
+		ret = tb_available_bandwidth(tb, in, out, &estimated_up,
+					     &estimated_down);
+		if (ret) {
+			tb_port_warn(in,
+				"failed to re-calculate estimated bandwidth\n");
+			break;
+		}
+
+		/*
+		 * Estimated bandwidth includes:
+		 *  - already allocated bandwidth for the DP tunnel
+		 *  - available bandwidth along the path
+		 *  - bandwidth allocated for USB 3.x but not used.
+		 */
+		tb_port_dbg(in, "re-calculated estimated bandwidth %u/%u Mb/s\n",
+			    estimated_up, estimated_down);
+
+		if (in->sw->config.depth < out->sw->config.depth)
+			estimated_bw = estimated_down;
+		else
+			estimated_bw = estimated_up;
+
+		if (usb4_dp_port_set_estimated_bw(in, estimated_bw))
+			tb_port_warn(in, "failed to update estimated bandwidth\n");
+	}
+
+	if (first_tunnel)
+		tb_reclaim_usb3_bandwidth(tb, first_tunnel->src_port,
+					  first_tunnel->dst_port);
+
+	tb_dbg(tb, "bandwidth estimation for group %u done\n", group->index);
+}
+
+static void tb_recalc_estimated_bandwidth(struct tb *tb)
+{
+	struct tb_cm *tcm = tb_priv(tb);
+	int i;
+
+	tb_dbg(tb, "bandwidth consumption changed, re-calculating estimated bandwidth\n");
+
+	for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
+		struct tb_bandwidth_group *group = &tcm->groups[i];
+
+		if (!list_empty(&group->ports))
+			tb_recalc_estimated_bandwidth_for_group(group);
+	}
+
+	tb_dbg(tb, "bandwidth re-calculation done\n");
+}
+
 static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 {
 	struct tb_port *host_port, *port;
@@ -996,17 +1217,19 @@ static void tb_tunnel_dp(struct tb *tb)
 		goto err_rpm_put;
 	}
 
+	if (!tb_attach_bandwidth_group(tcm, in, out))
+		goto err_dealloc_dp;
+
 	/* Make all unused USB3 bandwidth available for the new DP tunnel */
 	ret = tb_release_unused_usb3_bandwidth(tb, in, out);
 	if (ret) {
 		tb_warn(tb, "failed to release unused bandwidth\n");
-		goto err_dealloc_dp;
+		goto err_detach_group;
 	}
 
-	ret = tb_available_bandwidth(tb, in, out, &available_up,
-				     &available_down);
+	ret = tb_available_bandwidth(tb, in, out, &available_up, &available_down);
 	if (ret)
-		goto err_reclaim;
+		goto err_reclaim_usb;
 
 	tb_dbg(tb, "available bandwidth for new DP tunnel %u/%u Mb/s\n",
 	       available_up, available_down);
@@ -1015,7 +1238,7 @@ static void tb_tunnel_dp(struct tb *tb)
 				    available_down);
 	if (!tunnel) {
 		tb_port_dbg(out, "could not allocate DP tunnel\n");
-		goto err_reclaim;
+		goto err_reclaim_usb;
 	}
 
 	if (tb_tunnel_activate(tunnel)) {
@@ -1025,6 +1248,10 @@ static void tb_tunnel_dp(struct tb *tb)
 
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
 	tb_reclaim_usb3_bandwidth(tb, in, out);
+
+	/* Update the domain with the new bandwidth estimation */
+	tb_recalc_estimated_bandwidth(tb);
+
 	/*
 	 * In case of DP tunnel exists, change host router's 1st children
 	 * TMU mode to HiFi for CL0s to work.
@@ -1035,8 +1262,10 @@ static void tb_tunnel_dp(struct tb *tb)
 
 err_free:
 	tb_tunnel_free(tunnel);
-err_reclaim:
+err_reclaim_usb:
 	tb_reclaim_usb3_bandwidth(tb, in, out);
+err_detach_group:
+	tb_detach_bandwidth_group(in);
 err_dealloc_dp:
 	tb_switch_dealloc_dp_resource(in->sw, in);
 err_rpm_put:
@@ -1069,6 +1298,7 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
 	 * See if there is another DP OUT port that can be used for
 	 * to create another tunnel.
 	 */
+	tb_recalc_estimated_bandwidth(tb);
 	tb_tunnel_dp(tb);
 }
 
@@ -1316,6 +1546,7 @@ static void tb_handle_hotplug(struct work_struct *work)
 			if (port->dual_link_port)
 				port->dual_link_port->remote = NULL;
 			/* Maybe we can create another DP tunnel */
+			tb_recalc_estimated_bandwidth(tb);
 			tb_tunnel_dp(tb);
 		} else if (port->xdomain) {
 			struct tb_xdomain *xd = tb_xdomain_get(port->xdomain);
@@ -1373,6 +1604,235 @@ static void tb_handle_hotplug(struct work_struct *work)
 	kfree(ev);
 }
 
+static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
+				 int *requested_down)
+{
+	int allocated_up, allocated_down, available_up, available_down, ret;
+	int requested_up_corrected, requested_down_corrected, granularity;
+	int max_up, max_down, max_up_rounded, max_down_rounded;
+	struct tb *tb = tunnel->tb;
+	struct tb_port *in, *out;
+
+	ret = tb_tunnel_allocated_bandwidth(tunnel, &allocated_up, &allocated_down);
+	if (ret)
+		return ret;
+
+	in = tunnel->src_port;
+	out = tunnel->dst_port;
+
+	tb_port_dbg(in, "bandwidth allocated currently %d/%d Mb/s\n",
+		    allocated_up, allocated_down);
+
+	/*
+	 * If we get rounded up request from graphics side, say HBR2 x 4
+	 * that is 17500 instead of 17280 (this is because of the
+	 * granularity), we allow it too. Here the graphics has already
+	 * negotiated with the DPRX the maximum possible rates (which is
+	 * 17280 in this case).
+	 *
+	 * Since the link cannot go higher than 17280 we use that in our
+	 * calculations but the DP IN adapter Allocated BW write must be
+	 * the same value (17500) otherwise the adapter will mark it as
+	 * failed for graphics.
+	 */
+	ret = tb_tunnel_maximum_bandwidth(tunnel, &max_up, &max_down);
+	if (ret)
+		return ret;
+
+	ret = usb4_dp_port_granularity(in);
+	if (ret < 0)
+		return ret;
+	granularity = ret;
+
+	max_up_rounded = roundup(max_up, granularity);
+	max_down_rounded = roundup(max_down, granularity);
+
+	/*
+	 * This will "fix" the request down to the maximum supported
+	 * rate * lanes if it is at the maximum rounded up level.
+	 */
+	requested_up_corrected = *requested_up;
+	if (requested_up_corrected == max_up_rounded)
+		requested_up_corrected = max_up;
+	else if (requested_up_corrected < 0)
+		requested_up_corrected = 0;
+	requested_down_corrected = *requested_down;
+	if (requested_down_corrected == max_down_rounded)
+		requested_down_corrected = max_down;
+	else if (requested_down_corrected < 0)
+		requested_down_corrected = 0;
+
+	tb_port_dbg(in, "corrected bandwidth request %d/%d Mb/s\n",
+		    requested_up_corrected, requested_down_corrected);
+
+	if ((*requested_up >= 0 && requested_up_corrected > max_up_rounded) ||
+	    (*requested_down >= 0 && requested_down_corrected > max_down_rounded)) {
+		tb_port_dbg(in, "bandwidth request too high (%d/%d Mb/s > %d/%d Mb/s)\n",
+			    requested_up_corrected, requested_down_corrected,
+			    max_up_rounded, max_down_rounded);
+		return -ENOBUFS;
+	}
+
+	if ((*requested_up >= 0 && requested_up_corrected <= allocated_up) ||
+	    (*requested_down >= 0 && requested_down_corrected <= allocated_down)) {
+		/*
+		 * If requested bandwidth is less or equal than what is
+		 * currently allocated to that tunnel we simply change
+		 * the reservation of the tunnel. Since all the tunnels
+		 * going out from the same USB4 port are in the same
+		 * group the released bandwidth will be taken into
+		 * account for the other tunnels automatically below.
+		 */
+		return tb_tunnel_alloc_bandwidth(tunnel, requested_up,
+						 requested_down);
+	}
+
+	/*
+	 * More bandwidth is requested. Release all the potential
+	 * bandwidth from USB3 first.
+	 */
+	ret = tb_release_unused_usb3_bandwidth(tb, in, out);
+	if (ret)
+		return ret;
+
+	/*
+	 * Then go over all tunnels that cross the same USB4 ports (they
+	 * are also in the same group but we use the same function here
+	 * that we use with the normal bandwidth allocation).
+	 */
+	ret = tb_available_bandwidth(tb, in, out, &available_up, &available_down);
+	if (ret)
+		goto reclaim;
+
+	tb_port_dbg(in, "bandwidth available for allocation %d/%d Mb/s\n",
+		    available_up, available_down);
+
+	if ((*requested_up >= 0 && available_up >= requested_up_corrected) ||
+	    (*requested_down >= 0 && available_down >= requested_down_corrected)) {
+		ret = tb_tunnel_alloc_bandwidth(tunnel, requested_up,
+						requested_down);
+	} else {
+		ret = -ENOBUFS;
+	}
+
+reclaim:
+	tb_reclaim_usb3_bandwidth(tb, in, out);
+	return ret;
+}
+
+static void tb_handle_dp_bandwidth_request(struct work_struct *work)
+{
+	struct tb_hotplug_event *ev = container_of(work, typeof(*ev), work);
+	int requested_bw, requested_up, requested_down, ret;
+	struct tb_port *in, *out;
+	struct tb_tunnel *tunnel;
+	struct tb *tb = ev->tb;
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_switch *sw;
+
+	pm_runtime_get_sync(&tb->dev);
+
+	mutex_lock(&tb->lock);
+	if (!tcm->hotplug_active)
+		goto unlock;
+
+	sw = tb_switch_find_by_route(tb, ev->route);
+	if (!sw) {
+		tb_warn(tb, "bandwidth request from non-existent router %llx\n",
+			ev->route);
+		goto unlock;
+	}
+
+	in = &sw->ports[ev->port];
+	if (!tb_port_is_dpin(in)) {
+		tb_port_warn(in, "bandwidth request to non-DP IN adapter\n");
+		goto unlock;
+	}
+
+	tb_port_dbg(in, "handling bandwidth allocation request\n");
+
+	if (!usb4_dp_port_bw_mode_enabled(in)) {
+		tb_port_warn(in, "bandwidth allocation mode not enabled\n");
+		goto unlock;
+	}
+
+	requested_bw = usb4_dp_port_requested_bw(in);
+	if (requested_bw < 0) {
+		tb_port_dbg(in, "no bandwidth request active\n");
+		goto unlock;
+	}
+
+	tb_port_dbg(in, "requested bandwidth %d Mb/s\n", requested_bw);
+
+	tunnel = tb_find_tunnel(tb, TB_TUNNEL_DP, in, NULL);
+	if (!tunnel) {
+		tb_port_warn(in, "failed to find tunnel\n");
+		goto unlock;
+	}
+
+	out = tunnel->dst_port;
+
+	if (in->sw->config.depth < out->sw->config.depth) {
+		requested_up = -1;
+		requested_down = requested_bw;
+	} else {
+		requested_up = requested_bw;
+		requested_down = -1;
+	}
+
+	ret = tb_alloc_dp_bandwidth(tunnel, &requested_up, &requested_down);
+	if (ret) {
+		if (ret == -ENOBUFS)
+			tb_port_warn(in, "not enough bandwidth available\n");
+		else
+			tb_port_warn(in, "failed to change bandwidth allocation\n");
+	} else {
+		tb_port_dbg(in, "bandwidth allocation changed to %d/%d Mb/s\n",
+			    requested_up, requested_down);
+
+		/* Update other clients about the allocation change */
+		tb_recalc_estimated_bandwidth(tb);
+	}
+
+unlock:
+	mutex_unlock(&tb->lock);
+
+	pm_runtime_mark_last_busy(&tb->dev);
+	pm_runtime_put_autosuspend(&tb->dev);
+}
+
+static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port)
+{
+	struct tb_hotplug_event *ev;
+
+	ev = kmalloc(sizeof(*ev), GFP_KERNEL);
+	if (!ev)
+		return;
+
+	ev->tb = tb;
+	ev->route = route;
+	ev->port = port;
+	INIT_WORK(&ev->work, tb_handle_dp_bandwidth_request);
+	queue_work(tb->wq, &ev->work);
+}
+
+static void tb_handle_notification(struct tb *tb, u64 route,
+				   const struct cfg_error_pkg *error)
+{
+	if (tb_cfg_ack_notification(tb->ctl, route, error))
+		tb_warn(tb, "could not ack notification on %llx\n", route);
+
+	switch (error->error) {
+	case TB_CFG_ERROR_DP_BW:
+		tb_queue_dp_bandwidth_request(tb, route, error->port);
+		break;
+
+	default:
+		/* Ack is enough */
+		return;
+	}
+}
+
 /*
  * tb_schedule_hotplug_handler() - callback function for the control channel
  *
@@ -1382,15 +1842,19 @@ static void tb_handle_event(struct tb *tb, enum tb_cfg_pkg_type type,
 			    const void *buf, size_t size)
 {
 	const struct cfg_event_pkg *pkg = buf;
-	u64 route;
+	u64 route = tb_cfg_get_route(&pkg->header);
 
-	if (type != TB_CFG_PKG_EVENT) {
+	switch (type) {
+	case TB_CFG_PKG_ERROR:
+		tb_handle_notification(tb, route, (const struct cfg_error_pkg *)buf);
+		return;
+	case TB_CFG_PKG_EVENT:
+		break;
+	default:
 		tb_warn(tb, "unexpected event %#x, ignoring\n", type);
 		return;
 	}
 
-	route = tb_cfg_get_route(&pkg->header);
-
 	if (tb_cfg_ack_plug(tb->ctl, route, pkg->port, pkg->unplug)) {
 		tb_warn(tb, "could not ack plug event on %llx:%x\n", route,
 			pkg->port);
@@ -1820,6 +2284,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 	INIT_LIST_HEAD(&tcm->tunnel_list);
 	INIT_LIST_HEAD(&tcm->dp_resources);
 	INIT_DELAYED_WORK(&tcm->remove_work, tb_remove_work);
+	tb_init_bandwidth_groups(tcm);
 
 	tb_dbg(tb, "using software connection manager\n");
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index cd6c9eeaf049..2953cf38c29e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -223,6 +223,23 @@ struct tb_switch {
 	enum tb_clx clx;
 };
 
+/**
+ * struct tb_bandwidth_group - Bandwidth management group
+ * @tb: Pointer to the domain the group belongs to
+ * @index: Index of the group (aka Group_ID). Valid values %1-%7
+ * @ports: DP IN adapters belonging to this group are linked here
+ *
+ * Any tunnel that requires isochronous bandwidth (that's DP for now) is
+ * attached to a bandwidth group. All tunnels going through the same
+ * USB4 links share the same group and can dynamically distribute the
+ * bandwidth within the group.
+ */
+struct tb_bandwidth_group {
+	struct tb *tb;
+	int index;
+	struct list_head ports;
+};
+
 /**
  * struct tb_port - a thunderbolt port, part of a tb_switch
  * @config: Cached port configuration read from registers
@@ -247,6 +264,9 @@ struct tb_switch {
  * @ctl_credits: Buffers reserved for control path
  * @dma_credits: Number of credits allocated for DMA tunneling for all
  *		 DMA paths through this port.
+ * @group: Bandwidth allocation group the adapter is assigned to. Only
+ *	   used for DP IN adapters for now.
+ * @group_list: The adapter is linked to the group's list of ports through this
  *
  * In USB4 terminology this structure represents an adapter (protocol or
  * lane adapter).
@@ -272,6 +292,8 @@ struct tb_port {
 	unsigned int total_credits;
 	unsigned int ctl_credits;
 	unsigned int dma_credits;
+	struct tb_bandwidth_group *group;
+	struct list_head group_list;
 };
 
 /**
diff --git a/drivers/thunderbolt/tb_msgs.h b/drivers/thunderbolt/tb_msgs.h
index 33c4c7aed56d..3234bff07899 100644
--- a/drivers/thunderbolt/tb_msgs.h
+++ b/drivers/thunderbolt/tb_msgs.h
@@ -29,6 +29,7 @@ enum tb_cfg_error {
 	TB_CFG_ERROR_HEC_ERROR_DETECTED = 12,
 	TB_CFG_ERROR_FLOW_CONTROL_ERROR = 13,
 	TB_CFG_ERROR_LOCK = 15,
+	TB_CFG_ERROR_DP_BW = 32,
 };
 
 /* common header */
@@ -64,14 +65,16 @@ struct cfg_write_pkg {
 /* TB_CFG_PKG_ERROR */
 struct cfg_error_pkg {
 	struct tb_cfg_header header;
-	enum tb_cfg_error error:4;
-	u32 zero1:4;
+	enum tb_cfg_error error:8;
 	u32 port:6;
-	u32 zero2:2; /* Both should be zero, still they are different fields. */
-	u32 zero3:14;
+	u32 reserved:16;
 	u32 pg:2;
 } __packed;
 
+struct cfg_ack_pkg {
+	struct tb_cfg_header header;
+};
+
 #define TB_CFG_ERROR_PG_HOT_PLUG	0x2
 #define TB_CFG_ERROR_PG_HOT_UNPLUG	0x3
 
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index e5a5a20e391f..c406675a8966 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/list.h>
+#include <linux/ktime.h>
 
 #include "tunnel.h"
 #include "tb.h"
@@ -44,6 +45,11 @@
 /* Minimum number of credits for DMA path */
 #define TB_MIN_DMA_CREDITS		1U
 
+static bool bw_alloc_mode = true;
+module_param(bw_alloc_mode, bool, 0444);
+MODULE_PARM_DESC(bw_alloc_mode,
+		 "enable bandwidth allocation mode if supported (default: true)");
+
 static const char * const tb_tunnel_names[] = { "PCI", "DP", "DMA", "USB3" };
 
 #define __TB_TUNNEL_PRINT(level, tunnel, fmt, arg...)                   \
@@ -598,6 +604,133 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 			     in->cap_adap + DP_REMOTE_CAP, 1);
 }
 
+static int tb_dp_bw_alloc_mode_enable(struct tb_tunnel *tunnel)
+{
+	int ret, estimated_bw, granularity, tmp;
+	struct tb_port *out = tunnel->dst_port;
+	struct tb_port *in = tunnel->src_port;
+	u32 out_dp_cap, out_rate, out_lanes;
+	u32 in_dp_cap, in_rate, in_lanes;
+	u32 rate, lanes;
+
+	if (!bw_alloc_mode)
+		return 0;
+
+	ret = usb4_dp_port_set_cm_bw_mode_supported(in, true);
+	if (ret)
+		return ret;
+
+	ret = usb4_dp_port_set_group_id(in, in->group->index);
+	if (ret)
+		return ret;
+
+	/*
+	 * Get the non-reduced rate and lanes based on the lowest
+	 * capability of both adapters.
+	 */
+	ret = tb_port_read(in, &in_dp_cap, TB_CFG_PORT,
+			   in->cap_adap + DP_LOCAL_CAP, 1);
+	if (ret)
+		return ret;
+
+	ret = tb_port_read(out, &out_dp_cap, TB_CFG_PORT,
+			   out->cap_adap + DP_LOCAL_CAP, 1);
+	if (ret)
+		return ret;
+
+	in_rate = tb_dp_cap_get_rate(in_dp_cap);
+	in_lanes = tb_dp_cap_get_lanes(in_dp_cap);
+	out_rate = tb_dp_cap_get_rate(out_dp_cap);
+	out_lanes = tb_dp_cap_get_lanes(out_dp_cap);
+
+	rate = min(in_rate, out_rate);
+	lanes = min(in_lanes, out_lanes);
+	tmp = tb_dp_bandwidth(rate, lanes);
+
+	tb_port_dbg(in, "non-reduced bandwidth %u Mb/s x%u = %u Mb/s\n", rate,
+		    lanes, tmp);
+
+	ret = usb4_dp_port_set_nrd(in, rate, lanes);
+	if (ret)
+		return ret;
+
+	for (granularity = 250; tmp / granularity > 255 && granularity <= 1000;
+	     granularity *= 2)
+		;
+
+	tb_port_dbg(in, "granularity %d Mb/s\n", granularity);
+
+	/*
+	 * Returns -EINVAL if granularity above is outside of the
+	 * accepted ranges.
+	 */
+	ret = usb4_dp_port_set_granularity(in, granularity);
+	if (ret)
+		return ret;
+
+	/*
+	 * Bandwidth estimation is pretty much what we have in
+	 * max_up/down fields. For discovery we just read what the
+	 * estimation was set to.
+	 */
+	if (in->sw->config.depth < out->sw->config.depth)
+		estimated_bw = tunnel->max_down;
+	else
+		estimated_bw = tunnel->max_up;
+
+	tb_port_dbg(in, "estimated bandwidth %d Mb/s\n", estimated_bw);
+
+	ret = usb4_dp_port_set_estimated_bw(in, estimated_bw);
+	if (ret)
+		return ret;
+
+	/* Initial allocation should be 0 according the spec */
+	ret = usb4_dp_port_allocate_bw(in, 0);
+	if (ret)
+		return ret;
+
+	tb_port_dbg(in, "bandwidth allocation mode enabled\n");
+	return 0;
+}
+
+static int tb_dp_init(struct tb_tunnel *tunnel)
+{
+	struct tb_port *in = tunnel->src_port;
+	struct tb_switch *sw = in->sw;
+	struct tb *tb = in->sw->tb;
+	int ret;
+
+	ret = tb_dp_xchg_caps(tunnel);
+	if (ret)
+		return ret;
+
+	if (!tb_switch_is_usb4(sw))
+		return 0;
+
+	if (!usb4_dp_port_bw_mode_supported(in))
+		return 0;
+
+	tb_port_dbg(in, "bandwidth allocation mode supported\n");
+
+	ret = usb4_dp_port_set_cm_id(in, tb->index);
+	if (ret)
+		return ret;
+
+	return tb_dp_bw_alloc_mode_enable(tunnel);
+}
+
+static void tb_dp_deinit(struct tb_tunnel *tunnel)
+{
+	struct tb_port *in = tunnel->src_port;
+
+	if (!usb4_dp_port_bw_mode_supported(in))
+		return;
+	if (usb4_dp_port_bw_mode_enabled(in)) {
+		usb4_dp_port_set_cm_bw_mode_supported(in, false);
+		tb_port_dbg(in, "bandwidth allocation mode disabled\n");
+	}
+}
+
 static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
 {
 	int ret;
@@ -635,49 +768,275 @@ static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
 	return 0;
 }
 
+/* max_bw is rounded up to next granularity */
+static int tb_dp_nrd_bandwidth(struct tb_tunnel *tunnel, int *max_bw)
+{
+	struct tb_port *in = tunnel->src_port;
+	int ret, rate, lanes, nrd_bw;
+
+	ret = usb4_dp_port_nrd(in, &rate, &lanes);
+	if (ret)
+		return ret;
+
+	nrd_bw = tb_dp_bandwidth(rate, lanes);
+
+	if (max_bw) {
+		ret = usb4_dp_port_granularity(in);
+		if (ret < 0)
+			return ret;
+		*max_bw = roundup(nrd_bw, ret);
+	}
+
+	return nrd_bw;
+}
+
+static int tb_dp_bw_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
+					    int *consumed_up, int *consumed_down)
+{
+	struct tb_port *out = tunnel->dst_port;
+	struct tb_port *in = tunnel->src_port;
+	int ret, allocated_bw, max_bw;
+
+	if (!usb4_dp_port_bw_mode_enabled(in))
+		return -EOPNOTSUPP;
+
+	if (!tunnel->bw_mode)
+		return -EOPNOTSUPP;
+
+	/* Read what was allocated previously if any */
+	ret = usb4_dp_port_allocated_bw(in);
+	if (ret < 0)
+		return ret;
+	allocated_bw = ret;
+
+	ret = tb_dp_nrd_bandwidth(tunnel, &max_bw);
+	if (ret < 0)
+		return ret;
+	if (allocated_bw == max_bw)
+		allocated_bw = ret;
+
+	tb_port_dbg(in, "consumed bandwidth through allocation mode %d Mb/s\n",
+		    allocated_bw);
+
+	if (in->sw->config.depth < out->sw->config.depth) {
+		*consumed_up = 0;
+		*consumed_down = allocated_bw;
+	} else {
+		*consumed_up = allocated_bw;
+		*consumed_down = 0;
+	}
+
+	return 0;
+}
+
+static int tb_dp_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up,
+				     int *allocated_down)
+{
+	struct tb_port *out = tunnel->dst_port;
+	struct tb_port *in = tunnel->src_port;
+
+	/*
+	 * If we have already set the allocated bandwidth then use that.
+	 * Otherwise we read it from the DPRX.
+	 */
+	if (usb4_dp_port_bw_mode_enabled(in) && tunnel->bw_mode) {
+		int ret, allocated_bw, max_bw;
+
+		ret = usb4_dp_port_allocated_bw(in);
+		if (ret < 0)
+			return ret;
+		allocated_bw = ret;
+
+		ret = tb_dp_nrd_bandwidth(tunnel, &max_bw);
+		if (ret < 0)
+			return ret;
+		if (allocated_bw == max_bw)
+			allocated_bw = ret;
+
+		if (in->sw->config.depth < out->sw->config.depth) {
+			*allocated_up = 0;
+			*allocated_down = allocated_bw;
+		} else {
+			*allocated_up = allocated_bw;
+			*allocated_down = 0;
+		}
+		return 0;
+	}
+
+	return tunnel->consumed_bandwidth(tunnel, allocated_up,
+					  allocated_down);
+}
+
+static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
+				 int *alloc_down)
+{
+	struct tb_port *out = tunnel->dst_port;
+	struct tb_port *in = tunnel->src_port;
+	int max_bw, ret, tmp;
+
+	if (!usb4_dp_port_bw_mode_enabled(in))
+		return -EOPNOTSUPP;
+
+	ret = tb_dp_nrd_bandwidth(tunnel, &max_bw);
+	if (ret < 0)
+		return ret;
+
+	if (in->sw->config.depth < out->sw->config.depth) {
+		tmp = min(*alloc_down, max_bw);
+		ret = usb4_dp_port_allocate_bw(in, tmp);
+		if (ret)
+			return ret;
+		*alloc_down = tmp;
+		*alloc_up = 0;
+	} else {
+		tmp = min(*alloc_up, max_bw);
+		ret = usb4_dp_port_allocate_bw(in, tmp);
+		if (ret)
+			return ret;
+		*alloc_down = 0;
+		*alloc_up = tmp;
+	}
+
+	/* Now we can use BW mode registers to figure out the bandwidth */
+	/* TODO: need to handle discovery too */
+	tunnel->bw_mode = true;
+	return 0;
+}
+
+static int tb_dp_read_dprx(struct tb_tunnel *tunnel, u32 *rate, u32 *lanes,
+			   int timeout_msec)
+{
+	ktime_t timeout = ktime_add_ms(ktime_get(), timeout_msec);
+	struct tb_port *in = tunnel->src_port;
+
+	/*
+	 * Wait for DPRX done. Normally it should be already set for
+	 * active tunnel.
+	 */
+	do {
+		u32 val;
+		int ret;
+
+		ret = tb_port_read(in, &val, TB_CFG_PORT,
+				   in->cap_adap + DP_COMMON_CAP, 1);
+		if (ret)
+			return ret;
+
+		if (val & DP_COMMON_CAP_DPRX_DONE) {
+			*rate = tb_dp_cap_get_rate(val);
+			*lanes = tb_dp_cap_get_lanes(val);
+
+			tb_port_dbg(in, "consumed bandwidth through DPRX %d Mb/s\n",
+				    tb_dp_bandwidth(*rate, *lanes));
+			return 0;
+		}
+		usleep_range(100, 150);
+	} while (ktime_before(ktime_get(), timeout));
+
+	return -ETIMEDOUT;
+}
+
+/* Read cap from tunnel DP IN */
+static int tb_dp_read_cap(struct tb_tunnel *tunnel, unsigned int cap, u32 *rate,
+			  u32 *lanes)
+{
+	struct tb_port *in = tunnel->src_port;
+	u32 val;
+	int ret;
+
+	switch (cap) {
+	case DP_LOCAL_CAP:
+	case DP_REMOTE_CAP:
+		break;
+
+	default:
+		tb_tunnel_WARN(tunnel, "invalid capability index %#x\n", cap);
+		return -EINVAL;
+	}
+
+	/*
+	 * Read from the copied remote cap so that we take into account
+	 * if capabilities were reduced during exchange.
+	 */
+	ret = tb_port_read(in, &val, TB_CFG_PORT, in->cap_adap + cap, 1);
+	if (ret)
+		return ret;
+
+	*rate = tb_dp_cap_get_rate(val);
+	*lanes = tb_dp_cap_get_lanes(val);
+
+	tb_port_dbg(in, "bandwidth from %#x capability %d Mb/s\n", cap,
+		    tb_dp_bandwidth(*rate, *lanes));
+	return 0;
+}
+
+static int tb_dp_maximum_bandwidth(struct tb_tunnel *tunnel, int *max_up,
+				   int *max_down)
+{
+	struct tb_port *in = tunnel->src_port;
+	u32 rate, lanes;
+	int ret;
+
+	/*
+	 * DP IN adapter DP_LOCAL_CAP gets updated to the lowest AUX read
+	 * parameter values so this so we can use this to determine the
+	 * maximum possible bandwidth over this link.
+	 */
+	ret = tb_dp_read_cap(tunnel, DP_LOCAL_CAP, &rate, &lanes);
+	if (ret)
+		return ret;
+
+	if (in->sw->config.depth < tunnel->dst_port->sw->config.depth) {
+		*max_up = 0;
+		*max_down = tb_dp_bandwidth(rate, lanes);
+	} else {
+		*max_up = tb_dp_bandwidth(rate, lanes);
+		*max_down = 0;
+	}
+
+	return 0;
+}
+
 static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 				    int *consumed_down)
 {
 	struct tb_port *in = tunnel->src_port;
 	const struct tb_switch *sw = in->sw;
-	u32 val, rate = 0, lanes = 0;
+	u32 rate = 0, lanes = 0;
 	int ret;
 
 	if (tb_dp_is_usb4(sw)) {
-		int timeout = 20;
-
 		/*
-		 * Wait for DPRX done. Normally it should be already set
-		 * for active tunnel.
+		 * On USB4 routers check if the bandwidth allocation
+		 * mode is enabled first and then read the bandwidth
+		 * through those registers.
 		 */
-		do {
-			ret = tb_port_read(in, &val, TB_CFG_PORT,
-					   in->cap_adap + DP_COMMON_CAP, 1);
-			if (ret)
+		ret = tb_dp_bw_mode_consumed_bandwidth(tunnel, consumed_up,
+						       consumed_down);
+		if (ret < 0) {
+			if (ret != -EOPNOTSUPP)
 				return ret;
-
-			if (val & DP_COMMON_CAP_DPRX_DONE) {
-				rate = tb_dp_cap_get_rate(val);
-				lanes = tb_dp_cap_get_lanes(val);
-				break;
-			}
-			msleep(250);
-		} while (timeout--);
-
-		if (!timeout)
-			return -ETIMEDOUT;
-	} else if (sw->generation >= 2) {
+		} else if (!ret) {
+			return 0;
+		}
 		/*
-		 * Read from the copied remote cap so that we take into
-		 * account if capabilities were reduced during exchange.
+		 * Then see if the DPRX negotiation is ready and if yes
+		 * return that bandwidth (it may be smaller than the
+		 * reduced one). Otherwise return the remote (possibly
+		 * reduced) caps.
 		 */
-		ret = tb_port_read(in, &val, TB_CFG_PORT,
-				   in->cap_adap + DP_REMOTE_CAP, 1);
+		ret = tb_dp_read_dprx(tunnel, &rate, &lanes, 150);
+		if (ret) {
+			if (ret == -ETIMEDOUT)
+				ret = tb_dp_read_cap(tunnel, DP_REMOTE_CAP,
+						     &rate, &lanes);
+			if (ret)
+				return ret;
+		}
+	} else if (sw->generation >= 2) {
+		ret = tb_dp_read_cap(tunnel, DP_REMOTE_CAP, &rate, &lanes);
 		if (ret)
 			return ret;
-
-		rate = tb_dp_cap_get_rate(val);
-		lanes = tb_dp_cap_get_lanes(val);
 	} else {
 		/* No bandwidth management for legacy devices  */
 		*consumed_up = 0;
@@ -799,8 +1158,12 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 	if (!tunnel)
 		return NULL;
 
-	tunnel->init = tb_dp_xchg_caps;
+	tunnel->init = tb_dp_init;
+	tunnel->deinit = tb_dp_deinit;
 	tunnel->activate = tb_dp_activate;
+	tunnel->maximum_bandwidth = tb_dp_maximum_bandwidth;
+	tunnel->allocated_bandwidth = tb_dp_allocated_bandwidth;
+	tunnel->alloc_bandwidth = tb_dp_alloc_bandwidth;
 	tunnel->consumed_bandwidth = tb_dp_consumed_bandwidth;
 	tunnel->src_port = in;
 
@@ -888,8 +1251,12 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	if (!tunnel)
 		return NULL;
 
-	tunnel->init = tb_dp_xchg_caps;
+	tunnel->init = tb_dp_init;
+	tunnel->deinit = tb_dp_deinit;
 	tunnel->activate = tb_dp_activate;
+	tunnel->maximum_bandwidth = tb_dp_maximum_bandwidth;
+	tunnel->allocated_bandwidth = tb_dp_allocated_bandwidth;
+	tunnel->alloc_bandwidth = tb_dp_alloc_bandwidth;
 	tunnel->consumed_bandwidth = tb_dp_consumed_bandwidth;
 	tunnel->src_port = in;
 	tunnel->dst_port = out;
@@ -1714,6 +2081,62 @@ static bool tb_tunnel_is_active(const struct tb_tunnel *tunnel)
 	return true;
 }
 
+int tb_tunnel_maximum_bandwidth(struct tb_tunnel *tunnel, int *max_up,
+				int *max_down)
+{
+	if (!tb_tunnel_is_active(tunnel))
+		return -EINVAL;
+
+	if (tunnel->maximum_bandwidth)
+		return tunnel->maximum_bandwidth(tunnel, max_up, max_down);
+	return -EOPNOTSUPP;
+}
+
+/**
+ * tb_tunnel_allocated_bandwidth() - Return bandwidth allocated for the tunnel
+ * @tunnel: Tunnel to check
+ * @allocated_up: Currently allocated upstream bandwidth in Mb/s is stored here
+ * @allocated_down: Currently allocated downstream bandwidth in Mb/s is
+ *		    stored here
+ *
+ * Returns the bandwidth allocated for the tunnel. This may be higher
+ * than what the tunnel actually consumes.
+ */
+int tb_tunnel_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up,
+				  int *allocated_down)
+{
+	if (!tb_tunnel_is_active(tunnel))
+		return -EINVAL;
+
+	if (tunnel->allocated_bandwidth)
+		return tunnel->allocated_bandwidth(tunnel, allocated_up,
+						   allocated_down);
+	return -EOPNOTSUPP;
+}
+
+/**
+ * tb_tunnel_alloc_bandwidth() - Change tunnel bandwidth allocation
+ * @tunnel: Tunnel whose bandwidth allocation to change
+ * @alloc_up: New upstream bandwidth in Mb/s
+ * @alloc_down: New downstream bandwidth in Mb/s
+ *
+ * Tries to change tunnel bandwidth allocation. If succeeds returns %0
+ * and updates @alloc_up and @alloc_down to that was actually allocated
+ * (it may not be the same as passed originally). Returns negative errno
+ * in case of failure.
+ */
+int tb_tunnel_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
+			      int *alloc_down)
+{
+	if (!tb_tunnel_is_active(tunnel))
+		return -EINVAL;
+
+	if (tunnel->alloc_bandwidth)
+		return tunnel->alloc_bandwidth(tunnel, alloc_up, alloc_down);
+
+	return -EOPNOTSUPP;
+}
+
 /**
  * tb_tunnel_consumed_bandwidth() - Return bandwidth consumed by the tunnel
  * @tunnel: Tunnel to check
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index bb4d1f1d6d0b..d7bbdf8c8186 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -29,6 +29,9 @@ enum tb_tunnel_type {
  * @init: Optional tunnel specific initialization
  * @deinit: Optional tunnel specific de-initialization
  * @activate: Optional tunnel specific activation/deactivation
+ * @maximum_bandwidth:
+ * @allocated_bandwidth: Return how much bandwidth is allocated for the tunnel
+ * @alloc_bandwidth: Change tunnel bandwidth allocation
  * @consumed_bandwidth: Return how much bandwidth the tunnel consumes
  * @release_unused_bandwidth: Release all unused bandwidth
  * @reclaim_available_bandwidth: Reclaim back available bandwidth
@@ -40,6 +43,8 @@ enum tb_tunnel_type {
  *	      Only set if the bandwidth needs to be limited.
  * @allocated_up: Allocated upstream bandwidth (only for USB3)
  * @allocated_down: Allocated downstream bandwidth (only for USB3)
+ * @bw_mode: DP bandwidth allocation mode registers can be used to
+ *	     determine consumed and allocated bandwidth
  */
 struct tb_tunnel {
 	struct tb *tb;
@@ -50,6 +55,12 @@ struct tb_tunnel {
 	int (*init)(struct tb_tunnel *tunnel);
 	void (*deinit)(struct tb_tunnel *tunnel);
 	int (*activate)(struct tb_tunnel *tunnel, bool activate);
+	int (*maximum_bandwidth)(struct tb_tunnel *tunnel, int *max_up,
+				 int *max_down);
+	int (*allocated_bandwidth)(struct tb_tunnel *tunnel, int *allocated_up,
+				   int *allocated_down);
+	int (*alloc_bandwidth)(struct tb_tunnel *tunnel, int *alloc_up,
+			       int *alloc_down);
 	int (*consumed_bandwidth)(struct tb_tunnel *tunnel, int *consumed_up,
 				  int *consumed_down);
 	int (*release_unused_bandwidth)(struct tb_tunnel *tunnel);
@@ -62,6 +73,7 @@ struct tb_tunnel {
 	int max_down;
 	int allocated_up;
 	int allocated_down;
+	bool bw_mode;
 };
 
 struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
@@ -92,6 +104,12 @@ void tb_tunnel_deactivate(struct tb_tunnel *tunnel);
 bool tb_tunnel_is_invalid(struct tb_tunnel *tunnel);
 bool tb_tunnel_port_on_path(const struct tb_tunnel *tunnel,
 			    const struct tb_port *port);
+int tb_tunnel_maximum_bandwidth(struct tb_tunnel *tunnel, int *max_up,
+				int *max_down);
+int tb_tunnel_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up,
+				  int *allocated_down);
+int tb_tunnel_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
+			      int *alloc_down);
 int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 				 int *consumed_down);
 int tb_tunnel_release_unused_bandwidth(struct tb_tunnel *tunnel);
-- 
2.35.1

