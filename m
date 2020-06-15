Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 349AF1F9A1E
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730550AbgFOO05 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:57 -0400
Received: from mga03.intel.com ([134.134.136.65]:37309 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730491AbgFOO0y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:54 -0400
IronPort-SDR: 1J0ZvURDy6ARPyF90XENn+peMtlJjcgLJlJTicOpFHZiu0E0rei59z1+f+eZnTwBdmNlzNlHkI
 GHD50FhTRziw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:53 -0700
IronPort-SDR: 6yxlSMI76GIo3IuyVg4F/fV32PhIpOQZoBIhmFKOth1VImhHw9Ew4t4K8zUR7pdy0cotvGQEbz
 ED7GY2+i4msA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="351379889"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2020 07:26:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2FF8C88D; Mon, 15 Jun 2020 17:26:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 12/17] thunderbolt: Report consumed bandwidth in both directions
Date:   Mon, 15 Jun 2020 17:26:40 +0300
Message-Id: <20200615142645.56209-13-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Whereas DisplayPort bandwidth is consumed only in one direction (from DP
IN adapter to DP OUT adapter), USB3 adds separate bandwidth for both
upstream and downstream directions.

For this reason extend the tunnel consumed bandwidth routines to support
both directions and implement this for DP.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c     |  9 ++++---
 drivers/thunderbolt/tunnel.c | 47 +++++++++++++++++++++++++++++-------
 drivers/thunderbolt/tunnel.h |  6 +++--
 3 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 9dbdb11685fa..53f9673c1395 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -535,7 +535,7 @@ static int tb_available_bw(struct tb_cm *tcm, struct tb_port *in,
 {
 	struct tb_switch *sw = out->sw;
 	struct tb_tunnel *tunnel;
-	int bw, available_bw = 40000;
+	int ret, bw, available_bw = 40000;
 
 	while (sw && sw != in->sw) {
 		bw = sw->link_speed * sw->link_width * 1000; /* Mb/s */
@@ -553,9 +553,10 @@ static int tb_available_bw(struct tb_cm *tcm, struct tb_port *in,
 			if (!tb_tunnel_switch_on_path(tunnel, sw))
 				continue;
 
-			consumed_bw = tb_tunnel_consumed_bandwidth(tunnel);
-			if (consumed_bw < 0)
-				return consumed_bw;
+			ret = tb_tunnel_consumed_bandwidth(tunnel, NULL,
+							   &consumed_bw);
+			if (ret)
+				return ret;
 
 			bw -= consumed_bw;
 		}
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 5bdb8b11345e..45f7a50a48ff 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -536,7 +536,8 @@ static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
 	return 0;
 }
 
-static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel)
+static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
+				    int *consumed_down)
 {
 	struct tb_port *in = tunnel->src_port;
 	const struct tb_switch *sw = in->sw;
@@ -580,10 +581,20 @@ static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel)
 		lanes = tb_dp_cap_get_lanes(val);
 	} else {
 		/* No bandwidth management for legacy devices  */
+		*consumed_up = 0;
+		*consumed_down = 0;
 		return 0;
 	}
 
-	return tb_dp_bandwidth(rate, lanes);
+	if (in->sw->config.depth < tunnel->dst_port->sw->config.depth) {
+		*consumed_up = 0;
+		*consumed_down = tb_dp_bandwidth(rate, lanes);
+	} else {
+		*consumed_up = tb_dp_bandwidth(rate, lanes);
+		*consumed_down = 0;
+	}
+
+	return 0;
 }
 
 static void tb_dp_init_aux_path(struct tb_path *path)
@@ -1174,21 +1185,39 @@ static bool tb_tunnel_is_active(const struct tb_tunnel *tunnel)
 /**
  * tb_tunnel_consumed_bandwidth() - Return bandwidth consumed by the tunnel
  * @tunnel: Tunnel to check
+ * @consumed_up: Consumed bandwidth in Mb/s from @dst_port to @src_port.
+ *		 Can be %NULL.
+ * @consumed_down: Consumed bandwidth in Mb/s from @src_port to @dst_port.
+ *		   Can be %NULL.
  *
- * Returns bandwidth currently consumed by @tunnel and %0 if the @tunnel
- * is not active or does consume bandwidth.
+ * Stores the amount of isochronous bandwidth @tunnel consumes in
+ * @consumed_up and @consumed_down. In case of success returns %0,
+ * negative errno otherwise.
  */
-int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel)
+int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
+				 int *consumed_down)
 {
+	int up_bw = 0, down_bw = 0;
+
 	if (!tb_tunnel_is_active(tunnel))
-		return 0;
+		goto out;
 
 	if (tunnel->consumed_bandwidth) {
-		int ret = tunnel->consumed_bandwidth(tunnel);
+		int ret;
 
-		tb_tunnel_dbg(tunnel, "consumed bandwidth %d Mb/s\n", ret);
-		return ret;
+		ret = tunnel->consumed_bandwidth(tunnel, &up_bw, &down_bw);
+		if (ret)
+			return ret;
+
+		tb_tunnel_dbg(tunnel, "consumed bandwidth %d/%d Mb/s\n", up_bw,
+			      down_bw);
 	}
 
+out:
+	if (consumed_up)
+		*consumed_up = up_bw;
+	if (consumed_down)
+		*consumed_down = down_bw;
+
 	return 0;
 }
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 3f5ba93225e7..cc952b2be792 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -42,7 +42,8 @@ struct tb_tunnel {
 	size_t npaths;
 	int (*init)(struct tb_tunnel *tunnel);
 	int (*activate)(struct tb_tunnel *tunnel, bool activate);
-	int (*consumed_bandwidth)(struct tb_tunnel *tunnel);
+	int (*consumed_bandwidth)(struct tb_tunnel *tunnel, int *consumed_up,
+				  int *consumed_down);
 	struct list_head list;
 	enum tb_tunnel_type type;
 	unsigned int max_bw;
@@ -69,7 +70,8 @@ void tb_tunnel_deactivate(struct tb_tunnel *tunnel);
 bool tb_tunnel_is_invalid(struct tb_tunnel *tunnel);
 bool tb_tunnel_switch_on_path(const struct tb_tunnel *tunnel,
 			      const struct tb_switch *sw);
-int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel);
+int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
+				 int *consumed_down);
 
 static inline bool tb_tunnel_is_pci(const struct tb_tunnel *tunnel)
 {
-- 
2.27.0.rc2

