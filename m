Return-Path: <linux-usb+bounces-1016-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 261E07B65AD
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 80792B20CC1
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAE511C8B;
	Tue,  3 Oct 2023 09:40:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AD311CB0
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18855BB
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326014; x=1727862014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5TUOQCI3rFoVkAw0QhbvXEfxWlkScggBPbzFv7VbAL8=;
  b=IVPpm1ljuovfMhqMPr43dSyUNy221NbxmTXNODeR65BDGHGazwYZDJl6
   ffGJGZz2lQqFrnULiTyrn41TMORDY1/rDq14xs2jMe1gPZqhyShbCTdZ+
   oqSVedepMIkReCWRExUMiDB2N+tQNR6Sljfl/Z7wTCvYqPAot37qKuYzC
   C4aPOp6muBUPO+eR+5Qcj2mfBaXPmudHulBXQakvpyNPzRZECrwR8072c
   MMezya7mVLC/EurjPI3aXJNvHSF/A/3SVTaLG1H31XOEn+N4LjC4/N73T
   Ms+ztj4OaQmV+fqfjc1yVZO+BIXnYDvsCYUgfa/+Z5Psyrd1ZaYds9ifz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1424895"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1424895"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997945480"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="997945480"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2023 02:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BB6631AE6; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 08/13] thunderbolt: Use tb_tunnel_dbg() where possible to make logging more consistent
Date: Tue,  3 Oct 2023 12:40:00 +0300
Message-Id: <20231003094005.2676823-9-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
References: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This makes it easier to find out the tunnel in question. Also drop a
couple of lines that generate duplicate information.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 65 +++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index bc82872c84a8..85b1cccf518f 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -614,8 +614,9 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 
 	in_rate = tb_dp_cap_get_rate(in_dp_cap);
 	in_lanes = tb_dp_cap_get_lanes(in_dp_cap);
-	tb_port_dbg(in, "maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
-		    in_rate, in_lanes, tb_dp_bandwidth(in_rate, in_lanes));
+	tb_tunnel_dbg(tunnel,
+		      "DP IN maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
+		      in_rate, in_lanes, tb_dp_bandwidth(in_rate, in_lanes));
 
 	/*
 	 * If the tunnel bandwidth is limited (max_bw is set) then see
@@ -624,8 +625,9 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 	out_rate = tb_dp_cap_get_rate(out_dp_cap);
 	out_lanes = tb_dp_cap_get_lanes(out_dp_cap);
 	bw = tb_dp_bandwidth(out_rate, out_lanes);
-	tb_port_dbg(out, "maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
-		    out_rate, out_lanes, bw);
+	tb_tunnel_dbg(tunnel,
+		      "DP OUT maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
+		      out_rate, out_lanes, bw);
 
 	if (in->sw->config.depth < out->sw->config.depth)
 		max_bw = tunnel->max_down;
@@ -639,13 +641,14 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 					     out_rate, out_lanes, &new_rate,
 					     &new_lanes);
 		if (ret) {
-			tb_port_info(out, "not enough bandwidth for DP tunnel\n");
+			tb_tunnel_info(tunnel, "not enough bandwidth\n");
 			return ret;
 		}
 
 		new_bw = tb_dp_bandwidth(new_rate, new_lanes);
-		tb_port_dbg(out, "bandwidth reduced to %u Mb/s x%u = %u Mb/s\n",
-			    new_rate, new_lanes, new_bw);
+		tb_tunnel_dbg(tunnel,
+			      "bandwidth reduced to %u Mb/s x%u = %u Mb/s\n",
+			      new_rate, new_lanes, new_bw);
 
 		/*
 		 * Set new rate and number of lanes before writing it to
@@ -662,7 +665,7 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 	 */
 	if (tb_route(out->sw) && tb_switch_is_titan_ridge(out->sw)) {
 		out_dp_cap |= DP_COMMON_CAP_LTTPR_NS;
-		tb_port_dbg(out, "disabling LTTPR\n");
+		tb_tunnel_dbg(tunnel, "disabling LTTPR\n");
 	}
 
 	return tb_port_write(in, &out_dp_cap, TB_CFG_PORT,
@@ -712,8 +715,8 @@ static int tb_dp_bandwidth_alloc_mode_enable(struct tb_tunnel *tunnel)
 	lanes = min(in_lanes, out_lanes);
 	tmp = tb_dp_bandwidth(rate, lanes);
 
-	tb_port_dbg(in, "non-reduced bandwidth %u Mb/s x%u = %u Mb/s\n", rate,
-		    lanes, tmp);
+	tb_tunnel_dbg(tunnel, "non-reduced bandwidth %u Mb/s x%u = %u Mb/s\n",
+		      rate, lanes, tmp);
 
 	ret = usb4_dp_port_set_nrd(in, rate, lanes);
 	if (ret)
@@ -728,15 +731,15 @@ static int tb_dp_bandwidth_alloc_mode_enable(struct tb_tunnel *tunnel)
 	rate = min(in_rate, out_rate);
 	tmp = tb_dp_bandwidth(rate, lanes);
 
-	tb_port_dbg(in,
-		    "maximum bandwidth through allocation mode %u Mb/s x%u = %u Mb/s\n",
-		    rate, lanes, tmp);
+	tb_tunnel_dbg(tunnel,
+		      "maximum bandwidth through allocation mode %u Mb/s x%u = %u Mb/s\n",
+		      rate, lanes, tmp);
 
 	for (granularity = 250; tmp / granularity > 255 && granularity <= 1000;
 	     granularity *= 2)
 		;
 
-	tb_port_dbg(in, "granularity %d Mb/s\n", granularity);
+	tb_tunnel_dbg(tunnel, "granularity %d Mb/s\n", granularity);
 
 	/*
 	 * Returns -EINVAL if granularity above is outside of the
@@ -756,7 +759,7 @@ static int tb_dp_bandwidth_alloc_mode_enable(struct tb_tunnel *tunnel)
 	else
 		estimated_bw = tunnel->max_up;
 
-	tb_port_dbg(in, "estimated bandwidth %d Mb/s\n", estimated_bw);
+	tb_tunnel_dbg(tunnel, "estimated bandwidth %d Mb/s\n", estimated_bw);
 
 	ret = usb4_dp_port_set_estimated_bandwidth(in, estimated_bw);
 	if (ret)
@@ -767,7 +770,7 @@ static int tb_dp_bandwidth_alloc_mode_enable(struct tb_tunnel *tunnel)
 	if (ret)
 		return ret;
 
-	tb_port_dbg(in, "bandwidth allocation mode enabled\n");
+	tb_tunnel_dbg(tunnel, "bandwidth allocation mode enabled\n");
 	return 0;
 }
 
@@ -788,7 +791,7 @@ static int tb_dp_init(struct tb_tunnel *tunnel)
 	if (!usb4_dp_port_bandwidth_mode_supported(in))
 		return 0;
 
-	tb_port_dbg(in, "bandwidth allocation mode supported\n");
+	tb_tunnel_dbg(tunnel, "bandwidth allocation mode supported\n");
 
 	ret = usb4_dp_port_set_cm_id(in, tb->index);
 	if (ret)
@@ -805,7 +808,7 @@ static void tb_dp_deinit(struct tb_tunnel *tunnel)
 		return;
 	if (usb4_dp_port_bandwidth_mode_enabled(in)) {
 		usb4_dp_port_set_cm_bandwidth_mode_supported(in, false);
-		tb_port_dbg(in, "bandwidth allocation mode disabled\n");
+		tb_tunnel_dbg(tunnel, "bandwidth allocation mode disabled\n");
 	}
 }
 
@@ -921,9 +924,6 @@ static int tb_dp_bandwidth_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
 	if (allocated_bw == max_bw)
 		allocated_bw = ret;
 
-	tb_port_dbg(in, "consumed bandwidth through allocation mode %d Mb/s\n",
-		    allocated_bw);
-
 	if (in->sw->config.depth < out->sw->config.depth) {
 		*consumed_up = 0;
 		*consumed_down = allocated_bw;
@@ -1006,9 +1006,6 @@ static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 	/* Now we can use BW mode registers to figure out the bandwidth */
 	/* TODO: need to handle discovery too */
 	tunnel->bw_mode = true;
-
-	tb_port_dbg(in, "allocated bandwidth through allocation mode %d Mb/s\n",
-		    tmp);
 	return 0;
 }
 
@@ -1035,8 +1032,7 @@ static int tb_dp_read_dprx(struct tb_tunnel *tunnel, u32 *rate, u32 *lanes,
 			*rate = tb_dp_cap_get_rate(val);
 			*lanes = tb_dp_cap_get_lanes(val);
 
-			tb_port_dbg(in, "consumed bandwidth through DPRX %d Mb/s\n",
-				    tb_dp_bandwidth(*rate, *lanes));
+			tb_tunnel_dbg(tunnel, "DPRX read done\n");
 			return 0;
 		}
 		usleep_range(100, 150);
@@ -1073,9 +1069,6 @@ static int tb_dp_read_cap(struct tb_tunnel *tunnel, unsigned int cap, u32 *rate,
 
 	*rate = tb_dp_cap_get_rate(val);
 	*lanes = tb_dp_cap_get_lanes(val);
-
-	tb_port_dbg(in, "bandwidth from %#x capability %d Mb/s\n", cap,
-		    tb_dp_bandwidth(*rate, *lanes));
 	return 0;
 }
 
@@ -1253,8 +1246,9 @@ static void tb_dp_dump(struct tb_tunnel *tunnel)
 	rate = tb_dp_cap_get_rate(dp_cap);
 	lanes = tb_dp_cap_get_lanes(dp_cap);
 
-	tb_port_dbg(in, "maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
-		    rate, lanes, tb_dp_bandwidth(rate, lanes));
+	tb_tunnel_dbg(tunnel,
+		      "DP IN maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
+		      rate, lanes, tb_dp_bandwidth(rate, lanes));
 
 	out = tunnel->dst_port;
 
@@ -1265,8 +1259,9 @@ static void tb_dp_dump(struct tb_tunnel *tunnel)
 	rate = tb_dp_cap_get_rate(dp_cap);
 	lanes = tb_dp_cap_get_lanes(dp_cap);
 
-	tb_port_dbg(out, "maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
-		    rate, lanes, tb_dp_bandwidth(rate, lanes));
+	tb_tunnel_dbg(tunnel,
+		      "DP OUT maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
+		      rate, lanes, tb_dp_bandwidth(rate, lanes));
 
 	if (tb_port_read(in, &dp_cap, TB_CFG_PORT,
 			 in->cap_adap + DP_REMOTE_CAP, 1))
@@ -1275,8 +1270,8 @@ static void tb_dp_dump(struct tb_tunnel *tunnel)
 	rate = tb_dp_cap_get_rate(dp_cap);
 	lanes = tb_dp_cap_get_lanes(dp_cap);
 
-	tb_port_dbg(in, "reduced bandwidth %u Mb/s x%u = %u Mb/s\n",
-		    rate, lanes, tb_dp_bandwidth(rate, lanes));
+	tb_tunnel_dbg(tunnel, "reduced bandwidth %u Mb/s x%u = %u Mb/s\n",
+		      rate, lanes, tb_dp_bandwidth(rate, lanes));
 }
 
 /**
-- 
2.40.1


