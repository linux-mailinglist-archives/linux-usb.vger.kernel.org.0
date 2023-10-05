Return-Path: <linux-usb+bounces-1133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5257B9D9F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 15:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9937B282706
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 13:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4340526E12;
	Thu,  5 Oct 2023 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzCxNLjQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628D1266BD
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 13:50:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61C42713
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513852; x=1728049852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LVB9d1j4l8rWI7muJmnyjcFcDQCiuND/wpiFnw7J+Ec=;
  b=XzCxNLjQiXcunoMM1x2PeTcdkCMUnHYiumXr4LSwV6r5rD1hU6LDyFr8
   Tyet/YMhENv6OZxoywKtKPqUn8m/BD+wnTc8hb2nMeJAOU3ZKY/EavhA4
   WzmnveNWCsv716Re8oVFBL/Xa4rgo9dna7shI0Pp0YRcjwM69O3GgpycX
   48abGEbeBd9jAjN1xE5gDfzTDQHGIz9NYIaDQ/z7Bk/pN4FhKX5PocKNF
   l7RaJBHrawLgqbuHxYUZkwgC5CHnsEJ9m201LwD6mTJzYyTaQ1/jUALl1
   56nqVwxnAus0PPoIG89H/1TCWTo9D2kjSVRhsA+4rwybwAaHMiPT28IxX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368524197"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="368524197"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="822054746"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="822054746"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 05 Oct 2023 02:27:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 119374F4; Thu,  5 Oct 2023 12:27:30 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 05/10] thunderbolt: Set path power management packet support bit for USB4 v2 routers
Date: Thu,  5 Oct 2023 12:27:24 +0300
Message-Id: <20231005092729.3595447-6-mika.westerberg@linux.intel.com>
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

USB4 v2 spec allows USB4 links that are part of a pass through tunnel
(such as DisplayPort and USB 3.x Gen T) to enter lower CL states, which
provide better power management. For this USB4 v2 routers in their path
config space of lane 0 adapter include a new bit PMPS (PM packet
support) that needs to be set.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c    |  7 ++++---
 drivers/thunderbolt/tb.h      |  2 ++
 drivers/thunderbolt/tb_regs.h |  3 ++-
 drivers/thunderbolt/tunnel.c  | 35 ++++++++++++++++++++++++++---------
 4 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index ee03fd75a472..091a81bbdbdc 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -19,9 +19,9 @@ static void tb_dump_hop(const struct tb_path_hop *hop, const struct tb_regs_hop
 
 	tb_port_dbg(port, " In HopID: %d => Out port: %d Out HopID: %d\n",
 		    hop->in_hop_index, regs->out_port, regs->next_hop);
-	tb_port_dbg(port, "  Weight: %d Priority: %d Credits: %d Drop: %d\n",
-		    regs->weight, regs->priority,
-		    regs->initial_credits, regs->drop_packages);
+	tb_port_dbg(port, "  Weight: %d Priority: %d Credits: %d Drop: %d PM: %d\n",
+		    regs->weight, regs->priority, regs->initial_credits,
+		    regs->drop_packages, regs->pmps);
 	tb_port_dbg(port, "   Counter enabled: %d Counter index: %d\n",
 		    regs->counter_enable, regs->counter);
 	tb_port_dbg(port, "  Flow Control (In/Eg): %d/%d Shared Buffer (In/Eg): %d/%d\n",
@@ -535,6 +535,7 @@ int tb_path_activate(struct tb_path *path)
 		hop.next_hop = path->hops[i].next_hop_index;
 		hop.out_port = path->hops[i].out_port->port;
 		hop.initial_credits = path->hops[i].initial_credits;
+		hop.pmps = path->hops[i].pm_support;
 		hop.unknown1 = 0;
 		hop.enable = 1;
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index f29bbafb977f..3c9ae5584569 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -348,6 +348,7 @@ struct tb_retimer {
  *		     the path
  * @nfc_credits: Number of non-flow controlled buffers allocated for the
  *		 @in_port.
+ * @pm_support: Set path PM packet support bit to 1 (for USB4 v2 routers)
  *
  * Hop configuration is always done on the IN port of a switch.
  * in_port and out_port have to be on the same switch. Packets arriving on
@@ -368,6 +369,7 @@ struct tb_path_hop {
 	int next_hop_index;
 	unsigned int initial_credits;
 	unsigned int nfc_credits;
+	bool pm_support;
 };
 
 /**
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 32839315948b..c14a1c3bc992 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -496,7 +496,8 @@ struct tb_regs_hop {
 			  * out_port (on the incoming port of the next switch)
 			  */
 	u32 out_port:6; /* next port of the path (on the same switch) */
-	u32 initial_credits:8;
+	u32 initial_credits:7;
+	u32 pmps:1;
 	u32 unknown1:6; /* set to zero */
 	bool enable:1;
 
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 876b8f07f716..db0546c62cb3 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -134,6 +134,16 @@ static unsigned int tb_available_credits(const struct tb_port *port,
 	return credits > 0 ? credits : 0;
 }
 
+static void tb_init_pm_support(struct tb_path_hop *hop)
+{
+	struct tb_port *out_port = hop->out_port;
+	struct tb_port *in_port = hop->in_port;
+
+	if (tb_port_is_null(in_port) && tb_port_is_null(out_port) &&
+	    usb4_switch_version(in_port->sw) >= 2)
+		hop->pm_support = true;
+}
+
 static struct tb_tunnel *tb_tunnel_alloc(struct tb *tb, size_t npaths,
 					 enum tb_tunnel_type type)
 {
@@ -1213,7 +1223,7 @@ static void tb_dp_init_aux_credits(struct tb_path_hop *hop)
 		hop->initial_credits = 1;
 }
 
-static void tb_dp_init_aux_path(struct tb_path *path)
+static void tb_dp_init_aux_path(struct tb_path *path, bool pm_support)
 {
 	struct tb_path_hop *hop;
 
@@ -1224,8 +1234,11 @@ static void tb_dp_init_aux_path(struct tb_path *path)
 	path->priority = TB_DP_AUX_PRIORITY;
 	path->weight = TB_DP_AUX_WEIGHT;
 
-	tb_path_for_each_hop(path, hop)
+	tb_path_for_each_hop(path, hop) {
 		tb_dp_init_aux_credits(hop);
+		if (pm_support)
+			tb_init_pm_support(hop);
+	}
 }
 
 static int tb_dp_init_video_credits(struct tb_path_hop *hop)
@@ -1257,7 +1270,7 @@ static int tb_dp_init_video_credits(struct tb_path_hop *hop)
 	return 0;
 }
 
-static int tb_dp_init_video_path(struct tb_path *path)
+static int tb_dp_init_video_path(struct tb_path *path, bool pm_support)
 {
 	struct tb_path_hop *hop;
 
@@ -1274,6 +1287,8 @@ static int tb_dp_init_video_path(struct tb_path *path)
 		ret = tb_dp_init_video_credits(hop);
 		if (ret)
 			return ret;
+		if (pm_support)
+			tb_init_pm_support(hop);
 	}
 
 	return 0;
@@ -1365,7 +1380,7 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 		goto err_free;
 	}
 	tunnel->paths[TB_DP_VIDEO_PATH_OUT] = path;
-	if (tb_dp_init_video_path(tunnel->paths[TB_DP_VIDEO_PATH_OUT]))
+	if (tb_dp_init_video_path(tunnel->paths[TB_DP_VIDEO_PATH_OUT], false))
 		goto err_free;
 
 	path = tb_path_discover(in, TB_DP_AUX_TX_HOPID, NULL, -1, NULL, "AUX TX",
@@ -1373,14 +1388,14 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 	if (!path)
 		goto err_deactivate;
 	tunnel->paths[TB_DP_AUX_PATH_OUT] = path;
-	tb_dp_init_aux_path(tunnel->paths[TB_DP_AUX_PATH_OUT]);
+	tb_dp_init_aux_path(tunnel->paths[TB_DP_AUX_PATH_OUT], false);
 
 	path = tb_path_discover(tunnel->dst_port, -1, in, TB_DP_AUX_RX_HOPID,
 				&port, "AUX RX", alloc_hopid);
 	if (!path)
 		goto err_deactivate;
 	tunnel->paths[TB_DP_AUX_PATH_IN] = path;
-	tb_dp_init_aux_path(tunnel->paths[TB_DP_AUX_PATH_IN]);
+	tb_dp_init_aux_path(tunnel->paths[TB_DP_AUX_PATH_IN], false);
 
 	/* Validate that the tunnel is complete */
 	if (!tb_port_is_dpout(tunnel->dst_port)) {
@@ -1435,6 +1450,7 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	struct tb_tunnel *tunnel;
 	struct tb_path **paths;
 	struct tb_path *path;
+	bool pm_support;
 
 	if (WARN_ON(!in->cap_adap || !out->cap_adap))
 		return NULL;
@@ -1456,26 +1472,27 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	tunnel->max_down = max_down;
 
 	paths = tunnel->paths;
+	pm_support = usb4_switch_version(in->sw) >= 2;
 
 	path = tb_path_alloc(tb, in, TB_DP_VIDEO_HOPID, out, TB_DP_VIDEO_HOPID,
 			     link_nr, "Video");
 	if (!path)
 		goto err_free;
-	tb_dp_init_video_path(path);
+	tb_dp_init_video_path(path, pm_support);
 	paths[TB_DP_VIDEO_PATH_OUT] = path;
 
 	path = tb_path_alloc(tb, in, TB_DP_AUX_TX_HOPID, out,
 			     TB_DP_AUX_TX_HOPID, link_nr, "AUX TX");
 	if (!path)
 		goto err_free;
-	tb_dp_init_aux_path(path);
+	tb_dp_init_aux_path(path, pm_support);
 	paths[TB_DP_AUX_PATH_OUT] = path;
 
 	path = tb_path_alloc(tb, out, TB_DP_AUX_RX_HOPID, in,
 			     TB_DP_AUX_RX_HOPID, link_nr, "AUX RX");
 	if (!path)
 		goto err_free;
-	tb_dp_init_aux_path(path);
+	tb_dp_init_aux_path(path, pm_support);
 	paths[TB_DP_AUX_PATH_IN] = path;
 
 	return tunnel;
-- 
2.40.1


