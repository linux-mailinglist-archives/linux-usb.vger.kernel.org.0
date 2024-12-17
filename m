Return-Path: <linux-usb+bounces-18570-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DFF9F45FB
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C8E162677
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECF61DC747;
	Tue, 17 Dec 2024 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3vt0um4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F271DA619
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423766; cv=none; b=Aw6zmTseB+dwgJMWxP9fAGGjrMdgWxnCWs07Di+ftVSqcyA+2fEfqbtX7qRU8BdPHAs6u0Dq6tbrGpdZlMM2VijQ39H4PenStRaAT8OENdy9JWElyRdINLTWeMQbSiV7plcacuojZigcgRuvJzk3+sO27PbfkosKFZ8NnueRGhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423766; c=relaxed/simple;
	bh=/F91+/CiUKLP7E59tdXDFf5CcuBbhlJRsb0ZAN/tvVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pyObn0SIg2/UdSbfUumimkWeAm5pQrt2GxpHWW886+cmbTAx75Lvk66XRnDreIfFBuKMy1CuILLQVXTY9MpY5zZh1JhpUWGhcHB1K9li7ANHo6QoCBfNPwI+U8hGTzttNHMth3hO5xT1cS/mlJNGANZn1ydQBgkUgO4buVDOi18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3vt0um4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423763; x=1765959763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/F91+/CiUKLP7E59tdXDFf5CcuBbhlJRsb0ZAN/tvVU=;
  b=P3vt0um454JXCDTm6+BXOGH4Xqr2ZANG4gPGuc0fGzVjTqVdBPWA3hhJ
   hTUDWoM1wNembiYOy1+j+xVTLZl3xw66bw/rMPs7ndYB0ubuHWm0sJplZ
   zQ5FeQYtKhNNH62InFQgNVGk5wf6CG9m4ajUknx6wrY1j7EkiquTrhI8H
   5SUFp8MRdWJl3l7If1nNASqBXvlTqWOAIqIcAA81HcQbWfHcQXiTYZp7p
   O7wacm+dGSVva1v+CrK0Z/IsQHrwqaHb3wa+2QWHm8Op/YZhZYRpup4s3
   kz6VP54S4rA2kj9nHfgUDbeXQajqoGatY1ECc5nuNlLJj95KOoOBtq/Uz
   Q==;
X-CSE-ConnectionGUID: 5xS6tf3vQ4q7nyV64v6/Ag==
X-CSE-MsgGUID: 59u3s5jrQWCby7LY//suNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34992605"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34992605"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:37 -0800
X-CSE-ConnectionGUID: XdmDnQ0LQ7G6p8qxi4f+yw==
X-CSE-MsgGUID: d/gupBKiQh2Ki8ui7xMhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="98037694"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 00:22:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5DA18949; Tue, 17 Dec 2024 10:22:23 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 12/12] thunderbolt: Handle DisplayPort tunnel activation asynchronously
Date: Tue, 17 Dec 2024 10:22:22 +0200
Message-ID: <20241217082222.528602-13-mika.westerberg@linux.intel.com>
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

Sometimes setting up a DisplayPort tunnel may take quite long time. The
reason is that the graphics driver (DPRX) is expected to issue read of
certain monitor capabilities over the AUX channel and the "suggested"
timeout from VESA is 5 seconds. If there is no graphics driver loaded
this does not happen and currently we timeout and tear the tunnel down.
The reason for this is that at least Intel discrete USB4 controllers do
not send plug/unplug events about whether the DisplayPort cable from the
GPU to the controller is connected or not, so in order to "release" the
DisplayPort OUT adapter (the one that has monitor connected) we must
tear the tunnel down after this timeout has been elapsed.

In typical cases there is always graphics driver loaded, and also all
the cables are connected but for instance in Intel graphics CI they only
load the graphics driver after the system is fully booted up. This
makes the driver to tear down the DisplayPort tunnel. To help this case
we allow passing bigger or indefinite timeout through a new module
parameter (dprx_timeout). To keep the driver bit more responsive during
that time we change the way DisplayPort tunnels get activated. We first
do the normal tunnel setup and then run the polling of DPRX capabilities
read completion in a separate worker. This also makes the driver to
accept bandwidth requests to already established DisplayPort tunnels
more responsive.

If the tunnel still fails to establish we will tear it down and remove
the DisplayPort IN adapter from the dp_resource list to avoid using it
again (unless we get hotplug to that adapter).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c     | 174 +++++++++++++-----
 drivers/thunderbolt/test.c   |  90 ++++-----
 drivers/thunderbolt/tunnel.c | 341 +++++++++++++++++++++++------------
 drivers/thunderbolt/tunnel.h |  47 ++++-
 4 files changed, 444 insertions(+), 208 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 79ebf70f42e5..390abcfe7188 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -19,6 +19,12 @@
 #define TB_TIMEOUT		100	/* ms */
 #define TB_RELEASE_BW_TIMEOUT	10000	/* ms */
 
+/*
+ * How many time bandwidth allocation request from graphics driver is
+ * retried if the DP tunnel is still activating.
+ */
+#define TB_BW_ALLOC_RETRIES	3
+
 /*
  * Minimum bandwidth (in Mb/s) that is needed in the single transmitter/receiver
  * direction. This is 40G - 10% guard band bandwidth.
@@ -69,15 +75,20 @@ static inline struct tb *tcm_to_tb(struct tb_cm *tcm)
 }
 
 struct tb_hotplug_event {
-	struct work_struct work;
+	struct delayed_work work;
 	struct tb *tb;
 	u64 route;
 	u8 port;
 	bool unplug;
+	int retry;
 };
 
 static void tb_scan_port(struct tb_port *port);
 static void tb_handle_hotplug(struct work_struct *work);
+static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port,
+				       const char *reason);
+static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port,
+					  int retry, unsigned long delay);
 
 static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
 {
@@ -91,8 +102,8 @@ static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
 	ev->route = route;
 	ev->port = port;
 	ev->unplug = unplug;
-	INIT_WORK(&ev->work, tb_handle_hotplug);
-	queue_work(tb->wq, &ev->work);
+	INIT_DELAYED_WORK(&ev->work, tb_handle_hotplug);
+	queue_delayed_work(tb->wq, &ev->work, 0);
 }
 
 /* enumeration & hot plug handling */
@@ -962,7 +973,7 @@ static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
 	return 0;
 
 err_free:
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 err_reclaim:
 	if (tb_route(parent))
 		tb_reclaim_usb3_bandwidth(tb, down, up);
@@ -1726,7 +1737,7 @@ static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
 		break;
 	}
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 /*
@@ -1863,12 +1874,76 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 	return NULL;
 }
 
+static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
+{
+	struct tb_port *in = tunnel->src_port;
+	struct tb_port *out = tunnel->dst_port;
+	struct tb *tb = data;
+
+	mutex_lock(&tb->lock);
+	if (tb_tunnel_is_active(tunnel)) {
+		int consumed_up, consumed_down, ret;
+
+		tb_tunnel_dbg(tunnel, "DPRX capabilities read completed\n");
+
+		/* If fail reading tunnel's consumed bandwidth, tear it down */
+		ret = tb_tunnel_consumed_bandwidth(tunnel, &consumed_up,
+						   &consumed_down);
+		if (ret) {
+			tb_tunnel_warn(tunnel,
+				       "failed to read consumed bandwidth, tearing down\n");
+			tb_deactivate_and_free_tunnel(tunnel);
+		} else {
+			tb_reclaim_usb3_bandwidth(tb, in, out);
+			/*
+			 * Transition the links to asymmetric if the
+			 * consumption exceeds the threshold.
+			 */
+			tb_configure_asym(tb, in, out, consumed_up,
+					  consumed_down);
+			/*
+			 * Update the domain with the new bandwidth
+			 * estimation.
+			 */
+			tb_recalc_estimated_bandwidth(tb);
+			/*
+			 * In case of DP tunnel exists, change host
+			 * router's 1st children TMU mode to HiFi for
+			 * CL0s to work.
+			 */
+			tb_increase_tmu_accuracy(tunnel);
+		}
+	} else {
+		struct tb_port *in = tunnel->src_port;
+
+		/*
+		 * This tunnel failed to establish. This means DPRX
+		 * negotiation most likely did not complete which
+		 * happens either because there is no graphics driver
+		 * loaded or not all DP cables where connected to the
+		 * discrete router.
+		 *
+		 * In both cases we remove the DP IN adapter from the
+		 * available resources as it is not usable. This will
+		 * also tear down the tunnel and try to re-use the
+		 * released DP OUT.
+		 *
+		 * It will be added back only if there is hotplug for
+		 * the DP IN again.
+		 */
+		tb_tunnel_warn(tunnel, "not active, tearing down\n");
+		tb_dp_resource_unavailable(tb, in, "DPRX negotiation failed");
+	}
+	mutex_unlock(&tb->lock);
+
+	tb_domain_put(tb);
+}
+
 static void tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
 			     struct tb_port *out)
 {
 	int available_up, available_down, ret, link_nr;
 	struct tb_cm *tcm = tb_priv(tb);
-	int consumed_up, consumed_down;
 	struct tb_tunnel *tunnel;
 
 	/*
@@ -1920,47 +1995,29 @@ static void tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
 	       available_up, available_down);
 
 	tunnel = tb_tunnel_alloc_dp(tb, in, out, link_nr, available_up,
-				    available_down);
+				    available_down, tb_dp_tunnel_active,
+				    tb_domain_get(tb));
 	if (!tunnel) {
 		tb_port_dbg(out, "could not allocate DP tunnel\n");
 		goto err_reclaim_usb;
 	}
 
-	if (tb_tunnel_activate(tunnel)) {
+	list_add_tail(&tunnel->list, &tcm->tunnel_list);
+
+	ret = tb_tunnel_activate(tunnel);
+	if (ret && ret != -EINPROGRESS) {
 		tb_port_info(out, "DP tunnel activation failed, aborting\n");
+		list_del(&tunnel->list);
 		goto err_free;
 	}
 
-	/* If fail reading tunnel's consumed bandwidth, tear it down */
-	ret = tb_tunnel_consumed_bandwidth(tunnel, &consumed_up, &consumed_down);
-	if (ret)
-		goto err_deactivate;
-
-	list_add_tail(&tunnel->list, &tcm->tunnel_list);
-
-	tb_reclaim_usb3_bandwidth(tb, in, out);
-	/*
-	 * Transition the links to asymmetric if the consumption exceeds
-	 * the threshold.
-	 */
-	tb_configure_asym(tb, in, out, consumed_up, consumed_down);
-
-	/* Update the domain with the new bandwidth estimation */
-	tb_recalc_estimated_bandwidth(tb);
-
-	/*
-	 * In case of DP tunnel exists, change host router's 1st children
-	 * TMU mode to HiFi for CL0s to work.
-	 */
-	tb_increase_tmu_accuracy(tunnel);
 	return;
 
-err_deactivate:
-	tb_tunnel_deactivate(tunnel);
 err_free:
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 err_reclaim_usb:
 	tb_reclaim_usb3_bandwidth(tb, in, out);
+	tb_domain_put(tb);
 err_detach_group:
 	tb_detach_bandwidth_group(in);
 err_dealloc_dp:
@@ -2180,7 +2237,7 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
 
 	tb_tunnel_deactivate(tunnel);
 	list_del(&tunnel->list);
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 	return 0;
 }
 
@@ -2210,7 +2267,7 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 	if (tb_tunnel_activate(tunnel)) {
 		tb_port_info(up,
 			     "PCIe tunnel activation failed, aborting\n");
-		tb_tunnel_free(tunnel);
+		tb_tunnel_put(tunnel);
 		return -EIO;
 	}
 
@@ -2269,7 +2326,7 @@ static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	return 0;
 
 err_free:
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 err_clx:
 	tb_enable_clx(sw);
 	mutex_unlock(&tb->lock);
@@ -2332,7 +2389,7 @@ static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
  */
 static void tb_handle_hotplug(struct work_struct *work)
 {
-	struct tb_hotplug_event *ev = container_of(work, typeof(*ev), work);
+	struct tb_hotplug_event *ev = container_of(work, typeof(*ev), work.work);
 	struct tb *tb = ev->tb;
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_switch *sw;
@@ -2637,7 +2694,7 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 
 static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 {
-	struct tb_hotplug_event *ev = container_of(work, typeof(*ev), work);
+	struct tb_hotplug_event *ev = container_of(work, typeof(*ev), work.work);
 	int requested_bw, requested_up, requested_down, ret;
 	struct tb_tunnel *tunnel;
 	struct tb *tb = ev->tb;
@@ -2664,7 +2721,7 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 		goto put_sw;
 	}
 
-	tb_port_dbg(in, "handling bandwidth allocation request\n");
+	tb_port_dbg(in, "handling bandwidth allocation request, retry %d\n", ev->retry);
 
 	tunnel = tb_find_tunnel(tb, TB_TUNNEL_DP, in, NULL);
 	if (!tunnel) {
@@ -2717,12 +2774,33 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 
 	ret = tb_alloc_dp_bandwidth(tunnel, &requested_up, &requested_down);
 	if (ret) {
-		if (ret == -ENOBUFS)
+		if (ret == -ENOBUFS) {
 			tb_tunnel_warn(tunnel,
 				       "not enough bandwidth available\n");
-		else
+		} else if (ret == -ENOTCONN) {
+			tb_tunnel_dbg(tunnel, "not active yet\n");
+			/*
+			 * We got bandwidth allocation request but the
+			 * tunnel is not yet active. This means that
+			 * tb_dp_tunnel_active() is not yet called for
+			 * this tunnel. Allow it some time and retry
+			 * this request a couple of times.
+			 */
+			if (ev->retry < TB_BW_ALLOC_RETRIES) {
+				tb_tunnel_dbg(tunnel,
+					      "retrying bandwidth allocation request\n");
+				tb_queue_dp_bandwidth_request(tb, ev->route,
+							      ev->port,
+							      ev->retry + 1,
+							      msecs_to_jiffies(50));
+			} else {
+				tb_tunnel_dbg(tunnel,
+					      "run out of retries, failing the request");
+			}
+		} else {
 			tb_tunnel_warn(tunnel,
 				       "failed to change bandwidth allocation\n");
+		}
 	} else {
 		tb_tunnel_dbg(tunnel,
 			      "bandwidth allocation changed to %d/%d Mb/s\n",
@@ -2743,7 +2821,8 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 	kfree(ev);
 }
 
-static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port)
+static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port,
+					  int retry, unsigned long delay)
 {
 	struct tb_hotplug_event *ev;
 
@@ -2754,8 +2833,9 @@ static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port)
 	ev->tb = tb;
 	ev->route = route;
 	ev->port = port;
-	INIT_WORK(&ev->work, tb_handle_dp_bandwidth_request);
-	queue_work(tb->wq, &ev->work);
+	ev->retry = retry;
+	INIT_DELAYED_WORK(&ev->work, tb_handle_dp_bandwidth_request);
+	queue_delayed_work(tb->wq, &ev->work, delay);
 }
 
 static void tb_handle_notification(struct tb *tb, u64 route,
@@ -2775,7 +2855,7 @@ static void tb_handle_notification(struct tb *tb, u64 route,
 		if (tb_cfg_ack_notification(tb->ctl, route, error))
 			tb_warn(tb, "could not ack notification on %llx\n",
 				route);
-		tb_queue_dp_bandwidth_request(tb, route, error->port);
+		tb_queue_dp_bandwidth_request(tb, route, error->port, 0, 0);
 		break;
 
 	default:
@@ -2830,7 +2910,7 @@ static void tb_stop(struct tb *tb)
 		 */
 		if (tb_tunnel_is_dma(tunnel))
 			tb_tunnel_deactivate(tunnel);
-		tb_tunnel_free(tunnel);
+		tb_tunnel_put(tunnel);
 	}
 	tb_switch_remove(tb->root_switch);
 	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
@@ -3026,7 +3106,7 @@ static int tb_resume_noirq(struct tb *tb)
 		if (tb_tunnel_is_usb3(tunnel))
 			usb3_delay = 500;
 		tb_tunnel_deactivate(tunnel);
-		tb_tunnel_free(tunnel);
+		tb_tunnel_put(tunnel);
 	}
 
 	/* Re-create our tunnels now */
diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 9475c6698c7d..1f4318249c22 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -1382,8 +1382,8 @@ static void tb_test_tunnel_pcie(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[1]->hops[0].in_port, up);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[1]->hops[1].out_port, down);
 
-	tb_tunnel_free(tunnel2);
-	tb_tunnel_free(tunnel1);
+	tb_tunnel_put(tunnel2);
+	tb_tunnel_put(tunnel1);
 }
 
 static void tb_test_tunnel_dp(struct kunit *test)
@@ -1406,7 +1406,7 @@ static void tb_test_tunnel_dp(struct kunit *test)
 	in = &host->ports[5];
 	out = &dev->ports[13];
 
-	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0, NULL, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1421,7 +1421,7 @@ static void tb_test_tunnel_dp(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, tunnel->paths[2]->path_length, 2);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[0].in_port, out);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[1].out_port, in);
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_tunnel_dp_chain(struct kunit *test)
@@ -1452,7 +1452,7 @@ static void tb_test_tunnel_dp_chain(struct kunit *test)
 	in = &host->ports[5];
 	out = &dev4->ports[14];
 
-	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0, NULL, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1467,7 +1467,7 @@ static void tb_test_tunnel_dp_chain(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, tunnel->paths[2]->path_length, 3);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[0].in_port, out);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[2].out_port, in);
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_tunnel_dp_tree(struct kunit *test)
@@ -1502,7 +1502,7 @@ static void tb_test_tunnel_dp_tree(struct kunit *test)
 	in = &dev2->ports[13];
 	out = &dev5->ports[13];
 
-	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0, NULL, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1517,7 +1517,7 @@ static void tb_test_tunnel_dp_tree(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, tunnel->paths[2]->path_length, 4);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[0].in_port, out);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[3].out_port, in);
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_tunnel_dp_max_length(struct kunit *test)
@@ -1567,7 +1567,7 @@ static void tb_test_tunnel_dp_max_length(struct kunit *test)
 	in = &dev6->ports[13];
 	out = &dev12->ports[13];
 
-	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0, NULL, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, in);
@@ -1597,7 +1597,7 @@ static void tb_test_tunnel_dp_max_length(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[6].out_port,
 			    &host->ports[1]);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[12].out_port, in);
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_tunnel_3dp(struct kunit *test)
@@ -1637,7 +1637,7 @@ static void tb_test_tunnel_3dp(struct kunit *test)
 	out2 = &dev5->ports[13];
 	out3 = &dev4->ports[14];
 
-	tunnel1 = tb_tunnel_alloc_dp(NULL, in1, out1, 1, 0, 0);
+	tunnel1 = tb_tunnel_alloc_dp(NULL, in1, out1, 1, 0, 0, NULL, NULL);
 	KUNIT_ASSERT_TRUE(test, tunnel1 != NULL);
 	KUNIT_EXPECT_EQ(test, tunnel1->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel1->src_port, in1);
@@ -1645,7 +1645,7 @@ static void tb_test_tunnel_3dp(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, tunnel1->npaths, 3);
 	KUNIT_ASSERT_EQ(test, tunnel1->paths[0]->path_length, 3);
 
-	tunnel2 = tb_tunnel_alloc_dp(NULL, in2, out2, 1, 0, 0);
+	tunnel2 = tb_tunnel_alloc_dp(NULL, in2, out2, 1, 0, 0, NULL, NULL);
 	KUNIT_ASSERT_TRUE(test, tunnel2 != NULL);
 	KUNIT_EXPECT_EQ(test, tunnel2->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel2->src_port, in2);
@@ -1653,7 +1653,7 @@ static void tb_test_tunnel_3dp(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, tunnel2->npaths, 3);
 	KUNIT_ASSERT_EQ(test, tunnel2->paths[0]->path_length, 4);
 
-	tunnel3 = tb_tunnel_alloc_dp(NULL, in3, out3, 1, 0, 0);
+	tunnel3 = tb_tunnel_alloc_dp(NULL, in3, out3, 1, 0, 0, NULL, NULL);
 	KUNIT_ASSERT_TRUE(test, tunnel3 != NULL);
 	KUNIT_EXPECT_EQ(test, tunnel3->type, TB_TUNNEL_DP);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel3->src_port, in3);
@@ -1661,8 +1661,8 @@ static void tb_test_tunnel_3dp(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, tunnel3->npaths, 3);
 	KUNIT_ASSERT_EQ(test, tunnel3->paths[0]->path_length, 3);
 
-	tb_tunnel_free(tunnel2);
-	tb_tunnel_free(tunnel1);
+	tb_tunnel_put(tunnel2);
+	tb_tunnel_put(tunnel1);
 }
 
 static void tb_test_tunnel_usb3(struct kunit *test)
@@ -1716,8 +1716,8 @@ static void tb_test_tunnel_usb3(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[1]->hops[0].in_port, up);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel2->paths[1]->hops[1].out_port, down);
 
-	tb_tunnel_free(tunnel2);
-	tb_tunnel_free(tunnel1);
+	tb_tunnel_put(tunnel2);
+	tb_tunnel_put(tunnel1);
 }
 
 static void tb_test_tunnel_port_on_path(struct kunit *test)
@@ -1750,7 +1750,7 @@ static void tb_test_tunnel_port_on_path(struct kunit *test)
 	in = &dev2->ports[13];
 	out = &dev5->ports[13];
 
-	dp_tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
+	dp_tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0, NULL, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, dp_tunnel);
 
 	KUNIT_EXPECT_TRUE(test, tb_tunnel_port_on_path(dp_tunnel, in));
@@ -1783,7 +1783,7 @@ static void tb_test_tunnel_port_on_path(struct kunit *test)
 	port = &dev4->ports[1];
 	KUNIT_EXPECT_FALSE(test, tb_tunnel_port_on_path(dp_tunnel, port));
 
-	tb_tunnel_free(dp_tunnel);
+	tb_tunnel_put(dp_tunnel);
 }
 
 static void tb_test_tunnel_dma(struct kunit *test)
@@ -1826,7 +1826,7 @@ static void tb_test_tunnel_dma(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[0].out_port, port);
 	KUNIT_EXPECT_EQ(test, tunnel->paths[1]->hops[0].next_hop_index, 8);
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_tunnel_dma_rx(struct kunit *test)
@@ -1863,7 +1863,7 @@ static void tb_test_tunnel_dma_rx(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].out_port, nhi);
 	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].next_hop_index, 2);
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_tunnel_dma_tx(struct kunit *test)
@@ -1900,7 +1900,7 @@ static void tb_test_tunnel_dma_tx(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].out_port, port);
 	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].next_hop_index, 15);
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_tunnel_dma_chain(struct kunit *test)
@@ -1966,7 +1966,7 @@ static void tb_test_tunnel_dma_chain(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[2].out_port, port);
 	KUNIT_EXPECT_EQ(test, tunnel->paths[1]->hops[2].next_hop_index, 8);
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_tunnel_dma_match(struct kunit *test)
@@ -1993,7 +1993,7 @@ static void tb_test_tunnel_dma_match(struct kunit *test)
 	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, -1, -1, -1));
 	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, 8, -1, 8, -1));
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 
 	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 15, 1, -1, -1);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
@@ -2005,7 +2005,7 @@ static void tb_test_tunnel_dma_match(struct kunit *test)
 	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, -1, -1, 15, 1));
 	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, 15, 11, -1, -1));
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 
 	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, -1, -1, 15, 11);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
@@ -2017,7 +2017,7 @@ static void tb_test_tunnel_dma_match(struct kunit *test)
 	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, -1, -1, 10, 11));
 	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, 15, 11, -1, -1));
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_credit_alloc_legacy_not_bonded(struct kunit *test)
@@ -2050,7 +2050,7 @@ static void tb_test_credit_alloc_legacy_not_bonded(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 16U);
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_credit_alloc_legacy_bonded(struct kunit *test)
@@ -2083,7 +2083,7 @@ static void tb_test_credit_alloc_legacy_bonded(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_credit_alloc_pcie(struct kunit *test)
@@ -2116,7 +2116,7 @@ static void tb_test_credit_alloc_pcie(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 64U);
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_credit_alloc_without_dp(struct kunit *test)
@@ -2166,7 +2166,7 @@ static void tb_test_credit_alloc_without_dp(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 64U);
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_credit_alloc_dp(struct kunit *test)
@@ -2182,7 +2182,7 @@ static void tb_test_credit_alloc_dp(struct kunit *test)
 	in = &host->ports[5];
 	out = &dev->ports[14];
 
-	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
+	tunnel = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0, NULL, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)3);
 
@@ -2210,7 +2210,7 @@ static void tb_test_credit_alloc_dp(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_credit_alloc_usb3(struct kunit *test)
@@ -2243,7 +2243,7 @@ static void tb_test_credit_alloc_usb3(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_credit_alloc_dma(struct kunit *test)
@@ -2279,7 +2279,7 @@ static void tb_test_credit_alloc_dma(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 }
 
 static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
@@ -2356,7 +2356,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 	 * Release the first DMA tunnel. That should make 14 buffers
 	 * available for the next tunnel.
 	 */
-	tb_tunnel_free(tunnel1);
+	tb_tunnel_put(tunnel1);
 
 	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel3);
@@ -2375,8 +2375,8 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
-	tb_tunnel_free(tunnel3);
-	tb_tunnel_free(tunnel2);
+	tb_tunnel_put(tunnel3);
+	tb_tunnel_put(tunnel2);
 }
 
 static struct tb_tunnel *TB_TEST_PCIE_TUNNEL(struct kunit *test,
@@ -2418,7 +2418,7 @@ static struct tb_tunnel *TB_TEST_DP_TUNNEL1(struct kunit *test,
 
 	in = &host->ports[5];
 	out = &dev->ports[13];
-	dp_tunnel1 = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
+	dp_tunnel1 = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0, NULL, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, dp_tunnel1);
 	KUNIT_ASSERT_EQ(test, dp_tunnel1->npaths, (size_t)3);
 
@@ -2455,7 +2455,7 @@ static struct tb_tunnel *TB_TEST_DP_TUNNEL2(struct kunit *test,
 
 	in = &host->ports[6];
 	out = &dev->ports[14];
-	dp_tunnel2 = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0);
+	dp_tunnel2 = tb_tunnel_alloc_dp(NULL, in, out, 1, 0, 0, NULL, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, dp_tunnel2);
 	KUNIT_ASSERT_EQ(test, dp_tunnel2->npaths, (size_t)3);
 
@@ -2595,12 +2595,12 @@ static void tb_test_credit_alloc_all(struct kunit *test)
 	dma_tunnel1 = TB_TEST_DMA_TUNNEL1(test, host, dev);
 	dma_tunnel2 = TB_TEST_DMA_TUNNEL2(test, host, dev);
 
-	tb_tunnel_free(dma_tunnel2);
-	tb_tunnel_free(dma_tunnel1);
-	tb_tunnel_free(usb3_tunnel);
-	tb_tunnel_free(dp_tunnel2);
-	tb_tunnel_free(dp_tunnel1);
-	tb_tunnel_free(pcie_tunnel);
+	tb_tunnel_put(dma_tunnel2);
+	tb_tunnel_put(dma_tunnel1);
+	tb_tunnel_put(usb3_tunnel);
+	tb_tunnel_put(dp_tunnel2);
+	tb_tunnel_put(dp_tunnel1);
+	tb_tunnel_put(pcie_tunnel);
 }
 
 static const u32 root_directory[] = {
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index c625b5b84a7c..8229a6fbda5a 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -70,6 +70,24 @@
 #define USB4_V2_PCI_MIN_BANDWIDTH	(1500 * TB_PCI_WEIGHT)
 #define USB4_V2_USB3_MIN_BANDWIDTH	(1500 * TB_USB3_WEIGHT)
 
+/*
+ * According to VESA spec, the DPRX negotiation shall compete in 5
+ * seconds after tunnel is established. Since at least i915 can runtime
+ * suspend if there is nothing connected, and that it polls any new
+ * connections every 10 seconds, we use 12 seconds here.
+ *
+ * These are in ms.
+ */
+#define TB_DPRX_TIMEOUT			12000
+#define TB_DPRX_WAIT_TIMEOUT		25
+#define TB_DPRX_POLL_DELAY		50
+
+static int dprx_timeout = TB_DPRX_TIMEOUT;
+module_param(dprx_timeout, int, 0444);
+MODULE_PARM_DESC(dprx_timeout,
+		 "DPRX capability read timeout in ms, -1 waits forever (default: "
+		 __MODULE_STRING(TB_DPRX_TIMEOUT) ")");
+
 static unsigned int dma_credits = TB_DMA_CREDITS;
 module_param(dma_credits, uint, 0444);
 MODULE_PARM_DESC(dma_credits, "specify custom credits for DMA tunnels (default: "
@@ -82,6 +100,9 @@ MODULE_PARM_DESC(bw_alloc_mode,
 
 static const char * const tb_tunnel_names[] = { "PCI", "DP", "DMA", "USB3" };
 
+/* Synchronizes kref_get()/put() of struct tb_tunnel */
+static DEFINE_MUTEX(tb_tunnel_lock);
+
 static inline unsigned int tb_usable_credits(const struct tb_port *port)
 {
 	return port->total_credits - port->ctl_credits;
@@ -155,7 +176,7 @@ static struct tb_tunnel *tb_tunnel_alloc(struct tb *tb, size_t npaths,
 
 	tunnel->paths = kcalloc(npaths, sizeof(tunnel->paths[0]), GFP_KERNEL);
 	if (!tunnel->paths) {
-		tb_tunnel_free(tunnel);
+		kfree(tunnel);
 		return NULL;
 	}
 
@@ -163,10 +184,42 @@ static struct tb_tunnel *tb_tunnel_alloc(struct tb *tb, size_t npaths,
 	tunnel->tb = tb;
 	tunnel->npaths = npaths;
 	tunnel->type = type;
+	kref_init(&tunnel->kref);
 
 	return tunnel;
 }
 
+static void tb_tunnel_get(struct tb_tunnel *tunnel)
+{
+	mutex_lock(&tb_tunnel_lock);
+	kref_get(&tunnel->kref);
+	mutex_unlock(&tb_tunnel_lock);
+}
+
+static void tb_tunnel_destroy(struct kref *kref)
+{
+	struct tb_tunnel *tunnel = container_of(kref, typeof(*tunnel), kref);
+	int i;
+
+	if (tunnel->destroy)
+		tunnel->destroy(tunnel);
+
+	for (i = 0; i < tunnel->npaths; i++) {
+		if (tunnel->paths[i])
+			tb_path_free(tunnel->paths[i]);
+	}
+
+	kfree(tunnel->paths);
+	kfree(tunnel);
+}
+
+void tb_tunnel_put(struct tb_tunnel *tunnel)
+{
+	mutex_lock(&tb_tunnel_lock);
+	kref_put(&tunnel->kref, tb_tunnel_destroy);
+	mutex_unlock(&tb_tunnel_lock);
+}
+
 static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool enable)
 {
 	struct tb_port *port = tb_upstream_port(tunnel->dst_port->sw);
@@ -355,7 +408,7 @@ struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
 err_deactivate:
 	tb_tunnel_deactivate(tunnel);
 err_free:
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 
 	return NULL;
 }
@@ -404,7 +457,7 @@ struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
 	return tunnel;
 
 err_free:
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 	return NULL;
 }
 
@@ -889,6 +942,90 @@ static void tb_dp_post_deactivate(struct tb_tunnel *tunnel)
 	}
 }
 
+static ktime_t dprx_timeout_to_ktime(int timeout_msec)
+{
+	return timeout_msec >= 0 ?
+		ktime_add_ms(ktime_get(), timeout_msec) : KTIME_MAX;
+}
+
+static int tb_dp_wait_dprx(struct tb_tunnel *tunnel, int timeout_msec)
+{
+	ktime_t timeout = dprx_timeout_to_ktime(timeout_msec);
+	struct tb_port *in = tunnel->src_port;
+
+	/*
+	 * Wait for DPRX done. Normally it should be already set for
+	 * active tunnel.
+	 */
+	do {
+		u32 val;
+		int ret;
+
+		ret = tb_port_read(in, &val, TB_CFG_PORT,
+				   in->cap_adap + DP_COMMON_CAP, 1);
+		if (ret)
+			return ret;
+
+		if (val & DP_COMMON_CAP_DPRX_DONE)
+			return 0;
+
+		usleep_range(100, 150);
+	} while (ktime_before(ktime_get(), timeout));
+
+	tb_tunnel_dbg(tunnel, "DPRX read timeout\n");
+	return -ETIMEDOUT;
+}
+
+static void tb_dp_dprx_work(struct work_struct *work)
+{
+	struct tb_tunnel *tunnel = container_of(work, typeof(*tunnel), dprx_work.work);
+	struct tb *tb = tunnel->tb;
+
+	if (!tunnel->dprx_canceled) {
+		mutex_lock(&tb->lock);
+		if (tb_dp_is_usb4(tunnel->src_port->sw) &&
+		    tb_dp_wait_dprx(tunnel, TB_DPRX_WAIT_TIMEOUT)) {
+			if (ktime_before(ktime_get(), tunnel->dprx_timeout)) {
+				queue_delayed_work(tb->wq, &tunnel->dprx_work,
+						   msecs_to_jiffies(TB_DPRX_POLL_DELAY));
+				mutex_unlock(&tb->lock);
+				return;
+			}
+		} else {
+			tunnel->state = TB_TUNNEL_ACTIVE;
+		}
+		mutex_unlock(&tb->lock);
+	}
+
+	if (tunnel->callback)
+		tunnel->callback(tunnel, tunnel->callback_data);
+}
+
+static int tb_dp_dprx_start(struct tb_tunnel *tunnel)
+{
+	/*
+	 * Bump up the reference to keep the tunnel around. It will be
+	 * dropped in tb_dp_dprx_stop() once the tunnel is deactivated.
+	 */
+	tb_tunnel_get(tunnel);
+
+	if (tunnel->callback) {
+		tunnel->dprx_timeout = dprx_timeout_to_ktime(dprx_timeout);
+		queue_delayed_work(tunnel->tb->wq, &tunnel->dprx_work, 0);
+		return -EINPROGRESS;
+	}
+
+	return tb_dp_is_usb4(tunnel->src_port->sw) ?
+		tb_dp_wait_dprx(tunnel, dprx_timeout) : 0;
+}
+
+static void tb_dp_dprx_stop(struct tb_tunnel *tunnel)
+{
+	tunnel->dprx_canceled = true;
+	cancel_delayed_work(&tunnel->dprx_work);
+	tb_tunnel_put(tunnel);
+}
+
 static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
 {
 	int ret;
@@ -910,6 +1047,7 @@ static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
 			paths[TB_DP_AUX_PATH_IN]->hops[0].in_hop_index,
 			paths[TB_DP_AUX_PATH_OUT]->hops[last].next_hop_index);
 	} else {
+		tb_dp_dprx_stop(tunnel);
 		tb_dp_port_hpd_clear(tunnel->src_port);
 		tb_dp_port_set_hops(tunnel->src_port, 0, 0, 0);
 		if (tb_port_is_dpout(tunnel->dst_port))
@@ -920,10 +1058,13 @@ static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
 	if (ret)
 		return ret;
 
-	if (tb_port_is_dpout(tunnel->dst_port))
-		return tb_dp_port_enable(tunnel->dst_port, active);
+	if (tb_port_is_dpout(tunnel->dst_port)) {
+		ret = tb_dp_port_enable(tunnel->dst_port, active);
+		if (ret)
+			return ret;
+	}
 
-	return 0;
+	return active ? tb_dp_dprx_start(tunnel) : 0;
 }
 
 /**
@@ -1076,35 +1217,6 @@ static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 	return 0;
 }
 
-static int tb_dp_wait_dprx(struct tb_tunnel *tunnel, int timeout_msec)
-{
-	ktime_t timeout = ktime_add_ms(ktime_get(), timeout_msec);
-	struct tb_port *in = tunnel->src_port;
-
-	/*
-	 * Wait for DPRX done. Normally it should be already set for
-	 * active tunnel.
-	 */
-	do {
-		u32 val;
-		int ret;
-
-		ret = tb_port_read(in, &val, TB_CFG_PORT,
-				   in->cap_adap + DP_COMMON_CAP, 1);
-		if (ret)
-			return ret;
-
-		if (val & DP_COMMON_CAP_DPRX_DONE) {
-			tb_tunnel_dbg(tunnel, "DPRX read done\n");
-			return 0;
-		}
-		usleep_range(100, 150);
-	} while (ktime_before(ktime_get(), timeout));
-
-	tb_tunnel_dbg(tunnel, "DPRX read timeout\n");
-	return -ETIMEDOUT;
-}
-
 /* Read cap from tunnel DP IN */
 static int tb_dp_read_cap(struct tb_tunnel *tunnel, unsigned int cap, u32 *rate,
 			  u32 *lanes)
@@ -1168,35 +1280,39 @@ static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 	int ret;
 
 	if (tb_dp_is_usb4(sw)) {
-		/*
-		 * On USB4 routers check if the bandwidth allocation
-		 * mode is enabled first and then read the bandwidth
-		 * through those registers.
-		 */
-		ret = tb_dp_bandwidth_mode_consumed_bandwidth(tunnel, consumed_up,
-							      consumed_down);
-		if (ret < 0) {
-			if (ret != -EOPNOTSUPP)
+		ret = tb_dp_wait_dprx(tunnel, 0);
+		if (ret) {
+			if (ret == -ETIMEDOUT) {
+				/*
+				 * While we wait for DPRX complete the
+				 * tunnel consumes as much as it had
+				 * been reserved initially.
+				 */
+				ret = tb_dp_read_cap(tunnel, DP_REMOTE_CAP,
+						     &rate, &lanes);
+				if (ret)
+					return ret;
+			} else {
+				return ret;
+			}
+		} else {
+			/*
+			 * On USB4 routers check if the bandwidth allocation
+			 * mode is enabled first and then read the bandwidth
+			 * through those registers.
+			 */
+			ret = tb_dp_bandwidth_mode_consumed_bandwidth(tunnel, consumed_up,
+								      consumed_down);
+			if (ret < 0) {
+				if (ret != -EOPNOTSUPP)
+					return ret;
+			} else if (!ret) {
+				return 0;
+			}
+			ret = tb_dp_read_cap(tunnel, DP_COMMON_CAP, &rate, &lanes);
+			if (ret)
 				return ret;
-		} else if (!ret) {
-			return 0;
 		}
-		/*
-		 * Then see if the DPRX negotiation is ready and if yes
-		 * return that bandwidth (it may be smaller than the
-		 * reduced one). According to VESA spec, the DPRX
-		 * negotiation shall compete in 5 seconds after tunnel
-		 * established. Since at least i915 can runtime suspend
-		 * if there is nothing connected, and that it polls any
-		 * new connections every 10 seconds, we use 12 seconds
-		 * here.
-		 */
-		ret = tb_dp_wait_dprx(tunnel, 12000);
-		if (ret)
-			return ret;
-		ret = tb_dp_read_cap(tunnel, DP_COMMON_CAP, &rate, &lanes);
-		if (ret)
-			return ret;
 	} else if (sw->generation >= 2) {
 		ret = tb_dp_read_cap(tunnel, DP_REMOTE_CAP, &rate, &lanes);
 		if (ret)
@@ -1427,7 +1543,7 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 err_deactivate:
 	tb_tunnel_deactivate(tunnel);
 err_free:
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 
 	return NULL;
 }
@@ -1442,15 +1558,24 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
  *	    %0 if no available bandwidth.
  * @max_down: Maximum available downstream bandwidth for the DP tunnel.
  *	      %0 if no available bandwidth.
+ * @callback: Optional callback that is called when the DP tunnel is
+ *	      fully activated (or there is an error)
+ * @callback_data: Optional data for @callback
  *
  * Allocates a tunnel between @in and @out that is capable of tunneling
- * Display Port traffic.
+ * Display Port traffic. If @callback is not %NULL it will be called
+ * after tb_tunnel_activate() once the tunnel has been fully activated.
+ * It can call tb_tunnel_is_active() to check if activation was
+ * successful (or if it returns %false there was some sort of issue).
+ * The @callback is called without @tb->lock held.
  *
- * Return: Returns a tb_tunnel on success or NULL on failure.
+ * Return: Returns a tb_tunnel on success or &NULL on failure.
  */
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 				     struct tb_port *out, int link_nr,
-				     int max_up, int max_down)
+				     int max_up, int max_down,
+				     void (*callback)(struct tb_tunnel *, void *),
+				     void *callback_data)
 {
 	struct tb_tunnel *tunnel;
 	struct tb_path **paths;
@@ -1475,6 +1600,9 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	tunnel->dst_port = out;
 	tunnel->max_up = max_up;
 	tunnel->max_down = max_down;
+	tunnel->callback = callback;
+	tunnel->callback_data = callback_data;
+	INIT_DELAYED_WORK(&tunnel->dprx_work, tb_dp_dprx_work);
 
 	paths = tunnel->paths;
 	pm_support = usb4_switch_version(in->sw) >= 2;
@@ -1503,7 +1631,7 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	return tunnel;
 
 err_free:
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 	return NULL;
 }
 
@@ -1715,7 +1843,7 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 	return tunnel;
 
 err_free:
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 	return NULL;
 }
 
@@ -2041,7 +2169,7 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down,
 err_deactivate:
 	tb_tunnel_deactivate(tunnel);
 err_free:
-	tb_tunnel_free(tunnel);
+	tb_tunnel_put(tunnel);
 
 	return NULL;
 }
@@ -2097,7 +2225,7 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 	path = tb_path_alloc(tb, down, TB_USB3_HOPID, up, TB_USB3_HOPID, 0,
 			     "USB3 Down");
 	if (!path) {
-		tb_tunnel_free(tunnel);
+		tb_tunnel_put(tunnel);
 		return NULL;
 	}
 	tb_usb3_init_path(path);
@@ -2106,7 +2234,7 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 	path = tb_path_alloc(tb, up, TB_USB3_HOPID, down, TB_USB3_HOPID, 0,
 			     "USB3 Up");
 	if (!path) {
-		tb_tunnel_free(tunnel);
+		tb_tunnel_put(tunnel);
 		return NULL;
 	}
 	tb_usb3_init_path(path);
@@ -2127,31 +2255,6 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 	return tunnel;
 }
 
-/**
- * tb_tunnel_free() - free a tunnel
- * @tunnel: Tunnel to be freed
- *
- * Frees a tunnel. The tunnel does not need to be deactivated.
- */
-void tb_tunnel_free(struct tb_tunnel *tunnel)
-{
-	int i;
-
-	if (!tunnel)
-		return;
-
-	if (tunnel->destroy)
-		tunnel->destroy(tunnel);
-
-	for (i = 0; i < tunnel->npaths; i++) {
-		if (tunnel->paths[i])
-			tb_path_free(tunnel->paths[i]);
-	}
-
-	kfree(tunnel->paths);
-	kfree(tunnel);
-}
-
 /**
  * tb_tunnel_is_invalid - check whether an activated path is still valid
  * @tunnel: Tunnel to check
@@ -2173,7 +2276,10 @@ bool tb_tunnel_is_invalid(struct tb_tunnel *tunnel)
  * tb_tunnel_activate() - activate a tunnel
  * @tunnel: Tunnel to activate
  *
- * Return: 0 on success and negative errno in case if failure
+ * Return: 0 on success and negative errno in case if failure.
+ * Specifically returns %-EINPROGRESS if the tunnel activation is still
+ * in progress (that's for DP tunnels to complete DPRX capabilities
+ * read).
  */
 int tb_tunnel_activate(struct tb_tunnel *tunnel)
 {
@@ -2192,6 +2298,8 @@ int tb_tunnel_activate(struct tb_tunnel *tunnel)
 		}
 	}
 
+	tunnel->state = TB_TUNNEL_ACTIVATING;
+
 	if (tunnel->pre_activate) {
 		res = tunnel->pre_activate(tunnel);
 		if (res)
@@ -2206,10 +2314,14 @@ int tb_tunnel_activate(struct tb_tunnel *tunnel)
 
 	if (tunnel->activate) {
 		res = tunnel->activate(tunnel, true);
-		if (res)
+		if (res) {
+			if (res == -EINPROGRESS)
+				return res;
 			goto err;
+		}
 	}
 
+	tunnel->state = TB_TUNNEL_ACTIVE;
 	return 0;
 
 err:
@@ -2238,6 +2350,8 @@ void tb_tunnel_deactivate(struct tb_tunnel *tunnel)
 
 	if (tunnel->post_deactivate)
 		tunnel->post_deactivate(tunnel);
+
+	tunnel->state = TB_TUNNEL_INACTIVE;
 }
 
 /**
@@ -2264,18 +2378,10 @@ bool tb_tunnel_port_on_path(const struct tb_tunnel *tunnel,
 	return false;
 }
 
-static bool tb_tunnel_is_active(const struct tb_tunnel *tunnel)
+// Is tb_tunnel_activate() called for the tunnel
+static bool tb_tunnel_is_activated(const struct tb_tunnel *tunnel)
 {
-	int i;
-
-	for (i = 0; i < tunnel->npaths; i++) {
-		if (!tunnel->paths[i])
-			return false;
-		if (!tunnel->paths[i]->activated)
-			return false;
-	}
-
-	return true;
+	return tunnel->state == TB_TUNNEL_ACTIVATING || tb_tunnel_is_active(tunnel);
 }
 
 /**
@@ -2292,7 +2398,7 @@ int tb_tunnel_maximum_bandwidth(struct tb_tunnel *tunnel, int *max_up,
 				int *max_down)
 {
 	if (!tb_tunnel_is_active(tunnel))
-		return -EINVAL;
+		return -ENOTCONN;
 
 	if (tunnel->maximum_bandwidth)
 		return tunnel->maximum_bandwidth(tunnel, max_up, max_down);
@@ -2313,7 +2419,7 @@ int tb_tunnel_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up,
 				  int *allocated_down)
 {
 	if (!tb_tunnel_is_active(tunnel))
-		return -EINVAL;
+		return -ENOTCONN;
 
 	if (tunnel->allocated_bandwidth)
 		return tunnel->allocated_bandwidth(tunnel, allocated_up,
@@ -2336,7 +2442,7 @@ int tb_tunnel_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 			      int *alloc_down)
 {
 	if (!tb_tunnel_is_active(tunnel))
-		return -EINVAL;
+		return -ENOTCONN;
 
 	if (tunnel->alloc_bandwidth)
 		return tunnel->alloc_bandwidth(tunnel, alloc_up, alloc_down);
@@ -2361,7 +2467,14 @@ int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 {
 	int up_bw = 0, down_bw = 0;
 
-	if (tb_tunnel_is_active(tunnel) && tunnel->consumed_bandwidth) {
+	/*
+	 * Here we need to distinguish between not active tunnel from
+	 * tunnels that are either fully active or activation started.
+	 * The latter is true for DP tunnels where we must report the
+	 * consumed to be the maximum we gave it until DPRX capabilities
+	 * read is done by the graphics driver.
+	 */
+	if (tb_tunnel_is_activated(tunnel) && tunnel->consumed_bandwidth) {
 		int ret;
 
 		ret = tunnel->consumed_bandwidth(tunnel, &up_bw, &down_bw);
@@ -2390,7 +2503,7 @@ int tb_tunnel_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 int tb_tunnel_release_unused_bandwidth(struct tb_tunnel *tunnel)
 {
 	if (!tb_tunnel_is_active(tunnel))
-		return 0;
+		return -ENOTCONN;
 
 	if (tunnel->release_unused_bandwidth) {
 		int ret;
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 3d3ab180cb9b..7f6d3a18a41e 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -18,8 +18,21 @@ enum tb_tunnel_type {
 	TB_TUNNEL_USB3,
 };
 
+/**
+ * enum tb_tunnel_state - State of a tunnel
+ * @TB_TUNNEL_INACTIVE: tb_tunnel_activate() is not called for the tunnel
+ * @TB_TUNNEL_ACTIVATING: tb_tunnel_activate() returned successfully for the tunnel
+ * @TB_TUNNEL_ACTIVE: The tunnel is fully active
+ */
+enum tb_tunnel_state {
+	TB_TUNNEL_INACTIVE,
+	TB_TUNNEL_ACTIVATING,
+	TB_TUNNEL_ACTIVE,
+};
+
 /**
  * struct tb_tunnel - Tunnel between two ports
+ * @kref: Reference count
  * @tb: Pointer to the domain
  * @src_port: Source port of the tunnel
  * @dst_port: Destination port of the tunnel. For discovered incomplete
@@ -41,6 +54,7 @@ enum tb_tunnel_type {
  * @reclaim_available_bandwidth: Reclaim back available bandwidth
  * @list: Tunnels are linked using this field
  * @type: Type of the tunnel
+ * @state: Current state of the tunnel
  * @max_up: Maximum upstream bandwidth (Mb/s) available for the tunnel.
  *	    Only set if the bandwidth needs to be limited.
  * @max_down: Maximum downstream bandwidth (Mb/s) available for the tunnel.
@@ -49,8 +63,14 @@ enum tb_tunnel_type {
  * @allocated_down: Allocated downstream bandwidth (only for USB3)
  * @bw_mode: DP bandwidth allocation mode registers can be used to
  *	     determine consumed and allocated bandwidth
+ * @dprx_canceled: Was DPRX capabilities read poll canceled
+ * @dprx_timeout: If set DPRX capabilities read poll work will timeout after this passes
+ * @dprx_work: Worker that is scheduled to poll completion of DPRX capabilities read
+ * @callback: Optional callback called when DP tunnel is fully activated
+ * @callback_data: Optional data for @callback
  */
 struct tb_tunnel {
+	struct kref kref;
 	struct tb *tb;
 	struct tb_port *src_port;
 	struct tb_port *dst_port;
@@ -74,11 +94,17 @@ struct tb_tunnel {
 					    int *available_down);
 	struct list_head list;
 	enum tb_tunnel_type type;
+	enum tb_tunnel_state state;
 	int max_up;
 	int max_down;
 	int allocated_up;
 	int allocated_down;
 	bool bw_mode;
+	bool dprx_canceled;
+	ktime_t dprx_timeout;
+	struct delayed_work dprx_work;
+	void (*callback)(struct tb_tunnel *tunnel, void *data);
+	void *callback_data;
 };
 
 struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
@@ -91,7 +117,9 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 					bool alloc_hopid);
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 				     struct tb_port *out, int link_nr,
-				     int max_up, int max_down);
+				     int max_up, int max_down,
+				     void (*callback)(struct tb_tunnel *, void *),
+				     void *callback_data);
 struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 				      struct tb_port *dst, int transmit_path,
 				      int transmit_ring, int receive_path,
@@ -104,9 +132,24 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 				       struct tb_port *down, int max_up,
 				       int max_down);
 
-void tb_tunnel_free(struct tb_tunnel *tunnel);
+void tb_tunnel_put(struct tb_tunnel *tunnel);
 int tb_tunnel_activate(struct tb_tunnel *tunnel);
 void tb_tunnel_deactivate(struct tb_tunnel *tunnel);
+
+/**
+ * tb_tunnel_is_active() - Is tunnel fully activated
+ * @tunnel: Tunnel to check
+ *
+ * Returns %true if @tunnel is fully activated. For other than DP
+ * tunnels this is pretty much once tb_tunnel_activate() returns
+ * successfully. However, for DP tunnels this returns %true only once the
+ * DPRX capabilities read has been issued successfully.
+ */
+static inline bool tb_tunnel_is_active(const struct tb_tunnel *tunnel)
+{
+	return tunnel->state == TB_TUNNEL_ACTIVE;
+}
+
 bool tb_tunnel_is_invalid(struct tb_tunnel *tunnel);
 bool tb_tunnel_port_on_path(const struct tb_tunnel *tunnel,
 			    const struct tb_port *port);
-- 
2.45.2


