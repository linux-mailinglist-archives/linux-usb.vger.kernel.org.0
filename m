Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBA8387AB6
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 16:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349807AbhEROLI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 10:11:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:47992 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349775AbhEROLF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 10:11:05 -0400
IronPort-SDR: 5svF55gjMabUb6dmNDXwzPWzcxXBgGpL8L3tR+ch8anSAYvgiAZKeHckpXUnj2PsOpGRmOaZnP
 f/cQiaeTDaGQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="187845580"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="187845580"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 07:09:46 -0700
IronPort-SDR: JmCVIuekip3m0/x4Z6I3wyBMMeIQ+7lupNx//bQR1bxbFk8rvXFU2PX1AeZowR8vFRDudu7H9z
 h2VHuc0ytgkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="611988584"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 18 May 2021 07:09:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id AF8D6804; Tue, 18 May 2021 17:10:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 6/8] thunderbolt: Allocate credits according to router preferences
Date:   Tue, 18 May 2021 17:10:00 +0300
Message-Id: <20210518141002.63616-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
References: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB4 Connection Manager guide provides detailed information how the
USB4 router buffer (credit) allocation information should be used by the
connection manager when it allocates buffers for different paths. This
patch implements it for Linux. For USB 3.x and DisplayPort we use
directly the router preferences. The rest of the buffer space is then
used for PCIe and DMA (peer-to-peer, XDomain) traffic. DMA tunnels
require at least one buffer and PCIe six, so if there is not enough
buffers we fail the tunnel creation.

For the legacy Thunderbolt 1-3 devices we use the existing hard-coded
scheme except for DMA where we use the values suggested by the USB4 spec
chapter 13.

Co-developed-by: Gil Fine <gil.fine@intel.com>
Signed-off-by: Gil Fine <gil.fine@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h     |  14 ++
 drivers/thunderbolt/tunnel.c | 404 ++++++++++++++++++++++++++++-------
 drivers/thunderbolt/tunnel.h |   2 +
 3 files changed, 346 insertions(+), 74 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e2f304d4a65d..89e38aeea52b 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -213,6 +213,8 @@ struct tb_switch {
  * @list: Used to link ports to DP resources list
  * @total_credits: Total number of buffers available for this port
  * @ctl_credits: Buffers reserved for control path
+ * @dma_credits: Number of credits allocated for DMA tunneling for all
+ *		 DMA paths through this port.
  *
  * In USB4 terminology this structure represents an adapter (protocol or
  * lane adapter).
@@ -236,6 +238,7 @@ struct tb_port {
 	struct list_head list;
 	unsigned int total_credits;
 	unsigned int ctl_credits;
+	unsigned int dma_credits;
 };
 
 /**
@@ -941,6 +944,17 @@ bool tb_path_is_invalid(struct tb_path *path);
 bool tb_path_port_on_path(const struct tb_path *path,
 			  const struct tb_port *port);
 
+/**
+ * tb_path_for_each_hop() - Iterate over each hop on path
+ * @path: Path whose hops to iterate
+ * @hop: Hop used as iterator
+ *
+ * Iterates over each hop on path.
+ */
+#define tb_path_for_each_hop(path, hop)					\
+	for ((hop) = &(path)->hops[0];					\
+	     (hop) <= &(path)->hops[(path)->path_length - 1]; (hop)++)
+
 int tb_drom_read(struct tb_switch *sw);
 int tb_drom_read_uid_only(struct tb_switch *sw, u64 *uid);
 
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 5be0f31949f1..bb5cc480fc9a 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -34,6 +34,16 @@
 #define TB_DP_AUX_PATH_OUT		1
 #define TB_DP_AUX_PATH_IN		2
 
+/* Minimum number of credits needed for PCIe path */
+#define TB_MIN_PCIE_CREDITS		6U
+/*
+ * Number of credits we try to allocate for each DMA path if not limited
+ * by the host router baMaxHI.
+ */
+#define TB_DMA_CREDITS			14U
+/* Minimum number of credits for DMA path */
+#define TB_MIN_DMA_CREDITS		1U
+
 static const char * const tb_tunnel_names[] = { "PCI", "DP", "DMA", "USB3" };
 
 #define __TB_TUNNEL_PRINT(level, tunnel, fmt, arg...)                   \
@@ -57,6 +67,55 @@ static const char * const tb_tunnel_names[] = { "PCI", "DP", "DMA", "USB3" };
 #define tb_tunnel_dbg(tunnel, fmt, arg...) \
 	__TB_TUNNEL_PRINT(tb_dbg, tunnel, fmt, ##arg)
 
+static inline unsigned int tb_usable_credits(const struct tb_port *port)
+{
+	return port->total_credits - port->ctl_credits;
+}
+
+/**
+ * tb_available_credits() - Available credits for PCIe and DMA
+ * @port: Lane adapter to check
+ * @max_dp_streams: If non-%NULL stores maximum number of simultaneous DP
+ *		    streams possible through this lane adapter
+ */
+static unsigned int tb_available_credits(const struct tb_port *port,
+					 size_t *max_dp_streams)
+{
+	const struct tb_switch *sw = port->sw;
+	int credits, usb3, pcie, spare;
+	size_t ndp;
+
+	usb3 = tb_acpi_may_tunnel_usb3() ? sw->max_usb3_credits : 0;
+	pcie = tb_acpi_may_tunnel_pcie() ? sw->max_pcie_credits : 0;
+
+	if (tb_acpi_is_xdomain_allowed()) {
+		spare = min_not_zero(sw->max_dma_credits, TB_DMA_CREDITS);
+		/* Add some credits for potential second DMA tunnel */
+		spare += TB_MIN_DMA_CREDITS;
+	} else {
+		spare = 0;
+	}
+
+	credits = tb_usable_credits(port);
+	if (tb_acpi_may_tunnel_dp()) {
+		/*
+		 * Maximum number of DP streams possible through the
+		 * lane adapter.
+		 */
+		ndp = (credits - (usb3 + pcie + spare)) /
+		      (sw->min_dp_aux_credits + sw->min_dp_main_credits);
+	} else {
+		ndp = 0;
+	}
+	credits -= ndp * (sw->min_dp_aux_credits + sw->min_dp_main_credits);
+	credits -= usb3;
+
+	if (max_dp_streams)
+		*max_dp_streams = ndp;
+
+	return credits > 0 ? credits : 0;
+}
+
 static struct tb_tunnel *tb_tunnel_alloc(struct tb *tb, size_t npaths,
 					 enum tb_tunnel_type type)
 {
@@ -94,24 +153,37 @@ static int tb_pci_activate(struct tb_tunnel *tunnel, bool activate)
 	return 0;
 }
 
-static int tb_initial_credits(const struct tb_switch *sw)
+static int tb_pci_init_credits(struct tb_path_hop *hop)
 {
-	/* If the path is complete sw is not NULL */
-	if (sw) {
-		/* More credits for faster link */
-		switch (sw->link_speed * sw->link_width) {
-		case 40:
-			return 32;
-		case 20:
-			return 24;
-		}
+	struct tb_port *port = hop->in_port;
+	struct tb_switch *sw = port->sw;
+	unsigned int credits;
+
+	if (tb_port_use_credit_allocation(port)) {
+		unsigned int available;
+
+		available = tb_available_credits(port, NULL);
+		credits = min(sw->max_pcie_credits, available);
+
+		if (credits < TB_MIN_PCIE_CREDITS)
+			return -ENOSPC;
+
+		credits = max(TB_MIN_PCIE_CREDITS, credits);
+	} else {
+		if (tb_port_is_null(port))
+			credits = port->bonded ? 32 : 16;
+		else
+			credits = 7;
 	}
 
-	return 16;
+	hop->initial_credits = credits;
+	return 0;
 }
 
-static void tb_pci_init_path(struct tb_path *path)
+static int tb_pci_init_path(struct tb_path *path)
 {
+	struct tb_path_hop *hop;
+
 	path->egress_fc_enable = TB_PATH_SOURCE | TB_PATH_INTERNAL;
 	path->egress_shared_buffer = TB_PATH_NONE;
 	path->ingress_fc_enable = TB_PATH_ALL;
@@ -119,10 +191,16 @@ static void tb_pci_init_path(struct tb_path *path)
 	path->priority = 3;
 	path->weight = 1;
 	path->drop_packages = 0;
-	path->hops[0].initial_credits = 7;
-	if (path->path_length > 1)
-		path->hops[1].initial_credits =
-			tb_initial_credits(path->hops[1].in_port->sw);
+
+	tb_path_for_each_hop(path, hop) {
+		int ret;
+
+		ret = tb_pci_init_credits(hop);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 /**
@@ -162,14 +240,16 @@ struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down)
 		goto err_free;
 	}
 	tunnel->paths[TB_PCI_PATH_UP] = path;
-	tb_pci_init_path(tunnel->paths[TB_PCI_PATH_UP]);
+	if (tb_pci_init_path(tunnel->paths[TB_PCI_PATH_UP]))
+		goto err_free;
 
 	path = tb_path_discover(tunnel->dst_port, -1, down, TB_PCI_HOPID, NULL,
 				"PCIe Down");
 	if (!path)
 		goto err_deactivate;
 	tunnel->paths[TB_PCI_PATH_DOWN] = path;
-	tb_pci_init_path(tunnel->paths[TB_PCI_PATH_DOWN]);
+	if (tb_pci_init_path(tunnel->paths[TB_PCI_PATH_DOWN]))
+		goto err_deactivate;
 
 	/* Validate that the tunnel is complete */
 	if (!tb_port_is_pcie_up(tunnel->dst_port)) {
@@ -227,23 +307,25 @@ struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
 
 	path = tb_path_alloc(tb, down, TB_PCI_HOPID, up, TB_PCI_HOPID, 0,
 			     "PCIe Down");
-	if (!path) {
-		tb_tunnel_free(tunnel);
-		return NULL;
-	}
-	tb_pci_init_path(path);
+	if (!path)
+		goto err_free;
 	tunnel->paths[TB_PCI_PATH_DOWN] = path;
+	if (tb_pci_init_path(path))
+		goto err_free;
 
 	path = tb_path_alloc(tb, up, TB_PCI_HOPID, down, TB_PCI_HOPID, 0,
 			     "PCIe Up");
-	if (!path) {
-		tb_tunnel_free(tunnel);
-		return NULL;
-	}
-	tb_pci_init_path(path);
+	if (!path)
+		goto err_free;
 	tunnel->paths[TB_PCI_PATH_UP] = path;
+	if (tb_pci_init_path(path))
+		goto err_free;
 
 	return tunnel;
+
+err_free:
+	tb_tunnel_free(tunnel);
+	return NULL;
 }
 
 static bool tb_dp_is_usb4(const struct tb_switch *sw)
@@ -598,9 +680,20 @@ static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 	return 0;
 }
 
+static void tb_dp_init_aux_credits(struct tb_path_hop *hop)
+{
+	struct tb_port *port = hop->in_port;
+	struct tb_switch *sw = port->sw;
+
+	if (tb_port_use_credit_allocation(port))
+		hop->initial_credits = sw->min_dp_aux_credits;
+	else
+		hop->initial_credits = 1;
+}
+
 static void tb_dp_init_aux_path(struct tb_path *path)
 {
-	int i;
+	struct tb_path_hop *hop;
 
 	path->egress_fc_enable = TB_PATH_SOURCE | TB_PATH_INTERNAL;
 	path->egress_shared_buffer = TB_PATH_NONE;
@@ -609,13 +702,42 @@ static void tb_dp_init_aux_path(struct tb_path *path)
 	path->priority = 2;
 	path->weight = 1;
 
-	for (i = 0; i < path->path_length; i++)
-		path->hops[i].initial_credits = 1;
+	tb_path_for_each_hop(path, hop)
+		tb_dp_init_aux_credits(hop);
 }
 
-static void tb_dp_init_video_path(struct tb_path *path, bool discover)
+static int tb_dp_init_video_credits(struct tb_path_hop *hop)
 {
-	int i;
+	struct tb_port *port = hop->in_port;
+	struct tb_switch *sw = port->sw;
+
+	if (tb_port_use_credit_allocation(port)) {
+		unsigned int nfc_credits;
+		size_t max_dp_streams;
+
+		tb_available_credits(port, &max_dp_streams);
+		/*
+		 * Read the number of currently allocated NFC credits
+		 * from the lane adapter. Since we only use them for DP
+		 * tunneling we can use that to figure out how many DP
+		 * tunnels already go through the lane adapter.
+		 */
+		nfc_credits = port->config.nfc_credits &
+				ADP_CS_4_NFC_BUFFERS_MASK;
+		if (nfc_credits / sw->min_dp_main_credits > max_dp_streams)
+			return -ENOSPC;
+
+		hop->nfc_credits = sw->min_dp_main_credits;
+	} else {
+		hop->nfc_credits = min(port->total_credits - 2, 12U);
+	}
+
+	return 0;
+}
+
+static int tb_dp_init_video_path(struct tb_path *path)
+{
+	struct tb_path_hop *hop;
 
 	path->egress_fc_enable = TB_PATH_NONE;
 	path->egress_shared_buffer = TB_PATH_NONE;
@@ -624,21 +746,15 @@ static void tb_dp_init_video_path(struct tb_path *path, bool discover)
 	path->priority = 1;
 	path->weight = 1;
 
-	for (i = 0; i < path->path_length; i++) {
-		u32 nfc_credits = path->hops[i].in_port->config.nfc_credits;
-
-		if (discover) {
-			path->hops[i].nfc_credits =
-				nfc_credits & ADP_CS_4_NFC_BUFFERS_MASK;
-		} else {
-			u32 max_credits;
+	tb_path_for_each_hop(path, hop) {
+		int ret;
 
-			max_credits = (nfc_credits & ADP_CS_4_TOTAL_BUFFERS_MASK) >>
-				ADP_CS_4_TOTAL_BUFFERS_SHIFT;
-			/* Leave some credits for AUX path */
-			path->hops[i].nfc_credits = min(max_credits - 2, 12U);
-		}
+		ret = tb_dp_init_video_credits(hop);
+		if (ret)
+			return ret;
 	}
+
+	return 0;
 }
 
 /**
@@ -678,7 +794,8 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in)
 		goto err_free;
 	}
 	tunnel->paths[TB_DP_VIDEO_PATH_OUT] = path;
-	tb_dp_init_video_path(tunnel->paths[TB_DP_VIDEO_PATH_OUT], true);
+	if (tb_dp_init_video_path(tunnel->paths[TB_DP_VIDEO_PATH_OUT]))
+		goto err_free;
 
 	path = tb_path_discover(in, TB_DP_AUX_TX_HOPID, NULL, -1, NULL, "AUX TX");
 	if (!path)
@@ -765,7 +882,7 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 			     1, "Video");
 	if (!path)
 		goto err_free;
-	tb_dp_init_video_path(path, false);
+	tb_dp_init_video_path(path);
 	paths[TB_DP_VIDEO_PATH_OUT] = path;
 
 	path = tb_path_alloc(tb, in, TB_DP_AUX_TX_HOPID, out,
@@ -789,20 +906,58 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	return NULL;
 }
 
-static u32 tb_dma_credits(struct tb_port *nhi)
+static unsigned int tb_dma_available_credits(const struct tb_port *port)
 {
-	u32 max_credits;
+	const struct tb_switch *sw = port->sw;
+	int credits;
+
+	credits = tb_available_credits(port, NULL);
+	if (tb_acpi_may_tunnel_pcie())
+		credits -= sw->max_pcie_credits;
+	credits -= port->dma_credits;
 
-	max_credits = (nhi->config.nfc_credits & ADP_CS_4_TOTAL_BUFFERS_MASK) >>
-		ADP_CS_4_TOTAL_BUFFERS_SHIFT;
-	return min(max_credits, 13U);
+	return credits > 0 ? credits : 0;
 }
 
-static void tb_dma_init_path(struct tb_path *path, unsigned int efc, u32 credits)
+static int tb_dma_reserve_credits(struct tb_path_hop *hop, unsigned int credits)
 {
-	int i;
+	struct tb_port *port = hop->in_port;
+
+	if (tb_port_use_credit_allocation(port)) {
+		unsigned int available = tb_dma_available_credits(port);
+
+		/*
+		 * Need to have at least TB_MIN_DMA_CREDITS, otherwise
+		 * DMA path cannot be established.
+		 */
+		if (available < TB_MIN_DMA_CREDITS)
+			return -ENOSPC;
+
+		while (credits > available)
+			credits--;
+
+		tb_port_dbg(port, "reserving %u credits for DMA path\n",
+			    credits);
+
+		port->dma_credits += credits;
+	} else {
+		if (tb_port_is_null(port))
+			credits = port->bonded ? 14 : 6;
+		else
+			credits = min(port->total_credits, credits);
+	}
+
+	hop->initial_credits = credits;
+	return 0;
+}
+
+/* Path from lane adapter to NHI */
+static int tb_dma_init_rx_path(struct tb_path *path, unsigned int credits)
+{
+	struct tb_path_hop *hop;
+	unsigned int i, tmp;
 
-	path->egress_fc_enable = efc;
+	path->egress_fc_enable = TB_PATH_SOURCE | TB_PATH_INTERNAL;
 	path->ingress_fc_enable = TB_PATH_ALL;
 	path->egress_shared_buffer = TB_PATH_NONE;
 	path->ingress_shared_buffer = TB_PATH_NONE;
@@ -810,8 +965,80 @@ static void tb_dma_init_path(struct tb_path *path, unsigned int efc, u32 credits
 	path->weight = 1;
 	path->clear_fc = true;
 
-	for (i = 0; i < path->path_length; i++)
-		path->hops[i].initial_credits = credits;
+	/*
+	 * First lane adapter is the one connected to the remote host.
+	 * We don't tunnel other traffic over this link so can use all
+	 * the credits (except the ones reserved for control traffic).
+	 */
+	hop = &path->hops[0];
+	tmp = min(tb_usable_credits(hop->in_port), credits);
+	hop->initial_credits = tmp;
+	hop->in_port->dma_credits += tmp;
+
+	for (i = 1; i < path->path_length; i++) {
+		int ret;
+
+		ret = tb_dma_reserve_credits(&path->hops[i], credits);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* Path from NHI to lane adapter */
+static int tb_dma_init_tx_path(struct tb_path *path, unsigned int credits)
+{
+	struct tb_path_hop *hop;
+
+	path->egress_fc_enable = TB_PATH_ALL;
+	path->ingress_fc_enable = TB_PATH_ALL;
+	path->egress_shared_buffer = TB_PATH_NONE;
+	path->ingress_shared_buffer = TB_PATH_NONE;
+	path->priority = 5;
+	path->weight = 1;
+	path->clear_fc = true;
+
+	tb_path_for_each_hop(path, hop) {
+		int ret;
+
+		ret = tb_dma_reserve_credits(hop, credits);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void tb_dma_release_credits(struct tb_path_hop *hop)
+{
+	struct tb_port *port = hop->in_port;
+
+	if (tb_port_use_credit_allocation(port)) {
+		port->dma_credits -= hop->initial_credits;
+
+		tb_port_dbg(port, "released %u DMA path credits\n",
+			    hop->initial_credits);
+	}
+}
+
+static void tb_dma_deinit_path(struct tb_path *path)
+{
+	struct tb_path_hop *hop;
+
+	tb_path_for_each_hop(path, hop)
+		tb_dma_release_credits(hop);
+}
+
+static void tb_dma_deinit(struct tb_tunnel *tunnel)
+{
+	int i;
+
+	for (i = 0; i < tunnel->npaths; i++) {
+		if (!tunnel->paths[i])
+			continue;
+		tb_dma_deinit_path(tunnel->paths[i]);
+	}
 }
 
 /**
@@ -836,7 +1063,7 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 	struct tb_tunnel *tunnel;
 	size_t npaths = 0, i = 0;
 	struct tb_path *path;
-	u32 credits;
+	int credits;
 
 	if (receive_ring > 0)
 		npaths++;
@@ -852,32 +1079,39 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 
 	tunnel->src_port = nhi;
 	tunnel->dst_port = dst;
+	tunnel->deinit = tb_dma_deinit;
 
-	credits = tb_dma_credits(nhi);
+	credits = min_not_zero(TB_DMA_CREDITS, nhi->sw->max_dma_credits);
 
 	if (receive_ring > 0) {
 		path = tb_path_alloc(tb, dst, receive_path, nhi, receive_ring, 0,
 				     "DMA RX");
-		if (!path) {
-			tb_tunnel_free(tunnel);
-			return NULL;
-		}
-		tb_dma_init_path(path, TB_PATH_SOURCE | TB_PATH_INTERNAL, credits);
+		if (!path)
+			goto err_free;
 		tunnel->paths[i++] = path;
+		if (tb_dma_init_rx_path(path, credits)) {
+			tb_tunnel_dbg(tunnel, "not enough buffers for RX path\n");
+			goto err_free;
+		}
 	}
 
 	if (transmit_ring > 0) {
 		path = tb_path_alloc(tb, nhi, transmit_ring, dst, transmit_path, 0,
 				     "DMA TX");
-		if (!path) {
-			tb_tunnel_free(tunnel);
-			return NULL;
-		}
-		tb_dma_init_path(path, TB_PATH_ALL, credits);
+		if (!path)
+			goto err_free;
 		tunnel->paths[i++] = path;
+		if (tb_dma_init_tx_path(path, credits)) {
+			tb_tunnel_dbg(tunnel, "not enough buffers for TX path\n");
+			goto err_free;
+		}
 	}
 
 	return tunnel;
+
+err_free:
+	tb_tunnel_free(tunnel);
+	return NULL;
 }
 
 /**
@@ -1071,8 +1305,28 @@ static void tb_usb3_reclaim_available_bandwidth(struct tb_tunnel *tunnel,
 		      tunnel->allocated_up, tunnel->allocated_down);
 }
 
+static void tb_usb3_init_credits(struct tb_path_hop *hop)
+{
+	struct tb_port *port = hop->in_port;
+	struct tb_switch *sw = port->sw;
+	unsigned int credits;
+
+	if (tb_port_use_credit_allocation(port)) {
+		credits = sw->max_usb3_credits;
+	} else {
+		if (tb_port_is_null(port))
+			credits = port->bonded ? 32 : 16;
+		else
+			credits = 7;
+	}
+
+	hop->initial_credits = credits;
+}
+
 static void tb_usb3_init_path(struct tb_path *path)
 {
+	struct tb_path_hop *hop;
+
 	path->egress_fc_enable = TB_PATH_SOURCE | TB_PATH_INTERNAL;
 	path->egress_shared_buffer = TB_PATH_NONE;
 	path->ingress_fc_enable = TB_PATH_ALL;
@@ -1080,10 +1334,9 @@ static void tb_usb3_init_path(struct tb_path *path)
 	path->priority = 3;
 	path->weight = 3;
 	path->drop_packages = 0;
-	path->hops[0].initial_credits = 7;
-	if (path->path_length > 1)
-		path->hops[1].initial_credits =
-			tb_initial_credits(path->hops[1].in_port->sw);
+
+	tb_path_for_each_hop(path, hop)
+		tb_usb3_init_credits(hop);
 }
 
 /**
@@ -1283,6 +1536,9 @@ void tb_tunnel_free(struct tb_tunnel *tunnel)
 	if (!tunnel)
 		return;
 
+	if (tunnel->deinit)
+		tunnel->deinit(tunnel);
+
 	for (i = 0; i < tunnel->npaths; i++) {
 		if (tunnel->paths[i])
 			tb_path_free(tunnel->paths[i]);
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index a66994fb4e60..eea14e24f7e0 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -27,6 +27,7 @@ enum tb_tunnel_type {
  * @paths: All paths required by the tunnel
  * @npaths: Number of paths in @paths
  * @init: Optional tunnel specific initialization
+ * @deinit: Optional tunnel specific de-initialization
  * @activate: Optional tunnel specific activation/deactivation
  * @consumed_bandwidth: Return how much bandwidth the tunnel consumes
  * @release_unused_bandwidth: Release all unused bandwidth
@@ -47,6 +48,7 @@ struct tb_tunnel {
 	struct tb_path **paths;
 	size_t npaths;
 	int (*init)(struct tb_tunnel *tunnel);
+	void (*deinit)(struct tb_tunnel *tunnel);
 	int (*activate)(struct tb_tunnel *tunnel, bool activate);
 	int (*consumed_bandwidth)(struct tb_tunnel *tunnel, int *consumed_up,
 				  int *consumed_down);
-- 
2.30.2

