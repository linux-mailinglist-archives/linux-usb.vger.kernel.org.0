Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A583D717B49
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235406AbjEaJIC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235314AbjEaJHn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:43 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11F6125
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524054; x=1717060054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PpeVzZcGbyUvYegS7OXn5u6Us4JA//RLFBzAfz0nby0=;
  b=S83jGbBoT9xLZFhAnprcrGbsHYvwQeMiZzqI3et5X4SlEXwLqxlJ76Pq
   s6PH7kzTas1wLp1LvMYSV6/4s99m1ovQ2YYIqLgSDGh6F6KiFRedTMQh1
   qTgvWDeSDi+TZDylcHzbCH/+uww7PUCZt3irb9CVthDdCw0AwNyzbNsSn
   6mYV2oD9sPVagM6p4fJURIVX1pdam2u67N5iORQVHWJ1m/CaZ2xOo4hMJ
   1LN7nTx/q4VzBGWbAgxh5lEa25F0R0kRUVEh3tTSwyGouAUdhvnfus2mY
   bRkDvuvM+T5kduPS3fyQXtDae3v60UNHcS+GzsFh4M+lm2GB8y/gGipky
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027699"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027699"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247277"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247277"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A050511DA; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 19/20] thunderbolt: Add DisplayPort 2.x tunneling support
Date:   Wed, 31 May 2023 12:06:44 +0300
Message-Id: <20230531090645.5573-20-mika.westerberg@linux.intel.com>
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

This adds support for the UHBR (Ultra High Bit Rate) bandwidths
introduced with DisplayPort 2.0 (and refined in 2.1). These can go up to
80 Gbit/s and their support is represent in additional bits in the DP IN
capability.

This updates the DisplayPort tunneling to support these new rates too.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb_regs.h |   3 +
 drivers/thunderbolt/tunnel.c  | 100 ++++++++++++++++++++++++++++------
 2 files changed, 87 insertions(+), 16 deletions(-)

diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index c95fc7fe7adf..cf9f2370878a 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -450,6 +450,9 @@ struct tb_regs_port_header {
 #define DP_COMMON_CAP_1_LANE			0x0
 #define DP_COMMON_CAP_2_LANES			0x1
 #define DP_COMMON_CAP_4_LANES			0x2
+#define DP_COMMON_CAP_UHBR10			BIT(17)
+#define DP_COMMON_CAP_UHBR20			BIT(18)
+#define DP_COMMON_CAP_UHBR13_5			BIT(19)
 #define DP_COMMON_CAP_LTTPR_NS			BIT(27)
 #define DP_COMMON_CAP_BW_MODE			BIT(28)
 #define DP_COMMON_CAP_DPRX_DONE			BIT(31)
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 64ec0cccc0df..620dc9d240f0 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -417,6 +417,10 @@ static int tb_dp_cm_handshake(struct tb_port *in, struct tb_port *out,
 	return -ETIMEDOUT;
 }
 
+/*
+ * Returns maximum possible rate from capability supporting only DP 2.0
+ * and below. Used when DP BW allocation mode is not enabled.
+ */
 static inline u32 tb_dp_cap_get_rate(u32 val)
 {
 	u32 rate = (val & DP_COMMON_CAP_RATE_MASK) >> DP_COMMON_CAP_RATE_SHIFT;
@@ -435,6 +439,28 @@ static inline u32 tb_dp_cap_get_rate(u32 val)
 	}
 }
 
+/*
+ * Returns maximum possible rate from capability supporting DP 2.1
+ * UHBR20, 13.5 and 10 rates as well. Use only when DP BW allocation
+ * mode is enabled.
+ */
+static inline u32 tb_dp_cap_get_rate_ext(u32 val)
+{
+	if (val & DP_COMMON_CAP_UHBR20)
+		return 20000;
+	else if (val & DP_COMMON_CAP_UHBR13_5)
+		return 13500;
+	else if (val & DP_COMMON_CAP_UHBR10)
+		return 10000;
+
+	return tb_dp_cap_get_rate(val);
+}
+
+static inline bool tb_dp_is_uhbr_rate(unsigned int rate)
+{
+	return rate >= 10000;
+}
+
 static inline u32 tb_dp_cap_set_rate(u32 val, u32 rate)
 {
 	val &= ~DP_COMMON_CAP_RATE_MASK;
@@ -497,7 +523,9 @@ static inline u32 tb_dp_cap_set_lanes(u32 val, u32 lanes)
 
 static unsigned int tb_dp_bandwidth(unsigned int rate, unsigned int lanes)
 {
-	/* Tunneling removes the DP 8b/10b encoding */
+	/* Tunneling removes the DP 8b/10b 128/132b encoding */
+	if (tb_dp_is_uhbr_rate(rate))
+		return rate * lanes * 128 / 132;
 	return rate * lanes * 8 / 10;
 }
 
@@ -690,6 +718,19 @@ static int tb_dp_bandwidth_alloc_mode_enable(struct tb_tunnel *tunnel)
 	if (ret)
 		return ret;
 
+	/*
+	 * Pick up granularity that supports maximum possible bandwidth.
+	 * For that we use the UHBR rates too.
+	 */
+	in_rate = tb_dp_cap_get_rate_ext(in_dp_cap);
+	out_rate = tb_dp_cap_get_rate_ext(out_dp_cap);
+	rate = min(in_rate, out_rate);
+	tmp = tb_dp_bandwidth(rate, lanes);
+
+	tb_port_dbg(in,
+		    "maximum bandwidth through allocation mode %u Mb/s x%u = %u Mb/s\n",
+		    rate, lanes, tmp);
+
 	for (granularity = 250; tmp / granularity > 255 && granularity <= 1000;
 	     granularity *= 2)
 		;
@@ -805,15 +846,42 @@ static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
 }
 
 /* max_bw is rounded up to next granularity */
-static int tb_dp_nrd_bandwidth(struct tb_tunnel *tunnel, int *max_bw)
+static int tb_dp_bandwidth_mode_maximum_bandwidth(struct tb_tunnel *tunnel,
+						  int *max_bw)
 {
 	struct tb_port *in = tunnel->src_port;
 	int ret, rate, lanes, nrd_bw;
+	u32 cap;
 
-	ret = usb4_dp_port_nrd(in, &rate, &lanes);
+	/*
+	 * DP IN adapter DP_LOCAL_CAP gets updated to the lowest AUX
+	 * read parameter values so this so we can use this to determine
+	 * the maximum possible bandwidth over this link.
+	 *
+	 * See USB4 v2 spec 1.0 10.4.4.5.
+	 */
+	ret = tb_port_read(in, &cap, TB_CFG_PORT,
+			   in->cap_adap + DP_LOCAL_CAP, 1);
 	if (ret)
 		return ret;
 
+	rate = tb_dp_cap_get_rate_ext(cap);
+	if (tb_dp_is_uhbr_rate(rate)) {
+		/*
+		 * When UHBR is used there is no reduction in lanes so
+		 * we can use this directly.
+		 */
+		lanes = tb_dp_cap_get_lanes(cap);
+	} else {
+		/*
+		 * If there is no UHBR supported then check the
+		 * non-reduced rate and lanes.
+		 */
+		ret = usb4_dp_port_nrd(in, &rate, &lanes);
+		if (ret)
+			return ret;
+	}
+
 	nrd_bw = tb_dp_bandwidth(rate, lanes);
 
 	if (max_bw) {
@@ -846,7 +914,7 @@ static int tb_dp_bandwidth_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
 		return ret;
 	allocated_bw = ret;
 
-	ret = tb_dp_nrd_bandwidth(tunnel, &max_bw);
+	ret = tb_dp_bandwidth_mode_maximum_bandwidth(tunnel, &max_bw);
 	if (ret < 0)
 		return ret;
 	if (allocated_bw == max_bw)
@@ -884,7 +952,7 @@ static int tb_dp_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up
 			return ret;
 		allocated_bw = ret;
 
-		ret = tb_dp_nrd_bandwidth(tunnel, &max_bw);
+		ret = tb_dp_bandwidth_mode_maximum_bandwidth(tunnel, &max_bw);
 		if (ret < 0)
 			return ret;
 		if (allocated_bw == max_bw)
@@ -914,7 +982,7 @@ static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 	if (!usb4_dp_port_bandwidth_mode_enabled(in))
 		return -EOPNOTSUPP;
 
-	ret = tb_dp_nrd_bandwidth(tunnel, &max_bw);
+	ret = tb_dp_bandwidth_mode_maximum_bandwidth(tunnel, &max_bw);
 	if (ret < 0)
 		return ret;
 
@@ -937,6 +1005,9 @@ static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 	/* Now we can use BW mode registers to figure out the bandwidth */
 	/* TODO: need to handle discovery too */
 	tunnel->bw_mode = true;
+
+	tb_port_dbg(in, "allocated bandwidth through allocation mode %d Mb/s\n",
+		    tmp);
 	return 0;
 }
 
@@ -1011,23 +1082,20 @@ static int tb_dp_maximum_bandwidth(struct tb_tunnel *tunnel, int *max_up,
 				   int *max_down)
 {
 	struct tb_port *in = tunnel->src_port;
-	u32 rate, lanes;
 	int ret;
 
-	/*
-	 * DP IN adapter DP_LOCAL_CAP gets updated to the lowest AUX read
-	 * parameter values so this so we can use this to determine the
-	 * maximum possible bandwidth over this link.
-	 */
-	ret = tb_dp_read_cap(tunnel, DP_LOCAL_CAP, &rate, &lanes);
-	if (ret)
+	if (!usb4_dp_port_bandwidth_mode_enabled(in))
+		return -EOPNOTSUPP;
+
+	ret = tb_dp_bandwidth_mode_maximum_bandwidth(tunnel, NULL);
+	if (ret < 0)
 		return ret;
 
 	if (in->sw->config.depth < tunnel->dst_port->sw->config.depth) {
 		*max_up = 0;
-		*max_down = tb_dp_bandwidth(rate, lanes);
+		*max_down = ret;
 	} else {
-		*max_up = tb_dp_bandwidth(rate, lanes);
+		*max_up = ret;
 		*max_down = 0;
 	}
 
-- 
2.39.2

