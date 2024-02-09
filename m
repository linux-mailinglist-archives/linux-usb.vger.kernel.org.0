Return-Path: <linux-usb+bounces-6161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B9B84F6F4
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F632888D6
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC2773186;
	Fri,  9 Feb 2024 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvtGPeVM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670566A342
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488026; cv=none; b=t7WhALuJQeLxyhXQuVsx6meTsodM06xbJCZ7b7xPN+t1WeIvvP/p44iTNByun/77XzTso6w8P9Igxv2RB8RIMxGQuo5xuXe6hk4hZVwPm+f2ceJI+n4votgN089c0JDSPLCrl240ItjIpb2V4w7fKAMH15y0oQeitiSBPzJeEyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488026; c=relaxed/simple;
	bh=aRAQJrlfssxWlrXt4lrfFlu3hxjgmacnXFbBXmgYf00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VErTPxt9N8/mhXXswFiegsLEsonc9XOkFIUzII2/AJvvxuuk0kmGex1AftTAHScwtNrXxsJ2Vgm0K16TdYoWnSd3rStSt3KAAshsk+sAl6k7Wly2UrJ8oNp0W8QZ4SIAIwSzNPGJ7TxMqfczatH6QIaA5AKA7jDm8799JFa+SXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvtGPeVM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488024; x=1739024024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aRAQJrlfssxWlrXt4lrfFlu3hxjgmacnXFbBXmgYf00=;
  b=XvtGPeVMogPOLMgCbCToZ6XtbIfSr3C0iyI8kC8UrnVcbg0JvnHHOy/5
   ETJg8FXT+WoiVETiF86XhmKgB2z/XyZIVxXqjEnOrC1SjmAmXwhzGWlg1
   4S7X9a1m7KBNkHedNz10REMbghWUQ9FmkyUdOFP5NbRB55A80X795R7ux
   OSAJn3LOI+s6GHRKE6/XHCVBi03Km1aMBG/JD21XH/97KlV1xzptkCt2R
   z/eApD2n7BhSWy9mm6ELsks0lLiXndskKaY1Kr+BYKZisnyEGCtvnluyP
   a3uN+GKKxfHGkkcroMhZPiesMkoVB2nVRWmvsFmbn0ppb/QE9rOPS8+RL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12082129"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12082129"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934434448"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934434448"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:13:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DF647B2C; Fri,  9 Feb 2024 16:13:35 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 06/10] thunderbolt: Re-order bandwidth group functions
Date: Fri,  9 Feb 2024 16:13:31 +0200
Message-ID: <20240209141335.2286786-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
References: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed by the following patches so that we do not have to add
forward declaratations for any of these. Separating the move and the
actual changes also makes it easier to review the code.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 454 +++++++++++++++++++--------------------
 1 file changed, 225 insertions(+), 229 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 9dbdf2770f0b..d23a80339a8d 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -75,112 +75,6 @@ struct tb_hotplug_event {
 	bool unplug;
 };
 
-static void tb_init_bandwidth_groups(struct tb_cm *tcm)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
-		struct tb_bandwidth_group *group = &tcm->groups[i];
-
-		group->tb = tcm_to_tb(tcm);
-		group->index = i + 1;
-		INIT_LIST_HEAD(&group->ports);
-	}
-}
-
-static void tb_bandwidth_group_attach_port(struct tb_bandwidth_group *group,
-					   struct tb_port *in)
-{
-	if (!group || WARN_ON(in->group))
-		return;
-
-	in->group = group;
-	list_add_tail(&in->group_list, &group->ports);
-
-	tb_port_dbg(in, "attached to bandwidth group %d\n", group->index);
-}
-
-static struct tb_bandwidth_group *tb_find_free_bandwidth_group(struct tb_cm *tcm)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
-		struct tb_bandwidth_group *group = &tcm->groups[i];
-
-		if (list_empty(&group->ports))
-			return group;
-	}
-
-	return NULL;
-}
-
-static struct tb_bandwidth_group *
-tb_attach_bandwidth_group(struct tb_cm *tcm, struct tb_port *in,
-			  struct tb_port *out)
-{
-	struct tb_bandwidth_group *group;
-	struct tb_tunnel *tunnel;
-
-	/*
-	 * Find all DP tunnels that go through all the same USB4 links
-	 * as this one. Because we always setup tunnels the same way we
-	 * can just check for the routers at both ends of the tunnels
-	 * and if they are the same we have a match.
-	 */
-	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
-		if (!tb_tunnel_is_dp(tunnel))
-			continue;
-
-		if (tunnel->src_port->sw == in->sw &&
-		    tunnel->dst_port->sw == out->sw) {
-			group = tunnel->src_port->group;
-			if (group) {
-				tb_bandwidth_group_attach_port(group, in);
-				return group;
-			}
-		}
-	}
-
-	/* Pick up next available group then */
-	group = tb_find_free_bandwidth_group(tcm);
-	if (group)
-		tb_bandwidth_group_attach_port(group, in);
-	else
-		tb_port_warn(in, "no available bandwidth groups\n");
-
-	return group;
-}
-
-static void tb_discover_bandwidth_group(struct tb_cm *tcm, struct tb_port *in,
-					struct tb_port *out)
-{
-	if (usb4_dp_port_bandwidth_mode_enabled(in)) {
-		int index, i;
-
-		index = usb4_dp_port_group_id(in);
-		for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
-			if (tcm->groups[i].index == index) {
-				tb_bandwidth_group_attach_port(&tcm->groups[i], in);
-				return;
-			}
-		}
-	}
-
-	tb_attach_bandwidth_group(tcm, in, out);
-}
-
-static void tb_detach_bandwidth_group(struct tb_port *in)
-{
-	struct tb_bandwidth_group *group = in->group;
-
-	if (group) {
-		in->group = NULL;
-		list_del_init(&in->group_list);
-
-		tb_port_dbg(in, "detached from bandwidth group %d\n", group->index);
-	}
-}
-
 static void tb_handle_hotplug(struct work_struct *work);
 
 static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
@@ -472,34 +366,6 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
 	}
 }
 
-static void tb_discover_tunnels(struct tb *tb)
-{
-	struct tb_cm *tcm = tb_priv(tb);
-	struct tb_tunnel *tunnel;
-
-	tb_switch_discover_tunnels(tb->root_switch, &tcm->tunnel_list, true);
-
-	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
-		if (tb_tunnel_is_pci(tunnel)) {
-			struct tb_switch *parent = tunnel->dst_port->sw;
-
-			while (parent != tunnel->src_port->sw) {
-				parent->boot = true;
-				parent = tb_switch_parent(parent);
-			}
-		} else if (tb_tunnel_is_dp(tunnel)) {
-			struct tb_port *in = tunnel->src_port;
-			struct tb_port *out = tunnel->dst_port;
-
-			/* Keep the domain from powering down */
-			pm_runtime_get_sync(&in->sw->dev);
-			pm_runtime_get_sync(&out->sw->dev);
-
-			tb_discover_bandwidth_group(tcm, in, out);
-		}
-	}
-}
-
 static int tb_port_configure_xdomain(struct tb_port *port, struct tb_xdomain *xd)
 {
 	if (tb_switch_is_usb4(port->sw))
@@ -1464,6 +1330,231 @@ static void tb_scan_port(struct tb_port *port)
 	}
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
+		if (!usb4_dp_port_bandwidth_mode_enabled(in))
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
+				tb_tunnel_warn(tunnel,
+					"failed to release unused bandwidth\n");
+				break;
+			}
+		}
+
+		out = tunnel->dst_port;
+		ret = tb_available_bandwidth(tb, in, out, &estimated_up,
+					     &estimated_down, true);
+		if (ret) {
+			tb_tunnel_warn(tunnel,
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
+		if (tb_port_path_direction_downstream(in, out))
+			estimated_bw = estimated_down;
+		else
+			estimated_bw = estimated_up;
+
+		if (usb4_dp_port_set_estimated_bandwidth(in, estimated_bw))
+			tb_tunnel_warn(tunnel,
+				       "failed to update estimated bandwidth\n");
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
+	if (usb4_dp_port_bandwidth_mode_enabled(in)) {
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
+static void tb_discover_tunnels(struct tb *tb)
+{
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_tunnel *tunnel;
+
+	tb_switch_discover_tunnels(tb->root_switch, &tcm->tunnel_list, true);
+
+	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
+		if (tb_tunnel_is_pci(tunnel)) {
+			struct tb_switch *parent = tunnel->dst_port->sw;
+
+			while (parent != tunnel->src_port->sw) {
+				parent->boot = true;
+				parent = tb_switch_parent(parent);
+			}
+		} else if (tb_tunnel_is_dp(tunnel)) {
+			struct tb_port *in = tunnel->src_port;
+			struct tb_port *out = tunnel->dst_port;
+
+			/* Keep the domain from powering down */
+			pm_runtime_get_sync(&in->sw->dev);
+			pm_runtime_get_sync(&out->sw->dev);
+
+			tb_discover_bandwidth_group(tcm, in, out);
+		}
+	}
+}
+
 static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
 {
 	struct tb_port *src_port, *dst_port;
@@ -1605,101 +1696,6 @@ static struct tb_port *tb_find_pcie_down(struct tb_switch *sw,
 	return tb_find_unused_port(sw, TB_TYPE_PCIE_DOWN);
 }
 
-static void
-tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
-{
-	struct tb_tunnel *first_tunnel;
-	struct tb *tb = group->tb;
-	struct tb_port *in;
-	int ret;
-
-	tb_dbg(tb, "re-calculating bandwidth estimation for group %u\n",
-	       group->index);
-
-	first_tunnel = NULL;
-	list_for_each_entry(in, &group->ports, group_list) {
-		int estimated_bw, estimated_up, estimated_down;
-		struct tb_tunnel *tunnel;
-		struct tb_port *out;
-
-		if (!usb4_dp_port_bandwidth_mode_enabled(in))
-			continue;
-
-		tunnel = tb_find_tunnel(tb, TB_TUNNEL_DP, in, NULL);
-		if (WARN_ON(!tunnel))
-			break;
-
-		if (!first_tunnel) {
-			/*
-			 * Since USB3 bandwidth is shared by all DP
-			 * tunnels under the host router USB4 port, even
-			 * if they do not begin from the host router, we
-			 * can release USB3 bandwidth just once and not
-			 * for each tunnel separately.
-			 */
-			first_tunnel = tunnel;
-			ret = tb_release_unused_usb3_bandwidth(tb,
-				first_tunnel->src_port, first_tunnel->dst_port);
-			if (ret) {
-				tb_tunnel_warn(tunnel,
-					"failed to release unused bandwidth\n");
-				break;
-			}
-		}
-
-		out = tunnel->dst_port;
-		ret = tb_available_bandwidth(tb, in, out, &estimated_up,
-					     &estimated_down, true);
-		if (ret) {
-			tb_tunnel_warn(tunnel,
-				"failed to re-calculate estimated bandwidth\n");
-			break;
-		}
-
-		/*
-		 * Estimated bandwidth includes:
-		 *  - already allocated bandwidth for the DP tunnel
-		 *  - available bandwidth along the path
-		 *  - bandwidth allocated for USB 3.x but not used.
-		 */
-		tb_tunnel_dbg(tunnel,
-			      "re-calculated estimated bandwidth %u/%u Mb/s\n",
-			      estimated_up, estimated_down);
-
-		if (tb_port_path_direction_downstream(in, out))
-			estimated_bw = estimated_down;
-		else
-			estimated_bw = estimated_up;
-
-		if (usb4_dp_port_set_estimated_bandwidth(in, estimated_bw))
-			tb_tunnel_warn(tunnel,
-				       "failed to update estimated bandwidth\n");
-	}
-
-	if (first_tunnel)
-		tb_reclaim_usb3_bandwidth(tb, first_tunnel->src_port,
-					  first_tunnel->dst_port);
-
-	tb_dbg(tb, "bandwidth estimation for group %u done\n", group->index);
-}
-
-static void tb_recalc_estimated_bandwidth(struct tb *tb)
-{
-	struct tb_cm *tcm = tb_priv(tb);
-	int i;
-
-	tb_dbg(tb, "bandwidth consumption changed, re-calculating estimated bandwidth\n");
-
-	for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
-		struct tb_bandwidth_group *group = &tcm->groups[i];
-
-		if (!list_empty(&group->ports))
-			tb_recalc_estimated_bandwidth_for_group(group);
-	}
-
-	tb_dbg(tb, "bandwidth re-calculation done\n");
-}
-
 static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 {
 	struct tb_port *host_port, *port;
-- 
2.43.0


