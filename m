Return-Path: <linux-usb+bounces-1587-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9207C8557
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 14:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A082282E3F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 12:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0AB15E95;
	Fri, 13 Oct 2023 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKvxRAKQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D834914A81
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 12:06:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C84DD
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 05:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697198808; x=1728734808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hmCCKNFkGjdI8aTGAHf7YxUFc9mi+ckVTptEz+oSVCM=;
  b=fKvxRAKQB5cdbuG4OiqgmKu83RJPqDb9hwWHy6AsYTIhDPW3AChw9mWm
   MiZZ4EQLP2OtOyy4oIeYLsw2IOFFSeB9r5xMw/ec66EGQvTdCVvGwzO4r
   22KvZNpKeliSQufSGskffWaQ7PbOZBz/L0Z0o6VUYsm2+i1DG5ogLWYCE
   5evCTmHMxWWN+gzWtlwKOdd+ovoDO9DduZgeS3tMBOkrqgn9CcFQFANIX
   HIE+5WmVBxkbdfikI/NQTGdvJ3IbcsTTiKZvdXtbTmRXT5XokSBq9Wypj
   Q6zAbBy63r2iV1XNd//Y5W1UtPMzOH+ZRb4byn9Z/2/IFN/e6pGXHN2La
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="389033484"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="389033484"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 05:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820602096"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="820602096"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 13 Oct 2023 05:06:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1867776E; Fri, 13 Oct 2023 15:06:41 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 06/10] thunderbolt: Introduce tb_port_path_direction_downstream()
Date: Fri, 13 Oct 2023 15:06:36 +0300
Message-Id: <20231013120640.709255-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
References: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@linux.intel.com>

Introduce tb_port_path_direction_downstream() to check if path from
source adapter to destination adapter is directed towards downstream.
Convert existing users to call this helper instead of open-coding.

No functional changes.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c     |  6 +++---
 drivers/thunderbolt/tb.h     | 15 +++++++++++++++
 drivers/thunderbolt/tunnel.c | 14 +++++++-------
 3 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 96eb7d9fdedf..e1e2792d14a7 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -553,7 +553,7 @@ static struct tb_tunnel *tb_find_first_usb3_tunnel(struct tb *tb,
 	struct tb_switch *sw;
 
 	/* Pick the router that is deepest in the topology */
-	if (dst_port->sw->config.depth > src_port->sw->config.depth)
+	if (tb_port_path_direction_downstream(src_port, dst_port))
 		sw = dst_port->sw;
 	else
 		sw = src_port->sw;
@@ -1224,7 +1224,7 @@ tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
 			      "re-calculated estimated bandwidth %u/%u Mb/s\n",
 			      estimated_up, estimated_down);
 
-		if (in->sw->config.depth < out->sw->config.depth)
+		if (tb_port_path_direction_downstream(in, out))
 			estimated_bw = estimated_down;
 		else
 			estimated_bw = estimated_up;
@@ -1958,7 +1958,7 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 
 	out = tunnel->dst_port;
 
-	if (in->sw->config.depth < out->sw->config.depth) {
+	if (tb_port_path_direction_downstream(in, out)) {
 		requested_up = -1;
 		requested_down = requested_bw;
 	} else {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 3c9ae5584569..6d49510eea09 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1041,6 +1041,21 @@ void tb_port_release_out_hopid(struct tb_port *port, int hopid);
 struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
 				     struct tb_port *prev);
 
+/**
+ * tb_port_path_direction_downstream() - Checks if path directed downstream
+ * @src: Source adapter
+ * @dst: Destination adapter
+ *
+ * Returns %true only if the specified path from source adapter (@src)
+ * to destination adapter (@dst) is directed downstream.
+ */
+static inline bool
+tb_port_path_direction_downstream(const struct tb_port *src,
+				  const struct tb_port *dst)
+{
+	return src->sw->config.depth < dst->sw->config.depth;
+}
+
 static inline bool tb_port_use_credit_allocation(const struct tb_port *port)
 {
 	return tb_port_is_null(port) && port->sw->credit_allocation;
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index db0546c62cb3..7534cd3a81f4 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -687,7 +687,7 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 		      "DP OUT maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
 		      out_rate, out_lanes, bw);
 
-	if (in->sw->config.depth < out->sw->config.depth)
+	if (tb_port_path_direction_downstream(in, out))
 		max_bw = tunnel->max_down;
 	else
 		max_bw = tunnel->max_up;
@@ -812,7 +812,7 @@ static int tb_dp_bandwidth_alloc_mode_enable(struct tb_tunnel *tunnel)
 	 * max_up/down fields. For discovery we just read what the
 	 * estimation was set to.
 	 */
-	if (in->sw->config.depth < out->sw->config.depth)
+	if (tb_port_path_direction_downstream(in, out))
 		estimated_bw = tunnel->max_down;
 	else
 		estimated_bw = tunnel->max_up;
@@ -982,7 +982,7 @@ static int tb_dp_bandwidth_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
 	if (allocated_bw == max_bw)
 		allocated_bw = ret;
 
-	if (in->sw->config.depth < out->sw->config.depth) {
+	if (tb_port_path_direction_downstream(in, out)) {
 		*consumed_up = 0;
 		*consumed_down = allocated_bw;
 	} else {
@@ -1017,7 +1017,7 @@ static int tb_dp_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up
 		if (allocated_bw == max_bw)
 			allocated_bw = ret;
 
-		if (in->sw->config.depth < out->sw->config.depth) {
+		if (tb_port_path_direction_downstream(in, out)) {
 			*allocated_up = 0;
 			*allocated_down = allocated_bw;
 		} else {
@@ -1045,7 +1045,7 @@ static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 	if (ret < 0)
 		return ret;
 
-	if (in->sw->config.depth < out->sw->config.depth) {
+	if (tb_port_path_direction_downstream(in, out)) {
 		tmp = min(*alloc_down, max_bw);
 		ret = usb4_dp_port_allocate_bandwidth(in, tmp);
 		if (ret)
@@ -1143,7 +1143,7 @@ static int tb_dp_maximum_bandwidth(struct tb_tunnel *tunnel, int *max_up,
 	if (ret < 0)
 		return ret;
 
-	if (in->sw->config.depth < tunnel->dst_port->sw->config.depth) {
+	if (tb_port_path_direction_downstream(in, tunnel->dst_port)) {
 		*max_up = 0;
 		*max_down = ret;
 	} else {
@@ -1201,7 +1201,7 @@ static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 		return 0;
 	}
 
-	if (in->sw->config.depth < tunnel->dst_port->sw->config.depth) {
+	if (tb_port_path_direction_downstream(in, tunnel->dst_port)) {
 		*consumed_up = 0;
 		*consumed_down = tb_dp_bandwidth(rate, lanes);
 	} else {
-- 
2.40.1


