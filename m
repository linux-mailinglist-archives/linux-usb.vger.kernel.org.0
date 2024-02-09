Return-Path: <linux-usb+bounces-6163-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C7184F6F6
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DCD71F25818
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915B6745DD;
	Fri,  9 Feb 2024 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILWUk9QZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579156EB4A
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488027; cv=none; b=Pm4/PaZ0QUkgDdbDT16XJqVe5EWaYqUl4IS70FkSuSRmoYdsjAEj1hu7tz5LpyDAK+pLJfHunUAGUZaD7dQS4S5zQimCibmtycpwKGoNeQ8h57otcfLunAHTGpilQMDebgPUp0dAcI1NReVe2cgMoLL/PM57N3slQL/M8CrmFgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488027; c=relaxed/simple;
	bh=TecJGJwUkcKh9NNygULsxNjAJYDtDB6GX73SZGMJyPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pE53Z6IBLWPTsDLLeP/7xRjZ9TGqXP5rhXhKGJdxidCB9Qlt4jO7TAnbIt7uqy4CWmamtc/L1Qa7AILDGaBjIfHtY/aJteEWOoRwf5UjH6Mgd0lj8pQAD19fZwp9I6x12/WT2GgdYeHNno0bQJpzOSX0MSMDsfP1RCjztjl/kM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILWUk9QZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488025; x=1739024025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TecJGJwUkcKh9NNygULsxNjAJYDtDB6GX73SZGMJyPg=;
  b=ILWUk9QZ9rffApWRjWwFM99kwwDE//XSkF97rxGTs/AM5Uf9nfJQm+dy
   0pO3SJPhRjTwLY+xGTpfv4VZQXkuBO2R/qvM0w/FsfDUtv1HAYLmT2L9J
   DMfqszyY7LDVRIC/XKvUX4+UgILb4tnSFokrtCInyyJN/wDv620aRj2pv
   xfMzwbKBXUt4WLRCB1WhUQoBGUTXtuH2k19njeCShdgr/F5X0/D+JbH9A
   oNoybQxsha8KRBqJuh7zJnQDlUWmmaAF4kiMzXTjZguKC+UNH83kqertR
   OUCJzI8CXVKpKwdcY8k0xznQi7fVaSYgYViHXGq4yHoesm7dYi4BOtDP9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12082139"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12082139"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934434452"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934434452"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:13:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E55564C4; Fri,  9 Feb 2024 16:13:35 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/10] thunderbolt: Introduce tb_tunnel_direction_downstream()
Date: Fri,  9 Feb 2024 16:13:32 +0200
Message-ID: <20240209141335.2286786-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
References: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helper takes tunnel as parameter. Convert existing code to call
this where possible.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c     |  9 +++------
 drivers/thunderbolt/tunnel.c | 23 +++++++++--------------
 drivers/thunderbolt/tunnel.h |  6 ++++++
 3 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index d23a80339a8d..e664045ad41c 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1387,7 +1387,7 @@ tb_recalc_estimated_bandwidth_for_group(struct tb_bandwidth_group *group)
 		 *  - available bandwidth along the path
 		 *  - bandwidth allocated for USB 3.x but not used.
 		 */
-		if (tb_port_path_direction_downstream(in, out))
+		if (tb_tunnel_direction_downstream(tunnel))
 			estimated_bw = estimated_down;
 		else
 			estimated_bw = estimated_up;
@@ -2388,11 +2388,11 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 {
 	struct tb_hotplug_event *ev = container_of(work, typeof(*ev), work);
 	int requested_bw, requested_up, requested_down, ret;
-	struct tb_port *in, *out;
 	struct tb_tunnel *tunnel;
 	struct tb *tb = ev->tb;
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_switch *sw;
+	struct tb_port *in;
 
 	pm_runtime_get_sync(&tb->dev);
 
@@ -2456,10 +2456,7 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 
 	tb_port_dbg(in, "requested bandwidth %d Mb/s\n", requested_bw);
 
-
-	out = tunnel->dst_port;
-
-	if (tb_port_path_direction_downstream(in, out)) {
+	if (tb_tunnel_direction_downstream(tunnel)) {
 		requested_up = -1;
 		requested_down = requested_bw;
 	} else {
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index a766ab297064..e02b34654d29 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -706,7 +706,7 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 		      "DP OUT maximum supported bandwidth %u Mb/s x%u = %u Mb/s\n",
 		      out_rate, out_lanes, bw);
 
-	if (tb_port_path_direction_downstream(in, out))
+	if (tb_tunnel_direction_downstream(tunnel))
 		max_bw = tunnel->max_down;
 	else
 		max_bw = tunnel->max_up;
@@ -831,7 +831,7 @@ static int tb_dp_bandwidth_alloc_mode_enable(struct tb_tunnel *tunnel)
 	 * max_up/down fields. For discovery we just read what the
 	 * estimation was set to.
 	 */
-	if (tb_port_path_direction_downstream(in, out))
+	if (tb_tunnel_direction_downstream(tunnel))
 		estimated_bw = tunnel->max_down;
 	else
 		estimated_bw = tunnel->max_up;
@@ -971,7 +971,6 @@ static int tb_dp_bandwidth_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
 						   int *consumed_up,
 						   int *consumed_down)
 {
-	struct tb_port *out = tunnel->dst_port;
 	struct tb_port *in = tunnel->src_port;
 	int ret, allocated_bw, max_bw_rounded;
 
@@ -993,7 +992,7 @@ static int tb_dp_bandwidth_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
 	if (allocated_bw == max_bw_rounded)
 		allocated_bw = ret;
 
-	if (tb_port_path_direction_downstream(in, out)) {
+	if (tb_tunnel_direction_downstream(tunnel)) {
 		*consumed_up = 0;
 		*consumed_down = allocated_bw;
 	} else {
@@ -1007,7 +1006,6 @@ static int tb_dp_bandwidth_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
 static int tb_dp_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up,
 				     int *allocated_down)
 {
-	struct tb_port *out = tunnel->dst_port;
 	struct tb_port *in = tunnel->src_port;
 
 	/*
@@ -1029,7 +1027,7 @@ static int tb_dp_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up
 		if (allocated_bw == max_bw_rounded)
 			allocated_bw = ret;
 
-		if (tb_port_path_direction_downstream(in, out)) {
+		if (tb_tunnel_direction_downstream(tunnel)) {
 			*allocated_up = 0;
 			*allocated_down = allocated_bw;
 		} else {
@@ -1046,7 +1044,6 @@ static int tb_dp_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up
 static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 				 int *alloc_down)
 {
-	struct tb_port *out = tunnel->dst_port;
 	struct tb_port *in = tunnel->src_port;
 	int max_bw_rounded, ret, tmp;
 
@@ -1057,7 +1054,7 @@ static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 	if (ret < 0)
 		return ret;
 
-	if (tb_port_path_direction_downstream(in, out)) {
+	if (tb_tunnel_direction_downstream(tunnel)) {
 		tmp = min(*alloc_down, max_bw_rounded);
 		ret = usb4_dp_port_allocate_bandwidth(in, tmp);
 		if (ret)
@@ -1143,17 +1140,16 @@ static int tb_dp_read_cap(struct tb_tunnel *tunnel, unsigned int cap, u32 *rate,
 static int tb_dp_maximum_bandwidth(struct tb_tunnel *tunnel, int *max_up,
 				   int *max_down)
 {
-	struct tb_port *in = tunnel->src_port;
 	int ret;
 
-	if (!usb4_dp_port_bandwidth_mode_enabled(in))
+	if (!usb4_dp_port_bandwidth_mode_enabled(tunnel->src_port))
 		return -EOPNOTSUPP;
 
 	ret = tb_dp_bandwidth_mode_maximum_bandwidth(tunnel, NULL);
 	if (ret < 0)
 		return ret;
 
-	if (tb_port_path_direction_downstream(in, tunnel->dst_port)) {
+	if (tb_tunnel_direction_downstream(tunnel)) {
 		*max_up = 0;
 		*max_down = ret;
 	} else {
@@ -1167,8 +1163,7 @@ static int tb_dp_maximum_bandwidth(struct tb_tunnel *tunnel, int *max_up,
 static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 				    int *consumed_down)
 {
-	struct tb_port *in = tunnel->src_port;
-	const struct tb_switch *sw = in->sw;
+	const struct tb_switch *sw = tunnel->src_port->sw;
 	u32 rate = 0, lanes = 0;
 	int ret;
 
@@ -1214,7 +1209,7 @@ static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 		return 0;
 	}
 
-	if (tb_port_path_direction_downstream(in, tunnel->dst_port)) {
+	if (tb_tunnel_direction_downstream(tunnel)) {
 		*consumed_up = 0;
 		*consumed_down = tb_dp_bandwidth(rate, lanes);
 	} else {
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index b4cff5482112..1a27ccd08b86 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -139,6 +139,12 @@ static inline bool tb_tunnel_is_usb3(const struct tb_tunnel *tunnel)
 	return tunnel->type == TB_TUNNEL_USB3;
 }
 
+static inline bool tb_tunnel_direction_downstream(const struct tb_tunnel *tunnel)
+{
+	return tb_port_path_direction_downstream(tunnel->src_port,
+						 tunnel->dst_port);
+}
+
 const char *tb_tunnel_type_name(const struct tb_tunnel *tunnel);
 
 #define __TB_TUNNEL_PRINT(level, tunnel, fmt, arg...)                   \
-- 
2.43.0


