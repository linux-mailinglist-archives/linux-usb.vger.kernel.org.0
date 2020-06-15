Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D3A1F9A54
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbgFOOdo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:33:44 -0400
Received: from mga05.intel.com ([192.55.52.43]:1149 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730534AbgFOOdn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:33:43 -0400
IronPort-SDR: 0ofXU6YaIBHdGP0N4NhAbsM2Vjm8JSv+Amj/nFrFQ3LzH9HR/rIgV/6GsfPEl3cpVPid3173vQ
 mwUSqLTPwdTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:54 -0700
IronPort-SDR: BcVXJRqdSZpQ9y8SP+D4Lu1LknCqhIYBkNXLB2kc6+8v9o5/YPjP/FqNzIOzt3vx/orozUhdZh
 uCwOuZ0GE8dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="449412057"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 15 Jun 2020 07:26:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5997C98F; Mon, 15 Jun 2020 17:26:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 16/17] thunderbolt: Add USB3 bandwidth management
Date:   Mon, 15 Jun 2020 17:26:44 +0300
Message-Id: <20200615142645.56209-17-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB3 supports both isochronous and non-isochronous traffic. The former
requires guaranteed bandwidth and can take up to 90% of the total
bandwidth. With USB4 USB3 is tunneled over USB4 fabric which means that
we need to make sure there is enough bandwidth allocated for the USB3
tunnels in addition to DisplayPort tunnels.

Whereas DisplayPort bandwidth management is static and done before the
DP tunnel is established, the USB3 bandwidth management is dynamic and
allows increasing and decreasing the allocated bandwidth according to
what is currently consumed. This is done through host router USB3
downstream adapter registers.

This adds USB3 bandwidth management to the software connection manager
so that we always try to allocate maximum bandwidth for DP tunnels and
what is left is allocated for USB3.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c   |  13 +-
 drivers/thunderbolt/tb.c     | 340 ++++++++++++++++++++++++++---------
 drivers/thunderbolt/tb.h     |   4 +-
 drivers/thunderbolt/tunnel.c | 255 ++++++++++++++++++++++++--
 drivers/thunderbolt/tunnel.h |  31 +++-
 5 files changed, 532 insertions(+), 111 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index 854ff3412161..03e7b714deab 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -570,21 +570,20 @@ bool tb_path_is_invalid(struct tb_path *path)
 }
 
 /**
- * tb_path_switch_on_path() - Does the path go through certain switch
+ * tb_path_port_on_path() - Does the path go through certain port
  * @path: Path to check
- * @sw: Switch to check
+ * @port: Switch to check
  *
- * Goes over all hops on path and checks if @sw is any of them.
+ * Goes over all hops on path and checks if @port is any of them.
  * Direction does not matter.
  */
-bool tb_path_switch_on_path(const struct tb_path *path,
-			    const struct tb_switch *sw)
+bool tb_path_port_on_path(const struct tb_path *path, const struct tb_port *port)
 {
 	int i;
 
 	for (i = 0; i < path->path_length; i++) {
-		if (path->hops[i].in_port->sw == sw ||
-		    path->hops[i].out_port->sw == sw)
+		if (path->hops[i].in_port == port ||
+		    path->hops[i].out_port == port)
 			return true;
 	}
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 53f9673c1395..bbcf0f25617c 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -216,9 +216,187 @@ static struct tb_port *tb_find_usb3_down(struct tb_switch *sw,
 	return NULL;
 }
 
+static struct tb_tunnel *tb_find_tunnel(struct tb *tb, enum tb_tunnel_type type,
+					struct tb_port *src_port,
+					struct tb_port *dst_port)
+{
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_tunnel *tunnel;
+
+	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
+		if (tunnel->type == type &&
+		    ((src_port && src_port == tunnel->src_port) ||
+		     (dst_port && dst_port == tunnel->dst_port))) {
+			return tunnel;
+		}
+	}
+
+	return NULL;
+}
+
+static struct tb_tunnel *tb_find_first_usb3_tunnel(struct tb *tb,
+						   struct tb_port *src_port,
+						   struct tb_port *dst_port)
+{
+	struct tb_port *port, *usb3_down;
+	struct tb_switch *sw;
+
+	/* Pick the router that is deepest in the topology */
+	if (dst_port->sw->config.depth > src_port->sw->config.depth)
+		sw = dst_port->sw;
+	else
+		sw = src_port->sw;
+
+	/* Can't be the host router */
+	if (sw == tb->root_switch)
+		return NULL;
+
+	/* Find the downstream USB4 port that leads to this router */
+	port = tb_port_at(tb_route(sw), tb->root_switch);
+	/* Find the corresponding host router USB3 downstream port */
+	usb3_down = usb4_switch_map_usb3_down(tb->root_switch, port);
+	if (!usb3_down)
+		return NULL;
+
+	return tb_find_tunnel(tb, TB_TUNNEL_USB3, usb3_down, NULL);
+}
+
+static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
+	struct tb_port *dst_port, int *available_up, int *available_down)
+{
+	int usb3_consumed_up, usb3_consumed_down, ret;
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_tunnel *tunnel;
+	struct tb_port *port;
+
+	tb_port_dbg(dst_port, "calculating available bandwidth\n");
+
+	tunnel = tb_find_first_usb3_tunnel(tb, src_port, dst_port);
+	if (tunnel) {
+		ret = tb_tunnel_consumed_bandwidth(tunnel, &usb3_consumed_up,
+						   &usb3_consumed_down);
+		if (ret)
+			return ret;
+	} else {
+		usb3_consumed_up = 0;
+		usb3_consumed_down = 0;
+	}
+
+	*available_up = *available_down = 40000;
+
+	/* Find the minimum available bandwidth over all links */
+	tb_for_each_port_on_path(src_port, dst_port, port) {
+		int link_speed, link_width, up_bw, down_bw;
+
+		if (!tb_port_is_null(port))
+			continue;
+
+		if (tb_is_upstream_port(port)) {
+			link_speed = port->sw->link_speed;
+		} else {
+			link_speed = tb_port_get_link_speed(port);
+			if (link_speed < 0)
+				return link_speed;
+		}
+
+		link_width = port->bonded ? 2 : 1;
+
+		up_bw = link_speed * link_width * 1000; /* Mb/s */
+		/* Leave 10% guard band */
+		up_bw -= up_bw / 10;
+		down_bw = up_bw;
+
+		tb_port_dbg(port, "link total bandwidth %d Mb/s\n", up_bw);
+
+		/*
+		 * Find all DP tunnels that cross the port and reduce
+		 * their consumed bandwidth from the available.
+		 */
+		list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
+			int dp_consumed_up, dp_consumed_down;
+
+			if (!tb_tunnel_is_dp(tunnel))
+				continue;
+
+			if (!tb_tunnel_port_on_path(tunnel, port))
+				continue;
+
+			ret = tb_tunnel_consumed_bandwidth(tunnel,
+							   &dp_consumed_up,
+							   &dp_consumed_down);
+			if (ret)
+				return ret;
+
+			up_bw -= dp_consumed_up;
+			down_bw -= dp_consumed_down;
+		}
+
+		/*
+		 * If USB3 is tunneled from the host router down to the
+		 * branch leading to port we need to take USB3 consumed
+		 * bandwidth into account regardless whether it actually
+		 * crosses the port.
+		 */
+		up_bw -= usb3_consumed_up;
+		down_bw -= usb3_consumed_down;
+
+		if (up_bw < *available_up)
+			*available_up = up_bw;
+		if (down_bw < *available_down)
+			*available_down = down_bw;
+	}
+
+	if (*available_up < 0)
+		*available_up = 0;
+	if (*available_down < 0)
+		*available_down = 0;
+
+	return 0;
+}
+
+static int tb_release_unused_usb3_bandwidth(struct tb *tb,
+					    struct tb_port *src_port,
+					    struct tb_port *dst_port)
+{
+	struct tb_tunnel *tunnel;
+
+	tunnel = tb_find_first_usb3_tunnel(tb, src_port, dst_port);
+	return tunnel ? tb_tunnel_release_unused_bandwidth(tunnel) : 0;
+}
+
+static void tb_reclaim_usb3_bandwidth(struct tb *tb, struct tb_port *src_port,
+				      struct tb_port *dst_port)
+{
+	int ret, available_up, available_down;
+	struct tb_tunnel *tunnel;
+
+	tunnel = tb_find_first_usb3_tunnel(tb, src_port, dst_port);
+	if (!tunnel)
+		return;
+
+	tb_dbg(tb, "reclaiming unused bandwidth for USB3\n");
+
+	/*
+	 * Calculate available bandwidth for the first hop USB3 tunnel.
+	 * That determines the whole USB3 bandwidth for this branch.
+	 */
+	ret = tb_available_bandwidth(tb, tunnel->src_port, tunnel->dst_port,
+				     &available_up, &available_down);
+	if (ret) {
+		tb_warn(tb, "failed to calculate available bandwidth\n");
+		return;
+	}
+
+	tb_dbg(tb, "available bandwidth for USB3 %d/%d Mb/s\n",
+	       available_up, available_down);
+
+	tb_tunnel_reclaim_available_bandwidth(tunnel, &available_up, &available_down);
+}
+
 static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
 {
 	struct tb_switch *parent = tb_switch_parent(sw);
+	int ret, available_up, available_down;
 	struct tb_port *up, *down, *port;
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel;
@@ -249,21 +427,48 @@ static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
 		parent_up = tb_switch_find_port(parent, TB_TYPE_USB3_UP);
 		if (!parent_up || !tb_port_is_enabled(parent_up))
 			return 0;
+
+		/* Make all unused bandwidth available for the new tunnel */
+		ret = tb_release_unused_usb3_bandwidth(tb, down, up);
+		if (ret)
+			return ret;
 	}
 
-	tunnel = tb_tunnel_alloc_usb3(tb, up, down);
-	if (!tunnel)
-		return -ENOMEM;
+	ret = tb_available_bandwidth(tb, down, up, &available_up,
+				     &available_down);
+	if (ret)
+		goto err_reclaim;
+
+	tb_port_dbg(up, "available bandwidth for new USB3 tunnel %d/%d Mb/s\n",
+		    available_up, available_down);
+
+	tunnel = tb_tunnel_alloc_usb3(tb, up, down, available_up,
+				      available_down);
+	if (!tunnel) {
+		ret = -ENOMEM;
+		goto err_reclaim;
+	}
 
 	if (tb_tunnel_activate(tunnel)) {
 		tb_port_info(up,
 			     "USB3 tunnel activation failed, aborting\n");
-		tb_tunnel_free(tunnel);
-		return -EIO;
+		ret = -EIO;
+		goto err_free;
 	}
 
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
+	if (tb_route(parent))
+		tb_reclaim_usb3_bandwidth(tb, down, up);
+
 	return 0;
+
+err_free:
+	tb_tunnel_free(tunnel);
+err_reclaim:
+	if (tb_route(parent))
+		tb_reclaim_usb3_bandwidth(tb, down, up);
+
+	return ret;
 }
 
 static int tb_create_usb3_tunnels(struct tb_switch *sw)
@@ -403,40 +608,40 @@ static void tb_scan_port(struct tb_port *port)
 	tb_scan_switch(sw);
 }
 
-static struct tb_tunnel *tb_find_tunnel(struct tb *tb, enum tb_tunnel_type type,
-					struct tb_port *src_port,
-					struct tb_port *dst_port)
-{
-	struct tb_cm *tcm = tb_priv(tb);
-	struct tb_tunnel *tunnel;
-
-	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
-		if (tunnel->type == type &&
-		    ((src_port && src_port == tunnel->src_port) ||
-		     (dst_port && dst_port == tunnel->dst_port))) {
-			return tunnel;
-		}
-	}
-
-	return NULL;
-}
-
 static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
 {
+	struct tb_port *src_port, *dst_port;
+	struct tb *tb;
+
 	if (!tunnel)
 		return;
 
 	tb_tunnel_deactivate(tunnel);
 	list_del(&tunnel->list);
 
-	/*
-	 * In case of DP tunnel make sure the DP IN resource is deallocated
-	 * properly.
-	 */
-	if (tb_tunnel_is_dp(tunnel)) {
-		struct tb_port *in = tunnel->src_port;
+	tb = tunnel->tb;
+	src_port = tunnel->src_port;
+	dst_port = tunnel->dst_port;
+
+	switch (tunnel->type) {
+	case TB_TUNNEL_DP:
+		/*
+		 * In case of DP tunnel make sure the DP IN resource is
+		 * deallocated properly.
+		 */
+		tb_switch_dealloc_dp_resource(src_port->sw, src_port);
+		fallthrough;
 
-		tb_switch_dealloc_dp_resource(in->sw, in);
+	case TB_TUNNEL_USB3:
+		tb_reclaim_usb3_bandwidth(tb, src_port, dst_port);
+		break;
+
+	default:
+		/*
+		 * PCIe and DMA tunnels do not consume guaranteed
+		 * bandwidth.
+		 */
+		break;
 	}
 
 	tb_tunnel_free(tunnel);
@@ -530,46 +735,6 @@ static struct tb_port *tb_find_pcie_down(struct tb_switch *sw,
 	return tb_find_unused_port(sw, TB_TYPE_PCIE_DOWN);
 }
 
-static int tb_available_bw(struct tb_cm *tcm, struct tb_port *in,
-			   struct tb_port *out)
-{
-	struct tb_switch *sw = out->sw;
-	struct tb_tunnel *tunnel;
-	int ret, bw, available_bw = 40000;
-
-	while (sw && sw != in->sw) {
-		bw = sw->link_speed * sw->link_width * 1000; /* Mb/s */
-		/* Leave 10% guard band */
-		bw -= bw / 10;
-
-		/*
-		 * Check for any active DP tunnels that go through this
-		 * switch and reduce their consumed bandwidth from
-		 * available.
-		 */
-		list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
-			int consumed_bw;
-
-			if (!tb_tunnel_switch_on_path(tunnel, sw))
-				continue;
-
-			ret = tb_tunnel_consumed_bandwidth(tunnel, NULL,
-							   &consumed_bw);
-			if (ret)
-				return ret;
-
-			bw -= consumed_bw;
-		}
-
-		if (bw < available_bw)
-			available_bw = bw;
-
-		sw = tb_switch_parent(sw);
-	}
-
-	return available_bw;
-}
-
 static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 {
 	struct tb_port *host_port, *port;
@@ -609,10 +774,10 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 
 static void tb_tunnel_dp(struct tb *tb)
 {
+	int available_up, available_down, ret;
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_port *port, *in, *out;
 	struct tb_tunnel *tunnel;
-	int available_bw;
 
 	/*
 	 * Find pair of inactive DP IN and DP OUT adapters and then
@@ -654,32 +819,41 @@ static void tb_tunnel_dp(struct tb *tb)
 		return;
 	}
 
-	/* Calculate available bandwidth between in and out */
-	available_bw = tb_available_bw(tcm, in, out);
-	if (available_bw < 0) {
-		tb_warn(tb, "failed to determine available bandwidth\n");
-		return;
+	/* Make all unused USB3 bandwidth available for the new DP tunnel */
+	ret = tb_release_unused_usb3_bandwidth(tb, in, out);
+	if (ret) {
+		tb_warn(tb, "failed to release unused bandwidth\n");
+		goto err_dealloc_dp;
 	}
 
-	tb_dbg(tb, "available bandwidth for new DP tunnel %u Mb/s\n",
-	       available_bw);
+	ret = tb_available_bandwidth(tb, in, out, &available_up,
+				     &available_down);
+	if (ret)
+		goto err_reclaim;
+
+	tb_dbg(tb, "available bandwidth for new DP tunnel %u/%u Mb/s\n",
+	       available_up, available_down);
 
-	tunnel = tb_tunnel_alloc_dp(tb, in, out, available_bw);
+	tunnel = tb_tunnel_alloc_dp(tb, in, out, available_up, available_down);
 	if (!tunnel) {
 		tb_port_dbg(out, "could not allocate DP tunnel\n");
-		goto dealloc_dp;
+		goto err_reclaim;
 	}
 
 	if (tb_tunnel_activate(tunnel)) {
 		tb_port_info(out, "DP tunnel activation failed, aborting\n");
-		tb_tunnel_free(tunnel);
-		goto dealloc_dp;
+		goto err_free;
 	}
 
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
+	tb_reclaim_usb3_bandwidth(tb, in, out);
 	return;
 
-dealloc_dp:
+err_free:
+	tb_tunnel_free(tunnel);
+err_reclaim:
+	tb_reclaim_usb3_bandwidth(tb, in, out);
+err_dealloc_dp:
 	tb_switch_dealloc_dp_resource(in->sw, in);
 }
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index c6f18200fe92..a62db231f07b 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -789,8 +789,8 @@ void tb_path_free(struct tb_path *path);
 int tb_path_activate(struct tb_path *path);
 void tb_path_deactivate(struct tb_path *path);
 bool tb_path_is_invalid(struct tb_path *path);
-bool tb_path_switch_on_path(const struct tb_path *path,
-			    const struct tb_switch *sw);
+bool tb_path_port_on_path(const struct tb_path *path,
+			  const struct tb_port *port);
 
 int tb_drom_read(struct tb_switch *sw);
 int tb_drom_read_uid_only(struct tb_switch *sw, u64 *uid);
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 7896f8b7a69c..2aae2c76d880 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -423,7 +423,7 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 	u32 out_dp_cap, out_rate, out_lanes, in_dp_cap, in_rate, in_lanes, bw;
 	struct tb_port *out = tunnel->dst_port;
 	struct tb_port *in = tunnel->src_port;
-	int ret;
+	int ret, max_bw;
 
 	/*
 	 * Copy DP_LOCAL_CAP register to DP_REMOTE_CAP register for
@@ -472,10 +472,15 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 	tb_port_dbg(out, "maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
 		    out_rate, out_lanes, bw);
 
-	if (tunnel->max_bw && bw > tunnel->max_bw) {
+	if (in->sw->config.depth < out->sw->config.depth)
+		max_bw = tunnel->max_down;
+	else
+		max_bw = tunnel->max_up;
+
+	if (max_bw && bw > max_bw) {
 		u32 new_rate, new_lanes, new_bw;
 
-		ret = tb_dp_reduce_bandwidth(tunnel->max_bw, in_rate, in_lanes,
+		ret = tb_dp_reduce_bandwidth(max_bw, in_rate, in_lanes,
 					     out_rate, out_lanes, &new_rate,
 					     &new_lanes);
 		if (ret) {
@@ -720,7 +725,10 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in)
  * @tb: Pointer to the domain structure
  * @in: DP in adapter port
  * @out: DP out adapter port
- * @max_bw: Maximum available bandwidth for the DP tunnel (%0 if not limited)
+ * @max_up: Maximum available upstream bandwidth for the DP tunnel (%0
+ *	    if not limited)
+ * @max_down: Maximum available downstream bandwidth for the DP tunnel
+ *	      (%0 if not limited)
  *
  * Allocates a tunnel between @in and @out that is capable of tunneling
  * Display Port traffic.
@@ -728,7 +736,8 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in)
  * Return: Returns a tb_tunnel on success or NULL on failure.
  */
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
-				     struct tb_port *out, int max_bw)
+				     struct tb_port *out, int max_up,
+				     int max_down)
 {
 	struct tb_tunnel *tunnel;
 	struct tb_path **paths;
@@ -746,7 +755,8 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	tunnel->consumed_bandwidth = tb_dp_consumed_bandwidth;
 	tunnel->src_port = in;
 	tunnel->dst_port = out;
-	tunnel->max_bw = max_bw;
+	tunnel->max_up = max_up;
+	tunnel->max_down = max_down;
 
 	paths = tunnel->paths;
 
@@ -866,6 +876,33 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 	return tunnel;
 }
 
+static int tb_usb3_max_link_rate(struct tb_port *up, struct tb_port *down)
+{
+	int ret, up_max_rate, down_max_rate;
+
+	ret = usb4_usb3_port_max_link_rate(up);
+	if (ret < 0)
+		return ret;
+	up_max_rate = ret;
+
+	ret = usb4_usb3_port_max_link_rate(down);
+	if (ret < 0)
+		return ret;
+	down_max_rate = ret;
+
+	return min(up_max_rate, down_max_rate);
+}
+
+static int tb_usb3_init(struct tb_tunnel *tunnel)
+{
+	tb_tunnel_dbg(tunnel, "allocating initial bandwidth %d/%d Mb/s\n",
+		      tunnel->allocated_up, tunnel->allocated_down);
+
+	return usb4_usb3_port_allocate_bandwidth(tunnel->src_port,
+						 &tunnel->allocated_up,
+						 &tunnel->allocated_down);
+}
+
 static int tb_usb3_activate(struct tb_tunnel *tunnel, bool activate)
 {
 	int res;
@@ -880,6 +917,86 @@ static int tb_usb3_activate(struct tb_tunnel *tunnel, bool activate)
 	return 0;
 }
 
+static int tb_usb3_consumed_bandwidth(struct tb_tunnel *tunnel,
+		int *consumed_up, int *consumed_down)
+{
+	/*
+	 * PCIe tunneling affects the USB3 bandwidth so take that it
+	 * into account here.
+	 */
+	*consumed_up = tunnel->allocated_up * (3 + 1) / 3;
+	*consumed_down = tunnel->allocated_down * (3 + 1) / 3;
+	return 0;
+}
+
+static int tb_usb3_release_unused_bandwidth(struct tb_tunnel *tunnel)
+{
+	int ret;
+
+	ret = usb4_usb3_port_release_bandwidth(tunnel->src_port,
+					       &tunnel->allocated_up,
+					       &tunnel->allocated_down);
+	if (ret)
+		return ret;
+
+	tb_tunnel_dbg(tunnel, "decreased bandwidth allocation to %d/%d Mb/s\n",
+		      tunnel->allocated_up, tunnel->allocated_down);
+	return 0;
+}
+
+static void tb_usb3_reclaim_available_bandwidth(struct tb_tunnel *tunnel,
+						int *available_up,
+						int *available_down)
+{
+	int ret, max_rate, allocate_up, allocate_down;
+
+	ret = usb4_usb3_port_actual_link_rate(tunnel->src_port);
+	if (ret <= 0) {
+		tb_tunnel_warn(tunnel, "tunnel is not up\n");
+		return;
+	}
+	/*
+	 * 90% of the max rate can be allocated for isochronous
+	 * transfers.
+	 */
+	max_rate = ret * 90 / 100;
+
+	/* No need to reclaim if already at maximum */
+	if (tunnel->allocated_up >= max_rate &&
+	    tunnel->allocated_down >= max_rate)
+		return;
+
+	/* Don't go lower than what is already allocated */
+	allocate_up = min(max_rate, *available_up);
+	if (allocate_up < tunnel->allocated_up)
+		allocate_up = tunnel->allocated_up;
+
+	allocate_down = min(max_rate, *available_down);
+	if (allocate_down < tunnel->allocated_down)
+		allocate_down = tunnel->allocated_down;
+
+	/* If no changes no need to do more */
+	if (allocate_up == tunnel->allocated_up &&
+	    allocate_down == tunnel->allocated_down)
+		return;
+
+	ret = usb4_usb3_port_allocate_bandwidth(tunnel->src_port, &allocate_up,
+						&allocate_down);
+	if (ret) {
+		tb_tunnel_info(tunnel, "failed to allocate bandwidth\n");
+		return;
+	}
+
+	tunnel->allocated_up = allocate_up;
+	*available_up -= tunnel->allocated_up;
+
+	tunnel->allocated_down = allocate_down;
+	*available_down -= tunnel->allocated_down;
+
+	tb_tunnel_dbg(tunnel, "increased bandwidth allocation to %d/%d Mb/s\n",
+		      tunnel->allocated_up, tunnel->allocated_down);
+}
+
 static void tb_usb3_init_path(struct tb_path *path)
 {
 	path->egress_fc_enable = TB_PATH_SOURCE | TB_PATH_INTERNAL;
@@ -960,6 +1077,29 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down)
 		goto err_deactivate;
 	}
 
+	if (!tb_route(down->sw)) {
+		int ret;
+
+		/*
+		 * Read the initial bandwidth allocation for the first
+		 * hop tunnel.
+		 */
+		ret = usb4_usb3_port_allocated_bandwidth(down,
+			&tunnel->allocated_up, &tunnel->allocated_down);
+		if (ret)
+			goto err_deactivate;
+
+		tb_tunnel_dbg(tunnel, "currently allocated bandwidth %d/%d Mb/s\n",
+			      tunnel->allocated_up, tunnel->allocated_down);
+
+		tunnel->init = tb_usb3_init;
+		tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
+		tunnel->release_unused_bandwidth =
+			tb_usb3_release_unused_bandwidth;
+		tunnel->reclaim_available_bandwidth =
+			tb_usb3_reclaim_available_bandwidth;
+	}
+
 	tb_tunnel_dbg(tunnel, "discovered\n");
 	return tunnel;
 
@@ -976,6 +1116,10 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down)
  * @tb: Pointer to the domain structure
  * @up: USB3 upstream adapter port
  * @down: USB3 downstream adapter port
+ * @max_up: Maximum available upstream bandwidth for the USB3 tunnel (%0
+ *	    if not limited).
+ * @max_down: Maximum available downstream bandwidth for the USB3 tunnel
+ *	      (%0 if not limited).
  *
  * Allocate an USB3 tunnel. The ports must be of type @TB_TYPE_USB3_UP and
  * @TB_TYPE_USB3_DOWN.
@@ -983,10 +1127,32 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down)
  * Return: Returns a tb_tunnel on success or %NULL on failure.
  */
 struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
-				       struct tb_port *down)
+				       struct tb_port *down, int max_up,
+				       int max_down)
 {
 	struct tb_tunnel *tunnel;
 	struct tb_path *path;
+	int max_rate = 0;
+
+	/*
+	 * Check that we have enough bandwidth available for the new
+	 * USB3 tunnel.
+	 */
+	if (max_up > 0 || max_down > 0) {
+		max_rate = tb_usb3_max_link_rate(down, up);
+		if (max_rate < 0)
+			return NULL;
+
+		/* Only 90% can be allocated for USB3 isochronous transfers */
+		max_rate = max_rate * 90 / 100;
+		tb_port_dbg(up, "required bandwidth for USB3 tunnel %d Mb/s\n",
+			    max_rate);
+
+		if (max_rate > max_up || max_rate > max_down) {
+			tb_port_warn(up, "not enough bandwidth for USB3 tunnel\n");
+			return NULL;
+		}
+	}
 
 	tunnel = tb_tunnel_alloc(tb, 2, TB_TUNNEL_USB3);
 	if (!tunnel)
@@ -995,6 +1161,8 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 	tunnel->activate = tb_usb3_activate;
 	tunnel->src_port = down;
 	tunnel->dst_port = up;
+	tunnel->max_up = max_up;
+	tunnel->max_down = max_down;
 
 	path = tb_path_alloc(tb, down, TB_USB3_HOPID, up, TB_USB3_HOPID, 0,
 			     "USB3 Down");
@@ -1014,6 +1182,18 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 	tb_usb3_init_path(path);
 	tunnel->paths[TB_USB3_PATH_UP] = path;
 
+	if (!tb_route(down->sw)) {
+		tunnel->allocated_up = max_rate;
+		tunnel->allocated_down = max_rate;
+
+		tunnel->init = tb_usb3_init;
+		tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
+		tunnel->release_unused_bandwidth =
+			tb_usb3_release_unused_bandwidth;
+		tunnel->reclaim_available_bandwidth =
+			tb_usb3_reclaim_available_bandwidth;
+	}
+
 	return tunnel;
 }
 
@@ -1146,22 +1326,23 @@ void tb_tunnel_deactivate(struct tb_tunnel *tunnel)
 }
 
 /**
- * tb_tunnel_switch_on_path() - Does the tunnel go through switch
+ * tb_tunnel_port_on_path() - Does the tunnel go through port
  * @tunnel: Tunnel to check
- * @sw: Switch to check
+ * @port: Port to check
  *
- * Returns true if @tunnel goes through @sw (direction does not matter),
+ * Returns true if @tunnel goes through @port (direction does not matter),
  * false otherwise.
  */
-bool tb_tunnel_switch_on_path(const struct tb_tunnel *tunnel,
-			      const struct tb_switch *sw)
+bool tb_tunnel_port_on_path(const struct tb_tunnel *tunnel,
+			    const struct tb_port *port)
 {
 	int i;
 
 	for (i = 0; i < tunnel->npaths; i++) {
 		if (!tunnel->paths[i])
 			continue;
-		if (tb_path_switch_on_path(tunnel->paths[i], sw))
+
+		if (tb_path_port_on_path(tunnel->paths[i], port))
 			return true;
 	}
 
@@ -1221,3 +1402,51 @@ int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 
 	return 0;
 }
+
+/**
+ * tb_tunnel_release_unused_bandwidth() - Release unused bandwidth
+ * @tunnel: Tunnel whose unused bandwidth to release
+ *
+ * If tunnel supports dynamic bandwidth management (USB3 tunnels at the
+ * moment) this function makes it to release all the unused bandwidth.
+ *
+ * Returns %0 in case of success and negative errno otherwise.
+ */
+int tb_tunnel_release_unused_bandwidth(struct tb_tunnel *tunnel)
+{
+	if (!tb_tunnel_is_active(tunnel))
+		return 0;
+
+	if (tunnel->release_unused_bandwidth) {
+		int ret;
+
+		ret = tunnel->release_unused_bandwidth(tunnel);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * tb_tunnel_reclaim_available_bandwidth() - Reclaim available bandwidth
+ * @tunnel: Tunnel reclaiming available bandwidth
+ * @available_up: Available upstream bandwidth (in Mb/s)
+ * @available_down: Available downstream bandwidth (in Mb/s)
+ *
+ * Reclaims bandwidth from @available_up and @available_down and updates
+ * the variables accordingly (e.g decreases both according to what was
+ * reclaimed by the tunnel). If nothing was reclaimed the values are
+ * kept as is.
+ */
+void tb_tunnel_reclaim_available_bandwidth(struct tb_tunnel *tunnel,
+					   int *available_up,
+					   int *available_down)
+{
+	if (!tb_tunnel_is_active(tunnel))
+		return;
+
+	if (tunnel->reclaim_available_bandwidth)
+		tunnel->reclaim_available_bandwidth(tunnel, available_up,
+						    available_down);
+}
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index cc952b2be792..1d2a64eb060d 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -29,10 +29,16 @@ enum tb_tunnel_type {
  * @init: Optional tunnel specific initialization
  * @activate: Optional tunnel specific activation/deactivation
  * @consumed_bandwidth: Return how much bandwidth the tunnel consumes
+ * @release_unused_bandwidth: Release all unused bandwidth
+ * @reclaim_available_bandwidth: Reclaim back available bandwidth
  * @list: Tunnels are linked using this field
  * @type: Type of the tunnel
- * @max_bw: Maximum bandwidth (Mb/s) available for the tunnel (only for DP).
+ * @max_up: Maximum upstream bandwidth (Mb/s) available for the tunnel.
  *	    Only set if the bandwidth needs to be limited.
+ * @max_down: Maximum downstream bandwidth (Mb/s) available for the tunnel.
+ *	      Only set if the bandwidth needs to be limited.
+ * @allocated_up: Allocated upstream bandwidth (only for USB3)
+ * @allocated_down: Allocated downstream bandwidth (only for USB3)
  */
 struct tb_tunnel {
 	struct tb *tb;
@@ -44,9 +50,16 @@ struct tb_tunnel {
 	int (*activate)(struct tb_tunnel *tunnel, bool activate);
 	int (*consumed_bandwidth)(struct tb_tunnel *tunnel, int *consumed_up,
 				  int *consumed_down);
+	int (*release_unused_bandwidth)(struct tb_tunnel *tunnel);
+	void (*reclaim_available_bandwidth)(struct tb_tunnel *tunnel,
+					    int *available_up,
+					    int *available_down);
 	struct list_head list;
 	enum tb_tunnel_type type;
-	unsigned int max_bw;
+	int max_up;
+	int max_down;
+	int allocated_up;
+	int allocated_down;
 };
 
 struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down);
@@ -54,24 +67,30 @@ struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
 				      struct tb_port *down);
 struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in);
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
-				     struct tb_port *out, int max_bw);
+				     struct tb_port *out, int max_up,
+				     int max_down);
 struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 				      struct tb_port *dst, int transmit_ring,
 				      int transmit_path, int receive_ring,
 				      int receive_path);
 struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down);
 struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
-				       struct tb_port *down);
+				       struct tb_port *down, int max_up,
+				       int max_down);
 
 void tb_tunnel_free(struct tb_tunnel *tunnel);
 int tb_tunnel_activate(struct tb_tunnel *tunnel);
 int tb_tunnel_restart(struct tb_tunnel *tunnel);
 void tb_tunnel_deactivate(struct tb_tunnel *tunnel);
 bool tb_tunnel_is_invalid(struct tb_tunnel *tunnel);
-bool tb_tunnel_switch_on_path(const struct tb_tunnel *tunnel,
-			      const struct tb_switch *sw);
+bool tb_tunnel_port_on_path(const struct tb_tunnel *tunnel,
+			    const struct tb_port *port);
 int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 				 int *consumed_down);
+int tb_tunnel_release_unused_bandwidth(struct tb_tunnel *tunnel);
+void tb_tunnel_reclaim_available_bandwidth(struct tb_tunnel *tunnel,
+					   int *available_up,
+					   int *available_down);
 
 static inline bool tb_tunnel_is_pci(const struct tb_tunnel *tunnel)
 {
-- 
2.27.0.rc2

