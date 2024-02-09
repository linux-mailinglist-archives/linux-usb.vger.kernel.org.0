Return-Path: <linux-usb+bounces-6160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D715E84F6F3
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 471B31F24EBD
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7EE6EB66;
	Fri,  9 Feb 2024 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="na9pGCAL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C396A6A026
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488025; cv=none; b=d0C/7HpPZZTY/x2xbbtGVlzMArAyQ9W8iYDITOy2+5cwSfSCDFK9u+qg+DDhoGrRvCPTyWgiM+M3n9l107cml0MxO3tLqd4S6nWxoXZbkVAtHCkA7ot5jdyH4DVtzdDWc4AyrdcEz6b12vbgXYch21ycZ/YiSJhcb9zp6JTIO+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488025; c=relaxed/simple;
	bh=CFy7YB5reuaeNmGM2OwQgtwqrUFDCUP5goW2aOF/6Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYCYbkD1Br9utv/AfI79H0ZaHUSAosZHHJQNsmw3U/VHdzpb1DkzTwmw4nGDA/FcrhZ5Wpadb115iPxxXWgp/xP/VBI8g76Fs0RKnEtoeqNBiSCn5ROY3VHGgg611dijMmTdmAaz+uyuui/qjbNVz9TAHpAu9rSxGu+sO8UwzpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=na9pGCAL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488022; x=1739024022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CFy7YB5reuaeNmGM2OwQgtwqrUFDCUP5goW2aOF/6Z4=;
  b=na9pGCALWpVtPdjVx3NPxLbnPbRFeIJxxLTT4ex2gZEy9fRpZQTn7zmn
   LXpEOmqSpZStAS8G1kIutloJ029ZCQJKtgO/SUZCloMlvhIJp932FMVNw
   /rfS3cBINl8aSFjvwqqXAZ0rdqih9daP/phtYlELoNRlN2g/SFlM32myU
   S1+1FWQBJKz/zwG/feHtG+yE1BLfWyaonzyPga2fAJfCVvMW4I+fyEn8Q
   HQ1k5P0qUQZryZ+IaddYAtWyh+S0R2s9lJNtw7nEtSpWFyXM7XdC3cv7B
   CtdXL0aDwB4Xl9bLdn4zn/Vr6bjd9io3i/BTF/iOx2Pd6M1EZLj/aXG+u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12082121"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12082121"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934434418"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934434418"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:13:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id AF6D8F7; Fri,  9 Feb 2024 16:13:35 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 01/10] thunderbolt: Use DP_LOCAL_CAP for maximum bandwidth calculation
Date: Fri,  9 Feb 2024 16:13:26 +0200
Message-ID: <20240209141335.2286786-2-mika.westerberg@linux.intel.com>
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

The DisplayPort IN adapter DP_LOCAL_CAP holds the aggregated
capabilities and gets updated after graphics side does the DPRX
capabilities read so we should use this to figure out the maximum
possible bandwidth for the DisplayPort tunnel.

While there make the variable name to match better what it is used for
and add kernel-doc comment to the function.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 57 ++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 6fffb2c82d3d..a766ab297064 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -926,12 +926,18 @@ static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
 	return 0;
 }
 
-/* max_bw is rounded up to next granularity */
+/**
+ * tb_dp_bandwidth_mode_maximum_bandwidth() - Maximum possible bandwidth
+ * @tunnel: DP tunnel to check
+ * @max_bw_rounded: Maximum bandwidth in Mb/s rounded up to the next granularity
+ *
+ * Returns maximum possible bandwidth for this tunnel in Mb/s.
+ */
 static int tb_dp_bandwidth_mode_maximum_bandwidth(struct tb_tunnel *tunnel,
-						  int *max_bw)
+						  int *max_bw_rounded)
 {
 	struct tb_port *in = tunnel->src_port;
-	int ret, rate, lanes, nrd_bw;
+	int ret, rate, lanes, max_bw;
 	u32 cap;
 
 	/*
@@ -947,32 +953,18 @@ static int tb_dp_bandwidth_mode_maximum_bandwidth(struct tb_tunnel *tunnel,
 		return ret;
 
 	rate = tb_dp_cap_get_rate_ext(cap);
-	if (tb_dp_is_uhbr_rate(rate)) {
-		/*
-		 * When UHBR is used there is no reduction in lanes so
-		 * we can use this directly.
-		 */
-		lanes = tb_dp_cap_get_lanes(cap);
-	} else {
-		/*
-		 * If there is no UHBR supported then check the
-		 * non-reduced rate and lanes.
-		 */
-		ret = usb4_dp_port_nrd(in, &rate, &lanes);
-		if (ret)
-			return ret;
-	}
+	lanes = tb_dp_cap_get_lanes(cap);
 
-	nrd_bw = tb_dp_bandwidth(rate, lanes);
+	max_bw = tb_dp_bandwidth(rate, lanes);
 
-	if (max_bw) {
+	if (max_bw_rounded) {
 		ret = usb4_dp_port_granularity(in);
 		if (ret < 0)
 			return ret;
-		*max_bw = roundup(nrd_bw, ret);
+		*max_bw_rounded = roundup(max_bw, ret);
 	}
 
-	return nrd_bw;
+	return max_bw;
 }
 
 static int tb_dp_bandwidth_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
@@ -981,7 +973,7 @@ static int tb_dp_bandwidth_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
 {
 	struct tb_port *out = tunnel->dst_port;
 	struct tb_port *in = tunnel->src_port;
-	int ret, allocated_bw, max_bw;
+	int ret, allocated_bw, max_bw_rounded;
 
 	if (!usb4_dp_port_bandwidth_mode_enabled(in))
 		return -EOPNOTSUPP;
@@ -995,10 +987,10 @@ static int tb_dp_bandwidth_mode_consumed_bandwidth(struct tb_tunnel *tunnel,
 		return ret;
 	allocated_bw = ret;
 
-	ret = tb_dp_bandwidth_mode_maximum_bandwidth(tunnel, &max_bw);
+	ret = tb_dp_bandwidth_mode_maximum_bandwidth(tunnel, &max_bw_rounded);
 	if (ret < 0)
 		return ret;
-	if (allocated_bw == max_bw)
+	if (allocated_bw == max_bw_rounded)
 		allocated_bw = ret;
 
 	if (tb_port_path_direction_downstream(in, out)) {
@@ -1023,17 +1015,18 @@ static int tb_dp_allocated_bandwidth(struct tb_tunnel *tunnel, int *allocated_up
 	 * Otherwise we read it from the DPRX.
 	 */
 	if (usb4_dp_port_bandwidth_mode_enabled(in) && tunnel->bw_mode) {
-		int ret, allocated_bw, max_bw;
+		int ret, allocated_bw, max_bw_rounded;
 
 		ret = usb4_dp_port_allocated_bandwidth(in);
 		if (ret < 0)
 			return ret;
 		allocated_bw = ret;
 
-		ret = tb_dp_bandwidth_mode_maximum_bandwidth(tunnel, &max_bw);
+		ret = tb_dp_bandwidth_mode_maximum_bandwidth(tunnel,
+							     &max_bw_rounded);
 		if (ret < 0)
 			return ret;
-		if (allocated_bw == max_bw)
+		if (allocated_bw == max_bw_rounded)
 			allocated_bw = ret;
 
 		if (tb_port_path_direction_downstream(in, out)) {
@@ -1055,24 +1048,24 @@ static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 {
 	struct tb_port *out = tunnel->dst_port;
 	struct tb_port *in = tunnel->src_port;
-	int max_bw, ret, tmp;
+	int max_bw_rounded, ret, tmp;
 
 	if (!usb4_dp_port_bandwidth_mode_enabled(in))
 		return -EOPNOTSUPP;
 
-	ret = tb_dp_bandwidth_mode_maximum_bandwidth(tunnel, &max_bw);
+	ret = tb_dp_bandwidth_mode_maximum_bandwidth(tunnel, &max_bw_rounded);
 	if (ret < 0)
 		return ret;
 
 	if (tb_port_path_direction_downstream(in, out)) {
-		tmp = min(*alloc_down, max_bw);
+		tmp = min(*alloc_down, max_bw_rounded);
 		ret = usb4_dp_port_allocate_bandwidth(in, tmp);
 		if (ret)
 			return ret;
 		*alloc_down = tmp;
 		*alloc_up = 0;
 	} else {
-		tmp = min(*alloc_up, max_bw);
+		tmp = min(*alloc_up, max_bw_rounded);
 		ret = usb4_dp_port_allocate_bandwidth(in, tmp);
 		if (ret)
 			return ret;
-- 
2.43.0


