Return-Path: <linux-usb+bounces-18567-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7939F45F8
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D5177A365A
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC48E1DDC1E;
	Tue, 17 Dec 2024 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btxWqCHi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C41F1DD54C
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423752; cv=none; b=lFzrvQbRMUYCOV50lvtP1NE64BoRd2RC7qM3Sd1tjhTJ7J7PMi2Kt5XG9lknVSPYYBJAyb6XROKKD0nfHnAoyyH44yg6tHA+cQhBiFs6pAfTxQetEARWw8Oq1We7t7ehwxk2yJ1L/BSh+mUH3XWekuZ5ydeS5NGjC0J9ZJJd2pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423752; c=relaxed/simple;
	bh=OPaH7A4OdQ6wb6rrpdbQJ/9+xdqU/8OvlKDuvaN2t8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HoCKLJppDrETWGS/DMDUoG0nA/Q0c49x9rwjeQ1G24C2SUqoN+xTNX9ufEEYJyDn2cVc/6ogxqptZtipiXkVIVnmXE9fdngtj7lHMHUc6V8KmcXmowalSKKG50qF30dK/DSUAYXyAHTMjwhP1JI0E1NfmyyHvCViv98RbVzQN1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btxWqCHi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423751; x=1765959751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OPaH7A4OdQ6wb6rrpdbQJ/9+xdqU/8OvlKDuvaN2t8Q=;
  b=btxWqCHi22hJEYvRL9qzDwNIuYKpmfOjbULs/UxUuLpymLG4xh81o23A
   17EVtVXMDPpctpjAh+dxdgpCD+a1WphD+QxGVlKTlCIaYp3GSHWoc3o8C
   aMqc4swSNbEerMuKSayuO17cPEMMCuuGf2J8CfIAjnwpO11FyeEA019oc
   oHz2bjtk3LbV6AMZDk0Ufh8P1oVLRpQhQc+m4Hfc5EPIloOb2Fd6KCIIW
   c1Pyw1FCP/DiQr0xKpIPbTY3ki0fNBlVacnZx3Gu15uip6PNJqWgg1yAw
   NdKdeLE9F5H0F9cZCvSS224vVauLqCnlAen6QwB5cYh3d8VIX+SWFEoaN
   g==;
X-CSE-ConnectionGUID: h7Dyyr2DTputA0JMBPWD6A==
X-CSE-MsgGUID: AvstdKMoSFSXd+tbdyDlTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38511454"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="38511454"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:28 -0800
X-CSE-ConnectionGUID: 1NIAO6SYTWu3TBGaT4A30g==
X-CSE-MsgGUID: lnuQS7KfRTi7OGy3wPiubg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102063251"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 00:22:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 3292082E; Tue, 17 Dec 2024 10:22:23 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/12] thunderbolt: Rework how tunnel->[init|deinit] hooks are called
Date: Tue, 17 Dec 2024 10:22:17 +0200
Message-ID: <20241217082222.528602-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
References: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The way these are called is not exactly symmetric as it is supposed to
be: the former is called when tunnel is being activated and the latter
is called when it is being released (not when it is being de-activated).

Furthermore host-to-host (DMA) tunnels are abusing the ->deinit hook to
clear out the credits. This makes it quite hard to follow what is being
called and when.

For these reasons rework the two "init" hooks to be called symmetrically
and rename them accordingly. For the DMA one, add a new hook that is
specifically used to run clean up for the tunnel when its memory is
being released.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 37 +++++++++++++++++++-----------------
 drivers/thunderbolt/tunnel.h | 13 +++++++++----
 2 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index f9e75c221fef..83bd2043bab2 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -851,7 +851,7 @@ static int tb_dp_bandwidth_alloc_mode_enable(struct tb_tunnel *tunnel)
 	return 0;
 }
 
-static int tb_dp_init(struct tb_tunnel *tunnel)
+static int tb_dp_pre_activate(struct tb_tunnel *tunnel)
 {
 	struct tb_port *in = tunnel->src_port;
 	struct tb_switch *sw = in->sw;
@@ -877,7 +877,7 @@ static int tb_dp_init(struct tb_tunnel *tunnel)
 	return tb_dp_bandwidth_alloc_mode_enable(tunnel);
 }
 
-static void tb_dp_deinit(struct tb_tunnel *tunnel)
+static void tb_dp_post_deactivate(struct tb_tunnel *tunnel)
 {
 	struct tb_port *in = tunnel->src_port;
 
@@ -1368,9 +1368,9 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 	if (!tunnel)
 		return NULL;
 
-	tunnel->init = tb_dp_init;
-	tunnel->deinit = tb_dp_deinit;
+	tunnel->pre_activate = tb_dp_pre_activate;
 	tunnel->activate = tb_dp_activate;
+	tunnel->post_deactivate = tb_dp_post_deactivate;
 	tunnel->maximum_bandwidth = tb_dp_maximum_bandwidth;
 	tunnel->allocated_bandwidth = tb_dp_allocated_bandwidth;
 	tunnel->alloc_bandwidth = tb_dp_alloc_bandwidth;
@@ -1464,9 +1464,9 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	if (!tunnel)
 		return NULL;
 
-	tunnel->init = tb_dp_init;
-	tunnel->deinit = tb_dp_deinit;
+	tunnel->pre_activate = tb_dp_pre_activate;
 	tunnel->activate = tb_dp_activate;
+	tunnel->post_deactivate = tb_dp_post_deactivate;
 	tunnel->maximum_bandwidth = tb_dp_maximum_bandwidth;
 	tunnel->allocated_bandwidth = tb_dp_allocated_bandwidth;
 	tunnel->alloc_bandwidth = tb_dp_alloc_bandwidth;
@@ -1623,7 +1623,7 @@ static void tb_dma_release_credits(struct tb_path_hop *hop)
 	}
 }
 
-static void tb_dma_deinit_path(struct tb_path *path)
+static void tb_dma_destroy_path(struct tb_path *path)
 {
 	struct tb_path_hop *hop;
 
@@ -1631,14 +1631,14 @@ static void tb_dma_deinit_path(struct tb_path *path)
 		tb_dma_release_credits(hop);
 }
 
-static void tb_dma_deinit(struct tb_tunnel *tunnel)
+static void tb_dma_destroy(struct tb_tunnel *tunnel)
 {
 	int i;
 
 	for (i = 0; i < tunnel->npaths; i++) {
 		if (!tunnel->paths[i])
 			continue;
-		tb_dma_deinit_path(tunnel->paths[i]);
+		tb_dma_destroy_path(tunnel->paths[i]);
 	}
 }
 
@@ -1684,7 +1684,7 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 
 	tunnel->src_port = nhi;
 	tunnel->dst_port = dst;
-	tunnel->deinit = tb_dma_deinit;
+	tunnel->destroy = tb_dma_destroy;
 
 	credits = min_not_zero(dma_credits, nhi->sw->max_dma_credits);
 
@@ -1796,7 +1796,7 @@ static int tb_usb3_max_link_rate(struct tb_port *up, struct tb_port *down)
 	return min(up_max_rate, down_max_rate);
 }
 
-static int tb_usb3_init(struct tb_tunnel *tunnel)
+static int tb_usb3_pre_activate(struct tb_tunnel *tunnel)
 {
 	tb_tunnel_dbg(tunnel, "allocating initial bandwidth %d/%d Mb/s\n",
 		      tunnel->allocated_up, tunnel->allocated_down);
@@ -2027,7 +2027,7 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down,
 		tb_tunnel_dbg(tunnel, "currently allocated bandwidth %d/%d Mb/s\n",
 			      tunnel->allocated_up, tunnel->allocated_down);
 
-		tunnel->init = tb_usb3_init;
+		tunnel->pre_activate = tb_usb3_pre_activate;
 		tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
 		tunnel->release_unused_bandwidth =
 			tb_usb3_release_unused_bandwidth;
@@ -2116,7 +2116,7 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 		tunnel->allocated_up = min(max_rate, max_up);
 		tunnel->allocated_down = min(max_rate, max_down);
 
-		tunnel->init = tb_usb3_init;
+		tunnel->pre_activate = tb_usb3_pre_activate;
 		tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
 		tunnel->release_unused_bandwidth =
 			tb_usb3_release_unused_bandwidth;
@@ -2140,8 +2140,8 @@ void tb_tunnel_free(struct tb_tunnel *tunnel)
 	if (!tunnel)
 		return;
 
-	if (tunnel->deinit)
-		tunnel->deinit(tunnel);
+	if (tunnel->destroy)
+		tunnel->destroy(tunnel);
 
 	for (i = 0; i < tunnel->npaths; i++) {
 		if (tunnel->paths[i])
@@ -2192,8 +2192,8 @@ int tb_tunnel_restart(struct tb_tunnel *tunnel)
 		}
 	}
 
-	if (tunnel->init) {
-		res = tunnel->init(tunnel);
+	if (tunnel->pre_activate) {
+		res = tunnel->pre_activate(tunnel);
 		if (res)
 			return res;
 	}
@@ -2256,6 +2256,9 @@ void tb_tunnel_deactivate(struct tb_tunnel *tunnel)
 		if (tunnel->paths[i] && tunnel->paths[i]->activated)
 			tb_path_deactivate(tunnel->paths[i]);
 	}
+
+	if (tunnel->post_deactivate)
+		tunnel->post_deactivate(tunnel);
 }
 
 /**
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 1a27ccd08b86..30c079fd121e 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -26,9 +26,13 @@ enum tb_tunnel_type {
  *	      tunnels may be %NULL or null adapter port instead.
  * @paths: All paths required by the tunnel
  * @npaths: Number of paths in @paths
- * @init: Optional tunnel specific initialization
- * @deinit: Optional tunnel specific de-initialization
+ * @pre_activate: Optional tunnel specific initialization called before
+ *		  activation. Can touch hardware.
  * @activate: Optional tunnel specific activation/deactivation
+ * @post_deactivate: Optional tunnel specific de-initialization called
+ *		     after deactivation. Can touch hardware.
+ * @destroy: Optional tunnel specific callback called when the tunnel
+ *	     memory is being released. Should not touch hardware.
  * @maximum_bandwidth: Returns maximum possible bandwidth for this tunnel
  * @allocated_bandwidth: Return how much bandwidth is allocated for the tunnel
  * @alloc_bandwidth: Change tunnel bandwidth allocation
@@ -52,9 +56,10 @@ struct tb_tunnel {
 	struct tb_port *dst_port;
 	struct tb_path **paths;
 	size_t npaths;
-	int (*init)(struct tb_tunnel *tunnel);
-	void (*deinit)(struct tb_tunnel *tunnel);
+	int (*pre_activate)(struct tb_tunnel *tunnel);
 	int (*activate)(struct tb_tunnel *tunnel, bool activate);
+	void (*post_deactivate)(struct tb_tunnel *tunnel);
+	void (*destroy)(struct tb_tunnel *tunnel);
 	int (*maximum_bandwidth)(struct tb_tunnel *tunnel, int *max_up,
 				 int *max_down);
 	int (*allocated_bandwidth)(struct tb_tunnel *tunnel, int *allocated_up,
-- 
2.45.2


