Return-Path: <linux-usb+bounces-1135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC137B9DA3
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 15:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 98E24B20A2F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 13:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5A027ED1;
	Thu,  5 Oct 2023 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lG4tQ52w"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE9326E2A
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 13:50:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5E92728
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513852; x=1728049852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eaHk3WE9kfW3kOx+OZZnqgR4jyvZaYRdrOlDVwcMrsA=;
  b=lG4tQ52w6ggwSZAu4nWmuY7gjPm5+0Bpa6kKB7pATQgYmAsI98MOrcZp
   d5vTaAOexRIxF/fCCe4nT/GNCY/Z3tKRJWEY6jkdJa4OqIWbOp6OKo8J+
   s2IJjvJvOr7P5juWORHp/qImSEL2UDskczDBueg+VurRknBi1koOAH/Kq
   QioABl5H8Erg0ydm8IJbNsX4FRjLjETqCr03lRpv6MXqwVWteNZz43OqM
   8MD1i5N9H9SdiAcNQIT+RJmMC6D+CecVx0Zavuf7bvsDB/bEJnWNe8DkJ
   77nbeFj1ebk35d5XIQE8H1aP+iCTtdD/ZHYZA9gujxVBIpozkAe9MMKpd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368524206"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="368524206"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:27:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="822054751"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="822054751"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 05 Oct 2023 02:27:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5C5F4666; Thu,  5 Oct 2023 12:27:30 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 10/10] thunderbolt: Configure asymmetric link if needed and bandwidth allows
Date: Thu,  5 Oct 2023 12:27:29 +0300
Message-Id: <20231005092729.3595447-11-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
References: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Gil Fine <gil.fine@linux.intel.com>

USB4 v2 spec defines a Gen 4 link that can operate as an asymmetric
120/40G. When the link is asymmetric, the USB4 port on one side of the
link operates with three TX lanes and one RX lane, while the USB4 port
on the opposite side of the link operates with three RX lanes and one TX
lane. Using asymmetric link we can get much more bandwidth from one
direction and that allows us to support the new Ultra High Bit Rate
DisplayPort modes (that consume up to 77.37 Gb/s).

Add the basic logic for changing Gen 4 links to asymmetric and back
following the below rules:

  1) The default threshold is 45 Gb/s (tunable by asym_threshold)
  2) Only DisplayPort that supports bandwidth allocation mode, can cause a
     transition of a link to asymmetric or symmetric, by issuing a bandwidth
     request (or when a DisplayPort tunnel is torn down)
  3) Only DisplayPort bandwidth on a link, is taken into account when
     deciding whether a link is transitioned to asymmetric or symmetric
  4) If bandwidth on a link is >= asym_threshold transition the link to
     asymmetric
  5) If bandwidth on a link < asym_threshold transition the link to
     symmetric (unless the bandwidth request is above currently
     allocated on a tunnel).
  6) If a USB4 v2 device router that does not support asymmetric link is
     connected, transition all the links above it to symmetric if
     the bandwidth allows.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Co-developed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 674 ++++++++++++++++++++++++++++++++-------
 1 file changed, 551 insertions(+), 123 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 67c56337a4d2..407d6af6b603 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -16,8 +16,31 @@
 #include "tb_regs.h"
 #include "tunnel.h"
 
-#define TB_TIMEOUT	100	/* ms */
-#define MAX_GROUPS	7	/* max Group_ID is 7 */
+#define TB_TIMEOUT		100	/* ms */
+
+/*
+ * Minimum bandwidth (in Mb/s) that is needed in the single transmitter/receiver
+ * direction. This is 40G - 10% guard band bandwidth.
+ */
+#define TB_ASYM_MIN		(40000 * 90 / 100)
+
+/*
+ * Threshold bandwidth (in Mb/s) that is used to switch the links to
+ * asymmetric and back. This is selected as 45G which means when the
+ * request is higher than this, we switch the link to asymmetric, and
+ * when it is less than this we switch it back. The 45G is selected so
+ * that we still have 27G (of the total 72G) for bulk PCIe traffic when
+ * switching back to symmetric.
+ */
+#define TB_ASYM_THRESHOLD	45000
+
+#define MAX_GROUPS		7	/* max Group_ID is 7 */
+
+static unsigned int asym_threshold = TB_ASYM_THRESHOLD;
+module_param_named(asym_threshold, asym_threshold, uint, 0444);
+MODULE_PARM_DESC(asym_threshold,
+		"threshold (Mb/s) when to Gen 4 switch link symmetry. 0 disables. (default: "
+		__MODULE_STRING(TB_ASYM_THRESHOLD) ")");
 
 /**
  * struct tb_cm - Simple Thunderbolt connection manager
@@ -285,14 +308,32 @@ static int tb_enable_clx(struct tb_switch *sw)
 	return ret == -EOPNOTSUPP ? 0 : ret;
 }
 
-/* Disables CL states up to the host router */
-static void tb_disable_clx(struct tb_switch *sw)
+/**
+ * tb_disable_clx() - Disable CL states up to host router
+ * @sw: Router to start
+ *
+ * Disables CL states from @sw up to the host router. Returns true if
+ * any CL state were disabled. This can be used to figure out whether
+ * the link was setup by us or the boot firmware so we don't
+ * accidentally enable them if they were not enabled during discovery.
+ */
+static bool tb_disable_clx(struct tb_switch *sw)
 {
+	bool disabled = false;
+
 	do {
-		if (tb_switch_clx_disable(sw) < 0)
+		int ret;
+
+		ret = tb_switch_clx_disable(sw);
+		if (ret > 0)
+			disabled = true;
+		else if (ret < 0)
 			tb_sw_warn(sw, "failed to disable CL states\n");
+
 		sw = tb_switch_parent(sw);
 	} while (sw);
+
+	return disabled;
 }
 
 static int tb_increase_switch_tmu_accuracy(struct device *dev, void *data)
@@ -572,144 +613,294 @@ static struct tb_tunnel *tb_find_first_usb3_tunnel(struct tb *tb,
 	return tb_find_tunnel(tb, TB_TUNNEL_USB3, usb3_down, NULL);
 }
 
-static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
-	struct tb_port *dst_port, int *available_up, int *available_down)
-{
-	int usb3_consumed_up, usb3_consumed_down, ret;
-	struct tb_cm *tcm = tb_priv(tb);
+/**
+ * tb_consumed_usb3_pcie_bandwidth() - Consumed USB3/PCIe bandwidth over a single link
+ * @tb: Domain structure
+ * @src_port: Source protocol adapter
+ * @dst_port: Destination protocol adapter
+ * @port: USB4 port the consumed bandwidth is calculated
+ * @consumed_up: Consumed upsream bandwidth (Mb/s)
+ * @consumed_down: Consumed downstream bandwidth (Mb/s)
+ *
+ * Calculates consumed USB3 and PCIe bandwidth at @port between path
+ * from @src_port to @dst_port. Does not take tunnel starting from
+ * @src_port and ending from @src_port into account.
+ */
+static int tb_consumed_usb3_pcie_bandwidth(struct tb *tb,
+					   struct tb_port *src_port,
+					   struct tb_port *dst_port,
+					   struct tb_port *port,
+					   int *consumed_up,
+					   int *consumed_down)
+{
+	int pci_consumed_up, pci_consumed_down;
 	struct tb_tunnel *tunnel;
-	struct tb_port *port;
 
-	tb_dbg(tb, "calculating available bandwidth between %llx:%u <-> %llx:%u\n",
-	       tb_route(src_port->sw), src_port->port, tb_route(dst_port->sw),
-	       dst_port->port);
+	*consumed_up = *consumed_down = 0;
 
 	tunnel = tb_find_first_usb3_tunnel(tb, src_port, dst_port);
 	if (tunnel && tunnel->src_port != src_port &&
 	    tunnel->dst_port != dst_port) {
-		ret = tb_tunnel_consumed_bandwidth(tunnel, &usb3_consumed_up,
-						   &usb3_consumed_down);
+		int ret;
+
+		ret = tb_tunnel_consumed_bandwidth(tunnel, consumed_up,
+						   consumed_down);
 		if (ret)
 			return ret;
-	} else {
-		usb3_consumed_up = 0;
-		usb3_consumed_down = 0;
 	}
 
-	/* Maximum possible bandwidth asymmetric Gen 4 link is 120 Gb/s */
-	*available_up = *available_down = 120000;
+	/*
+	 * If there is anything reserved for PCIe bulk traffic take it
+	 * into account here too.
+	 */
+	if (tb_tunnel_reserved_pci(port, &pci_consumed_up, &pci_consumed_down)) {
+		*consumed_up += pci_consumed_up;
+		*consumed_down += pci_consumed_down;
+	}
 
-	/* Find the minimum available bandwidth over all links */
-	tb_for_each_port_on_path(src_port, dst_port, port) {
-		int link_speed, link_width, up_bw, down_bw;
-		int pci_reserved_up, pci_reserved_down;
+	return 0;
+}
 
-		if (!tb_port_is_null(port))
+/**
+ * tb_consumed_dp_bandwidth() - Consumed DP bandwidth over a single link
+ * @tb: Domain structure
+ * @src_port: Source protocol adapter
+ * @dst_port: Destination protocol adapter
+ * @port: USB4 port the consumed bandwidth is calculated
+ * @consumed_up: Consumed upsream bandwidth (Mb/s)
+ * @consumed_down: Consumed downstream bandwidth (Mb/s)
+ *
+ * Calculates consumed DP bandwidth at @port between path from @src_port
+ * to @dst_port. Does not take tunnel starting from @src_port and ending
+ * from @src_port into account.
+ */
+static int tb_consumed_dp_bandwidth(struct tb *tb,
+				    struct tb_port *src_port,
+				    struct tb_port *dst_port,
+				    struct tb_port *port,
+				    int *consumed_up,
+				    int *consumed_down)
+{
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_tunnel *tunnel;
+	int ret;
+
+	*consumed_up = *consumed_down = 0;
+
+	/*
+	 * Find all DP tunnels that cross the port and reduce
+	 * their consumed bandwidth from the available.
+	 */
+	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
+		int dp_consumed_up, dp_consumed_down;
+
+		if (tb_tunnel_is_invalid(tunnel))
+			continue;
+
+		if (!tb_tunnel_is_dp(tunnel))
+			continue;
+
+		if (!tb_tunnel_port_on_path(tunnel, port))
+			continue;
+
+		/*
+		 * Ignore the DP tunnel between src_port and dst_port
+		 * because it is the same tunnel and we may be
+		 * re-calculating estimated bandwidth.
+		 */
+		if (tunnel->src_port == src_port &&
+		    tunnel->dst_port == dst_port)
 			continue;
 
-		if (tb_is_upstream_port(port)) {
-			link_speed = port->sw->link_speed;
+		ret = tb_tunnel_consumed_bandwidth(tunnel, &dp_consumed_up,
+						   &dp_consumed_down);
+		if (ret)
+			return ret;
+
+		*consumed_up += dp_consumed_up;
+		*consumed_down += dp_consumed_down;
+	}
+
+	return 0;
+}
+
+static bool tb_asym_supported(struct tb_port *src_port, struct tb_port *dst_port,
+			      struct tb_port *port)
+{
+	bool downstream = tb_port_path_direction_downstream(src_port, dst_port);
+	enum tb_link_width width;
+
+	if (tb_is_upstream_port(port))
+		width = downstream ? TB_LINK_WIDTH_ASYM_RX : TB_LINK_WIDTH_ASYM_TX;
+	else
+		width = downstream ? TB_LINK_WIDTH_ASYM_TX : TB_LINK_WIDTH_ASYM_RX;
+
+	return tb_port_width_supported(port, width);
+}
+
+/**
+ * tb_maximum_banwidth() - Maximum bandwidth over a single link
+ * @tb: Domain structure
+ * @src_port: Source protocol adapter
+ * @dst_port: Destination protocol adapter
+ * @port: USB4 port the total bandwidth is calculated
+ * @max_up: Maximum upstream bandwidth (Mb/s)
+ * @max_down: Maximum downstream bandwidth (Mb/s)
+ * @include_asym: Include bandwidth if the link is switched from
+ *		  symmetric to asymmetric
+ *
+ * Returns maximum possible bandwidth in @max_up and @max_down over a
+ * single link at @port. If @include_asym is set then includes the
+ * additional banwdith if the links are transitioned into asymmetric to
+ * direction from @src_port to @dst_port.
+ */
+static int tb_maximum_bandwidth(struct tb *tb, struct tb_port *src_port,
+				struct tb_port *dst_port, struct tb_port *port,
+				int *max_up, int *max_down, bool include_asym)
+{
+	bool downstream = tb_port_path_direction_downstream(src_port, dst_port);
+	int link_speed, link_width, up_bw, down_bw;
+
+	/*
+	 * Can include asymmetric, only if it is actually supported by
+	 * the lane adapter.
+	 */
+	if (!tb_asym_supported(src_port, dst_port, port))
+		include_asym = false;
+
+	if (tb_is_upstream_port(port)) {
+		link_speed = port->sw->link_speed;
+		/*
+		 * sw->link_width is from upstream perspective so we use
+		 * the opposite for downstream of the host router.
+		 */
+		if (port->sw->link_width == TB_LINK_WIDTH_ASYM_TX) {
+			up_bw = link_speed * 3 * 1000;
+			down_bw = link_speed * 1 * 1000;
+		} else if (port->sw->link_width == TB_LINK_WIDTH_ASYM_RX) {
+			up_bw = link_speed * 1 * 1000;
+			down_bw = link_speed * 3 * 1000;
+		} else if (include_asym) {
 			/*
-			 * sw->link_width is from upstream perspective
-			 * so we use the opposite for downstream of the
-			 * host router.
+			 * The link is symmetric at the moment but we
+			 * can switch it to asymmetric as needed. Report
+			 * this bandwidth as available (even though it
+			 * is not yet enabled).
 			 */
-			if (port->sw->link_width == TB_LINK_WIDTH_ASYM_TX) {
-				up_bw = link_speed * 3 * 1000;
-				down_bw = link_speed * 1 * 1000;
-			} else if (port->sw->link_width == TB_LINK_WIDTH_ASYM_RX) {
+			if (downstream) {
 				up_bw = link_speed * 1 * 1000;
 				down_bw = link_speed * 3 * 1000;
 			} else {
-				up_bw = link_speed * port->sw->link_width * 1000;
-				down_bw = up_bw;
+				up_bw = link_speed * 3 * 1000;
+				down_bw = link_speed * 1 * 1000;
 			}
 		} else {
-			link_speed = tb_port_get_link_speed(port);
-			if (link_speed < 0)
-				return link_speed;
-
-			link_width = tb_port_get_link_width(port);
-			if (link_width < 0)
-				return link_width;
-
-			if (link_width == TB_LINK_WIDTH_ASYM_TX) {
+			up_bw = link_speed * port->sw->link_width * 1000;
+			down_bw = up_bw;
+		}
+	} else {
+		link_speed = tb_port_get_link_speed(port);
+		if (link_speed < 0)
+			return link_speed;
+
+		link_width = tb_port_get_link_width(port);
+		if (link_width < 0)
+			return link_width;
+
+		if (link_width == TB_LINK_WIDTH_ASYM_TX) {
+			up_bw = link_speed * 1 * 1000;
+			down_bw = link_speed * 3 * 1000;
+		} else if (link_width == TB_LINK_WIDTH_ASYM_RX) {
+			up_bw = link_speed * 3 * 1000;
+			down_bw = link_speed * 1 * 1000;
+		} else if (include_asym) {
+			/*
+			 * The link is symmetric at the moment but we
+			 * can switch it to asymmetric as needed. Report
+			 * this bandwidth as available (even though it
+			 * is not yet enabled).
+			 */
+			if (downstream) {
 				up_bw = link_speed * 1 * 1000;
 				down_bw = link_speed * 3 * 1000;
-			} else if (link_width == TB_LINK_WIDTH_ASYM_RX) {
+			} else {
 				up_bw = link_speed * 3 * 1000;
 				down_bw = link_speed * 1 * 1000;
-			} else {
-				up_bw = link_speed * link_width * 1000;
-				down_bw = up_bw;
 			}
+		} else {
+			up_bw = link_speed * link_width * 1000;
+			down_bw = up_bw;
 		}
+	}
 
-		/* Leave 10% guard band */
-		up_bw -= up_bw / 10;
-		down_bw -= down_bw / 10;
-
-		tb_port_dbg(port, "link total bandwidth %d/%d Mb/s\n", up_bw,
-			    down_bw);
-
-		/*
-		 * Find all DP tunnels that cross the port and reduce
-		 * their consumed bandwidth from the available.
-		 */
-		list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
-			int dp_consumed_up, dp_consumed_down;
+	/* Leave 10% guard band */
+	*max_up = up_bw - up_bw / 10;
+	*max_down = down_bw - down_bw / 10;
 
-			if (tb_tunnel_is_invalid(tunnel))
-				continue;
+	tb_port_dbg(port, "link maximum bandwidth %d/%d Mb/s\n", *max_up, *max_down);
+	return 0;
+}
 
-			if (!tb_tunnel_is_dp(tunnel))
-				continue;
+/**
+ * tb_available_bandwidth() - Available bandwidth for tunneling
+ * @tb: Domain structure
+ * @src_port: Source protocol adapter
+ * @dst_port: Destination protocol adapter
+ * @available_up: Available bandwidth upstream (Mb/s)
+ * @available_down: Available bandwidth downstream (Mb/s)
+ * @include_asym: Include bandwidth if the link is switched from
+ *		  symmetric to asymmetric
+ *
+ * Calculates maximum available bandwidth for protocol tunneling between
+ * @src_port and @dst_port at the moment. This is minimum of maximum
+ * link bandwidth across all links reduced by currently consumed
+ * bandwidth on that link.
+ *
+ * If @include_asym is true then includes also bandwidth that can be
+ * added when the links are transitioned into asymmetric (but does not
+ * transition the links).
+ */
+static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
+				 struct tb_port *dst_port, int *available_up,
+				 int *available_down, bool include_asym)
+{
+	struct tb_port *port;
+	int ret;
 
-			if (!tb_tunnel_port_on_path(tunnel, port))
-				continue;
+	/* Maximum possible bandwidth asymmetric Gen 4 link is 120 Gb/s */
+	*available_up = *available_down = 120000;
 
-			/*
-			 * Ignore the DP tunnel between src_port and
-			 * dst_port because it is the same tunnel and we
-			 * may be re-calculating estimated bandwidth.
-			 */
-			if (tunnel->src_port == src_port &&
-			    tunnel->dst_port == dst_port)
-				continue;
+	/* Find the minimum available bandwidth over all links */
+	tb_for_each_port_on_path(src_port, dst_port, port) {
+		int max_up, max_down, consumed_up, consumed_down;
 
-			ret = tb_tunnel_consumed_bandwidth(tunnel,
-							   &dp_consumed_up,
-							   &dp_consumed_down);
-			if (ret)
-				return ret;
+		if (!tb_port_is_null(port))
+			continue;
 
-			up_bw -= dp_consumed_up;
-			down_bw -= dp_consumed_down;
-		}
+		ret = tb_maximum_bandwidth(tb, src_port, dst_port, port,
+					   &max_up, &max_down, include_asym);
+		if (ret)
+			return ret;
 
-		/*
-		 * If USB3 is tunneled from the host router down to the
-		 * branch leading to port we need to take USB3 consumed
-		 * bandwidth into account regardless whether it actually
-		 * crosses the port.
-		 */
-		up_bw -= usb3_consumed_up;
-		down_bw -= usb3_consumed_down;
+		ret = tb_consumed_usb3_pcie_bandwidth(tb, src_port, dst_port,
+						      port, &consumed_up,
+						      &consumed_down);
+		if (ret)
+			return ret;
+		max_up -= consumed_up;
+		max_down -= consumed_down;
 
-		/*
-		 * If there is anything reserved for PCIe bulk traffic
-		 * take it into account here too.
-		 */
-		if (tb_tunnel_reserved_pci(port, &pci_reserved_up,
-					   &pci_reserved_down)) {
-			up_bw -= pci_reserved_up;
-			down_bw -= pci_reserved_down;
-		}
+		ret = tb_consumed_dp_bandwidth(tb, src_port, dst_port, port,
+					       &consumed_up, &consumed_down);
+		if (ret)
+			return ret;
+		max_up -= consumed_up;
+		max_down -= consumed_down;
 
-		if (up_bw < *available_up)
-			*available_up = up_bw;
-		if (down_bw < *available_down)
-			*available_down = down_bw;
+		if (max_up < *available_up)
+			*available_up = max_up;
+		if (max_down < *available_down)
+			*available_down = max_down;
 	}
 
 	if (*available_up < 0)
@@ -747,7 +938,7 @@ static void tb_reclaim_usb3_bandwidth(struct tb *tb, struct tb_port *src_port,
 	 * That determines the whole USB3 bandwidth for this branch.
 	 */
 	ret = tb_available_bandwidth(tb, tunnel->src_port, tunnel->dst_port,
-				     &available_up, &available_down);
+				     &available_up, &available_down, false);
 	if (ret) {
 		tb_tunnel_warn(tunnel, "failed to calculate available bandwidth\n");
 		return;
@@ -805,8 +996,8 @@ static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
 			return ret;
 	}
 
-	ret = tb_available_bandwidth(tb, down, up, &available_up,
-				     &available_down);
+	ret = tb_available_bandwidth(tb, down, up, &available_up, &available_down,
+				     false);
 	if (ret)
 		goto err_reclaim;
 
@@ -867,6 +1058,226 @@ static int tb_create_usb3_tunnels(struct tb_switch *sw)
 	return 0;
 }
 
+/**
+ * tb_configure_asym() - Transition links to asymmetric if needed
+ * @tb: Domain structure
+ * @src_port: Source adapter to start the transition
+ * @dst_port: Destination adapter
+ * @requested_up: Additional bandwidth (Mb/s) required upstream
+ * @requested_down: Additional bandwidth (Mb/s) required downstream
+ *
+ * Transition links between @src_port and @dst_port into asymmetric, with
+ * three lanes in the direction from @src_port towards @dst_port and one lane
+ * in the opposite direction, if the bandwidth requirements
+ * (requested + currently consumed) on that link exceed @asym_threshold.
+ *
+ * Must be called with available >= requested over all links.
+ */
+static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
+			     struct tb_port *dst_port, int requested_up,
+			     int requested_down)
+{
+	struct tb_switch *sw;
+	bool clx, downstream;
+	struct tb_port *up;
+	int ret = 0;
+
+	if (!asym_threshold)
+		return 0;
+
+	/* Disable CL states before doing any transitions */
+	downstream = tb_port_path_direction_downstream(src_port, dst_port);
+	/* Pick up router deepest in the hierarchy */
+	if (downstream)
+		sw = dst_port->sw;
+	else
+		sw = src_port->sw;
+
+	clx = tb_disable_clx(sw);
+
+	tb_for_each_upstream_port_on_path(src_port, dst_port, up) {
+		int consumed_up, consumed_down;
+		enum tb_link_width width;
+
+		ret = tb_consumed_dp_bandwidth(tb, src_port, dst_port, up,
+					       &consumed_up, &consumed_down);
+		if (ret)
+			break;
+
+		if (downstream) {
+			/*
+			 * Downstream so make sure upstream is within the 36G
+			 * (40G - guard band 10%), and the requested is above
+			 * what the threshold is.
+			 */
+			if (consumed_up + requested_up >= TB_ASYM_MIN) {
+				ret = -ENOBUFS;
+				break;
+			}
+			/* Does consumed + requested exceed the threshold */
+			if (consumed_down + requested_down < asym_threshold)
+				continue;
+
+			width = TB_LINK_WIDTH_ASYM_RX;
+		} else {
+			/* Upstream, the opposite of above */
+			if (consumed_down + requested_down >= TB_ASYM_MIN) {
+				ret = -ENOBUFS;
+				break;
+			}
+			if (consumed_up + requested_up < asym_threshold)
+				continue;
+
+			width = TB_LINK_WIDTH_ASYM_TX;
+		}
+
+		if (up->sw->link_width == width)
+			continue;
+
+		if (!tb_port_width_supported(up, width))
+			continue;
+
+		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
+
+		/*
+		 * Here requested + consumed > threshold so we need to
+		 * transtion the link into asymmetric now.
+		 */
+		ret = tb_switch_set_link_width(up->sw, width);
+		if (ret) {
+			tb_sw_warn(up->sw, "failed to set link width\n");
+			break;
+		}
+	}
+
+	/* Re-enable CL states if they were previosly enabled */
+	if (clx)
+		tb_enable_clx(sw);
+
+	return ret;
+}
+
+/**
+ * tb_configure_sym() - Transition links to symmetric if possible
+ * @tb: Domain structure
+ * @src_port: Source adapter to start the transition
+ * @dst_port: Destination adapter
+ * @requested_up: New lower bandwidth request upstream (Mb/s)
+ * @requested_down: New lower bandwidth request downstream (Mb/s)
+ *
+ * Goes over each link from @src_port to @dst_port and tries to
+ * transition the link to symmetric if the currently consumed bandwidth
+ * allows.
+ */
+static int tb_configure_sym(struct tb *tb, struct tb_port *src_port,
+			    struct tb_port *dst_port, int requested_up,
+			    int requested_down)
+{
+	struct tb_switch *sw;
+	bool clx, downstream;
+	struct tb_port *up;
+	int ret = 0;
+
+	if (!asym_threshold)
+		return 0;
+
+	/* Disable CL states before doing any transitions */
+	downstream = tb_port_path_direction_downstream(src_port, dst_port);
+	/* Pick up router deepest in the hierarchy */
+	if (downstream)
+		sw = dst_port->sw;
+	else
+		sw = src_port->sw;
+
+	clx = tb_disable_clx(sw);
+
+	tb_for_each_upstream_port_on_path(src_port, dst_port, up) {
+		int consumed_up, consumed_down;
+
+		/* Already symmetric */
+		if (up->sw->link_width <= TB_LINK_WIDTH_DUAL)
+			continue;
+		/* Unplugged, no need to switch */
+		if (up->sw->is_unplugged)
+			continue;
+
+		ret = tb_consumed_dp_bandwidth(tb, src_port, dst_port, up,
+					       &consumed_up, &consumed_down);
+		if (ret)
+			break;
+
+		if (downstream) {
+			/*
+			 * Downstream so we want the consumed_down < threshold.
+			 * Upstream traffic should be less than 36G (40G
+			 * guard band 10%) as the link was configured asymmetric
+			 * already.
+			 */
+			if (consumed_down + requested_down >= asym_threshold)
+				continue;
+		} else {
+			if (consumed_up + requested_up >= asym_threshold)
+				continue;
+		}
+
+		if (up->sw->link_width == TB_LINK_WIDTH_DUAL)
+			continue;
+
+		tb_sw_dbg(up->sw, "configuring symmetric link\n");
+
+		ret = tb_switch_set_link_width(up->sw, TB_LINK_WIDTH_DUAL);
+		if (ret) {
+			tb_sw_warn(up->sw, "failed to set link width\n");
+			break;
+		}
+	}
+
+	/* Re-enable CL states if they were previosly enabled */
+	if (clx)
+		tb_enable_clx(sw);
+
+	return ret;
+}
+
+static void tb_configure_link(struct tb_port *down, struct tb_port *up,
+			      struct tb_switch *sw)
+{
+	struct tb *tb = sw->tb;
+
+	/* Link the routers using both links if available */
+	down->remote = up;
+	up->remote = down;
+	if (down->dual_link_port && up->dual_link_port) {
+		down->dual_link_port->remote = up->dual_link_port;
+		up->dual_link_port->remote = down->dual_link_port;
+	}
+
+	/*
+	 * Enable lane bonding if the link is currently two single lane
+	 * links.
+	 */
+	if (sw->link_width < TB_LINK_WIDTH_DUAL)
+		tb_switch_set_link_width(sw, TB_LINK_WIDTH_DUAL);
+
+	/*
+	 * Device router that does not support asymmetric link is
+	 * connected deeper in the hierarchy, we transition the links
+	 * above into symmetric if bandwidth allows.
+	 */
+	if (tb_switch_depth(sw) > 1 &&
+	    tb_port_get_link_generation(up) >= 4 &&
+	    !tb_port_width_supported(up,
+		    TB_LINK_WIDTH_ASYM_TX | TB_LINK_WIDTH_ASYM_RX)) {
+		struct tb_port *host_port;
+
+		host_port = tb_port_at(tb_route(sw), tb->root_switch);
+		tb_configure_sym(tb, host_port, up, 0, 0);
+	}
+
+	/* Set the link configured */
+	tb_switch_configure_link(sw);
+}
+
 static void tb_scan_port(struct tb_port *port);
 
 /*
@@ -975,19 +1386,9 @@ static void tb_scan_port(struct tb_port *port)
 		goto out_rpm_put;
 	}
 
-	/* Link the switches using both links if available */
 	upstream_port = tb_upstream_port(sw);
-	port->remote = upstream_port;
-	upstream_port->remote = port;
-	if (port->dual_link_port && upstream_port->dual_link_port) {
-		port->dual_link_port->remote = upstream_port->dual_link_port;
-		upstream_port->dual_link_port->remote = port->dual_link_port;
-	}
+	tb_configure_link(port, upstream_port, sw);
 
-	/* Enable lane bonding if supported */
-	tb_switch_set_link_width(sw, TB_LINK_WIDTH_DUAL);
-	/* Set the link configured */
-	tb_switch_configure_link(sw);
 	/*
 	 * CL0s and CL1 are enabled and supported together.
 	 * Silently ignore CLx enabling in case CLx is not supported.
@@ -1051,6 +1452,11 @@ static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
 		 * deallocated properly.
 		 */
 		tb_switch_dealloc_dp_resource(src_port->sw, src_port);
+		/*
+		 * If bandwidth on a link is < asym_threshold
+		 * transition the link to symmetric.
+		 */
+		tb_configure_sym(tb, src_port, dst_port, 0, 0);
 		/* Now we can allow the domain to runtime suspend again */
 		pm_runtime_mark_last_busy(&dst_port->sw->dev);
 		pm_runtime_put_autosuspend(&dst_port->sw->dev);
@@ -1208,7 +1614,7 @@ tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
 
 		out = tunnel->dst_port;
 		ret = tb_available_bandwidth(tb, in, out, &estimated_up,
-					     &estimated_down);
+					     &estimated_down, true);
 		if (ret) {
 			tb_tunnel_warn(tunnel,
 				"failed to re-calculate estimated bandwidth\n");
@@ -1377,7 +1783,8 @@ static bool tb_tunnel_one_dp(struct tb *tb)
 		goto err_detach_group;
 	}
 
-	ret = tb_available_bandwidth(tb, in, out, &available_up, &available_down);
+	ret = tb_available_bandwidth(tb, in, out, &available_up, &available_down,
+				     false);
 	if (ret)
 		goto err_reclaim_usb;
 
@@ -1859,6 +2266,11 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 
 	if ((*requested_up >= 0 && requested_up_corrected <= allocated_up) ||
 	    (*requested_down >= 0 && requested_down_corrected <= allocated_down)) {
+		/*
+		 * If bandwidth on a link is < asym_threshold transition
+		 * the link to symmetric.
+		 */
+		tb_configure_sym(tb, in, out, *requested_up, *requested_down);
 		/*
 		 * If requested bandwidth is less or equal than what is
 		 * currently allocated to that tunnel we simply change
@@ -1884,7 +2296,8 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 	 * are also in the same group but we use the same function here
 	 * that we use with the normal bandwidth allocation).
 	 */
-	ret = tb_available_bandwidth(tb, in, out, &available_up, &available_down);
+	ret = tb_available_bandwidth(tb, in, out, &available_up, &available_down,
+				     true);
 	if (ret)
 		goto reclaim;
 
@@ -1893,8 +2306,23 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 
 	if ((*requested_up >= 0 && available_up >= requested_up_corrected) ||
 	    (*requested_down >= 0 && available_down >= requested_down_corrected)) {
+		/*
+		 * If bandwidth on a link is >= asym_threshold
+		 * transition the link to asymmetric.
+		 */
+		ret = tb_configure_asym(tb, in, out, *requested_up,
+					*requested_down);
+		if (ret) {
+			tb_configure_sym(tb, in, out, 0, 0);
+			return ret;
+		}
+
 		ret = tb_tunnel_alloc_bandwidth(tunnel, requested_up,
 						requested_down);
+		if (ret) {
+			tb_tunnel_warn(tunnel, "failed to allocate bandwidth\n");
+			tb_configure_sym(tb, in, out, 0, 0);
+		}
 	} else {
 		ret = -ENOBUFS;
 	}
-- 
2.40.1


