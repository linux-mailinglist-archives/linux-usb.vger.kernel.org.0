Return-Path: <linux-usb+bounces-4326-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8F818211
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 08:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2833C1F24546
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 07:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828648826;
	Tue, 19 Dec 2023 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWAiaavo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B8C2D3
	for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 07:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702970135; x=1734506135;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q/c2fEz4rScCXXn6dyUsZAStkjXTa7aPMHV7hjYbCUs=;
  b=FWAiaavoHUm1xX4ukhHHo1T4QOq2BhWBDrsomeAxD0M6gpbPlK1lFE22
   HaPNfrQxVlyodAk3PZbBPDgzCYFwmiSUWbbNsET2tOoxU7o5MUCSJLJg3
   Obj3BsZMQxzzB64/htkt8/RSzLVu4n2PAIcyN/h5ainLlvfdhwBLB+4hT
   YiDEAuDDV9++DmMAHQHFfJZe6VPCRUkHeNvlqv3tNCodiyydskHbPzct4
   Bl9d0TET1FF7Ob56aWA3JkXmVDV19oxNxF6LeJ46ay42bOw+5A4m3kKJj
   0oN0pox1YxP23ufeor6hjB92eilL4LMq6xBBkXEpY5jmr+IKbkQK7gdBM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="386040199"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="386040199"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 23:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="810124926"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="810124926"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 18 Dec 2023 23:15:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 69B7023A; Tue, 19 Dec 2023 09:15:31 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Keep link as asymmetric if preferred by hardware
Date: Tue, 19 Dec 2023 09:15:31 +0200
Message-ID: <20231219071531.2375978-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

In case of the link is brought up as asymmetric (due to hardware preference), we
honor that and don't transition it to symmetric, unless a router with symmetric
link got plugged below, in the topology (and a bandwidth allows transition to
symmetric).

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 13 +++++++++++++
 drivers/thunderbolt/tb.c     | 28 +++++++++++++++++++++-------
 drivers/thunderbolt/tb.h     |  2 ++
 3 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index dbab551ac7b3..900114ba4371 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2773,6 +2773,19 @@ static void tb_switch_link_init(struct tb_switch *sw)
 	if (down->dual_link_port)
 		down->dual_link_port->bonded = bonded;
 	tb_port_update_credits(down);
+
+	if (tb_port_get_link_generation(up) < 4)
+		return;
+
+	/*
+	 * Set the Gen 4 preferred link width. This is what the router
+	 * prefers when the link is brought up. If the router does not
+	 * support asymmetric link configuration, this also will be set
+	 * to TB_LINK_WIDTH_DUAL.
+	 */
+	sw->preferred_link_width = sw->link_width;
+	tb_sw_dbg(sw, "preferred link width %s\n",
+		  tb_width_name(sw->preferred_link_width));
 }
 
 /**
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 0a32e7ec4dc0..846d2813bb1a 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1183,14 +1183,15 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
  * @dst_port: Destination adapter
  * @requested_up: New lower bandwidth request upstream (Mb/s)
  * @requested_down: New lower bandwidth request downstream (Mb/s)
+ * @keep_asym: Keep asymmetric link if preferred
  *
  * Goes over each link from @src_port to @dst_port and tries to
  * transition the link to symmetric if the currently consumed bandwidth
- * allows.
+ * allows and link asymmetric preference is ignored (if @keep_asym is %false).
  */
 static int tb_configure_sym(struct tb *tb, struct tb_port *src_port,
 			    struct tb_port *dst_port, int requested_up,
-			    int requested_down)
+			    int requested_down, bool keep_asym)
 {
 	bool clx = false, clx_disabled = false, downstream;
 	struct tb_switch *sw;
@@ -1239,6 +1240,19 @@ static int tb_configure_sym(struct tb *tb, struct tb_port *src_port,
 		if (up->sw->link_width == TB_LINK_WIDTH_DUAL)
 			continue;
 
+		/*
+		 * Here consumed < threshold so we can transition the
+		 * link to symmetric.
+		 *
+		 * However, if the router prefers asymmetric link we
+		 * honor that (unless @keep_asym is %false).
+		 */
+		if (keep_asym &&
+		    up->sw->preferred_link_width > TB_LINK_WIDTH_DUAL) {
+			tb_sw_dbg(up->sw, "keeping preferred asymmetric link\n");
+			continue;
+		}
+
 		/* Disable CL states before doing any transitions */
 		if (!clx_disabled) {
 			clx = tb_disable_clx(sw);
@@ -1292,7 +1306,7 @@ static void tb_configure_link(struct tb_port *down, struct tb_port *up,
 		struct tb_port *host_port;
 
 		host_port = tb_port_at(tb_route(sw), tb->root_switch);
-		tb_configure_sym(tb, host_port, up, 0, 0);
+		tb_configure_sym(tb, host_port, up, 0, 0, false);
 	}
 
 	/* Set the link configured */
@@ -1477,7 +1491,7 @@ static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
 		 * If bandwidth on a link is < asym_threshold
 		 * transition the link to symmetric.
 		 */
-		tb_configure_sym(tb, src_port, dst_port, 0, 0);
+		tb_configure_sym(tb, src_port, dst_port, 0, 0, true);
 		/* Now we can allow the domain to runtime suspend again */
 		pm_runtime_mark_last_busy(&dst_port->sw->dev);
 		pm_runtime_put_autosuspend(&dst_port->sw->dev);
@@ -2299,7 +2313,7 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 		 * If bandwidth on a link is < asym_threshold transition
 		 * the link to symmetric.
 		 */
-		tb_configure_sym(tb, in, out, *requested_up, *requested_down);
+		tb_configure_sym(tb, in, out, *requested_up, *requested_down, true);
 		/*
 		 * If requested bandwidth is less or equal than what is
 		 * currently allocated to that tunnel we simply change
@@ -2342,7 +2356,7 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 		ret = tb_configure_asym(tb, in, out, *requested_up,
 					*requested_down);
 		if (ret) {
-			tb_configure_sym(tb, in, out, 0, 0);
+			tb_configure_sym(tb, in, out, 0, 0, true);
 			return ret;
 		}
 
@@ -2350,7 +2364,7 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 						requested_down);
 		if (ret) {
 			tb_tunnel_warn(tunnel, "failed to allocate bandwidth\n");
-			tb_configure_sym(tb, in, out, 0, 0);
+			tb_configure_sym(tb, in, out, 0, 0, true);
 		}
 	} else {
 		ret = -ENOBUFS;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 1760c21e5b12..997c5a536905 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -125,6 +125,7 @@ struct tb_switch_tmu {
  * @device_name: Name of the device (or %NULL if not known)
  * @link_speed: Speed of the link in Gb/s
  * @link_width: Width of the upstream facing link
+ * @preferred_link_width: Router preferred link width (only set for Gen 4 links)
  * @link_usb4: Upstream link is USB4
  * @generation: Switch Thunderbolt generation
  * @cap_plug_events: Offset to the plug events capability (%0 if not found)
@@ -178,6 +179,7 @@ struct tb_switch {
 	const char *device_name;
 	unsigned int link_speed;
 	enum tb_link_width link_width;
+	enum tb_link_width preferred_link_width;
 	bool link_usb4;
 	unsigned int generation;
 	int cap_plug_events;
-- 
2.43.0


