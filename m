Return-Path: <linux-usb+bounces-6165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3A784F6F8
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C0FC1F252DA
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5774E74E18;
	Fri,  9 Feb 2024 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xisx7lFp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0137E73196
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488028; cv=none; b=Lasc8BUUrFH5kxZX5Lelo9UzebclJeNnz8WFzit5LQp2TxWb+YU8ErDU0NqvQDylb+a4EmAs6JvRGikb5n0aLHUMb7RpmY9DDSlL/MgMbOmtNYVyCPQgpNb4l8I8lUxVy7DV+4Sg3E1d06heCDHt1ffPOgynbRU3jYftl/6SE8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488028; c=relaxed/simple;
	bh=Lxdqj5MERCMmtK2VhmVWvN4KG+6U40gj1VwgaHN7GQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UgdHBeW7oooqLZwFFKyMhb+KaKKbzzQg77Do5WFZKON6guyKaHArMEeRFvGtwI4Nb6C8uIchxOgwwvNoAeYUrJWPm3rZpDtKqz/lKZqMwFpvLp0Ac28FVAdjLtIAoZg7oxB1kHUguaD5UeLn6Xn5HOT3HGSPIcQgdyKG/ioXVUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xisx7lFp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488027; x=1739024027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lxdqj5MERCMmtK2VhmVWvN4KG+6U40gj1VwgaHN7GQE=;
  b=Xisx7lFpE6j98khF30ZihNcCW4bUOKxo+pbWQ81YsqewPJuWBvjhIa+B
   Hdn03Xz1K2JLnHJKfMtZRWMOHoEJfTBs0Imb3FpKhfTrvYtWHCP+YR/n2
   u3fXU/2niFSmdxs8pCn+aSUHcvAD7HMHscyNEarE1kqJO+57/Lmdfocec
   G8L0X3Mandiew01R3ISaeNOp6BCGDYowKKkjEfVIaLcQaQTul3IKnI8Xb
   ey6qZ6rTK9YS88DQhli9sV+MjECFGqEgLdShri2yDqsryh/d+3HDyGpKd
   VXeeOjjsnO5NXhPUib3XhGJvGeVIuBjrvzVk+2OC+q5FSkdXevcHlUGf1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12082142"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12082142"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934434455"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934434455"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:13:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 01397BA3; Fri,  9 Feb 2024 16:13:35 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 08/10] thunderbolt: Reserve released DisplayPort bandwidth for a group for 10 seconds
Date: Fri,  9 Feb 2024 16:13:33 +0200
Message-ID: <20240209141335.2286786-9-mika.westerberg@linux.intel.com>
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

The USB4 spec says that the Connection Manager should reserve the
bandwidth that is released in the same group for 10 seconds before it
can be shared with other groups. Add support for this. We also delay the
symmetric transition by that same 10 seconds to avoid any unnecessary
transitions (i.e if the released bandwidth is used by another
DisplayPort tunnel in the same group the link can stay asymmetric the
whole time).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/domain.c |   4 +
 drivers/thunderbolt/tb.c     | 199 ++++++++++++++++++++++++++++++-----
 drivers/thunderbolt/tb.h     |  10 ++
 3 files changed, 184 insertions(+), 29 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index ee8a894bd70d..d7abb8c445aa 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -506,6 +506,10 @@ void tb_domain_remove(struct tb *tb)
 	mutex_unlock(&tb->lock);
 
 	flush_workqueue(tb->wq);
+
+	if (tb->cm_ops->deinit)
+		tb->cm_ops->deinit(tb);
+
 	device_unregister(&tb->dev);
 }
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index e664045ad41c..eda53567fa4a 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -17,6 +17,7 @@
 #include "tunnel.h"
 
 #define TB_TIMEOUT		100	/* ms */
+#define TB_RELEASE_BW_TIMEOUT	10000	/* ms */
 
 /*
  * Minimum bandwidth (in Mb/s) that is needed in the single transmitter/receiver
@@ -547,6 +548,10 @@ static int tb_consumed_usb3_pcie_bandwidth(struct tb *tb,
  * Calculates consumed DP bandwidth at @port between path from @src_port
  * to @dst_port. Does not take tunnel starting from @src_port and ending
  * from @src_port into account.
+ *
+ * If there is bandwidth reserved for any of the groups between
+ * @src_port and @dst_port (but not yet used) that is also taken into
+ * account in the returned consumed bandwidth.
  */
 static int tb_consumed_dp_bandwidth(struct tb *tb,
 				    struct tb_port *src_port,
@@ -555,9 +560,11 @@ static int tb_consumed_dp_bandwidth(struct tb *tb,
 				    int *consumed_up,
 				    int *consumed_down)
 {
+	int group_reserved[MAX_GROUPS] = {};
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel;
-	int ret;
+	bool downstream;
+	int i, ret;
 
 	*consumed_up = *consumed_down = 0;
 
@@ -566,6 +573,7 @@ static int tb_consumed_dp_bandwidth(struct tb *tb,
 	 * their consumed bandwidth from the available.
 	 */
 	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
+		const struct tb_bandwidth_group *group;
 		int dp_consumed_up, dp_consumed_down;
 
 		if (tb_tunnel_is_invalid(tunnel))
@@ -577,6 +585,15 @@ static int tb_consumed_dp_bandwidth(struct tb *tb,
 		if (!tb_tunnel_port_on_path(tunnel, port))
 			continue;
 
+		/*
+		 * Calculate what is reserved for groups crossing the
+		 * same ports only once (as that is reserved for all the
+		 * tunnels in the group).
+		 */
+		group = tunnel->src_port->group;
+		if (group && group->reserved && !group_reserved[group->index])
+			group_reserved[group->index] = group->reserved;
+
 		/*
 		 * Ignore the DP tunnel between src_port and dst_port
 		 * because it is the same tunnel and we may be
@@ -595,6 +612,14 @@ static int tb_consumed_dp_bandwidth(struct tb *tb,
 		*consumed_down += dp_consumed_down;
 	}
 
+	downstream = tb_port_path_direction_downstream(src_port, dst_port);
+	for (i = 0; i < ARRAY_SIZE(group_reserved); i++) {
+		if (downstream)
+			*consumed_down += group_reserved[i];
+		else
+			*consumed_up += group_reserved[i];
+	}
+
 	return 0;
 }
 
@@ -1047,8 +1072,6 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
  * @tb: Domain structure
  * @src_port: Source adapter to start the transition
  * @dst_port: Destination adapter
- * @requested_up: New lower bandwidth request upstream (Mb/s)
- * @requested_down: New lower bandwidth request downstream (Mb/s)
  * @keep_asym: Keep asymmetric link if preferred
  *
  * Goes over each link from @src_port to @dst_port and tries to
@@ -1056,8 +1079,7 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
  * allows and link asymmetric preference is ignored (if @keep_asym is %false).
  */
 static int tb_configure_sym(struct tb *tb, struct tb_port *src_port,
-			    struct tb_port *dst_port, int requested_up,
-			    int requested_down, bool keep_asym)
+			    struct tb_port *dst_port, bool keep_asym)
 {
 	bool clx = false, clx_disabled = false, downstream;
 	struct tb_switch *sw;
@@ -1096,10 +1118,10 @@ static int tb_configure_sym(struct tb *tb, struct tb_port *src_port,
 			 * guard band 10%) as the link was configured asymmetric
 			 * already.
 			 */
-			if (consumed_down + requested_down >= asym_threshold)
+			if (consumed_down >= asym_threshold)
 				continue;
 		} else {
-			if (consumed_up + requested_up >= asym_threshold)
+			if (consumed_up >= asym_threshold)
 				continue;
 		}
 
@@ -1172,7 +1194,7 @@ static void tb_configure_link(struct tb_port *down, struct tb_port *up,
 		struct tb_port *host_port;
 
 		host_port = tb_port_at(tb_route(sw), tb->root_switch);
-		tb_configure_sym(tb, host_port, up, 0, 0, false);
+		tb_configure_sym(tb, host_port, up, false);
 	}
 
 	/* Set the link configured */
@@ -1392,7 +1414,17 @@ tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
 		else
 			estimated_bw = estimated_up;
 
-		if (usb4_dp_port_set_estimated_bandwidth(in, estimated_bw))
+		/*
+		 * If there is reserved bandwidth for the group that is
+		 * not yet released we report that too.
+		 */
+		tb_tunnel_dbg(tunnel,
+			      "re-calculated estimated bandwidth %u (+ %u reserved) = %u Mb/s\n",
+			      estimated_bw, group->reserved,
+			      estimated_bw + group->reserved);
+
+		if (usb4_dp_port_set_estimated_bandwidth(in,
+				estimated_bw + group->reserved))
 			tb_tunnel_warn(tunnel,
 				       "failed to update estimated bandwidth\n");
 	}
@@ -1421,6 +1453,54 @@ static void tb_recalc_estimated_bandwidth(struct tb *tb)
 	tb_dbg(tb, "bandwidth re-calculation done\n");
 }
 
+static bool __release_group_bandwidth(struct tb_bandwidth_group *group)
+{
+	if (group->reserved) {
+		tb_dbg(group->tb, "group %d released total %d Mb/s\n", group->index,
+			group->reserved);
+		group->reserved = 0;
+		return true;
+	}
+	return false;
+}
+
+static void __configure_group_sym(struct tb_bandwidth_group *group)
+{
+	struct tb_tunnel *tunnel;
+	struct tb_port *in;
+
+	if (list_empty(&group->ports))
+		return;
+
+	/*
+	 * All the tunnels in the group go through the same USB4 links
+	 * so we find the first one here and pass the IN and OUT
+	 * adapters to tb_configure_sym() which now transitions the
+	 * links back to symmetric if bandwidth requirement < asym_threshold.
+	 *
+	 * We do this here to avoid unnecessary transitions (for example
+	 * if the graphics released bandwidth for other tunnel in the
+	 * same group).
+	 */
+	in = list_first_entry(&group->ports, struct tb_port, group_list);
+	tunnel = tb_find_tunnel(group->tb, TB_TUNNEL_DP, in, NULL);
+	if (tunnel)
+		tb_configure_sym(group->tb, in, tunnel->dst_port, true);
+}
+
+static void tb_bandwidth_group_release_work(struct work_struct *work)
+{
+	struct tb_bandwidth_group *group =
+		container_of(work, typeof(*group), release_work.work);
+	struct tb *tb = group->tb;
+
+	mutex_lock(&tb->lock);
+	if (__release_group_bandwidth(group))
+		tb_recalc_estimated_bandwidth(tb);
+	__configure_group_sym(group);
+	mutex_unlock(&tb->lock);
+}
+
 static void tb_init_bandwidth_groups(struct tb_cm *tcm)
 {
 	int i;
@@ -1431,6 +1511,8 @@ static void tb_init_bandwidth_groups(struct tb_cm *tcm)
 		group->tb = tcm_to_tb(tcm);
 		group->index = i + 1;
 		INIT_LIST_HEAD(&group->ports);
+		INIT_DELAYED_WORK(&group->release_work,
+				  tb_bandwidth_group_release_work);
 	}
 }
 
@@ -1524,6 +1606,12 @@ static void tb_detach_bandwidth_group(struct tb_port *in)
 		list_del_init(&in->group_list);
 
 		tb_port_dbg(in, "detached from bandwidth group %d\n", group->index);
+
+		/* No more tunnels so release the reserved bandwidth if any */
+		if (list_empty(&group->ports)) {
+			cancel_delayed_work(&group->release_work);
+			__release_group_bandwidth(group);
+		}
 	}
 }
 
@@ -1582,7 +1670,7 @@ static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
 		 * If bandwidth on a link is < asym_threshold
 		 * transition the link to symmetric.
 		 */
-		tb_configure_sym(tb, src_port, dst_port, 0, 0, true);
+		tb_configure_sym(tb, src_port, dst_port, true);
 		/* Now we can allow the domain to runtime suspend again */
 		pm_runtime_mark_last_busy(&dst_port->sw->dev);
 		pm_runtime_put_autosuspend(&dst_port->sw->dev);
@@ -2239,8 +2327,10 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 	int allocated_up, allocated_down, available_up, available_down, ret;
 	int requested_up_corrected, requested_down_corrected, granularity;
 	int max_up, max_down, max_up_rounded, max_down_rounded;
+	struct tb_bandwidth_group *group;
 	struct tb *tb = tunnel->tb;
 	struct tb_port *in, *out;
+	bool downstream;
 
 	ret = tb_tunnel_allocated_bandwidth(tunnel, &allocated_up, &allocated_down);
 	if (ret)
@@ -2304,21 +2394,44 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 		goto fail;
 	}
 
+	downstream = tb_tunnel_direction_downstream(tunnel);
+	group = in->group;
+
 	if ((*requested_up >= 0 && requested_up_corrected <= allocated_up) ||
 	    (*requested_down >= 0 && requested_down_corrected <= allocated_down)) {
-		/*
-		 * If bandwidth on a link is < asym_threshold transition
-		 * the link to symmetric.
-		 */
-		tb_configure_sym(tb, in, out, *requested_up, *requested_down, true);
-		/*
-		 * If requested bandwidth is less or equal than what is
-		 * currently allocated to that tunnel we simply change
-		 * the reservation of the tunnel. Since all the tunnels
-		 * going out from the same USB4 port are in the same
-		 * group the released bandwidth will be taken into
-		 * account for the other tunnels automatically below.
-		 */
+		if (tunnel->bw_mode) {
+			int reserved;
+			/*
+			 * If requested bandwidth is less or equal than
+			 * what is currently allocated to that tunnel we
+			 * simply change the reservation of the tunnel
+			 * and add the released bandwidth for the group
+			 * for the next 10s. Then we release it for
+			 * others to use.
+			 */
+			if (downstream)
+				reserved = allocated_down - *requested_down;
+			else
+				reserved = allocated_up - *requested_up;
+
+			if (reserved > 0) {
+				group->reserved += reserved;
+				tb_dbg(tb, "group %d reserved %d total %d Mb/s\n",
+				       group->index, reserved, group->reserved);
+
+				/*
+				 * If it was not already pending,
+				 * schedule release now. If it is then
+				 * postpone it for the next 10s (unless
+				 * it is already running in which case
+				 * the 10s already expired and we should
+				 * give the reserved back to others).
+				 */
+				mod_delayed_work(system_wq, &group->release_work,
+					msecs_to_jiffies(TB_RELEASE_BW_TIMEOUT));
+			}
+		}
+
 		return tb_tunnel_alloc_bandwidth(tunnel, requested_up,
 						 requested_down);
 	}
@@ -2341,11 +2454,15 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 	if (ret)
 		goto reclaim;
 
-	tb_tunnel_dbg(tunnel, "bandwidth available for allocation %d/%d Mb/s\n",
-		      available_up, available_down);
+	tb_tunnel_dbg(tunnel, "bandwidth available for allocation %d/%d (+ %u reserved) Mb/s\n",
+		      available_up, available_down, group->reserved);
+
+	if ((*requested_up >= 0 &&
+		available_up + group->reserved >= requested_up_corrected) ||
+	    (*requested_down >= 0 &&
+		available_down + group->reserved >= requested_down_corrected)) {
+		int released = 0;
 
-	if ((*requested_up >= 0 && available_up >= requested_up_corrected) ||
-	    (*requested_down >= 0 && available_down >= requested_down_corrected)) {
 		/*
 		 * If bandwidth on a link is >= asym_threshold
 		 * transition the link to asymmetric.
@@ -2353,7 +2470,7 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 		ret = tb_configure_asym(tb, in, out, *requested_up,
 					*requested_down);
 		if (ret) {
-			tb_configure_sym(tb, in, out, 0, 0, true);
+			tb_configure_sym(tb, in, out, true);
 			goto fail;
 		}
 
@@ -2361,7 +2478,20 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 						requested_down);
 		if (ret) {
 			tb_tunnel_warn(tunnel, "failed to allocate bandwidth\n");
-			tb_configure_sym(tb, in, out, 0, 0, true);
+			tb_configure_sym(tb, in, out, true);
+		}
+
+		if (downstream) {
+			if (*requested_down > available_down)
+				released = *requested_down - available_down;
+		} else {
+			if (*requested_up > available_up)
+				released = *requested_up - available_up;
+		}
+		if (released) {
+			group->reserved -= released;
+			tb_dbg(tb, "group %d released %d total %d Mb/s\n",
+			       group->index, released, group->reserved);
 		}
 	} else {
 		ret = -ENOBUFS;
@@ -2585,6 +2715,16 @@ static void tb_stop(struct tb *tb)
 	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
 }
 
+static void tb_deinit(struct tb *tb)
+{
+	struct tb_cm *tcm = tb_priv(tb);
+	int i;
+
+	/* Cancel all the release bandwidth workers */
+	for (i = 0; i < ARRAY_SIZE(tcm->groups); i++)
+		cancel_delayed_work_sync(&tcm->groups[i].release_work);
+}
+
 static int tb_scan_finalize_switch(struct device *dev, void *data)
 {
 	if (tb_is_switch(dev)) {
@@ -2893,6 +3033,7 @@ static int tb_runtime_resume(struct tb *tb)
 static const struct tb_cm_ops tb_cm_ops = {
 	.start = tb_start,
 	.stop = tb_stop,
+	.deinit = tb_deinit,
 	.suspend_noirq = tb_suspend_noirq,
 	.resume_noirq = tb_resume_noirq,
 	.freeze_noirq = tb_freeze_noirq,
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index d0dfbf040356..1bbbeb034e0e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -217,6 +217,11 @@ struct tb_switch {
  * @tb: Pointer to the domain the group belongs to
  * @index: Index of the group (aka Group_ID). Valid values %1-%7
  * @ports: DP IN adapters belonging to this group are linked here
+ * @reserved: Bandwidth released by one tunnel in the group, available
+ *	      to others. This is reported as part of estimated_bw for
+ *	      the group.
+ * @release_work: Worker to release the @reserved if it is not used by
+ *		  any of the tunnels.
  *
  * Any tunnel that requires isochronous bandwidth (that's DP for now) is
  * attached to a bandwidth group. All tunnels going through the same
@@ -227,6 +232,8 @@ struct tb_bandwidth_group {
 	struct tb *tb;
 	int index;
 	struct list_head ports;
+	int reserved;
+	struct delayed_work release_work;
 };
 
 /**
@@ -452,6 +459,8 @@ struct tb_path {
  *		  ICM to send driver ready message to the firmware.
  * @start: Starts the domain
  * @stop: Stops the domain
+ * @deinit: Perform any cleanup after the domain is stopped but before
+ *	     it is unregistered. Called without @tb->lock taken. Optional.
  * @suspend_noirq: Connection manager specific suspend_noirq
  * @resume_noirq: Connection manager specific resume_noirq
  * @suspend: Connection manager specific suspend
@@ -485,6 +494,7 @@ struct tb_cm_ops {
 	int (*driver_ready)(struct tb *tb);
 	int (*start)(struct tb *tb, bool reset);
 	void (*stop)(struct tb *tb);
+	void (*deinit)(struct tb *tb);
 	int (*suspend_noirq)(struct tb *tb);
 	int (*resume_noirq)(struct tb *tb);
 	int (*suspend)(struct tb *tb);
-- 
2.43.0


