Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9021E18DF
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 13:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404973AbfJWLWm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 07:22:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:29707 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404885AbfJWLWI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 07:22:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 04:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; 
   d="scan'208";a="399359469"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2019 04:22:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A5660648; Wed, 23 Oct 2019 14:21:55 +0300 (EEST)
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
        Oliver Neukum <oneukum@suse.com>,
        Christian Kellner <ckellner@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/25] thunderbolt: Add bandwidth management for Display Port tunnels
Date:   Wed, 23 Oct 2019 14:21:45 +0300
Message-Id: <20191023112154.64235-17-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023112154.64235-1-mika.westerberg@linux.intel.com>
References: <20191023112154.64235-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Titan Ridge supports Display Port 1.4 which adds HBR3 (High Bit Rate)
rates that may be up to 8.1 Gb/s over 4 lanes. This translates to
effective data bandwidth of 25.92 Gb/s (as 8/10 encoding is removed by
the DP adapters when going over Thunderbolt fabric). If another high
rate monitor is connected we may need to reduce the bandwidth it
consumes so that it fits into the total 40 Gb/s available on the
Thunderbolt fabric.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c    |  22 +++
 drivers/thunderbolt/tb.c      |  52 ++++++-
 drivers/thunderbolt/tb.h      |   2 +
 drivers/thunderbolt/tb_regs.h |  17 ++
 drivers/thunderbolt/tunnel.c  | 282 +++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/tunnel.h  |  10 +-
 6 files changed, 381 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index 6cf66597d5d8..ad58559ea88e 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -557,3 +557,25 @@ bool tb_path_is_invalid(struct tb_path *path)
 	}
 	return false;
 }
+
+/**
+ * tb_path_switch_on_path() - Does the path go through certain switch
+ * @path: Path to check
+ * @sw: Switch to check
+ *
+ * Goes over all hops on path and checks if @sw is any of them.
+ * Direction does not matter.
+ */
+bool tb_path_switch_on_path(const struct tb_path *path,
+			    const struct tb_switch *sw)
+{
+	int i;
+
+	for (i = 0; i < path->path_length; i++) {
+		if (path->hops[i].in_port->sw == sw ||
+		    path->hops[i].out_port->sw == sw)
+			return true;
+	}
+
+	return false;
+}
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 8f58b9c3ef07..bb763a5cf103 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -422,11 +422,51 @@ static struct tb_port *tb_find_pcie_down(struct tb_switch *sw,
 	return tb_find_unused_port(sw, TB_TYPE_PCIE_DOWN);
 }
 
+static int tb_available_bw(struct tb_cm *tcm, struct tb_port *in,
+			   struct tb_port *out)
+{
+	struct tb_switch *sw = out->sw;
+	struct tb_tunnel *tunnel;
+	int bw, available_bw = 40000;
+
+	while (sw && sw != in->sw) {
+		bw = sw->link_speed * sw->link_width * 1000; /* Mb/s */
+		/* Leave 10% guard band */
+		bw -= bw / 10;
+
+		/*
+		 * Check for any active DP tunnels that go through this
+		 * switch and reduce their consumed bandwidth from
+		 * available.
+		 */
+		list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
+			int consumed_bw;
+
+			if (!tb_tunnel_switch_on_path(tunnel, sw))
+				continue;
+
+			consumed_bw = tb_tunnel_consumed_bandwidth(tunnel);
+			if (consumed_bw < 0)
+				return consumed_bw;
+
+			bw -= consumed_bw;
+		}
+
+		if (bw < available_bw)
+			available_bw = bw;
+
+		sw = tb_switch_parent(sw);
+	}
+
+	return available_bw;
+}
+
 static void tb_tunnel_dp(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_port *port, *in, *out;
 	struct tb_tunnel *tunnel;
+	int available_bw;
 
 	/*
 	 * Find pair of inactive DP IN and DP OUT adapters and then
@@ -464,7 +504,17 @@ static void tb_tunnel_dp(struct tb *tb)
 		return;
 	}
 
-	tunnel = tb_tunnel_alloc_dp(tb, in, out);
+	/* Calculate available bandwidth between in and out */
+	available_bw = tb_available_bw(tcm, in, out);
+	if (available_bw < 0) {
+		tb_warn(tb, "failed to determine available bandwidth\n");
+		return;
+	}
+
+	tb_dbg(tb, "available bandwidth for new DP tunnel %u Mb/s\n",
+	       available_bw);
+
+	tunnel = tb_tunnel_alloc_dp(tb, in, out, available_bw);
 	if (!tunnel) {
 		tb_port_dbg(out, "could not allocate DP tunnel\n");
 		goto dealloc_dp;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 5311e6e3f3df..ec851f20c571 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -691,6 +691,8 @@ void tb_path_free(struct tb_path *path);
 int tb_path_activate(struct tb_path *path);
 void tb_path_deactivate(struct tb_path *path);
 bool tb_path_is_invalid(struct tb_path *path);
+bool tb_path_switch_on_path(const struct tb_path *path,
+			    const struct tb_switch *sw);
 
 int tb_drom_read(struct tb_switch *sw);
 int tb_drom_read_uid_only(struct tb_switch *sw, u64 *uid);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index aec35e61cc14..7ee45b73c7f7 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -255,6 +255,23 @@ struct tb_regs_port_header {
 #define DP_STATUS_CTRL				0x06
 #define DP_STATUS_CTRL_CMHS			BIT(25)
 #define DP_STATUS_CTRL_UF			BIT(26)
+#define DP_COMMON_CAP				0x07
+/*
+ * DP_COMMON_CAP offsets work also for DP_LOCAL_CAP and DP_REMOTE_CAP
+ * with exception of DPRX done.
+ */
+#define DP_COMMON_CAP_RATE_MASK			GENMASK(11, 8)
+#define DP_COMMON_CAP_RATE_SHIFT		8
+#define DP_COMMON_CAP_RATE_RBR			0x0
+#define DP_COMMON_CAP_RATE_HBR			0x1
+#define DP_COMMON_CAP_RATE_HBR2			0x2
+#define DP_COMMON_CAP_RATE_HBR3			0x3
+#define DP_COMMON_CAP_LANES_MASK		GENMASK(14, 12)
+#define DP_COMMON_CAP_LANES_SHIFT		12
+#define DP_COMMON_CAP_1_LANE			0x0
+#define DP_COMMON_CAP_2_LANES			0x1
+#define DP_COMMON_CAP_4_LANES			0x2
+#define DP_COMMON_CAP_DPRX_DONE			BIT(31)
 
 /* PCIe adapter registers */
 #define ADP_PCIE_CS_0				0x00
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 009c2683a386..0d3463c4e24a 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -279,11 +279,138 @@ static int tb_dp_cm_handshake(struct tb_port *in, struct tb_port *out)
 	return -ETIMEDOUT;
 }
 
+static inline u32 tb_dp_cap_get_rate(u32 val)
+{
+	u32 rate = (val & DP_COMMON_CAP_RATE_MASK) >> DP_COMMON_CAP_RATE_SHIFT;
+
+	switch (rate) {
+	case DP_COMMON_CAP_RATE_RBR:
+		return 1620;
+	case DP_COMMON_CAP_RATE_HBR:
+		return 2700;
+	case DP_COMMON_CAP_RATE_HBR2:
+		return 5400;
+	case DP_COMMON_CAP_RATE_HBR3:
+		return 8100;
+	default:
+		return 0;
+	}
+}
+
+static inline u32 tb_dp_cap_set_rate(u32 val, u32 rate)
+{
+	val &= ~DP_COMMON_CAP_RATE_MASK;
+	switch (rate) {
+	default:
+		WARN(1, "invalid rate %u passed, defaulting to 1620 MB/s\n", rate);
+		/* Fallthrough */
+	case 1620:
+		val |= DP_COMMON_CAP_RATE_RBR << DP_COMMON_CAP_RATE_SHIFT;
+		break;
+	case 2700:
+		val |= DP_COMMON_CAP_RATE_HBR << DP_COMMON_CAP_RATE_SHIFT;
+		break;
+	case 5400:
+		val |= DP_COMMON_CAP_RATE_HBR2 << DP_COMMON_CAP_RATE_SHIFT;
+		break;
+	case 8100:
+		val |= DP_COMMON_CAP_RATE_HBR3 << DP_COMMON_CAP_RATE_SHIFT;
+		break;
+	}
+	return val;
+}
+
+static inline u32 tb_dp_cap_get_lanes(u32 val)
+{
+	u32 lanes = (val & DP_COMMON_CAP_LANES_MASK) >> DP_COMMON_CAP_LANES_SHIFT;
+
+	switch (lanes) {
+	case DP_COMMON_CAP_1_LANE:
+		return 1;
+	case DP_COMMON_CAP_2_LANES:
+		return 2;
+	case DP_COMMON_CAP_4_LANES:
+		return 4;
+	default:
+		return 0;
+	}
+}
+
+static inline u32 tb_dp_cap_set_lanes(u32 val, u32 lanes)
+{
+	val &= ~DP_COMMON_CAP_LANES_MASK;
+	switch (lanes) {
+	default:
+		WARN(1, "invalid number of lanes %u passed, defaulting to 1\n",
+		     lanes);
+		/* Fallthrough */
+	case 1:
+		val |= DP_COMMON_CAP_1_LANE << DP_COMMON_CAP_LANES_SHIFT;
+		break;
+	case 2:
+		val |= DP_COMMON_CAP_2_LANES << DP_COMMON_CAP_LANES_SHIFT;
+		break;
+	case 4:
+		val |= DP_COMMON_CAP_4_LANES << DP_COMMON_CAP_LANES_SHIFT;
+		break;
+	}
+	return val;
+}
+
+static unsigned int tb_dp_bandwidth(unsigned int rate, unsigned int lanes)
+{
+	/* Tunneling removes the DP 8b/10b encoding */
+	return rate * lanes * 8 / 10;
+}
+
+static int tb_dp_reduce_bandwidth(int max_bw, u32 in_rate, u32 in_lanes,
+				  u32 out_rate, u32 out_lanes, u32 *new_rate,
+				  u32 *new_lanes)
+{
+	static const u32 dp_bw[][2] = {
+		/* Mb/s, lanes */
+		{ 8100, 4 }, /* 25920 Mb/s */
+		{ 5400, 4 }, /* 17280 Mb/s */
+		{ 8100, 2 }, /* 12960 Mb/s */
+		{ 2700, 4 }, /* 8640 Mb/s */
+		{ 5400, 2 }, /* 8640 Mb/s */
+		{ 8100, 1 }, /* 6480 Mb/s */
+		{ 1620, 4 }, /* 5184 Mb/s */
+		{ 5400, 1 }, /* 4320 Mb/s */
+		{ 2700, 2 }, /* 4320 Mb/s */
+		{ 1620, 2 }, /* 2592 Mb/s */
+		{ 2700, 1 }, /* 2160 Mb/s */
+		{ 1620, 1 }, /* 1296 Mb/s */
+	};
+	unsigned int i;
+
+	/*
+	 * Find a combination that can fit into max_bw and does not
+	 * exceed the maximum rate and lanes supported by the DP OUT and
+	 * DP IN adapters.
+	 */
+	for (i = 0; i < ARRAY_SIZE(dp_bw); i++) {
+		if (dp_bw[i][0] > out_rate || dp_bw[i][1] > out_lanes)
+			continue;
+
+		if (dp_bw[i][0] > in_rate || dp_bw[i][1] > in_lanes)
+			continue;
+
+		if (tb_dp_bandwidth(dp_bw[i][0], dp_bw[i][1]) <= max_bw) {
+			*new_rate = dp_bw[i][0];
+			*new_lanes = dp_bw[i][1];
+			return 0;
+		}
+	}
+
+	return -ENOSR;
+}
+
 static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 {
+	u32 out_dp_cap, out_rate, out_lanes, in_dp_cap, in_rate, in_lanes, bw;
 	struct tb_port *out = tunnel->dst_port;
 	struct tb_port *in = tunnel->src_port;
-	u32 in_dp_cap, out_dp_cap;
 	int ret;
 
 	/*
@@ -318,6 +445,44 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 	if (ret)
 		return ret;
 
+	in_rate = tb_dp_cap_get_rate(in_dp_cap);
+	in_lanes = tb_dp_cap_get_lanes(in_dp_cap);
+	tb_port_dbg(in, "maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
+		    in_rate, in_lanes, tb_dp_bandwidth(in_rate, in_lanes));
+
+	/*
+	 * If the tunnel bandwidth is limited (max_bw is set) then see
+	 * if we need to reduce bandwidth to fit there.
+	 */
+	out_rate = tb_dp_cap_get_rate(out_dp_cap);
+	out_lanes = tb_dp_cap_get_lanes(out_dp_cap);
+	bw = tb_dp_bandwidth(out_rate, out_lanes);
+	tb_port_dbg(out, "maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
+		    out_rate, out_lanes, bw);
+
+	if (tunnel->max_bw && bw > tunnel->max_bw) {
+		u32 new_rate, new_lanes, new_bw;
+
+		ret = tb_dp_reduce_bandwidth(tunnel->max_bw, in_rate, in_lanes,
+					     out_rate, out_lanes, &new_rate,
+					     &new_lanes);
+		if (ret) {
+			tb_port_info(out, "not enough bandwidth for DP tunnel\n");
+			return ret;
+		}
+
+		new_bw = tb_dp_bandwidth(new_rate, new_lanes);
+		tb_port_dbg(out, "bandwidth reduced to %u Mb/s x%u = %u Mb/s\n",
+			    new_rate, new_lanes, new_bw);
+
+		/*
+		 * Set new rate and number of lanes before writing it to
+		 * the IN port remote caps.
+		 */
+		out_dp_cap = tb_dp_cap_set_rate(out_dp_cap, new_rate);
+		out_dp_cap = tb_dp_cap_set_lanes(out_dp_cap, new_lanes);
+	}
+
 	return tb_port_write(in, &out_dp_cap, TB_CFG_PORT,
 			     in->cap_adap + DP_REMOTE_CAP, 1);
 }
@@ -359,6 +524,56 @@ static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
 	return 0;
 }
 
+static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel)
+{
+	struct tb_port *in = tunnel->src_port;
+	const struct tb_switch *sw = in->sw;
+	u32 val, rate = 0, lanes = 0;
+	int ret;
+
+	if (tb_switch_is_titan_ridge(sw)) {
+		int timeout = 10;
+
+		/*
+		 * Wait for DPRX done. Normally it should be already set
+		 * for active tunnel.
+		 */
+		do {
+			ret = tb_port_read(in, &val, TB_CFG_PORT,
+					   in->cap_adap + DP_COMMON_CAP, 1);
+			if (ret)
+				return ret;
+
+			if (val & DP_COMMON_CAP_DPRX_DONE) {
+				rate = tb_dp_cap_get_rate(val);
+				lanes = tb_dp_cap_get_lanes(val);
+				break;
+			}
+			msleep(250);
+		} while (timeout--);
+
+		if (!timeout)
+			return -ETIMEDOUT;
+	} else if (sw->generation >= 2) {
+		/*
+		 * Read from the copied remote cap so that we take into
+		 * account if capabilities were reduced during exchange.
+		 */
+		ret = tb_port_read(in, &val, TB_CFG_PORT,
+				   in->cap_adap + DP_REMOTE_CAP, 1);
+		if (ret)
+			return ret;
+
+		rate = tb_dp_cap_get_rate(val);
+		lanes = tb_dp_cap_get_lanes(val);
+	} else {
+		/* No bandwidth management for legacy devices  */
+		return 0;
+	}
+
+	return tb_dp_bandwidth(rate, lanes);
+}
+
 static void tb_dp_init_aux_path(struct tb_path *path)
 {
 	int i;
@@ -423,6 +638,7 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in)
 
 	tunnel->init = tb_dp_xchg_caps;
 	tunnel->activate = tb_dp_activate;
+	tunnel->consumed_bandwidth = tb_dp_consumed_bandwidth;
 	tunnel->src_port = in;
 
 	path = tb_path_discover(in, TB_DP_VIDEO_HOPID, NULL, -1,
@@ -481,6 +697,7 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in)
  * @tb: Pointer to the domain structure
  * @in: DP in adapter port
  * @out: DP out adapter port
+ * @max_bw: Maximum available bandwidth for the DP tunnel (%0 if not limited)
  *
  * Allocates a tunnel between @in and @out that is capable of tunneling
  * Display Port traffic.
@@ -488,7 +705,7 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in)
  * Return: Returns a tb_tunnel on success or NULL on failure.
  */
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
-				     struct tb_port *out)
+				     struct tb_port *out, int max_bw)
 {
 	struct tb_tunnel *tunnel;
 	struct tb_path **paths;
@@ -503,8 +720,10 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 
 	tunnel->init = tb_dp_xchg_caps;
 	tunnel->activate = tb_dp_activate;
+	tunnel->consumed_bandwidth = tb_dp_consumed_bandwidth;
 	tunnel->src_port = in;
 	tunnel->dst_port = out;
+	tunnel->max_bw = max_bw;
 
 	paths = tunnel->paths;
 
@@ -751,3 +970,62 @@ void tb_tunnel_deactivate(struct tb_tunnel *tunnel)
 			tb_path_deactivate(tunnel->paths[i]);
 	}
 }
+
+/**
+ * tb_tunnel_switch_on_path() - Does the tunnel go through switch
+ * @tunnel: Tunnel to check
+ * @sw: Switch to check
+ *
+ * Returns true if @tunnel goes through @sw (direction does not matter),
+ * false otherwise.
+ */
+bool tb_tunnel_switch_on_path(const struct tb_tunnel *tunnel,
+			      const struct tb_switch *sw)
+{
+	int i;
+
+	for (i = 0; i < tunnel->npaths; i++) {
+		if (!tunnel->paths[i])
+			continue;
+		if (tb_path_switch_on_path(tunnel->paths[i], sw))
+			return true;
+	}
+
+	return false;
+}
+
+static bool tb_tunnel_is_active(const struct tb_tunnel *tunnel)
+{
+	int i;
+
+	for (i = 0; i < tunnel->npaths; i++) {
+		if (!tunnel->paths[i])
+			return false;
+		if (!tunnel->paths[i]->activated)
+			return false;
+	}
+
+	return true;
+}
+
+/**
+ * tb_tunnel_consumed_bandwidth() - Return bandwidth consumed by the tunnel
+ * @tunnel: Tunnel to check
+ *
+ * Returns bandwidth currently consumed by @tunnel and %0 if the @tunnel
+ * is not active or does consume bandwidth.
+ */
+int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel)
+{
+	if (!tb_tunnel_is_active(tunnel))
+		return 0;
+
+	if (tunnel->consumed_bandwidth) {
+		int ret = tunnel->consumed_bandwidth(tunnel);
+
+		tb_tunnel_dbg(tunnel, "consumed bandwidth %d Mb/s\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index c68bbcd3a62c..ba888da005f5 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -27,8 +27,11 @@ enum tb_tunnel_type {
  * @npaths: Number of paths in @paths
  * @init: Optional tunnel specific initialization
  * @activate: Optional tunnel specific activation/deactivation
+ * @consumed_bandwidth: Return how much bandwidth the tunnel consumes
  * @list: Tunnels are linked using this field
  * @type: Type of the tunnel
+ * @max_bw: Maximum bandwidth (Mb/s) available for the tunnel (only for DP).
+ *	    Only set if the bandwidth needs to be limited.
  */
 struct tb_tunnel {
 	struct tb *tb;
@@ -38,8 +41,10 @@ struct tb_tunnel {
 	size_t npaths;
 	int (*init)(struct tb_tunnel *tunnel);
 	int (*activate)(struct tb_tunnel *tunnel, bool activate);
+	int (*consumed_bandwidth)(struct tb_tunnel *tunnel);
 	struct list_head list;
 	enum tb_tunnel_type type;
+	unsigned int max_bw;
 };
 
 struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down);
@@ -47,7 +52,7 @@ struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
 				      struct tb_port *down);
 struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in);
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
-				     struct tb_port *out);
+				     struct tb_port *out, int max_bw);
 struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 				      struct tb_port *dst, int transmit_ring,
 				      int transmit_path, int receive_ring,
@@ -58,6 +63,9 @@ int tb_tunnel_activate(struct tb_tunnel *tunnel);
 int tb_tunnel_restart(struct tb_tunnel *tunnel);
 void tb_tunnel_deactivate(struct tb_tunnel *tunnel);
 bool tb_tunnel_is_invalid(struct tb_tunnel *tunnel);
+bool tb_tunnel_switch_on_path(const struct tb_tunnel *tunnel,
+			      const struct tb_switch *sw);
+int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel);
 
 static inline bool tb_tunnel_is_pci(const struct tb_tunnel *tunnel)
 {
-- 
2.23.0

