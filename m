Return-Path: <linux-usb+bounces-1129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D78C7B9D9B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 15:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 0A7602822FF
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 13:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FCE2770C;
	Thu,  5 Oct 2023 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0LalvjE"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A326E31
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 13:50:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580561FCE
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513802; x=1728049802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f7jd1P5K5yrePs3I3The3qsRZDLAKtvzOb2urriXFYI=;
  b=N0LalvjEiYBj+FUjupmAGWAGH5v3DTDhHB6dco/sBXyb+0/2HcAn71bm
   CKAslUyyAEehEEBUbAh0egwlNmNfL5dHl4qdrqrQWl5lUMumcabBIzBT9
   1qmRvE/NPJlAMATVcO8OADalB8rr8WumF2DgZLfqRCrNp3+5deJtJoBnG
   mHJf3/tUnocKv85pa1I6sKXhQ3UZQXFiBRMcGCInnaqRO7d6/RnvNiVy5
   7p5dogNj0u4ywLOb1AVYsaU7pEFxzCgqpXF0eY68bSX5VrzwOyyd7cd0q
   vppaqz7i+PIjm5r/cVH389GAOuvW6+S8iFkpNTZGB9pFIqn27+uPjRVkj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383355558"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="383355558"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728369862"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="728369862"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 05 Oct 2023 02:27:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 06E7D4F3; Thu,  5 Oct 2023 12:27:29 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 04/10] thunderbolt: Change bandwidth reservations to comply USB4 v2
Date: Thu,  5 Oct 2023 12:27:23 +0300
Message-Id: <20231005092729.3595447-5-mika.westerberg@linux.intel.com>
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

USB4 v2 Connection Manager guide (section 6.1.2.3) suggests to reserve
bandwidth in a sligthly different manner. It suggests to keep minimum of
1500 Mb/s for each path that carry a bulk traffic. Here we change the
bandwidth reservations to comply to the above for USB 3.x and PCIe
protocols over Gen 4 link, taking weights into account (that's 1500 Mb/s
for PCIe and 3000 Mb/s for USB 3.x).

For Gen 3 and below we use the existing reservation.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c     | 11 ++++++
 drivers/thunderbolt/tunnel.c | 66 ++++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/tunnel.h |  2 ++
 3 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 4d957e1f2c7a..96eb7d9fdedf 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -602,6 +602,7 @@ static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
 	/* Find the minimum available bandwidth over all links */
 	tb_for_each_port_on_path(src_port, dst_port, port) {
 		int link_speed, link_width, up_bw, down_bw;
+		int pci_reserved_up, pci_reserved_down;
 
 		if (!tb_port_is_null(port))
 			continue;
@@ -695,6 +696,16 @@ static int tb_available_bandwidth(struct tb *tb, struct tb_port *src_port,
 		up_bw -= usb3_consumed_up;
 		down_bw -= usb3_consumed_down;
 
+		/*
+		 * If there is anything reserved for PCIe bulk traffic
+		 * take it into account here too.
+		 */
+		if (tb_tunnel_reserved_pci(port, &pci_reserved_up,
+					   &pci_reserved_down)) {
+			up_bw -= pci_reserved_up;
+			down_bw -= pci_reserved_down;
+		}
+
 		if (up_bw < *available_up)
 			*available_up = up_bw;
 		if (down_bw < *available_down)
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index b77acda284d0..876b8f07f716 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -31,7 +31,7 @@
 #define TB_USB3_PATH_UP			1
 
 #define TB_USB3_PRIORITY		3
-#define TB_USB3_WEIGHT			3
+#define TB_USB3_WEIGHT			2
 
 /* DP adapters use HopID 8 for AUX and 9 for Video */
 #define TB_DP_AUX_TX_HOPID		8
@@ -61,6 +61,15 @@
 #define TB_DMA_PRIORITY			5
 #define TB_DMA_WEIGHT			1
 
+/*
+ * Reserve additional bandwidth for USB 3.x and PCIe bulk traffic
+ * according to USB4 v2 Connection Manager guide. This ends up reserving
+ * 1500 Mb/s for PCIe and 3000 Mb/s for USB 3.x taking weights into
+ * account.
+ */
+#define USB4_V2_PCI_MIN_BANDWIDTH	(1500 * TB_PCI_WEIGHT)
+#define USB4_V2_USB3_MIN_BANDWIDTH	(1500 * TB_USB3_WEIGHT)
+
 static unsigned int dma_credits = TB_DMA_CREDITS;
 module_param(dma_credits, uint, 0444);
 MODULE_PARM_DESC(dma_credits, "specify custom credits for DMA tunnels (default: "
@@ -150,11 +159,11 @@ static struct tb_tunnel *tb_tunnel_alloc(struct tb *tb, size_t npaths,
 
 static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool enable)
 {
+	struct tb_port *port = tb_upstream_port(tunnel->dst_port->sw);
 	int ret;
 
 	/* Only supported of both routers are at least USB4 v2 */
-	if (usb4_switch_version(tunnel->src_port->sw) < 2 ||
-	    usb4_switch_version(tunnel->dst_port->sw) < 2)
+	if (tb_port_get_link_generation(port) < 4)
 		return 0;
 
 	ret = usb4_pci_port_set_ext_encapsulation(tunnel->src_port, enable);
@@ -370,6 +379,51 @@ struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
 	return NULL;
 }
 
+/**
+ * tb_tunnel_reserved_pci() - Amount of bandwidth to reserve for PCIe
+ * @port: Lane 0 adapter
+ * @reserved_up: Upstream bandwidth in Mb/s to reserve
+ * @reserved_down: Downstream bandwidth in Mb/s to reserve
+ *
+ * Can be called to any connected lane 0 adapter to find out how much
+ * bandwidth needs to be left in reserve for possible PCIe bulk traffic.
+ * Returns true if there is something to be reserved and writes the
+ * amount to @reserved_down/@reserved_up. Otherwise returns false and
+ * does not touch the parameters.
+ */
+bool tb_tunnel_reserved_pci(struct tb_port *port, int *reserved_up,
+			    int *reserved_down)
+{
+	if (WARN_ON_ONCE(!port->remote))
+		return false;
+
+	if (!tb_acpi_may_tunnel_pcie())
+		return false;
+
+	if (tb_port_get_link_generation(port) < 4)
+		return false;
+
+	/* Must have PCIe adapters */
+	if (tb_is_upstream_port(port)) {
+		if (!tb_switch_find_port(port->sw, TB_TYPE_PCIE_UP))
+			return false;
+		if (!tb_switch_find_port(port->remote->sw, TB_TYPE_PCIE_DOWN))
+			return false;
+	} else {
+		if (!tb_switch_find_port(port->sw, TB_TYPE_PCIE_DOWN))
+			return false;
+		if (!tb_switch_find_port(port->remote->sw, TB_TYPE_PCIE_UP))
+			return false;
+	}
+
+	*reserved_up = USB4_V2_PCI_MIN_BANDWIDTH;
+	*reserved_down = USB4_V2_PCI_MIN_BANDWIDTH;
+
+	tb_port_dbg(port, "reserving %u/%u Mb/s for PCIe\n", *reserved_up,
+		    *reserved_down);
+	return true;
+}
+
 static bool tb_dp_is_usb4(const struct tb_switch *sw)
 {
 	/* Titan Ridge DP adapters need the same treatment as USB4 */
@@ -1747,6 +1801,7 @@ static int tb_usb3_activate(struct tb_tunnel *tunnel, bool activate)
 static int tb_usb3_consumed_bandwidth(struct tb_tunnel *tunnel,
 		int *consumed_up, int *consumed_down)
 {
+	struct tb_port *port = tb_upstream_port(tunnel->dst_port->sw);
 	int pcie_weight = tb_acpi_may_tunnel_pcie() ? TB_PCI_WEIGHT : 0;
 
 	/*
@@ -1758,6 +1813,11 @@ static int tb_usb3_consumed_bandwidth(struct tb_tunnel *tunnel,
 	*consumed_down = tunnel->allocated_down *
 		(TB_USB3_WEIGHT + pcie_weight) / TB_USB3_WEIGHT;
 
+	if (tb_port_get_link_generation(port) >= 4) {
+		*consumed_up = max(*consumed_up, USB4_V2_USB3_MIN_BANDWIDTH);
+		*consumed_down = max(*consumed_down, USB4_V2_USB3_MIN_BANDWIDTH);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 750ebb570d99..b4cff5482112 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -80,6 +80,8 @@ struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
 					 bool alloc_hopid);
 struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
 				      struct tb_port *down);
+bool tb_tunnel_reserved_pci(struct tb_port *port, int *reserved_up,
+			    int *reserved_down);
 struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 					bool alloc_hopid);
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
-- 
2.40.1


