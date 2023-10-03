Return-Path: <linux-usb+bounces-1018-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384767B65AC
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id DEE4A282854
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE620208D5;
	Tue,  3 Oct 2023 09:40:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073DD1BDF5
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE0EAD
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326014; x=1727862014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+EUpQpjC5yvBXt8j1SDyqgqPBnUIj/zMTsP76v9ysbo=;
  b=DvAgaBDxZ03kdY2irVl/67XCzU6A5QFDqPe7Qo51PJtQLskisCS7XxbI
   aE5tNLVP8ALphuYpbRUu71ZXfqzR7VYz12ylMxV8adjQycvXUP4ZeXtF2
   RLY+UmuD+HYJQKEZ5nhRD+8BDdfBVFZjD96mLGCr0ElxcC800L6QXF5xJ
   Nl30hDvpjuqIGMtBjac5tdyo1QS2c6jTd5O/LRzpjGfNLpG2Ft8rSMxK7
   izMpPwnmpyZgTZtIfbIsEdk3JhhfnQf4wcjexMBj+aevR5EPmXVTst2LI
   GgdfRxhORVRIO2IvGLJsbu+zNTFAiu2YLvO93uCVj0q4TZYp1FumJQXWk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1424900"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1424900"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997945482"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="997945482"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2023 02:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C9CE81B77; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 10/13] thunderbolt: Use tb_tunnel_xxx() log macros in tb.c
Date: Tue,  3 Oct 2023 12:40:02 +0300
Message-Id: <20231003094005.2676823-11-mika.westerberg@linux.intel.com>
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

Now that the macros are available we can use them in tb.c. This makes
the log output more consistent.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 50 ++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index fb14f70ef77d..3b3f46edfb70 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -729,7 +729,7 @@ static void tb_reclaim_usb3_bandwidth(struct tb *tb, struct tb_port *src_port,
 	if (!tunnel)
 		return;
 
-	tb_dbg(tb, "reclaiming unused bandwidth for USB3\n");
+	tb_tunnel_dbg(tunnel, "reclaiming unused bandwidth\n");
 
 	/*
 	 * Calculate available bandwidth for the first hop USB3 tunnel.
@@ -738,12 +738,12 @@ static void tb_reclaim_usb3_bandwidth(struct tb *tb, struct tb_port *src_port,
 	ret = tb_available_bandwidth(tb, tunnel->src_port, tunnel->dst_port,
 				     &available_up, &available_down);
 	if (ret) {
-		tb_warn(tb, "failed to calculate available bandwidth\n");
+		tb_tunnel_warn(tunnel, "failed to calculate available bandwidth\n");
 		return;
 	}
 
-	tb_dbg(tb, "available bandwidth for USB3 %d/%d Mb/s\n",
-	       available_up, available_down);
+	tb_tunnel_dbg(tunnel, "available bandwidth %d/%d Mb/s\n", available_up,
+		      available_down);
 
 	tb_tunnel_reclaim_available_bandwidth(tunnel, &available_up, &available_down);
 }
@@ -1188,7 +1188,7 @@ tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
 			ret = tb_release_unused_usb3_bandwidth(tb,
 				first_tunnel->src_port, first_tunnel->dst_port);
 			if (ret) {
-				tb_port_warn(in,
+				tb_tunnel_warn(tunnel,
 					"failed to release unused bandwidth\n");
 				break;
 			}
@@ -1198,7 +1198,7 @@ tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
 		ret = tb_available_bandwidth(tb, in, out, &estimated_up,
 					     &estimated_down);
 		if (ret) {
-			tb_port_warn(in,
+			tb_tunnel_warn(tunnel,
 				"failed to re-calculate estimated bandwidth\n");
 			break;
 		}
@@ -1209,8 +1209,9 @@ tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
 		 *  - available bandwidth along the path
 		 *  - bandwidth allocated for USB 3.x but not used.
 		 */
-		tb_port_dbg(in, "re-calculated estimated bandwidth %u/%u Mb/s\n",
-			    estimated_up, estimated_down);
+		tb_tunnel_dbg(tunnel,
+			      "re-calculated estimated bandwidth %u/%u Mb/s\n",
+			      estimated_up, estimated_down);
 
 		if (in->sw->config.depth < out->sw->config.depth)
 			estimated_bw = estimated_down;
@@ -1218,7 +1219,8 @@ tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
 			estimated_bw = estimated_up;
 
 		if (usb4_dp_port_set_estimated_bandwidth(in, estimated_bw))
-			tb_port_warn(in, "failed to update estimated bandwidth\n");
+			tb_tunnel_warn(tunnel,
+				       "failed to update estimated bandwidth\n");
 	}
 
 	if (first_tunnel)
@@ -1780,8 +1782,8 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 	in = tunnel->src_port;
 	out = tunnel->dst_port;
 
-	tb_port_dbg(in, "bandwidth allocated currently %d/%d Mb/s\n",
-		    allocated_up, allocated_down);
+	tb_tunnel_dbg(tunnel, "bandwidth allocated currently %d/%d Mb/s\n",
+		      allocated_up, allocated_down);
 
 	/*
 	 * If we get rounded up request from graphics side, say HBR2 x 4
@@ -1822,14 +1824,15 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 	else if (requested_down_corrected < 0)
 		requested_down_corrected = 0;
 
-	tb_port_dbg(in, "corrected bandwidth request %d/%d Mb/s\n",
-		    requested_up_corrected, requested_down_corrected);
+	tb_tunnel_dbg(tunnel, "corrected bandwidth request %d/%d Mb/s\n",
+		      requested_up_corrected, requested_down_corrected);
 
 	if ((*requested_up >= 0 && requested_up_corrected > max_up_rounded) ||
 	    (*requested_down >= 0 && requested_down_corrected > max_down_rounded)) {
-		tb_port_dbg(in, "bandwidth request too high (%d/%d Mb/s > %d/%d Mb/s)\n",
-			    requested_up_corrected, requested_down_corrected,
-			    max_up_rounded, max_down_rounded);
+		tb_tunnel_dbg(tunnel,
+			      "bandwidth request too high (%d/%d Mb/s > %d/%d Mb/s)\n",
+			      requested_up_corrected, requested_down_corrected,
+			      max_up_rounded, max_down_rounded);
 		return -ENOBUFS;
 	}
 
@@ -1864,8 +1867,8 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 	if (ret)
 		goto reclaim;
 
-	tb_port_dbg(in, "bandwidth available for allocation %d/%d Mb/s\n",
-		    available_up, available_down);
+	tb_tunnel_dbg(tunnel, "bandwidth available for allocation %d/%d Mb/s\n",
+		      available_up, available_down);
 
 	if ((*requested_up >= 0 && available_up >= requested_up_corrected) ||
 	    (*requested_down >= 0 && available_down >= requested_down_corrected)) {
@@ -1947,12 +1950,15 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 	ret = tb_alloc_dp_bandwidth(tunnel, &requested_up, &requested_down);
 	if (ret) {
 		if (ret == -ENOBUFS)
-			tb_port_warn(in, "not enough bandwidth available\n");
+			tb_tunnel_warn(tunnel,
+				       "not enough bandwidth available\n");
 		else
-			tb_port_warn(in, "failed to change bandwidth allocation\n");
+			tb_tunnel_warn(tunnel,
+				       "failed to change bandwidth allocation\n");
 	} else {
-		tb_port_dbg(in, "bandwidth allocation changed to %d/%d Mb/s\n",
-			    requested_up, requested_down);
+		tb_tunnel_dbg(tunnel,
+			      "bandwidth allocation changed to %d/%d Mb/s\n",
+			      requested_up, requested_down);
 
 		/* Update other clients about the allocation change */
 		tb_recalc_estimated_bandwidth(tb);
-- 
2.40.1


