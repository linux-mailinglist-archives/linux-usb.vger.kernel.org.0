Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCBC32D332
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 13:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240854AbhCDMdZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 07:33:25 -0500
Received: from mga17.intel.com ([192.55.52.151]:23040 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240809AbhCDMdT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Mar 2021 07:33:19 -0500
IronPort-SDR: dRVZYfxFeLHwIHoAOMEdT6u6sRmyxyn4I21NnbTSmhobnFkoNIXkbUgjNhhizJUQFFYMaA3kDu
 EScIaoppN36w==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="167303975"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="167303975"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:31:33 -0800
IronPort-SDR: hh+R5OrucoXGscg3FpMq3n0aJpSgjU32WiSNdB4Fc9BSnZwH3dNZBXf9YCTjKlCcoLbFimERWt
 97MD3IBSUeLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="586729813"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 04 Mar 2021 04:31:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B13D34EB; Thu,  4 Mar 2021 14:31:26 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Subject: [PATCH 13/18] thunderbolt: Allow multiple DMA tunnels over a single XDomain connection
Date:   Thu,  4 Mar 2021 15:31:20 +0300
Message-Id: <20210304123125.43630-14-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
References: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently we have had an artificial limitation of a single DMA tunnel
per XDomain connection. However, hardware wise there is no such limit
and software based connection manager can take advantage of all the DMA
rings available on the host to establish tunnels.

For this reason make the tb_xdomain_[enable|disable]_paths() to take the
DMA ring and HopID as parameter instead of storing them in the struct
tb_xdomain. We also add API functions to allocate input and output
HopIDs of the XDomain connection that the service drivers can use
instead of hard-coding.

Also convert the two existing service drivers over to this API.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/net/thunderbolt.c      |  49 +++++++++---
 drivers/thunderbolt/dma_test.c |  35 ++++++++-
 drivers/thunderbolt/domain.c   |  24 ++++--
 drivers/thunderbolt/icm.c      |  32 +++++---
 drivers/thunderbolt/tb.c       |  48 +++++++-----
 drivers/thunderbolt/tb.h       |  16 +++-
 drivers/thunderbolt/tunnel.c   |  82 ++++++++++++++++---
 drivers/thunderbolt/tunnel.h   |   8 +-
 drivers/thunderbolt/xdomain.c  | 139 ++++++++++++++++++++++-----------
 include/linux/thunderbolt.h    |  32 +++++---
 10 files changed, 340 insertions(+), 125 deletions(-)

diff --git a/drivers/net/thunderbolt.c b/drivers/net/thunderbolt.c
index ed3743dc62b9..5c9ec91b6e78 100644
--- a/drivers/net/thunderbolt.c
+++ b/drivers/net/thunderbolt.c
@@ -28,7 +28,6 @@
 #define TBNET_LOGOUT_TIMEOUT	100
 
 #define TBNET_RING_SIZE		256
-#define TBNET_LOCAL_PATH	0xf
 #define TBNET_LOGIN_RETRIES	60
 #define TBNET_LOGOUT_RETRIES	5
 #define TBNET_MATCH_FRAGS_ID	BIT(1)
@@ -154,8 +153,8 @@ struct tbnet_ring {
  * @login_sent: ThunderboltIP login message successfully sent
  * @login_received: ThunderboltIP login message received from the remote
  *		    host
- * @transmit_path: HopID the other end needs to use building the
- *		   opposite side path.
+ * @local_transmit_path: HopID we are using to send out packets
+ * @remote_transmit_path: HopID the other end is using to send packets to us
  * @connection_lock: Lock serializing access to @login_sent,
  *		     @login_received and @transmit_path.
  * @login_retries: Number of login retries currently done
@@ -184,7 +183,8 @@ struct tbnet {
 	atomic_t command_id;
 	bool login_sent;
 	bool login_received;
-	u32 transmit_path;
+	int local_transmit_path;
+	int remote_transmit_path;
 	struct mutex connection_lock;
 	int login_retries;
 	struct delayed_work login_work;
@@ -257,7 +257,7 @@ static int tbnet_login_request(struct tbnet *net, u8 sequence)
 			  atomic_inc_return(&net->command_id));
 
 	request.proto_version = TBIP_LOGIN_PROTO_VERSION;
-	request.transmit_path = TBNET_LOCAL_PATH;
+	request.transmit_path = net->local_transmit_path;
 
 	return tb_xdomain_request(xd, &request, sizeof(request),
 				  TB_CFG_PKG_XDOMAIN_RESP, &reply,
@@ -364,10 +364,10 @@ static void tbnet_tear_down(struct tbnet *net, bool send_logout)
 	mutex_lock(&net->connection_lock);
 
 	if (net->login_sent && net->login_received) {
-		int retries = TBNET_LOGOUT_RETRIES;
+		int ret, retries = TBNET_LOGOUT_RETRIES;
 
 		while (send_logout && retries-- > 0) {
-			int ret = tbnet_logout_request(net);
+			ret = tbnet_logout_request(net);
 			if (ret != -ETIMEDOUT)
 				break;
 		}
@@ -377,8 +377,16 @@ static void tbnet_tear_down(struct tbnet *net, bool send_logout)
 		tbnet_free_buffers(&net->rx_ring);
 		tbnet_free_buffers(&net->tx_ring);
 
-		if (tb_xdomain_disable_paths(net->xd))
+		ret = tb_xdomain_disable_paths(net->xd,
+					       net->local_transmit_path,
+					       net->rx_ring.ring->hop,
+					       net->remote_transmit_path,
+					       net->tx_ring.ring->hop);
+		if (ret)
 			netdev_warn(net->dev, "failed to disable DMA paths\n");
+
+		tb_xdomain_release_in_hopid(net->xd, net->remote_transmit_path);
+		net->remote_transmit_path = 0;
 	}
 
 	net->login_retries = 0;
@@ -424,7 +432,7 @@ static int tbnet_handle_packet(const void *buf, size_t size, void *data)
 		if (!ret) {
 			mutex_lock(&net->connection_lock);
 			net->login_received = true;
-			net->transmit_path = pkg->transmit_path;
+			net->remote_transmit_path = pkg->transmit_path;
 
 			/* If we reached the number of max retries or
 			 * previous logout, schedule another round of
@@ -597,12 +605,18 @@ static void tbnet_connected_work(struct work_struct *work)
 	if (!connected)
 		return;
 
+	ret = tb_xdomain_alloc_in_hopid(net->xd, net->remote_transmit_path);
+	if (ret != net->remote_transmit_path) {
+		netdev_err(net->dev, "failed to allocate Rx HopID\n");
+		return;
+	}
+
 	/* Both logins successful so enable the high-speed DMA paths and
 	 * start the network device queue.
 	 */
-	ret = tb_xdomain_enable_paths(net->xd, TBNET_LOCAL_PATH,
+	ret = tb_xdomain_enable_paths(net->xd, net->local_transmit_path,
 				      net->rx_ring.ring->hop,
-				      net->transmit_path,
+				      net->remote_transmit_path,
 				      net->tx_ring.ring->hop);
 	if (ret) {
 		netdev_err(net->dev, "failed to enable DMA paths\n");
@@ -629,6 +643,7 @@ static void tbnet_connected_work(struct work_struct *work)
 err_stop_rings:
 	tb_ring_stop(net->rx_ring.ring);
 	tb_ring_stop(net->tx_ring.ring);
+	tb_xdomain_release_in_hopid(net->xd, net->remote_transmit_path);
 }
 
 static void tbnet_login_work(struct work_struct *work)
@@ -851,6 +866,7 @@ static int tbnet_open(struct net_device *dev)
 	struct tb_xdomain *xd = net->xd;
 	u16 sof_mask, eof_mask;
 	struct tb_ring *ring;
+	int hopid;
 
 	netif_carrier_off(dev);
 
@@ -862,6 +878,15 @@ static int tbnet_open(struct net_device *dev)
 	}
 	net->tx_ring.ring = ring;
 
+	hopid = tb_xdomain_alloc_out_hopid(xd, -1);
+	if (hopid < 0) {
+		netdev_err(dev, "failed to allocate Tx HopID\n");
+		tb_ring_free(net->tx_ring.ring);
+		net->tx_ring.ring = NULL;
+		return hopid;
+	}
+	net->local_transmit_path = hopid;
+
 	sof_mask = BIT(TBIP_PDF_FRAME_START);
 	eof_mask = BIT(TBIP_PDF_FRAME_END);
 
@@ -893,6 +918,8 @@ static int tbnet_stop(struct net_device *dev)
 
 	tb_ring_free(net->rx_ring.ring);
 	net->rx_ring.ring = NULL;
+
+	tb_xdomain_release_out_hopid(net->xd, net->local_transmit_path);
 	tb_ring_free(net->tx_ring.ring);
 	net->tx_ring.ring = NULL;
 
diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index 6debaf5a6604..3bedecb236e0 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -13,7 +13,6 @@
 #include <linux/sizes.h>
 #include <linux/thunderbolt.h>
 
-#define DMA_TEST_HOPID			8
 #define DMA_TEST_TX_RING_SIZE		64
 #define DMA_TEST_RX_RING_SIZE		256
 #define DMA_TEST_FRAME_SIZE		SZ_4K
@@ -72,7 +71,9 @@ static const char * const dma_test_result_names[] = {
  * @svc: XDomain service the driver is bound to
  * @xd: XDomain the service belongs to
  * @rx_ring: Software ring holding RX frames
+ * @rx_hopid: HopID used for receiving frames
  * @tx_ring: Software ring holding TX frames
+ * @tx_hopid: HopID used for sending fames
  * @packets_to_send: Number of packets to send
  * @packets_to_receive: Number of packets to receive
  * @packets_sent: Actual number of packets sent
@@ -92,7 +93,9 @@ struct dma_test {
 	const struct tb_service *svc;
 	struct tb_xdomain *xd;
 	struct tb_ring *rx_ring;
+	int rx_hopid;
 	struct tb_ring *tx_ring;
+	int tx_hopid;
 	unsigned int packets_to_send;
 	unsigned int packets_to_receive;
 	unsigned int packets_sent;
@@ -119,10 +122,12 @@ static void *dma_test_pattern;
 static void dma_test_free_rings(struct dma_test *dt)
 {
 	if (dt->rx_ring) {
+		tb_xdomain_release_in_hopid(dt->xd, dt->rx_hopid);
 		tb_ring_free(dt->rx_ring);
 		dt->rx_ring = NULL;
 	}
 	if (dt->tx_ring) {
+		tb_xdomain_release_out_hopid(dt->xd, dt->tx_hopid);
 		tb_ring_free(dt->tx_ring);
 		dt->tx_ring = NULL;
 	}
@@ -151,6 +156,14 @@ static int dma_test_start_rings(struct dma_test *dt)
 
 		dt->tx_ring = ring;
 		e2e_tx_hop = ring->hop;
+
+		ret = tb_xdomain_alloc_out_hopid(xd, -1);
+		if (ret < 0) {
+			dma_test_free_rings(dt);
+			return ret;
+		}
+
+		dt->tx_hopid = ret;
 	}
 
 	if (dt->packets_to_receive) {
@@ -168,11 +181,19 @@ static int dma_test_start_rings(struct dma_test *dt)
 		}
 
 		dt->rx_ring = ring;
+
+		ret = tb_xdomain_alloc_in_hopid(xd, -1);
+		if (ret < 0) {
+			dma_test_free_rings(dt);
+			return ret;
+		}
+
+		dt->rx_hopid = ret;
 	}
 
-	ret = tb_xdomain_enable_paths(dt->xd, DMA_TEST_HOPID,
+	ret = tb_xdomain_enable_paths(dt->xd, dt->tx_hopid,
 				      dt->tx_ring ? dt->tx_ring->hop : 0,
-				      DMA_TEST_HOPID,
+				      dt->rx_hopid,
 				      dt->rx_ring ? dt->rx_ring->hop : 0);
 	if (ret) {
 		dma_test_free_rings(dt);
@@ -189,12 +210,18 @@ static int dma_test_start_rings(struct dma_test *dt)
 
 static void dma_test_stop_rings(struct dma_test *dt)
 {
+	int ret;
+
 	if (dt->rx_ring)
 		tb_ring_stop(dt->rx_ring);
 	if (dt->tx_ring)
 		tb_ring_stop(dt->tx_ring);
 
-	if (tb_xdomain_disable_paths(dt->xd))
+	ret = tb_xdomain_disable_paths(dt->xd, dt->tx_hopid,
+				       dt->tx_ring ? dt->tx_ring->hop : 0,
+				       dt->rx_hopid,
+				       dt->rx_ring ? dt->rx_ring->hop : 0);
+	if (ret)
 		dev_warn(&dt->svc->dev, "failed to disable DMA paths\n");
 
 	dma_test_free_rings(dt);
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 039486b61b6a..a7d83eec3d15 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -791,6 +791,10 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb)
  * tb_domain_approve_xdomain_paths() - Enable DMA paths for XDomain
  * @tb: Domain enabling the DMA paths
  * @xd: XDomain DMA paths are created to
+ * @transmit_path: HopID we are using to send out packets
+ * @transmit_ring: DMA ring used to send out packets
+ * @receive_path: HopID the other end is using to send packets to us
+ * @receive_ring: DMA ring used to receive packets from @receive_path
  *
  * Calls connection manager specific method to enable DMA paths to the
  * XDomain in question.
@@ -799,18 +803,25 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb)
  * particular returns %-ENOTSUPP if the connection manager
  * implementation does not support XDomains.
  */
-int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
+int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+				    int transmit_path, int transmit_ring,
+				    int receive_path, int receive_ring)
 {
 	if (!tb->cm_ops->approve_xdomain_paths)
 		return -ENOTSUPP;
 
-	return tb->cm_ops->approve_xdomain_paths(tb, xd);
+	return tb->cm_ops->approve_xdomain_paths(tb, xd, transmit_path,
+			transmit_ring, receive_path, receive_ring);
 }
 
 /**
  * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
  * @tb: Domain disabling the DMA paths
  * @xd: XDomain whose DMA paths are disconnected
+ * @transmit_path: HopID we are using to send out packets
+ * @transmit_ring: DMA ring used to send out packets
+ * @receive_path: HopID the other end is using to send packets to us
+ * @receive_ring: DMA ring used to receive packets from @receive_path
  *
  * Calls connection manager specific method to disconnect DMA paths to
  * the XDomain in question.
@@ -819,12 +830,15 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
  * particular returns %-ENOTSUPP if the connection manager
  * implementation does not support XDomains.
  */
-int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
+int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+				       int transmit_path, int transmit_ring,
+				       int receive_path, int receive_ring)
 {
 	if (!tb->cm_ops->disconnect_xdomain_paths)
 		return -ENOTSUPP;
 
-	return tb->cm_ops->disconnect_xdomain_paths(tb, xd);
+	return tb->cm_ops->disconnect_xdomain_paths(tb, xd, transmit_path,
+			transmit_ring, receive_path, receive_ring);
 }
 
 static int disconnect_xdomain(struct device *dev, void *data)
@@ -835,7 +849,7 @@ static int disconnect_xdomain(struct device *dev, void *data)
 
 	xd = tb_to_xdomain(dev);
 	if (xd && xd->tb == tb)
-		ret = tb_xdomain_disable_paths(xd);
+		ret = tb_xdomain_disable_all_paths(xd);
 
 	return ret;
 }
diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index c111b946c64d..2f30b816705a 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -557,7 +557,9 @@ static int icm_fr_challenge_switch_key(struct tb *tb, struct tb_switch *sw,
 	return 0;
 }
 
-static int icm_fr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
+static int icm_fr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+					int transmit_path, int transmit_ring,
+					int receive_path, int receive_ring)
 {
 	struct icm_fr_pkg_approve_xdomain_response reply;
 	struct icm_fr_pkg_approve_xdomain request;
@@ -568,10 +570,10 @@ static int icm_fr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
 	request.link_info = xd->depth << ICM_LINK_INFO_DEPTH_SHIFT | xd->link;
 	memcpy(&request.remote_uuid, xd->remote_uuid, sizeof(*xd->remote_uuid));
 
-	request.transmit_path = xd->transmit_path;
-	request.transmit_ring = xd->transmit_ring;
-	request.receive_path = xd->receive_path;
-	request.receive_ring = xd->receive_ring;
+	request.transmit_path = transmit_path;
+	request.transmit_ring = transmit_ring;
+	request.receive_path = receive_path;
+	request.receive_ring = receive_ring;
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
@@ -585,7 +587,9 @@ static int icm_fr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
 	return 0;
 }
 
-static int icm_fr_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
+static int icm_fr_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+					   int transmit_path, int transmit_ring,
+					   int receive_path, int receive_ring)
 {
 	u8 phy_port;
 	u8 cmd;
@@ -1122,7 +1126,9 @@ static int icm_tr_challenge_switch_key(struct tb *tb, struct tb_switch *sw,
 	return 0;
 }
 
-static int icm_tr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
+static int icm_tr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+					int transmit_path, int transmit_ring,
+					int receive_path, int receive_ring)
 {
 	struct icm_tr_pkg_approve_xdomain_response reply;
 	struct icm_tr_pkg_approve_xdomain request;
@@ -1132,10 +1138,10 @@ static int icm_tr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
 	request.hdr.code = ICM_APPROVE_XDOMAIN;
 	request.route_hi = upper_32_bits(xd->route);
 	request.route_lo = lower_32_bits(xd->route);
-	request.transmit_path = xd->transmit_path;
-	request.transmit_ring = xd->transmit_ring;
-	request.receive_path = xd->receive_path;
-	request.receive_ring = xd->receive_ring;
+	request.transmit_path = transmit_path;
+	request.transmit_ring = transmit_ring;
+	request.receive_path = receive_path;
+	request.receive_ring = receive_ring;
 	memcpy(&request.remote_uuid, xd->remote_uuid, sizeof(*xd->remote_uuid));
 
 	memset(&reply, 0, sizeof(reply));
@@ -1176,7 +1182,9 @@ static int icm_tr_xdomain_tear_down(struct tb *tb, struct tb_xdomain *xd,
 	return 0;
 }
 
-static int icm_tr_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
+static int icm_tr_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+					   int transmit_path, int transmit_ring,
+					   int receive_path, int receive_ring)
 {
 	int ret;
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 4b3947965856..7e6dc2b03bed 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1079,7 +1079,9 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 	return 0;
 }
 
-static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
+static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+				    int transmit_path, int transmit_ring,
+				    int receive_path, int receive_ring)
 {
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_port *nhi_port, *dst_port;
@@ -1091,9 +1093,8 @@ static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
 	nhi_port = tb_switch_find_port(tb->root_switch, TB_TYPE_NHI);
 
 	mutex_lock(&tb->lock);
-	tunnel = tb_tunnel_alloc_dma(tb, nhi_port, dst_port, xd->transmit_ring,
-				     xd->transmit_path, xd->receive_ring,
-				     xd->receive_path);
+	tunnel = tb_tunnel_alloc_dma(tb, nhi_port, dst_port, transmit_path,
+				     transmit_ring, receive_path, receive_ring);
 	if (!tunnel) {
 		mutex_unlock(&tb->lock);
 		return -ENOMEM;
@@ -1112,29 +1113,40 @@ static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
 	return 0;
 }
 
-static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
+static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+					  int transmit_path, int transmit_ring,
+					  int receive_path, int receive_ring)
 {
-	struct tb_port *dst_port;
-	struct tb_tunnel *tunnel;
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_port *nhi_port, *dst_port;
+	struct tb_tunnel *tunnel, *n;
 	struct tb_switch *sw;
 
 	sw = tb_to_switch(xd->dev.parent);
 	dst_port = tb_port_at(xd->route, sw);
+	nhi_port = tb_switch_find_port(tb->root_switch, TB_TYPE_NHI);
 
-	/*
-	 * It is possible that the tunnel was already teared down (in
-	 * case of cable disconnect) so it is fine if we cannot find it
-	 * here anymore.
-	 */
-	tunnel = tb_find_tunnel(tb, TB_TUNNEL_DMA, NULL, dst_port);
-	tb_deactivate_and_free_tunnel(tunnel);
+	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
+		if (!tb_tunnel_is_dma(tunnel))
+			continue;
+		if (tunnel->src_port != nhi_port || tunnel->dst_port != dst_port)
+			continue;
+
+		if (tb_tunnel_match_dma(tunnel, transmit_path, transmit_ring,
+					receive_path, receive_ring))
+			tb_deactivate_and_free_tunnel(tunnel);
+	}
 }
 
-static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd)
+static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+				       int transmit_path, int transmit_ring,
+				       int receive_path, int receive_ring)
 {
 	if (!xd->is_unplugged) {
 		mutex_lock(&tb->lock);
-		__tb_disconnect_xdomain_paths(tb, xd);
+		__tb_disconnect_xdomain_paths(tb, xd, transmit_path,
+					      transmit_ring, receive_path,
+					      receive_ring);
 		mutex_unlock(&tb->lock);
 	}
 	return 0;
@@ -1210,12 +1222,12 @@ static void tb_handle_hotplug(struct work_struct *work)
 			 * tb_xdomain_remove() so setting XDomain as
 			 * unplugged here prevents deadlock if they call
 			 * tb_xdomain_disable_paths(). We will tear down
-			 * the path below.
+			 * all the tunnels below.
 			 */
 			xd->is_unplugged = true;
 			tb_xdomain_remove(xd);
 			port->xdomain = NULL;
-			__tb_disconnect_xdomain_paths(tb, xd);
+			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
 			tb_xdomain_put(xd);
 			tb_port_unconfigure_xdomain(port);
 		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ec8cdbc761fa..2af6d632e3d0 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -406,8 +406,12 @@ struct tb_cm_ops {
 	int (*challenge_switch_key)(struct tb *tb, struct tb_switch *sw,
 				    const u8 *challenge, u8 *response);
 	int (*disconnect_pcie_paths)(struct tb *tb);
-	int (*approve_xdomain_paths)(struct tb *tb, struct tb_xdomain *xd);
-	int (*disconnect_xdomain_paths)(struct tb *tb, struct tb_xdomain *xd);
+	int (*approve_xdomain_paths)(struct tb *tb, struct tb_xdomain *xd,
+				     int transmit_path, int transmit_ring,
+				     int receive_path, int receive_ring);
+	int (*disconnect_xdomain_paths)(struct tb *tb, struct tb_xdomain *xd,
+					int transmit_path, int transmit_ring,
+					int receive_path, int receive_ring);
 	int (*usb4_switch_op)(struct tb_switch *sw, u16 opcode, u32 *metadata,
 			      u8 *status, const void *tx_data, size_t tx_data_len,
 			      void *rx_data, size_t rx_data_len);
@@ -641,8 +645,12 @@ int tb_domain_approve_switch(struct tb *tb, struct tb_switch *sw);
 int tb_domain_approve_switch_key(struct tb *tb, struct tb_switch *sw);
 int tb_domain_challenge_switch_key(struct tb *tb, struct tb_switch *sw);
 int tb_domain_disconnect_pcie_paths(struct tb *tb);
-int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd);
-int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd);
+int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+				    int transmit_path, int transmit_ring,
+				    int receive_path, int receive_ring);
+int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
+				       int transmit_path, int transmit_ring,
+				       int receive_path, int receive_ring);
 int tb_domain_disconnect_all_paths(struct tb *tb);
 
 static inline struct tb *tb_domain_get(struct tb *tb)
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 2e7ec037a73e..e1979bed7146 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -815,28 +815,28 @@ static void tb_dma_init_path(struct tb_path *path, unsigned int efc, u32 credits
  * @tb: Pointer to the domain structure
  * @nhi: Host controller port
  * @dst: Destination null port which the other domain is connected to
- * @transmit_ring: NHI ring number used to send packets towards the
- *		   other domain. Set to %0 if TX path is not needed.
  * @transmit_path: HopID used for transmitting packets
- * @receive_ring: NHI ring number used to receive packets from the
- *		  other domain. Set to %0 if RX path is not needed.
+ * @transmit_ring: NHI ring number used to send packets towards the
+ *		   other domain. Set to %-1 if TX path is not needed.
  * @receive_path: HopID used for receiving packets
+ * @receive_ring: NHI ring number used to receive packets from the
+ *		  other domain. Set to %-1 if RX path is not needed.
  *
  * Return: Returns a tb_tunnel on success or NULL on failure.
  */
 struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
-				      struct tb_port *dst, int transmit_ring,
-				      int transmit_path, int receive_ring,
-				      int receive_path)
+				      struct tb_port *dst, int transmit_path,
+				      int transmit_ring, int receive_path,
+				      int receive_ring)
 {
 	struct tb_tunnel *tunnel;
 	size_t npaths = 0, i = 0;
 	struct tb_path *path;
 	u32 credits;
 
-	if (receive_ring)
+	if (receive_ring > 0)
 		npaths++;
-	if (transmit_ring)
+	if (transmit_ring > 0)
 		npaths++;
 
 	if (WARN_ON(!npaths))
@@ -851,7 +851,7 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 
 	credits = tb_dma_credits(nhi);
 
-	if (receive_ring) {
+	if (receive_ring > 0) {
 		path = tb_path_alloc(tb, dst, receive_path, nhi, receive_ring, 0,
 				     "DMA RX");
 		if (!path) {
@@ -862,7 +862,7 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 		tunnel->paths[i++] = path;
 	}
 
-	if (transmit_ring) {
+	if (transmit_ring > 0) {
 		path = tb_path_alloc(tb, nhi, transmit_ring, dst, transmit_path, 0,
 				     "DMA TX");
 		if (!path) {
@@ -876,6 +876,66 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 	return tunnel;
 }
 
+/**
+ * tb_tunnel_match_dma() - Match DMA tunnel
+ * @tunnel: Tunnel to match
+ * @transmit_path: HopID used for transmitting packets. Pass %-1 to ignore.
+ * @transmit_ring: NHI ring number used to send packets towards the
+ *		   other domain. Pass %-1 to ignore.
+ * @receive_path: HopID used for receiving packets. Pass %-1 to ignore.
+ * @receive_ring: NHI ring number used to receive packets from the
+ *		  other domain. Pass %-1 to ignore.
+ *
+ * This function can be used to match specific DMA tunnel, if there are
+ * multiple DMA tunnels going through the same XDomain connection.
+ * Returns true if there is match and false otherwise.
+ */
+bool tb_tunnel_match_dma(const struct tb_tunnel *tunnel, int transmit_path,
+			 int transmit_ring, int receive_path, int receive_ring)
+{
+	const struct tb_path *tx_path = NULL, *rx_path = NULL;
+	int i;
+
+	if (!receive_ring || !transmit_ring)
+		return false;
+
+	for (i = 0; i < tunnel->npaths; i++) {
+		const struct tb_path *path = tunnel->paths[i];
+
+		if (!path)
+			continue;
+
+		if (tb_port_is_nhi(path->hops[0].in_port))
+			tx_path = path;
+		else if (tb_port_is_nhi(path->hops[path->path_length - 1].out_port))
+			rx_path = path;
+	}
+
+	if (transmit_ring > 0 || transmit_path > 0) {
+		if (!tx_path)
+			return false;
+		if (transmit_ring > 0 &&
+		    (tx_path->hops[0].in_hop_index != transmit_ring))
+			return false;
+		if (transmit_path > 0 &&
+		    (tx_path->hops[tx_path->path_length - 1].next_hop_index != transmit_path))
+			return false;
+	}
+
+	if (receive_ring > 0 || receive_path > 0) {
+		if (!rx_path)
+			return false;
+		if (receive_path > 0 &&
+		    (rx_path->hops[0].in_hop_index != receive_path))
+			return false;
+		if (receive_ring > 0 &&
+		    (rx_path->hops[rx_path->path_length - 1].next_hop_index != receive_ring))
+			return false;
+	}
+
+	return true;
+}
+
 static int tb_usb3_max_link_rate(struct tb_port *up, struct tb_port *down)
 {
 	int ret, up_max_rate, down_max_rate;
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 1d2a64eb060d..a66994fb4e60 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -70,9 +70,11 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 				     struct tb_port *out, int max_up,
 				     int max_down);
 struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
-				      struct tb_port *dst, int transmit_ring,
-				      int transmit_path, int receive_ring,
-				      int receive_path);
+				      struct tb_port *dst, int transmit_path,
+				      int transmit_ring, int receive_path,
+				      int receive_ring);
+bool tb_tunnel_match_dma(const struct tb_tunnel *tunnel, int transmit_path,
+			 int transmit_ring, int receive_path, int receive_ring);
 struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down);
 struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 				       struct tb_port *down, int max_up,
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index ab56757d7c24..b21d99d59412 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1295,6 +1295,8 @@ static void tb_xdomain_release(struct device *dev)
 
 	kfree(xd->local_property_block);
 	tb_property_free_dir(xd->remote_properties);
+	ida_destroy(&xd->out_hopids);
+	ida_destroy(&xd->in_hopids);
 	ida_destroy(&xd->service_ids);
 
 	kfree(xd->local_uuid);
@@ -1388,6 +1390,8 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 	xd->route = route;
 	xd->local_max_hopid = down->config.max_in_hop_id;
 	ida_init(&xd->service_ids);
+	ida_init(&xd->in_hopids);
+	ida_init(&xd->out_hopids);
 	mutex_init(&xd->lock);
 	INIT_DELAYED_WORK(&xd->get_uuid_work, tb_xdomain_get_uuid);
 	INIT_DELAYED_WORK(&xd->get_properties_work, tb_xdomain_get_properties);
@@ -1553,73 +1557,118 @@ void tb_xdomain_lane_bonding_disable(struct tb_xdomain *xd)
 EXPORT_SYMBOL_GPL(tb_xdomain_lane_bonding_disable);
 
 /**
- * tb_xdomain_enable_paths() - Enable DMA paths for XDomain connection
+ * tb_xdomain_alloc_in_hopid() - Allocate input HopID for tunneling
  * @xd: XDomain connection
- * @transmit_path: HopID of the transmit path the other end is using to
- *		   send packets
- * @transmit_ring: DMA ring used to receive packets from the other end
- * @receive_path: HopID of the receive path the other end is using to
- *		  receive packets
- * @receive_ring: DMA ring used to send packets to the other end
- *
- * The function enables DMA paths accordingly so that after successful
- * return the caller can send and receive packets using high-speed DMA
- * path.
+ * @hopid: Preferred HopID or %-1 for next available
  *
- * Return: %0 in case of success and negative errno in case of error
+ * Returns allocated HopID or negative errno. Specifically returns
+ * %-ENOSPC if there are no more available HopIDs. Returned HopID is
+ * guaranteed to be within range supported by the input lane adapter.
+ * Call tb_xdomain_release_in_hopid() to release the allocated HopID.
  */
-int tb_xdomain_enable_paths(struct tb_xdomain *xd, u16 transmit_path,
-			    u16 transmit_ring, u16 receive_path,
-			    u16 receive_ring)
+int tb_xdomain_alloc_in_hopid(struct tb_xdomain *xd, int hopid)
 {
-	int ret;
+	if (hopid < 0)
+		hopid = TB_PATH_MIN_HOPID;
+	if (hopid < TB_PATH_MIN_HOPID || hopid > xd->local_max_hopid)
+		return -EINVAL;
 
-	mutex_lock(&xd->lock);
+	return ida_alloc_range(&xd->in_hopids, hopid, xd->local_max_hopid,
+			       GFP_KERNEL);
+}
+EXPORT_SYMBOL_GPL(tb_xdomain_alloc_in_hopid);
 
-	if (xd->transmit_path) {
-		ret = xd->transmit_path == transmit_path ? 0 : -EBUSY;
-		goto exit_unlock;
-	}
+/**
+ * tb_xdomain_alloc_out_hopid() - Allocate output HopID for tunneling
+ * @xd: XDomain connection
+ * @hopid: Preferred HopID or %-1 for next available
+ *
+ * Returns allocated HopID or negative errno. Specifically returns
+ * %-ENOSPC if there are no more available HopIDs. Returned HopID is
+ * guaranteed to be within range supported by the output lane adapter.
+ * Call tb_xdomain_release_in_hopid() to release the allocated HopID.
+ */
+int tb_xdomain_alloc_out_hopid(struct tb_xdomain *xd, int hopid)
+{
+	if (hopid < 0)
+		hopid = TB_PATH_MIN_HOPID;
+	if (hopid < TB_PATH_MIN_HOPID || hopid > xd->remote_max_hopid)
+		return -EINVAL;
 
-	xd->transmit_path = transmit_path;
-	xd->transmit_ring = transmit_ring;
-	xd->receive_path = receive_path;
-	xd->receive_ring = receive_ring;
+	return ida_alloc_range(&xd->out_hopids, hopid, xd->remote_max_hopid,
+			       GFP_KERNEL);
+}
+EXPORT_SYMBOL_GPL(tb_xdomain_alloc_out_hopid);
 
-	ret = tb_domain_approve_xdomain_paths(xd->tb, xd);
+/**
+ * tb_xdomain_release_in_hopid() - Release input HopID
+ * @xd: XDomain connection
+ * @hopid: HopID to release
+ */
+void tb_xdomain_release_in_hopid(struct tb_xdomain *xd, int hopid)
+{
+	ida_free(&xd->in_hopids, hopid);
+}
+EXPORT_SYMBOL_GPL(tb_xdomain_release_in_hopid);
 
-exit_unlock:
-	mutex_unlock(&xd->lock);
+/**
+ * tb_xdomain_release_out_hopid() - Release output HopID
+ * @xd: XDomain connection
+ * @hopid: HopID to release
+ */
+void tb_xdomain_release_out_hopid(struct tb_xdomain *xd, int hopid)
+{
+	ida_free(&xd->out_hopids, hopid);
+}
+EXPORT_SYMBOL_GPL(tb_xdomain_release_out_hopid);
 
-	return ret;
+/**
+ * tb_xdomain_enable_paths() - Enable DMA paths for XDomain connection
+ * @xd: XDomain connection
+ * @transmit_path: HopID we are using to send out packets
+ * @transmit_ring: DMA ring used to send out packets
+ * @receive_path: HopID the other end is using to send packets to us
+ * @receive_ring: DMA ring used to receive packets from @receive_path
+ *
+ * The function enables DMA paths accordingly so that after successful
+ * return the caller can send and receive packets using high-speed DMA
+ * path. If a transmit or receive path is not needed, pass %-1 for those
+ * parameters.
+ *
+ * Return: %0 in case of success and negative errno in case of error
+ */
+int tb_xdomain_enable_paths(struct tb_xdomain *xd, int transmit_path,
+			    int transmit_ring, int receive_path,
+			    int receive_ring)
+{
+	return tb_domain_approve_xdomain_paths(xd->tb, xd, transmit_path,
+					       transmit_ring, receive_path,
+					       receive_ring);
 }
 EXPORT_SYMBOL_GPL(tb_xdomain_enable_paths);
 
 /**
  * tb_xdomain_disable_paths() - Disable DMA paths for XDomain connection
  * @xd: XDomain connection
+ * @transmit_path: HopID we are using to send out packets
+ * @transmit_ring: DMA ring used to send out packets
+ * @receive_path: HopID the other end is using to send packets to us
+ * @receive_ring: DMA ring used to receive packets from @receive_path
  *
  * This does the opposite of tb_xdomain_enable_paths(). After call to
- * this the caller is not expected to use the rings anymore.
+ * this the caller is not expected to use the rings anymore. Passing %-1
+ * as path/ring parameter means don't care. Normally the callers should
+ * pass the same values here as they do when paths are enabled.
  *
  * Return: %0 in case of success and negative errno in case of error
  */
-int tb_xdomain_disable_paths(struct tb_xdomain *xd)
+int tb_xdomain_disable_paths(struct tb_xdomain *xd, int transmit_path,
+			     int transmit_ring, int receive_path,
+			     int receive_ring)
 {
-	int ret = 0;
-
-	mutex_lock(&xd->lock);
-	if (xd->transmit_path) {
-		xd->transmit_path = 0;
-		xd->transmit_ring = 0;
-		xd->receive_path = 0;
-		xd->receive_ring = 0;
-
-		ret = tb_domain_disconnect_xdomain_paths(xd->tb, xd);
-	}
-	mutex_unlock(&xd->lock);
-
-	return ret;
+	return tb_domain_disconnect_xdomain_paths(xd->tb, xd, transmit_path,
+						  transmit_ring, receive_path,
+						  receive_ring);
 }
 EXPORT_SYMBOL_GPL(tb_xdomain_disable_paths);
 
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 3e0ce654d60c..e7c96c37174f 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -190,11 +190,9 @@ void tb_unregister_property_dir(const char *key, struct tb_property_dir *dir);
  * @is_unplugged: The XDomain is unplugged
  * @needs_uuid: If the XDomain does not have @remote_uuid it will be
  *		queried first
- * @transmit_path: HopID which the remote end expects us to transmit
- * @transmit_ring: Local ring (hop) where outgoing packets are pushed
- * @receive_path: HopID which we expect the remote end to transmit
- * @receive_ring: Local ring (hop) where incoming packets arrive
  * @service_ids: Used to generate IDs for the services
+ * @in_hopids: Input HopIDs for DMA tunneling
+ * @out_hopids; Output HopIDs for DMA tunneling
  * @local_property_block: Local block of properties
  * @local_property_block_gen: Generation of @local_property_block
  * @local_property_block_len: Length of the @local_property_block in dwords
@@ -238,11 +236,9 @@ struct tb_xdomain {
 	unsigned int link_width;
 	bool is_unplugged;
 	bool needs_uuid;
-	u16 transmit_path;
-	u16 transmit_ring;
-	u16 receive_path;
-	u16 receive_ring;
 	struct ida service_ids;
+	struct ida in_hopids;
+	struct ida out_hopids;
 	u32 *local_property_block;
 	u32 local_property_block_gen;
 	u32 local_property_block_len;
@@ -260,10 +256,22 @@ struct tb_xdomain {
 
 int tb_xdomain_lane_bonding_enable(struct tb_xdomain *xd);
 void tb_xdomain_lane_bonding_disable(struct tb_xdomain *xd);
-int tb_xdomain_enable_paths(struct tb_xdomain *xd, u16 transmit_path,
-			    u16 transmit_ring, u16 receive_path,
-			    u16 receive_ring);
-int tb_xdomain_disable_paths(struct tb_xdomain *xd);
+int tb_xdomain_alloc_in_hopid(struct tb_xdomain *xd, int hopid);
+void tb_xdomain_release_in_hopid(struct tb_xdomain *xd, int hopid);
+int tb_xdomain_alloc_out_hopid(struct tb_xdomain *xd, int hopid);
+void tb_xdomain_release_out_hopid(struct tb_xdomain *xd, int hopid);
+int tb_xdomain_enable_paths(struct tb_xdomain *xd, int transmit_path,
+			    int transmit_ring, int receive_path,
+			    int receive_ring);
+int tb_xdomain_disable_paths(struct tb_xdomain *xd, int transmit_path,
+			     int transmit_ring, int receive_path,
+			     int receive_ring);
+
+static inline int tb_xdomain_disable_all_paths(struct tb_xdomain *xd)
+{
+	return tb_xdomain_disable_paths(xd, -1, -1, -1, -1);
+}
+
 struct tb_xdomain *tb_xdomain_find_by_uuid(struct tb *tb, const uuid_t *uuid);
 struct tb_xdomain *tb_xdomain_find_by_route(struct tb *tb, u64 route);
 
-- 
2.30.1

