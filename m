Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3DF717B4B
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235352AbjEaJIE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235017AbjEaJHp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:45 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2BB18F
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524058; x=1717060058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=euK5OA1avKrSrQzELHszvW9+PhvaJaN6eJYlku2qM1o=;
  b=mPyMIhTqYAtafg61Scjp79ZngBYnnCLhrstPyOf5ImT4WWmmh12abu+g
   x8mWIW9FvfPG/iFAQ347H9zVAqmzCPUIk69H2jckId2gQZY99JTWKt+GI
   4jkry4HIkR7x66MKoGnnXUc6qEymd1ue7aIhD6J7DfWVctU7oqtxDuFEE
   R8D5qHjzdA1WuVLeBOSwIeCGffOdipTDvhjBsHRTIuoAe+RogOzsxyZKQ
   FIlOuSVGpsNBDKmGHetx+NVJiPwIQ/ATwjpauZLUuX8//gEgtTa6Z32h0
   oC+GWtMgTacRKtHYSxzNRqO88vWexj1Tdbj0QT12BMeERQ+J4mBR9OZfT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027713"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027713"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247281"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247281"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 9A9D2123A; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 18/20] thunderbolt: Make bandwidth allocation mode function names consistent
Date:   Wed, 31 May 2023 12:06:43 +0300
Message-Id: <20230531090645.5573-19-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
References: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Make sure the DisplayPort bandwidth allocation mode function names are
consistent with the existing ones, such as USB3.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c     | 10 ++++-----
 drivers/thunderbolt/tb.h     | 15 +++++++------
 drivers/thunderbolt/tunnel.c | 41 ++++++++++++++++++------------------
 drivers/thunderbolt/usb4.c   | 32 ++++++++++++++++------------
 4 files changed, 52 insertions(+), 46 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 79efc85db38b..62b26b7998fd 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -131,7 +131,7 @@ tb_attach_bandwidth_group(struct tb_cm *tcm, struct tb_port *in,
 static void tb_discover_bandwidth_group(struct tb_cm *tcm, struct tb_port *in,
 					struct tb_port *out)
 {
-	if (usb4_dp_port_bw_mode_enabled(in)) {
+	if (usb4_dp_port_bandwidth_mode_enabled(in)) {
 		int index, i;
 
 		index = usb4_dp_port_group_id(in);
@@ -1169,7 +1169,7 @@ tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
 		struct tb_tunnel *tunnel;
 		struct tb_port *out;
 
-		if (!usb4_dp_port_bw_mode_enabled(in))
+		if (!usb4_dp_port_bandwidth_mode_enabled(in))
 			continue;
 
 		tunnel = tb_find_tunnel(tb, TB_TUNNEL_DP, in, NULL);
@@ -1217,7 +1217,7 @@ tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
 		else
 			estimated_bw = estimated_up;
 
-		if (usb4_dp_port_set_estimated_bw(in, estimated_bw))
+		if (usb4_dp_port_set_estimated_bandwidth(in, estimated_bw))
 			tb_port_warn(in, "failed to update estimated bandwidth\n");
 	}
 
@@ -1912,12 +1912,12 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 
 	tb_port_dbg(in, "handling bandwidth allocation request\n");
 
-	if (!usb4_dp_port_bw_mode_enabled(in)) {
+	if (!usb4_dp_port_bandwidth_mode_enabled(in)) {
 		tb_port_warn(in, "bandwidth allocation mode not enabled\n");
 		goto unlock;
 	}
 
-	ret = usb4_dp_port_requested_bw(in);
+	ret = usb4_dp_port_requested_bandwidth(in);
 	if (ret < 0) {
 		if (ret == -ENODATA)
 			tb_port_dbg(in, "no bandwidth request active\n");
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 5e14baed0d5c..a89e0eb399b0 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1293,19 +1293,20 @@ int usb4_usb3_port_release_bandwidth(struct tb_port *port, int *upstream_bw,
 				     int *downstream_bw);
 
 int usb4_dp_port_set_cm_id(struct tb_port *port, int cm_id);
-bool usb4_dp_port_bw_mode_supported(struct tb_port *port);
-bool usb4_dp_port_bw_mode_enabled(struct tb_port *port);
-int usb4_dp_port_set_cm_bw_mode_supported(struct tb_port *port, bool supported);
+bool usb4_dp_port_bandwidth_mode_supported(struct tb_port *port);
+bool usb4_dp_port_bandwidth_mode_enabled(struct tb_port *port);
+int usb4_dp_port_set_cm_bandwidth_mode_supported(struct tb_port *port,
+						 bool supported);
 int usb4_dp_port_group_id(struct tb_port *port);
 int usb4_dp_port_set_group_id(struct tb_port *port, int group_id);
 int usb4_dp_port_nrd(struct tb_port *port, int *rate, int *lanes);
 int usb4_dp_port_set_nrd(struct tb_port *port, int rate, int lanes);
 int usb4_dp_port_granularity(struct tb_port *port);
 int usb4_dp_port_set_granularity(struct tb_port *port, int granularity);
-int usb4_dp_port_set_estimated_bw(struct tb_port *port, int bw);
-int usb4_dp_port_allocated_bw(struct tb_port *port);
-int usb4_dp_port_allocate_bw(struct tb_port *port, int bw);
-int usb4_dp_port_requested_bw(struct tb_port *port);
+int usb4_dp_port_set_estimated_bandwidth(struct tb_port *port, int bw);
+int usb4_dp_port_allocated_bandwidth(struct tb_port *port);
+int usb4_dp_port_allocate_bandwidth(struct tb_port *port, int bw);
+int usb4_dp_port_requested_bandwidth(struct tb_port *port);
 
 int usb4_pci_port_set_ext_encapsulation(struct tb_port *port, bool enable);
 
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index f1d0ab2b39a2..64ec0cccc0df 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -640,7 +640,7 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 			     in->cap_adap + DP_REMOTE_CAP, 1);
 }
 
-static int tb_dp_bw_alloc_mode_enable(struct tb_tunnel *tunnel)
+static int tb_dp_bandwidth_alloc_mode_enable(struct tb_tunnel *tunnel)
 {
 	int ret, estimated_bw, granularity, tmp;
 	struct tb_port *out = tunnel->dst_port;
@@ -652,7 +652,7 @@ static int tb_dp_bw_alloc_mode_enable(struct tb_tunnel *tunnel)
 	if (!bw_alloc_mode)
 		return 0;
 
-	ret = usb4_dp_port_set_cm_bw_mode_supported(in, true);
+	ret = usb4_dp_port_set_cm_bandwidth_mode_supported(in, true);
 	if (ret)
 		return ret;
 
@@ -716,12 +716,12 @@ static int tb_dp_bw_alloc_mode_enable(struct tb_tunnel *tunnel)
 
 	tb_port_dbg(in, "estimated bandwidth %d Mb/s\n", estimated_bw);
 
-	ret = usb4_dp_port_set_estimated_bw(in, estimated_bw);
+	ret = usb4_dp_port_set_estimated_bandwidth(in, estimated_bw);
 	if (ret)
 		return ret;
 
 	/* Initial allocation should be 0 according the spec */
-	ret = usb4_dp_port_allocate_bw(in, 0);
+	ret = usb4_dp_port_allocate_bandwidth(in, 0);
 	if (ret)
 		return ret;
 
@@ -743,7 +743,7 @@ static int tb_dp_init(struct tb_tunnel *tunnel)
 	if (!tb_switch_is_usb4(sw))
 		return 0;
 
-	if (!usb4_dp_port_bw_mode_supported(in))
+	if (!usb4_dp_port_bandwidth_mode_supported(in))
 		return 0;
 
 	tb_port_dbg(in, "bandwidth allocation mode supported\n");
@@ -752,17 +752,17 @@ static int tb_dp_init(struct tb_tunnel *tunnel)
 	if (ret)
 		return ret;
 
-	return tb_dp_bw_alloc_mode_enable(tunnel);
+	return tb_dp_bandwidth_alloc_mode_enable(tunnel);
 }
 
 static void tb_dp_deinit(struct tb_tunnel *tunnel)
 {
 	struct tb_port *in = tunnel->src_port;
 
-	if (!usb4_dp_port_bw_mode_supported(in))
+	if (!usb4_dp_port_bandwidth_mode_supported(in))
 		return;
-	if (usb4_dp_port_bw_mode_enabled(in)) {
-		usb4_dp_port_set_cm_bw_mode_supported(in, false);
+	if (usb4_dp_port_bandwidth_mode_enabled(in)) {
+		usb4_dp_port_set_cm_bandwidth_mode_supported(in, false);
 		tb_port_dbg(in, "bandwidth allocation mode disabled\n");
 	}
 }
@@ -826,21 +826,22 @@ static int tb_dp_nrd_bandwidth(struct tb_tunnel *tunnel, int *max_bw)
 	return nrd_bw;
 }
 
-static int tb_dp_bw_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
-					    int *consumed_up, int *consumed_down)
+static int tb_dp_bandwidth_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
+						   int *consumed_up,
+						   int *consumed_down)
 {
 	struct tb_port *out = tunnel->dst_port;
 	struct tb_port *in = tunnel->src_port;
 	int ret, allocated_bw, max_bw;
 
-	if (!usb4_dp_port_bw_mode_enabled(in))
+	if (!usb4_dp_port_bandwidth_mode_enabled(in))
 		return -EOPNOTSUPP;
 
 	if (!tunnel->bw_mode)
 		return -EOPNOTSUPP;
 
 	/* Read what was allocated previously if any */
-	ret = usb4_dp_port_allocated_bw(in);
+	ret = usb4_dp_port_allocated_bandwidth(in);
 	if (ret < 0)
 		return ret;
 	allocated_bw = ret;
@@ -875,10 +876,10 @@ static int tb_dp_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up
 	 * If we have already set the allocated bandwidth then use that.
 	 * Otherwise we read it from the DPRX.
 	 */
-	if (usb4_dp_port_bw_mode_enabled(in) && tunnel->bw_mode) {
+	if (usb4_dp_port_bandwidth_mode_enabled(in) && tunnel->bw_mode) {
 		int ret, allocated_bw, max_bw;
 
-		ret = usb4_dp_port_allocated_bw(in);
+		ret = usb4_dp_port_allocated_bandwidth(in);
 		if (ret < 0)
 			return ret;
 		allocated_bw = ret;
@@ -910,7 +911,7 @@ static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 	struct tb_port *in = tunnel->src_port;
 	int max_bw, ret, tmp;
 
-	if (!usb4_dp_port_bw_mode_enabled(in))
+	if (!usb4_dp_port_bandwidth_mode_enabled(in))
 		return -EOPNOTSUPP;
 
 	ret = tb_dp_nrd_bandwidth(tunnel, &max_bw);
@@ -919,14 +920,14 @@ static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 
 	if (in->sw->config.depth < out->sw->config.depth) {
 		tmp = min(*alloc_down, max_bw);
-		ret = usb4_dp_port_allocate_bw(in, tmp);
+		ret = usb4_dp_port_allocate_bandwidth(in, tmp);
 		if (ret)
 			return ret;
 		*alloc_down = tmp;
 		*alloc_up = 0;
 	} else {
 		tmp = min(*alloc_up, max_bw);
-		ret = usb4_dp_port_allocate_bw(in, tmp);
+		ret = usb4_dp_port_allocate_bandwidth(in, tmp);
 		if (ret)
 			return ret;
 		*alloc_down = 0;
@@ -1047,8 +1048,8 @@ static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 		 * mode is enabled first and then read the bandwidth
 		 * through those registers.
 		 */
-		ret = tb_dp_bw_mode_consumed_bandwidth(tunnel, consumed_up,
-						       consumed_down);
+		ret = tb_dp_bandwidth_mode_consumed_bandwidth(tunnel, consumed_up,
+							      consumed_down);
 		if (ret < 0) {
 			if (ret != -EOPNOTSUPP)
 				return ret;
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 2d84a53996fa..5c414a60935d 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -2294,13 +2294,14 @@ int usb4_dp_port_set_cm_id(struct tb_port *port, int cm_id)
 }
 
 /**
- * usb4_dp_port_bw_mode_supported() - Is the bandwidth allocation mode supported
+ * usb4_dp_port_bandwidth_mode_supported() - Is the bandwidth allocation mode
+ *					     supported
  * @port: DP IN adapter to check
  *
  * Can be called to any DP IN adapter. Returns true if the adapter
  * supports USB4 bandwidth allocation mode, false otherwise.
  */
-bool usb4_dp_port_bw_mode_supported(struct tb_port *port)
+bool usb4_dp_port_bandwidth_mode_supported(struct tb_port *port)
 {
 	int ret;
 	u32 val;
@@ -2317,13 +2318,14 @@ bool usb4_dp_port_bw_mode_supported(struct tb_port *port)
 }
 
 /**
- * usb4_dp_port_bw_mode_enabled() - Is the bandwidth allocation mode enabled
+ * usb4_dp_port_bandwidth_mode_enabled() - Is the bandwidth allocation mode
+ *					   enabled
  * @port: DP IN adapter to check
  *
  * Can be called to any DP IN adapter. Returns true if the bandwidth
  * allocation mode has been enabled, false otherwise.
  */
-bool usb4_dp_port_bw_mode_enabled(struct tb_port *port)
+bool usb4_dp_port_bandwidth_mode_enabled(struct tb_port *port)
 {
 	int ret;
 	u32 val;
@@ -2340,7 +2342,8 @@ bool usb4_dp_port_bw_mode_enabled(struct tb_port *port)
 }
 
 /**
- * usb4_dp_port_set_cm_bw_mode_supported() - Set/clear CM support for bandwidth allocation mode
+ * usb4_dp_port_set_cm_bandwidth_mode_supported() - Set/clear CM support for
+ *						    bandwidth allocation mode
  * @port: DP IN adapter
  * @supported: Does the CM support bandwidth allocation mode
  *
@@ -2349,7 +2352,8 @@ bool usb4_dp_port_bw_mode_enabled(struct tb_port *port)
  * otherwise. Specifically returns %-OPNOTSUPP if the passed in adapter
  * does not support this.
  */
-int usb4_dp_port_set_cm_bw_mode_supported(struct tb_port *port, bool supported)
+int usb4_dp_port_set_cm_bandwidth_mode_supported(struct tb_port *port,
+						 bool supported)
 {
 	u32 val;
 	int ret;
@@ -2623,7 +2627,7 @@ int usb4_dp_port_set_granularity(struct tb_port *port, int granularity)
 }
 
 /**
- * usb4_dp_port_set_estimated_bw() - Set estimated bandwidth
+ * usb4_dp_port_set_estimated_bandwidth() - Set estimated bandwidth
  * @port: DP IN adapter
  * @bw: Estimated bandwidth in Mb/s.
  *
@@ -2633,7 +2637,7 @@ int usb4_dp_port_set_granularity(struct tb_port *port, int granularity)
  * and negative errno otherwise. Specifically returns %-EOPNOTSUPP if
  * the adapter does not support this.
  */
-int usb4_dp_port_set_estimated_bw(struct tb_port *port, int bw)
+int usb4_dp_port_set_estimated_bandwidth(struct tb_port *port, int bw)
 {
 	u32 val, granularity;
 	int ret;
@@ -2659,14 +2663,14 @@ int usb4_dp_port_set_estimated_bw(struct tb_port *port, int bw)
 }
 
 /**
- * usb4_dp_port_allocated_bw() - Return allocated bandwidth
+ * usb4_dp_port_allocated_bandwidth() - Return allocated bandwidth
  * @port: DP IN adapter
  *
  * Reads and returns allocated bandwidth for @port in Mb/s (taking into
  * account the programmed granularity). Returns negative errno in case
  * of error.
  */
-int usb4_dp_port_allocated_bw(struct tb_port *port)
+int usb4_dp_port_allocated_bandwidth(struct tb_port *port)
 {
 	u32 val, granularity;
 	int ret;
@@ -2752,7 +2756,7 @@ static int usb4_dp_port_wait_and_clear_cm_ack(struct tb_port *port,
 }
 
 /**
- * usb4_dp_port_allocate_bw() - Set allocated bandwidth
+ * usb4_dp_port_allocate_bandwidth() - Set allocated bandwidth
  * @port: DP IN adapter
  * @bw: New allocated bandwidth in Mb/s
  *
@@ -2760,7 +2764,7 @@ static int usb4_dp_port_wait_and_clear_cm_ack(struct tb_port *port,
  * driver). Takes into account the programmed granularity. Returns %0 in
  * success and negative errno in case of error.
  */
-int usb4_dp_port_allocate_bw(struct tb_port *port, int bw)
+int usb4_dp_port_allocate_bandwidth(struct tb_port *port, int bw)
 {
 	u32 val, granularity;
 	int ret;
@@ -2794,7 +2798,7 @@ int usb4_dp_port_allocate_bw(struct tb_port *port, int bw)
 }
 
 /**
- * usb4_dp_port_requested_bw() - Read requested bandwidth
+ * usb4_dp_port_requested_bandwidth() - Read requested bandwidth
  * @port: DP IN adapter
  *
  * Reads the DPCD (graphics driver) requested bandwidth and returns it
@@ -2803,7 +2807,7 @@ int usb4_dp_port_allocate_bw(struct tb_port *port, int bw)
  * the adapter does not support bandwidth allocation mode, and %ENODATA
  * if there is no active bandwidth request from the graphics driver.
  */
-int usb4_dp_port_requested_bw(struct tb_port *port)
+int usb4_dp_port_requested_bandwidth(struct tb_port *port)
 {
 	u32 val, granularity;
 	int ret;
-- 
2.39.2

